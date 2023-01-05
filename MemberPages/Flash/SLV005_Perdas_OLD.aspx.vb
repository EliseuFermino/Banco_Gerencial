#Region " Imports"

Imports DevExpress.Web

Imports System.Data.SqlClient
Imports System.Data

#End Region

Partial Class MemberPages_SLV_SLV005_Perdas_OLD
    Inherits System.Web.UI.Page

    Private connDW As String = clData_DW_Condor.dbConnect
    Dim oFun As New Funcoes
    Dim oVem As New VendaEmpresaMes

#Region " Variaveis Ultima Linha"

    Private Qtde_AA As Decimal = 0
    Private vlrVenda_AA As Decimal = 0
    Private vlrLucro_AA As Decimal = 0
    Private vlrLucroSellout_AA As Decimal = 0
    Private vlrCAI_AA As Decimal = 0

    Private Qtde_AT As Decimal = 0
    Private vlrVenda_AT As Decimal = 0
    Private vlrLucro_AT As Decimal = 0
    Private vlrLucroSellout_AT As Decimal = 0
    Private vlrCAI_AT As Decimal = 0

    Private vlrVenda_meta As Decimal = 0
    Private vlrLucro_meta As Decimal = 0
    Private difValorMeta As Decimal = 0
    Private difValorMetaLucro As Decimal = 0

    Private percMargem_AA As Decimal = 0
    Private percMargem_AT As Decimal = 0
    Private percPart_AA As Decimal = 0
    Private percPart_AT As Decimal = 0

    Private percCresc_Venda As Decimal = 0
    Private percCresc_Qtde As Decimal = 0
    Private percCresc_Lucro As Decimal = 0

    Private percAtingMetaVlr As Decimal = 0
    Private percAtingMetaLucro As Decimal = 0
    Private percMargem_meta As Decimal = 0
    Private difPercMargem As Decimal = 0

    Private percCAI_AA As Decimal = 0
    Private percCAI_AT As Decimal = 0

    Private vlrLucroFinal_AT As Decimal = 0
    Private percMargemSellout_AT As Decimal = 0
    Private percMargemFinal_AT As Decimal = 0

    Private vlrLucroFinal_AA As Decimal = 0
    Private percMargemSellout_AA As Decimal = 0
    Private percMargemFinal_AA As Decimal = 0

    Private vlrAgenda23 As Decimal = 0
    Private vlrMetaAgenda23 As Decimal = 0
    Private difValorMetaAg23 As Decimal = 0
    Private percAtingMetaAg23 As Decimal = 0

    Private precoMedio_AA As Decimal = 0
    Private precoMedio_AT As Decimal = 0

    Private percCrescReal As Decimal = 0
    Private precoMedioCresc As Decimal = 0

    Private percAtingMetaVlrG As Decimal = 0



#End Region

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback

        Dim oVem As New VendaEmpresaMes

        Me.grid.Settings.ShowFilterRow = False
        ' oVem.AtualizarEstatisticaPrograma(137, User.Identity.Name)


        Call Titulos()
        'Me.cbPanel.SettingsLoadingPanel.Delay = 0

        'lblSecao.DataBind()

        CallSession()

        grid.Visible = True
        grid.DataBind()

        'grid2.Visible = True

        If cboFilial.CallCorporacao = 3 Then
            grid2.DataSource = DSGrid2_Item
            graph_item.Visible = True
            'cpGraph.Visible = True
        ElseIf cboFilial.CallCorporacao = 199 Then
            grid2.DataSource = DSGrid2
            graph_item.Visible = False
            cpGraph.Visible = False
        End If

        grid2.DataBind()


    End Sub

