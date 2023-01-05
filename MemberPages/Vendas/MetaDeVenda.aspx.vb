
Imports DevExpress.Web

Partial Class Ranking_MetaDeVenda
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Dim oVem As New VendaEmpresaMes
        If Not IsPostBack Then
            oVem.AtualizarEstatisticaPrograma(7, User.Identity.Name)

            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = Year(Now()) + 7
            Me.cboAno.CallAno = Year(DateAdd(DateInterval.Month, -2, DateAndTime.Now()))

            Session("sAno") = Me.cboAno.CallAno
            Call MudarTitulo()
            Me.cboAno.AutoPostBack = True

        End If
    End Sub

    Protected Sub gridMaster_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridMaster.CustomSummaryCalculate
        On Error Resume Next
     
        oFun.Grid_Footer_Calculate(sender, e, gridMaster, "percOri", "vlrReal", "vlrOri", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridMaster, "percRev", "vlrReal", "vlrRev", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridMaster, "percAA", "vlrReal", "vlrRealAA", Funcoes.CalculateType.Growth)

    End Sub

    Protected Sub gridMaster_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridMaster.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "vlrDifRevOri")
        oFun.Grid_RedIsNegative(e, "vlrDifRea")
        oFun.Grid_RedIsNegative(e, "percOri")
        oFun.Grid_RedIsNegative(e, "percRev")
        oFun.Grid_RedIsNegative(e, "percAA")
        oFun.Grid_RedIsNegative(e, "DifRevOri")

    End Sub

    Protected Sub cboAno_ListAnoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.ListAnoChanged
        Session("sAno") = Me.cboAno.CallAno
        Call MudarTitulo()
    End Sub

    Private Sub MudarTitulo()
        Me.gridMaster.SettingsText.Title = "Meta de Vendas x Realizado " & Me.cboAno.CallAno & " - Empresa"
        Me.gridMaster.Columns("bandMeta").Caption = "Meta " & Me.cboAno.CallAno & ""
        Me.gridMaster.Columns("vlrRea").Caption = Me.cboAno.CallAno
        Me.gridMaster.Columns("vlrReaAA").Caption = Me.cboAno.CallAno - 1
    End Sub

    Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Análise de Meta x Realizado - Vendas - Empresa - PGR7"
    End Sub

    Protected Sub btnExportar_Click(sender As Object, e As EventArgs) Handles btnExportar.Click
        Me.ExporterExcel1.WriteXlsToResponse()
    End Sub

    Protected Sub gridMaster_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gridMaster.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub
End Class
