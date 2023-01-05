

Partial Class Controles_wucMercadologicoMP
    Inherits System.Web.UI.UserControl

    Dim strConn As String = clData_gerManager.dbConnect '"Data Source=CONTROLADORIA1\SQLCONTRO;Initial Catalog=gerManager;Persist Security Info=True;User ID=sa;Password=rd700@1"
    Public Event ListTotalChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event ListDeptoChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event ListSecaoChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event ListGrupoChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event ListSubgrupoChanged(ByVal sender As Object, ByVal e As EventArgs)

    Public Event opcaoTotalChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event opcaoDeptoChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event opcaoSecaoChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event opcaoGrupoChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event opcaoSubgrupoChanged(ByVal sender As Object, ByVal e As EventArgs)

#Region "_Checked"

    Public Property opcaoTotalChecked() As Boolean
        Get
            Return Me.rndTotal.Checked
        End Get
        Set(ByVal value As Boolean)
            Me.rndTotal.Checked = value
        End Set
    End Property

    Public Property opcaoDeptoChecked() As Boolean
        Get
            Return Me.rndDepto.Checked
        End Get
        Set(ByVal value As Boolean)
            Me.rndDepto.Checked = value
        End Set
    End Property

    Public Property opcaoSecaoChecked() As Boolean
        Get
            Return Me.rndSecao.Checked
        End Get
        Set(ByVal value As Boolean)
            Me.rndSecao.Checked = value
        End Set
    End Property

    Public Property opcaoGrupoChecked() As Boolean
        Get
            Return Me.rndGrupo.Checked
        End Get
        Set(ByVal value As Boolean)
            Me.rndGrupo.Checked = value
        End Set
    End Property

    Public Property opcaoSubgrupoChecked() As Boolean
        Get
            Return Me.rndSubgrupo.Checked
        End Get
        Set(ByVal value As Boolean)
            Me.rndSubgrupo.Checked = value
        End Set
    End Property

#End Region

    Public Property CallDepto() As String
        Get
            Return cboDepto.SelectedValue
        End Get
        Set(ByVal value As String)
            cboDepto.Text = value
        End Set
    End Property

    Public Property CallDeptoDescricao() As String
        Get
            Return cboDepto.SelectedItem.ToString
        End Get
        Set(ByVal value As String)
            cboDepto.Text = value
        End Set
    End Property

    Public Property CallSecao() As String
        Get
            Return cboSecao.SelectedValue
        End Get
        Set(ByVal value As String)
            cboSecao.Text = value
        End Set
    End Property

    Public Property CallSecaoDescricao() As String
        Get
            Return cboSecao.SelectedItem.ToString
        End Get
        Set(ByVal value As String)
            cboSecao.Text = value
        End Set
    End Property

    Public Property CallGrupo() As String
        Get
            Return cboGrupo.SelectedValue
        End Get
        Set(ByVal value As String)
            cboGrupo.Text = value
        End Set
    End Property

    Public Property CallGrupoDescricao() As String
        Get
            Return cboGrupo.SelectedItem.ToString
        End Get
        Set(ByVal value As String)
            cboGrupo.Text = value
        End Set
    End Property

    Public Property CallSubgrupo() As String
        Get
            Return cboSubgrupo.SelectedValue
        End Get
        Set(ByVal value As String)
            cboSubgrupo.Text = value
        End Set
    End Property

    Public Property CallSubgrupoDescricao() As String
        Get
            Return cboSubgrupo.SelectedItem.ToString
        End Get
        Set(ByVal value As String)
            cboSubgrupo.Text = value
        End Set
    End Property

    Public Property Enabled_cboGrupo() As Boolean
        Get
            Return cboGrupo.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboGrupo.Enabled = value
        End Set
    End Property

    Public Property Enabled_cboSubgrupo() As Boolean
        Get
            Return cboSubgrupo.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboSubgrupo.Enabled = value
        End Set
    End Property

