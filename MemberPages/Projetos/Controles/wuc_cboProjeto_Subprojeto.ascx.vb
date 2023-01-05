
#Region " Imports"
Imports System.Data
Imports System.Data.SqlClient
#End Region

Partial Class MemberPages_Projetos_Controles_wuc_cboProjeto_Subprojeto
    Inherits System.Web.UI.UserControl

    Private vTipo As Byte
    Private vDescProjeto As String

#Region " Connections"

    Dim cnnStr As String = "Data Source=CONTROLADORIA2\SQLCONTRO;Initial Catalog=gerCont;User ID=sa; PWD=rd700@1"
    Dim cnnProjetoStr As String = "Data Source=CONTROLADORIA2\SQLCONTRO;Initial Catalog=gerProjetos;User ID=sa; PWD=rd700@1"

#End Region

    Public Event SelectedIndexChanged_cboProjeto(ByVal sender As Object, ByVal e As EventArgs)
    Public Event SelectedIndexChanged_cboSubProjeto(ByVal sender As Object, ByVal e As EventArgs)
    Public Event SelectedIndexChanged_cboTarefas(ByVal sender As Object, ByVal e As EventArgs)

    Public Event Click_btnTarefas(ByVal sender As Object, ByVal e As EventArgs)
    Public Event Click_btnSubprojeto(ByVal sender As Object, ByVal e As EventArgs)

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("sUSUARIO") = Page.User.Identity.Name
        End If
    End Sub

#Region " Cbo"

    Protected Sub cboProjeto_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboProjeto.SelectedIndexChanged
        Me.cboSubProjeto.Text = Nothing
        RaiseEvent SelectedIndexChanged_cboProjeto(sender, e)
    End Sub

    Protected Sub cboSubProjeto_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboSubProjeto.SelectedIndexChanged
        RaiseEvent SelectedIndexChanged_cboSubProjeto(sender, e)
    End Sub

    Protected Sub cboTarefas_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboTarefas.SelectedIndexChanged
        RaiseEvent SelectedIndexChanged_cboTarefas(sender, e)
    End Sub

#End Region

#Region " Public Property"

    Public Property Enabled_cboProjeto() As Boolean
        Get
            Return cboProjeto.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboProjeto.Enabled = value
        End Set
    End Property

    Public Property Enabled_cboSubProjeto() As Boolean
        Get
            Return cboSubProjeto.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboSubProjeto.Enabled = value
        End Set
    End Property

    Public Property Enabled_cboTarefas() As Boolean
        Get
            Return cboTarefas.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboTarefas.Enabled = value
        End Set
    End Property

    Public Property Enabled_btnTarefas() As Boolean
        Get
            Return btnTarefas.Enabled
        End Get
        Set(ByVal value As Boolean)
            btnTarefas.Enabled = value
        End Set
    End Property

    Public Property Enabled_btnSubprojeto() As Boolean
        Get
            Return btnSubprojeto.Enabled
        End Get
        Set(ByVal value As Boolean)
            btnSubprojeto.Enabled = value
        End Set
    End Property

    Public Property Value_cboProjeto() As String
        Get
            Return cboProjeto.Value
        End Get
        Set(ByVal value As String)
            cboProjeto.Value = value
        End Set
    End Property

    Public Property Value_cboSubProjeto() As String
        Get
            Return cboSubProjeto.Value
        End Get
        Set(ByVal value As String)
            cboSubProjeto.Value = value
        End Set
    End Property

    Public Property Value_cboTarefas() As String
        Get
            Return cboTarefas.Value
        End Get
        Set(ByVal value As String)
            cboTarefas.Value = value
        End Set
    End Property


    Public Property Text_cboProjeto() As String
        Get
            Return cboProjeto.Text
        End Get
        Set(ByVal value As String)
            cboProjeto.Text = value
        End Set
    End Property

    Public Property Text_cboSubProjeto() As String
        Get
            Return cboSubProjeto.Text
        End Get
        Set(ByVal value As String)
            cboSubProjeto.Text = value
        End Set
    End Property

    Public Property Text_cboTarefas() As String
        Get
            Return cboTarefas.Text
        End Get
        Set(ByVal value As String)
            cboTarefas.Text = value
        End Set
    End Property


    Public Property SelectedIndex_cboSubProjeto() As Integer
        Get
            Return cboSubProjeto.SelectedIndex
        End Get
        Set(ByVal value As Integer)
            cboSubProjeto.SelectedIndex = value
        End Set
    End Property

    Public Property SelectedIndex_cboTarefas() As Integer
        Get
            Return cboTarefas.SelectedIndex
        End Get
        Set(ByVal value As Integer)
            cboTarefas.SelectedIndex = value
        End Set
    End Property


    Public Sub DataBind_cboSubProjeto()
        Me.cboSubProjeto.DataBind()
    End Sub

    Public Sub DataBind_cboTarefas()
        Me.cboTarefas.DataBind()
    End Sub


    Public Property varTipo() As Byte
        Get
            varTipo = vTipo
        End Get
        Set(ByVal value As Byte)
            vTipo = value
        End Set
    End Property

    Public Property DescricaoDoProjeto() As String
        Get
            DescricaoDoProjeto = vDescProjeto
        End Get
        Set(ByVal value As String)
            vDescProjeto = value
        End Set
    End Property


#End Region

#Region " Funções"

    ''' <summary>
    ''' 1=Projeto   2=Sub-Projeto   3=Tarefas
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Public Function StatusProjeto_Or_Subprojeto() As Byte
        Dim iTipo As Byte

        If CInt(Trim((Me.cboProjeto.Text.Length))) > 0 Then
            Session("idProjeto") = Me.cboProjeto.Value
            varTipo = 1 'Projeto
            DescricaoDoProjeto = "Projeto"
        End If

        If CInt(Trim((Me.cboSubProjeto.Text.Length))) > 0 Then
            Session("idProjeto") = Me.cboSubProjeto.Value
            varTipo = 2 'Sub-Projeto
            DescricaoDoProjeto = "Sub-projeto"
        End If

        If CInt(Trim((Me.cboTarefas.Text.Length))) > 0 Then
            Session("idProjeto") = Me.cboTarefas.Value
            varTipo = 3 'Sub-Projeto
            DescricaoDoProjeto = "Tarefas"
        End If

        Session("idTipo") = varTipo
        Return iTipo
    End Function

#End Region


    Protected Sub btnTarefas_Click(sender As Object, e As EventArgs) Handles btnTarefas.Click
        RaiseEvent Click_btnTarefas(sender, e)
    End Sub

    Protected Sub btnSubprojeto_Click(sender As Object, e As EventArgs) Handles btnSubprojeto.Click
        RaiseEvent Click_btnSubprojeto(sender, e)
    End Sub
End Class
