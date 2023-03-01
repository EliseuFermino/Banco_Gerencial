
Imports DevExpress.Web

Partial Class MemberPages_Campanhas_Pascoa_OvosGramagem
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVem As New VendaEmpresaMes

#Region " PAGE"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            oVem.AtualizarEstatisticaPrograma(274, Page.User.Identity.Name)

            Dim DiaAA, DiaAT As String
            
            DiaAA = "11/01/18"
            DiaAT = "31/03/18"

            cboAno.AnoInicial = 2018
            cboAno.AnoFinal = 2018
            cboAno.CallAno = 2018

            Session("sANO") = 2018
            Session("sFILIAL") = 99

            grid.DataBind()

            oFun.Grid_ColumnTitle(grid, "Qtde_AT_Parcial", "Até " & DiaAT)
            oFun.Grid_ColumnTitle(grid, "Qtde_AA_Parcial", "Até " & DiaAA)

            oFun.Grid_ColumnTitle(grid, "Venda_AT_Parcial", "Até " & DiaAT)
            oFun.Grid_ColumnTitle(grid, "Venda_AA_Parcial", "Até " & DiaAA)

            'oFun.Grid_ColumnTitle(grid, "vlrEstoque_AT_Parcial", "Até " & DiaAT)
            'oFun.Grid_ColumnTitle(grid, "qtdeEstoque_AT_Parcial", "Até " & DiaAT)

            oFun.Grid_ColumnTitle(grid, "custoMedio_AT_Parcial", "Até " & DiaAT)
            oFun.Grid_ColumnTitle(grid, "custoMedio_AA_Parcial", "Até " & DiaAA)

            oFun.Grid_ColumnTitle(grid, "precoMedio_AT_Parcial", "Até " & DiaAT)
            oFun.Grid_ColumnTitle(grid, "precoMedio_AA_Parcial", "Até " & DiaAA)

            oFun.Grid_ColumnTitle(grid, "numCliente_AT_Parcial", "Até " & DiaAT)
            oFun.Grid_ColumnTitle(grid, "numCliente_AA_Parcial", "Até " & DiaAA)

            oFun.Grid_ColumnTitle(grid, "percMargem_AT_Parcial", "Até " & DiaAT)
            oFun.Grid_ColumnTitle(grid, "percMargem_AA_Parcial", "Até " & DiaAA)

            oFun.Grid_ColumnTitle(grid, "precoKilo_AT_Parcial", "Até " & DiaAT)
            oFun.Grid_ColumnTitle(grid, "precoKilo_AA_Parcial", "Até " & DiaAA)

            oFun.Grid_ColumnTitle(grid, "Lucro_AT_Parcial", "Até " & DiaAT)
            oFun.Grid_ColumnTitle(grid, "Lucro_AA_Parcial", "Até " & DiaAA)


            'Bordas
            oFun.Grid_Column_BorderRight(grid, "Descricao", Drawing.Color.Gray, BorderStyle.Solid, 2)


            oFun.Grid_Column_BorderRight(grid, "percCrescQtdeAA", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "percCrescEstoque", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percCrescVenda", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "vlrEstoque_AA_Fechada", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "qtdeEstoque_AA_Fechada", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "precoMedio_AT_Parcial", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(grid, "precoKilo_AT_Parcial", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "custoMedio_AT_Parcial", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "numCliente_AT_Parcial", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percMargem_AT_Parcial", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(grid, "percCrescLucroAA", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "percCrescVendaAA", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "ProjecaoVenda", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "ProjecaoEstoque", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "ProjecaoLucro", Drawing.Color.Gray, BorderStyle.Dashed, 1)

            oFun.Grid_Column_BorderLeft(grid, "qtdeEstoque_AT_Parcial", Drawing.Color.Gray, BorderStyle.Dashed, 1)

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Análise Ovos de Páscoa por Peso " & Me.cboAno.CallAno & " - PGR274"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            If Not cboFilial.IsLoja Then
                cboFilial.CallCorporacao = 199
                cboFilial.DataBindFilial()
                cboFilial.CallFilial = 99
            End If
            Atualizar()
            oFun.Grid_OrderByColumn(grid, "qtdeEstoque_AT_Parcial", DevExpress.Data.ColumnSortOrder.Descending)
        End If
    End Sub

#End Region

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)
    End Sub

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate

        oFun.Grid_Footer_Calculate(sender, e, grid, "precoMedio_AA2_Fechada", "Venda_AA2_Fechada", "Qtde_AA2_Fechada", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, grid, "precoMedio_AA_Fechada", "Venda_AA_Fechada", "Qtde_AA_Fechada", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, grid, "precoMedio_AA_Parcial", "Venda_AA_Parcial", "Qtde_AA_Parcial", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, grid, "precoMedio_AT_Parcial", "Venda_AT_Parcial", "Qtde_AT_Parcial", Funcoes.CalculateType.Division)

        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescVenda", "VendaProjecaoReal", "Venda_AA_Fechada", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescEstoque", "QtdeProjecaoReal", "Qtde_AA_Fechada", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescLucro", "LucroProjecaoReal", "Lucro_AA_Fechada", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescQtdeAA", "Qtde_AA_Fechada", "Qtde_AA2_Fechada", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescLucroAA", "Lucro_AA_Fechada", "Lucro_AA2_Fechada", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescVendaAA", "Venda_AA_Fechada", "Venda_AA2_Fechada", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescVendaAA", "Venda_AA_Fechada", "Venda_AA2_Fechada", Funcoes.CalculateType.Growth)

        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargem_AA2_Fechada", "Lucro_AA2_Fechada", "Venda_AA2_Fechada", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargem_AA_Fechada", "Lucro_AA_Fechada", "Venda_AA_Fechada", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargem_AA_Parcial", "Lucro_AA_Parcial", "Venda_AA_Parcial", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargem_AT_Parcial", "Lucro_AT_Parcial", "Venda_AT_Parcial", Funcoes.CalculateType.ValueOverRevenue)

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percCrescVenda")
        oFun.Grid_RedIsNegative(e, "percCrescEstoque")
        oFun.Grid_RedIsNegative(e, "percCrescLucro")
        oFun.Grid_RedIsNegative(e, "percCrescLucroAA")
        oFun.Grid_RedIsNegative(e, "percCrescQtdeAA")
        oFun.Grid_RedIsNegative(e, "percCrescVendaAA")

    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub


    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback

        Atualizar()

    End Sub

    Private Sub Atualizar()
        Session("sFILIAL") = cboFilial.CallFilial
        Me.grid.DataBind()
    End Sub


    Protected Sub gridDetail_BeforePerformDataSelect(sender As Object, e As EventArgs)

        Session("sGRAMAGEM") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
        Session("sFILIAL") = cboFilial.CallFilial
    End Sub

    Protected Sub gridDetail_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs)
        oFun.Grid_RedIsNegative(e, "percCrescVenda")
        oFun.Grid_RedIsNegative(e, "percCrescEstoque")
        oFun.Grid_RedIsNegative(e, "percCrescLucro")
        oFun.Grid_RedIsNegative(e, "percCrescLucroAA")
        oFun.Grid_RedIsNegative(e, "percCrescQtdeAA")
        oFun.Grid_RedIsNegative(e, "percCrescVendaAA")
    End Sub

    Protected Sub gridDetail_Load(sender As Object, e As EventArgs)

        Dim grid As ASPxGridView = TryCast(sender, ASPxGridView)
        Dim DiaAA, DiaAT As String

        DiaAA = "19/04/14"
        DiaAT = "04/04/15"

        cboAno.AnoInicial = 2014
        cboAno.AnoFinal = 2015
        cboAno.CallAno = 2015

        Session("sANO") = 2015
        Session("sFILIAL") = 99

        grid.DataBind()

        oFun.Grid_ColumnTitle(grid, "Qtde_AT_Parcial", "Até " & DiaAT)
        oFun.Grid_ColumnTitle(grid, "Qtde_AA_Parcial", "Até " & DiaAA)

        oFun.Grid_ColumnTitle(grid, "Venda_AT_Parcial", "Até " & DiaAT)
        oFun.Grid_ColumnTitle(grid, "Venda_AA_Parcial", "Até " & DiaAA)

        'oFun.Grid_ColumnTitle(grid, "vlrEstoque_AT_Parcial", "Até " & DiaAT)
        'oFun.Grid_ColumnTitle(grid, "qtdeEstoque_AT_Parcial", "Até " & DiaAT)

        oFun.Grid_ColumnTitle(grid, "custoMedio_AT_Parcial", "Até " & DiaAT)
        oFun.Grid_ColumnTitle(grid, "custoMedio_AA_Parcial", "Até " & DiaAA)

        oFun.Grid_ColumnTitle(grid, "precoMedio_AT_Parcial", "Até " & DiaAT)
        oFun.Grid_ColumnTitle(grid, "precoMedio_AA_Parcial", "Até " & DiaAA)

        oFun.Grid_ColumnTitle(grid, "numCliente_AT_Parcial", "Até " & DiaAT)
        oFun.Grid_ColumnTitle(grid, "numCliente_AA_Parcial", "Até " & DiaAA)

        oFun.Grid_ColumnTitle(grid, "percMargem_AT_Parcial", "Até " & DiaAT)
        oFun.Grid_ColumnTitle(grid, "percMargem_AA_Parcial", "Até " & DiaAA)

        oFun.Grid_ColumnTitle(grid, "precoKilo_AT_Parcial", "Até " & DiaAT)
        oFun.Grid_ColumnTitle(grid, "precoKilo_AA_Parcial", "Até " & DiaAA)

        oFun.Grid_ColumnTitle(grid, "Lucro_AT_Parcial", "Até " & DiaAT)
        oFun.Grid_ColumnTitle(grid, "Lucro_AA_Parcial", "Até " & DiaAA)


        'Bordas
        oFun.Grid_Column_BorderRight(grid, "Descricao", Drawing.Color.Gray, BorderStyle.Solid, 2)


        oFun.Grid_Column_BorderRight(grid, "percCrescQtdeAA", Drawing.Color.Gray, BorderStyle.Dashed, 1)
        oFun.Grid_Column_BorderRight(grid, "percCrescEstoque", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "percCrescVenda", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "vlrEstoque_AA_Fechada", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "qtdeEstoque_AA_Fechada", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "precoMedio_AT_Parcial", Drawing.Color.Gray, BorderStyle.Solid, 2)

        oFun.Grid_Column_BorderRight(grid, "precoKilo_AT_Parcial", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "custoMedio_AT_Parcial", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "numCliente_AT_Parcial", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "percMargem_AT_Parcial", Drawing.Color.Gray, BorderStyle.Solid, 2)

        oFun.Grid_Column_BorderRight(grid, "percCrescLucroAA", Drawing.Color.Gray, BorderStyle.Dashed, 1)
        oFun.Grid_Column_BorderRight(grid, "percCrescVendaAA", Drawing.Color.Gray, BorderStyle.Dashed, 1)
        oFun.Grid_Column_BorderRight(grid, "ProjecaoVenda", Drawing.Color.Gray, BorderStyle.Dashed, 1)
        oFun.Grid_Column_BorderRight(grid, "ProjecaoEstoque", Drawing.Color.Gray, BorderStyle.Dashed, 1)
        oFun.Grid_Column_BorderRight(grid, "ProjecaoLucro", Drawing.Color.Gray, BorderStyle.Dashed, 1)

        oFun.Grid_Column_BorderLeft(grid, "qtdeEstoque_AT_Parcial", Drawing.Color.Gray, BorderStyle.Dashed, 1)

        oFun.Grid_OrderByColumn(grid, "qtdeEstoque_AT_Parcial", DevExpress.Data.ColumnSortOrder.Descending)

    End Sub
End Class
