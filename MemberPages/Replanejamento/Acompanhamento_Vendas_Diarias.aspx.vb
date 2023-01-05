
Partial Class MemberPages_Replanejamento_Acompanhamento_Vendas_Diarias
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(425, User.Identity.Name)
            oFun.Grid_Title(grid, "Acompanhamento de Vendas Diarias - PGR425")

            cboAno.AutoPostBack = False

            oFun.Grid_Column_BorderRight(grid, "nomeDiaSemana", Drawing.Color.Gray, BorderStyle.Solid, 2)
      
            oFun.Grid_Column_BorderRight(grid, "perc_CrescVolume", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(grid, "dif_PercMargemTotal", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(grid, "percAtingMeta_Vendas", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(grid, "vlrDifAg23", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_FixHeader(chkFixarCabecalho, grid)

            Session("sSECAO") = 23
            Session("sANO") = cboAno.CallAno
            Session("sMES") = cboMes.CallMes
            Session("sFILIAL") = cboFilial.CallFilial

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Acompanhamento de Vendas Diarias - PGR425"
        End If
    End Sub

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate

        oFun.Grid_Footer_Calculate(sender, e, grid, "percMetaMargem", "vlrMeta_Lucro", "vlrMeta_Venda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percAtingMeta_Vendas", "vlrRealAT", "vlrMeta_Venda", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "perc_CrescVendas", "vlrRealAT", "vlrRealAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "perc_CrescVolume", "QtdeAT", "QtdeAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "perc_CrescLucroTotal", "vlrLucroTotalAT", "vlrLucroTotalAA", Funcoes.CalculateType.Growth)


        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemTotal_AA", "vlrLucroTotalAA", "vlrRealAA", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemTotal_AT", "vlrLucroTotalAT", "vlrRealAT", Funcoes.CalculateType.ValueOverRevenue)

        oFun.Grid_Footer_Calculate(sender, e, grid, "percMetaAgenda23", "vlrMetaAgenda23", "vlrMetaVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percRealAgenda23", "vlrRealAgenda23", "vlrRealVenda", Funcoes.CalculateType.ValueOverRevenue)

        oFun.Grid_Footer_Calculate(sender, e, grid, "difPercMxR_Ag23", "percMetaAgenda23", "percRealAgenda23", Funcoes.CalculateType.Decrease)

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "vlrSaldo")
        oFun.Grid_RedIsNegative(e, "dif_VendaMeta")
        oFun.Grid_RedIsNegative(e, "difVendas")
        oFun.Grid_RedIsNegative(e, "difVolume")
        oFun.Grid_RedIsNegative(e, "percAtingMeta_Vendas")
        oFun.Grid_RedIsNegative(e, "perc_CrescVendas")
        oFun.Grid_RedIsNegative(e, "perc_CrescVolume")
        oFun.Grid_RedIsNegative(e, "dif_vlrLucroTotal")
        oFun.Grid_RedIsNegative(e, "perc_CrescLucroTotal")

        oFun.Grid_RedIsNegative(e, "percMargemTotal_AA")
        oFun.Grid_RedIsNegative(e, "percMargemTotal_AT")

        oFun.Grid_RedIsNegative(e, "vlrMetaAgenda23")
        oFun.Grid_RedIsNegative(e, "vlrRealAgenda23")
        oFun.Grid_RedIsNegative(e, "percDifAg23")
        oFun.Grid_RedIsNegative(e, "vlrDifAg23")
        oFun.Grid_RedIsNegative(e, "difPercMxR_Ag23")

    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback

        Session("sANO") = cboAno.CallAno
        Session("sMES") = cboMes.CallMes
        Session("sFILIAL") = cboFilial.CallFilial
        Session("sSECAO") = cboSecao.SelectedItem.Value

        'If rndTotal.Checked = True Then Session("sTIPO") = 1
        'If rndSecao.Checked = True Then Session("sTIPO") = 2

        grid.DataBind()
        oFun.Grid_FixHeader(chkFixarCabecalho, grid)
        'oFun.Grid_Title(grid, "Loja " & cboFilial.CallFilial_Text & "  -  Estratégia de Vendas - Mesmos Dias")
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender

        If Not IsPostBack Then

            cboMes.Visible_Ano = False
            cboSecao.SelectedIndex = 21
            cboAno.CallAno = Year(Now())

            Session("sANO") = cboAno.CallAno
            Session("sMES") = cboMes.CallMes
            Session("sFILIAL") = cboFilial.CallFilial
           

        End If

    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            Session("sSECAO") = cboSecao.SelectedItem.Value
            grid.DataBind()
        End If
    End Sub

   
End Class
