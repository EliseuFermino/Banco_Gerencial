
Partial Class MemberPages_Abras_RankingTotal
    Inherits System.Web.UI.Page

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Ranking Nacional ABRAS"
    End Sub
End Class
