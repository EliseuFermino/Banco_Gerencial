

#Region " Imports"

Imports DevExpress.Web
Imports System.Data.SqlClient

#End Region

Partial Class MemberPages_SLV_AnaliseVendaMaiorVenda
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes
    Dim oFun As New Funcoes
    Dim oSLV As New SLV

    'Define Enum Mercadologico
    Private Enum Mercadologico As Byte
        Total = 1
        Departamento = 2
        Secao = 3
        Grupo = 4
        Subgrupo = 5
        Item = 6
    End Enum

#Region " Panel"

    Protected Sub cbPanelGrid_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanelGrid.Callback

        Dim oVem As New VendaEmpresaMes

        Session("sFILIAL") = cboFilial.CallFilial


        Me.grid.DataBind()
        Me.grid.Visible = True

        AlterarLegenda()

        Me.cbPanelGrid.SettingsLoadingPanel.Delay = 0

    End Sub


#End Region

    Private Sub AtualizarBackground(ByVal nomeDoTitulo As String, ByVal NumeroDoPrograma As Int16)

        oFun.Grid_Title(Me.grid, nomeDoTitulo)
        oVem.AtualizarEstatisticaPrograma(NumeroDoPrograma, User.Identity.Name)

    End Sub


#Region " grid"

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate

        oFun.Grid_Footer_Calculate(sender, e, grid, "percCresc", "vlrVendaAT", "vlrVendaAA", Funcoes.CalculateType.Growth)

        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargem", "Lucro", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)

        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemSO", "LucroSO", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)

        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemFinal", "vlrLucroFinal", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)


    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "Lucro")
        oFun.Grid_RedIsNegative(e, "percMargemFinal")
        oFun.Grid_RedIsNegative(e, "vlrLucroFinal")
        'oFun.Grid_RedIsNegative(e, "percCresc")

    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared

        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

#End Region

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            

            cboMercadologico.Checked_rdTotal = True
            Session("sOPCAO") = 1   'Total
            Session("sDIA_INICIAL") = cboDia.CallDiaInicial
            Session("sDIA_FINAL") = cboDia.CallDiaFinal
            Session("sMERCADOLOGICO") = 1
            Session("sMESMOSDIAS") = 0
            Session("sCOMPARA") = 0

            Me.grid.Visible = True
            AlterarLegenda()
            AtualizarBackground("Ranking por Item", 414)
            'Me.grid.DataBind()
            oVem.AtualizarEstatisticaPrograma(215, User.Identity.Name)
            cboSize.CallSize = 100

            'lblError.Visible = True
            'lblError.Text = "sFILIAL " & Session("sFILIAL") & "<br> sDIA_INICIAL " & Session("sDIA_INICIAL") & "<br> sDIA_FINAL " & Session("sDIA_FINAL") & "<br> sMERCADOLOGICO " & Session("sMERCADOLOGICO") & "<br> sOPCAO " & Session("sOPCAO") & "<br> sMESMOSDIAS " & Session("sMESMOSDIAS") & "<br> sCOMPARA " & Session("sCOMPARA")


        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Comparativo de Vendas e Ranking - PGR215"
        End If
    End Sub

    Private Sub AlterarLegenda()
        'Dim myAno As Int16
        'myAno = Year(cboDia.CallDiaFinal)
        'oFun.Grid_ColumnTitle(grid, "vlrVendaAA", myAno - 1)
        'oFun.Grid_ColumnTitle(grid, "vlrVendaAT", myAno)

        'oFun.Grid_ColumnTitle(grid, "posRnkAA", myAno - 1)
        'oFun.Grid_ColumnTitle(grid, "posRnkAT", myAno)

        'oFun.Grid_ColumnTitle(grid, "comparacao", "Comparação Evolução Rank. Ano " & myAno)
        'oFun.Grid_ColumnTitle(grid, "bandComparacao", "Evolução " & myAno & " x " & myAno - 1)
    End Sub

#End Region

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)
    End Sub
End Class

