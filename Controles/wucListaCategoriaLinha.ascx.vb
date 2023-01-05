Imports System.Data
Imports System.Data.SqlClient
Imports System.Drawing


Partial Class Controles_wucListaCategoriaLinha
    Inherits System.Web.UI.UserControl

    Dim strConn As String = clData_gerManager.dbConnect '"Data Source=CONTROLADORIA1\SQLCONTRO;Initial Catalog=gerManager;Persist Security Info=True;User ID=sa;Password=rd700@1"
    Public Event ListGrupoChanged(ByVal sender As Object, ByVal e As EventArgs)

    Public Event TextModified(ByVal NewText As String)

    Private LabelColor As Color

    Public Sub Grupo_Label_Text(ByVal NewText As String)
        Me.cboGrupo.Text = NewText
        RaiseEvent TextModified(NewText)
    End Sub


    Property Grupo_Label_ForeColor() As Color
        Get
            Return LabelColor
        End Get
        Set(value As Color)
            LabelColor = value
            Me.lblGrupo.ForeColor = LabelColor
        End Set
    End Property

   
    Public Property CallGrupo() As String
        Get
            Return cboGrupo.Value
        End Get
        Set(ByVal value As String)
            cboGrupo.Value = value
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

    Protected Sub cboGrupo_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboGrupo.SelectedIndexChanged

        Dim oVem As New VendaEmpresaMes
        RaiseEvent ListGrupoChanged(sender, e)
       

    End Sub


    Public Property Enabled_cboGrupo() As Boolean
        Get
            Return cboGrupo.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboGrupo.Enabled = value
        End Set
    End Property

    Public Sub AddPosicao(ByVal sourceItem As String)
        Me.lblPosicao.Value = sourceItem
    End Sub


    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            Me.lblPosicao.Value = 1
        End If
    End Sub

   




End Class
