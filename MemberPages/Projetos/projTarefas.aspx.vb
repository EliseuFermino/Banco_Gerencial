Imports DevExpress.Web

Partial Class MemberPages_projTarefas
    Inherits System.Web.UI.Page


    Protected Sub detailGrid_DataSelect(ByVal sender As Object, ByVal e As EventArgs)
        Session("Tarefa") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Tarefas Controladoria"
    End Sub
End Class
