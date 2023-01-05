
Partial Class MemberPages_Concorrrentes_IncluiCEP
    Inherits System.Web.UI.Page

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(199, User.Identity.Name)
            CType(Master.FindControl("lblTitle"), Label).Text = "Cadastro / Alteração de CEP - PGR199"
        End If
    End Sub
End Class
