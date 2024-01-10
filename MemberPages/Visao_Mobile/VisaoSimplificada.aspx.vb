
Imports System.Data
Imports System.Data.SqlClient
Imports System.Drawing
Imports DevExpress.Web
Imports DevExpress.Web.Bootstrap

Partial Class MemberPages_Visao_Mobile_VisaoSimplificada
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes
    Dim oProj As New Projeto
    Dim oTime As New myDateTimes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            'Verde
            btnMenu_1.BackColor = Color.FromArgb(120, 167, 149)
            'Azul
            btnMenu_2.BackColor = Color.FromArgb(85, 134, 184)
            btnMenu_3.BackColor = Color.FromArgb(85, 134, 184)
            btnMenu_4.BackColor = Color.FromArgb(85, 134, 184)
            btnMenu_6.BackColor = Color.FromArgb(85, 134, 184)

            Session("sMERCADOLOGICO") = 1
            Session("sOPCAO") = 1
            Session("sFILIAL") = 99
            Session("sDEPARTAMENTO") = LCase(Trim(oProj.Buscar_Departamento_Usuario(Page.User.Identity.Name)))
            Session("sUSUARIO") = LCase(Page.User.Identity.Name)
            Session("sMES_ANTERIOR") = 2
            Session("sFILIAL_LUCRO_NEGATIVO") = 99

            If (Session("sDEPARTAMENTO") = "controladoria") Then

                divSair.Visible = True

            End If

            carregaSelects()

                'Menu Acompanhamento
                Call atualizaAcompanhamento()

                'Menu Analise Hora
                Call RotinaInicio()
                Call AtualizarAnaliseHora()

                'Menu Acumulado Mes
                Call AtualizarAcumuladoMes()

                'Menu Lucro Negativo
                Call AtualizaLucroNegativo()

            End If

    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        'Analise Hora
        'If Not IsPostBack Then
        '    'Call AtualizarAnaliseHora()

        '    ' Atualiza Grids
        '    ASPxGridView1.DataBind()
        '    gridTotalizador.DataBind()

        '    BuscaTitulo()
        '    MudarLegendaAnos()

        'End If
    End Sub