#Region " Page"


    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            On Error Resume Next
            Dim oVem As New VendaEmpresaMes

            cboPeriodo.Visible_MesAnterior = True
            cboPeriodo.Visible_MesmosDias = True
            CallSession()

            cboFilial.AutoPostBack = True

            Me.grid.Settings.ShowFilterRow = False
            ' oVem.AtualizarEstatisticaPrograma(137, User.Identity.Name)

            'Call LimparGrid()
            Select Case Me.cboVisao.Value
                Case 1
                    'Me.grid.Visible = True
                    Me.grid.DataBind()
                    'Call Visao1_Todas()
                    oVem.AtualizarEstatisticaPrograma(188, User.Identity.Name)
                Case 2
                    'Me.grid.Visible = True
                    Me.grid.DataBind()
                    'Call Visao2_Vendas()
                    oVem.AtualizarEstatisticaPrograma(189, User.Identity.Name)
                Case 3
                    'Me.grid.Visible = True
                    Me.grid.DataBind()
                    'Call Visao3_VendasPArticipacao()
                    oVem.AtualizarEstatisticaPrograma(190, User.Identity.Name)
                Case 4
                    'Me.grid.Visible = True
                    Me.grid.DataBind()
                    'Call Visao4_Volume()
                    oVem.AtualizarEstatisticaPrograma(191, User.Identity.Name)
                Case 5
                    'Me.grid.Visible = True
                    Me.grid.DataBind()
                    Call Visao5_Lucro()
                    oVem.AtualizarEstatisticaPrograma(192, User.Identity.Name)
                Case 6
                    Me.grid.Visible = True
                    Me.grid.DataBind()
                    'Call Visao6_LucroComSellOut()
                    oVem.AtualizarEstatisticaPrograma(193, User.Identity.Name)
                Case 7
                    'Me.grid.Visible = True
                    Me.grid.DataBind()
                    'Call Visao7_Margem()
                    oVem.AtualizarEstatisticaPrograma(194, User.Identity.Name)
                Case 8
                    'Me.grid.Visible = True
                    Me.grid.DataBind()
                    Call Visao8_MargemComSellOut()
                    oVem.AtualizarEstatisticaPrograma(195, User.Identity.Name)
                Case 9
                    Me.grid.Visible = False
                    'Call Visao9_MetaVersusRealizado()
                    oVem.AtualizarEstatisticaPrograma(196, User.Identity.Name)

            End Select

            ' -----------

            Dim iProj As New Projeto
            If LCase(LTrim(RTrim(iProj.BuscarDepartamentoDoUsuario(Page.User.Identity.Name)))) = "comercial" Then
                Session("sTIPO_LISTA") = 1  ' Comprador
                Session("sMATRICULA") = Page.User.Identity.Name
            ElseIf LCase(LTrim(RTrim(iProj.BuscarDepartamentoDoUsuario(Page.User.Identity.Name)))) = "gestor_comercial" Then
                Session("sTIPO_LISTA") = 2  ' Gestor_Comercial
                Session("sMATRICULA") = Page.User.Identity.Name
            Else
                Session("sTIPO_LISTA") = 0  ' Todos
            End If

            Session("sMES_ANTERIOR") = 2

            ' -----------

            Call Titulos()

            Me.cbPanel.SettingsLoadingPanel.Delay = 0

        End If
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        'Dim oProjeto As New Projeto
        'Select Case LCase(Trim(oProjeto.BuscarLocalDoUsuario(Page.User.Identity.Name)))
        '    Case "loja"
        '        Me.chkMostrar_CAI.Visible = False
        'End Select]
        If Not IsPostBack Then
            If Me.cboFilial.IsLoja = True Then
                'Me.chkMostrar_CAI.Visible = False
                'Else
                '    Me.cboFilial.CallFilial = 3
            End If

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Vendas Por Departamento e Seção - Visão 1 - PGR188"
            CType(Master.FindControl("lblTitle"), Label).ToolTip = "Analise as informações de Volume (Qtde), Venda, Lucro, Margem e Participação do Ano Atual, Ano Anterior e Mês Anterior. Há ainda informações de meta de venda e margem e ainda há o % de Crescimento da Venda, Volume e Lucro."
        End If

    End Sub

#End Region

