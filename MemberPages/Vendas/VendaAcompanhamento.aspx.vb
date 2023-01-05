Imports DevExpress.Web

Partial Class MemberPages_VendaAcompanhamento
    Inherits System.Web.UI.Page


    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_InitComplete(sender As Object, e As EventArgs) Handles Me.InitComplete

        If Not IsPostBack Then
            oVen.AtualizarEstatisticaPrograma(1, User.Identity.Name)
        End If

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then


            Session("sMERCADOLOGICO") = 1   ' Total
            Session("sOPCAO") = 1   ' Total

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

            Session("sUSUARIO") = LCase(Page.User.Identity.Name)



        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete

        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Acompanhamento de Vendas Diárias - PGR1"

            cboFilial_ItensMaisVendidos.Checked_Empresa = True
            cboFilial_ItensLucroNegativo.Checked_Empresa = True
            cboFilial_ItensMaisVendidos.CallFilial = 99
            cboFilial_ItensMaisVendidos2.CallFilial = 205
            cboFilial_ItensLucroNegativo.CallFilial = 99


            Session("sFILIAL") = 99
            Session("sFILIAL_VENDA_ITEM_1") = 99
            Session("sFILIAL_VENDA_ITEM_2") = 205
            Session("sFILIAL_LUCRO_NEGATIVO") = 99

            gridItensMaisVendidos.DataBind()
            gridItensMaisVendidos2.DataBind()

        End If

    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            mySession()
            Atualizar()
        End If
    End Sub

