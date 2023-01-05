Imports DevExpress.Web
Imports System.Data.SqlClient
Imports System.Data

Partial Class MemberPages_appQuebras009
    Inherits System.Web.UI.Page

    Private connDW As String = clData_DW_Condor.dbConnect
    Dim oFun As New Funcoes


    Private Sub CreateSession()
        Dim varOpcao As Byte

        If Me.cboMercadologico.opcaoTotalChecked = True Then varOpcao = 1
        If Me.cboMercadologico.opcaoDeptoChecked = True Then varOpcao = 2
        If Me.cboMercadologico.opcaoSecaoChecked = True Then varOpcao = 3
        If Me.cboMercadologico.opcaoGrupoChecked = True Then varOpcao = 4
        If Me.cboMercadologico.opcaoSubgrupoChecked = True Then varOpcao = 5
        Session("sOPCAO") = varOpcao

        Session("sDIA_INICIAL") = cboPeriodo.CallDiaInicial
        Session("sDIA_FINAL") = cboPeriodo.CallDiaFinal
        Session("sMESMOSDIAS") = cboPeriodo.Checked_MesmosDias
        Session("sUSUARIO") = Page.User.Identity.Name
        Session("sFILIAL") = cboFilial.CallFilial

    End Sub

    Protected Sub cbPanelGrid_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanelGrid.Callback

        Dim oVem As New VendaEmpresaMes
        Call CreateSession()


        If Me.cboMercadologico.Visible_Depto = True Then
            Session("sDEPTO") = Me.cboMercadologico.CallDepto
        Else
            Session("sDEPTO") = 1
        End If

        If Me.cboMercadologico.Visible_Secao = True Then
            Session("sSECAO") = Me.cboMercadologico.CallSecao
        Else
            Session("sSECAO") = 1
        End If

        If Me.cboMercadologico.Visible_Grupo = True Then
            Session("sGRUPO") = Me.cboMercadologico.CallGrupo
        Else
            Session("sGRUPO") = 1
        End If

        If Me.cboMercadologico.Visible_cboSubgrupo = True Then
            Session("sSUBGRUPO") = Me.cboMercadologico.CallSubgrupo
        Else
            Session("sSUBGRUPO") = 1
        End If

        oFun.CheckBoxStatusExibir(chkMostrar_SellOut, grid, "bandSellOut")  'Mostrar Sell Out
        oFun.CheckBoxStatusExibir(chkMostrar_MargemFinal, grid, "bandMargemFinal")  'Mostrar Margem Final
        oFun.CheckBoxStatusExibir(chkMostrar_Sobras, grid, "bandAgenda51")  'Mostrar Sobras - Agenda 51
        oFun.CheckBoxStatusExibir(chkMostrar_Faltas, grid, "bandAgenda52")  'Mostrar Sobras - Agenda 52

        If Me.cboMercadologico.opcaoTotalChecked = True Then    'Total - Exibe todos os departamento
            Me.grid.DataSourceID = "dsDepto"
            Me.grid.Columns.Item("lista").Caption = "Departamento"
            Me.grid.Settings.ShowFilterRow = False
            oVem.AtualizarEstatisticaPrograma(92, User.Identity.Name)
        End If

        If Me.cboMercadologico.opcaoDeptoChecked = True Then    'Departamento - Exibe todas as seções do Departamento selecionado
            Me.grid.DataSourceID = "dsSecao"
            Me.grid.Columns.Item("lista").Caption = "Seção"
            Me.grid.Settings.ShowFilterRow = False
            oVem.AtualizarEstatisticaPrograma(151, User.Identity.Name)
        End If

        If Me.cboMercadologico.opcaoSecaoChecked = True Then    'Seção - Exibe todos os grupos da seção selecionada
            Me.grid.DataSourceID = "dsGrupo"
            Me.grid.Columns.Item("lista").Caption = "Grupo"
            Me.grid.Settings.ShowFilterRow = True
            oVem.AtualizarEstatisticaPrograma(152, User.Identity.Name)
        End If

        If Me.cboMercadologico.opcaoGrupoChecked = True Then    'Grupo - Exibe todos os subgrupos do grupo selecionado
            Me.grid.DataSourceID = "dsSubgrupo"
            Me.grid.Columns.Item("lista").Caption = "Familia"

            Me.grid.Settings.ShowFilterRow = True
            oVem.AtualizarEstatisticaPrograma(153, User.Identity.Name)
        End If

        If Me.cboMercadologico.opcaoSubgrupoChecked = True Then 'Item - Exibe todos os Itens do Subgrupo selecionado
            Me.grid.DataSourceID = "dsItem"
            Me.grid.Columns.Item("lista").Caption = "Item"
            Me.grid.Settings.ShowFilterRow = True
            oVem.AtualizarEstatisticaPrograma(154, User.Identity.Name)
        End If



        Me.grid.Visible = True
        Me.grid.DataBind()
        Me.cbPanelGrid.SettingsLoadingPanel.Delay = 0

        lblError.Visible = True
        lblError.Text = "Session Filial: " & Session("sFILIAL") & " <br> Session Dia Inicial: " & Session("sDIA_INICIAL") & " <br> Session Dia Final: " & Session("sDIA_FINAL") & " <br> Session Depto: " & Session("sDEPTO") & " <br> Session Seção: " & Session("sSECAO") & " <br> Session Grupo: " & Session("sGRUPO")
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            cboFilial.AutoPostBack = True

            oFun.Grid_Column_BorderRight(grid, "lista", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "pQ", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "V", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "pM", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "pD", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "p23", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "pMS", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "pMF", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "p51", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "p52", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(grid, "pQ_AA", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "V_AA", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "pM_AA", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "pD_AA", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "p23_AA", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "pMS_AA", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "pMF_AA", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "p51_AA", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "p52_AA", Drawing.Color.Gray, BorderStyle.Dashed, 1)



            cboPeriodo.AutoPostBack_cboDiaInicial = False
            cboPeriodo.AutoPostBack_cboDiaFinal = False
            cboFilial.AutoPostBack = False

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Análise de Quebra por Nivel de Mercadológico - PGR92"
            CType(Master.FindControl("lblTitle"), Label).ToolTip = "Analise as informações de Volume (Qtde), Venda, Lucro, Margem e Participação do Ano Atual, Ano Anterior e Mês Anterior. Há ainda informações de meta de venda e margem e ainda há o % de Crescimento da Venda, Volume e Lucro."
        End If


    End Sub

    Protected Sub grid_AfterPerformCallback(sender As Object, e As ASPxGridViewAfterPerformCallbackEventArgs) Handles grid.AfterPerformCallback

        If Me.cboMercadologico.opcaoTotalChecked = True Then    'Total - Exibe todos os departamento
            Me.grid.DataSourceID = "dsDepto"
            Me.grid.Columns.Item("lista").Caption = "Departamento"
            Me.grid.Settings.ShowFilterRow = False

        End If

        If Me.cboMercadologico.opcaoDeptoChecked = True Then    'Departamento - Exibe todas as seções do Departamento selecionado
            Me.grid.DataSourceID = "dsSecao"
            Me.grid.Columns.Item("lista").Caption = "Seção"
            Me.grid.Settings.ShowFilterRow = False

        End If

        If Me.cboMercadologico.opcaoSecaoChecked = True Then    'Seção - Exibe todos os grupos da seção selecionada
            Me.grid.DataSourceID = "dsGrupo"
            Me.grid.Columns.Item("lista").Caption = "Grupo"
            Me.grid.Settings.ShowFilterRow = False

        End If

        If Me.cboMercadologico.opcaoGrupoChecked = True Then    'Grupo - Exibe todos os subgrupos do grupo selecionado
            Me.grid.DataSourceID = "dsSubgrupo"
            Me.grid.Columns.Item("lista").Caption = "Familia"

            Me.grid.Settings.ShowFilterRow = False

        End If

        If Me.cboMercadologico.opcaoSubgrupoChecked = True Then 'Item - Exibe todos os Itens do Subgrupo selecionado
            Me.grid.DataSourceID = "dsItem"
            Me.grid.Columns.Item("lista").Caption = "Item"
            Me.grid.Settings.ShowFilterRow = True

        End If
        grid.DataBind()
    End Sub

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate

        oFun.Grid_Footer_Calculate(sender, e, grid, "pQ", "vQ", "V", Funcoes.CalculateType.ValueOverRevenue)    'Percentual Total de Margem
        oFun.Grid_Footer_Calculate(sender, e, grid, "pM", "LC", "V", Funcoes.CalculateType.ValueOverRevenue)    'Percentual De Margem
        oFun.Grid_Footer_Calculate(sender, e, grid, "p51", "v51", "V", Funcoes.CalculateType.ValueOverRevenue)    'Percentual da Agenda 51
        oFun.Grid_Footer_Calculate(sender, e, grid, "p52", "v52", "V", Funcoes.CalculateType.ValueOverRevenue)    'Percentual da Agenda 52
        oFun.Grid_Footer_Calculate(sender, e, grid, "pD", "vD", "V", Funcoes.CalculateType.ValueOverRevenue)    'Percentual da Divergencia
        oFun.Grid_Footer_Calculate(sender, e, grid, "p23", "v23", "V", Funcoes.CalculateType.ValueOverRevenue)    'Percentual da Agenda 23
        oFun.Grid_Footer_Calculate(sender, e, grid, "pMF", "LF", "V", Funcoes.CalculateType.ValueOverRevenue)    'Percentual De Margem Final
        oFun.Grid_Footer_Calculate(sender, e, grid, "pMS", "LS", "V", Funcoes.CalculateType.ValueOverRevenue)    'Percentual De Margem Sell Out

        oFun.Grid_Footer_Calculate(sender, e, grid, "pQ_AA", "vQ_AA", "V_AA", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "pM_AA", "LC_AA", "V_AA", Funcoes.CalculateType.ValueOverRevenue)    'Percentual De Margem
        oFun.Grid_Footer_Calculate(sender, e, grid, "pD_AA", "vD_AA", "V_AA", Funcoes.CalculateType.ValueOverRevenue)    'Percentual da Divergencia
        oFun.Grid_Footer_Calculate(sender, e, grid, "p23_AA", "v23_AA", "V_AA", Funcoes.CalculateType.ValueOverRevenue)    'Percentual da Agenda 23

        oFun.Grid_Footer_Calculate(sender, e, grid, "p51_AA", "v51_AA", "V_AA", Funcoes.CalculateType.ValueOverRevenue)    'Percentual da Agenda 51
        oFun.Grid_Footer_Calculate(sender, e, grid, "p52_AA", "v52_AA", "V_AA", Funcoes.CalculateType.ValueOverRevenue)    'Percentual da Agenda 52

        oFun.Grid_Footer_Calculate(sender, e, grid, "pMF_AA", "LF_AA", "V_AA", Funcoes.CalculateType.ValueOverRevenue)    'Percentual De Margem Final
        oFun.Grid_Footer_Calculate(sender, e, grid, "pMS_AA", "LS_AA", "V_AA", Funcoes.CalculateType.ValueOverRevenue)    'Percentual De Margem Sell Out

    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared
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

        oFun.Grid_RedIsNegative(e, "pQ_AA")
        oFun.Grid_RedIsNegative(e, "qQ_AA")
        oFun.Grid_RedIsNegative(e, "vQ_AA")
        oFun.Grid_RedIsNegative(e, "pD_AA")
        oFun.Grid_RedIsNegative(e, "qD_AA")
        oFun.Grid_RedIsNegative(e, "vD_AA")

        oFun.Grid_RedIsNegative(e, "p23_AA")
        oFun.Grid_RedIsNegative(e, "v23_AA")
        oFun.Grid_RedIsNegative(e, "q23_AA")
        oFun.Grid_RedIsNegative(e, "p51_AA")
        oFun.Grid_RedIsNegative(e, "v51_AA")
        oFun.Grid_RedIsNegative(e, "q51_AA")
        oFun.Grid_RedIsNegative(e, "p52_AA")
        oFun.Grid_RedIsNegative(e, "v52_AA")
        oFun.Grid_RedIsNegative(e, "q52_AA")

    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete

        If Not IsPostBack Then

            Dim depto As New Projeto

            If Me.cboFilial.IsLoja Then
                Me.cboFilial.Visible_cboCorporacao = False

                If depto.BuscarDepartamentoDoUsuario(User.Identity.Name) = "Seguranca_Prevencao" Or depto.BuscarDepartamentoDoUsuario(User.Identity.Name) = "Perdas" Then
                    oFun.Grid_Column_Visible(grid, "bandVendaMargem", False)
                    oFun.Grid_Column_Visible(grid, "bandMargemPraticada", False)
                End If

                chkMostrar_MargemFinal.Visible = False
                chkMostrar_SellOut.Visible = False
            End If
            Call CreateSession()
            Me.grid.Visible = True
            Me.grid.DataBind()
        End If

    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)
    End Sub

    Protected Sub cboExcel_BotaoClick(sender As Object, e As EventArgs) Handles cboExcel.BotaoClick

        On Error Resume Next
        If Me.cboMercadologico.opcaoTotalChecked = True Then    'Total - Exibe todos os departamento
            Me.grid.DataSourceID = "dsDepto"
            grid.DataBind()
        End If

        If Me.cboMercadologico.opcaoDeptoChecked = True Then    'Departamento - Exibe todas as seções do Departamento selecionado

            Me.grid.DataSourceID = "dsSecao"
            grid.DataBind()
        End If

        If Me.cboMercadologico.opcaoSecaoChecked = True Then    'Seção - Exibe todos os grupos da seção selecionada
            Me.grid.DataSourceID = "dsGrupo"
            grid.DataBind()
        End If

        If Me.cboMercadologico.opcaoGrupoChecked = True Then    'Grupo - Exibe todos os subgrupos do grupo selecionado
            Me.grid.DataSourceID = "dsSubgrupo"
            grid.DataBind()
        End If

        If Me.cboMercadologico.opcaoSubgrupoChecked = True Then 'Item - Exibe todos os Itens do Subgrupo selecionado
            Me.grid.DataSourceID = "dsItem"
            grid.DataBind()
        End If

    End Sub


End Class
