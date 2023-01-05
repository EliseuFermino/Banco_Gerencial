Imports DevExpress.Web.ASPxGauges.Base
Imports System.Data
Imports System.Data.SqlClient
Imports DevExpress.XtraCharts
Imports System.Drawing
Imports System.Net

Imports DevExpress.Web.ASPxGauges
Imports DevExpress.Web.ASPxGauges.Gauges.Circular
Imports DevExpress.Web

Imports System


Partial Class MemberPages_menuPrincipal_Perdas
    Inherits System.Web.UI.Page

    Dim nota As String
    Dim descFilial As String
    Dim Periodo As String
    Dim varDesc As String

    Dim oPro As New Projeto
    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        On Error Resume Next
        If Not IsPostBack Then
            oVen.AtualizarEstatisticaPrograma(402, User.Identity.Name)
            mySession()

            lblError.Text = oPro.BuscarDepartamentoDoUsuario(User.Identity.Name)
            Session("sDIA") = DateAndTime.Today

        End If

    End Sub

    Private Function GetGaugeScale(ByVal gaugeControl As ASPxGaugeControl, ByVal gaugeIndex As Integer, ByVal scaleIndex As Integer) As ArcScaleComponent
        Return (CType(gaugeControl.Gauges(gaugeIndex), ICircularGauge)).Scales(scaleIndex)
    End Function

    Private Sub Buscar_Total_PiorLoja_Mes(ByVal iNomeStoredProcedure As String, ByVal iAno As Int16, ByVal iMes As Byte, ByVal iOrdem As Byte, ByVal iFilial As Byte)

        Dim con As New SqlConnection(Conexao.gerCheckList)
        Dim comando As New SqlCommand(iNomeStoredProcedure, con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = iAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@numOrdem", SqlDbType.TinyInt))
        comando.Parameters("@numOrdem").Value = iOrdem

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = iFilial

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                nota = CDbl(reader5.GetSqlMoney(0)).ToString("n2")
                descFilial = reader5.GetSqlString(1)
                Periodo = reader5.GetSqlString(2)

            End While

        Catch ex As Exception
            varDesc = "Private Sub - Buscar_Total_PiorLoja_Mes " & ex.Message

        Finally
            con.Close()
        End Try
    End Sub

    Private Sub mySession()

        Session("sFILIAL") = 99
        Session("sOPCAO") = 1
        Session("sMERCADOLOGICO") = 1
        Session("sDEPARTAMENTO") = Trim(oPro.BuscarDepartamentoDoUsuario(User.Identity.Name))

        Session("sANO") = Year(DateAndTime.Today.AddDays(-1))
        Session("sMES") = Month(DateAndTime.Today.AddDays(-1))

    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        On Error Resume Next
        If Not IsPostBack Then

            Legendas()

            'Session("sFILIAL") = CByte(Right(User.Identity.Name, 2))
            'lblOBS.Text = "REGIONAL " & Session("sREGIONAL") & " USUARIO: " & Session("sUSUARIO") & " DEPARTAMENTO: " & Session("sDEPARTAMENTO")
            'Graph.DataBind()
            'Chart_TicketMedio.DataBind()
            'cboFilial_ListFilialChanged(sender, e)

        End If
    End Sub


    

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        On Error Resume Next
        mySession()


        'grid_Meta_Realizado_Ag23.DataBind()
     
        'gridAgendaItem.DataBind()
        ''grid_Loja_Nao_Fizeram_Checklist.DataBind()


        Legendas()

        ' lblOBS.Text = "REGIONAL " & Session("sREGIONAL") & " USUARIO: " & Session("sUSUARIO") & " DEPARTAMENTO: " & Session("sDEPARTAMENTO") & " - Session: " & Session("sFILIAL")



        'WebChartControl1.DataBind()
        'graph_Depto1.DataBind()
        'graph_Depto2.DataBind()
        'graph_Depto3.DataBind()
        'graph_Depto4.DataBind()
        'graph_Depto5.DataBind()

        'Graph.DataBind()

        'Chart_TicketMedio.DataBind()


        lblOBS.Text = Session("sRADIOTV")

    End Sub

    
    Private Sub Legendas()

        Dim diaHoje, diaPrimeiro, diaOntem, diaPrimeiroMA, diaFinalMA As Date
        Dim sPrimeiro, sPrimeiroAA, sFinalAA, sHoje, sOntem As String

        diaHoje = DateAndTime.Now.Date
        diaOntem = DateAndTime.Now.Date.AddDays(-1)
        diaPrimeiro = myDateTimes.GetFirstDayOfMonth(diaHoje)

        sHoje = Left(CStr(diaHoje), 5)
        sOntem = Left(CStr(diaOntem), 5)
        sPrimeiro = Left(CStr(diaPrimeiro), 5)

        If diaHoje = diaPrimeiro Then

            diaPrimeiroMA = myDateTimes.GetFirstDayOfMonth_MesAnterior(diaPrimeiro)
            diaFinalMA = myDateTimes.GetLastDayOfMonth(diaPrimeiroMA)
            sPrimeiroAA = Left(CStr(diaPrimeiroMA), 5)
            sFinalAA = Left(CStr(diaFinalMA), 5)
     
            lblTitle_Gestor.Text = " " & sPrimeiroAA & " à " & sFinalAA

        Else
           
            lblTitle_Gestor.Text = " Janeiro de 2021" ' " " & sPrimeiro & " à " & sOntem

        End If


    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "    Painel de Controle - Comercial"
        End If
    End Sub

    Protected Sub gridFornecedor_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridFornecedor.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "QtdeTotalPerda")
        oFun.Grid_RedIsNegative(e, "vlrTotalPerda")
        oFun.Grid_RedIsNegative(e, "percTotalPerda")
        oFun.Grid_RedIsNegative(e, "percLucroLiquido")

        oFun.Grid_RedIsNegative(e, "vlrDif")
        oFun.Grid_RedIsNegative(e, "percDif")
    End Sub


    Protected Sub grid_Loja_Nao_Fizeram_Checklist_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gridFornecedor.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub grid_Comprador_Detail_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs)
        oFun.Grid_Calculate(e, "dif_MxR", "percMargFinal", "percMetaMargFinal", Funcoes.CalculateType.Decrease)
        oFun.Grid_Calculate(e, "dif_MxR_Vlr", "vlrVenda", "vlrMeta_Venda", Funcoes.CalculateType.Decrease)
    End Sub

    Protected Sub grid_Comprador_Detail_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs)
        oFun.Grid_RedIsNegative(e, "percMeta")
        oFun.Grid_RedIsNegative(e, "dif_MxR")
    End Sub

   
End Class