#End Region

    Private Sub mySession()

        Session("sDIA") = Me.cboDia.CallDia.Date
        Session("sUSUARIO") = LCase(Page.User.Identity.Name)


        '    Select Case Session("sOPCAO")
        '    Case 1
        '        Session("sMERCADOLOGICO") = 1   ' Total
        '    Case 2
        '        Session("sMERCADOLOGICO") = 2   ' Departamento
        '    Case 3
        '        Session("sMERCADOLOGICO") = 3   ' Seção
        '    Case 4
        '        Session("sMERCADOLOGICO") = 4   ' Grupo
        '    Case 5
        '        Session("sMERCADOLOGICO") = 5   ' Subgrupo
        'End Select


    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
        gridRankingTotal.DataBind()

        Session("sFILIAL_LUCRO_NEGATIVO") = cboFilial_ItensLucroNegativo.CallFilial
        grid_Top30_Lucro_Negativo.DataBind()


        ASPxGridView1.DataBind()
        gridRankingTotal.DataBind()

        '  lblOBS.Text = "Dia Inicial: " & Session("sDIA_INICIAL") & "; Dia Final: " & Session("sDIA_FINAL") & "; Filial: " & Session("sFILIAL") & "; Opção: " & Session("sOPCAO") & "; Mercadologico: " & Session("sMERCADOLOGICO")
        'lblOBS.Visible = True


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


        ' LUCRO 
        'If e.DataColumn.FieldName = "difMargem" Then
        '    If Convert.ToDouble(e.CellValue) < 0 Then
        '        e.Cell.BackColor = System.Drawing.Color.MistyRose
        '    End If
        'End If

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


        ' LUCRO 
        'If e.DataColumn.FieldName = "difMargem" Then
        '    If Convert.ToDouble(e.CellValue) < 0 Then
        '        e.Cell.BackColor = System.Drawing.Color.MistyRose
        '    End If
        'End If

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

    Protected Sub chkFixar_CheckedChanged(sender As Object, e As EventArgs) Handles chkFixar.CheckedChanged
        If Me.chkFixar.Checked = False Then
            ASPxGridView1.Settings.ShowVerticalScrollBar = False
        Else
            ASPxGridView1.Settings.ShowVerticalScrollBar = True
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

    End Sub

    Protected Sub cboDia_DiaVaiClick(sender As Object, e As EventArgs) Handles cboDia.DiaVaiClick
        Call Atualizar()
    End Sub

    Protected Sub cboDia_DiaVoltaClick(sender As Object, e As EventArgs) Handles cboDia.DiaVoltaClick
        Call Atualizar()
    End Sub

    Protected Sub cboDia_ListDiaChanged(sender As Object, e As EventArgs) Handles cboDia.ListDiaChanged
        Call Atualizar()
    End Sub

    Private Sub Atualizar()
        Session("sDIA") = Me.cboDia.CallDia
        Session("sFILIAL") = 99

        Me.ASPxGridView1.DataBind()


    End Sub

    Protected Sub chkEstatisticas_CheckedChanged(sender As Object, e As EventArgs) Handles chkEstatisticas.CheckedChanged
        oFun.CheckBoxStatusExibir(chkEstatisticas, ASPxGridView1, "bandEstatisticas")
        oFun.CheckBoxStatusExibir(chkEstatisticas, gridAcompanhamentoSupervisor, "bandEstatisticas")
        oFun.CheckBoxStatusExibir(chkEstatisticas, gridAcompanhamentoCidade, "bandEstatisticas")
        oFun.CheckBoxStatusExibir(chkEstatisticas, gridAcompanhamentoRegiao, "bandEstatisticas")

    End Sub


    Protected Sub gridItensMaisVendidos_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridItensMaisVendidos.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "LucroComercial")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "vlrLucroFinal")
        oFun.Grid_RedIsNegative(e, "percMargemFinal")
    End Sub

    Protected Sub gridItensMaisVendidos2_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridItensMaisVendidos2.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "LucroComercial")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "vlrLucroFinal")
        oFun.Grid_RedIsNegative(e, "percMargemFinal")
    End Sub

    Protected Sub gridAcompanhamentoSupervisor_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridAcompanhamentoSupervisor.CustomSummaryCalculate
        On Error Resume Next
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoSupervisor, "percDifCresc", "vlrRealVenda", "vlrRealAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoSupervisor, "percAting", "vlrRealVenda", "vlrMetaVenda", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoSupervisor, "percMetaMargem", "vlrMetaMargem", "vlrMetaVenda", Funcoes.CalculateType.ValueOverRevenue)

        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoSupervisor, "percAtingLucro", "vlrRealMargem", "vlrMetaMargem", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoSupervisor, "percRealMargem", "vlrRealMargem", "vlrRealVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoSupervisor, "percRealMargemSellOut", "vlrRealMargemSellOut", "vlrRealVenda", Funcoes.CalculateType.ValueOverRevenue)

        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoSupervisor, "difMargem", "percRealMargem", "percMetaMargem", Funcoes.CalculateType.Decrease)

        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoSupervisor, "vlrVendaMetragem", "vlrRealVenda", "numMetragem", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoSupervisor, "vlrVendaFunc", "vlrRealVenda", "numFunc", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoSupervisor, "vlrVendaCheckout", "vlrRealVenda", "numCheckout", Funcoes.CalculateType.Division)

        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoSupervisor, "vlrTicketMedio", "vlrRealVenda", "numClientes", Funcoes.CalculateType.Division)

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


    Protected Sub gridAcompanhamentoSupervisor_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridAcompanhamentoSupervisor.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percAting")
        oFun.Grid_RedIsNegative(e, "percDifCresc")
        oFun.Grid_RedIsNegative(e, "percAtingLucro")
        oFun.Grid_RedIsNegative(e, "difMargem")
        oFun.Grid_RedIsNegative(e, "difLucro")

        oFun.Grid_RedIsNegative(e, "percRealMargem")
        oFun.Grid_RedIsNegative(e, "percRealMargemSellOut")
    End Sub

    Protected Sub gridAcompanhamentoSupervisor_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gridAcompanhamentoSupervisor.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub


#Region " CIDADE"

    Protected Sub gridAcompanhamentoCidade_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridAcompanhamentoCidade.CustomSummaryCalculate
        On Error Resume Next
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoCidade, "percDifCresc", "vlrRealVenda", "vlrRealAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoCidade, "percAting", "vlrRealVenda", "vlrMetaVenda", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoCidade, "percMetaMargem", "vlrMetaMargem", "vlrMetaVenda", Funcoes.CalculateType.ValueOverRevenue)

        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoCidade, "percAtingLucro", "vlrRealMargem", "vlrMetaMargem", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoCidade, "percRealMargem", "vlrRealMargem", "vlrRealVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoCidade, "percRealMargemSellOut", "vlrRealMargemSellOut", "vlrRealVenda", Funcoes.CalculateType.ValueOverRevenue)

        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoCidade, "difMargem", "percRealMargem", "percMetaMargem", Funcoes.CalculateType.Decrease)

        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoCidade, "vlrVendaMetragem", "vlrRealVenda", "numMetragem", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoCidade, "vlrVendaFunc", "vlrRealVenda", "numFunc", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoCidade, "vlrVendaCheckout", "vlrRealVenda", "numCheckout", Funcoes.CalculateType.Division)

        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoCidade, "vlrTicketMedio", "vlrRealVenda", "numClientes", Funcoes.CalculateType.Division)

    End Sub

    Protected Sub gridAcompanhamentoCidade_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridAcompanhamentoCidade.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percAting")
        oFun.Grid_RedIsNegative(e, "percDifCresc")
        oFun.Grid_RedIsNegative(e, "percAtingLucro")
        oFun.Grid_RedIsNegative(e, "difMargem")
        oFun.Grid_RedIsNegative(e, "difLucro")

        oFun.Grid_RedIsNegative(e, "percRealMargem")
        oFun.Grid_RedIsNegative(e, "percRealMargemSellOut")
    End Sub

    Protected Sub gridAcompanhamentoCidade_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gridAcompanhamentoCidade.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

