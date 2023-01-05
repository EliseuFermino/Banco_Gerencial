
Partial Class MemberPages_Vendas_Estrategia_Venda_Lojas
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(389, User.Identity.Name)
            oFun.Grid_Title(grid, "Loja 99 - Empresa  -  Estratégia de Vendas")

            oFun.Grid_Column_BorderRight(grid, "nomeDiaSemana", Drawing.Color.Gray, BorderStyle.Solid, 2)

            'oFun.Grid_Column_BorderRight(grid, "vlrMeta_Lucro", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "perc_CrescVendas", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "perc_CrescVolume", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "dif_PercMargemPDV", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "dif_PercMargemTotal", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "numFuncionariosAT", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "QL_AT", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "perc_CrescLucroTotal", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "vlrSaldo", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "perc_CrescNumClientes", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "precoMedioAT", Drawing.Color.Gray, BorderStyle.Solid, 2)


            ' oFun.Grid_Column_BorderRight(grid, "difVendas", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "dif_vlrLucroTotal", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "percAtingMeta_Vendas", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "perc_CrescLucroTotal", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "percCAI_AA", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "percCAI_AT", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_FixHeader(chkFixarCabecalho, grid)

            Session("sSECAO") = 0

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Estratégia de Vendas - PGR389"
        End If
    End Sub

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate

        oFun.Grid_Footer_Calculate(sender, e, grid, "percMetaMargem", "vlrMeta_Lucro", "vlrMeta_Venda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percAtingMeta_Vendas", "vlrRealAT", "vlrMeta_Venda", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "perc_CrescVendas", "vlrRealAT", "vlrRealAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "perc_CrescVolume", "VolumeAT", "VolumeAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "perc_CrescLucroTotal", "vlrLucroTotalAT", "vlrLucroTotalAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "perc_CrescNumClientes", "numClienteAT", "numClienteAA", Funcoes.CalculateType.Growth)

        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemPDV_AA", "vlrLucroComercialAA", "vlrRealAA", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemPDV_AT", "vlrLucroComercialAT", "vlrRealAT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "dif_PercMargemPDV", "percMargemPDV_AT", "percMargemPDV_AA", Funcoes.CalculateType.Decrease)

        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemTotal_AA", "vlrLucroTotalAA", "vlrRealAA", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemTotal_AT", "vlrLucroTotalAT", "vlrRealAT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "dif_PercMargemTotal", "percMargemTotal_AT", "percMargemTotal_AA", Funcoes.CalculateType.Decrease)

        oFun.Grid_Footer_Calculate(sender, e, grid, "precoMedioAT", "vlrRealAT", "VolumeAT", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, grid, "precoMedioAA", "vlrRealAA", "VolumeAA", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, grid, "precoMedioCresc", "precoMedioAT", "precoMedioAA", Funcoes.CalculateType.Growth)

        oFun.Grid_Footer_Calculate(sender, e, grid, "percCAI_AA", "vlrCAI_AA", "vlrRealAA", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCAI_AT", "vlrCAI_AT", "vlrRealAT", Funcoes.CalculateType.ValueOverRevenue)

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
        oFun.Grid_RedIsNegative(e, "perc_CrescNumClientes")
        oFun.Grid_RedIsNegative(e, "precoMedioCresc")

        oFun.Grid_RedIsNegative(e, "percMargemPDV_AA")
        oFun.Grid_RedIsNegative(e, "percMargemPDV_AT")

        oFun.Grid_RedIsNegative(e, "percMargemTotal_AA")
        oFun.Grid_RedIsNegative(e, "percMargemTotal_AT")

    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback
        Session("sFILIAL") = cboFilial.CallFilial
        If chkVendaHoje.Checked = True Then
            Session("sHOJE") = 1
        Else
            Session("sHOJE") = 0
        End If

        Session("sSECAO") = cboSecao.SelectedItem.Value

        'If rndTotal.Checked = True Then Session("sTIPO") = 1
        'If rndSecao.Checked = True Then Session("sTIPO") = 2

        grid.DataBind()
        oFun.Grid_FixHeader(chkFixarCabecalho, grid)
        'oFun.Grid_Title(grid, "Loja " & cboFilial.CallFilial_Text & "  -  Estratégia de Vendas - Mesmos Dias")
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then

            Session("sFILIAL") = cboFilial.CallFilial
            Session("sHOJE") = 0
            Session("sSECAO") = 0

            grid.DataBind()
        End If
    End Sub

    'Protected Sub rndSecao_CheckedChanged(sender As Object, e As EventArgs) Handles rndSecao.CheckedChanged
    '    If rndSecao.Checked = True Then
    '        cboSecao.cbo_Secao.Visible = True
    '    End If
    'End Sub

    'Protected Sub rndTotal_ValueChanged(sender As Object, e As EventArgs) Handles rndTotal.ValueChanged
    '    If rndTotal.Checked = True Then
    '        cboSecao.cbo_Secao.Visible = False
    '    End If
    'End Sub
End Class