#Region "Analise Hora"

    Protected Sub grid_CustomCellStyle(sender As Object, e As DevExpress.Web.ASPxPivotGrid.PivotCustomCellStyleEventArgs) Handles grid.CustomCellStyle
        If e.ColumnValueType <> DevExpress.XtraPivotGrid.PivotGridValueType.Value OrElse e.RowValueType <> DevExpress.XtraPivotGrid.PivotGridValueType.Value Then
            Return
        End If
        If Convert.ToInt32(e.Value) < 0.0 Then
            e.CellStyle.ForeColor = System.Drawing.Color.Red
        Else
            e.CellStyle.ForeColor = System.Drawing.Color.Blue
        End If

        If e.RowIndex Mod 2 = 0 Then
            Return
        End If

        If e.ColumnValueType = DevExpress.XtraPivotGrid.PivotGridValueType.Value AndAlso e.RowValueType = DevExpress.XtraPivotGrid.PivotGridValueType.Value Then
            e.CellStyle.BackColor = Drawing.Color.WhiteSmoke
        End If

    End Sub

    Private Sub RotinaInicio()

        Dim vMes As Byte

        If DateAndTime.Now.Hour >= 10 And DateAndTime.Now.Hour <= 24 Then
            selSemanaMenu1.SelectedValue = DateAndTime.Now.DayOfWeek + 1
        Else
            selSemanaMenu1.SelectedValue = DateAndTime.Now.DayOfWeek
        End If

        If DateAndTime.Now.Day = 1 Then
            vMes = Month(DateAndTime.Now().AddDays(-1))
        Else
            vMes = Month(DateAndTime.Now())
        End If

        Session("sMES") = vMes
        selMesMenu1.SelectedValue = Session("sMES")

        Session("sUSUARIO") = User.Identity.Name
        Session("sANO") = selAnoMenu1.SelectedValue
        Session("sLOJA_CORP") = 99
        Session("sMESMOSDIAS") = 1
        Session("sUSUARIO") = "Controladoria"

    End Sub

    Private Sub AtualizarAnaliseHora()

        If Month(DateAndTime.Now()) = 1 And (DateAndTime.Now.Day = 1 Or DateAndTime.Now.Day = 2 Or DateAndTime.Now.Day = 3) Then
            selAnoMenu3.SelectedValue = myDateTimes.YearToday() - 1
            selMesMenu3.SelectedValue = 12
        Else
            selAnoMenu3.SelectedValue = Year(Now())
            selMesMenu3.SelectedValue = Month(DateAndTime.Now())
        End If

        Me.cboFilial.cboFilial_AutoPostBack = False
        Me.cboFilial.cboFilial_Visible_Legenda = False

        selAnoMenu1.SelectedValue = Year(Now())

        'Call RotinaInicio()
        Call MudarTitulo()

        Dim varStatus, varFilial As Byte
        If Me.rndEmpresa.Checked = True Then
            varStatus = 2
        Else
            varStatus = 1
        End If

        If Me.cboFilial.Visible = True Then
            varFilial = Me.cboFilial.CallFilial
            Session("sFILIAL") = varFilial
        Else
            varFilial = 99
            Session("sFILIAL") = 99
        End If

        Session("sMES") = selMesMenu1.SelectedValue
        Session("sANO") = selAnoMenu1.SelectedValue
        Session("sLOJA_CORP") = 99
        Session("sMESMOSDIAS") = 1
        Session("sUSUARIO") = "Controladoria"
        Session("sDIASEMANA") = selSemanaMenu1.SelectedValue

        Me.ASPxGridView2.DataBind()
        Me.grid.DataBind()

    End Sub

    Protected Sub ASPxGridView2_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles ASPxGridView2.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView2, "vlr4", "vlr2", "vlr1", Funcoes.CalculateType.Growth)
    End Sub

    Protected Sub ASPxGridView2_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView2.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "vlr3")
        oFun.Grid_RedIsNegative(e, "vlr4")
    End Sub

    Protected Sub rndEmpresa_CheckedChanged(sender As Object, e As EventArgs) Handles rndEmpresa.CheckedChanged
        If Me.rndEmpresa.Checked = True Then
            Me.cboFilial.Visible = False
            Call AtualizarAnaliseHora()
        End If
    End Sub

    Protected Sub rndFilial_CheckedChanged(sender As Object, e As EventArgs) Handles rndFilial.CheckedChanged
        If Me.rndFilial.Checked = True Then
            Me.cboFilial.Visible = True
            Call AtualizarAnaliseHora()
        End If
    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        Call AtualizarAnaliseHora()
    End Sub

    Private Sub MudarTitulo()
        Me.ASPxGridView2.Columns("vlr1").Caption = selAnoMenu1.SelectedValue - 1
        Me.ASPxGridView2.Columns("vlr2").Caption = selAnoMenu1.SelectedValue
    End Sub

    Protected Sub ASPxGridView2_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles ASPxGridView2.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub cbPanel2_Callback(sender As Object, e As CallbackEventArgsBase) Handles cbPanel2.Callback

        Session("sDIASEMANA") = selSemanaMenu1.SelectedValue

        Call MudarTitulo()
        Call AtualizarAnaliseHora()

        Me.ASPxGridView1.DataBind()
        Me.grid.DataBind()

    End Sub

#End Region

