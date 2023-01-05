Imports DevExpress.Web
Imports DevExpress.XtraCharts

Partial Class MemberPages_Quebras_AnaliseComposicaoQuebraMesFornecedor
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " PAGE"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(113, User.Identity.Name)

            oFun.Grid_Column_BorderRight(grid, "DescProduto", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "percCresc", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "vlrVenda", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "percMargem", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "pMS", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "pMF", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "vlrAg51", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "vlrAg52", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "vlrDiv", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "vlrAg23", Drawing.Color.Gray, BorderStyle.Solid, 1)

            mySession()

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Análise de Quebra por Fornecedor - PGR113"
        End If

    End Sub

#End Region

   

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback

        Atualizar()

        Dim headTitle As ChartTitle = New ChartTitle
        headTitle.Text = "Perdas e Participação do Fornecedor: " & cboFornecedor.CallFornecedor & " - " & cboFornecedor.nomeFornecedor
        graph.Titles.Add(headTitle)
    End Sub

    Private Sub mySession()
        Session("sFORNECEDOR") = Me.cboFornecedor.CallFornecedor
        Session("sCNPJ") = cboFornecedor.CNPJ_Principal_Checked
        Session("sATIVO") = cboProdutoStatus.SelectedValue

        Session("sDIA_INICIAL") = cboDia.CallDiaInicial
        Session("sDIA_FINAL") = cboDia.CallDiaFinal

    End Sub

    Private Sub Atualizar()
        mySession()

        ' por Item
        If Me.chkItens.Checked = True Then
            Call VisualizarPorItem()
            grid.Columns("bandProduto").FixedStyle = GridViewColumnFixedStyle.Left
        Else
            Call VisualizarPorMercadologico()
            grid.Columns("bandProduto").FixedStyle = GridViewColumnFixedStyle.None
        End If

        ' por Divergencia
        If Me.chkDivergencia.Checked = True Then
            grid.Columns.Item("bandDivergencia").Visible = True
            grid.Columns.Item("bandAgenda51").Visible = False
            grid.Columns.Item("bandAgenda52").Visible = False
        Else
            grid.Columns.Item("bandDivergencia").Visible = False
            grid.Columns.Item("bandAgenda51").Visible = True
            grid.Columns.Item("bandAgenda52").Visible = True
        End If

        Me.grid.DataBind()
    End Sub

    Protected Sub ASPxGridView1_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs)
        On Error Resume Next
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCresc", "vlrQuebra", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)   'Percentual De Crescimento de Perda
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargem", "vlrMargem", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)  'Percentual De Margem
        oFun.Grid_Footer_Calculate(sender, e, grid, "pMS", "LS", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)    ''Percentual De Margem SellOut

    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs)

        oFun.Grid_RedIsNegative(e, "percCresc")
        oFun.Grid_RedIsNegative(e, "Qtde52")
        oFun.Grid_RedIsNegative(e, "Qtde23")
        oFun.Grid_RedIsNegative(e, "vlrAg52")
        oFun.Grid_RedIsNegative(e, "vlrAg23")
        oFun.Grid_RedIsNegative(e, "vlrQuebra")
        oFun.Grid_RedIsNegative(e, "QtdeQuebra")
        oFun.Grid_RedIsNegative(e, "vlrDiv")
        oFun.Grid_RedIsNegative(e, "QtdeDiv")

    End Sub

    Protected Sub ASPxGridView1_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs)
        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

    Private Sub VisualizarPorItem()
        grid.UnGroup(grid.Columns("ListaSecao"))
        grid.UnGroup(grid.Columns("ListaGrupo"))
        grid.UnGroup(grid.Columns("ListaSubgrupo"))
    End Sub

    Private Sub VisualizarPorMercadologico()
        grid.GroupBy(grid.Columns("ListaSecao"), 0)
        grid.GroupBy(grid.Columns("ListaGrupo"), 1)
        grid.GroupBy(grid.Columns("ListaSubgrupo"), 2)
    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)
    End Sub

  

    Protected Sub graph_Load(sender As Object, e As EventArgs) Handles graph.Load
        Dim headTitle As ChartTitle = New ChartTitle
        headTitle.Text = "Eliseu"
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            If Me.cboFilial.IsLoja Then

                oFun.Grid_Column_Visible(grid, "bandVenda", False)
                oFun.Grid_Column_Visible(grid, "bandMargemPraticada", False)
                oFun.Grid_Column_Visible(grid, "bandSellOut", False)
                oFun.Grid_Column_Visible(grid, "bandMargemFinal", False)
            
            End If
         
        End If
    End Sub
End Class
