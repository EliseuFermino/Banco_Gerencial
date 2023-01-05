Imports DevExpress.Web

Partial Class MemberPages_Planejamento_Vendas_AnaliseMetaVenda
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate

        oFun.Grid_Footer_Calculate(sender, e, grid, "pC_3s2", "vlrAA2", "vlrAA3", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "pC_2s1", "vlrAA1", "vlrAA2", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "pC_MLs1", "vlrMetaLojas", "vlrAA1", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "pC_MCs1", "vlrMetaComercial", "vlrAA1", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "pC_MEs1", "vlrMetaEstatistica", "vlrAA1", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "pC_MDs1", "vlrMetaDefinitiva", "vlrAA1", Funcoes.CalculateType.Growth)

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(179, User.Identity.Name)
            Me.cboAno.AnoInicial = Year(DateAndTime.Now())
            Me.cboAno.AnoFinal = Year(DateAdd(DateInterval.Year, 1, DateAndTime.Now()))
            Me.cboAno.CallAno = Year(DateAdd(DateInterval.Year, 1, DateAndTime.Now()))
            cboAno.AutoPostBack = True

            MudarLegenda()
        End If
    End Sub


    Private Sub MudarLegenda()
        oFun.Grid_ColumnTitle(grid, "vlrAA3", cboAno.CallAno - 3)
        oFun.Grid_ColumnTitle(grid, "vlrAA2", cboAno.CallAno - 2)
        oFun.Grid_ColumnTitle(grid, "vlrAA1", cboAno.CallAno - 1)
        oFun.Grid_ColumnTitle(grid, "vlrMetaLojas", "Loja " & cboAno.CallAno)
        oFun.Grid_ColumnTitle(grid, "vlrMetaComercial", "Comercial " & cboAno.CallAno)

        oFun.Grid_ColumnTitle(GridMesmas, "vlrAA2", cboAno.CallAno - 3)
        oFun.Grid_ColumnTitle(GridMesmas, "vlrAA1", cboAno.CallAno - 2)
        oFun.Grid_ColumnTitle(GridMesmas, "vlrAT", cboAno.CallAno - 1)
        oFun.Grid_ColumnTitle(GridMesmas, "vlrMeta", cboAno.CallAno)
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Orçamento - Analise de Meta de Vendas - PGR179"
        End If

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "pC_3s2")

        oFun.Grid_RedIsNegative(e, "pC_2s1")
        oFun.Grid_RedIsNegative(e, "pC_MLs1")
        oFun.Grid_RedIsNegative(e, "pC_MCs1")
        oFun.Grid_RedIsNegative(e, "pC_MEs")
        oFun.Grid_RedIsNegative(e, "pC_MDs1")
        oFun.Grid_RedIsNegative(e, "pC_MEs1")
        oFun.Grid_RedIsNegative(e, "Diferenca")

    End Sub

    Protected Sub btnAtualizar_Click(sender As Object, e As EventArgs) Handles btnAtualizar.Click
        Me.grid.DataBind()
    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub cboAno_ListAnoChanged(sender As Object, e As EventArgs) Handles cboAno.ListAnoChanged
        MudarLegenda()
    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)
    End Sub

    Protected Sub GridMesmas_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles GridMesmas.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "vlrAA1")
        oFun.Grid_RedIsNegative(e, "vlrAA2")
        oFun.Grid_RedIsNegative(e, "vlrAT")
        oFun.Grid_RedIsNegative(e, "vlrMeta")
    End Sub
End Class