#Region "Eventos Acompanhamento"

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback
        Call atualizaAcompanhamento()
        gridRankingTotal.DataBind()
        ASPxGridView1.DataBind()
        grid_Top30_Lucro_Negativo.DataBind()
        grid_Top30_Lucro_Negativo_ate5.DataBind()

    End Sub

    Protected Sub pb_DataBound(ByVal sender As Object, ByVal e As EventArgs)
        Dim progressBar As ASPxProgressBar = CType(sender, ASPxProgressBar)

        If progressBar.Position > 100 Then
            progressBar.Position = 100
        End If

        If progressBar.Position >= 100 Then
            progressBar.IndicatorStyle.BackColor = Drawing.Color.Green
        Else
            progressBar.IndicatorStyle.BackColor = Drawing.Color.LightCoral
        End If
    End Sub

    Protected Sub ASPxGridView1_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles ASPxGridView1.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "percAting", "100", "20", Funcoes.CalculateType.Growth)

    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared

        On Error Resume Next

        oFun.Grid_RedIsNegative(e, "percAting")
        oFun.Grid_RedIsNegative(e, "percDifCresc")
        oFun.Grid_RedIsNegative(e, "percAtingLucro")
        oFun.Grid_RedIsNegative(e, "difMargem")
        oFun.Grid_RedIsNegative(e, "difLucro")

        oFun.Grid_RedIsNegative(e, "percRealMargem")
        oFun.Grid_RedIsNegative(e, "percRealMargemSellOut")
        oFun.Grid_RedIsNegative(e, "difMargemFinal")
        oFun.Grid_RedIsNegative(e, "percRealMargemClube")
        oFun.Grid_RedIsNegative(e, "vlrRealMargem")

        If e.DataColumn.FieldName = "percRealMargemClube" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.BackColor = System.Drawing.Color.MistyRose
            End If
        End If

        If e.DataColumn.FieldName = "percRealMargem" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.BackColor = System.Drawing.Color.MistyRose
            End If
        End If

        If e.DataColumn.FieldName = "vlrRealMargem" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.BackColor = System.Drawing.Color.MistyRose
            End If
        End If


    End Sub

    Protected Sub gridRankingTotal_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridRankingTotal.HtmlDataCellPrepared

        On Error Resume Next

        oFun.Grid_RedIsNegative(e, "percAting")
        oFun.Grid_RedIsNegative(e, "percDifCresc")
        oFun.Grid_RedIsNegative(e, "percAtingLucro")
        oFun.Grid_RedIsNegative(e, "difMargem")
        oFun.Grid_RedIsNegative(e, "difLucro")

        oFun.Grid_RedIsNegative(e, "percRealMargem")
        oFun.Grid_RedIsNegative(e, "percRealMargemSellOut")
        oFun.Grid_RedIsNegative(e, "difMargemFinal")
        oFun.Grid_RedIsNegative(e, "percRealMargemClube")
        oFun.Grid_RedIsNegative(e, "vlrRealMargem")

        If e.DataColumn.FieldName = "percRealMargemClube" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.BackColor = System.Drawing.Color.MistyRose
            End If
        End If

        If e.DataColumn.FieldName = "percRealMargem" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.BackColor = System.Drawing.Color.MistyRose
            End If
        End If

        If e.DataColumn.FieldName = "vlrRealMargem" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.BackColor = System.Drawing.Color.MistyRose
            End If
        End If


    End Sub

    Protected Sub ASPxGridView1_HtmlRowPrepared(sender As Object, e As ASPxGridViewTableRowEventArgs) Handles ASPxGridView1.HtmlRowPrepared

        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "207", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "208", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "251", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "250", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "240", Drawing.Color.LightGreen, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "253", Drawing.Color.Yellow, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "254", Drawing.Color.LightBlue, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "255", Drawing.Color.LightGreen, True)

        ' ATACAREJO
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "6027", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "6037", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "6099", Drawing.Color.PeachPuff, True)

        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "799", Drawing.Color.LightGray, True)

        ' HIPERMAIS - ATACADO
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "703", Drawing.Color.Lavender, True)

    End Sub

    Protected Sub cboDia_DiaVaiClick(sender As Object, e As EventArgs) Handles cboDia.DiaVaiClick
        Call atualizaAcompanhamento()
    End Sub

    Protected Sub cboDia_DiaVoltaClick(sender As Object, e As EventArgs) Handles cboDia.DiaVoltaClick
        Call atualizaAcompanhamento()
    End Sub

    Protected Sub cboDia_ListDiaChanged(sender As Object, e As EventArgs) Handles cboDia.ListDiaChanged
        Call atualizaAcompanhamento()
    End Sub

    Protected Sub atualizaAcompanhamento()
        Session("sDEPARTAMENTO") = LCase(Trim(oProj.Buscar_Departamento_Usuario(Page.User.Identity.Name)))
        Session("sFILIAL") = 99

        If DateAndTime.Now.Month = 1 And (DateAndTime.Now.Day = 1 Or DateAndTime.Now.Day = 2) Then
            If CInt(DateAndTime.Now.Hour) > 6 Then
                Session("sDIA") = Me.cboDia.CallDia.Date
            Else
                Session("sDIA") = myDateTimes.GetFirstDayOfYear_baseYear(myDateTimes.YearToday()).AddDays(-1)
            End If

        Else
            If CInt(DateAndTime.Now.Hour) > 6 Or (Me.cboDia.CallDia.Date <> Now.Date) Then
                'If CInt(DateAndTime.Now.Hour) > 7 Then
                Session("sDIA") = Me.cboDia.CallDia.Date
            Else
                Session("sDIA") = Me.cboDia.CallDia.Date.AddDays(-1)
            End If
        End If

        Me.cboDia.CallDia = Session("sDIA")

        Call BuscaTitulo()
        Call MudarLegendaAnos()
        gridRankingTotal.DataBind()
        ASPxGridView1.DataBind()
        gridProjecao.DataBind()

    End Sub

