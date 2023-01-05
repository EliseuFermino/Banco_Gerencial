
Partial Class MemberPages_Resultado_ResultadoPrincipal
    Inherits System.Web.UI.Page

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Resultados"
    End Sub
End Class
