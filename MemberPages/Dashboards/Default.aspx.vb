Imports DevExpress.DataAccess.Web

Partial Class MemberPages_Dashboards_Default
    Inherits System.Web.UI.Page

    Protected Sub ASPxDashboard1_Load(sender As Object, e As EventArgs) Handles ASPxDashboard1.Load
        ASPxDashboard1.SetConnectionStringsProvider(New ConfigFileConnectionStringsProvider())
    End Sub
End Class