#End Region

#Region "Acumulado Mês"

    Protected Sub gridRankingMensal_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridRankingMensal.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percMargemDif")
        oFun.Grid_RedIsNegative(e, "percMA")
        oFun.Grid_RedIsNegative(e, "percCresc_RealMeta")
        oFun.Grid_RedIsNegative(e, "percCresc_RealAA1")
        oFun.Grid_RedIsNegative(e, "percCresc_RealAA2")
        oFun.Grid_RedIsNegative(e, "percCresc_RealAA3")
        oFun.Grid_RedIsNegative(e, "percCresc_MetaAnual")
        oFun.Grid_RedIsNegative(e, "percMargMetaFinalDif")

    End Sub

    Protected Sub gridTotalizador_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridTotalizador.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percMargemDif")
        oFun.Grid_RedIsNegative(e, "percMA")
        oFun.Grid_RedIsNegative(e, "percCresc_RealMeta")
        oFun.Grid_RedIsNegative(e, "percCresc_RealAA1")
        oFun.Grid_RedIsNegative(e, "percCresc_RealAA2")
        oFun.Grid_RedIsNegative(e, "percCresc_RealAA3")
        oFun.Grid_RedIsNegative(e, "percCresc_MetaAnual")

        oFun.Grid_RedIsNegative(e, "percMargMetaFinalDif")

    End Sub

    Protected Sub gridRankingMensal_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gridRankingMensal.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub gridRankingMensal_HtmlRowPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles gridRankingMensal.HtmlRowPrepared
        If e.RowType <> GridViewRowType.Data Then
        End If

        Dim NomeColuna As String = e.GetValue("idFilial")

        Select Case NomeColuna
            Case "207", "208", "251", "250", "6027", "6037"
                e.Row.BackColor = System.Drawing.Color.LightGray
                e.Row.Font.Bold = True
            Case "240"
                e.Row.BackColor = System.Drawing.Color.Lavender
                e.Row.Font.Bold = True
            Case "253"
                e.Row.BackColor = System.Drawing.Color.Yellow
                e.Row.Font.Bold = True
            Case "254"
                e.Row.BackColor = System.Drawing.Color.LightSteelBlue
                e.Row.Font.Bold = True
            Case "6099"
                e.Row.BackColor = System.Drawing.Color.PeachPuff
                e.Row.Font.Bold = True
            Case "255"
                e.Row.BackColor = System.Drawing.Color.LightGreen
                e.Row.Font.Bold = True
        End Select
        'LightYellow
        'Lavender
    End Sub

    Sub BuscaTitulo()
        Dim vMes As Byte = Session("sMES")
        If selAnoMenu3.SelectedValue = Session("sANO") And selMesMenu3.SelectedValue = vMes Then
            If vMes < 10 Then
                Me.gridRankingMensal.SettingsText.Title = "Ranking de Vendas Acumulado - Período de 01/0" & selMesMenu3.SelectedValue & "/" & selAnoMenu3.SelectedValue & " à " & DateAndTime.Today.AddDays(-1) & "."
            Else
                Me.gridRankingMensal.SettingsText.Title = "Ranking de Vendas Acumulado - Período de 01/" & selMesMenu3.SelectedValue & "/" & selAnoMenu3.SelectedValue & " à " & DateAndTime.Today.AddDays(-1) & "."
            End If
        Else
            If vMes < 10 Then
                Me.gridRankingMensal.SettingsText.Title = "Ranking de Vendas Acumulado - Período de 01/0" & selMesMenu3.SelectedValue & "/" & selAnoMenu3.SelectedValue & " à " & oTime.GetLastDayOfMonth_baseYearMonth(selMesMenu3.SelectedValue, selAnoMenu3.SelectedValue) & "."
            Else
                Me.gridRankingMensal.SettingsText.Title = "Ranking de Vendas Acumulado - Período de 01/" & selMesMenu3.SelectedValue & "/" & selAnoMenu3.SelectedValue & " à " & oTime.GetLastDayOfMonth_baseYearMonth(selMesMenu3.SelectedValue, selAnoMenu3.SelectedValue) & "."
            End If
        End If

    End Sub

    Private Sub ItensNegativeRed(e As ASPxGridViewTableDataCellEventArgs)
        oFun.Grid_RedIsNegative(e, "LucroComercial")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "vlrLucroFinal")
        oFun.Grid_RedIsNegative(e, "percMargemFinal")
    End Sub

    Private Sub MudarLegendaAnos()
        ' TOTALIZADOR ----
        Me.gridTotalizador.Columns.Item("bandAtual").Caption = selAnoMenu3.SelectedValue

        Me.gridTotalizador.Columns.Item("percCresc_RealAA1").Caption = selAnoMenu3.SelectedValue.ToString().Substring(2) + " X " + (selAnoMenu3.SelectedValue - 1).ToString().Substring(2)

        ' LOJAS ----
        Me.gridRankingMensal.Columns.Item("bandAtual").Caption = selAnoMenu3.SelectedValue

        Me.gridRankingMensal.Columns.Item("percCresc_RealAA1").Caption = selAnoMenu3.SelectedValue.ToString().Substring(2) + " X " + (selAnoMenu3.SelectedValue - 1).ToString().Substring(2)


    End Sub

    Protected Sub cbPanel3_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel3.Callback

        Session("sANO") = selAnoMenu3.SelectedValue
        Session("sMES") = selMesMenu3.SelectedValue

        BuscaTitulo()
        MudarLegendaAnos()

        ' Atualiza Grids
        ASPxGridView1.DataBind()
        gridTotalizador.DataBind()

    End Sub

    Protected Sub AtualizarAcumuladoMes()
        If Month(DateAndTime.Now()) = 1 And (DateAndTime.Now.Day = 1 Or DateAndTime.Now.Day = 2 Or DateAndTime.Now.Day = 3) Then

            selAnoMenu3.SelectedValue = myDateTimes.YearToday() - 1
            selMesMenu3.SelectedValue = 12

        Else
            selAnoMenu3.SelectedValue = Year(Now())
            selMesMenu3.SelectedValue = Month(DateAndTime.Now())
        End If

        BuscaTitulo()
        MudarLegendaAnos()

        gridTotalizador.DataBind()
        gridRankingMensal.DataBind()
    End Sub

