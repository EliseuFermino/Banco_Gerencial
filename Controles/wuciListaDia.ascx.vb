
Partial Class wucMes
    Inherits System.Web.UI.UserControl

    Public Event ListDiaChanged(ByVal sender As Object, ByVal e As EventArgs)

    Public Property CallDia() As Date
        Get
            Return cboDia.Text
        End Get
        Set(ByVal value As Date)
            cboDia.Text = value
        End Set
    End Property

    Protected Sub cboDia_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboDia.Init
        Me.cboDia.Text = DateAndTime.Now().ToShortDateString
    End Sub

    Public Property Enabled_cboDia() As Boolean
        Get
            Return cboDia.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboDia.Enabled = value
        End Set
    End Property

    Protected Sub cboDia_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboDia.TextChanged
        RaiseEvent ListDiaChanged(sender, e)
    End Sub
End Class
