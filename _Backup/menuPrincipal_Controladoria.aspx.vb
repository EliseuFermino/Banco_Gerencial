Imports DevExpress.Web.ASPxGauges.Base
Imports System.Data
Imports System.Data.SqlClient
Imports DevExpress.XtraCharts
Imports System.Drawing
Imports System.Net

Imports DevExpress.Web.ASPxGauges
Imports DevExpress.Web.ASPxGauges.Gauges.Circular


Partial Class MemberPages_menuPrincipal_Controladoria
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
            gridProjecao.DataBind()


            KPI_Indicators()

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

        Session("sFILIAL") = 99
        Session("sOPCAO") = 1
        Session("sMERCADOLOGICO") = 1
        Session("sDIA") = CDate(DateAndTime.Today)
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


    'Protected Sub Graph_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles Graph.CustomDrawSeriesPoint
    '    If e.SeriesPoint(0) < 0 Then
    '        e.SeriesDrawOptions.Color = Drawing.Color.Red
    '    End If

    'End Sub

    'Protected Sub graph_Depto1_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles graph_Depto1.CustomDrawSeriesPoint
    '    If e.SeriesPoint(0) < 0 Then
    '        e.SeriesDrawOptions.Color = Drawing.Color.Red
    '    End If
    'End Sub

    'Protected Sub graph_Depto2_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles graph_Depto2.CustomDrawSeriesPoint
    '    If e.SeriesPoint(0) < 0 Then
    '        e.SeriesDrawOptions.Color = Drawing.Color.Red
    '    End If
    'End Sub

    'Protected Sub graph_Depto3_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles graph_Depto3.CustomDrawSeriesPoint
    '    If e.SeriesPoint(0) < 0 Then
    '        e.SeriesDrawOptions.Color = Drawing.Color.Red
    '    End If
    'End Sub

    'Protected Sub graph_Depto4_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles graph_Depto4.CustomDrawSeriesPoint
    '    If e.SeriesPoint(0) < 0 Then
    '        e.SeriesDrawOptions.Color = Drawing.Color.Red
    '    End If
    'End Sub

    'Protected Sub graph_Depto5_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles graph_Depto5.CustomDrawSeriesPoint
    '    If e.SeriesPoint(0) < 0 Then
    '        e.SeriesDrawOptions.Color = Drawing.Color.Red
    '    End If
    'End Sub

    'Protected Sub WebChartControl1_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles WebChartControl1.CustomDrawSeriesPoint
    '    If e.SeriesPoint(0) < 0 Then
    '        e.SeriesDrawOptions.Color = Drawing.Color.Red
    '    End If
    'End Sub


    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        On Error Resume Next
        mySession()

        gridProjecao.DataBind()
        chartPercentual.DataBind()

        grid_Top5_LucroPDV.DataBind()

        grid_Meta_Realizado_Ag23.DataBind()

        gridItem.DataBind()
        gridAgendaItem.DataBind()
        grid_Loja_Nao_Fizeram_Checklist.DataBind()


        Legendas()

        KPI_Indicators()

        ' lblOBS.Text = "REGIONAL " & Session("sREGIONAL") & " USUARIO: " & Session("sUSUARIO") & " DEPARTAMENTO: " & Session("sDEPARTAMENTO") & " - Session: " & Session("sFILIAL")



        'WebChartControl1.DataBind()
        'graph_Depto1.DataBind()
        'graph_Depto2.DataBind()
        'graph_Depto3.DataBind()
        'graph_Depto4.DataBind()
        'graph_Depto5.DataBind()

        'Graph.DataBind()

        'Chart_TicketMedio.DataBind()



    End Sub

    Private Sub KPI_Indicators()

        ' MARGEM FINAL
        GetGaugeScale(gauge_Margem_PDV, 0, 0).Ranges(0).StartValue = CSng(7)
        GetGaugeScale(gauge_Margem_PDV, 0, 0).Ranges(0).EndValue = CSng(13.99)
        GetGaugeScale(gauge_Margem_PDV, 0, 0).Ranges(1).StartValue = CSng(14)
        GetGaugeScale(gauge_Margem_PDV, 0, 0).Ranges(1).EndValue = clDataDb.ExecuteStoredProcedure_Scalar("dbo.usp_Buscar_Margem_Final_Meta_Hoje", Conexao.gerKnowledge_str)
        GetGaugeScale(gauge_Margem_PDV, 0, 0).Ranges(2).StartValue = clDataDb.ExecuteStoredProcedure_Scalar("dbo.usp_Buscar_Margem_Final_Meta_Hoje", Conexao.gerKnowledge_str)
        GetGaugeScale(gauge_Margem_PDV, 0, 0).Ranges(2).EndValue = CSng(22.0)
        GetGaugeScale(gauge_Margem_PDV, 0, 0).MinValue = CSng(7)
        GetGaugeScale(gauge_Margem_PDV, 0, 0).MaxValue = CSng(22.0)
        GetGaugeScale(gauge_Margem_PDV, 0, 0).Value = clDataDb.ExecuteStoredProcedure_Scalar("dbo.usp_Buscar_Margem_Final_Real_Hoje", Conexao.gerKnowledge_str)

        ' MARGEM FINAL ACUMULADO
        GetGaugeScale(gauge_Margem_Final, 0, 0).Ranges(0).StartValue = CSng(7)
        GetGaugeScale(gauge_Margem_Final, 0, 0).Ranges(0).EndValue = CSng(13.99)
        GetGaugeScale(gauge_Margem_Final, 0, 0).Ranges(1).StartValue = CSng(14)
        GetGaugeScale(gauge_Margem_Final, 0, 0).Ranges(1).EndValue = clDataDb.ExecuteStoredProcedure_Scalar("dbo.usp_Buscar_Margem_Final_Meta_Mes", Conexao.gerKnowledge_str)
        GetGaugeScale(gauge_Margem_Final, 0, 0).Ranges(2).StartValue = clDataDb.ExecuteStoredProcedure_Scalar("dbo.usp_Buscar_Margem_Final_Meta_Mes", Conexao.gerKnowledge_str)
        GetGaugeScale(gauge_Margem_Final, 0, 0).Ranges(2).EndValue = CSng(22.0)
        GetGaugeScale(gauge_Margem_Final, 0, 0).MinValue = CSng(7)
        GetGaugeScale(gauge_Margem_Final, 0, 0).MaxValue = CSng(22.0)
        GetGaugeScale(gauge_Margem_Final, 0, 0).Value = clDataDb.ExecuteStoredProcedure_Scalar("dbo.usp_Buscar_Margem_Final_Real_Mes", Conexao.gerKnowledge_str)



    End Sub

    Private Sub Legendas()

        Dim diaHoje, diaPrimeiro, diaOntem As Date
        Dim sPrimeiro, sHoje, sOntem As String

        diaHoje = DateAndTime.Now.Date
        diaOntem = DateAndTime.Now.Date.AddDays(-1)
        diaPrimeiro = myDateTimes.GetFirstDayOfMonth(diaHoje)

        sHoje = Left(CStr(diaHoje), 5)
        sOntem = Left(CStr(diaOntem), 5)
        sPrimeiro = Left(CStr(diaPrimeiro), 5)


        lbl_2_1.Text = sHoje
        lbl_3_1.Text = sHoje

        'lbl_1_2.Text = sPrimeiro & " à " & sOntem
        lbl_2_2.Text = sPrimeiro & " à " & sOntem
        '  lbl_3_2.Text = sPrimeiro & " à " & sOntem


    End Sub

    'Protected Sub Chart_TicketMedio_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles Chart_TicketMedio.CustomDrawSeriesPoint
    '    If e.SeriesPoint(0) < 0 Then
    '        e.SeriesDrawOptions.Color = Drawing.Color.Red
    '    End If
    'End Sub

    Protected Sub gridItem_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridItem.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "vlrLucroComercial")
        oFun.Grid_RedIsNegative(e, "percPDV")
        oFun.Grid_RedIsNegative(e, "percSellOut")
    End Sub

    Protected Sub gridProjecao_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridProjecao.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percMeta")
        oFun.Grid_RedIsNegative(e, "percCresc")
    End Sub

    Protected Sub grid_Meta_Realizado_Ag23_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid_Meta_Realizado_Ag23.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "Dif")

    End Sub

    Protected Sub grid_Ag245_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid_Ag245.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percCresc")
    End Sub

    Protected Sub grid_Ag245_HtmlFooterCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableFooterCellEventArgs) Handles grid_Ag245.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "    DASHBOARDS"
        End If
    End Sub

  
End Class
