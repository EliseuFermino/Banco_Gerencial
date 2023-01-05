Imports DevExpress.Web.ASPxGauges.Base
Imports System.Data
Imports System.Data.SqlClient
Imports DevExpress.XtraCharts
Imports System.Drawing
Imports System.Net

Imports DevExpress.Web.ASPxGauges
Imports DevExpress.Web.ASPxGauges.Gauges.Circular
Imports DevExpress.Web


Partial Class MemberPages_menuPrincipal_Express
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
            oVen.AtualizarEstatisticaPrograma(413, User.Identity.Name)
            Session("sFILIAL") = 59 'oPro.Buscar_Filial_Usuario(Page.User.Identity.Name)
            mySession()
            gridProjecao.DataBind()
            chartPercentual.DataBind()

            KPI_Indicators()
            Legendas()
        End If
        'If cboFilial.IsLoja = True Then btnAtualizar.Visible = False


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

        Session("sFILIAL") = 59 ' oPro.Buscar_Filial_Usuario(Page.User.Identity.Name)
        Session("sOPCAO") = 1
        Session("sMERCADOLOGICO") = 1
        Session("sDIA") = CDate(DateAndTime.Today)
        Session("sANO") = Year(DateAndTime.Today.AddDays(-1))
        Session("sMES") = Month(DateAndTime.Today.AddDays(-1))
        Session("sDEPARTAMENTO") = Trim(oPro.BuscarDepartamentoDoUsuario(User.Identity.Name))
        If rndTodos.Checked = True Then
            Session("sRADIOTV") = 0
        End If

        If rndRadio.Checked = True Then
            Session("sRADIOTV") = 1
        End If

        lblError.Text = DateAndTime.Today.Day

    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        On Error Resume Next
        If Not IsPostBack Then

            Legendas()

        End If
    End Sub


    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        mySession()

        gridProjecao.DataBind()
        chartPercentual.DataBind()

        gridAgendaItem.DataBind()

        chartPercentual.DataBind()


        Legendas()

        KPI_Indicators()

        ' lblOBS.Text = "REGIONAL " & Session("sREGIONAL") & " USUARIO: " & Session("sUSUARIO") & " DEPARTAMENTO: " & Session("sDEPARTAMENTO") & " - Session: " & Session("sFILIAL")


    End Sub

    Private Sub KPI_Indicators()

        ' MARGEM FINAL
        GetGaugeScale(gauge_Margem_PDV, 0, 0).Ranges(0).StartValue = CSng(10)
        GetGaugeScale(gauge_Margem_PDV, 0, 0).Ranges(0).EndValue = CSng(15.989999999999998)
        GetGaugeScale(gauge_Margem_PDV, 0, 0).Ranges(1).StartValue = CSng(16)
        GetGaugeScale(gauge_Margem_PDV, 0, 0).Ranges(1).EndValue = clDataDb.ExecuteStoredProcedure_Scalar("dbo.usp_Buscar_Margem_Final_Meta_Hoje", Conexao.gerKnowledge_str)
        GetGaugeScale(gauge_Margem_PDV, 0, 0).Ranges(2).StartValue = clDataDb.ExecuteStoredProcedure_Scalar("dbo.usp_Buscar_Margem_Final_Meta_Hoje", Conexao.gerKnowledge_str)
        GetGaugeScale(gauge_Margem_PDV, 0, 0).Ranges(2).EndValue = CSng(22.0)
        GetGaugeScale(gauge_Margem_PDV, 0, 0).MinValue = CSng(10)
        GetGaugeScale(gauge_Margem_PDV, 0, 0).MaxValue = CSng(22.0)
        GetGaugeScale(gauge_Margem_PDV, 0, 0).Value = clDataDb.ExecuteStoredProcedure_Scalar("dbo.usp_Buscar_Margem_Final_Real_Hoje", Conexao.gerKnowledge_str)

        'lblError.Text = clDataDb.ExecuteStoredProcedure_Scalar("dbo.usp_Buscar_Margem_Final_Meta_Hoje", Conexao.gerKnowledge_str) & " <br> " & clDataDb.ExecuteStoredProcedure_Scalar("dbo.usp_Buscar_Margem_Final_Meta_Mes", Conexao.gerKnowledge_str)

        ' MARGEM FINAL ACUMULADO
        GetGaugeScale(gauge_Margem_Final, 0, 0).Ranges(0).StartValue = CSng(10)
        GetGaugeScale(gauge_Margem_Final, 0, 0).Ranges(0).EndValue = CSng(15.989999999999998)
        GetGaugeScale(gauge_Margem_Final, 0, 0).Ranges(1).StartValue = CSng(16)
        GetGaugeScale(gauge_Margem_Final, 0, 0).Ranges(1).EndValue = clDataDb.ExecuteStoredProcedure_Scalar("dbo.usp_Buscar_Margem_Final_Meta_Mes", Conexao.gerKnowledge_str)
        GetGaugeScale(gauge_Margem_Final, 0, 0).Ranges(2).StartValue = clDataDb.ExecuteStoredProcedure_Scalar("dbo.usp_Buscar_Margem_Final_Meta_Mes", Conexao.gerKnowledge_str)
        GetGaugeScale(gauge_Margem_Final, 0, 0).Ranges(2).EndValue = CSng(22.0)
        GetGaugeScale(gauge_Margem_Final, 0, 0).MinValue = CSng(10)
        GetGaugeScale(gauge_Margem_Final, 0, 0).MaxValue = CSng(22.0)
        GetGaugeScale(gauge_Margem_Final, 0, 0).Value = clDataDb.ExecuteStoredProcedure_Scalar("dbo.usp_Buscar_Margem_Final_Real_Mes", Conexao.gerKnowledge_str)



    End Sub

    Private Sub Legendas()

        Dim diaHoje, diaPrimeiro, diaOntem, diaPrimeiroMA, diaFinalMA As Date
        Dim sPrimeiro, sPrimeiroAA, sFinalAA, sHoje, sOntem, vNomeMesAtual, vNomeMesAnterior, vNomeMesAnterior2 As String
        Dim vAnoAtual, vAnoAnterior As Int16




        diaHoje = DateAndTime.Now.Date
        diaOntem = DateAndTime.Now.Date.AddDays(-1)
        diaPrimeiro = myDateTimes.GetFirstDayOfMonth(diaHoje)


        sHoje = Left(CStr(diaHoje), 5)
        sOntem = Left(CStr(diaOntem), 5)
        sPrimeiro = Left(CStr(diaPrimeiro), 5)

        vNomeMesAtual = MonthName(Month(diaHoje))
        vNomeMesAnterior = MonthName(Month(DateAdd(DateInterval.Month, -1, diaHoje)))
        vNomeMesAnterior2 = MonthName(Month(DateAdd(DateInterval.Month, -2, diaHoje)))

        vAnoAtual = Year(diaHoje)
        vAnoAnterior = Year(DateAdd(DateInterval.Year, -1, diaHoje))

        If diaHoje = diaPrimeiro Then

            diaPrimeiroMA = myDateTimes.GetFirstDayOfMonth_MesAnterior(diaPrimeiro)
            diaFinalMA = myDateTimes.GetLastDayOfMonth(diaPrimeiroMA)
            sPrimeiroAA = Left(CStr(diaPrimeiroMA), 5)
            sFinalAA = Left(CStr(diaFinalMA), 5)

            lbl_1_2.Text = sPrimeiro & " à " & sPrimeiro

            lbl_3_2.Text = sPrimeiro & " à " & sPrimeiro
            lbl_graph_horizontal.Text = sPrimeiroAA & " à " & sFinalAA & " - " & vAnoAtual & " x " & vAnoAnterior & " - Mesmos Dias"

        Else

            lbl_1_2.Text = sPrimeiro & " à " & sOntem
            lbl_3_2.Text = sPrimeiro & " à " & sOntem
            lbl_graph_horizontal.Text = sPrimeiro & " à " & sOntem & " - " & vAnoAtual & " x " & vAnoAnterior & " - Mesmmos Dias"

        End If

    End Sub

    'Protected Sub Chart_TicketMedio_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles Chart_TicketMedio.CustomDrawSeriesPoint
    '    If e.SeriesPoint(0) < 0 Then
    '        e.SeriesDrawOptions.Color = Drawing.Color.Red
    '    End If
    'End Sub


    Protected Sub gridProjecao_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridProjecao.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percMeta")
        oFun.Grid_RedIsNegative(e, "percCresc")
    End Sub



    Protected Sub pb_DataBound(ByVal sender As Object, ByVal e As EventArgs)
        Dim progressBar As ASPxProgressBar = CType(sender, ASPxProgressBar)

        If progressBar.Position > 100 Then
            progressBar.Position = 100
        End If

        If progressBar.Position >= 100.0 Then
            progressBar.IndicatorStyle.BackColor = Drawing.Color.Green
        Else
            progressBar.IndicatorStyle.BackColor = Drawing.Color.LightCoral
        End If
    End Sub


    Protected Sub grid_Loja_Nao_Fizeram_Checklist_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs)
        oFun.Grid_RedIsNegative(e, "percMeta")
        oFun.Grid_RedIsNegative(e, "dif_MxR")

    End Sub


    Protected Sub gridProjecao_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles gridProjecao.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "diferenca", "vlrProjecao", "vlrMeta", Funcoes.CalculateType.Decrease)
    End Sub


    Protected Sub grid_Loja_Nao_Fizeram_Checklist_CustomUnboundColumnData1(sender As Object, e As ASPxGridViewColumnDataEventArgs)
        oFun.Grid_Calculate(e, "dif_MxR_Vlr", "vlrVenda", "vlrMeta_Venda", Funcoes.CalculateType.Decrease)
    End Sub


    Protected Sub grid_Loja_Nao_Fizeram_Checklist_HtmlDataCellPrepared1(sender As Object, e As ASPxGridViewTableDataCellEventArgs)
        oFun.Grid_RedIsNegative(e, "percMeta")
    End Sub

    Protected Sub grid_Loja_Nao_Fizeram_Checklist_HtmlDataCellPrepared2(sender As Object, e As ASPxGridViewTableDataCellEventArgs)
        oFun.Grid_RedIsNegative(e, "percMeta")
    End Sub

    Protected Sub cbPanelAcima_Callback(sender As Object, e As CallbackEventArgsBase) Handles cbPanelAcima.Callback
        mySession()
        gridAcima.DataBind()
    End Sub

    Protected Sub gridAcima_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridAcima.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percMargemPDV")
        oFun.Grid_RedIsNegative(e, "percMargemSellOut")
    End Sub

End Class
