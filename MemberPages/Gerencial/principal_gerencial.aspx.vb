
Partial Class MemberPages_Planejamento_cenario
    Inherits System.Web.UI.Page

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Orçamento - Cenário"
    End Sub
End Class
