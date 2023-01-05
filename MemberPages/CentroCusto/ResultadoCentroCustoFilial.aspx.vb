
Partial Class MemberPages_CentroCusto_ResultaCentroCustoFilial
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            Dim varAno As Int32
            varAno = Year(Now())
            Me.cboAno.AnoInicial = 2014
            Me.cboAno.AnoFinal = varAno

            Me.cboAno.CallAno = varAno

            Me.cboFilial.Visible_cboCorporacao = False

            Me.cboAno.AutoPostBack = False
            Me.cboMes.AutoPostBack = False
            Me.cboFilial.AutoPostBack = False

            Me.cboSize.CallSize = 100

            AddBorders()

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Centro de Custo por Filial - PGR241"
        End If
    End Sub


#End Region

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback

        Session("sANO") = Me.cboAno.CallAno
        Session("sMES") = Me.cboMes.CallMes
        Session("sFILIAL") = Me.cboFilial.CallFilial

        Me.grid.DataBind()

        Call AddBorders()

    End Sub


#Region " Others"

    Private Sub AddBorders()

        oFun.Grid_Column_BorderRight(grid, "descSecao", Drawing.Color.Gray, BorderStyle.Solid, 1)
        oFun.Grid_Column_BorderRight(grid, "percPart", Drawing.Color.Gray, BorderStyle.Solid, 1)
        oFun.Grid_Column_BorderRight(grid, "percImposto", Drawing.Color.Gray, BorderStyle.Solid, 1)
        oFun.Grid_Column_BorderRight(grid, "percReceitaLiquida", Drawing.Color.Gray, BorderStyle.Solid, 1)
        oFun.Grid_Column_BorderRight(grid, "percCMV", Drawing.Color.Gray, BorderStyle.Solid, 1)
        oFun.Grid_Column_BorderRight(grid, "percMargem", Drawing.Color.Gray, BorderStyle.Solid, 1)
        oFun.Grid_Column_BorderRight(grid, "percQuebra", Drawing.Color.Gray, BorderStyle.Solid, 1)
        oFun.Grid_Column_BorderRight(grid, "percOperacaoComercial", Drawing.Color.Gray, BorderStyle.Solid, 1)
        oFun.Grid_Column_BorderLeft(grid, "vlrDespesa", Drawing.Color.Gray, BorderStyle.Solid, 1)
        oFun.Grid_Column_BorderLeft(grid, "vlrLucro", Drawing.Color.Gray, BorderStyle.Solid, 2)
    End Sub

#End Region

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, Me.cboSize.CallSize)
    End Sub

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, grid, "percQuebra", "vlrQuebra", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargem", "vlrMargem", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemOperacional", "vlrMargemOperacional", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percDespesa", "vlrDespesa", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percOperacaoComercial", "vlrOperacaoComercial", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percLucro", "vlrLucro", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percImposto", "vlrImposto", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percReceitaLiquida", "vlrReceitaLiquida", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCMV", "vlrCMV", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percQuebra")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "percMargemOperacional")
        oFun.Grid_RedIsNegative(e, "vlrQuebra")
        oFun.Grid_RedIsNegative(e, "vlrLucro")
        oFun.Grid_RedIsNegative(e, "percLucro")
        oFun.Grid_RedIsNegative(e, "vlrMargemOperacional")
        oFun.Grid_RedIsNegative(e, "percMargemOperacional")
    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub
End Class
