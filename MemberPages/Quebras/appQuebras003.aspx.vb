Imports DevExpress.Web
Imports System.Data.SqlClient
Imports System.Data

Partial Class MemberPages_appQuebras003
    Inherits System.Web.UI.Page

    Private connDW As String = clData_DW_Condor.dbConnect
    Dim oFun As New Funcoes

    Private Sub CreateSession(ByVal iOpcao As Byte)

        Session("sFILIAL") = cboFilial.CallFilial
        Session("sOPCAO") = iOpcao
        Session("sDIA_INICIAL") = cboPeriodo.CallDiaInicial
        Session("sDIA_FINAL") = cboPeriodo.CallDiaFinal
        Session("sMESMOSDIAS") = cboPeriodo.Checked_MesmosDias
        Session("sUSUARIO") = Page.User.Identity.Name
    End Sub

    Protected Sub cbPanelGrid_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanelGrid.Callback
        On Error Resume Next
        Dim oVem As New VendaEmpresaMes

        'Me.grid.Columns("descProdutoGrupoLista").Visible = False
        'Me.grid.Columns("lista").Visible = False         

       

        If cboMercadologico.Checked_rdTotal = True Then
            Me.grid.DataSourceID = "dsTotal"
            If chkPorFornecedor.Checked = True Then
                Me.grid.Columns.Item("lista").Caption = "Fornecedor"
                chkFornecedor_Hide(False)
            Else
                Me.grid.Columns.Item("lista").Caption = "Itens Geral"
                chkFornecedor_Hide(True)
            End If

            oVem.AtualizarEstatisticaPrograma(108, User.Identity.Name)
        End If

        If cboMercadologico.Checked_rdDepartamento = True Then
            oVem.AtualizarEstatisticaPrograma(107, User.Identity.Name)
            Me.grid.DataSourceID = "dsDepto"
            If chkPorFornecedor.Checked = True Then
                Me.grid.Columns.Item("lista").Caption = "Fornecedor"
                chkFornecedor_Hide(False)
            Else
                Me.grid.Columns.Item("lista").Caption = "Itens do Departamento"
                chkFornecedor_Hide(True)
            End If

            oFun.Grid_Title(grid, "Itens do Departamento " & Session("sNOME_MERCADOLOGICO"))
        End If

        If cboMercadologico.Checked_rdSecao = True Then
            oVem.AtualizarEstatisticaPrograma(155, User.Identity.Name)
            Me.grid.DataSourceID = "dsSecao"
            If chkPorFornecedor.Checked = True Then
                Me.grid.Columns.Item("lista").Caption = "Fornecedor"
                chkFornecedor_Hide(False)
            Else
                Me.grid.Columns.Item("lista").Caption = "Itens da Seção"
                chkFornecedor_Hide(True)
            End If

            oFun.Grid_Title(grid, "Itens da Seção " & Session("sNOME_MERCADOLOGICO"))
        End If

        If cboMercadologico.Checked_rdGrupo = True Then
            oVem.AtualizarEstatisticaPrograma(156, User.Identity.Name)
            Me.grid.DataSourceID = "dsGrupo"
            If chkPorFornecedor.Checked = True Then
                Me.grid.Columns.Item("lista").Caption = "Fornecedor"
                chkFornecedor_Hide(False)
            Else
                Me.grid.Columns.Item("lista").Caption = "Itens do Grupo"
                chkFornecedor_Hide(True)
            End If
            oFun.Grid_Title(grid, "Itens do Grupo " & Session("sNOME_MERCADOLOGICO"))
        End If

        If cboMercadologico.Checked_rdSubgrupo = True Then
            oVem.AtualizarEstatisticaPrograma(157, User.Identity.Name)
            Me.grid.DataSourceID = "dsSubgrupo"
            If chkPorFornecedor.Checked = True Then
                Me.grid.Columns.Item("lista").Caption = "Fornecedor"
                chkFornecedor_Hide(False)
            Else
                Me.grid.Columns.Item("lista").Caption = "Itens do Sub-Grupo"
                chkFornecedor_Hide(True)
            End If

            oFun.Grid_Title(grid, "Itens do Subgrupo " & Session("sNOME_MERCADOLOGICO"))
        End If

        Call CreateSession(Session("sOPCAO"))

        If chkPorFornecedor.Checked = True Then
            Session("sFORNECEDOR") = 1
        Else
            Session("sFORNECEDOR") = 0
        End If

        oFun.CheckBoxStatusExibir(chkMostrar_SellOut, grid, "bandSellOut")  'Mostrar Sell Out
        oFun.CheckBoxStatusExibir(chkMostrar_MargemFinal, grid, "bandMargemFinal")  'Mostrar Margem Final
        oFun.CheckBoxStatusExibir(chkMostrar_Sobras, grid, "bandAgenda51")  'Mostrar Sobras - Agenda 51
        oFun.CheckBoxStatusExibir(chkMostrar_Faltas, grid, "bandAgenda52") 'Mostrar Sobras - Agenda 52

        Me.grid.DataBind()
        Me.grid.Visible = True
        Me.cbPanelGrid.SettingsLoadingPanel.Delay = 0

        lblError.Visible = True

        lblError.Text = ""
        'lblError.Text = "Session('sMERCADOLOGICO') " & Session("sMERCADOLOGICO") & " <br /> " &
        '                "Session('sOPCAO') " & Session("sOPCAO") & " <br /> " &
        '                "Session('sFILIAL') " & Session("sFILIAL") & " <br /> " &
        '                "Session('sDATA_INICIAL') " & Session("sDIA_INICIAL") & " <br /> " &
        '                "Session('sDATA_FINAL') " & Session("sDIA_FINAL") & " <br /> " &
        '                "DataBind " & grid.DataSourceID.ToString()


        

    End Sub

    
    Private Sub chkFornecedor_Hide(ByVal iHide As Boolean)
        oFun.Grid_Column_Visible(grid, "Ativo", iHide)
        oFun.Grid_Column_Visible(grid, "bandFornecedor", iHide)
        oFun.Grid_Column_Visible(grid, "bandMercadologico", iHide)
    End Sub

