
Partial Class Controles_wucListaDiaIniFin
    Inherits System.Web.UI.UserControl

    Public Event ListDiaInicialChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event ListDiaFinalChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event MesmosDias_iCheckedChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event MesAnterior_iCheckedChanged(ByVal sender As Object, ByVal e As EventArgs)

    Public Property CallDiaInicial() As Date
        Get
            Return cboDiaInicial.Text
        End Get
        Set(ByVal value As Date)
            cboDiaInicial.Text = value

        End Set
    End Property

    Public Property CallDiaFinal() As Date
        Get
            Return cboDiaFinal.Text
        End Get
        Set(ByVal value As Date)
            cboDiaFinal.Text = value
        End Set
    End Property

    Public Property AutoPostBack_cboDiaInicial() As Boolean
        Get
            Return cboDiaInicial.AutoPostBack
        End Get
        Set(ByVal value As Boolean)
            cboDiaInicial.AutoPostBack = value
        End Set
    End Property

    Public Property AutoPostBack_cboDiaFinal() As Boolean
        Get
            Return cboDiaFinal.AutoPostBack
        End Get
        Set(ByVal value As Boolean)
            cboDiaFinal.AutoPostBack = value
        End Set
    End Property

    Public Property Enabled_cboDiaInicial() As Boolean
        Get
            Return cboDiaInicial.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboDiaInicial.Enabled = value
        End Set
    End Property

    Public Property Enabled_cboDiaFinal() As Boolean
        Get
            Return cboDiaFinal.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboDiaFinal.Enabled = value
        End Set
    End Property

    Public Property Visible_cboDiaFinal() As Boolean
        Get
            Return cboDiaFinal.Visible
        End Get
        Set(ByVal value As Boolean)
            cboDiaFinal.Visible = value

        End Set

    End Property

    Public Property DiaFinal_cboDiaFinal() As Date
        Get
            Return cboDiaFinal.MinDate
        End Get
        Set(ByVal value As Date)
            cboDiaFinal.MinDate = value
        End Set
    End Property

    'Protected Sub cboDiaFinal_DateChanged(sender As Object, e As EventArgs) Handles cboDiaFinal.DateChanged
    '    Session("sDIA_FINAL") = cboDiaFinal.Date
    '    RaiseEvent ListDiaFinalChanged(sender, e)
    'End Sub

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        If DateAndTime.Now = myDateTimes.GetFirstDayOfMonth(Date.Now) Then
            Me.cboDiaInicial.Value = myDateTimes.GetFirstDayOfMonth_MesAnterior(Date.Now)
        Else
            Me.cboDiaInicial.Value = myDateTimes.GetFirstDayOfMonth(Date.Now)
        End If
        Me.cboDiaFinal.Value = Date.Today.AddDays(-1)
    End Sub

#Region " Mesmos Dias"

    Public Property Checked_MesmosDias() As Boolean
        Get
            Return Me.chkMesmosDias.Checked
        End Get
        Set(ByVal value As Boolean)
            Me.chkMesmosDias.Checked = value
        End Set
    End Property

    Public Property Visible_MesmosDias() As Boolean
        Get
            Return Me.chkMesmosDias.Visible
        End Get
        Set(ByVal value As Boolean)
            Me.chkMesmosDias.Visible = value
        End Set
    End Property

    Public Property Enabled_MesmosDias() As Boolean
        Get
            Return Me.chkMesmosDias.Enabled
        End Get
        Set(ByVal value As Boolean)
            Me.chkMesmosDias.Enabled = value
        End Set
    End Property

#End Region

    'Protected Sub chkMesmosDias_CheckedChanged(sender As Object, e As EventArgs) Handles chkMesmosDias.CheckedChanged

    '    If chkMesmosDias.Checked = True Then
    '        Session("sMESMOSDIAS") = 2  'Mesmos Dias
    '    Else
    '        Session("sMESMOSDIAS") = 1  'Normal
    '    End If

    '    'lblError.Text = Session("sMESMOSDIAS")

    '    RaiseEvent MesmosDias_iCheckedChanged(sender, e)
    'End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            'Session("sDIA_INICIAL") = cboDiaInicial.Text
            'Session("sDIA_FINAL") = cboDiaFinal.Text
            'Session("sANO") = Year(cboDiaFinal.Text)
            'Session("sMES") = Month(cboDiaFinal.Text)

            'If Not IsPostBack Then
            '    Session("sMESMOSDIAS") = 1
            'End If
            'lblError.Text = Session("sMESMOSDIAS") & " - " & Session("sDIA_INICIAL") & " - " & Session("sDIA_FINAL")

        End If
        

    End Sub

    Protected Sub chkMesAnterior_CheckedChanged(sender As Object, e As EventArgs) Handles chkMesAnterior.CheckedChanged

        RaiseEvent MesAnterior_iCheckedChanged(sender, e)

        If chkMesAnterior.Checked = True Then
            chkMesmosDias.Checked = False
            chkMesmosDias.Visible = False
        End If

        If chkMesAnterior.Checked = False Then
            chkMesmosDias.Checked = True
            chkMesmosDias.Visible = True
        End If

    End Sub

#Region " Mes Anterior"

    Public Property Checked_MesAnterior() As Boolean
        Get
            Return Me.chkMesAnterior.Checked
        End Get
        Set(ByVal value As Boolean)
            Me.chkMesAnterior.Checked = value
        End Set
    End Property

    Public Property Visible_MesAnterior() As Boolean
        Get
            Return Me.chkMesAnterior.Visible
        End Get
        Set(ByVal value As Boolean)
            Me.chkMesAnterior.Visible = value
        End Set
    End Property

    Public Property Enabled_MesAnterior() As Boolean
        Get
            Return Me.chkMesAnterior.Enabled
        End Get
        Set(ByVal value As Boolean)
            Me.chkMesAnterior.Enabled = value
        End Set
    End Property

#End Region

    'Protected Sub cboDiaInicial_DateChanged(sender As Object, e As EventArgs) Handles cboDiaInicial.DateChanged
    '    Session("sDIA_INICIAL") = cboDiaInicial.Date
    'End Sub

  
    
End Class
