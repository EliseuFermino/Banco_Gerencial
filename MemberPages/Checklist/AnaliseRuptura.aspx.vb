
Partial Class MemberPages_Checklist_AnaliseRuptura
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            cboFilial.Visible_cboCorporacao = False

        End If

    End Sub
End Class
