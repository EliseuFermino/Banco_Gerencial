
Partial Class Controles_DescricaoAtualizaro
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        If Not IsPostBack Then
            If Page.User.Identity.Name = "Eliseu" Then Me.labelSource.Visible = True
        End If
    End Sub

    Public Property Text() As String
        Get
            Return Me.labelSource.Text
        End Get
        Set(ByVal value As String)
            labelSource.Text = value
        End Set
    End Property

End Class
