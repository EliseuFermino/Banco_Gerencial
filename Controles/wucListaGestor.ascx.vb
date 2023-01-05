
Partial Class Controles_wucListaGestor
    Inherits System.Web.UI.UserControl

    Public Event ListGestorChanged(ByVal sender As Object, ByVal e As EventArgs)

    Public Property CallGestor() As String
        Get
            Return cboGestor.Value
        End Get
        Set(ByVal value As String)
            cboGestor.Value = value
        End Set
    End Property

    Public Property Enabled_cboGestor() As Boolean
        Get
            Return cboGestor.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboGestor.Enabled = value
        End Set
    End Property

    Protected Sub cboGestor_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboGestor.SelectedIndexChanged
        RaiseEvent ListGestorChanged(sender, e)
    End Sub
End Class
