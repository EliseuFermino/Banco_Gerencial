
Partial Class MemberPages_ConcAlteraVendas
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Me.cboAno.Value = 2018
        Me.cboMes.Value = 8
        Me.cboMes.Text = "Agosto"
    End Sub


    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Alteração de Vendas"
    End Sub
End Class
