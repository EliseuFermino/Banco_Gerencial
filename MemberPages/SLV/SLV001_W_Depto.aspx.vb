#Region " Imports"

Imports DevExpress.Web
Imports System.Data.SqlClient

#End Region

Partial Class MemberPages_SLV_SLV001_W_Depto
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes
    Dim oFun As New Funcoes

    'Define Enum Mercadologico
    Private Enum Mercadologico As Byte
        Total = 1
        Departamento = 2
        Secao = 3
        Grupo = 4
        Subgrupo = 5
        Item = 6
    End Enum

#Region " Page"

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            If Me.cboFilial.IsLoja Then
                Me.chkMostrar_CAI.Visible = False
            Else
                Me.cboFilial.CallFilial = 3
            End If
        End If
    End Sub


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        On Error Resume Next
        If Not IsPostBack Then

            'oVem.AtualizarEstatisticaPrograma(15, User.Identity.Name)

            Me.chkFixarCabecalho.Checked = True

            Me.cboSize.Text = 100
        End If

        If popMercadologico.IsCallback Then
            'Intentionally pauses server-side processing, 
            'to demonstrate the Loading Panel functionality.

            Threading.Thread.Sleep(0)
        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Análise de Vendas por Nível de Mercadológico - PGR137"
        End If

    End Sub


#End Region

    Protected Sub popMercadologico_WindowCallback(source As Object, e As DevExpress.Web.PopupWindowCallbackArgs) Handles popMercadologico.WindowCallback
        'Me.ASPxGridView1.DataBind()
        'Me.GraficoBuscarConta_TodosAnosMes.DataBind()


        Threading.Thread.Sleep(0)
    End Sub

    Protected Sub cboSize_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged
        Dim gridWith As Int16
        Dim gridHeight As Int16

        If Me.cboSize.SelectedValue = 100 Then
            gridWith = 1000
            gridHeight = 400
        Else

            If Me.cboSize.SelectedValue = 200 Then
                gridHeight = 400 * 195 / 100
                gridWith = 1000 * 205 / 100
            ElseIf Me.cboSize.SelectedValue = 150 Then
                gridHeight = 400 * 145 / 100
                gridWith = 1000 * 157 / 100
            ElseIf Me.cboSize.SelectedValue = 170 Then
                gridHeight = 400 * 175 / 100
                gridWith = 1000 * 175 / 100
            Else
                gridHeight = 400 * Me.cboSize.SelectedValue / 100
                gridWith = 1000 * Me.cboSize.SelectedValue / 100
            End If

        End If

        Me.grid.Width = gridWith
        Me.grid.Settings.VerticalScrollableHeight = gridHeight

        Me.grid.Visible = True

    End Sub

