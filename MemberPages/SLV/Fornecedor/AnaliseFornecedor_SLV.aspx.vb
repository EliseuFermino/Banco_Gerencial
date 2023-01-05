


#Region " Imports"

Imports DevExpress.Web
Imports System.Data.SqlClient

#End Region


Partial Class MemberPages_SLV_Fornecedor_AnaliseFornecedor_SLV
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes
    Dim oFun As New Funcoes



#Region " Panel"

    Protected Sub cbPanelGrid_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanelGrid.Callback
        On Error Resume Next

        CallSession()

        Me.grid.Visible = True
        Me.grid.DataBind()

        'oFun.CheckBoxStatusExibir(Me.chkMostrar_AA, Me.grid, "bandAnoAnterior")     'Exibir Ano Anterior
        'oFun.CheckBoxStatusExibir(Me.chkMostrar_AT, Me.grid, "bandAnoAtual")   'Exibir Ano Atual
        'oFun.CheckBoxStatusExibir(Me.chkMostrar_CAI, Me.grid, "bandCAI_AnoAnterior")   'Exibir CAI - Ano Anterior
        'oFun.CheckBoxStatusExibir(Me.chkMostrar_CAI, Me.grid, "bandCAI_AnoAtual")   'Exibir CAI - Ano Atual

        'Exibir Sell - Out
        'SellOut_ExibirOcultar()

        IniciarDados()

        Me.cbPanelGrid.SettingsLoadingPanel.Delay = 0

        'lblError.Text = "sDIA_INICIAL: " & Session("sDIA_INICIAL") & " sDIA_FINAL: " & Session("sDIA_FINAL") & " sCNPJ: " & Session("sCNPJ") & " sMERCADOLOGICO: " & Session("sMERCADOLOGICO") & " sOPCAO: " & Session("sOPCAO")
    End Sub


#End Region

    Private Sub IniciarDados()
        If Session("sOPCAO") = 1 Then AtualizarBackground("Ranking por Total", 215)
        If Session("sOPCAO") = 2 Then AtualizarBackground("Ranking por Departamento: " & Session("sNOME_MERCADOLOGICO"), 216)
        If Session("sOPCAO") = 3 Then AtualizarBackground("Ranking por Seção: " & Session("sNOME_MERCADOLOGICO"), 217)
        If Session("sOPCAO") = 4 Then AtualizarBackground("Ranking por Grupo: " & Session("sNOME_MERCADOLOGICO"), 218)
        If Session("sOPCAO") = 5 Then AtualizarBackground("Ranking por Familia: " & Session("sNOME_MERCADOLOGICO"), 219)
        'If varOpcao = 6 Then AtualizarBackground("Ranking por Item: " & Session("sNOME_MERCADOLOGICO"), 220) 'por Item

        oFun.Grid_FixHeader(Me.chkFixarCabecalho, Me.grid)

        oFun.Grid_Column_BorderRight(grid, "nomeFornecedor", Drawing.Color.Gray, BorderStyle.Solid, 1)
        oFun.Grid_Column_BorderRight(grid, "posRnkAT", Drawing.Color.Gray, BorderStyle.Solid, 1)
        oFun.Grid_Column_BorderRight(grid, "percPartAT", Drawing.Color.Gray, BorderStyle.Solid, 1)
        oFun.Grid_Column_BorderRight(grid, "percCrescQtde", Drawing.Color.Gray, BorderStyle.Solid, 1)
        oFun.Grid_Column_BorderRight(grid, "percCrescVenda", Drawing.Color.Gray, BorderStyle.Solid, 1)
        oFun.Grid_Column_BorderRight(grid, "percCrescLucroComercial", Drawing.Color.Gray, BorderStyle.Solid, 1)
        oFun.Grid_Column_BorderRight(grid, "percCrescLucroSellOut", Drawing.Color.Gray, BorderStyle.Solid, 1)

        AlterarLegenda()
    End Sub

#Region " Functions"

    Private Sub AtualizarBackground(ByVal nomeDoTitulo As String, ByVal NumeroDoPrograma As Int16)

        oFun.Grid_Title(Me.grid, nomeDoTitulo)
        oVem.AtualizarEstatisticaPrograma(NumeroDoPrograma, User.Identity.Name)

    End Sub

#End Region

#Region " SESSION"

    Private Sub CallSession()
        Session("sDIA_INICIAL") = Me.cboDia.CallDiaInicial
        Session("sDIA_FINAL") = Me.cboDia.CallDiaFinal
        Session("sCNPJ") = 1
    End Sub

#End Region

#Region " grid"

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate
        On Error Resume Next
        oFun.Grid_Footer_Calculate(sender, e, Me.grid, "percCresc", "vlrVendaAT", "vlrVendaAA", Funcoes.CalculateType.Growth)

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "vlrLucroComercialAA")
        oFun.Grid_RedIsNegative(e, "vlrLucroComercialAT")
        oFun.Grid_RedIsNegative(e, "percCrescQtde")
        oFun.Grid_RedIsNegative(e, "percCrescVenda")
        oFun.Grid_RedIsNegative(e, "percCrescLucroComercial")
        oFun.Grid_RedIsNegative(e, "percCrescLucroSellOut")
        oFun.Grid_RedIsNegative(e, "percMargemCheiaAA")

    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared

        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

#End Region

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            oFun.Grid_FixHeader(Me.chkFixarCabecalho, Me.grid)
            cboMercadologico.Checked_rdTotal = True
            'Session("sOPCAO") = 1   'Total
            'Session("sMERCADOLOGICO") = 1   'Total
            Me.grid.Visible = True
            AlterarLegenda()
            AtualizarBackground("Ranking por Total", 215)
            Me.grid.DataBind()
            oVem.AtualizarEstatisticaPrograma(215, User.Identity.Name)
            IniciarDados()
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Comparativo de Vendas e Ranking - PGR215"
        End If
    End Sub

    Private Sub AlterarLegenda()
        Dim myAno As Int16
        myAno = Year(cboDia.CallDiaFinal)

        oFun.Grid_ColumnTitle(grid, "QtdeAA", myAno - 1)
        oFun.Grid_ColumnTitle(grid, "QtdeAT", myAno)

        oFun.Grid_ColumnTitle(grid, "vlrVendaAA", myAno - 1)
        oFun.Grid_ColumnTitle(grid, "vlrVendaAT", myAno)

        oFun.Grid_ColumnTitle(grid, "vlrLucroComercialAA", myAno - 1)
        oFun.Grid_ColumnTitle(grid, "vlrLucroComercialAT", myAno)

        oFun.Grid_ColumnTitle(grid, "vlrLucroSellOutAA", myAno - 1)
        oFun.Grid_ColumnTitle(grid, "vlrLucroSellOutAT", myAno)

        oFun.Grid_ColumnTitle(grid, "vlrLucroCheioAA", myAno - 1)
        oFun.Grid_ColumnTitle(grid, "vlrLucroCheioAT", myAno)

        oFun.Grid_ColumnTitle(grid, "percPartAA", myAno - 1)
        oFun.Grid_ColumnTitle(grid, "percPartAT", myAno)

        oFun.Grid_ColumnTitle(grid, "posRnkAA", myAno - 1)
        oFun.Grid_ColumnTitle(grid, "posRnkAT", myAno)


        'oFun.Grid_ColumnTitle(grid, "comparacao", "Comparação Evolução Rank. Ano " & myAno)
        'oFun.Grid_ColumnTitle(grid, "bandComparacao", "Evolução " & myAno & " x " & myAno - 1)
    End Sub

#End Region

    
End Class

