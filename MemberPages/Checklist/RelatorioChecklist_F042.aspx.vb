
Partial Class MemberPages_Checklist_RelatorioChecklist_F042
    Inherits System.Web.UI.Page

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(120, User.Identity.Name)
        End If
        CType(Master.FindControl("lblTitle"), Label).Text = "Relatório de Check-list - Não Conforme - Loja 42"
    End Sub
End Class
