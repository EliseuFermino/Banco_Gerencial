
Partial Class wucListaDiaD
    Inherits System.Web.UI.UserControl

    Public Event ListDiaChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event DiaVoltaClick(ByVal sender As Object, ByVal e As EventArgs)
    Public Event DiaVaiClick(ByVal sender As Object, ByVal e As EventArgs)

    Public Property CallDia() As Date
        Get
            Return cboDia.Date
        End Get
        Set(ByVal value As Date)
            cboDia.Date = value
        End Set
    End Property

    Protected Sub cboDia_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboDia.Init
        If Not IsPostBack Then
            Me.cboDia.Date = DateAndTime.Now()
            Me.lblDiaDaSemana.Text = Me.cboDia.Date.ToString("dddd")
        End If

    End Sub

    Public Property Enabled_cboDia() As Boolean
        Get
            Return cboDia.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboDia.Enabled = value
        End Set
    End Property

    Protected Sub cboDia_DateChanged(sender As Object, e As System.EventArgs) Handles cboDia.DateChanged
        RaiseEvent ListDiaChanged(sender, e)
        Me.lblDiaDaSemana.Text = Me.cboDia.Date.ToString("dddd")
        Session("sDIA") = cboDia.Date
    End Sub

    Protected Sub btnVolta_Click(sender As Object, e As EventArgs) Handles btnVolta.Click
        Me.cboDia.Date = CDate(Me.cboDia.Date).AddDays(-1)
        Call DiaDaSemana()
        Session("sDIA") = cboDia.Date
        RaiseEvent DiaVoltaClick(sender, e)
    End Sub

    Protected Sub btnAvanca_Click(sender As Object, e As EventArgs) Handles btnAvanca.Click
        Me.cboDia.Date = CDate(Me.cboDia.Date).AddDays(1)
        Call DiaDaSemana()
        Session("sDIA") = cboDia.Date
        RaiseEvent DiaVaiClick(sender, e)
    End Sub

    Private Sub DiaDaSemana()
        Me.lblDiaDaSemana.Visible = True
        Me.lblDiaDaSemana.Text = CDate(Me.cboDia.Date).ToString("dddd")
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Me.lblDiaDaSemana.Text = CDate(Me.cboDia.Date).ToString("dddd")
            Session("sDIA") = cboDia.Date
        End If
    End Sub

    Public Property AutoPostBack() As Boolean
        Get
            Return cboDia.AutoPostBack
        End Get
        Set(ByVal value As Boolean)
            cboDia.AutoPostBack = value
        End Set
    End Property

    Public Property Visible_btnAvanca() As Boolean
        Get
            Return btnAvanca.Visible
        End Get
        Set(ByVal value As Boolean)
            btnAvanca.Visible = value
        End Set
    End Property

    Public Property Visible_btnVolta() As Boolean
        Get
            Return btnVolta.Visible
        End Get
        Set(ByVal value As Boolean)
            btnVolta.Visible = value
        End Set
    End Property

    Public Property Visible_lblDiaDaSemana() As Boolean
        Get
            Return lblDiaDaSemana.Visible
        End Get
        Set(ByVal value As Boolean)
            lblDiaDaSemana.Visible = value
        End Set
    End Property
End Class
