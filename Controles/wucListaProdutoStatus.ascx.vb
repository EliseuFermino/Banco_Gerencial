
Partial Class wucListaProdutoStatus
    Inherits System.Web.UI.UserControl

    Public Event ListStatusChanged(ByVal sender As Object, ByVal e As EventArgs)

    Public Property CallProdutoStatus() As String
        Get
            Return cboStatus.Value
        End Get
        Set(ByVal value As String)
            cboStatus.Value = value
        End Set
    End Property

    Public Property Visible_cboStatus() As Boolean
        Get
            Return cboStatus.Visible
        End Get
        Set(ByVal value As Boolean)
            cboStatus.Visible = value
        End Set
    End Property

    Public Property Enabled() As Boolean
        Get
            Return cboStatus.Value
        End Get
        Set(ByVal value As Boolean)
            cboStatus.Enabled = value
        End Set
    End Property

    Public Property SelectedValue() As String
        Get
            Return cboStatus.Value
        End Get
        Set(ByVal value As String)
            cboStatus.Value = value
        End Set
    End Property

    Public Property AutoPostBack() As Boolean
        Get
            Return cboStatus.AutoPostBack
        End Get
        Set(ByVal value As Boolean)
            cboStatus.AutoPostBack = value
        End Set
    End Property

    Protected Sub cboStatus_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboStatus.SelectedIndexChanged
        RaiseEvent ListStatusChanged(sender, e)
    End Sub
   
End Class
