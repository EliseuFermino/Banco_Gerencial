
Partial Class Controles_wuciAno
    Inherits System.Web.UI.UserControl

    Public Event ListAnoChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event ListMesChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event ListFilialChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event BotaoClick(ByVal sender As Object, ByVal e As EventArgs)

    Public Property CallFilial() As String
        Get
            Return cboFilial.CallFilial
        End Get
        Set(ByVal value As String)
            cboFilial.CallFilial = value
        End Set
    End Property

    Public Property CallAno() As String
        Get
            Return cboAno.Value
        End Get
        Set(ByVal value As String)
            cboAno.Value = value
        End Set
    End Property

    Protected Sub cboAno_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.Init
        If Not IsPostBack Then
            Me.cboAno.Value = Year(Now())
        End If
    End Sub

    Public Property Enabled_cboAno() As Boolean
        Get
            Return cboAno.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboAno.Enabled = value
        End Set
    End Property

    Protected Sub cboAno_ValueChanged(sender As Object, e As EventArgs) Handles cboAno.ValueChanged
        RaiseEvent ListAnoChanged(sender, e)
    End Sub

    Public Property CallMes() As String
        Get
            Return cboMes.Value
        End Get
        Set(ByVal value As String)
            cboMes.Value = value
        End Set
    End Property

    Public Property CallMesDesc() As String
        Get
            Return cboMes.Text
        End Get
        Set(ByVal value As String)
            cboMes.Text = value
        End Set
    End Property

    Protected Sub cboMes_Load(sender As Object, e As EventArgs) Handles cboMes.Load
        If Not IsPostBack Then
            Me.cboMes.Text = Month(Now())
        End If
    End Sub

    Protected Sub cboMes_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboMes.SelectedIndexChanged
        RaiseEvent ListMesChanged(sender, e)
    End Sub

    Public Property Enabled_cboMes() As Boolean
        Get
            Return cboMes.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboMes.Enabled = value
        End Set
    End Property

    Protected Sub btnAtualizar_BotaoClick(sender As Object, e As EventArgs) Handles btnAtualizar.BotaoClick
        RaiseEvent BotaoClick(sender, e)
    End Sub

    Public Property cboMes_AutoPostBack() As Boolean
        Get
            Return cboMes.AutoPostBack
        End Get
        Set(ByVal value As Boolean)
            cboMes.AutoPostBack = value
        End Set
    End Property

    Public Property cboMes_Visible() As Boolean
        Get
            Return cboMes.Visible
        End Get
        Set(ByVal value As Boolean)
            cboMes.Visible = value
        End Set
    End Property

    Public Property cboAno_AutoPostBack() As Boolean
        Get
            Return cboAno.AutoPostBack
        End Get
        Set(ByVal value As Boolean)
            cboAno.AutoPostBack = value
        End Set
    End Property

    Public Property btnAtualizar_Visible() As Boolean
        Get
            Return btnAtualizar.Visible
        End Get
        Set(ByVal value As Boolean)
            btnAtualizar.Visible = value
        End Set
    End Property

    Public Property cboFilial_AutoPostBack() As Boolean
        Get
            Return cboFilial.cboFilial_AutoPostBack
        End Get
        Set(ByVal value As Boolean)
            cboFilial.cboFilial_AutoPostBack = value
        End Set
    End Property

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        RaiseEvent ListFilialChanged(sender, e)
    End Sub
End Class
