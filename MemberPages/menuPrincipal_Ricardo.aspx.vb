Imports DevExpress.Web.ASPxGauges.Base
Imports System.Data
Imports System.Data.SqlClient
Imports DevExpress.XtraCharts
Imports System.Drawing
Imports System.Net

Imports DevExpress.Web.ASPxGauges
Imports DevExpress.Web.ASPxGauges.Gauges.Circular
Imports DevExpress.Web

Partial Class MemberPages_menuPrincipal_Ricardo
    Inherits System.Web.UI.Page

    Dim nota As String
    Dim descFilial As String
    Dim Periodo As String
    Dim varDesc As String

    Dim oPro As New Projeto
    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Variaveis Ultima Linha"

    Private QtdVendas As Decimal = 0
    Private vlrVenda As Decimal = 0
    Private Clientes As Decimal = 0
    Private vlrLucroTotal As Decimal = 0
    Private percMargemFinal As Decimal = 0
    Private vlrPrecoMedio As Decimal = 0
    Private percPartVendas As Decimal = 0

#End Region


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        On Error Resume Next
        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(417, User.Identity.Name)
            mySession()
            gridProjecao.DataBind()

            cboDiaInicialGestor.Value = myDateTimes.GetFirstDayOfMonth(Date.Now)
            cboDiaFinalGestor.Value = Date.Today.AddDays(-1)
            cboDia_Acima.Value = Date.Today
            cboDia_AcimaAtacarejo.Value = Date.Today

            Session("sDIA_INICIAL_GESTOR") = myDateTimes.GetFirstDayOfMonth(Date.Now)
            Session("sDIA_FINAL_GESTOR") = Date.Today.AddDays(-1)
            Session("sDIA_ACIMA") = Date.Today
            Session("sDIA_ACIMA_ATACAREJO") = Date.Today

            Session("sDIA_INICIAL_ATACAREJO") = myDateTimes.GetFirstDayOfMonth(Date.Now)
            Session("sDIA_FINAL_ATACAREJO") = Date.Today.AddDays(-1)

            KPI_Indicators()
            Call DefineSemana()


        End If


    End Sub

    Private Sub DefineSemana()

        Dim vWeek As Byte = DatePart(DateInterval.Weekday, DateAndTime.Today)

        Select Case vWeek
            Case 1
                rndDom.Checked = True
            Case 2
                rndSeg.Checked = True
            Case 3
                rndTer.Checked = True
            Case 4
                rndQua.Checked = True
            Case 5
                rndQui.Checked = True
            Case 6
                rndSex.Checked = True
            Case 7
                rndSab.Checked = True
        End Select

        Session("sSEMANA") = vWeek

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

        Dim sDiaNum As Byte

        Session("sFILIAL") = 99
        Session("sOPCAO") = 1
        Session("sMERCADOLOGICO") = 1

        If rndDom.Checked = True Then sDiaNum = 1
        If rndSeg.Checked = True Then sDiaNum = 2
        If rndTer.Checked = True Then sDiaNum = 3
        If rndQua.Checked = True Then sDiaNum = 4
        If rndQui.Checked = True Then sDiaNum = 5
        If rndSex.Checked = True Then sDiaNum = 6
        If rndSab.Checked = True Then sDiaNum = 7

        Session("sSEMANA") = sDiaNum
        Session("sDIA") = DateAndTime.Today
        Session("sDIA_ACIMA") = cboDia_Acima.Date
        Session("sDIA_ACIMA_ATACAREJO") = cboDia_AcimaAtacarejo.Date
        Session("sANO") = Year(DateAndTime.Today.AddDays(-1))
        Session("sMES") = Month(DateAndTime.Today.AddDays(-1))
        Session("sDEPARTAMENTO") = Trim(oPro.BuscarDepartamentoDoUsuario(User.Identity.Name))

        If rndTodos.Checked = True Then
            Session("sRADIOTV") = 0
        End If

        If rndRadio.Checked = True Then
            Session("sRADIOTV") = 1
        End If


        If rndTodosAtacarejo.Checked = True Then
            Session("sRADIOTV_ATACAREJO") = 0
        End If

        If rndRadioAtacarejo.Checked = True Then
            Session("sRADIOTV_ATACAREJO") = 1
        End If

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

        gridProjecao.DataBind()

        grid_Top5_LucroPDV.DataBind()

        gridItem.DataBind()

        Legendas()

        KPI_Indicators()

    End Sub

    Private Sub KPI_Indicators()

        ' MARGEM FINAL
        GetGaugeScale(gauge_Margem_PDV, 0, 0).Ranges(0).StartValue = CSng(10)
        GetGaugeScale(gauge_Margem_PDV, 0, 0).Ranges(0).EndValue = CSng(15.99)
        GetGaugeScale(gauge_Margem_PDV, 0, 0).Ranges(1).StartValue = CSng(16)
        GetGaugeScale(gauge_Margem_PDV, 0, 0).Ranges(1).EndValue = clDataDb.ExecuteStoredProcedure_Scalar("dbo.usp_Buscar_Margem_Final_Meta_Hoje", Conexao.gerKnowledge_str)
        GetGaugeScale(gauge_Margem_PDV, 0, 0).Ranges(2).StartValue = clDataDb.ExecuteStoredProcedure_Scalar("dbo.usp_Buscar_Margem_Final_Meta_Hoje", Conexao.gerKnowledge_str)
        GetGaugeScale(gauge_Margem_PDV, 0, 0).Ranges(2).EndValue = CSng(22.0)
        GetGaugeScale(gauge_Margem_PDV, 0, 0).MinValue = CSng(10)
        GetGaugeScale(gauge_Margem_PDV, 0, 0).MaxValue = CSng(22.0)
        GetGaugeScale(gauge_Margem_PDV, 0, 0).Value = clDataDb.ExecuteStoredProcedure_Scalar("dbo.usp_Buscar_Margem_Final_Real_Hoje", Conexao.gerKnowledge_str)

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

            lbl_2_1.Text = sHoje
            lbl_3_1.Text = sHoje

            'lblTitle_Gestor.Text = " " & sPrimeiroAA & " à " & sFinalAA
        Else
            lbl_2_1.Text = sHoje
            lbl_3_1.Text = sHoje

            'lblTitle_Gestor.Text = " " & sPrimeiro & " à " & sOntem
        End If
        
        'lbl_2_2.Text = sPrimeiro & " à " & sOntem
        '  lbl_3_2.Text = sPrimeiro & " à " & sOntem


    End Sub

    Protected Sub gridItem_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridItem.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "vlrLucroComercial")
        oFun.Grid_RedIsNegative(e, "percPDV")
        oFun.Grid_RedIsNegative(e, "percSellOut")
    End Sub

    Protected Sub gridProjecao_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridProjecao.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percMeta")
        oFun.Grid_RedIsNegative(e, "percCresc")
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "    Dashboard Diretoria - PGR417"
        End If
    End Sub

    Protected Sub grid_Loja_Nao_Fizeram_Checklist_BeforePerformDataSelect(sender As Object, e As EventArgs)
        Session("sGESTOR") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
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

    Protected Sub grid_Loja_Nao_Fizeram_Checklist_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles grid_Loja_Nao_Fizeram_Checklist.CustomUnboundColumnData

        oFun.Grid_Calculate(e, "dif_MxR", "percMargFinal", "percMetaMargFinal", Funcoes.CalculateType.Decrease)
        oFun.Grid_Calculate(e, "dif_MxR_Vlr", "vlrVenda", "vlrMeta_Venda", Funcoes.CalculateType.Decrease)

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

  
    Protected Sub rndDom_CheckedChanged(sender As Object, e As EventArgs) Handles rndDom.CheckedChanged
        mySession()
        gridTopSemana.DataBind()
    End Sub

    Protected Sub rndSab_CheckedChanged(sender As Object, e As EventArgs) Handles rndSab.CheckedChanged
        mySession()
        gridTopSemana.DataBind()
    End Sub

    Protected Sub rndTer_CheckedChanged(sender As Object, e As EventArgs) Handles rndTer.CheckedChanged
        mySession()
        gridTopSemana.DataBind()
    End Sub

    Protected Sub rndQua_CheckedChanged(sender As Object, e As EventArgs) Handles rndQua.CheckedChanged
        mySession()
        gridTopSemana.DataBind()
    End Sub

    Protected Sub rndQui_CheckedChanged(sender As Object, e As EventArgs) Handles rndQui.CheckedChanged
        mySession()
        gridTopSemana.DataBind()
    End Sub

    Protected Sub rndSex_CheckedChanged(sender As Object, e As EventArgs) Handles rndSex.CheckedChanged
        mySession()
        gridTopSemana.DataBind()
    End Sub

    Protected Sub rndSeg_CheckedChanged(sender As Object, e As EventArgs) Handles rndSeg.CheckedChanged
        mySession()
        gridTopSemana.DataBind()
    End Sub


    Protected Sub grid_Loja_Nao_Fizeram_Checklist_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid_Loja_Nao_Fizeram_Checklist.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percMeta")
        oFun.Grid_RedIsNegative(e, "dif_MxR")

    End Sub

    Protected Sub grid_Loja_Nao_Fizeram_Checklist_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid_Loja_Nao_Fizeram_Checklist.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

  
    Protected Sub gridAcima_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridAcima.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percMargemPDV")
        oFun.Grid_RedIsNegative(e, "percMargemSellOut")
    End Sub

    Protected Sub gridAcimaAtacarejo_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridAcimaAtacarejo.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percMargemPDV")
        oFun.Grid_RedIsNegative(e, "percMargemSellOut")
    End Sub

    Protected Sub cbPanelAcima_Callback(sender As Object, e As CallbackEventArgsBase) Handles cbPanelAcima.Callback
        mySession()
        gridAcima.DataBind()
    End Sub

    Protected Sub cbPanelAcimaAtacarejo_Callback(sender As Object, e As CallbackEventArgsBase) Handles cbPanelAcimaAtacarejo.Callback
        mySession()
        gridAcimaAtacarejo.DataBind()
    End Sub

    Protected Sub cboPanelGestor_Callback(sender As Object, e As CallbackEventArgsBase) Handles cboPanelGestor.Callback
        Session("sDIA_INICIAL_GESTOR") = cboDiaInicialGestor.Date
        Session("sDIA_FINAL_GESTOR") = cboDiaFinalGestor.Date
        grid_Loja_Nao_Fizeram_Checklist.DataBind()

    End Sub


End Class
