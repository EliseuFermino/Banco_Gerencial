
Partial Class Controles_wucListaCategoria
    Inherits System.Web.UI.UserControl

    Public Event ListTipoChanged(ByVal sender As Object, ByVal e As EventArgs)

    Public Property CallTipo() As String
        Get
            Return cboTipo.Value
        End Get
        Set(ByVal value As String)
            cboTipo.Value = value
        End Set
    End Property

    Public Property Enabled_cboCategoria() As Boolean
        Get
            Return cboTipo.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboTipo.Enabled = value
        End Set
    End Property

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Me.cboTipo.Text = 1
            Session("sTIPO_ID") = Me.cboTipo.Value
        End If
    End Sub

    Protected Sub cboTipo_SelectedIndexChanged(sender As Object, e As System.EventArgs) Handles cboTipo.SelectedIndexChanged
        Session("sTIPO_ID") = Me.cboTipo.Value
        RaiseEvent ListTipoChanged(sender, e)
    End Sub
End Class
