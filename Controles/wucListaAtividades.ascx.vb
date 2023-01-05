
Partial Class Controles_wucListaCategoria
    Inherits System.Web.UI.UserControl

    Public Event ListAtividadeChanged(ByVal sender As Object, ByVal e As EventArgs)

    Public Property CallAtividade() As String
        Get
            Return cboAtividade.Value
        End Get
        Set(ByVal value As String)
            cboAtividade.Value = value
        End Set
    End Property

    Public Property Enabled_cboAtividade() As Boolean
        Get
            Return cboAtividade.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboAtividade.Enabled = value
        End Set
    End Property

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Me.cboAtividade.Text = 1
            Session("sATIVIDADE") = Me.cboAtividade.Value
        End If
    End Sub

    Protected Sub cboAtividade_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles cboAtividade.SelectedIndexChanged
        Session("sATIVIDADE") = Me.cboAtividade.Value
        RaiseEvent ListAtividadeChanged(sender, e)
    End Sub
End Class
