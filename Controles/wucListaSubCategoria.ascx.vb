
Partial Class Controles_wucListaSubCategoria
    Inherits System.Web.UI.UserControl

    Public Event ListSubCategoriaChanged(ByVal sender As Object, ByVal e As EventArgs)

    Public Property CallSubCategoria() As String
        Get
            Return cboSubCategoria.Value
        End Get
        Set(ByVal value As String)
            cboSubCategoria.Value = value
        End Set
    End Property

    Public Property Enabled_cboSubCategoria() As Boolean
        Get
            Return cboSubCategoria.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboSubCategoria.Enabled = value
        End Set
    End Property

    Public Sub AddSourceItem(ByVal sourceItem As String)
        Me.lblCat_ID.Value = sourceItem
    End Sub

    Protected Sub cboSubCategoria_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboSubCategoria.SelectedIndexChanged
        RaiseEvent ListSubCategoriaChanged(sender, e)
    End Sub

End Class
