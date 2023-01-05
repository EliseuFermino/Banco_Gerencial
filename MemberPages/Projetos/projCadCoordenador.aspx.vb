
Partial Class Ranking_projCadCoordenador
    Inherits System.Web.UI.Page

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Cadastro de Coordenador"
    End Sub
End Class