#End Region

#Region "Acumulado Ano"

    Private Sub MudarLegendaAno()
        ' TOTALIZADOR ----
        Me.gridTotalizadorAno.Columns.Item("bandAtual").Caption = selAnoMenu6.SelectedValue
        Me.gridTotalizadorAno.Columns.Item("percCresc_RealAA1").Caption = selAnoMenu6.SelectedValue.ToString().Substring(2) + " X " + (selAnoMenu6.SelectedValue - 1).ToString().Substring(2)

        ' LOJAS ----
        Me.gridRankingAno.Columns.Item("bandAtual").Caption = selAnoMenu6.SelectedValue
        Me.gridRankingAno.Columns.Item("percCresc_RealAA1").Caption = selAnoMenu6.SelectedValue.ToString().Substring(2) + " X " + (selAnoMenu6.SelectedValue - 1).ToString().Substring(2)

    End Sub

    Protected Sub cbPanelAno_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanelAno.Callback

        Session("sANO") = selAnoMenu6.SelectedValue

        MudarLegendaAno()

        ' Atualiza Grids
        gridTotalizadorAno.DataBind()
        gridRankingAno.DataBind()

    End Sub

    Protected Sub AtualizarAcumuladoAno()

        selAnoMenu6.SelectedValue = Year(Now())
        Session("sANO") = selAnoMenu6.SelectedValue

        MudarLegendaAno()

        gridTotalizadorAno.DataBind()
        gridRankingAno.DataBind()
    End Sub

    Protected Sub gridTotalizadorAno_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridTotalizadorAno.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percMargemDif")
        oFun.Grid_RedIsNegative(e, "percMA")
        oFun.Grid_RedIsNegative(e, "percCresc_RealMeta")
        oFun.Grid_RedIsNegative(e, "percCresc_RealAA1")
        oFun.Grid_RedIsNegative(e, "percCresc_RealAA2")
        oFun.Grid_RedIsNegative(e, "percCresc_RealAA3")
        oFun.Grid_RedIsNegative(e, "percCresc_MetaAnual")
        oFun.Grid_RedIsNegative(e, "percMargMetaFinalDif")

    End Sub

    Protected Sub gridRankingAno_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridRankingAno.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percMargemDif")
        oFun.Grid_RedIsNegative(e, "percMA")
        oFun.Grid_RedIsNegative(e, "percCresc_RealMeta")
        oFun.Grid_RedIsNegative(e, "percCresc_RealAA1")
        oFun.Grid_RedIsNegative(e, "percCresc_RealAA2")
        oFun.Grid_RedIsNegative(e, "percCresc_RealAA3")
        oFun.Grid_RedIsNegative(e, "percCresc_MetaAnual")

        oFun.Grid_RedIsNegative(e, "percMargMetaFinalDif")

    End Sub
