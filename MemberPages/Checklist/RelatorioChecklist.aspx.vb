
Partial Class MemberPages_Checklist_RelatorioChecklist
    Inherits System.Web.UI.Page

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(116, User.Identity.Name)
        End If
        CType(Master.FindControl("lblTitle"), Label).Text = "Relatório de Check-list - Não Conforme"
    End Sub
End Class
