
Partial Class MemberPages_Gerencial_Enxoval
    Inherits System.Web.UI.Page

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Total de Enxoval - Agenda 262 e 347"
    End Sub
End Class
