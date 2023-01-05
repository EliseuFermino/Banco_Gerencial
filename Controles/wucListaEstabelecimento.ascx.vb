
Partial Class Controles_wucListaEstabelecimento
    Inherits System.Web.UI.UserControl

    Public Event ListEstabelecimentoChanged(ByVal sender As Object, ByVal e As EventArgs)

    Protected Sub cboEstabelecimento_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboEstabelecimento.SelectedIndexChanged
        RaiseEvent ListEstabelecimentoChanged(sender, e)
    End Sub

    Public Property CallEstabelecimento() As String
        Get
            Return cboEstabelecimento.Value
        End Get
        Set(ByVal value As String)
            cboEstabelecimento.Value = value
        End Set
    End Property

    Public Property cboEstabelecimento_Enabled() As Boolean
        Get
            Return cboEstabelecimento.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboEstabelecimento.Enabled = value
        End Set
    End Property

    Public Property cboEstabelecimento_Width() As Int32
        Get
            Return Convert.ToInt32(cboEstabelecimento.Width)
        End Get
        Set(ByVal value As Int32)
            cboEstabelecimento.Width = value
        End Set
    End Property

    Public Property cboEstabelecimento_DataSource() As SqlDataSource
        Get
            Return Me.dsEstabelecimento
        End Get
        Set(ByVal value As SqlDataSource)
            Me.dsEstabelecimento = value
        End Set
    End Property
End Class
