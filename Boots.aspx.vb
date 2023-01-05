
Partial Class Boots
    Inherits System.Web.UI.Page

    Sub Submit(sender As Object, e As EventArgs)
        Label1.Text = TextBox1.Text + " " + TextBox2.Text + " " + TextBox3.Text
    End Sub

   
End Class
