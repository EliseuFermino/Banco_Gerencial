
Partial Class Controles_wucLista_Filial_Empresa_1
    Inherits System.Web.UI.UserControl

    Public Event ListFilialChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event optEmpresaChanged(ByVal sender As Object, ByVal e As EventArgs)

    Dim oProjeto As New Projeto

    Public Property CallFilial() As Int16
        Get
            Return cboFilial.Value
        End Get
        Set(ByVal value As Int16)
            cboFilial.Value = value
        End Set
    End Property

    Public Property CallFilial_Text() As String
        Get
            Return cboFilial.Text
        End Get
        Set(ByVal value As String)
            cboFilial.Text = value
        End Set
    End Property

    Public Property AutoPostBack() As Boolean
        Get
            Return cboFilial.AutoPostBack
        End Get
        Set(ByVal value As Boolean)
            cboFilial.AutoPostBack = value
        End Set
    End Property

    Public Property AutoPostBack_Empresa() As Boolean
        Get
            Return optEmpresa.AutoPostBack
        End Get
        Set(ByVal value As Boolean)
            optEmpresa.AutoPostBack = value
        End Set
    End Property

    Public Property Checked_Empresa() As Boolean
        Get
            Return optEmpresa.Checked
        End Get
        Set(ByVal value As Boolean)
            optEmpresa.Checked = value
        End Set
    End Property

    Public Property Enabled_Filial() As Boolean
        Get
            Return cboFilial.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboFilial.Enabled = value
        End Set
    End Property

    'Protected Sub panelFilial_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles panelFilial.Callback
    '    If optEmpresa.Checked = True Then
    '        Session("sFILIAL") = 99
    '        cboFilial.Enabled = False
    '    End If

    '    If optEmpresa.Checked = False Then
    '        Session("sFILIAL") = cboFilial.Value
    '        cboFilial.Enabled = True
    '    End If


    'End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Select Case LCase(Trim(oProjeto.BuscarLocalDoUsuario(Page.User.Identity.Name)))
                Case "adm"
                    Me.cboFilial.Enabled = True
                    Session("sFILIAL") = 3
                    cboFilial.Text = "03 - S. Felicidade"
                Case "supervisor"
                    Me.cboFilial.Enabled = True
                Case "loja"
                    Me.cboFilial.Enabled = False
                    optEmpresa.Visible = False
                Case Else
                    Me.cboFilial.Enabled = True
                    Session("sFILIAL") = 3
                    cboFilial.Text = "03 - S. Felicidade"
            End Select

            Me.cboFilial.Value = oProjeto.Filial

        End If
    End Sub

    'Protected Sub cboFilial_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboFilial.SelectedIndexChanged
    '    RaiseEvent ListFilialChanged(sender, e)
    '    Session("sFILIAL") = cboFilial.Value
    'End Sub

    Public Property Visible_Empresa As Boolean
        Get
            Return optEmpresa.Visible
        End Get
        Set(ByVal value As Boolean)
            optEmpresa.Visible = value
        End Set
    End Property

    'Protected Sub optEmpresa_CheckedChanged(sender As Object, e As EventArgs) Handles optEmpresa.CheckedChanged
    '    RaiseEvent optEmpresaChanged(sender, e)

    '    If optEmpresa.Checked = True Then
    '        Session("sFILIAL") = 99
    '        cboFilial.Text = "99 - Empresa"
    '        cboFilial.Enabled = False
    '    End If

    '    If optEmpresa.Checked = False Then

    '        Session("sFILIAL") = 3
    '        'cboFilial.Text = "03 - S. Felicidade"
    '        cboFilial.Value = 3

    '        cboFilial.Enabled = True
    '    End If
    'End Sub
End Class
