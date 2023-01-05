
Partial Class MemberPages_EvolucaoCondor
    Inherits System.Web.UI.Page

    Protected Sub ASPxButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ASPxButton1.Click
        Me.ExporterExcel1.WriteXlsToResponse()
    End Sub

    Protected Sub ASPxGridView1_HtmlRowPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles ASPxGridView1.HtmlRowPrepared
        'If e.RowType <> GridViewRowType.Data Then
        '    Return
        'End If

        Dim NomeColuna As String = Convert.ToString(e.GetValue("Ano"))

        If NomeColuna = "2015" Then
            e.Row.Font.Bold = True
            e.Row.ForeColor = Drawing.Color.Blue
            e.Row.BackColor = Drawing.Color.Yellow
        End If

        Dim NomeColuna1 As String = Convert.ToString(e.GetValue("RankingSuperHiper"))
        If NomeColuna1 = "Previsão" Then
            e.Row.Font.Bold = True
            e.Row.ForeColor = Drawing.Color.ForestGreen
        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Evolução Condor ABRAS"
    End Sub
End Class
