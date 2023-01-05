Imports DevExpress.Web.ASPxGauges.Base
Imports System.Data
Imports System.Data.SqlClient
Imports DevExpress.XtraCharts
Imports System.Drawing
Imports System.Net

Imports DevExpress.Web.ASPxGauges
Imports DevExpress.Web.ASPxGauges.Gauges.Circular
Imports DevExpress.Web


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
        'On Error Resume Next
        If Not IsPostBack Then
            oVen.AtualizarEstatisticaPrograma(416, User.Identity.Name)
            mySession()
            gridProjecao.DataBind()
            chartPercentual.DataBind()

            cboDiaInicialGestor.Value = myDateTimes.GetFirstDayOfMonth(Date.Now)
            cboDiaFinalGestor.Value = Date.Today.AddDays(-1)
            cboDia_Acima.Value = Date.Today
            cboDia_AcimaAtacarejo.Value = Date.Today

            Session("sDIA_INICIAL_GESTOR") = myDateTimes.GetFirstDayOfMonth(Date.Now)
            Session("sDIA_FINAL_GESTOR") = Date.Today.AddDays(-1)
            Session("sDIA_ACIMA") = Date.Today
            Session("sDIA_ACIMA_ATACAREJO") = Date.Today
            Session("sRADIOTV") = 1
            Session("sRADIOTV_ATACAREJO") = 1

            KPI_Indicators()
            Legendas()
        End If
        'If cboFilial.IsLoja = True Then btnAtualizar.Visible = False


    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "    Dashboard Controladoria - PGR416"
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
        Session("sDIA") = CDate(DateAndTime.Today)
        Session("sDIA_ACIMA") = cboDia_Acima.Date
        Session("sANO") = Year(DateAndTime.Today.AddDays(-1))
        Session("sMES") = Month(DateAndTime.Today.AddDays(-1))
        Session("sDEPARTAMENTO") = Trim(oPro.BuscarDepartamentoDoUsuario(User.Identity.Name))

        ' **************** LOJAS ******************
        If rndTodos.Checked = True Then
            Session("sRADIOTV") = 0
        End If

        If rndRadio.Checked = True Then
            Session("sRADIOTV") = 1
        End If

        If rndAll.Checked = True Then
            Session("sRADIOTV") = 2
        End If


        ' **************** ATACAREJO ******************
        If rndTodosAtacarejo.Checked = True Then
            Session("sRADIOTV_ATACAREJO") = 0
        End If

        If rndRadioAtacarejo.Checked = True Then
            Session("sRADIOTV_ATACAREJO") = 1
        End If

        If rndTodosAtacarejo.Checked = True Then
            Session("sRADIOTV_ATACAREJO") = 2
        End If

        lblError.Text = DateAndTime.Today.Day

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
        mySession()

        gridProjecao.DataBind()

        grid_Top5_LucroPDV.DataBind()

        grid_Meta_Realizado_Ag23.DataBind()

        gridItem.DataBind()
        gridAgendaItem.DataBind()
        grid_Loja_Nao_Fizeram_Checklist.DataBind()

        chartPercentual.DataBind()


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

            lbl_2_1.Text = sHoje
            lbl_3_1.Text = sHoje

            lbl_1_2.Text = sPrimeiro & " à " & sPrimeiro
            lbl_2_2.Text = sPrimeiro & " à " & sPrimeiro
            lbl_3_2.Text = sPrimeiro & " à " & sPrimeiro
            lbl_graph_horizontal.Text = sPrimeiroAA & " à " & sFinalAA & " - " & vAnoAtual & " x " & vAnoAnterior & " - Mesmos Dias"
            lblCresc_Filial.Text = sPrimeiroAA & " à " & sFinalAA & " - " & vAnoAtual & " x " & vAnoAnterior & " - Mesmos Dias"


        Else

            lbl_2_1.Text = sHoje
            lbl_3_1.Text = sHoje

            lbl_1_2.Text = sPrimeiro & " à " & sOntem
            lbl_2_2.Text = sPrimeiro & " à " & sOntem
            lbl_3_2.Text = sPrimeiro & " à " & sOntem
            lbl_graph_horizontal.Text = sPrimeiro & " à " & sOntem & " - " & vAnoAtual & " x " & vAnoAnterior & " - Mesmmos Dias"
            lblCresc_Filial.Text = sPrimeiro & " à " & sOntem & " - " & vAnoAtual & " x " & vAnoAnterior & " - Mesmmos Dias"

        End If

        If DateAndTime.Today.Day = 1 Then
            oFun.Grid_ColumnTitle(grid_Ag245, "vlr245_AA", CStr(vNomeMesAnterior) + " " + CStr(vAnoAnterior))
            oFun.Grid_ColumnTitle(grid_Ag245, "vlr245_MA", CStr(vNomeMesAnterior2) + " " + CStr(vAnoAtual))
            oFun.Grid_ColumnTitle(grid_Ag245, "vlrProjecao", CStr(vNomeMesAnterior) + " " + CStr(vAnoAtual))
        Else
            oFun.Grid_ColumnTitle(grid_Ag245, "vlr245_AA", CStr(vNomeMesAtual) + " " + CStr(vAnoAnterior))
            oFun.Grid_ColumnTitle(grid_Ag245, "vlr245_MA", CStr(vNomeMesAnterior) + " " + CStr(vAnoAtual))
            oFun.Grid_ColumnTitle(grid_Ag245, "vlrProjecao", CStr(vNomeMesAtual) + " " + CStr(vAnoAtual))
        End If

        




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

    Protected Sub grid_Loja_Nao_Fizeram_Checklist_BeforePerformDataSelect(sender As Object, e As EventArgs)
        Session("sGESTOR") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
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

    Protected Sub grid_Loja_Nao_Fizeram_Checklist_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid_Loja_Nao_Fizeram_Checklist.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub gridProjecao_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles gridProjecao.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "diferenca", "vlrProjecao", "vlrMeta", Funcoes.CalculateType.Decrease)
    End Sub

    Protected Sub grid_Loja_Nao_Fizeram_Checklist_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid_Loja_Nao_Fizeram_Checklist.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, grid_Loja_Nao_Fizeram_Checklist, "percMeta", "vlrVenda", "vlrMeta_Venda", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid_Loja_Nao_Fizeram_Checklist, "percCresc", "vlrVenda", "vlrAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid_Loja_Nao_Fizeram_Checklist, "percMargFinal", "vlrLucroTotal", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid_Loja_Nao_Fizeram_Checklist, "percMetaMargFinal", "vlrMetaLucroMesComl", "vlrMetaVendaMesComl", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid_Loja_Nao_Fizeram_Checklist, "dif_MxR", "percMargFinal", "percMetaMargFinal", Funcoes.CalculateType.Decrease)
    End Sub

  

    Protected Sub grid_Loja_Nao_Fizeram_Checklist_CustomUnboundColumnData1(sender As Object, e As ASPxGridViewColumnDataEventArgs)
        oFun.Grid_Calculate(e, "dif_MxR_Vlr", "vlrVenda", "vlrMeta_Venda", Funcoes.CalculateType.Decrease)
    End Sub

    Protected Sub grid_Loja_Nao_Fizeram_Checklist_CustomUnboundColumnData2(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles grid_Loja_Nao_Fizeram_Checklist.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "dif_MxR", "percMargFinal", "percMetaMargFinal", Funcoes.CalculateType.Decrease)
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

    Protected Sub cbPanelAcimaAtacarejo_Callback(sender As Object, e As CallbackEventArgsBase) Handles cbPanelAcimaAtacarejo.Callback
        mySession()
        gridAcimaAtacarejo.DataBind()
    End Sub

    Protected Sub gridAcima_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridAcima.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percMargemPDV")
        oFun.Grid_RedIsNegative(e, "percMargemSellOut")
    End Sub

    Protected Sub gridAcimaAtacarejo_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridAcimaAtacarejo.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percMargemPDV")
        oFun.Grid_RedIsNegative(e, "percMargemSellOut")
    End Sub

    Protected Sub cboPanelGestor_Callback(sender As Object, e As CallbackEventArgsBase) Handles cboPanelGestor.Callback
        Session("sDIA_INICIAL_GESTOR") = cboDiaInicialGestor.Date
        Session("sDIA_FINAL_GESTOR") = cboDiaFinalGestor.Date
        grid_Loja_Nao_Fizeram_Checklist.DataBind()

    End Sub

End Class
