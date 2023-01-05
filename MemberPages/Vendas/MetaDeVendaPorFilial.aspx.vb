Imports DevExpress.Web

Partial Class MemberPages_Vendas_MetaDeVendaPorFilial
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVem As New VendaEmpresaMes

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        If Not IsPostBack Then
            oVem.AtualizarEstatisticaPrograma(186, User.Identity.Name)

            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = Year(Now()) + 7
            Me.cboAno.CallAno = Year(DateAdd(DateInterval.Month, -2, DateAndTime.Now()))

            Session("sAno") = Me.cboAno.CallAno
        End If
    End Sub

    Protected Sub gridMaster_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridMaster.CustomSummaryCalculate

        oFun.Grid_Footer_Calculate(sender, e, gridMaster, "percOri", "vlrReal", "vlrOri", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridMaster, "percRev", "vlrReal", "vlrRev", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridMaster, "percAA", "vlrReal", "vlrRealAA", Funcoes.CalculateType.Growth)

    End Sub

    Protected Sub gridMaster_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridMaster.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "DifRevOri")
        oFun.Grid_RedIsNegative(e, "vlrDifRea")
        oFun.Grid_RedIsNegative(e, "percOri")
        oFun.Grid_RedIsNegative(e, "percRev")
        oFun.Grid_RedIsNegative(e, "percAA")

    End Sub

    Private Sub MudarTitulo()
        Me.gridMaster.SettingsText.Title = "Meta de Vendas x Realizado " & Me.cboAno.CallAno & " - " & cboFilial.CallFilialNome
        Me.gridMaster.Columns("bandMeta").Caption = "Meta " & Me.cboAno.CallAno & ""
        Me.gridMaster.Columns("vlrRea").Caption = Me.cboAno.CallAno
        Me.gridMaster.Columns("vlrReaAA").Caption = Me.cboAno.CallAno - 1
    End Sub

    Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Análise de Meta x Realizado - Vendas - por Filial - PGR186"
        End If

    End Sub

    Protected Sub gridMaster_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gridMaster.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub




    Private Sub Ranking_MetaDeVendaPorFilial_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then

            If cboFilial.IsLoja = True Then Me.cboFilial.Visible_cboCorporacao = False

            'If Me.cboFilial.IsLoja = False Then Me.cboFilial.CallFilial = 3

            Call MudarTitulo()
            Me.gridMaster.DataBind()

        End If
    End Sub


    Protected Sub cboPanel_Callback(sender As Object, e As CallbackEventArgsBase) Handles cboPanel.Callback
        Session("sAno") = Me.cboAno.CallAno
        Call MudarTitulo()
        Me.gridMaster.DataBind()
    End Sub
End Class

