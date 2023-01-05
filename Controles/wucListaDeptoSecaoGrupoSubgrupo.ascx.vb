

Partial Class Controles_wucLista_DeptoSecaoGrupoSubgrupo
    Inherits System.Web.UI.UserControl

    Dim strConn As String = clData_gerManager.dbConnect '"Data Source=CONTROLADORIA1\SQLCONTRO;Initial Catalog=gerManager;Persist Security Info=True;User ID=sa;Password=rd700@1"
    Public Event ListDeptoChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event ListSecaoChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event ListGrupoChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event ListSubgrupoChanged(ByVal sender As Object, ByVal e As EventArgs)

    Public Property CallDepto() As String
        Get
            Return cboDepto.Text
        End Get
        Set(ByVal value As String)
            cboDepto.Text = value
        End Set
    End Property

    Public Property CallDeptoDescricao() As String
        Get
            Return cboDepto.SelectedItem.Text
        End Get
        Set(ByVal value As String)
            cboDepto.SelectedItem.Text = value
        End Set
    End Property

    Public Property CallSecao() As String
        Get
            Return cboSecao.Text
        End Get
        Set(ByVal value As String)
            cboSecao.Text = value
        End Set
    End Property

    Public Property CallSecaoDescricao() As String
        Get
            Return cboSecao.SelectedItem.Text
        End Get
        Set(ByVal value As String)
            cboSecao.SelectedItem.Text = value
        End Set
    End Property

    Public Property CallGrupo() As String
        Get
            Return cboGrupo.Text
        End Get
        Set(ByVal value As String)
            cboGrupo.Text = value
        End Set
    End Property

    Public Property CallGrupoDescricao() As String
        Get
            Return cboGrupo.SelectedItem.Text
        End Get
        Set(ByVal value As String)
            cboGrupo.SelectedItem.Text = value
        End Set
    End Property

    Public Property CallSubgrupo() As String
        Get
            Return cboSubgrupo.Text
        End Get
        Set(ByVal value As String)
            cboSubgrupo.Text = value
        End Set
    End Property

    Public Property CallSubgrupoDescricao() As String
        Get
            Return cboSubgrupo.SelectedItem.Text
        End Get
        Set(ByVal value As String)
            cboSubgrupo.SelectedItem.Text = value
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
            Return cboSubGrupo.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboSubGrupo.Enabled = value
        End Set
    End Property

#Region " Visible"

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
        RaiseEvent ListDeptoChanged(sender, e)
    End Sub

    Protected Sub cboSecao_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboSecao.SelectedIndexChanged
        RaiseEvent ListSecaoChanged(sender, e)
    End Sub

    Protected Sub cboGrupo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboGrupo.SelectedIndexChanged
        RaiseEvent ListGrupoChanged(sender, e)
    End Sub

    Protected Sub cboSubgrupo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboSubgrupo.SelectedIndexChanged
        RaiseEvent ListSubgrupoChanged(sender, e)
    End Sub

End Class
