
Partial Class wucListaLojasComApoio
    Inherits System.Web.UI.UserControl

    Public Event ListFilialChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public vLoja As String

    Public Property CallFilial() As String
        Get
            Return cboFilial.Value
        End Get
        Set(ByVal value As String)
            cboFilial.Text = value
        End Set
    End Property

    Public Property cboFilial_AutoPostBack() As Boolean
        Get
            Return cboFilial.AutoPostBack
        End Get
        Set(ByVal value As Boolean)
            cboFilial.AutoPostBack = value
        End Set
    End Property

    Public Property IsLoja() As Boolean
        Get
            IsLoja = vLoja
        End Get
        Set(ByVal value As Boolean)
            vLoja = value
        End Set
    End Property

    Protected Sub cboFilial_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboFilial.Init
        Dim oProjeto As New Projeto
        Dim oMyFunction As New MyFunction

        Select Case LCase(Trim(oProjeto.BuscarDepartamentoDoUsuario(Page.User.Identity.Name)))
            Case "administração"
                Me.cboFilial.Enabled = True
                Me.cboFilial.Text = 3
                IsLoja = False
            Case "loja"
                Me.cboFilial.Enabled = False
                IsLoja = True

                oMyFunction.DefinirLojaAdm(Page.User.Identity.Name)
                Me.cboFilial.Text = oMyFunction.vFilial

                'If StrConv(Left(Page.User.Identity.Name, 4), VbStrConv.Lowercase) = "loja" Then
                '    'Define a filial da loja
                '    If Len(Page.User.Identity.Name) = 5 Then   'Loja9 - até 9
                '        Me.cboFilial.Text = Right(Page.User.Identity.Name, 1)
                '    ElseIf Len(Page.User.Identity.Name) = 6 Then 'Loja11 - Maior que 9
                '        Me.cboFilial.Text = Right(Page.User.Identity.Name, 2)
                '    End If
                'End If
            Case "perdas"
                Me.cboFilial.Enabled = False
                IsLoja = True

                oMyFunction.DefinirLojaAdm(Page.User.Identity.Name)
                Me.cboFilial.Text = oMyFunction.vFilial
            Case "controladoria"
                Me.cboFilial.Enabled = True
                Me.cboFilial.Text = 3
                IsLoja = False
            Case "Supervisor", "Supervisor_M"
                Me.cboFilial.Enabled = True
                Me.cboFilial.Text = 3
                IsLoja = False
            Case Else
                Me.cboFilial.Enabled = True
                Me.cboFilial.Text = 3
                IsLoja = False
        End Select

    End Sub

    Protected Sub cboFilial_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboFilial.SelectedIndexChanged
        RaiseEvent ListFilialChanged(sender, e)
    End Sub

    Public Property cboFilial_Enalble() As Boolean
        Get
            Return cboFilial.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboFilial.Enabled = value
        End Set
    End Property

#Region " Visible"

    Public Property cboFilial_Visible() As Boolean
        Get
            Return cboFilial.Visible
        End Get
        Set(ByVal value As Boolean)
            cboFilial.Visible = value
        End Set
    End Property

    Public Property cboFilial_Visible_Legenda() As Boolean
        Get
            Return lblFilial.Visible
        End Get
        Set(ByVal value As Boolean)
            lblFilial.Visible = value
        End Set
    End Property

#End Region



End Class
