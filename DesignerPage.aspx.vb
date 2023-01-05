Imports DevExpress.DashboardWeb

Partial Class DesignerPage
    Inherits System.Web.UI.Page

    Protected Sub wuciListaMes_ListMesChanged(sender As Object, e As EventArgs) Handles wuciListaMes.ListMesChanged
        lblText.Text = wuciListaMes.CallMes
    End Sub
End Class