#End Region

#Region " REGIAO"

    Protected Sub gridAcompanhamentoRegiao_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridAcompanhamentoRegiao.CustomSummaryCalculate
        On Error Resume Next
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoRegiao, "percDifCresc", "vlrRealVenda", "vlrRealAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoRegiao, "percAting", "vlrRealVenda", "vlrMetaVenda", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoRegiao, "percMetaMargem", "vlrMetaMargem", "vlrMetaVenda", Funcoes.CalculateType.ValueOverRevenue)

        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoRegiao, "percAtingLucro", "vlrRealMargem", "vlrMetaMargem", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoRegiao, "percRealMargem", "vlrRealMargem", "vlrRealVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoRegiao, "percRealMargemSellOut", "vlrRealMargemSellOut", "vlrRealVenda", Funcoes.CalculateType.ValueOverRevenue)

        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoRegiao, "difMargem", "percRealMargem", "percMetaMargem", Funcoes.CalculateType.Decrease)

        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoRegiao, "vlrVendaMetragem", "vlrRealVenda", "numMetragem", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoRegiao, "vlrVendaFunc", "vlrRealVenda", "numFunc", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoRegiao, "vlrVendaCheckout", "vlrRealVenda", "numCheckout", Funcoes.CalculateType.Division)

        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoRegiao, "vlrTicketMedio", "vlrRealVenda", "numClientes", Funcoes.CalculateType.Division)

    End Sub

    Protected Sub gridAcompanhamentoRegiao_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridAcompanhamentoRegiao.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percAting")
        oFun.Grid_RedIsNegative(e, "percDifCresc")
        oFun.Grid_RedIsNegative(e, "percAtingLucro")
        oFun.Grid_RedIsNegative(e, "difMargem")
        oFun.Grid_RedIsNegative(e, "difLucro")

        oFun.Grid_RedIsNegative(e, "percRealMargem")
        oFun.Grid_RedIsNegative(e, "percRealMargemSellOut")
    End Sub

    Protected Sub gridAcompanhamentoRegiao_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gridAcompanhamentoRegiao.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

#End Region


    Protected Sub gridItensMaisVendidos_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles gridItensMaisVendidos.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "precoVenda", "Venda", "QtdVendas", Funcoes.CalculateType.Division)
    End Sub

    Protected Sub gridItensMaisVendidos2_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles gridItensMaisVendidos2.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "precoVenda", "Venda", "QtdVendas", Funcoes.CalculateType.Division)
    End Sub

    Protected Sub grid_Top30_Lucro_Negativo_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles grid_Top30_Lucro_Negativo.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "precoVenda", "Venda", "QtdVendas", Funcoes.CalculateType.Division)
    End Sub

    Protected Sub cboPaneVendaItem_1_Callback(sender As Object, e As CallbackEventArgsBase) Handles cboPaneVendaItem_1.Callback
        Session("sFILIAL_VENDA_ITEM_1") = cboFilial_ItensMaisVendidos.CallFilial
        gridItensMaisVendidos.DataBind()
    End Sub

    Protected Sub cboPaneVendaItem_2_Callback(sender As Object, e As CallbackEventArgsBase) Handles cboPaneVendaItem_2.Callback
        Session("sFILIAL_VENDA_ITEM_2") = cboFilial_ItensMaisVendidos2.CallFilial
        gridItensMaisVendidos2.DataBind()
    End Sub


    Protected Sub grid_Top30_Lucro_Negativo_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid_Top30_Lucro_Negativo.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "LucroComercial")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "vlrLucroFinal")
        oFun.Grid_RedIsNegative(e, "percMargemFinal")
    End Sub


End Class

