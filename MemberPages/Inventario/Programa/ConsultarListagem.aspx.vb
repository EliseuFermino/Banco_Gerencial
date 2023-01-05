
Partial Class MemberPages_Inventario_Programa_ConsultarListagem
    Inherits System.Web.UI.Page

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Consulta de Listagem"
    End Sub
End Class
