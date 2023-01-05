
Partial Class MemberPages_Concorrrentes_AlteraConcorrenteFilial
    Inherits System.Web.UI.Page

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(197, User.Identity.Name)
            CType(Master.FindControl("lblTitle"), Label).Text = "Cadastro / Alteração de Concorrentes - Filial - PGR197"
        End If
    End Sub
End Class