#Region " Visible"

    Public Property Visible_rndTotal() As Boolean
        Get
            Return rndTotal.Visible
        End Get
        Set(ByVal value As Boolean)
            rndTotal.Visible = value
        End Set
    End Property

    Public Property Visible_rndDepto() As Boolean
        Get
            Return rndDepto.Visible
        End Get
        Set(ByVal value As Boolean)
            rndDepto.Visible = value
        End Set
    End Property

    Public Property Visible_Depto() As Boolean
        Get
            Return cboDepto.Visible
        End Get
        Set(ByVal value As Boolean)
            cboDepto.Visible = value
        End Set
    End Property

    Public Property Visible_Secao() As Boolean
        Get
            Return cboSecao.Visible
        End Get
        Set(ByVal value As Boolean)
            cboSecao.Visible = value
        End Set
    End Property

    Public Property Visible_Grupo() As Boolean
        Get
            Return cboGrupo.Visible
        End Get
        Set(ByVal value As Boolean)
            cboGrupo.Visible = value
        End Set
    End Property

    Public Property Visible_cboSubgrupo() As Boolean
        Get
            Return cboSubgrupo.Visible
        End Get
        Set(ByVal value As Boolean)
            cboSubgrupo.Visible = value
        End Set
    End Property

    Public Property Visible_LabelSubGrupo() As Boolean
        Get
            Return lblSubgrupo.Visible
        End Get
        Set(ByVal value As Boolean)
            lblSubgrupo.Visible = value
        End Set
    End Property

    Public Property Visible_LegendaDepto() As Boolean
        Get
            Return lblDepto.Visible
        End Get
        Set(ByVal value As Boolean)
            lblDepto.Visible = value
        End Set
    End Property

    Public Property Visible_LegendaSecao() As Boolean
        Get
            Return lblSecao.Visible
        End Get
        Set(ByVal value As Boolean)
            lblSecao.Visible = value
        End Set
    End Property

    Public Property Visible_LegendaGrupo() As Boolean
        Get
            Return lblGrupo.Visible
        End Get
        Set(ByVal value As Boolean)
            lblGrupo.Visible = value
        End Set
    End Property

    Public Property Visible_LegendaSubgrupo() As Boolean
        Get
            Return lblSubgrupo.Visible
        End Get
        Set(ByVal value As Boolean)
            lblSubgrupo.Visible = value
        End Set
    End Property

#End Region

#Region " AutoPostBack"

    Public Property AutoPostBack_Depto() As Boolean
        Get
            Return cboDepto.AutoPostBack
        End Get
        Set(ByVal value As Boolean)
            cboDepto.AutoPostBack = value
        End Set
    End Property

    Public Property AutoPostBack_Secao() As Boolean
        Get
            Return cboSecao.AutoPostBack
        End Get
        Set(ByVal value As Boolean)
            cboSecao.AutoPostBack = value
        End Set
    End Property

    Public Property AutoPostBack_Grupo() As Boolean
        Get
            Return cboGrupo.AutoPostBack
        End Get
        Set(ByVal value As Boolean)
            cboGrupo.AutoPostBack = value
        End Set
    End Property

    Public Property AutoPostBack_Subgrupo() As Boolean
        Get
            Return cboSubgrupo.AutoPostBack
        End Get
        Set(ByVal value As Boolean)
            cboSubgrupo.AutoPostBack = value
        End Set
    End Property

