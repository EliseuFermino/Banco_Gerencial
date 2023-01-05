
Partial Class wucListaSecaoGrupo
    Inherits System.Web.UI.UserControl

    Public Event ListSecaoChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event ListGrupoChanged(ByVal sender As Object, ByVal e As EventArgs)

    Public Property CallGrupo() As String
        Get
            Return cboGrupo.Value
        End Get
        Set(ByVal value As String)
            cboGrupo.Value = value
        End Set
    End Property

    Public Property cboGrupo_Enabled() As Boolean
        Get
            Return cboGrupo.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboGrupo.Enabled = value
        End Set
    End Property

    Public Property cboSecao_Visible() As Boolean
        Get
            Return cboSecao.Visible
        End Get
        Set(ByVal value As Boolean)
            cboSecao.Visible = value
        End Set
    End Property

    Public Property cboGrupo_Visible() As Boolean
        Get
            Return cboGrupo.Visible
        End Get
        Set(ByVal value As Boolean)
            cboGrupo.Visible = value
        End Set
    End Property

    Protected Sub cboGrupo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboGrupo.SelectedIndexChanged
        RaiseEvent ListGrupoChanged(sender, e)
    End Sub

    Public Property AutoPostBack() As Boolean
        Get
            Return cboSecao.AutoPostBack
        End Get
        Set(ByVal value As Boolean)
            cboSecao.AutoPostBack = value
        End Set
    End Property

    Public Property cboGrupo_AutoPostBack() As Boolean
        Get
            Return cboGrupo.AutoPostBack
        End Get
        Set(ByVal value As Boolean)
            cboGrupo.AutoPostBack = value
        End Set
    End Property

    Public Property CallGrupoDesc() As String
        Get
            Return cboGrupo.Text
        End Get
        Set(ByVal value As String)
            cboGrupo.Text = value
        End Set
    End Property

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Me.cboSecao.AutoPostBack = True
            Session("sSECAO") = 1
        End If
    End Sub

    Protected Sub cboSecao_ListSecaoChanged(sender As Object, e As EventArgs) Handles cboSecao.ListSecaoChanged
        Session("sSECAO") = Me.cboSecao.CallSecao
        Me.cboGrupo.DataBind()
        RaiseEvent ListSecaoChanged(sender, e)
    End Sub
End Class
