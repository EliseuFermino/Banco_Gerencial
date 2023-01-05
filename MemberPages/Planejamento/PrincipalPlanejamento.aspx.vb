
Partial Class MemberPages_SLV_PrincipalPlanejamento
    Inherits System.Web.UI.Page

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Relatórios de Metas e Orçamento"
    End Sub


End Class
