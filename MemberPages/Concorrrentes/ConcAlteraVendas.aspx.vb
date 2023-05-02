
Partial Class MemberPages_ConcAlteraVendas
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Me.cboAno.Value = 2023
        Me.cboMes.Value = 1
        Me.cboMes.Text = "Janeiro"
    End Sub


    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Alteração de Vendas"
    End Sub
End Class