#Region " Visões"

    Private Sub Visao1_Todas()

        Call LimparGrid()
        Me.grid.Columns.Item("bandCrescimento").Visible = True
        Me.grid.Columns.Item("bandMeta").Visible = True
        Me.grid.Columns.Item("bandMetaLucro").Visible = True
        Me.grid.Columns.Item("bandMetaMargem").Visible = True
        Me.grid.Columns.Item("percCresc_Venda").Visible = True

        If Me.cboVisao.Value = 1 Then
            'If Me.chkMostrar_AA.Checked = True Then
            '    Me.grid.Columns.Item("bandAnoAnterior").Visible = True
            '    Me.grid.Columns.Item("Qtde_AA").Visible = True
            '    Me.grid.Columns.Item("vlrLucro_AA").Visible = True
            '    Me.grid.Columns.Item("percPartDepto_AA").Visible = True
            '    Me.grid.Columns.Item("percMargem_AA").Visible = True
            '    Me.grid.Columns.Item("percPart_AA").Visible = True
            '    Me.grid.Columns.Item("vlrVenda_AA").Visible = True
            'Else
            '    Me.grid.Columns.Item("bandAnoAnterior").Visible = False
            '    Me.grid.Columns.Item("Qtde_AA").Visible = False
            '    Me.grid.Columns.Item("vlrLucro_AA").Visible = False
            '    Me.grid.Columns.Item("percPartDepto_AA").Visible = False
            '    Me.grid.Columns.Item("percMargem_AA").Visible = False
            '    Me.grid.Columns.Item("percPart_AA").Visible = False
            '    Me.grid.Columns.Item("vlrVenda_AA").Visible = False
            'End If

            'If Me.chkMostrar_AT.Checked = True Then
            '    Me.grid.Columns.Item("bandAnoAtual").Visible = True
            '    Me.grid.Columns.Item("Qtde_AT").Visible = True
            '    Me.grid.Columns.Item("vlrLucro_AT").Visible = True
            '    Me.grid.Columns.Item("percPartDepto_AT").Visible = True
            '    Me.grid.Columns.Item("percMargem_AT").Visible = True
            '    Me.grid.Columns.Item("percPart_AT").Visible = True
            '    Me.grid.Columns.Item("vlrVenda_AT").Visible = True
            'Else
            '    Me.grid.Columns.Item("bandAnoAtual").Visible = False
            '    Me.grid.Columns.Item("Qtde_AT").Visible = False
            '    Me.grid.Columns.Item("vlrLucro_AT").Visible = False
            '    Me.grid.Columns.Item("percPartDepto_AT").Visible = False
            '    Me.grid.Columns.Item("percMargem_AT").Visible = False
            '    Me.grid.Columns.Item("percPart_AT").Visible = False
            '    Me.grid.Columns.Item("vlrVenda_AT").Visible = False
            'End If

            'If Me.chkMostrar_SellOut.Checked = True Then
            '    Me.grid.Columns.Item("vlrLucroSellout_AT").Visible = True
            '    Me.grid.Columns.Item("vlrLucroFinal_AT").Visible = True
            '    Me.grid.Columns.Item("percMargemSellout_AT").Visible = True
            '    Me.grid.Columns.Item("percMargemFinal_AT").Visible = True

            '    Me.grid.Columns.Item("vlrLucroSellout_AA").Visible = True
            '    Me.grid.Columns.Item("vlrLucroFinal_AA").Visible = True
            '    Me.grid.Columns.Item("percMargemSellout_AA").Visible = True
            '    Me.grid.Columns.Item("percMargemFinal_AA").Visible = True
            'End If

            'If Me.chkMostrar_CAI.Checked = True Then
            '    Me.grid.Columns.Item("bandCAI_AnoAnterior").Visible = True
            '    Me.grid.Columns.Item("bandCAI_AnoAtual").Visible = True
            '    Me.grid.Columns.Item("vlrCAI_AT").Visible = True
            '    Me.grid.Columns.Item("vlrCAI_AA").Visible = True
            '    Me.grid.Columns.Item("percCAI_AA").Visible = True
            '    Me.grid.Columns.Item("percCAI_AT").Visible = True
            'Else
            '    Me.grid.Columns.Item("bandCAI_AnoAnterior").Visible = False
            '    Me.grid.Columns.Item("bandCAI_AnoAtual").Visible = False
            '    Me.grid.Columns.Item("vlrCAI_AT").Visible = False
            '    Me.grid.Columns.Item("vlrCAI_AA").Visible = False
            '    Me.grid.Columns.Item("percCAI_AA").Visible = False
            '    Me.grid.Columns.Item("percCAI_AT").Visible = False
            'End If
        End If

        Me.grid.Columns.Item("percCresc_Qtde").Visible = True
        Me.grid.Columns.Item("percCresc_Lucro").Visible = True

        Me.grid.Columns.Item("vlrVenda_meta").Visible = True
        Me.grid.Columns.Item("vlrLucro_meta").Visible = True
        Me.grid.Columns.Item("difValorMeta").Visible = True
        Me.grid.Columns.Item("difValorMetaLucro").Visible = True

        Me.grid.Columns.Item("percAtingMetaVlr").Visible = True
        Me.grid.Columns.Item("percAtingMetaLucro").Visible = True
        Me.grid.Columns.Item("percMargem_meta").Visible = True
        Me.grid.Columns.Item("difPercMargem").Visible = True

    End Sub

    Private Sub Visao2_Vendas()
        Call LimparGrid()
        Me.grid.Columns.Item("bandAnoAnterior").Visible = True
        Me.grid.Columns.Item("bandCrescimento").Visible = True

        Me.grid.Columns.Item("vlrVenda_AA").Visible = True
        Me.grid.Columns.Item("vlrVenda_AT").Visible = True
        Me.grid.Columns.Item("percCresc_Venda").Visible = True

    End Sub

    Private Sub Visao3_VendasPArticipacao()
        Call LimparGrid()
        Me.grid.Columns.Item("bandAnoAnterior").Visible = True
        Me.grid.Columns.Item("bandCrescimento").Visible = True

        Me.grid.Columns.Item("vlrVenda_AA").Visible = True
        Me.grid.Columns.Item("vlrVenda_AT").Visible = True
        Me.grid.Columns.Item("percCresc_Venda").Visible = True

        Me.grid.Columns.Item("percPart_AA").Visible = True
        Me.grid.Columns.Item("percPart_AT").Visible = True
        Me.grid.Columns.Item("percPartDepto_AA").Visible = True
        Me.grid.Columns.Item("percPartDepto_AT").Visible = True

    End Sub

    Private Sub Visao4_Volume()
        Call LimparGrid()
        Me.grid.Columns.Item("bandAnoAnterior").Visible = True
        Me.grid.Columns.Item("bandCrescimento").Visible = True

        Me.grid.Columns.Item("Qtde_AA").Visible = True
        Me.grid.Columns.Item("Qtde_AT").Visible = True
        Me.grid.Columns.Item("percCresc_Qtde").Visible = True
    End Sub

    Private Sub Visao5_Lucro()
        Call LimparGrid()
        Me.grid.Columns.Item("bandAnoAnterior").Visible = True
        Me.grid.Columns.Item("bandCrescimento").Visible = True

        Me.grid.Columns.Item("vlrLucro_AA").Visible = True
        Me.grid.Columns.Item("vlrLucro_AT").Visible = True
        Me.grid.Columns.Item("percCresc_Lucro").Visible = True
    End Sub

    Private Sub Visao6_LucroComSellOut()
        Call LimparGrid()
        Me.grid.Columns.Item("bandAnoAnterior").Visible = True
        Me.grid.Columns.Item("bandCrescimento").Visible = True

        Me.grid.Columns.Item("vlrLucro_AA").Visible = True
        Me.grid.Columns.Item("vlrLucro_AT").Visible = True
        Me.grid.Columns.Item("percCresc_Lucro").Visible = True

        Me.grid.Columns.Item("vlrLucroSellout_AA").Visible = True
        Me.grid.Columns.Item("vlrLucroSellout_AT").Visible = True

        Me.grid.Columns.Item("vlrLucroFinal_AA").Visible = True
        Me.grid.Columns.Item("vlrLucroFinal_AT").Visible = True

        With Me.grid.Columns.Item("vlrLucroFinal_AT").FooterCellStyle.BorderRight
            .BorderColor = Drawing.Color.Gray
            .BorderStyle = BorderStyle.Solid
            .BorderWidth = 2
        End With

        With Me.grid.Columns.Item("vlrLucroFinal_AT").CellStyle.BorderRight
            .BorderColor = Drawing.Color.Gray
            .BorderStyle = BorderStyle.Solid
            .BorderWidth = 2
        End With

        With Me.grid.Columns.Item("vlrLucroFinal_AA").FooterCellStyle.BorderRight
            .BorderColor = Drawing.Color.Gray
            .BorderStyle = BorderStyle.Solid
            .BorderWidth = 2
        End With

        With Me.grid.Columns.Item("vlrLucroFinal_AA").CellStyle.BorderRight
            .BorderColor = Drawing.Color.Gray
            .BorderStyle = BorderStyle.Solid
            .BorderWidth = 2
        End With
    End Sub

    Private Sub Visao7_Margem()
        Call LimparGrid()
        Me.grid.Columns.Item("bandAnoAnterior").Visible = True
        Me.grid.Columns.Item("bandCrescimento").Visible = True

        Me.grid.Columns.Item("percMargem_AA").Visible = True
        Me.grid.Columns.Item("percMargem_AT").Visible = True

        Me.grid.Columns.Item("bandCrescimento").Visible = False

    End Sub

    Private Sub Visao8_MargemComSellOut()
        Call LimparGrid()
        Me.grid.Columns.Item("bandAnoAnterior").Visible = True
        Me.grid.Columns.Item("bandCrescimento").Visible = True

        Me.grid.Columns.Item("percMargem_AA").Visible = True
        Me.grid.Columns.Item("percMargem_AT").Visible = True

        Me.grid.Columns.Item("percMargemSellout_AA").Visible = True
        Me.grid.Columns.Item("percMargemFinal_AA").Visible = True

        Me.grid.Columns.Item("percMargemSellout_AT").Visible = True
        Me.grid.Columns.Item("percMargemFinal_AT").Visible = True

        Me.grid.Columns.Item("bandCrescimento").Visible = False

        With Me.grid.Columns.Item("percMargem_AA").CellStyle.BorderRight
            .BorderColor = Nothing
            .BorderStyle = BorderStyle.NotSet
            .BorderWidth = 1
        End With

        With Me.grid.Columns.Item("percMargem_AT").CellStyle.BorderRight
            .BorderColor = Nothing
            .BorderStyle = BorderStyle.NotSet
            .BorderWidth = 1
        End With

        With Me.grid.Columns.Item("percMargem_AA").FooterCellStyle.BorderRight
            .BorderColor = Nothing
            .BorderStyle = BorderStyle.NotSet
            .BorderWidth = 1
        End With

        With Me.grid.Columns.Item("percMargem_AT").FooterCellStyle.BorderRight
            .BorderColor = Nothing
            .BorderStyle = BorderStyle.NotSet
            .BorderWidth = 1
        End With


        With Me.grid.Columns.Item("percMargemFinal_AA").CellStyle.BorderRight
            .BorderColor = Drawing.Color.Gray
            .BorderStyle = BorderStyle.Solid
            .BorderWidth = 2
        End With

        With Me.grid.Columns.Item("percMargemFinal_AT").CellStyle.BorderRight
            .BorderColor = Drawing.Color.Gray
            .BorderStyle = BorderStyle.Solid
            .BorderWidth = 2
        End With

        With Me.grid.Columns.Item("percMargemFinal_AA").FooterCellStyle.BorderRight
            .BorderColor = Drawing.Color.Gray
            .BorderStyle = BorderStyle.Solid
            .BorderWidth = 2
        End With

        With Me.grid.Columns.Item("percMargemFinal_AT").FooterCellStyle.BorderRight
            .BorderColor = Drawing.Color.Gray
            .BorderStyle = BorderStyle.Solid
            .BorderWidth = 2
        End With

    End Sub

    Private Sub Visao9_MetaVersusRealizado()

    End Sub

