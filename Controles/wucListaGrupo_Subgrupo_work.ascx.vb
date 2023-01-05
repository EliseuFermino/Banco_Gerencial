
Partial Class Controles_wucListaGrupo_Subgrupo_work
    Inherits System.Web.UI.UserControl

    Public Event ListGrupoChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event ListSubgrupoChanged(ByVal sender As Object, ByVal e As EventArgs)

    Protected Sub cboGrupo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboGrupo.SelectedIndexChanged
        Dim oVem As New VendaEmpresaMes
        Me.cboSubgrupo.Text = oVem.Buscar_IDSubGrupo(Me.cboGrupo.Value)
        RaiseEvent ListGrupoChanged(sender, e)
    End Sub

    Private Sub OcultarSubgrupo()
        Me.chkSubgrupo.Checked = False
        Me.cboSubgrupo.Visible = False
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Call OcultarSubgrupo()
        End If
    End Sub

    Protected Sub chkSubgrupo_CheckedChanged(sender As Object, e As EventArgs) Handles chkSubgrupo.CheckedChanged
        If Me.chkSubgrupo.Checked = True Then
            Me.cboSubgrupo.Visible = True
        End If
    End Sub

    Protected Sub cboSubgrupo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboSubgrupo.SelectedIndexChanged
        RaiseEvent ListSubgrupoChanged(sender, e)
    End Sub

    Public Property CallGrupo() As String
        Get
            Return cboGrupo.Value
        End Get
        Set(ByVal value As String)
            cboGrupo.Value = value
        End Set
    End Property

    Public Property Checked_chkSubgrupo() As String
        Get
            Return chkSubgrupo.Checked
        End Get
        Set(ByVal value As String)
            chkSubgrupo.Checked = value
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

    Public Property CallSubgrupo() As String
        Get
            Return cboSubGrupo.Value
        End Get
        Set(ByVal value As String)
            cboSubGrupo.Value = value
        End Set
    End Property

    Public Property CallSubgrupoDesc() As String
        Get
            Return cboSubGrupo.Text
        End Get
        Set(ByVal value As String)
            cboSubGrupo.Text = value
        End Set
    End Property

End Class
