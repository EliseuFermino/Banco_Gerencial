
Partial Class Controles_wuciAno
    Inherits System.Web.UI.UserControl

    Public Event ListAnoChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event ListMesChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event BotaoClick(ByVal sender As Object, ByVal e As EventArgs)

    Public Property CallAno() As String
        Get
            Return cboAno.Value
        End Get
        Set(ByVal value As String)
            cboAno.Value = value
        End Set
    End Property

    Protected Sub cboAno_Load(sender As Object, e As EventArgs) Handles cboAno.Load
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

    Public Property Visible_btnAtualizar() As Boolean
        Get
            Return btnAtualizar.Visible
        End Get
        Set(ByVal value As Boolean)
            btnAtualizar.Visible = value
        End Set
    End Property

    Protected Sub btnAtualizar_BotaoClick(sender As Object, e As EventArgs) Handles btnAtualizar.BotaoClick
        RaiseEvent BotaoClick(sender, e)
    End Sub
End Class
