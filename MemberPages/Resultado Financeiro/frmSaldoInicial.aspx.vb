
Partial Class MemberPages_Resultado_Financeiro_frmSaldoInicial
    Inherits System.Web.UI.Page

    Protected Sub ASPxButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ASPxButton1.Click
        Me.Exporter.WriteXlsToResponse()

    End Sub

    Protected Sub ASPxButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ASPxButton2.Click
        Me.Exporter1.WriteXlsToResponse()
    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Month(Now()) > 1 Then
            Me.cboAno.Text = Year(Now())
        Else
            Me.cboAno.Text = Year(Now()) - 1
        End If
    End Sub

End Class
