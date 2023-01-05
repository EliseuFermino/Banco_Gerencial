
Partial Class MemberPages_Concorrrentes_AlteraConcorrentePrincipal
    Inherits System.Web.UI.Page

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(198, User.Identity.Name)
            CType(Master.FindControl("lblTitle"), Label).Text = "Cadastro / Alteração de Concorrentes - Principal - PGR198"
        End If
    End Sub
End Class
