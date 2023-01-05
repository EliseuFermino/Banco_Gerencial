
Partial Class Controles_wucListaCategoria
    Inherits System.Web.UI.UserControl

    Public Event ListCategoriaChanged(ByVal sender As Object, ByVal e As EventArgs)

    Public Property CallCategoria() As String
        Get
            Return cboCategoria.Value
        End Get
        Set(ByVal value As String)
            cboCategoria.Value = value
        End Set
    End Property

    Public Property CallCategoriaDescricao() As String
        Get
            Return cboCategoria.Text
        End Get
        Set(ByVal value As String)
            cboCategoria.Text = value
        End Set
    End Property

    Protected Sub cboCategoria_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboCategoria.SelectedIndexChanged
        Session("sTIPO_ID") = Me.cboCategoria.Value
        RaiseEvent ListCategoriaChanged(sender, e)
    End Sub

    Public Property Enabled_cboCategoria() As Boolean
        Get
            Return cboCategoria.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboCategoria.Enabled = value
        End Set
    End Property

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Me.cboCategoria.Text = 1
            Session("sTIPO_ID") = Me.cboCategoria.Value
        End If
    End Sub

    Public Sub AddSourceItem(ByVal sourceItem As String)
        Me.lblTipo_ID.Value = sourceItem
        Select Case sourceItem
            Case 1  'Receitas
                Me.cboCategoria.Text = 17
            Case 2  'Despesas
                Me.cboCategoria.Text = 1
            Case 3  'Transferências
                Me.cboCategoria.Text = 31
        End Select
    End Sub

End Class
