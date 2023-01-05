
Partial Class wucListaAgendasContasReceber
    Inherits System.Web.UI.UserControl

    Public Event ListAgendaChanged(ByVal sender As Object, ByVal e As EventArgs)

    Public Property CallAgenda() As Int16
        Get
            Return cboAgenda.Value
        End Get
        Set(ByVal value As Int16)
            cboAgenda.Value = value
        End Set
    End Property

    Public Property cboAgenda_Enabled() As Boolean
        Get
            Return cboAgenda.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboAgenda.Enabled = value
        End Set
    End Property

    Public Property cboAgenda_Visible() As Boolean
        Get
            Return cboAgenda.Visible
        End Get
        Set(ByVal value As Boolean)
            cboAgenda.Visible = value
        End Set
    End Property

    Protected Sub cboAgenda_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboAgenda.SelectedIndexChanged
        RaiseEvent ListAgendaChanged(sender, e)
    End Sub

    Public Property AutoPostBack() As Boolean
        Get
            Return cboAgenda.AutoPostBack
        End Get
        Set(ByVal value As Boolean)
            cboAgenda.AutoPostBack = value
        End Set
    End Property

    Public Property CallAgendaDesc() As String
        Get
            Return cboAgenda.Text
        End Get
        Set(ByVal value As String)
            cboAgenda.Text = value
        End Set
    End Property

End Class
