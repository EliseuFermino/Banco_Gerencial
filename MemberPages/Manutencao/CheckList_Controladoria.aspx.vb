
Partial Class MemberPages_Manutencao_CheckList_Controladoria
    Inherits System.Web.UI.Page

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Controladoria - PGR999"
        End If
    End Sub


End Class
