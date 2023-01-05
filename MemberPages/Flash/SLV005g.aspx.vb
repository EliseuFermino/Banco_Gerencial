#Region " Imports"

Imports DevExpress.Web

Imports System.Data.SqlClient
Imports System.Data

#End Region

Partial Class MemberPages_SLV_SLV005g
    Inherits System.Web.UI.Page

    Private connDW As String = clData_DW_Condor.dbConnect
    Dim oFun As New Funcoes
    Dim iProj As New Projeto


    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback

        Dim oVem As New VendaEmpresaMes
        Dim DepartamentoUsuario As String = LCase(LTrim(RTrim(iProj.BuscarDepartamentoDoUsuario(Page.User.Identity.Name))))

        CallSession()

        If DepartamentoUsuario = "comercial" Then
            Session("sTIPO_LISTA") = 1  ' Comprador
            Session("sMATRICULA") = Page.User.Identity.Name
        ElseIf DepartamentoUsuario = "gestor_comercial" Then
            Session("sTIPO_LISTA") = 2  ' Gestor_Comercial

            Session("sMATRICULA") = Page.User.Identity.Name
        Else
            Session("sTIPO_LISTA") = 0  ' Todos
        End If

        ' Se for Josue, libera todos
        If Page.User.Identity.Name = "286860" Then Session("sTIPO_LISTA") = 0 ' Todos


        oFun.CheckBoxStatusExibir(Me.chkMostrar_AA, Me.grid, "bandAnoAnterior")     'Exibir Ano Anterior
        oFun.CheckBoxStatusExibir(Me.chkMostrar_AT, Me.grid, "bandAnoAtual")    'Exibir Ano Atual
        oFun.CheckBoxStatusExibir(Me.chkMostrar_CAI, Me.grid, "bandCAI_AnoAnterior")    'Exibir CAI - Ano Anterior
        oFun.CheckBoxStatusExibir(Me.chkMostrar_CAI, Me.grid, "bandCAI_AnoAtual")    'Exibir CAI - Ano Atual

        oFun.Grid_FixHeader(Me.chkFixarCabecalho, Me.grid)

        'Exibir Sell-Out
        If Me.chkMostrar_SellOut.Checked = True Then
            oFun.Grid_Column_Visible(Me.grid, "vlrLucroSellout_AT", True)
            oFun.Grid_Column_Visible(Me.grid, "vlrLucroFinal_AT", True)
            oFun.Grid_Column_Visible(Me.grid, "percMargemSellout_AT", True)
            oFun.Grid_Column_Visible(Me.grid, "percMargemFinal_AT", True)

            oFun.Grid_Column_Visible(Me.grid, "vlrLucroSellout_AA", True)
            oFun.Grid_Column_Visible(Me.grid, "vlrLucroFinal_AA", True)
            oFun.Grid_Column_Visible(Me.grid, "percMargemSellout_AA", True)
            oFun.Grid_Column_Visible(Me.grid, "percMargemFinal_AA", True)

            'Formatar Bordas da Coluna e Rodapé
            '--------------------- ANO ATUAL ------------------------------------------------------------
            oFun.Grid_Column_BorderRight(Me.grid, "vlrVenda_AT", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(Me.grid, "vlrLucroFinal_AT", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(Me.grid, "percMargemFinal_AT", Drawing.Color.Gray, BorderStyle.Dashed, 2)
            oFun.Grid_Column_BorderRight(Me.grid, "percMargem_AT", Nothing, BorderStyle.NotSet, 1)
            oFun.Grid_Column_BorderRight(Me.grid, "percMargem_AT", Nothing, BorderStyle.NotSet, 1)

            '--------------------- ANO ANTERIOR ------------------------------------------------------------
            oFun.Grid_Column_BorderRight(Me.grid, "vlrVenda_AA", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(Me.grid, "vlrLucroFinal_AA", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(Me.grid, "percMargemFinal_AA", Drawing.Color.Gray, BorderStyle.Dashed, 2)
            oFun.Grid_Column_BorderRight(Me.grid, "percMargem_AA", Nothing, BorderStyle.NotSet, 1)

        Else
            oFun.Grid_Column_Visible(Me.grid, "vlrLucroSellout_AT", False)
            oFun.Grid_Column_Visible(Me.grid, "vlrLucroFinal_AT", False)
            oFun.Grid_Column_Visible(Me.grid, "percMargemSellout_AT", False)
            oFun.Grid_Column_Visible(Me.grid, "percMargemFinal_AT", False)

            oFun.Grid_Column_Visible(Me.grid, "vlrLucroSellout_AA", False)
            oFun.Grid_Column_Visible(Me.grid, "vlrLucroFinal_AA", False)
            oFun.Grid_Column_Visible(Me.grid, "percMargemSellout_AA", False)
            oFun.Grid_Column_Visible(Me.grid, "percMargemFinal_AA", False)

        End If

        Me.grid.Settings.ShowFilterRow = False
        ' oVem.AtualizarEstatisticaPrograma(137, User.Identity.Name)

        Call LimparGrid()
        Select Case Me.cboVisao.Value
            Case 1
                Me.grid.Visible = True
                Me.grid.DataBind()
                Call Visao1_Todas()
                oVem.AtualizarEstatisticaPrograma(188, User.Identity.Name)
            Case 2
                Me.grid.Visible = True
                Me.grid.DataBind()
                Call Visao2_Vendas()
                oVem.AtualizarEstatisticaPrograma(189, User.Identity.Name)
            Case 3
                Me.grid.Visible = True
                Me.grid.DataBind()
                Call Visao3_VendasPArticipacao()
                oVem.AtualizarEstatisticaPrograma(190, User.Identity.Name)
            Case 4
                Me.grid.Visible = True
                Me.grid.DataBind()
                Call Visao4_Volume()
                oVem.AtualizarEstatisticaPrograma(191, User.Identity.Name)
            Case 5
                Me.grid.Visible = True
                Me.grid.DataBind()
                Call Visao5_Lucro()
                oVem.AtualizarEstatisticaPrograma(192, User.Identity.Name)
            Case 6
                Me.grid.Visible = True
                Me.grid.DataBind()
                Call Visao6_LucroComSellOut()
                oVem.AtualizarEstatisticaPrograma(193, User.Identity.Name)
            Case 7
                Me.grid.Visible = True
                Me.grid.DataBind()
                Call Visao7_Margem()
                oVem.AtualizarEstatisticaPrograma(194, User.Identity.Name)
            Case 8
                Me.grid.Visible = True
                Me.grid.DataBind()
                Call Visao8_MargemComSellOut()
                oVem.AtualizarEstatisticaPrograma(195, User.Identity.Name)
            Case 9
                Me.grid.Visible = False
                Me.gridMetaVersusRealizado.Visible = True
                Me.gridMetaVersusRealizado.DataBind()
                Call Visao9_MetaVersusRealizado()
                oVem.AtualizarEstatisticaPrograma(196, User.Identity.Name)

        End Select


        Call Titulos()
        Me.cbPanel.SettingsLoadingPanel.Delay = 0

    End Sub

#Region " Page"

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then


            Dim oVem As New VendaEmpresaMes
            Dim DepartamentoUsuario As String = LCase(LTrim(RTrim(iProj.BuscarDepartamentoDoUsuario(Page.User.Identity.Name))))

            oFun.Grid_Column_BorderRight(Me.grid, "percMargemFinal_AT", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(Me.grid, "percAg23_AT", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(Me.grid, "percLucroFinal_Ag23", Drawing.Color.Gray, BorderStyle.Dashed, 1)

            cboPeriodo.Visible_MesAnterior = True
            cboPeriodo.Visible_MesmosDias = True
            CallSession()

            oFun.CheckBoxStatusExibir(Me.chkMostrar_AA, Me.grid, "bandAnoAnterior")     'Exibir Ano Anterior
            oFun.CheckBoxStatusExibir(Me.chkMostrar_AT, Me.grid, "bandAnoAtual")    'Exibir Ano Atual
            oFun.CheckBoxStatusExibir(Me.chkMostrar_CAI, Me.grid, "bandCAI_AnoAnterior")    'Exibir CAI - Ano Anterior
            oFun.CheckBoxStatusExibir(Me.chkMostrar_CAI, Me.grid, "bandCAI_AnoAtual")    'Exibir CAI - Ano Atual

            oFun.Grid_FixHeader(Me.chkFixarCabecalho, Me.grid)

            'Exibir Sell-Out
            If Me.chkMostrar_SellOut.Checked = True Then
                oFun.Grid_Column_Visible(Me.grid, "vlrLucroSellout_AT", True)
                oFun.Grid_Column_Visible(Me.grid, "vlrLucroFinal_AT", True)
                oFun.Grid_Column_Visible(Me.grid, "percMargemSellout_AT", True)
                oFun.Grid_Column_Visible(Me.grid, "percMargemFinal_AT", True)

                oFun.Grid_Column_Visible(Me.grid, "vlrLucroSellout_AA", True)
                oFun.Grid_Column_Visible(Me.grid, "vlrLucroFinal_AA", True)
                oFun.Grid_Column_Visible(Me.grid, "percMargemSellout_AA", True)
                oFun.Grid_Column_Visible(Me.grid, "percMargemFinal_AA", True)

                'Formatar Bordas da Coluna e Rodapé
                '--------------------- ANO ATUAL ------------------------------------------------------------
                oFun.Grid_Column_BorderRight(Me.grid, "vlrVenda_AT", Drawing.Color.Gray, BorderStyle.Solid, 2)
                oFun.Grid_Column_BorderRight(Me.grid, "vlrLucroFinal_AT", Drawing.Color.Gray, BorderStyle.Solid, 2)
                oFun.Grid_Column_BorderRight(Me.grid, "percMargemFinal_AT", Drawing.Color.Gray, BorderStyle.Dashed, 2)
                oFun.Grid_Column_BorderRight(Me.grid, "percMargem_AT", Nothing, BorderStyle.NotSet, 1)

                '--------------------- ANO ANTERIOR ------------------------------------------------------------
                oFun.Grid_Column_BorderRight(Me.grid, "vlrVenda_AA", Drawing.Color.Gray, BorderStyle.Solid, 2)
                oFun.Grid_Column_BorderRight(Me.grid, "vlrLucroFinal_AA", Drawing.Color.Gray, BorderStyle.Solid, 2)
                oFun.Grid_Column_BorderRight(Me.grid, "percMargemFinal_AA", Drawing.Color.Gray, BorderStyle.Dashed, 2)
                oFun.Grid_Column_BorderRight(Me.grid, "percMargem_AA", Nothing, BorderStyle.NotSet, 1)

            Else
                oFun.Grid_Column_Visible(Me.grid, "vlrLucroSellout_AT", False)
                oFun.Grid_Column_Visible(Me.grid, "vlrLucroFinal_AT", False)
                oFun.Grid_Column_Visible(Me.grid, "percMargemSellout_AT", False)
                oFun.Grid_Column_Visible(Me.grid, "percMargemFinal_AT", False)

                oFun.Grid_Column_Visible(Me.grid, "vlrLucroSellout_AA", False)
                oFun.Grid_Column_Visible(Me.grid, "vlrLucroFinal_AA", False)
                oFun.Grid_Column_Visible(Me.grid, "percMargemSellout_AA", False)
                oFun.Grid_Column_Visible(Me.grid, "percMargemFinal_AA", False)

            End If

            Me.grid.Settings.ShowFilterRow = False
            ' oVem.AtualizarEstatisticaPrograma(137, User.Identity.Name)

            Call LimparGrid()
            Select Case Me.cboVisao.Value
                Case 1
                    'Me.grid.Visible = True
                    Me.grid.DataBind()
                    Call Visao1_Todas()
                    oVem.AtualizarEstatisticaPrograma(188, User.Identity.Name)
                Case 2
                    'Me.grid.Visible = True
                    Me.grid.DataBind()
                    Call Visao2_Vendas()
                    oVem.AtualizarEstatisticaPrograma(189, User.Identity.Name)
                Case 3
                    'Me.grid.Visible = True
                    Me.grid.DataBind()
                    Call Visao3_VendasPArticipacao()
                    oVem.AtualizarEstatisticaPrograma(190, User.Identity.Name)
                Case 4
                    'Me.grid.Visible = True
                    Me.grid.DataBind()
                    Call Visao4_Volume()
                    oVem.AtualizarEstatisticaPrograma(191, User.Identity.Name)
                Case 5
                    'Me.grid.Visible = True
                    Me.grid.DataBind()
                    Call Visao5_Lucro()
                    oVem.AtualizarEstatisticaPrograma(192, User.Identity.Name)
                Case 6
                    Me.grid.Visible = True
                    Me.grid.DataBind()
                    Call Visao6_LucroComSellOut()
                    oVem.AtualizarEstatisticaPrograma(193, User.Identity.Name)
                Case 7
                    'Me.grid.Visible = True
                    Me.grid.DataBind()
                    Call Visao7_Margem()
                    oVem.AtualizarEstatisticaPrograma(194, User.Identity.Name)
                Case 8
                    'Me.grid.Visible = True
                    Me.grid.DataBind()
                    Call Visao8_MargemComSellOut()
                    oVem.AtualizarEstatisticaPrograma(195, User.Identity.Name)
                Case 9
                    Me.grid.Visible = False
                    Me.gridMetaVersusRealizado.Visible = True
                    Me.gridMetaVersusRealizado.DataBind()
                    Call Visao9_MetaVersusRealizado()
                    oVem.AtualizarEstatisticaPrograma(196, User.Identity.Name)

            End Select

            ' -----------


            If DepartamentoUsuario = "comercial" Then
                Session("sTIPO_LISTA") = 1  ' Comprador
                Session("sMATRICULA") = Page.User.Identity.Name
            ElseIf DepartamentoUsuario = "gestor_comercial" Then
                If cboFilial.CallFilial > 600 Then
                    Session("sTIPO_LISTA") = 0  ' Todas
                Else
                    Session("sTIPO_LISTA") = 2  ' Gestor_Comercial
                End If

                Session("sMATRICULA") = Page.User.Identity.Name
            Else
                Session("sTIPO_LISTA") = 0  ' Todos
            End If
            Session("sMES_ANTERIOR") = 2

            ' -----------

            Call Titulos()

            If DepartamentoUsuario = "controladoria" Then
                grid.Settings.ShowFooter = False
            Else
                grid.Settings.ShowFooter = True
            End If

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
                Me.chkMostrar_CAI.Visible = False
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
            If Me.chkMostrar_AA.Checked = True Then
                Me.grid.Columns.Item("bandAnoAnterior").Visible = True
                Me.grid.Columns.Item("Qtde_AA").Visible = True
                Me.grid.Columns.Item("vlrLucroFinal_AA").Visible = True
                Me.grid.Columns.Item("percPartDepto_AA").Visible = True
                Me.grid.Columns.Item("percMargemFinal_AA").Visible = True
                Me.grid.Columns.Item("percPart_AA").Visible = True
                Me.grid.Columns.Item("vlrVenda_AA").Visible = True
            Else
                Me.grid.Columns.Item("bandAnoAnterior").Visible = False
                Me.grid.Columns.Item("Qtde_AA").Visible = False
                Me.grid.Columns.Item("vlrLucroFinal_AA").Visible = False
                Me.grid.Columns.Item("percPartDepto_AA").Visible = False
                Me.grid.Columns.Item("percMargemFinal_AA").Visible = False
                Me.grid.Columns.Item("percPart_AA").Visible = False
                Me.grid.Columns.Item("vlrVenda_AA").Visible = False
            End If

            If Me.chkMostrar_AT.Checked = True Then
                Me.grid.Columns.Item("bandAnoAtual").Visible = True
                Me.grid.Columns.Item("Qtde_AT").Visible = True
                Me.grid.Columns.Item("vlrLucroFinal_AT").Visible = True
                Me.grid.Columns.Item("percPartDepto_AT").Visible = True
                Me.grid.Columns.Item("percMargemFinal_AT").Visible = True
                Me.grid.Columns.Item("percPart_AT").Visible = True
                Me.grid.Columns.Item("vlrVenda_AT").Visible = True
                Me.grid.Columns.Item("vlrAg23").Visible = True
            Else
                Me.grid.Columns.Item("bandAnoAtual").Visible = False
                Me.grid.Columns.Item("Qtde_AT").Visible = False
                Me.grid.Columns.Item("vlrLucroFinal_AT").Visible = False
                Me.grid.Columns.Item("percPartDepto_AT").Visible = False
                Me.grid.Columns.Item("percMargemFinal_AT").Visible = False
                Me.grid.Columns.Item("percPart_AT").Visible = False
                Me.grid.Columns.Item("vlrVenda_AT").Visible = False
                Me.grid.Columns.Item("vlrAg23").Visible = False
            End If

            If Me.chkMostrar_SellOut.Checked = True Then
                Me.grid.Columns.Item("vlrLucroSellout_AT").Visible = True
                Me.grid.Columns.Item("vlrLucroFinal_AT").Visible = True
                Me.grid.Columns.Item("percMargemSellout_AT").Visible = True
                Me.grid.Columns.Item("percMargemFinal_AT").Visible = True

                Me.grid.Columns.Item("vlrLucroSellout_AA").Visible = True
                Me.grid.Columns.Item("vlrLucroFinal_AA").Visible = True
                Me.grid.Columns.Item("percMargemSellout_AA").Visible = True
                Me.grid.Columns.Item("percMargemFinal_AA").Visible = True
            End If

            If Me.chkMostrar_CAI.Checked = True Then
                Me.grid.Columns.Item("bandCAI_AnoAnterior").Visible = True
                Me.grid.Columns.Item("bandCAI_AnoAtual").Visible = True
                Me.grid.Columns.Item("vlrCAI_AT").Visible = True
                Me.grid.Columns.Item("vlrCAI_AA").Visible = True
                Me.grid.Columns.Item("percCAI_AA").Visible = True
                Me.grid.Columns.Item("percCAI_AT").Visible = True
            Else
                Me.grid.Columns.Item("bandCAI_AnoAnterior").Visible = False
                Me.grid.Columns.Item("bandCAI_AnoAtual").Visible = False
                Me.grid.Columns.Item("vlrCAI_AT").Visible = False
                Me.grid.Columns.Item("vlrCAI_AA").Visible = False
                Me.grid.Columns.Item("percCAI_AA").Visible = False
                Me.grid.Columns.Item("percCAI_AT").Visible = False
            End If
        End If

        Me.grid.Columns.Item("percCresc_Qtde").Visible = True
        Me.grid.Columns.Item("percCresc_LucroTotal").Visible = True

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

        With Me.gridMetaVersusRealizado.Columns.Item("vlrVenda_meta").CellStyle.BorderRight
            .BorderColor = Nothing
            .BorderStyle = BorderStyle.NotSet
            .BorderWidth = 1
        End With

        With Me.gridMetaVersusRealizado.Columns.Item("vlrVenda_meta").FooterCellStyle.BorderRight
            .BorderColor = Nothing
            .BorderStyle = BorderStyle.NotSet
            .BorderWidth = 1
        End With

        With Me.gridMetaVersusRealizado.Columns.Item("percAtingMetaVlr").CellStyle.BorderRight
            .BorderColor = Drawing.Color.Gray
            .BorderStyle = BorderStyle.Solid
            .BorderWidth = 2
        End With

        With Me.gridMetaVersusRealizado.Columns.Item("percAtingMetaVlr").FooterCellStyle.BorderRight
            .BorderColor = Drawing.Color.Gray
            .BorderStyle = BorderStyle.Solid
            .BorderWidth = 2
        End With

        With Me.gridMetaVersusRealizado.Columns.Item("percMargem_AT").CellStyle.BorderRight
            .BorderColor = Nothing
            .BorderStyle = BorderStyle.NotSet
            .BorderWidth = 1
        End With

        With Me.gridMetaVersusRealizado.Columns.Item("percMargem_AT").FooterCellStyle.BorderRight
            .BorderColor = Nothing
            .BorderStyle = BorderStyle.NotSet
            .BorderWidth = 1
        End With

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
        Me.grid.Columns.Item("percCresc_LucroTotal").Visible = False
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

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate

        On Error Resume Next

        ' AA
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargem_AA", "vlrLucro_AA", "vlrVenda_AA", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemSellout_AA", "vlrLucroSellout_AA", "vlrVenda_AA", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemFinal_AA", "vlrLucroFinal_AA", "vlrVenda_AA", Funcoes.CalculateType.ValueOverRevenue)


        ' AT
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargem_AT", "vlrLucro_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemSellout_AT", "vlrLucroSellout_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemFinal_AT", "vlrLucroFinal_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)


        ' CRESCIMENTO
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCresc_Venda", "vlrVenda_AT", "vlrVenda_AA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCresc_Qtde", "Qtde_AT", "Qtde_AA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCresc_Lucro", "vlrLucroFinal_AT", "vlrLucroFinal_AA", Funcoes.CalculateType.Growth)

        ' META
        oFun.Grid_Footer_Calculate(sender, e, grid, "percAtingMetaVlr", "vlrVenda_AT", "vlrVenda_meta", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percAtingMetaLucro", "vlrLucro_AT", "vlrLucro_meta", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargem_meta", "vlrLucro_meta", "vlrVenda_meta", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "difPercMargem", "percMargem_AT", "percMargem_meta", Funcoes.CalculateType.Decrease)

        ' CAI
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCAI_AT", "vlrCAI_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCAI_AA", "vlrCAI_AA", "vlrVenda_AA", Funcoes.CalculateType.ValueOverRevenue)

        oFun.Grid_Footer_Calculate(sender, e, grid, "percCresc_LucroTotal", "vlrLucroFinal_AT", "vlrLucroFinal_AA", Funcoes.CalculateType.Growth)  '% Crescimento Lucro Final

        ' Preco Medio
        oFun.Grid_Footer_Calculate(sender, e, grid, "precoMedio_AT", "vlrVenda_AT", "Qtde_AT", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, grid, "precoMedio_AA", "vlrVenda_AA", "Qtde_AA", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, grid, "precoMedioCresc", "precoMedio_AT", "precoMedio_AA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescReal", "percCresc_Venda", "precoMedioCresc", Funcoes.CalculateType.Decrease)

        ' Meta
        oFun.Grid_Footer_Calculate(sender, e, grid, "percAtingMetaVlrG", "vlrVenda_AT", "vlrVenda_meta", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percAg23_AT", "vlrAg23", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percLucroFinal_Ag23", "vlrLucroFinal_Ag23", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)

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
        oFun.Grid_Calculate(e, "percAg23_AT", "vlrAg23", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)        ' Percentual Agenda 23 AT

        oFun.Grid_Calculate(e, "vlrLucroFinal_Ag23", "vlrLucroFinal_AT", "vlrAg23", Funcoes.CalculateType.Decrease)     'Diferença Valor Meta de Agenda 23
        oFun.Grid_Calculate(e, "percLucroFinal_Ag23", "percMargemFinal_AT", "percAg23_AT", Funcoes.CalculateType.Decrease)     'Diferença Valor Meta de Agenda 23

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
        oFun.Grid_RedIsNegative(e, "percCresc_LucroTotal")



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

#Region " Grid Meta x Realizado"

    Protected Sub gridMetaVersusRealizado_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridMetaVersusRealizado.CustomSummaryCalculate

        On Error Resume Next

     
    End Sub

    Protected Sub gridMetaVersusRealizado_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles gridMetaVersusRealizado.CustomUnboundColumnData
        On Error Resume Next
        If e.Column.FieldName = "percAtingMetaVlr" Then
            Dim vMetaVenda As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrVenda_meta"))
            Dim vRealVenda As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrVenda_AT"))
            If vRealVenda <> 0 Then
                e.Value = ((vRealVenda / vMetaVenda) * 100) - 100
            Else
                e.Value = 0
            End If
        End If

        If e.Column.FieldName = "difPercMargem" Then
            Dim vMetaPercMargem As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("percMargem_meta"))
            Dim vRealPercMargem As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("percMargem_AT"))
            If vRealPercMargem <> 0 Then
                e.Value = vRealPercMargem - vMetaPercMargem
            Else
                e.Value = 0
            End If
        End If

        If e.Column.FieldName = "difValorMeta" Then
            Dim vlrVenda_meta As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrVenda_meta"))
            Dim vlrVenda_AT As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrVenda_AT"))
            If vlrVenda_AT <> 0 Then
                e.Value = vlrVenda_AT - vlrVenda_meta
            Else
                e.Value = 0
            End If
        End If

        If e.Column.FieldName = "difValorMetaLucro" Then
            Dim vlrLucro_AT As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrLucro_AT"))
            Dim vlrLucro_meta As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrLucro_meta"))
            If vlrLucro_AT <> 0 Then
                e.Value = vlrLucro_AT - vlrLucro_meta
            Else
                e.Value = 0
            End If
        End If

        If e.Column.FieldName = "percAtingMetaLucro" Then
            Dim vlrLucro_AT As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrLucro_AT"))
            Dim vlrLucro_meta As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrLucro_meta"))
            If vlrLucro_AT <> 0 Then
                e.Value = ((vlrLucro_AT / vlrLucro_meta) * 100) - 100
            Else
                e.Value = 0
            End If
        End If

        oFun.Grid_Calculate(e, "difValorMetaAg23", "vlrAg23_meta", "vlrAg23", Funcoes.CalculateType.Decrease)     'Diferença Valor Meta de Agenda 23
        oFun.Grid_Calculate(e, "percAtingMetaAg23", "vlrAg23_meta", "vlrAg23", Funcoes.CalculateType.Growth)      '% Antingimento da Agenda 23


    End Sub

    Protected Sub gridMetaVersusRealizado_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridMetaVersusRealizado.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percAtingMetaVlr")
        oFun.Grid_RedIsNegative(e, "difPercMargem")
        oFun.Grid_RedIsNegative(e, "difValorMeta")
        oFun.Grid_RedIsNegative(e, "difValorMetaLucro")
        oFun.Grid_RedIsNegative(e, "percAtingMetaLucro")
        oFun.Grid_RedIsNegative(e, "difValorMetaAg23")
        oFun.Grid_RedIsNegative(e, "percAtingMetaAg23")

    End Sub

    Protected Sub gridMetaVersusRealizado_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gridMetaVersusRealizado.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub gridMetaVersusRealizado_HtmlRowPrepared(sender As Object, e As ASPxGridViewTableRowEventArgs) Handles gridMetaVersusRealizado.HtmlRowPrepared

        oFun.grid_RowSelectedWhole(grid, e, "descId", "Depto 1 - Mercearia", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descId", "Depto 2 - Pereciveis", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descId", "Depto 3 - Bazar", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descId", "Depto 4 - Textil", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descId", "Depto 5 - Eletro", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descId", "Total", Drawing.Color.LightGreen, True)

    End Sub

#End Region

#Region " SESSION"

    Private Sub CallSession()
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Session("sUNIDADE") = cboFilial.CallCorporacao
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

        oFun.Grid_ColumnTitle(grid, "precoMedio_AA", vAno - 1)
        oFun.Grid_ColumnTitle(grid, "precoMedio_AT", vAno)

        grid.DataBind()

    End Sub

    Protected Sub pb_DataBound(ByVal sender As Object, ByVal e As EventArgs)
        Dim progressBar As ASPxProgressBar = CType(sender, ASPxProgressBar)

        If progressBar.Position > 100 Then
            progressBar.Position = 100
        End If

        If progressBar.Position >= 100.0 Then
            progressBar.IndicatorStyle.BackColor = Drawing.Color.Green
        Else
            progressBar.IndicatorStyle.BackColor = Drawing.Color.LightCoral
        End If
    End Sub


End Class