#End Region

#Region "Lucro negativo"

    Protected Sub grid_Top30_Lucro_Negativo_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles grid_Top30_Lucro_Negativo.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "precoVenda", "Venda", "QtdVendas", Funcoes.CalculateType.Division)
    End Sub

    Protected Sub grid_Top30_Lucro_Negativo_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid_Top30_Lucro_Negativo.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "LucroComercial")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "vlrLucroFinal")
        oFun.Grid_RedIsNegative(e, "percMargemFinal")
    End Sub

    Protected Sub grid_Top30_Lucro_Negativo_ate5_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid_Top30_Lucro_Negativo_ate5.CustomSummaryCalculate
        On Error Resume Next

        oFun.Grid_Footer_Calculate(sender, e, grid_Top30_Lucro_Negativo_ate5, "percMargem", "LucroComercial", "Venda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid_Top30_Lucro_Negativo_ate5, "percMargemSellOut", "LucroSellOut", "Venda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid_Top30_Lucro_Negativo_ate5, "percMargemFinal", "vlrLucroFinal", "Venda", Funcoes.CalculateType.ValueOverRevenue)


    End Sub

    Protected Sub grid_Top30_Lucro_Negativo_ate5_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid_Top30_Lucro_Negativo_ate5.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub grid_Top30_Lucro_Negativo_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid_Top30_Lucro_Negativo.CustomSummaryCalculate
        On Error Resume Next

        oFun.Grid_Footer_Calculate(sender, e, grid_Top30_Lucro_Negativo, "percMargem", "LucroComercial", "Venda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid_Top30_Lucro_Negativo, "percMargemSellOut", "LucroSellOut", "Venda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid_Top30_Lucro_Negativo, "percMargemFinal", "vlrLucroFinal", "Venda", Funcoes.CalculateType.ValueOverRevenue)


    End Sub

    Protected Sub grid_Top30_Lucro_Negativo_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid_Top30_Lucro_Negativo.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub grid_Top30_Lucro_Negativo_ate5_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles grid_Top30_Lucro_Negativo_ate5.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "precoVenda", "Venda", "QtdVendas", Funcoes.CalculateType.Division)
    End Sub

    Protected Sub AtualizaLucroNegativo()
        Session("sFILIAL") = 99

        If DateAndTime.Now.Month = 1 And (DateAndTime.Now.Day = 1 Or DateAndTime.Now.Day = 2) Then
            If CInt(DateAndTime.Now.Hour) > 9 Then
                Session("sDIA") = Me.cboDia.CallDia.Date
            Else
                Session("sDIA") = myDateTimes.GetFirstDayOfYear_baseYear(myDateTimes.YearToday()).AddDays(-1)
            End If

        Else
            If CInt(DateAndTime.Now.Hour) > 9 Then
                'If CInt(DateAndTime.Now.Hour) > 7 Then
                Session("sDIA") = Me.cboDia.CallDia.Date
            Else
                Session("sDIA") = Me.cboDia.CallDia.Date.AddDays(-1)
            End If
        End If

        Me.cboDia.CallDia = Session("sDIA")

        grid_Top30_Lucro_Negativo.DataBind()
        grid_Top30_Lucro_Negativo_ate5.DataBind()
    End Sub