#Region " grid"

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate
        On Error Resume Next

        oFun.Grid_Footer_Calculate(sender, e, Me.grid, "pmAT", "mAT", "vAT", Funcoes.CalculateType.ValueOverRevenue)        'Calculo da Margem Total do Ano Atual
        oFun.Grid_Footer_Calculate(sender, e, Me.grid, "pmSOAT", "mSOAT", "vAT", Funcoes.CalculateType.ValueOverRevenue)    'Calculo do Sell-Out do Ano Atual
        oFun.Grid_Footer_Calculate(sender, e, Me.grid, "pmCAT", "mCAT", "vAT", Funcoes.CalculateType.ValueOverRevenue)      'Calculo do % da Margem Cheia do Ano Atual
        oFun.Grid_Footer_Calculate(sender, e, Me.grid, "pmAA", "mAA", "vAA", Funcoes.CalculateType.ValueOverRevenue)        'Calculo do % da Margem Total do Ano Anterior
        oFun.Grid_Footer_Calculate(sender, e, Me.grid, "pmSOAA", "mSOAA", "vAA", Funcoes.CalculateType.ValueOverRevenue)    'Calculo do % de Margem Sell-Out do Ano Anterior
        oFun.Grid_Footer_Calculate(sender, e, Me.grid, "pmCAA", "mCAA", "vAA", Funcoes.CalculateType.ValueOverRevenue)      'Calculo da Margem Cheia do Ano Anterior
        oFun.Grid_Footer_Calculate(sender, e, Me.grid, "pmm", "mm", "mv", Funcoes.CalculateType.ValueOverRevenue)           'Calculo da Margem Total - Meta
        oFun.Grid_Footer_Calculate(sender, e, Me.grid, "percCresc", "vAT", "vAA", Funcoes.CalculateType.Growth)             'Calculo do Crescimento em Reais - R$
        oFun.Grid_Footer_Calculate(sender, e, Me.grid, "percCrescQtde", "qAT", "qAA", Funcoes.CalculateType.Growth)         'Calculo do Crescimento em Volume
        oFun.Grid_Footer_Calculate(sender, e, Me.grid, "percCrescLucro", "mAT", "mAA", Funcoes.CalculateType.Growth)        'Calculo do Crescimento em Lucro
        oFun.Grid_Footer_Calculate(sender, e, Me.grid, "difPercMargem", "pmAT", "pmm", Funcoes.CalculateType.Decrease)      'Calcula diferença de Margem
        oFun.Grid_Footer_Calculate(sender, e, Me.grid, "percAtingMetaVlr", "vAT", "mv", Funcoes.CalculateType.Growth)       'Calcular Atingimento de Meta em Valor
        oFun.Grid_Footer_Calculate(sender, e, Me.grid, "percCAI_AT", "cAT", "vAT", Funcoes.CalculateType.ValueOverRevenue)  'Calculo do CAI - Ano Atutal
        oFun.Grid_Footer_Calculate(sender, e, Me.grid, "percCAI_AA", "cAA", "vAA", Funcoes.CalculateType.ValueOverRevenue)  'Calculo do CAI - Ano Anterior

    End Sub

    Protected Sub grid_CustomUnboundColumnData(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDataEventArgs) Handles grid.CustomUnboundColumnData
        On Error Resume Next

        oFun.Grid_Calculate(e, "percAtingMetaVlr", "vAT", "mv", Funcoes.CalculateType.Growth)
        oFun.Grid_Calculate(e, "difPercMargem", "pmAT", "pmm", Funcoes.CalculateType.Decrease)
        oFun.Grid_Calculate(e, "pmAT", "mAT", "vAT", Funcoes.CalculateType.ValueOverRevenue)         ' Margem - percentual Ano Atual
        oFun.Grid_Calculate(e, "pmAA", "mAA", "vAA", Funcoes.CalculateType.ValueOverRevenue)         ' Margem - percentual Ano Anterior
        oFun.Grid_Calculate(e, "percCresc", "vAT", "vAA", Funcoes.CalculateType.Growth)              ' Crescimento - percentual Venda
        oFun.Grid_Calculate(e, "percCrescQtde", "qAT", "qAA", Funcoes.CalculateType.Growth)          ' Crescimento - percentual Quantidade
        oFun.Grid_Calculate(e, "percCrescLucro", "mAT", "mAA", Funcoes.CalculateType.Growth)         ' Crescimento - percentual Lucro
        oFun.Grid_Calculate(e, "percCAI_AT", "cAT", "vAT", Funcoes.CalculateType.ValueOverRevenue)      ' Percentual CAI - AT
        oFun.Grid_Calculate(e, "percCAI_AA", "cAA", "vAA", Funcoes.CalculateType.ValueOverRevenue)      ' Percentual CAI - AA

    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared

        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percCresc")
        oFun.Grid_RedIsNegative(e, "percAtingMetaVlr")
        oFun.Grid_RedIsNegative(e, "difPercMargem")
        oFun.Grid_RedIsNegative(e, "percCrescQtde")
        oFun.Grid_RedIsNegative(e, "percCrescLucro")
        oFun.Grid_RedIsNegative(e, "pmAT")
        oFun.Grid_RedIsNegative(e, "pmAA")
        oFun.Grid_RedIsNegative(e, "vAT")
        oFun.Grid_RedIsNegative(e, "vAA")
        oFun.Grid_RedIsNegative(e, "")

    End Sub

