
Partial Class Controles_wuciAno
    Inherits System.Web.UI.UserControl

    Public Event ListAnoChanged(ByVal sender As Object, ByVal e As EventArgs)

    Public Property CallAno() As String
        Get
            Return cboAno.Text
        End Get
        Set(ByVal value As String)
            cboAno.Text = value
        End Set
    End Property

    Protected Sub cboAno_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.Init
        Me.cboAno.Text = Year(Now())
    End Sub

    Protected Sub cboAno_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.SelectedIndexChanged
        RaiseEvent ListAnoChanged(sender, e)
    End Sub

    Public Property Enabled_cboAno() As Boolean
        Get
            Return cboAno.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboAno.Enabled = value
        End Set
    End Property
End Class
