
Partial Class wucListaPosicao
    Inherits System.Web.UI.UserControl

    Public Event ListPosicaoChanged(ByVal sender As Object, ByVal e As EventArgs)

    Public Property CallPosicao() As String
        Get
            Return cboPosição.Value
        End Get
        Set(ByVal value As String)
            cboPosição.Value = value
        End Set
    End Property

    Public Property aVisible() As Boolean
        Get
            Return cboPosição.Visible
        End Get
        Set(ByVal value As Boolean)
            cboPosição.Visible = value
        End Set
    End Property

    Public Property Enabled() As Boolean
        Get
            Return cboPosição.Value
        End Get
        Set(ByVal value As Boolean)
            cboPosição.Enabled = value
        End Set
    End Property

    Public Property SelectedValue() As String
        Get
            Return cboPosição.Value
        End Get
        Set(ByVal value As String)
            cboPosição.Value = value
        End Set
    End Property

    Public Property AutoPostBack() As Boolean
        Get
            Return cboPosição.AutoPostBack
        End Get
        Set(ByVal value As Boolean)
            cboPosição.AutoPostBack = value
        End Set
    End Property

    Protected Sub cboPosição_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboPosição.SelectedIndexChanged
        RaiseEvent ListPosicaoChanged(sender, e)
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim varPosicao As Byte  ' 0 - Fase do Orçamento   1 - Fechado ja (DEFINITIVO)

            varPosicao = 0  ' Colocar algoritimo para buscar essa posicao

            If varPosicao = 1 Then
                Me.cboPosição.Enabled = False
                cboPosição.SelectedIndex = 2
                Session("sPOSICAO") = cboPosição.SelectedIndex = 2
            Else

                Dim oProjeto As New Projeto

                Select Case LCase(Trim(oProjeto.BuscarDepartamentoDoUsuario(Page.User.Identity.Name)))
                    Case "administração", "rh_folha", "gerente_rh"
                        Me.cboPosição.Enabled = False
                        Me.cboPosição.Text = "Administração"
                    Case "entreposto"
                        Me.cboPosição.Enabled = False
                        Me.cboPosição.Text = "Administração"
                    Case "tesouraria"
                        Me.cboPosição.Enabled = False
                        Me.cboPosição.Text = "Administração"
                    Case "diretor", "contabilidade", "gerente_contabilidade", "gerente_financeiro", "diretor_informatica", "diretor_marketing", "trade marketing", "gerente_patrimonio"
                        Me.cboPosição.Enabled = False
                        Me.cboPosição.Text = "Administração"
                    Case "marketing"
                        Me.cboPosição.Enabled = False
                        Me.cboPosição.Text = "Administração"
                    Case "loja", "gerente_cd"
                        Me.cboPosição.Enabled = False
                        Me.cboPosição.Text = "Loja"  'Original 1
                    Case "supervisor", "supervisor_m"
                        Me.cboPosição.Enabled = True
                        Me.cboPosição.Text = "Loja"
                    Case "controladoria"
                        Me.cboPosição.Enabled = True
                        Me.cboPosição.Text = "Administração"
                    Case "informática"
                        Me.cboPosição.Enabled = False
                        Me.cboPosição.Text = "Administração"
                    Case "comercial"
                        Me.cboPosição.Enabled = False
                        Me.cboPosição.Text = "Comercial"
                    Case "gestor_comercial"
                        Me.cboPosição.Enabled = False
                        Me.cboPosição.Text = "Comercial"
                    Case "postos"
                        Me.cboPosição.Enabled = False
                        Me.cboPosição.Text = "Postos"
                    Case Else
                        Me.cboPosição.Enabled = True
                End Select

            End If

        End If
    End Sub
End Class
