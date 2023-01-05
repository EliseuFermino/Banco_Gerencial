
Partial Class Controles_wucBotaoAtualizar
    Inherits System.Web.UI.UserControl

    Public Event BotaoClick(ByVal sender As Object, ByVal e As EventArgs)

    Protected Sub ASPxButton1_Click(sender As Object, e As EventArgs) Handles ASPxButton1.Click
        RaiseEvent BotaoClick(sender, e)
    End Sub

    Public Property btnSalvar_Enabled() As Boolean
        Get
            Return ASPxButton1.Enabled
        End Get
        Set(ByVal value As Boolean)
            ASPxButton1.Enabled = value
        End Set
    End Property

    Public Property btnSalvar_Text() As String
        Get
            Return ASPxButton1.Text
        End Get
        Set(ByVal value As String)
            ASPxButton1.Text = value
        End Set
    End Property

End Class