#End Region

#Region " Panel"

    Protected Sub cbPanelGrid_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanelGrid.Callback
        On Error Resume Next

        Dim varOpcao As Byte

        If Me.rdTotal.Checked = True Then varOpcao = 1
        If Me.rdDepartamento.Checked = True Then varOpcao = 2
        If Me.rdSecao.Checked = True Then varOpcao = 3
        If Me.rdGrupo.Checked = True Then varOpcao = 4
        If Me.rdSubgrupo.Checked = True Then varOpcao = 5

        oFun.Grid_FixHeader(Me.chkFixarCabecalho, Me.grid)

        CallSession(varOpcao)   'Chamar Sessões

        Me.grid.Visible = True
        Me.grid.DataBind()

        oFun.CheckBoxStatusExibir(Me.chkMostrar_AA, Me.grid, "bandAnoAnterior")     'Exibir Ano Anterior
        oFun.CheckBoxStatusExibir(Me.chkMostrar_AT, Me.grid, "bandAnoAtual")   'Exibir Ano Atual
        oFun.CheckBoxStatusExibir(Me.chkMostrar_CAI, Me.grid, "bandCAI_AnoAnterior")   'Exibir CAI - Ano Anterior
        oFun.CheckBoxStatusExibir(Me.chkMostrar_CAI, Me.grid, "bandCAI_AnoAtual")   'Exibir CAI - Ano Atual

        'Exibir Sell-Out
        SellOut_ExibirOcultar()

        If varOpcao = 1 Then AtualizarBackground("codId", False, "descId", "Departamento", False, False, 137) 'Departamento
        If varOpcao = 2 Then AtualizarBackground("codId", False, "descId", "Seção", False, False, 211) 'Seção
        If varOpcao = 3 Then AtualizarBackground("codId", False, "descId", "Grupo", False, True, 212) 'Grupo
        If varOpcao = 4 Then AtualizarBackground("codId", False, "descId", "Familia", False, True, 213) 'Subgrupo
        If varOpcao = 5 Then AtualizarBackground("codId", True, "descId", "Item", True, True, 214) 'Item

        oFun.CheckBoxStatusExibir(Me.chkMostrar_Meta, Me.grid, "bandMeta")   'Exibir Meta 

        AtualizarVisoes()  ' DEFINIR VISÕES

        If Me.rdTotal.Checked = True Then oFun.Grid_Title(grid, "Mercadológico: Total")

        If Me.rdDepartamento.Checked = True Then oFun.Grid_Title(grid, "Mercadológico: " & Session("sCAPTION_DEPTO"))

        Me.cbPanelGrid.SettingsLoadingPanel.Delay = 0

    End Sub


    Protected Sub cbPanelMercadologico_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanelMercadologico.Callback

        'Session("sUSUARIO") = Page.User.Identity.Name

        ''Total
        'If Me.rdTotal.Checked = True Then Exit Sub



        ' Departamento
        If Me.rdDepartamento.Checked = True Then
            Me.cblDepartamento.Visible = True
            AtualizarMercadologico(Me.cblDepartamento, Mercadologico.Departamento, "Temp.tblUsuarioDepto")
        End If

        ' Seção
        If Me.rdSecao.Checked = True Then
            Me.cblDepartamento.Visible = True
            Me.cblSecao.Visible = True
            AtualizarMercadologico(Me.cblDepartamento, Mercadologico.Departamento, "Temp.tblUsuarioDepto")
            AtualizarMercadologico(Me.cblSecao, Mercadologico.Secao, "Temp.tblUsuarioSecao")

        End If

        ' Grupo
        If Me.rdGrupo.Checked = True Then
            Me.cblDepartamento.Visible = True
            Me.cblSecao.Visible = True
            Me.cblGrupo.Visible = True
            AtualizarMercadologico(Me.cblDepartamento, Mercadologico.Departamento, "Temp.tblUsuarioDepto")
            AtualizarMercadologico(Me.cblSecao, Mercadologico.Secao, "Temp.tblUsuarioSecao")
            AtualizarMercadologico(Me.cblGrupo, Mercadologico.Grupo, "Temp.tblUsuarioGrupo")
        End If

        ' Subgrupo
        If Me.rdSubgrupo.Checked = True Then
            Me.cblDepartamento.Visible = True
            Me.cblSecao.Visible = True
            Me.cblGrupo.Visible = True
            Me.cblsubgrupo.Visible = True
            AtualizarMercadologico(Me.cblDepartamento, Mercadologico.Departamento, "Temp.tblUsuarioDepto")
            AtualizarMercadologico(Me.cblSecao, Mercadologico.Secao, "Temp.tblUsuarioSecao")
            AtualizarMercadologico(Me.cblGrupo, Mercadologico.Grupo, "Temp.tblUsuarioGrupo")
            AtualizarMercadologico(Me.cblsubgrupo, Mercadologico.Subgrupo, "Temp.tblUsuarioSubgrupo")
        End If


        Me.cblDepartamento.DataBind()
        Me.cblSecao.DataBind()
        Me.cblGrupo.DataBind()
        Me.cblsubgrupo.DataBind()




    End Sub

