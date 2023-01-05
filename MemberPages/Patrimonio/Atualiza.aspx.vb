
Partial Class MemberPages_Patrimonio_Atualiza
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If IsPostBack = False Then
            If Request.QueryString("ID") Is Nothing Then
                Response.Redirect("AltExcPatr.aspx")
            End If

            Dim lancamentoID As Integer = Convert.ToInt32(Request.QueryString("id").ToString())
            Dim contexto As New gerProjetosEntities
            Dim registro As Patrimonio_tblDados = contexto.tblDados.SingleOrDefault(Function(p) p.ID = lancamentoID)

            txtID.Text = registro.ID.ToString()
            txtEAN.Text = registro.EAN
            txtQtde.Text = registro.Qtde
            txtPreco.Text = registro.Preco
            Session("atualizaCliente") = registro
        End If

    End Sub

    Protected Sub btnAtualiza_Click(sender As Object, e As EventArgs) Handles btnAtualiza.Click

        Dim lancamentoID As Integer = Convert.ToInt32(Request.QueryString("ID").ToString())
        Dim contexto As New gerProjetosEntities
        Dim registro As Patrimonio_tblDados = contexto.tblDados.SingleOrDefault(Function(p) p.ID = lancamentoID)

        registro.Qtde = txtQtde.Text
        registro.Preco = txtPreco.Text

        contexto.SaveChanges()

        lblmsg.Text = "Cliente atualizado com sucesso !!"


    End Sub

   
End Class
