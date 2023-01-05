
Partial Class MemberPages_Inventario_Programa_CadastroSetor
    Inherits System.Web.UI.Page

    Protected Sub btnSalvar_BotaoClick(sender As Object, e As EventArgs) Handles btnSalvar.BotaoClick
        clData_gerInv.usp2("Programa.uspSalvarSetor", "@id", "@desc", Me.txtNumSetor.Text, Me.txtDescricao.Text)
        Me.GridView1.DataBind()
        Me.txtNumSetor.Text = ""
        Me.txtDescricao.Text = ""
        Me.txtNumSetor.Focus()
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Cadastro de Setor"
    End Sub
End Class
