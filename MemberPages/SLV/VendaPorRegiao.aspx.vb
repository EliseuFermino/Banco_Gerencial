
#Region " Imports"

Imports DevExpress.Web
Imports System.Data.SqlClient

#End Region

Partial Class MemberPages_SLV_VendaPorRegiao
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes
    Dim oFun As New Funcoes
    Dim oProj As New Projeto

    'Define Enum Mercadologico
    Private Enum Mercadologico As Byte
        Total = 1
        Departamento = 2
        Secao = 3
        Grupo = 4
        Subgrupo = 5
        Item = 6
    End Enum


    Protected Sub cbPanelGrid_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback
        On Error Resume Next

        Dim varOpcao As Byte
        If cboMercadologico.Checked_rdTotal = True Then varOpcao = 1
        If cboMercadologico.Checked_rdDepartamento = True Then varOpcao = 2
        If cboMercadologico.Checked_rdSecao = True Then varOpcao = 3
        If cboMercadologico.Checked_rdGrupo = True Then varOpcao = 4
        If cboMercadologico.Checked_rdSubgrupo = True Then varOpcao = 5

        CallSession(varOpcao)   'Chamar Sessões

        Me.grid.Visible = True
        Me.grid.DataBind()

        'oFun.CheckBoxStatusExibir(Me.chkMostrar_AA, Me.grid, "bandAnoAnterior")     'Exibir Ano Anterior
        'oFun.CheckBoxStatusExibir(Me.chkMostrar_AT, Me.grid, "bandAnoAtual")   'Exibir Ano Atual
        'oFun.CheckBoxStatusExibir(Me.chkMostrar_CAI, Me.grid, "bandCAI_AnoAnterior")   'Exibir CAI - Ano Anterior
        'oFun.CheckBoxStatusExibir(Me.chkMostrar_CAI, Me.grid, "bandCAI_AnoAtual")   'Exibir CAI - Ano Atual

        'Exibir Sell - Out
        'SellOut_ExibirOcultar()

        If varOpcao = 1 Then
            AtualizarBackground("Ranking por Total", 398)
            oFun.Grid_Column_Visible(grid, "bandMetas", True)
        End If


        If varOpcao = 2 Then
            AtualizarBackground("Ranking por Departamento: " & Session("sNOME_MERCADOLOGICO"), 216)
            oFun.Grid_Column_Visible(grid, "bandMetas", True)
        End If

        If varOpcao = 3 Then
            AtualizarBackground("Ranking por Seção: " & Session("sNOME_MERCADOLOGICO"), 217)
            oFun.Grid_Column_Visible(grid, "bandMetas", True)
        End If

        If varOpcao = 4 Then
            AtualizarBackground("Ranking por Grupo: " & Session("sNOME_MERCADOLOGICO"), 218)
            oFun.Grid_Column_Visible(grid, "bandMetas", False)
        End If

        If varOpcao = 5 Then
            AtualizarBackground("Ranking por Familia: " & Session("sNOME_MERCADOLOGICO"), 219)
            oFun.Grid_Column_Visible(grid, "bandMetas", False)
        End If

        'If varOpcao = 6 Then AtualizarBackground("Ranking por Item: " & Session("sNOME_MERCADOLOGICO"), 220) 'por Item

        AlterarLegenda()


        Me.cbPanel.SettingsLoadingPanel.Delay = 0

        'lblError.Text = Session("sMERCADOLOGICO")

    End Sub

    Private Sub AtualizarBackground(ByVal nomeDoTitulo As String, ByVal NumeroDoPrograma As Int16)

        oFun.Grid_Title(Me.grid, nomeDoTitulo)
        oVem.AtualizarEstatisticaPrograma(NumeroDoPrograma, User.Identity.Name)

    End Sub


#Region " SESSION"

    Private Sub CallSession(ByVal iOpcao As Byte)
        Session("sDIA_INICIAL") = Me.cboDia.CallDiaInicial
        Session("sDIA_FINAL") = Me.cboDia.CallDiaFinal
        Session("sOPCAO") = iOpcao
        Session("sMESMOS") = cboDia.Checked_MesmosDias


        'If Me.chkMostrar_MesmosDias.Checked = True Then
        '    Session("sMESMOSDIAS") = 2  'Mesmos Dias
        'Else
        '    Session("sMESMOSDIAS") = 1  'Normal
        'End If

    End Sub

#End Region

