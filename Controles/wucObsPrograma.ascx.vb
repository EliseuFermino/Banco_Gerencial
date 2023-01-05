
Partial Class Controles_wucObsPrograma
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            If Page.User.Identity.Name = "Eliseu" Or
               Page.User.Identity.Name = "eliseu" Or
               Page.User.Identity.Name = "Jesuli" Or
               Page.User.Identity.Name = "jesuli" Then
                lbAnotacao1.Visible = True
                lbAnotacao2.Visible = True
            End If
        End If
    End Sub

    Public Property Anotacao1() As String
        Get
            Return lbAnotacao1.Text
        End Get
        Set(ByVal value As String)
            lbAnotacao1.Text = value
        End Set
    End Property

    Public Property Anotacao2() As String
        Get
            Return lbAnotacao2.Text
        End Get
        Set(ByVal value As String)
            lbAnotacao2.Text = value
        End Set
    End Property

End Class
