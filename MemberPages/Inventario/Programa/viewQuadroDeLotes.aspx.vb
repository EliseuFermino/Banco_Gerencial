
Partial Class MemberPages_Inventario_Programa_viewQuadroDeLotes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("sNUMINV") = 8
            ASPxGridView1.DataBind()
        End If
    End Sub
End Class
