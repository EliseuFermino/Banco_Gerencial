
Partial Class MemberPages_SLV_AnaliseCompCrescItem_Deptos
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(266, User.Identity.Name)

            mySession()
            cboDia.Visible_MesmosDias = True

            AtualizarTitulo()

            cboSize.CallSize = 100
            cboSize.AutoPostBack = False

            oFun.Grid_Column_BorderRight(grid, "DataInclusao", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "VendaAA", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "VendaAT", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "nomeFornecedor", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "nomeFornecedorPrincipal", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percPartAcu", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "rnkAT", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percCrescPeso", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percCrescVolume", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "difClientes", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percCrescImpostos", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percCrescLucroComercial", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percCrescLucroSellOut", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percCrescLucroCheio", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(grid, "difPercMargemComercial", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "difPercMargemSellOut", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "difPercMargemCheio", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "EAN", Drawing.Color.Gray, BorderStyle.Solid, 2)
            'grid.Visible = False

            'grid.DataBind()
        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Análise de Crescimento por Item - PGR266"
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

        oFun.Grid_ColumnTitle(grid, "QtdVendasAA", varAno - 1)
        oFun.Grid_ColumnTitle(grid, "QtdVendasAT", varAno)

        oFun.Grid_ColumnTitle(grid, "pesoAA", varAno - 1)
        oFun.Grid_ColumnTitle(grid, "pesoAT", varAno)

        oFun.Grid_ColumnTitle(grid, "VendaAA", varAno - 1)
        oFun.Grid_ColumnTitle(grid, "VendaAT", varAno)

        oFun.Grid_ColumnTitle(grid, "numClientesAA", varAno - 1)
        oFun.Grid_ColumnTitle(grid, "numClientesAT", varAno)

        oFun.Grid_ColumnTitle(grid, "rnkAT", varAno)
        oFun.Grid_ColumnTitle(grid, "rnkAA", varAno - 1)

        oFun.Grid_ColumnTitle(grid, "ImpostosAT", varAno)
        oFun.Grid_ColumnTitle(grid, "ImpostosAA", varAno - 1)

        oFun.Grid_ColumnTitle(grid, "LucroComercialAT", varAno)
        oFun.Grid_ColumnTitle(grid, "LucroComercialAA", varAno - 1)

        oFun.Grid_ColumnTitle(grid, "LucroSellOutAT", varAno)
        oFun.Grid_ColumnTitle(grid, "LucroSellOutAA", varAno - 1)

        oFun.Grid_ColumnTitle(grid, "LucroCheioAT", varAno)
        oFun.Grid_ColumnTitle(grid, "LucroCheioAA", varAno - 1)

        oFun.Grid_ColumnTitle(grid, "percMargemComercialAT", varAno)
        oFun.Grid_ColumnTitle(grid, "percMargemComercialAA", varAno - 1)

        oFun.Grid_ColumnTitle(grid, "percMargemSellOutAT", varAno)
        oFun.Grid_ColumnTitle(grid, "percMargemSellOutAA", varAno - 1)

        oFun.Grid_ColumnTitle(grid, "percMargemCheioAT", varAno)
        oFun.Grid_ColumnTitle(grid, "percMargemCheioAA", varAno - 1)

        oFun.Grid_ColumnTitle(grid, "bandEstoque", "Estoque em " & cboDia.CallDiaFinal)

    End Sub

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate
        On Error Resume Next

        'Percentual Crescimento Volume
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescVolume", "QtdVendasAT", "QtdVendasAA", Funcoes.CalculateType.Growth)

        'Percentual Crescimento Peso
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescPeso", "pesoAT", "pesoAA", Funcoes.CalculateType.Growth)

        'Percentual Crescimento Vendas
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCresc", "VendaAT", "VendaAA", Funcoes.CalculateType.Growth)

        'Percentual Crescimento Impostos
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescImpostos", "ImpostosAT", "ImpostosAA", Funcoes.CalculateType.Growth)

        'Valor Preço Médio - Ano Anterior
        oFun.Grid_Footer_Calculate(sender, e, grid, "precoMedioAA", "VendaAA", "QtdVendasAA", Funcoes.CalculateType.Division)

        'Valor Preço Médio - Ano Antual
        oFun.Grid_Footer_Calculate(sender, e, grid, "precoMedioAT", "VendaAT", "QtdVendasAT", Funcoes.CalculateType.Division)

        'Inflacao
        oFun.Grid_Footer_Calculate(sender, e, grid, "Inflacao", "precoMedioAT", "precoMedioAA", Funcoes.CalculateType.Growth)

        'Percentual Crescimento Real
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescReal", "percCresc", "Inflacao", Funcoes.CalculateType.Decrease)

        'Percentual Crescimento Lucro Comercial
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescLucroComercial", "LucroComercialAT", "LucroComercialAA", Funcoes.CalculateType.Growth)

        'Percentual Crescimento Lucro Sell-Out
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescLucroSellOut", "LucroSellOutAT", "LucroSellOutAA", Funcoes.CalculateType.Growth)

        'Percentual Crescimento Lucro Cheio
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescLucroCheio", "LucroCheioAT", "LucroCheioAA", Funcoes.CalculateType.Growth)



        'Percentual Margem Comercial AT
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemComercialAT", "LucroComercialAT", "VendaAT", Funcoes.CalculateType.ValueOverRevenue)

        'Percentual Margem Comercial AA
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemComercialAA", "LucroComercialAA", "VendaAA", Funcoes.CalculateType.ValueOverRevenue)

        'Percentual Margem Sell-Out AT
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemSellOutAT", "LucroSellOutAT", "VendaAT", Funcoes.CalculateType.ValueOverRevenue)

        'Percentual Margem Sell-Out AA
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemSellOutAA", "LucroSellOutAA", "VendaAA", Funcoes.CalculateType.ValueOverRevenue)

        'Percentual Margem Cheio AT
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemCheioAT", "LucroCheioAT", "VendaAT", Funcoes.CalculateType.ValueOverRevenue)

        'Percentual Margem Cheio AA
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemCheioAA", "LucroCheioAA", "VendaAA", Funcoes.CalculateType.ValueOverRevenue)



        'Diferença Percentual Margem Comercial
        oFun.Grid_Footer_Calculate(sender, e, grid, "difPercMargemComercial", "percMargemComercialAT", "percMargemComercialAA", Funcoes.CalculateType.Decrease)

        'Diferença Percentual Margem Sell-Out
        oFun.Grid_Footer_Calculate(sender, e, grid, "difPercMargemSellOut", "percMargemSellOutAT", "percMargemSellOutAA", Funcoes.CalculateType.Decrease)

        'Diferença Percentual Margem Comercial
        oFun.Grid_Footer_Calculate(sender, e, grid, "difPercMargemCheio", "percMargemCheioAT", "percMargemCheioAA", Funcoes.CalculateType.Decrease)

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percCresc")
        oFun.Grid_RedIsNegative(e, "percCrescVolume")
        oFun.Grid_RedIsNegative(e, "percCrescPeso")
        oFun.Grid_RedIsNegative(e, "percCrescImpostos")
        oFun.Grid_RedIsNegative(e, "precoMedioAA")
        oFun.Grid_RedIsNegative(e, "precoMedioAT")
        oFun.Grid_RedIsNegative(e, "Inflacao")
        oFun.Grid_RedIsNegative(e, "percCrescReal")
        oFun.Grid_RedIsNegative(e, "difClientes")

        oFun.Grid_RedIsNegative(e, "percCrescLucroComercial")
        oFun.Grid_RedIsNegative(e, "percCrescLucroSellOut")
        oFun.Grid_RedIsNegative(e, "percCrescLucroCheio")

        oFun.Grid_RedIsNegative(e, "percMargemComercialAA")
        oFun.Grid_RedIsNegative(e, "percMargemComercialAT")
        oFun.Grid_RedIsNegative(e, "difPercMargemComercial")

        oFun.Grid_RedIsNegative(e, "percMargemSellOutAA")
        oFun.Grid_RedIsNegative(e, "percMargemSellOutAT")
        oFun.Grid_RedIsNegative(e, "difPercMargemSellOut")

        oFun.Grid_RedIsNegative(e, "percMargemCheioAA")
        oFun.Grid_RedIsNegative(e, "percMargemCheioAT")
        oFun.Grid_RedIsNegative(e, "difPercMargemCheio")

        oFun.Grid_RedIsNegative(e, "QtdeEstoque")
        oFun.Grid_RedIsNegative(e, "vlrEstoque")
        oFun.Grid_RedIsNegative(e, "QtdeTrocas")

    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, Me.cboSize.CallSize)
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
        Session("sSECAO") = cboSecao.CallSecao

        If Me.rndMesmosItens.Checked = True Then Session("sITENS") = 1 'Mesmos os Itens
        If Me.rndTodosItens.Checked = True Then Session("sITENS") = 2 'Todos os Itens

        If cboDia.Checked_MesmosDias = True Then
            Session("sMESMOS_DIAS") = 0
        Else
            Session("sMESMOS_DIAS") = 1
        End If


        If cboDia.Checked_MesAnterior = True Then
            Session("sMES_ANTERIOR") = 0    'Normal
        Else
            Session("sMES_ANTERIOR") = 1    ' Define Mes Anterior
        End If

        Session("sFILIAL") = cboFilial.CallFilial
    End Sub

End Class