#End Region

#Region "Botões Menu"
    Protected Sub btnSair_Click(sender As Object, e As EventArgs)
        Response.Redirect("~/MemberPages/menuPrincipal_Controladoria.aspx")
    End Sub

    Protected Sub btnMenu_1_Click(sender As Object, e As EventArgs)
        divAnalise.Visible = True
        divAcomp.Visible = False
        divRankingMes.Visible = False
        divLucroNegativo.Visible = False
        divAcumulado.Visible = False
        divAcumuladoAno.Visible = False

        'Verde
        btnMenu_1.BackColor = Color.FromArgb(120, 167, 149)
        'Azul
        btnMenu_2.BackColor = Color.FromArgb(85, 134, 184)
        btnMenu_3.BackColor = Color.FromArgb(85, 134, 184)
        btnMenu_4.BackColor = Color.FromArgb(85, 134, 184)
        btnMenu_6.BackColor = Color.FromArgb(85, 134, 184)

        oVen.AtualizarEstatisticaPrograma(439, User.Identity.Name)

        ' Atualiza Grids
        AtualizarAnaliseHora()

    End Sub

    Protected Sub btnMenu_2_Click(sender As Object, e As EventArgs)
        divAnalise.Visible = False
        divAcomp.Visible = True
        divRankingMes.Visible = True
        divLucroNegativo.Visible = False
        divAcumulado.Visible = False
        divAcumuladoAno.Visible = False

        'Verde
        btnMenu_2.BackColor = Color.FromArgb(120, 167, 149)
        'Azul
        btnMenu_1.BackColor = Color.FromArgb(85, 134, 184)
        btnMenu_3.BackColor = Color.FromArgb(85, 134, 184)
        btnMenu_4.BackColor = Color.FromArgb(85, 134, 184)
        btnMenu_6.BackColor = Color.FromArgb(85, 134, 184)

        oVen.AtualizarEstatisticaPrograma(438, User.Identity.Name)

        Call atualizaAcompanhamento()

    End Sub

    Protected Sub btnMenu_3_Click(sender As Object, e As EventArgs)
        divAnalise.Visible = False
        divAcomp.Visible = False
        divAcumulado.Visible = True
        divAcumuladoAno.Visible = False

        'Verde
        btnMenu_3.BackColor = Color.FromArgb(120, 167, 149)
        'Azul
        btnMenu_1.BackColor = Color.FromArgb(85, 134, 184)
        btnMenu_2.BackColor = Color.FromArgb(85, 134, 184)
        btnMenu_4.BackColor = Color.FromArgb(85, 134, 184)
        btnMenu_6.BackColor = Color.FromArgb(85, 134, 184)

        oVen.AtualizarEstatisticaPrograma(440, User.Identity.Name)

        Call AtualizarAcumuladoMes()

    End Sub

    Protected Sub btnMenu_4_Click(sender As Object, e As EventArgs)
        divAnalise.Visible = False
        divAcomp.Visible = True
        divRankingMes.Visible = False
        divLucroNegativo.Visible = True
        divAcumulado.Visible = False
        divAcumuladoAno.Visible = False

        'Verde
        btnMenu_4.BackColor = Color.FromArgb(120, 167, 149)
        'Azul
        btnMenu_1.BackColor = Color.FromArgb(85, 134, 184)
        btnMenu_2.BackColor = Color.FromArgb(85, 134, 184)
        btnMenu_3.BackColor = Color.FromArgb(85, 134, 184)
        btnMenu_6.BackColor = Color.FromArgb(85, 134, 184)

        oVen.AtualizarEstatisticaPrograma(441, User.Identity.Name)

        Call AtualizaLucroNegativo()

    End Sub

    Protected Sub btnMenu_5_Click(sender As Object, e As EventArgs)
        divAnalise.Visible = False
        divAcomp.Visible = True
        divAcumulado.Visible = False
        divMenu_1.Visible = True
        divMenu_2.Visible = False
        divMenu_3.Visible = True
        'divMenu_4.Visible = True
    End Sub

    Protected Sub btnMenu_6_Click(sender As Object, e As EventArgs)
        divAnalise.Visible = False
        divAcomp.Visible = False
        divRankingMes.Visible = False
        divLucroNegativo.Visible = False
        divAcumulado.Visible = False
        divAcumuladoAno.Visible = True

        'Verde
        btnMenu_6.BackColor = Color.FromArgb(120, 167, 149)
        'Azul
        btnMenu_1.BackColor = Color.FromArgb(85, 134, 184)
        btnMenu_2.BackColor = Color.FromArgb(85, 134, 184)
        btnMenu_3.BackColor = Color.FromArgb(85, 134, 184)
        btnMenu_4.BackColor = Color.FromArgb(85, 134, 184)

        oVen.AtualizarEstatisticaPrograma(441, User.Identity.Name)

        Call AtualizarAcumuladoAno()

    End Sub