#End Region

    Private Sub LimparGrid()
        Me.grid.Columns.Item("Qtde_AA").Visible = False
        Me.grid.Columns.Item("vlrVenda_AA").Visible = False
        Me.grid.Columns.Item("vlrLucro_AA").Visible = False
        Me.grid.Columns.Item("vlrLucroSellout_AA").Visible = False
        Me.grid.Columns.Item("vlrCAI_AA").Visible = False
        Me.grid.Columns.Item("Qtde_AT").Visible = False
        Me.grid.Columns.Item("vlrVenda_AT").Visible = False
        Me.grid.Columns.Item("vlrLucro_AT").Visible = False
        Me.grid.Columns.Item("vlrLucroSellout_AT").Visible = False
        Me.grid.Columns.Item("vlrCAI_AT").Visible = False
        Me.grid.Columns.Item("vlrVenda_meta").Visible = False
        Me.grid.Columns.Item("vlrLucro_meta").Visible = False
        Me.grid.Columns.Item("difValorMeta").Visible = False
        Me.grid.Columns.Item("difValorMetaLucro").Visible = False
        Me.grid.Columns.Item("percMargem_AA").Visible = False
        Me.grid.Columns.Item("percMargem_AT").Visible = False
        Me.grid.Columns.Item("percPart_AA").Visible = False
        Me.grid.Columns.Item("percPart_AT").Visible = False
        Me.grid.Columns.Item("percCresc_Venda").Visible = False
        Me.grid.Columns.Item("percCresc_Qtde").Visible = False
        Me.grid.Columns.Item("percCresc_Lucro").Visible = False
        Me.grid.Columns.Item("percAtingMetaVlr").Visible = False
        Me.grid.Columns.Item("percAtingMetaLucro").Visible = False
        Me.grid.Columns.Item("percMargem_meta").Visible = False
        Me.grid.Columns.Item("difPercMargem").Visible = False
        Me.grid.Columns.Item("percCAI_AA").Visible = False
        Me.grid.Columns.Item("percCAI_AT").Visible = False
        Me.grid.Columns.Item("vlrLucroFinal_AT").Visible = False
        Me.grid.Columns.Item("percMargemSellout_AT").Visible = False
        Me.grid.Columns.Item("percMargemFinal_AT").Visible = False
        Me.grid.Columns.Item("vlrLucroFinal_AA").Visible = False
        Me.grid.Columns.Item("percMargemSellout_AA").Visible = False
        Me.grid.Columns.Item("percMargemFinal_AA").Visible = False
        oFun.Grid_Column_Visible(grid, "vlrAg23", False)

        Me.grid.Columns.Item("bandCrescimento").Visible = False
        Me.grid.Columns.Item("bandMeta").Visible = False
        Me.grid.Columns.Item("bandMetaLucro").Visible = False
        Me.grid.Columns.Item("bandMetaMargem").Visible = False

        Me.grid.Columns.Item("percPartDepto_AA").Visible = False
        Me.grid.Columns.Item("percPartDepto_AT").Visible = False

        Me.grid.Columns.Item("bandCAI_AnoAnterior").Visible = False
        Me.grid.Columns.Item("bandCAI_AnoAtual").Visible = False
        Me.grid.Columns.Item("bandMetaAg23").Visible = False


    End Sub