#Region " Grid"

    Protected Sub grid_AfterPerformCallback(sender As Object, e As ASPxGridViewAfterPerformCallbackEventArgs) Handles grid.AfterPerformCallback
        

        If cboMercadologico.Checked_rdTotal = True Then    'Total - Exibe todos os departamento
            Me.grid.DataSourceID = "dsTotal"
            Me.grid.Columns.Item("lista").Caption = "Total"
            'Me.grid.Settings.ShowFilterRow = False
        End If

            If cboMercadologico.Checked_rdDepartamento = True Then    'Total - Exibe todos os departamento
                Me.grid.DataSourceID = "dsDepto"
                Me.grid.Columns.Item("lista").Caption = "Departamento"
                ' Me.grid.Settings.ShowFilterRow = False
            End If

            If cboMercadologico.Checked_rdSecao = True Then    'Departamento - Exibe todas as seções do Departamento selecionado
                Me.grid.DataSourceID = "dsSecao"
                Me.grid.Columns.Item("lista").Caption = "Seção"
                'Me.grid.Settings.ShowFilterRow = False

            End If

            If cboMercadologico.Checked_rdGrupo = True Then    'Seção - Exibe todos os grupos da seção selecionada
                Me.grid.DataSourceID = "dsGrupo"
                Me.grid.Columns.Item("lista").Caption = "Grupo"
                'Me.grid.Settings.ShowFilterRow = False

            End If

            If cboMercadologico.Checked_rdSubgrupo = True Then    'Grupo - Exibe todos os subgrupos do grupo selecionado
                Me.grid.DataSourceID = "dsSubgrupo"
                Me.grid.Columns.Item("lista").Caption = "Familia"

                'Me.grid.Settings.ShowFilterRow = False

            End If

            Call CreateSession(Session("sOPCAO"))
            grid.DataBind()

        grid.Visible = True

    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared
        On Error Resume Next
        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "p23")
        oFun.Grid_RedIsNegative(e, "pD")
        oFun.Grid_RedIsNegative(e, "qD")
        oFun.Grid_RedIsNegative(e, "vD")
        oFun.Grid_RedIsNegative(e, "qQ")
        oFun.Grid_RedIsNegative(e, "vQ")
        oFun.Grid_RedIsNegative(e, "v23")
        oFun.Grid_RedIsNegative(e, "v52")
        oFun.Grid_RedIsNegative(e, "q23")
        oFun.Grid_RedIsNegative(e, "q52")
        oFun.Grid_RedIsNegative(e, "pQ")
        oFun.Grid_RedIsNegative(e, "p52")
        oFun.Grid_RedIsNegative(e, "p51")

    End Sub