#Region " grid"

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate
        On Error Resume Next
        oFun.Grid_Footer_Calculate(sender, e, Me.grid, "percCresc", "vlrVendaAT", "vlrVendaAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, Me.grid, "percCrescClientes", "numClienteAT", "numClienteAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, Me.grid, "percCrescClientes_Clube", "numClienteAT_Clube", "numClienteAA_Clube", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, Me.grid, "perc_Ating", "vlrVendaAT", "vlrMetaVenda", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, Me.grid, "percConclusao", "vlrVendaAT", "vlrMetaVenda", Funcoes.CalculateType.ValueOverRevenue)

    End Sub

    Protected Sub grid_ExportRenderBrick(sender As Object, e As ASPxGridViewExportRenderingEventArgs) Handles grid.ExportRenderBrick
        AlterarLegenda()
    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "comparacao")
        oFun.Grid_RedIsNegative(e, "difValor")
        oFun.Grid_RedIsNegative(e, "percCresc")
        oFun.Grid_RedIsNegative(e, "difValorClientes")
        oFun.Grid_RedIsNegative(e, "percCrescClientes")

        oFun.Grid_RedIsNegative(e, "difValorClientes_Clube")
        oFun.Grid_RedIsNegative(e, "percCrescClientes_Clube")
        oFun.Grid_RedIsNegative(e, "perc_Ating")
        oFun.Grid_RedIsNegative(e, "difMetaVenda_Real")
    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared

        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

#End Region

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim gridDetail As ASPxGridView = TryCast(sender, ASPxGridView)
        If Not IsPostBack Then
            cboDia.Visible_MesmosDias = True
            cboMercadologico.Checked_rdTotal = True
            Session("sOPCAO") = 1   'Total
            Session("sMERCADOLOGICO") = 1   'Total
            Session("sMESMOS") = 0   'Total
            CallSession(1)   'Chamar Sessões
            Me.grid.Visible = True
            AlterarLegenda()
            AtualizarBackground("Ranking por Total", 398)
            Me.grid.DataBind()
            oVem.AtualizarEstatisticaPrograma(398, User.Identity.Name)

            oFun.Grid_Column_BorderLeft(grid, "vlrMetaVenda", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(grid, "vlrMetaVenda", Drawing.Color.LightGray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "percPart_VendaMeta", Drawing.Color.LightGray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "difMetaVenda_Real", Drawing.Color.LightGray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "perc_Ating", Drawing.Color.LightGray, BorderStyle.Solid, 1)

            oFun.Grid_Column_BorderRight(grid, "vlrVendaAA", Drawing.Color.LightGray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "vlrVendaAT", Drawing.Color.LightGray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "difValor", Drawing.Color.LightGray, BorderStyle.Solid, 1)

            oFun.Grid_Column_BorderRight(grid, "numClienteAA", Drawing.Color.LightGray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "difValorClientes", Drawing.Color.LightGray, BorderStyle.Solid, 1)

            oFun.Grid_Column_BorderRight(grid, "numClienteAA_Clube", Drawing.Color.LightGray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "difValorClientes_Clube", Drawing.Color.LightGray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "percCrescClientes_Clube", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(grid, "percPart_VendaReal", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percConclusao", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(grid, "percCresc", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percCrescClientes", Drawing.Color.Gray, BorderStyle.Solid, 2)


            oFun.Grid_Column_BorderRight(grid, "numClienteAT", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "numClienteAT_Clube", Drawing.Color.Gray, BorderStyle.Dashed, 1)

            oProj.BuscarLocalDoUsuario(Page.User.Identity.Name)
            If oProj.Isloja = True Then oFun.Grid_Column_Visible(grid, "bandVendas", False)
            If oProj.IsRegional = True Then oFun.Grid_Column_Visible(grid, "bandVendas", False)

            cboMercadologico.Visible_rdGrupo = True
            cboMercadologico.Visible_rdSubgrupo = True

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Comparativo de Vendas por Região e Regional - PGR398"
        End If
    End Sub

    Private Sub AlterarLegenda()
        Dim myAno As Int16
        myAno = Year(cboDia.CallDiaFinal)
        oFun.Grid_ColumnTitle(grid, "vlrVendaAA", myAno - 1)
        oFun.Grid_ColumnTitle(grid, "vlrVendaAT", myAno)

        oFun.Grid_ColumnTitle(grid, "numClienteAA", myAno - 1)
        oFun.Grid_ColumnTitle(grid, "numClienteAT", myAno)

        oFun.Grid_ColumnTitle(grid, "numClienteAA_Clube", myAno - 1)
        oFun.Grid_ColumnTitle(grid, "numClienteAT_Clube", myAno)

        oFun.Grid_ColumnTitle(grid, "posRnkAA", myAno - 1)
        oFun.Grid_ColumnTitle(grid, "posRnkAT", myAno)

        oFun.Grid_ColumnTitle(grid, "comparacao", "Comparação Evolução Rank. Ano " & myAno)
        oFun.Grid_ColumnTitle(grid, "bandComparacao", "Evolução " & myAno & " x " & myAno - 1)
    End Sub

#End Region



   

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
