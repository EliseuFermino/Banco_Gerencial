
Partial Class wucListaDepto
    Inherits System.Web.UI.UserControl

    Public Event ListDeptoChanged(ByVal sender As Object, ByVal e As EventArgs)

    Public Property CallDepto() As String
        Get
            Return cboDepto.Value
        End Get
        Set(ByVal value As String)
            cboDepto.Value = value
        End Set
    End Property

    Public Property Enabled() As Boolean
        Get
            Return cboDepto.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboDepto.Enabled = value
        End Set
    End Property

    Public Property Visible_Depto() As Boolean
        Get
            Return cboDepto.Visible
        End Get
        Set(ByVal value As Boolean)
            cboDepto.Visible = value
        End Set
    End Property

    Protected Sub cboDepto_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboDepto.SelectedIndexChanged
        RaiseEvent ListDeptoChanged(sender, e)
    End Sub

    Public Property AutoPostBack() As Boolean
        Get
            Return cboDepto.AutoPostBack
        End Get
        Set(ByVal value As Boolean)
            cboDepto.AutoPostBack = value
        End Set
    End Property

    Public Property CallDeptoDesc() As String
        Get
            Return cboDepto.Text
        End Get
        Set(ByVal value As String)
            cboDepto.Text = value
        End Set
    End Property


    Public Property CallDeptoDescricao() As String
        Get
            Return cboDepto.SelectedItem.Text
        End Get
        Set(ByVal value As String)
            cboDepto.SelectedItem.Text = value
        End Set
    End Property


    
End Class
