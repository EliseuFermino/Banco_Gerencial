
Partial Class MemberPages_EvolucaoCondor
    Inherits System.Web.UI.Page

    Protected Sub ASPxButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ASPxButton1.Click
        Me.ExporterExcel1.WriteXlsToResponse()

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Ranking Internacional"
    End Sub
End Class
