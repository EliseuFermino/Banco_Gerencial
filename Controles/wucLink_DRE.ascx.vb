
Partial Class Controles_wucLink_DRE
    Inherits System.Web.UI.UserControl

    Protected Sub link_DRE_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles link_DRE.Click
        Call Linkar("viewDRE_Loja.aspx", "1")    'Me.lblCatCod.Text
    End Sub

    Private Sub Linkar(ByVal link As String, ByVal idCat As String)
        Dim url As String = link & "?idCat=" & idCat & ""
        Dim sb As New StringBuilder()
        sb.Append("<script type = 'text/javascript'>")
        sb.Append("window.open('")
        sb.Append(url)
        sb.Append("');")
        sb.Append("</script>")
        Page.ClientScript.RegisterStartupScript(Me.GetType(), "script", sb.ToString())
    End Sub
End Class
