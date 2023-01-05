
Partial Class Controles_wucFixarCabecalho
    Inherits System.Web.UI.UserControl

    Public Event chkFixarCabecalhoChecked(ByVal sender As Object, ByVal e As EventArgs)

    Public Property Visibled() As Boolean
        Get
            Return chkFixarCabecalho.Visible
        End Get
        Set(ByVal value As Boolean)
            chkFixarCabecalho.Visible = value
        End Set
    End Property


    Public Property Checked() As Boolean
        Get
            Return chkFixarCabecalho.Checked
        End Get
        Set(ByVal value As Boolean)
            chkFixarCabecalho.Checked = value
        End Set
    End Property

    Public Property Enabled() As Boolean
        Get
            Return chkFixarCabecalho.Enabled
        End Get
        Set(ByVal value As Boolean)
            chkFixarCabecalho.Enabled = value
        End Set
    End Property

    Protected Sub chkFixarCabecalho_CheckedChanged(sender As Object, e As EventArgs) Handles chkFixarCabecalho.CheckedChanged
        RaiseEvent chkFixarCabecalhoChecked(sender, e)
    End Sub
End Class
