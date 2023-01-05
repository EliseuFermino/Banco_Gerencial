
Partial Class Controles_wucOpcoesResultadoOne
    Inherits System.Web.UI.UserControl

    Public Event chkAnoAnterior_CheckedChanged_RE(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chkMetaOriginal_CheckedChanged_RE(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chkMetaRevista_CheckedChanged_RE(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chkMesAnterior_CheckedChanged_RE(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chkRealizado_CheckedChanged_RE(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chkDiferencas_CheckedChanged_RE(ByVal sender As Object, ByVal e As EventArgs)
    Public Event chkCrescimento_CheckedChanged_RE(ByVal sender As Object, ByVal e As EventArgs)


    Protected Sub chkAnoAnterior_CheckedChanged(sender As Object, e As EventArgs) Handles chkAnoAnterior.CheckedChanged
        RaiseEvent chkAnoAnterior_CheckedChanged_RE(sender, e)
    End Sub

    Protected Sub chkMetaOriginal_CheckedChanged(sender As Object, e As EventArgs) Handles chkMetaOriginal.CheckedChanged
        RaiseEvent chkMetaOriginal_CheckedChanged_RE(sender, e)
    End Sub

    Protected Sub chkMetaRevista_CheckedChanged(sender As Object, e As EventArgs) Handles chkMetaRevista.CheckedChanged
        RaiseEvent chkMetaRevista_CheckedChanged_RE(sender, e)
    End Sub

    Protected Sub chkMesAnterior_CheckedChanged(sender As Object, e As EventArgs) Handles chkMesAnterior.CheckedChanged
        RaiseEvent chkMesAnterior_CheckedChanged_RE(sender, e)
    End Sub

    Protected Sub chkRealizado_CheckedChanged(sender As Object, e As EventArgs) Handles chkRealizado.CheckedChanged
        RaiseEvent chkRealizado_CheckedChanged_RE(sender, e)
    End Sub

    Protected Sub chkDiferencas_CheckedChanged(sender As Object, e As EventArgs) Handles chkDiferencas.CheckedChanged
        RaiseEvent chkDiferencas_CheckedChanged_RE(sender, e)
    End Sub

    Protected Sub chkCrescimento_CheckedChanged(sender As Object, e As EventArgs) Handles chkCrescimento.CheckedChanged
        RaiseEvent chkCrescimento_CheckedChanged_RE(sender, e)
    End Sub

    'CHECKED

    Public Property chkAnoAnterior_Checked() As Boolean
        Get
            Return chkAnoAnterior.Checked
        End Get
        Set(ByVal value As Boolean)
            chkAnoAnterior.Checked = value
        End Set
    End Property

    Public Property chkMetaOriginal_Checked() As Boolean
        Get
            Return chkMetaOriginal.Checked
        End Get
        Set(ByVal value As Boolean)
            chkMetaOriginal.Checked = value
        End Set
    End Property

    Public Property chkMetaRevista_Checked() As Boolean
        Get
            Return chkMetaRevista.Checked
        End Get
        Set(ByVal value As Boolean)
            chkMetaRevista.Checked = value
        End Set
    End Property

    Public Property chkMesAnterior_Checked() As Boolean
        Get
            Return chkMesAnterior.Checked
        End Get
        Set(ByVal value As Boolean)
            chkMesAnterior.Checked = value
        End Set
    End Property

    Public Property chkRealizado_Checked() As Boolean
        Get
            Return chkRealizado.Checked
        End Get
        Set(ByVal value As Boolean)
            chkRealizado.Checked = value
        End Set
    End Property

    Public Property chkDiferencas_Checked() As Boolean
        Get
            Return chkDiferencas.Checked
        End Get
        Set(ByVal value As Boolean)
            chkDiferencas.Checked = value
        End Set
    End Property

    Public Property chkCrescimento_Checked() As Boolean
        Get
            Return chkCrescimento.Checked
        End Get
        Set(ByVal value As Boolean)
            chkCrescimento.Checked = value
        End Set
    End Property


End Class