#Region " Grid"

    Protected Sub grid_AfterPerformCallback(sender As Object, e As ASPxGridViewAfterPerformCallbackEventArgs) Handles grid.AfterPerformCallback
        txtTipoFilial.Text = cboFilial.CallCorporacao
    End Sub

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate

        oFun.Grid_Footer_Calculate(sender, e, grid, "percDiv", "vlrDivergencia_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percAg23", "vlrAg23_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percTotalPerda", "vlrTotalPerda_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)

    End Sub

    Protected Sub grid_CustomUnboundColumnData(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDataEventArgs) Handles grid.CustomUnboundColumnData
        On Error Resume Next

        'oFun.Grid_Calculate(e, "percAtingMetaVlr", "vlrVenda_AT", "vlrVenda_meta", Funcoes.CalculateType.Growth)        '% Atingimento Meta
        oFun.Grid_Calculate(e, "percAtingMetaLucro", "vlrLucro_AT", "vlrLucro_meta", Funcoes.CalculateType.Growth)      '% Antingimento do Lucro
        oFun.Grid_Calculate(e, "difPercMargem", "percMargem_AT", "percMargem_meta", Funcoes.CalculateType.Decrease)     'Diferença de % de Margem
        oFun.Grid_Calculate(e, "difValorMeta", "vlrVenda_AT", "vlrVenda_meta", Funcoes.CalculateType.Decrease)          'Diferença valor de meta
        oFun.Grid_Calculate(e, "difValorMetaLucro", "vlrLucro_AT", "vlrLucro_meta", Funcoes.CalculateType.Decrease)     'Diferença Valor Meta de Lucro
        oFun.Grid_Calculate(e, "percCAI_AT", "vlrCAI_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)        ' Percentual CAI - AT
        oFun.Grid_Calculate(e, "percCAI_AA", "vlrCAI_AA", "vlrVenda_AA", Funcoes.CalculateType.ValueOverRevenue)        ' Percentual CAI - AA
        oFun.Grid_Calculate(e, "difValorMetaAg23", "vlrAg23_meta", "vlrAg23", Funcoes.CalculateType.Decrease)     'Diferença Valor Meta de Agenda 23
        oFun.Grid_Calculate(e, "percAtingMetaAg23", "vlrAg23_meta", "vlrAg23", Funcoes.CalculateType.Growth)      '% Antingimento da Agenda 23

        oFun.Grid_Calculate(e, "percDiv", "vlrDivergencia_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Calculate(e, "percAg23", "vlrAg23_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Calculate(e, "percTotalPerda", "vlrTotalPerda_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)

    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)
    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared

        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        On Error Resume Next
        oFun.Grid_RedIsNegative(e, "percCresc_Venda")
        oFun.Grid_RedIsNegative(e, "percAtingMetaVlr")
        oFun.Grid_RedIsNegative(e, "difPercMargem")

        oFun.Grid_RedIsNegative(e, "percCresc_Qtde")
        oFun.Grid_RedIsNegative(e, "percCresc_Lucro")

        oFun.Grid_RedIsNegative(e, "percMargem_AT")
        oFun.Grid_RedIsNegative(e, "percMargem_AA")

        oFun.Grid_RedIsNegative(e, "difValorMeta")
        oFun.Grid_RedIsNegative(e, "difValorMetaLucro")
        oFun.Grid_RedIsNegative(e, "percAtingMetaLucro")

        oFun.Grid_RedIsNegative(e, "difValorMetaAg23")
        oFun.Grid_RedIsNegative(e, "percAtingMetaAg23")
        oFun.Grid_RedIsNegative(e, "vlrLucro_AT")
        oFun.Grid_RedIsNegative(e, "vlrLucro_AA")

        oFun.Grid_RedIsNegative(e, "precoMedioCresc")
        oFun.Grid_RedIsNegative(e, "percCrescReal")

        oFun.Grid_RedIsNegative(e, "vlrDivergencia_AT")
        oFun.Grid_RedIsNegative(e, "vlrAg23_AT")
        oFun.Grid_RedIsNegative(e, "vlrTotalPerda_AT")

        oFun.Grid_RedIsNegative(e, "percDiv")
        oFun.Grid_RedIsNegative(e, "percAg23")
        oFun.Grid_RedIsNegative(e, "percTotalPerda")




    End Sub

    Protected Sub grid_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles grid.HtmlRowPrepared

        oFun.grid_RowSelectedWhole(grid, e, "descId", "Depto 1 - Mercearia", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descId", "Depto 2 - Pereciveis", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descId", "Depto 3 - Bazar", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descId", "Depto 4 - Textil", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descId", "Depto 5 - Eletro", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descId", "Total", Drawing.Color.LightGreen, True)

    End Sub

#End Region

#Region " Grid 2 "

    Protected Sub grid2_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid2.HtmlFooterCellPrepared

        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

    Protected Sub grid2_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid2.CustomSummaryCalculate

        oFun.Grid_Footer_Calculate(sender, e, grid2, "percDiv", "vlrDivergencia_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid2, "percAg23", "vlrAg23_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid2, "percTotalPerda", "vlrTotalPerda_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)

    End Sub

    Protected Sub grid2_CustomUnboundColumnData(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDataEventArgs) Handles grid2.CustomUnboundColumnData
        On Error Resume Next

        oFun.Grid_Calculate(e, "percDiv", "vlrDivergencia_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Calculate(e, "percAg23", "vlrAg23_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Calculate(e, "percTotalPerda", "vlrTotalPerda_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)

    End Sub

    Protected Sub grid2_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid2.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "vlrDivergencia_AT")
        oFun.Grid_RedIsNegative(e, "vlrAg23_AT")
        oFun.Grid_RedIsNegative(e, "vlrTotalPerda_AT")

        oFun.Grid_RedIsNegative(e, "percDiv")
        oFun.Grid_RedIsNegative(e, "percAg23")
        oFun.Grid_RedIsNegative(e, "percTotalPerda")

    End Sub

#End Region

#Region " SESSION"

    Private Sub CallSession()

        On Error Resume Next

        Session("sFILIAL") = Me.cboFilial.CallFilial
        Session("sDATA_INICIAL") = Me.cboPeriodo.CallDiaInicial
        Session("sDATA_FINAL") = Me.cboPeriodo.CallDiaFinal



        If cboPeriodo.Checked_MesmosDias = True Then
            Session("sMESMOSDIAS") = 2  'Mesmos Dias
        Else
            Session("sMESMOSDIAS") = 1  'Normal
        End If



        ' MES ANTERIOR
        If cboPeriodo.Checked_MesAnterior = True Then
            Session("sMES_ANTERIOR") = 2  'MES ANTERIOR
        Else
            Session("sMES_ANTERIOR") = 1  'ANO ANTERIOR
        End If
    End Sub

#End Region

    Private Sub Titulos()

        Dim vAno As Int16
        Dim vMes As Byte

        vAno = Session("sANO")
        vMes = Session("sMES")

        If vMes = 1 Then
            If cboPeriodo.Checked_MesAnterior = True Then
                oFun.Grid_ColumnTitle(grid, "bandAnoAnterior", MonthName(12) & " de " & vAno - 1)
                oFun.Grid_ColumnTitle(grid, "bandAnoAtual", MonthName(vMes) & " de " & vAno)
            End If
        Else
            If cboPeriodo.Checked_MesAnterior = True Then
                oFun.Grid_ColumnTitle(grid, "bandAnoAnterior", MonthName(vMes - 1) & " de " & vAno)
                oFun.Grid_ColumnTitle(grid, "bandAnoAtual", MonthName(vMes) & " de " & vAno)
            End If
        End If


        If cboPeriodo.Checked_MesAnterior = False Then
            oFun.Grid_ColumnTitle(grid, "bandAnoAnterior", "Ano Anterior " & vAno - 1)
            oFun.Grid_ColumnTitle(grid, "bandAnoAtual", "Ano Atual " & vAno)
        End If

    End Sub


    Protected Sub cbPanel2_Callback(sender As Object, e As CallbackEventArgsBase) Handles cbPanel2.Callback

        If cboFilial.CallCorporacao = 3 Then
            grid2.DataSource = DSGrid2_Item

        ElseIf cboFilial.CallCorporacao = 199 Then
            grid2.DataSource = DSGrid2

        End If

        grid2.DataBind()


    End Sub

    Protected Sub cbPanelSecao_Callback(sender As Object, e As CallbackEventArgsBase) Handles cbPanelSecao.Callback

        Session("sPRODUTO_SECAO") = lblSecao.Text

        lblInfo.Text = "sPRODUTO_SECAO: " & Session("sPRODUTO_SECAO") & " CODIGO_CORPORACAO " & cboFilial.CallCorporacao



    End Sub



    Protected Sub cpGraph_Callback(sender As Object, e As CallbackEventArgsBase) Handles cpGraph.Callback
        Session("sPRODUTO") = lblProduto.Text
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Session("sDATA_INICIAL") = Me.cboPeriodo.CallDiaInicial
        Session("sDATA_FINAL") = Me.cboPeriodo.CallDiaFinal

        lblGraph.Text = "sPRODUTO: " & Session("sPRODUTO") & " <br> CODIGO_CORPORACAO " & cboFilial.CallCorporacao & " <br> sDIA_sDATA_INICIAL: " & Session("sDATA_INICIAL") & " <br> sDATA_FINAL: " & Session("sDATA_FINAL") & " <br> sFILIAL: " & Session("sFILIAL")

        graph_item.DataBind()
    End Sub


    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        ' txtTipoFilial.Text = cboFilial.CallCorporacao
    End Sub

    Protected Sub grid_Load(sender As Object, e As EventArgs) Handles grid.Load
        txtTipoFilial.Text = cboFilial.CallCorporacao
    End Sub
End Class