#End Region

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            cboFilial.AutoPostBack = False
            cboPeriodo.AutoPostBack_cboDiaInicial = False
            cboPeriodo.AutoPostBack_cboDiaFinal = False
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Ánalise de Perdas por Item - PGR107"
        End If

    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete

        If Not IsPostBack Then

            Session("sMERCADOLOGICO") = 0

            If Me.cboFilial.IsLoja Then

                oFun.Grid_Column_Visible(grid, "bandVendaMargem", False)
                oFun.Grid_Column_Visible(grid, "bandMargemPraticada", False)
                oFun.Grid_Column_Visible(grid, "bandSellOut", False)
                oFun.Grid_Column_Visible(grid, "bandMargemFinal", False)

                chkMostrar_MargemFinal.Visible = False
                chkMostrar_SellOut.Visible = False

            End If
            Call CreateSession(1)
            'Me.grid.DataSourceID = "dsTotal"
            'Me.grid.Visible = True
            'Me.grid.DataBind()
        End If

    End Sub

#End Region

    Protected Sub grid_HtmlRowPrepared(sender As Object, e As ASPxGridViewTableRowEventArgs) Handles grid.HtmlRowPrepared

        If e.RowType <> GridViewRowType.Data Then
            Return
        End If

        Dim NomeColuna As String = Convert.ToString(e.GetValue("lista"))
        If NomeColuna = "Empresa Total" Then
            e.Row.BackColor = System.Drawing.Color.LightGreen
            e.Row.Font.Bold = True
        End If

    End Sub



    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate

        oFun.Grid_Footer_Calculate(sender, e, grid, "pQ", "vQ", "V", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "pM", "LC", "V", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "pD", "vD", "V", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "p23", "v23", "V", Funcoes.CalculateType.ValueOverRevenue)

        'oFun.Grid_Footer_Calculate(sender, e, grid, "pMS", "LS", "V", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "pMF", "LT", "V", Funcoes.CalculateType.ValueOverRevenue)
    End Sub


    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)
    End Sub

    Protected Sub btnExcel_BotaoClick(sender As Object, e As EventArgs) Handles btnExcel.BotaoClick
        If cboMercadologico.Checked_rdTotal = True Then    'Total - Exibe todos os departamento
            Me.grid.DataSourceID = "dsTotal"
        End If

        If cboMercadologico.Checked_rdDepartamento = True Then    'Departamento - Exibe todas as seções do Departamento selecionado
            Me.grid.DataSourceID = "dsDepto"
        End If

        If cboMercadologico.Checked_rdSecao = True Then    'Seção - Exibe todos os grupos da seção selecionada
            Me.grid.DataSourceID = "dsSecao"
        End If

        If cboMercadologico.Checked_rdGrupo = True Then    'Grupo - Exibe todos os subgrupos do grupo selecionado
            Me.grid.DataSourceID = "dsGrupo"
        End If

        If cboMercadologico.Checked_rdSubgrupo = True Then    'Grupo - Exibe todos os subgrupos do grupo selecionado
            Me.grid.DataSourceID = "dsSubgrupo"
        End If
    End Sub



End Class
