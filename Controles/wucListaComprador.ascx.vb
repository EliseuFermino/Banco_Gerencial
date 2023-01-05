
Partial Class wucListaComprador
    Inherits System.Web.UI.UserControl

    Public Event ListCompradorChanged(ByVal sender As Object, ByVal e As EventArgs)


    Public Property CallComprador() As String
        Get
            Return cboComprador.Value
        End Get
        Set(ByVal value As String)
            cboComprador.Value = value
        End Set
    End Property

    Public Property Enabled() As Boolean
        Get
            Return cboComprador.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboComprador.Enabled = value
        End Set
    End Property

    Protected Sub cboComprador_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboComprador.SelectedIndexChanged
        RaiseEvent ListCompradorChanged(sender, e)
    End Sub

    Public Property cboComprador_Visible() As Boolean
        Get
            Return cboComprador.Visible
        End Get
        Set(ByVal value As Boolean)
            cboComprador.Visible = value
        End Set
    End Property

    'Public Property cboComprador_Label_Visible() As Boolean
    '    Get
    '        Return lblComprador.Visible
    '    End Get
    '    Set(ByVal value As Boolean)
    '        lblComprador.Visible = value
    '    End Set
    'End Property

    Public Property cboComprador_List_Index() As Byte
        Get
            Return cboComprador.SelectedIndex
        End Get
        Set(ByVal value As Byte)
            cboComprador.SelectedIndex = value
        End Set
    End Property

End Class
