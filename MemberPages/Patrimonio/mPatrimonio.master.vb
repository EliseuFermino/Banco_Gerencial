
Partial Class MemberPages_Patrimonio_mPatrimonio
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load


    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Dim oProj As New Projeto

        oProj.BuscarLocalDoUsuario(Page.User.Identity.Name)
        If oProj.Isloja = True Then
            liLoja.Visible = False
            liUltimoLancamento.Visible = False
        End If
    End Sub
End Class

