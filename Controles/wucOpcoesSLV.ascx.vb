
Partial Class Controles_wucOpcoesSLV
    Inherits System.Web.UI.UserControl

    Public Event chkAAChecked(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chkMetaChecked(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chkAnoAtualChecked(ByVal sender As Object, ByVal e As EventArgs)

#Region " Enabled"

    Public Property chkAA_Enabled() As Boolean
        Get
            Return chkAnoAnterior.Enabled
        End Get
        Set(ByVal value As Boolean)
            chkAnoAnterior.Enabled = value
        End Set
    End Property

    Public Property chkMeta_Enabled() As Boolean
        Get
            Return chkMeta.Enabled
        End Get
        Set(ByVal value As Boolean)
            chkMeta.Enabled = value
        End Set
    End Property

    Public Property chkAnoAtual_Enabled() As Boolean
        Get
            Return chkAnoAtual.Enabled
        End Get
        Set(ByVal value As Boolean)
            chkAnoAtual.Enabled = value
        End Set
    End Property

#End Region

#Region " Visible"

    Public Property chkAA_Visible() As Boolean
        Get
            Return chkAnoAnterior.Visible
        End Get
        Set(ByVal value As Boolean)
            chkAnoAnterior.Visible = value
        End Set
    End Property

    Public Property chkMeta_Visible() As Boolean
        Get
            Return chkMeta.Visible
        End Get
        Set(ByVal value As Boolean)
            chkMeta.Visible = value
        End Set
    End Property

    Public Property chkAnoAtual_Visible() As Boolean
        Get
            Return chkAnoAtual.Visible
        End Get
        Set(ByVal value As Boolean)
            chkAnoAtual.Visible = value
        End Set
    End Property

#End Region

#Region " Checked"

    Public Property chkAA_Checked() As Boolean
        Get
            Return chkAnoAnterior.Checked
        End Get
        Set(ByVal value As Boolean)
            chkAnoAnterior.Checked = value
        End Set
    End Property

    Public Property chkMeta_Checked() As Boolean
        Get
            Return chkMeta.Checked
        End Get
        Set(ByVal value As Boolean)
            chkMeta.Checked = value
        End Set
    End Property

    Public Property chkAnoAtual_Checked() As Boolean
        Get
            Return chkAnoAtual.Checked
        End Get
        Set(ByVal value As Boolean)
            chkAnoAtual.Checked = value
        End Set
    End Property

#End Region

#Region " Controles_CheckedChanged"

    Protected Sub chkMeta_CheckedChanged(sender As Object, e As EventArgs) Handles chkMeta.CheckedChanged
        RaiseEvent chkMetaChecked(sender, e)
    End Sub

    Protected Sub chkAnoAnterior_CheckedChanged(sender As Object, e As EventArgs) Handles chkAnoAnterior.CheckedChanged
        RaiseEvent chkAAChecked(sender, e)
    End Sub

    Protected Sub chkAnoAtual_CheckedChanged(sender As Object, e As EventArgs) Handles chkAnoAtual.CheckedChanged
        RaiseEvent chkAnoAtualChecked(sender, e)
    End Sub

#End Region

#Region " AutoPostBack"
    Public Property chkAA_AutoPostBack() As Boolean
        Get
            Return chkAnoAnterior.AutoPostBack
        End Get
        Set(ByVal value As Boolean)
            chkAnoAnterior.AutoPostBack = value
        End Set
    End Property
#End Region

End Class
