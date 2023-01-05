
Partial Class MemberPages_RankingSuperHiper
    Inherits System.Web.UI.Page

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Crescimento do e-Commerce"
    End Sub
End Class
