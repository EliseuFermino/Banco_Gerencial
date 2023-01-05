
Partial Class Controles_wucListaEstabelecimento
    Inherits System.Web.UI.UserControl

    Public Event ListFornecedorChanged(ByVal sender As Object, ByVal e As EventArgs)

    Protected Sub cboFornecedor_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboFornecedor.SelectedIndexChanged
        RaiseEvent ListFornecedorChanged(sender, e)
    End Sub

    Public Property CallFornecedor() As String
        Get
            Return cboFornecedor.Value
        End Get
        Set(ByVal value As String)
            cboFornecedor.Value = value
        End Set
    End Property

    Public Property cboFornecedor_Enabled() As Boolean
        Get
            Return cboFornecedor.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboFornecedor.Enabled = value
        End Set
    End Property

    Public Property cboFornecedor_Width() As Int32
        Get
            Return Convert.ToInt32(cboFornecedor.Width)
        End Get
        Set(ByVal value As Int32)
            cboFornecedor.Width = value
        End Set
    End Property

End Class
