
Partial Class MemberPages_Default5
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        Label1.Text = Session("sMES") & " - " & Session("sMES_FINAL")
    End Sub

    Protected Sub ASPxDateEdit1_DateChanged(sender As Object, e As EventArgs) Handles ASPxDateEdit1.DateChanged
        Label1.Text = Month(ASPxDateEdit1.Value)
    End Sub
End Class