#End Region

#Region "Carrega Selects e Filtros"
    Protected Sub carregaSelects()

        'Ranking Mês
        selAnoMenu1.Items.Add(New ListItem(DateTime.Today.AddYears(+1).Year).ToString())
        selAnoMenu1.Items.Add(New ListItem(DateTime.Today.Year).ToString())
        selAnoMenu1.Items.Add(New ListItem(DateTime.Today.AddYears(-1).Year).ToString())
        selAnoMenu1.Items.Add(New ListItem(DateTime.Today.AddYears(-2).Year).ToString())
        selAnoMenu1.SelectedIndex = 1

        'Ranking Mês
        selAnoMenu3.Items.Add(New ListItem(DateTime.Today.Year).ToString())
        selAnoMenu3.Items.Add(New ListItem(DateTime.Today.AddYears(-1).Year).ToString())
        selAnoMenu3.Items.Add(New ListItem(DateTime.Today.AddYears(-2).Year).ToString())
        selAnoMenu3.SelectedIndex = 0

        'Ranking Ano
        selAnoMenu6.Items.Add(New ListItem(DateTime.Today.Year).ToString())
        selAnoMenu6.Items.Add(New ListItem(DateTime.Today.AddYears(-1).Year).ToString())
        selAnoMenu6.Items.Add(New ListItem(DateTime.Today.AddYears(-2).Year).ToString())
        selAnoMenu6.Items.Add(New ListItem(DateTime.Today.AddYears(-3).Year).ToString())
        selAnoMenu6.SelectedIndex = 0

    End Sub

#End Region

End Class
