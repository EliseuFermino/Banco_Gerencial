
Imports DevExpress.Web

Partial Class MemberPages_ConcCodigoIE
    Inherits System.Web.UI.Page

    Protected Sub ASPxGridView2_BeforePerformDataSelect(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("CodIE") = CType(sender, ASPxGridView).GetMasterRowKeyValue()
    End Sub
   
    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Cadastro e Alteração de Concorrentes"
    End Sub
End Class
