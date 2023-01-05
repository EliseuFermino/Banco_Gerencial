
Partial Class Controles_wucChkMesmosDias
    Inherits System.Web.UI.UserControl

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub

    Public Property Visible_chkMesmosDias() As Boolean
        Get
            Return chkMesmosDias.Visible
        End Get
        Set(ByVal value As Boolean)
            chkMesmosDias.Visible = value
        End Set
    End Property

    Public Property Enabled_chkMesmosDias() As Boolean
        Get
            Return chkMesmosDias.Enabled
        End Get
        Set(ByVal value As Boolean)
            chkMesmosDias.Enabled = value
        End Set
    End Property

End Class
