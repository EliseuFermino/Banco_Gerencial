
Partial Class MemberPages_SLV_Item_ComparativoCrescimentoItem
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(223, User.Identity.Name)

            mySession()
            cboDia.Visible_MesmosDias = True

            AtualizarTitulo()

            cboSize.CallSize = 100

            oFun.Grid_Column_BorderRight(grid, "percCresc", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percCrescVolume", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(grid, "LucroAT", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "LucroSellOutAT", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "LucroCheiaAT", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(grid, "percMargemAT", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percMargemSellOutAT", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percMargemCheiaAT", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(grid, "nomeFornecedor", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "nomeFornecedorPrincipal", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(grid, "vlrImpostoAT", Drawing.Color.Gray, BorderStyle.Solid, 2)

            grid.Visible = False

            'grid.DataBind()
        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Comparativo de Crescimento por Item - PGR223"
        End If

    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            If Not cboFilial.IsLoja Then
                cboFilial.CallFilial = 3
            End If

        End If
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            'mySession()
            'grid.DataBind()
        End If
    End Sub

#End Region

    Private Sub AtualizarTitulo()
        Dim varAno As Int16
        varAno = Year(cboDia.CallDiaFinal)

        oFun.Grid_ColumnTitle(grid, "precoMedioAA", varAno - 1)
        oFun.Grid_ColumnTitle(grid, "precoMedioAT", varAno)

        oFun.Grid_ColumnTitle(grid, "rnkAA", varAno - 1)
        oFun.Grid_ColumnTitle(grid, "rnkAT", varAno)

        oFun.Grid_ColumnTitle(grid, "QtdVendasAA", varAno - 1)
        oFun.Grid_ColumnTitle(grid, "QtdVendasAT", varAno)

        oFun.Grid_ColumnTitle(grid, "VendaAA", varAno - 1)
        oFun.Grid_ColumnTitle(grid, "VendaAT", varAno)

        oFun.Grid_ColumnTitle(grid, "vlrImpostoAA", varAno - 1)
        oFun.Grid_ColumnTitle(grid, "vlrImpostoAT", varAno)

        oFun.Grid_ColumnTitle(grid, "LucroAA", varAno - 1)
        oFun.Grid_ColumnTitle(grid, "LucroAT", varAno)

        oFun.Grid_ColumnTitle(grid, "LucroSellOutAA", varAno - 1)
        oFun.Grid_ColumnTitle(grid, "LucroSellOutAT", varAno)

        oFun.Grid_ColumnTitle(grid, "LucroCheiaAA", varAno - 1)
        oFun.Grid_ColumnTitle(grid, "LucroCheiaAT", varAno)

        oFun.Grid_ColumnTitle(grid, "percMargemAA", varAno - 1)
        oFun.Grid_ColumnTitle(grid, "percMargemAT", varAno)

        oFun.Grid_ColumnTitle(grid, "percMargemSellOutAA", varAno - 1)
        oFun.Grid_ColumnTitle(grid, "percMargemSellOutAT", varAno)

        oFun.Grid_ColumnTitle(grid, "percMargemCheiaAA", varAno - 1)
        oFun.Grid_ColumnTitle(grid, "percMargemCheiaAT", varAno)

    End Sub

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate
        On Error Resume Next
        'Percentual Margem Ano Anterior
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemAA", "LucroAA", "VendaAA", Funcoes.CalculateType.ValueOverRevenue)

        'Percentual Margem Ano Atual
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemAT", "LucroAT", "VendaAT", Funcoes.CalculateType.ValueOverRevenue)

        'Percentual Margem Cheia Ano Anterior
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemCheiaAA", "LucroCheiaAA", "VendaAA", Funcoes.CalculateType.ValueOverRevenue)

        'Percentual Margem Cheia Ano Atual
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemCheiaAT", "LucroCheiaAT", "VendaAT", Funcoes.CalculateType.ValueOverRevenue)

        'Percentual Crescimento Volume
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescVolume", "QtdVendasAT", "QtdVendasAA", Funcoes.CalculateType.Growth)

        'Percentual Crescimento Vendas
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCresc", "VendaAT", "VendaAA", Funcoes.CalculateType.Growth)

        'Valor Preço Médio - Ano Anterior
        oFun.Grid_Footer_Calculate(sender, e, grid, "precoMedioAA", "VendaAA", "QtdVendasAA", Funcoes.CalculateType.Division)

        'Valor Preço Médio - Ano Antual
        oFun.Grid_Footer_Calculate(sender, e, grid, "precoMedioAT", "VendaAT", "QtdVendasAT", Funcoes.CalculateType.Division)

        'Inflacao
        oFun.Grid_Footer_Calculate(sender, e, grid, "Inflacao", "precoMedioAT", "precoMedioAA", Funcoes.CalculateType.Growth)

        'Percentual Crescimento Real
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescReal", "percCresc", "Inflacao", Funcoes.CalculateType.Decrease)

        'Percentual Margem Sell-Out Ano Anterior
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemSellOutAA", "LucroSellOutAA", "VendaAA", Funcoes.CalculateType.ValueOverRevenue)

        'Percentual Margem Sell-Out Ano Atual
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemSellOutAT", "LucroSellOutAT", "VendaAT", Funcoes.CalculateType.ValueOverRevenue)

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percMargemAA")
        oFun.Grid_RedIsNegative(e, "percMargemAT")
        oFun.Grid_RedIsNegative(e, "percMargemCheiaAT")
        oFun.Grid_RedIsNegative(e, "percMargemCheiaAA")
        oFun.Grid_RedIsNegative(e, "percCresc")
        oFun.Grid_RedIsNegative(e, "percCrescVolume")
        oFun.Grid_RedIsNegative(e, "precoMedioAA")
        oFun.Grid_RedIsNegative(e, "precoMedioAT")
        oFun.Grid_RedIsNegative(e, "Inflacao")
        oFun.Grid_RedIsNegative(e, "percCrescReal")
        oFun.Grid_RedIsNegative(e, "LucroAA")
        oFun.Grid_RedIsNegative(e, "LucroAT")
        oFun.Grid_RedIsNegative(e, "LucroCheiaAA")
        oFun.Grid_RedIsNegative(e, "LucroCheiaAT")
    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, Me.cboSize.CallSize, False)
    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback

        mySession()
        AtualizarTitulo()
        grid.Visible = True

        Me.grid.DataBind()

    End Sub

    Private Sub mySession()

        Session("sDIA_INICIAL") = cboDia.CallDiaInicial
        Session("sDIA_FINAL") = cboDia.CallDiaFinal

        If Me.rndMesmosItens.Checked = True Then Session("sITENS") = 1 'Mesmos os Itens
        If Me.rndTodosItens.Checked = True Then Session("sITENS") = 2 'Todos os Itens

        If cboDia.Checked_MesmosDias = True Then
            Session("sMESMOS_DIAS") = 0
        Else
            Session("sMESMOS_DIAS") = 1
        End If

        Session("sFILIAL") = cboFilial.CallFilial
    End Sub

End Class