#End Region


    Protected Sub cboDepto_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboDepto.SelectedIndexChanged
        Me.cboSecao.DataBind()
        RaiseEvent ListDeptoChanged(sender, e)

    End Sub

    Protected Sub cboSecao_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboSecao.SelectedIndexChanged
        Me.cboGrupo.DataBind()
        RaiseEvent ListSecaoChanged(sender, e)

    End Sub

    Protected Sub cboGrupo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboGrupo.SelectedIndexChanged
        Me.cboSubgrupo.DataBind()
        RaiseEvent ListGrupoChanged(sender, e)
    End Sub

    Protected Sub cboSubgrupo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboSubgrupo.SelectedIndexChanged
        RaiseEvent ListSubgrupoChanged(sender, e)
    End Sub

    Private Sub Exibir_Departamento()
        Me.lblDepto.Visible = True
        Me.cboDepto.Visible = True
    End Sub

    Private Sub Exibir_Secao()
        Me.lblDepto.Visible = True
        Me.cboDepto.Visible = True

        Me.lblSecao.Visible = True
        Me.cboSecao.Visible = True
    End Sub

    Private Sub Exibir_Grupo()
        Me.lblDepto.Visible = True
        Me.cboDepto.Visible = True

        Me.lblSecao.Visible = True
        Me.cboSecao.Visible = True

        Me.lblGrupo.Visible = True
        Me.cboGrupo.Visible = True
    End Sub

    Private Sub Exibir_Subgrupo()
        Me.lblDepto.Visible = True
        Me.cboDepto.Visible = True

        Me.lblSecao.Visible = True
        Me.cboSecao.Visible = True

        Me.lblGrupo.Visible = True
        Me.cboGrupo.Visible = True

        Me.lblSubgrupo.Visible = True
        Me.cboSubgrupo.Visible = True
    End Sub

    Private Sub OcultarTodos()
        Me.lblDepto.Visible = False
        Me.cboDepto.Visible = False

        Me.lblSecao.Visible = False
        Me.cboSecao.Visible = False

        Me.lblGrupo.Visible = False
        Me.cboGrupo.Visible = False

        Me.lblSubgrupo.Visible = False
        Me.cboSubgrupo.Visible = False
    End Sub

    Protected Sub rndTotal_CheckedChanged(sender As Object, e As EventArgs) Handles rndTotal.CheckedChanged
        RaiseEvent opcaoTotalChanged(sender, e)
        If rndTotal.Checked = True Then Call OcultarTodos()
    End Sub

    Protected Sub rndDepto_CheckedChanged(sender As Object, e As EventArgs) Handles rndDepto.CheckedChanged
        RaiseEvent opcaoDeptoChanged(sender, e)
        If Me.rndDepto.Checked = True Then
            Call OcultarTodos()
            Call Exibir_Departamento()
        End If
    End Sub

    Protected Sub rndSecao_CheckedChanged(sender As Object, e As EventArgs) Handles rndSecao.CheckedChanged
        If Me.rndSecao.Checked = True Then
            Call OcultarTodos()
            Call Exibir_Departamento()
            Call Exibir_Secao()
            RaiseEvent opcaoSecaoChanged(sender, e)
        End If
    End Sub

    Protected Sub rndGrupo_CheckedChanged(sender As Object, e As EventArgs) Handles rndGrupo.CheckedChanged
        If Me.rndGrupo.Checked = True Then
            Call OcultarTodos()
            Call Exibir_Departamento()
            Call Exibir_Secao()
            Call Exibir_Grupo()
            RaiseEvent opcaoGrupoChanged(sender, e)
        End If
    End Sub

    Protected Sub rndSubgrupo_CheckedChanged(sender As Object, e As EventArgs) Handles rndSubgrupo.CheckedChanged
        If Me.rndSubgrupo.Checked = True Then
            Call OcultarTodos()
            Call Exibir_Departamento()
            Call Exibir_Secao()
            Call Exibir_Grupo()
            Call Exibir_Subgrupo()
            RaiseEvent opcaoSubgrupoChanged(sender, e)
        End If
    End Sub


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'Dim oProjeto As New Projeto
            'Select Case LCase(Trim(oProjeto.BuscarLocalDoUsuario(Page.User.Identity.Name)))
            '    Case "loja"
            Me.cboDepto.DataBind()
            Me.cboSecao.DataBind()
            'End Select
        End If

    End Sub
End Class