#End Region

    Private Sub SellOut_ExibirOcultar()

        If Me.chkMostrar_SellOut.Checked = True Then
            oFun.Grid_Column_Visible(Me.grid, "mSOAT", True)
            oFun.Grid_Column_Visible(Me.grid, "pmSOAT", True)
            oFun.Grid_Column_Visible(Me.grid, "mCAT", True)
            oFun.Grid_Column_Visible(Me.grid, "pmCAT", True)

            oFun.Grid_Column_Visible(Me.grid, "mSOAA", True)
            oFun.Grid_Column_Visible(Me.grid, "pmSOAA", True)
            oFun.Grid_Column_Visible(Me.grid, "mCAA", True)
            oFun.Grid_Column_Visible(Me.grid, "pmCAA", True)

            'Formatar Bordas da Coluna 
            '--------------------- ANO ATUAL ------------------------------------------------------------
            oFun.Grid_Column_BorderRight(Me.grid, "pAT", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(Me.grid, "mCAT", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(Me.grid, "pmCAT", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(Me.grid, "pmAT", Nothing, BorderStyle.NotSet, 1)

            '--------------------- ANO ANTERIOR ------------------------------------------------------------
            oFun.Grid_Column_BorderRight(Me.grid, "pAA", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(Me.grid, "mCAA", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(Me.grid, "pmCAA", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(Me.grid, "pmAA", Nothing, BorderStyle.NotSet, 1)

        Else
            oFun.Grid_Column_Visible(Me.grid, "mSOAT", False)
            oFun.Grid_Column_Visible(Me.grid, "pmSOAT", False)
            oFun.Grid_Column_Visible(Me.grid, "mCAT", False)
            oFun.Grid_Column_Visible(Me.grid, "pmCAT", False)

            oFun.Grid_Column_Visible(Me.grid, "mSOAA", False)
            oFun.Grid_Column_Visible(Me.grid, "pmSOAA", False)
            oFun.Grid_Column_Visible(Me.grid, "mCAA", False)
            oFun.Grid_Column_Visible(Me.grid, "pmCAA", False)
        End If

    End Sub

#Region " Functions"

    Private Sub ExcluirMercadologicoDoUsuario(ByVal iTipo As Byte, ByVal nomeDaTabela As String)

        Dim connection As SqlConnection = Conexao.DW_Condor_One

        Dim deleteSQL = "DELETE FROM " & nomeDaTabela & " WHERE Usuario = ('" & Page.User.Identity.Name & "')"
        Dim deleteCommand = New SqlCommand(deleteSQL, connection)

        Try
            connection.Open()
            deleteCommand.ExecuteNonQuery()
        Catch ex As Exception
            Me.lblError.Text = Err.Description
        Finally
            connection.Close()
        End Try

    End Sub

    Private Sub InserirMercadologico(ByVal ListaDeMercadologico As ASPxListBox, ByVal nomeDaTabela As String)

        Dim connection As SqlConnection = Conexao.DW_Condor_One

        For Each item In ListaDeMercadologico.SelectedValues

            Dim idMercadologico As Int16 = item.ToString

            Dim insertSQL = "INSERT INTO " & nomeDaTabela & " (Usuario,idMercadologico) VALUES ('" & Page.User.Identity.Name & "', '" & idMercadologico & "')"
            Dim insertCommand = New SqlCommand(insertSQL, connection)

            Try
                connection.Open()
                insertCommand.ExecuteNonQuery()
            Catch ex As Exception
                Me.lblError.Text = Err.Description
            Finally
                connection.Close()
            End Try

        Next
    End Sub

    Private Sub AtualizarMercadologico(ByVal ListaDeMercadologico As ASPxListBox, ByVal NumeroMercadologico As Int16, nomeDaTabela As String)
        If ListaDeMercadologico.SelectedValues.Count > 0 Then
            ExcluirMercadologicoDoUsuario(NumeroMercadologico, nomeDaTabela)
            InserirMercadologico(ListaDeMercadologico, nomeDaTabela)
        End If
    End Sub

    Private Sub AtualizarBackground(ByVal idField As String,
                                    idFieldaBoolean As Boolean, ByVal descField As String, ByVal nomeDesc As String,
                                    ByVal VerFornecedor As Boolean, ByVal VerFiltro As Boolean, ByVal NumeroDoPrograma As Int16)

        Me.grid.Columns.Item(idField).Visible = idFieldaBoolean
        Me.grid.Columns.Item(descField).Caption = nomeDesc
        Me.grid.Columns.Item("bandFornecedor").Visible = VerFornecedor
        Me.grid.Settings.ShowFilterRow = VerFiltro
        oVem.AtualizarEstatisticaPrograma(NumeroDoPrograma, User.Identity.Name)

    End Sub

#End Region

#Region " Visões"

    Private Sub LimparGrid()

        'Vendas
        oFun.Grid_Column_Visible(Me.grid, "vAA", False)
        oFun.Grid_Column_Visible(Me.grid, "vAT", False)

        'Lucro Sell-Out
        oFun.Grid_Column_Visible(Me.grid, "mSOAA", False)
        oFun.Grid_Column_Visible(Me.grid, "mSOAT", False)

        'Quantidade
        oFun.Grid_Column_Visible(Me.grid, "qAT", False)
        oFun.Grid_Column_Visible(Me.grid, "qAA", False)

        'Lucro
        oFun.Grid_Column_Visible(Me.grid, "mAT", False)
        oFun.Grid_Column_Visible(Me.grid, "mAA", False)

        'CAI
        oFun.Grid_Column_Visible(Me.grid, "cAT", False)
        oFun.Grid_Column_Visible(Me.grid, "cAA", False)
        oFun.Grid_Column_Visible(Me.grid, "percCAI_AA", False)
        oFun.Grid_Column_Visible(Me.grid, "percCAI_AT", False)

        'Percentual de margem
        oFun.Grid_Column_Visible(Me.grid, "pmAA", False)
        oFun.Grid_Column_Visible(Me.grid, "pmAT", False)

        'Participações
        oFun.Grid_Column_Visible(Me.grid, "pAA", False)
        oFun.Grid_Column_Visible(Me.grid, "pAT", False)

        'Crescimento de Vendas, Quantidade e Lucro
        oFun.Grid_Column_Visible(Me.grid, "percCresc", False)
        oFun.Grid_Column_Visible(Me.grid, "percCrescQtde", False)
        oFun.Grid_Column_Visible(Me.grid, "percCrescLucro", False)

        'Valor Lucro Cheio
        oFun.Grid_Column_Visible(Me.grid, "mCAT", False)
        oFun.Grid_Column_Visible(Me.grid, "mCAA", False)

        'Percentual Margem SellOut
        oFun.Grid_Column_Visible(Me.grid, "pmSOAT", False)
        oFun.Grid_Column_Visible(Me.grid, "pmSOAA", False)

        'Percentual Margem Cheia
        oFun.Grid_Column_Visible(Me.grid, "pmCAT", False)
        oFun.Grid_Column_Visible(Me.grid, "pmCAA", False)

        'Metas
        oFun.Grid_Column_Visible(Me.grid, "bandMeta", False)

        'Grupos
        oFun.Grid_Column_Visible(Me.grid, "bandCrescimento", False)
        oFun.Grid_Column_Visible(Me.grid, "bandCAI_AnoAnterior", False)
        oFun.Grid_Column_Visible(Me.grid, "bandCAI_AnoAtual", False)

    End Sub

    Private Sub AtualizarVisoes()
        Call LimparGrid()
        Select Case Me.cboVisao.Value
            Case 1
                Me.grid.Visible = True
                Me.grid.DataBind()
                Call Visao1_Todas()
                'oVem.AtualizarEstatisticaPrograma(188, User.Identity.Name)
            Case 2
                Me.grid.Visible = True
                Me.grid.DataBind()
                Call Visao2_Vendas()
                'oVem.AtualizarEstatisticaPrograma(189, User.Identity.Name)
            Case 3
                Me.grid.Visible = True
                Me.grid.DataBind()
                Call Visao3_VendasPArticipacao()
                'oVem.AtualizarEstatisticaPrograma(190, User.Identity.Name)
            Case 4
                Me.grid.Visible = True
                Me.grid.DataBind()
                Call Visao4_Volume()
                'oVem.AtualizarEstatisticaPrograma(191, User.Identity.Name)
            Case 5
                Me.grid.Visible = True
                Me.grid.DataBind()
                Call Visao5_Lucro()
                'oVem.AtualizarEstatisticaPrograma(192, User.Identity.Name)
            Case 6
                Me.grid.Visible = True
                Me.grid.DataBind()
                Call Visao6_LucroComSellOut()
                'oVem.AtualizarEstatisticaPrograma(193, User.Identity.Name)
            Case 7
                Me.grid.Visible = True
                Me.grid.DataBind()
                Call Visao7_Margem()
                'oVem.AtualizarEstatisticaPrograma(194, User.Identity.Name)
            Case 8
                Me.grid.Visible = True
                Me.grid.DataBind()
                Call Visao8_MargemComSellOut()
                'oVem.AtualizarEstatisticaPrograma(195, User.Identity.Name)
        End Select
    End Sub

    Private Sub Visao1_Todas()
        oFun.Grid_Column_Visible(Me.grid, "", True)
        Me.grid.Columns.Item("bandCrescimento").Visible = True

        oFun.CheckBoxStatusExibir(Me.chkMostrar_Meta, Me.grid, "bandMeta")

        If Me.chkMostrar_AA.Checked = True Then
            oFun.Grid_Column_Visible(Me.grid, "bandAnoAnterior", True)
            oFun.Grid_Column_Visible(Me.grid, "qAA", True)
            oFun.Grid_Column_Visible(Me.grid, "mAA", True)
            oFun.Grid_Column_Visible(Me.grid, "pmAA", True)
            oFun.Grid_Column_Visible(Me.grid, "pAA", True)
            oFun.Grid_Column_Visible(Me.grid, "vAA", True)
        Else
            oFun.Grid_Column_Visible(Me.grid, "bandAnoAnterior", False)
            oFun.Grid_Column_Visible(Me.grid, "qAA", False)
            oFun.Grid_Column_Visible(Me.grid, "mAA", False)
            oFun.Grid_Column_Visible(Me.grid, "pmAA", False)
            oFun.Grid_Column_Visible(Me.grid, "pAA", False)
            oFun.Grid_Column_Visible(Me.grid, "vAA", False)
        End If

        If Me.chkMostrar_AT.Checked = True Then
            oFun.Grid_Column_Visible(Me.grid, "bandAnoAtual", True)
            oFun.Grid_Column_Visible(Me.grid, "qAT", True)
            oFun.Grid_Column_Visible(Me.grid, "mAT", True)
            oFun.Grid_Column_Visible(Me.grid, "pmAT", True)
            oFun.Grid_Column_Visible(Me.grid, "pAT", True)
            oFun.Grid_Column_Visible(Me.grid, "vAT", True)
        Else
            oFun.Grid_Column_Visible(Me.grid, "bandAnoAtual", False)
            oFun.Grid_Column_Visible(Me.grid, "qAT", False)
            oFun.Grid_Column_Visible(Me.grid, "mAT", False)
            oFun.Grid_Column_Visible(Me.grid, "pmAT", False)
            oFun.Grid_Column_Visible(Me.grid, "pAT", False)
            oFun.Grid_Column_Visible(Me.grid, "vAT", False)
        End If

        If Me.chkMostrar_SellOut.Checked = True Then
            oFun.Grid_Column_Visible(Me.grid, "mSOAT", True)
            oFun.Grid_Column_Visible(Me.grid, "mCAT", True)
            oFun.Grid_Column_Visible(Me.grid, "pmSOAT", True)
            oFun.Grid_Column_Visible(Me.grid, "pmCAT", True)

            oFun.Grid_Column_Visible(Me.grid, "mSOAA", True)
            oFun.Grid_Column_Visible(Me.grid, "mCAA", True)
            oFun.Grid_Column_Visible(Me.grid, "pmSOAA", True)
            oFun.Grid_Column_Visible(Me.grid, "pmCAA", True)
        End If

        If Me.chkMostrar_CAI.Checked = True Then
            oFun.Grid_Column_Visible(Me.grid, "bandCAI_AnoAnterior", True)
            oFun.Grid_Column_Visible(Me.grid, "bandCAI_AnoAtual", True)
            oFun.Grid_Column_Visible(Me.grid, "cAT", True)
            oFun.Grid_Column_Visible(Me.grid, "cAA", True)
            oFun.Grid_Column_Visible(Me.grid, "percCAI_AA", True)
            oFun.Grid_Column_Visible(Me.grid, "percCAI_AT", True)
        Else
            oFun.Grid_Column_Visible(Me.grid, "bandCAI_AnoAnterior", False)
            oFun.Grid_Column_Visible(Me.grid, "bandCAI_AnoAtual", False)
            oFun.Grid_Column_Visible(Me.grid, "cAT", False)
            oFun.Grid_Column_Visible(Me.grid, "cAA", False)
            oFun.Grid_Column_Visible(Me.grid, "percCAI_AA", False)
            oFun.Grid_Column_Visible(Me.grid, "percCAI_AT", False)
        End If

        oFun.Grid_Column_Visible(Me.grid, "percCresc", True)
        oFun.Grid_Column_Visible(Me.grid, "percCrescQtde", True)
        oFun.Grid_Column_Visible(Me.grid, "percCrescLucro", True)

    End Sub

    Private Sub Visao2_Vendas()

        oFun.Grid_Column_Visible(Me.grid, "bandAnoAnterior", True)
        oFun.Grid_Column_Visible(Me.grid, "bandCrescimento", True)

        oFun.Grid_Column_Visible(Me.grid, "vAA", True)
        oFun.Grid_Column_Visible(Me.grid, "vAT", True)
        oFun.Grid_Column_Visible(Me.grid, "percCresc", True)

    End Sub

    Private Sub Visao3_VendasPArticipacao()

        oFun.Grid_Column_Visible(Me.grid, "bandAnoAnterior", True)
        oFun.Grid_Column_Visible(Me.grid, "bandCrescimento", True)

        oFun.Grid_Column_Visible(Me.grid, "vAA", True)
        oFun.Grid_Column_Visible(Me.grid, "vAT", True)
        oFun.Grid_Column_Visible(Me.grid, "percCresc", True)

        oFun.Grid_Column_Visible(Me.grid, "pAA", True)
        oFun.Grid_Column_Visible(Me.grid, "pAT", True)

    End Sub

    Private Sub Visao4_Volume()

        oFun.Grid_Column_Visible(Me.grid, "bandAnoAnterior", True)
        oFun.Grid_Column_Visible(Me.grid, "bandCrescimento", True)

        oFun.Grid_Column_Visible(Me.grid, "qAA", True)
        oFun.Grid_Column_Visible(Me.grid, "qAT", True)
        oFun.Grid_Column_Visible(Me.grid, "percCrescQtde", True)

    End Sub

    Private Sub Visao5_Lucro()

        oFun.Grid_Column_Visible(Me.grid, "bandAnoAnterior", True)
        oFun.Grid_Column_Visible(Me.grid, "bandCrescimento", True)

        oFun.Grid_Column_Visible(Me.grid, "mAA", True)
        oFun.Grid_Column_Visible(Me.grid, "mAT", True)
        oFun.Grid_Column_Visible(Me.grid, "percCrescLucro", True)

    End Sub

    Private Sub Visao6_LucroComSellOut()

        oFun.Grid_Column_Visible(Me.grid, "bandAnoAnterior", True)
        oFun.Grid_Column_Visible(Me.grid, "bandCrescimento", True)

        oFun.Grid_Column_Visible(Me.grid, "mAA", True)
        oFun.Grid_Column_Visible(Me.grid, "mAT", True)
        oFun.Grid_Column_Visible(Me.grid, "percCrescLucro", True)

        oFun.Grid_Column_Visible(Me.grid, "mSOAA", True)
        oFun.Grid_Column_Visible(Me.grid, "mSOAT", True)

        oFun.Grid_Column_Visible(Me.grid, "mCAA", True)
        oFun.Grid_Column_Visible(Me.grid, "mCAT", True)

        oFun.Grid_Column_BorderRight(Me.grid, "mCAT", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(Me.grid, "mCAA", Drawing.Color.Gray, BorderStyle.Solid, 2)

    End Sub

    Private Sub Visao7_Margem()

        oFun.Grid_Column_Visible(Me.grid, "bandAnoAnterior", True)
        oFun.Grid_Column_Visible(Me.grid, "bandCrescimento", False)

        oFun.Grid_Column_Visible(Me.grid, "pmAA", True)
        oFun.Grid_Column_Visible(Me.grid, "pmAT", True)


    End Sub

    Private Sub Visao8_MargemComSellOut()

        oFun.Grid_Column_Visible(Me.grid, "bandAnoAnterior", True)
        oFun.Grid_Column_Visible(Me.grid, "bandCrescimento", False)

        oFun.Grid_Column_Visible(Me.grid, "pmAA", True)
        oFun.Grid_Column_Visible(Me.grid, "pmAT", True)

        oFun.Grid_Column_Visible(Me.grid, "pmSOAA", True)
        oFun.Grid_Column_Visible(Me.grid, "pmCAA", True)

        oFun.Grid_Column_Visible(Me.grid, "pmSOAT", True)
        oFun.Grid_Column_Visible(Me.grid, "pmCAT", True)

        oFun.Grid_Column_BorderRight(Me.grid, "pmAA", Nothing, BorderStyle.NotSet, 1)
        oFun.Grid_Column_BorderRight(Me.grid, "pmAT", Nothing, BorderStyle.NotSet, 1)
        oFun.Grid_Column_BorderRight(Me.grid, "pmCAA", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(Me.grid, "pmCAT", Drawing.Color.Gray, BorderStyle.Solid, 2)

    End Sub

#End Region

#Region " SESSION"

    Private Sub CallSession(ByVal iOpcao As Byte)
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Session("sDATA_INICIAL") = Me.cboPeriodo.CallDiaInicial
        Session("sDATA_FINAL") = Me.cboPeriodo.CallDiaFinal
        Session("sOPCAO") = iOpcao
        Session("sUSUARIO") = Page.User.Identity.Name

        If Me.chkMostrar_MesmosDias.Checked = True Then
            Session("sMESMOSDIAS") = 2  'Mesmos Dias
        Else
            Session("sMESMOSDIAS") = 1  'Normal
        End If

    End Sub

#End Region



End Class
