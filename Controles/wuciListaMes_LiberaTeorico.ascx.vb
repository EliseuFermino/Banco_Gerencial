
Partial Class wucMes_LiberaTeorico
    Inherits System.Web.UI.UserControl

    Public Event ListMesChanged(ByVal sender As Object, ByVal e As EventArgs)

    Public Property CallMes() As String
        Get
            Return cboMes.Value
        End Get
        Set(ByVal value As String)
            cboMes.Text = value
        End Set
    End Property

    Public Property CallMesDesc() As String
        Get
            Return cboMes.Text
        End Get
        Set(ByVal value As String)
            cboMes.Text = value
        End Set
    End Property

    Protected Sub cboMes_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboMes.Init
        If Not IsPostBack Then
            Me.cboMes.Text = Month(Now())
        End If

    End Sub

    Protected Sub cboMes_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboMes.SelectedIndexChanged
        RaiseEvent ListMesChanged(sender, e)
    End Sub

    Public Property Enabled_cboMes() As Boolean
        Get
            Return cboMes.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboMes.Enabled = value
        End Set
    End Property

    Public Property LabelDescMes() As String
        Get
            Return lblDesc.Text
        End Get
        Set(ByVal value As String)
            lblDesc.Text = value
        End Set
    End Property

    Public Property AutoPostBack() As Boolean
        Get
            Return cboMes.AutoPostBack
        End Get
        Set(ByVal value As Boolean)
            cboMes.AutoPostBack = value
        End Set
    End Property

End Class
