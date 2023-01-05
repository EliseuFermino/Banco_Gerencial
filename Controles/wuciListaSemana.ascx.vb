
Partial Class Controles_wuciListaSemana
    Inherits System.Web.UI.UserControl

    Public Event ListSemanaChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public vSemana As String

    Public Property CallSemana() As Byte
        Get
            Return cboSemana.Value
        End Get
        Set(ByVal value As Byte)
            cboSemana.Text = value
        End Set
    End Property

    Public Property CallSemanaDesc() As String
        Get
            Return cboSemana.Text
        End Get
        Set(ByVal value As String)
            cboSemana.Text = value
        End Set
    End Property

    Public Property AutoPostBack() As Boolean
        Get
            Return cboSemana.AutoPostBack
        End Get
        Set(ByVal value As Boolean)
            cboSemana.AutoPostBack = value
        End Set
    End Property

    Protected Sub cboSemana_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboSemana.SelectedIndexChanged
        RaiseEvent ListSemanaChanged(sender, e)
    End Sub

    Public Property Enabled_cboSemana() As Boolean
        Get
            Return cboSemana.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboSemana.Enabled = value
        End Set
    End Property

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Me.cboSemana.Text = 1
        End If
    End Sub
End Class
