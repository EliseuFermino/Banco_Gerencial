Imports DevExpress.Web

Partial Class MemberPages_Vendas_VendaAcompanhamento_LORD
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        
    End Sub

    Protected Sub pb_DataBound(ByVal sender As Object, ByVal e As EventArgs)
        Dim progressBar As ASPxProgressBar = CType(sender, ASPxProgressBar)

        If progressBar.Position > 100 Then
            progressBar.Position = 100
        End If

        If progressBar.Position >= 100 Then
            progressBar.IndicatorStyle.BackColor = Drawing.Color.Green
        Else
            progressBar.IndicatorStyle.BackColor = Drawing.Color.LightCoral
        End If
    End Sub

    Protected Sub cbPanel_Callback(sender As Object, e As CallbackEventArgsBase) Handles cbPanel.Callback
        Dim Dia As Date
        Dia = DateAndTime.Now()
        Session("sDIA") = Dia
        ASPxGridView1.DataBind()
    End Sub
End Class
