Imports System.Data
Imports System.Data.SqlClient


Partial Class Controles_wucListaLojas
    Inherits System.Web.UI.UserControl

    Public Event ListFilialChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event ListCorporacaoChanged(ByVal sender As Object, ByVal e As EventArgs)

    Private vIsLoja As Boolean
    Private vDepartamento As String

    Private connManager As String = clData_gerManager.dbConnect

    Dim oProjeto As New Projeto

    Public Property CallFilial() As String
        Get
            Return cboFilial.Value
        End Get
        Set(ByVal value As String)
            cboFilial.Value = value
        End Set
    End Property

    Public Property CallFilialNome() As String
        Get
            Return cboFilial.Text
        End Get
        Set(ByVal value As String)
            cboFilial.Value = value
        End Set
    End Property

    Public Property AutoPostBack() As Boolean
        Get
            Return cboFilial.Value
        End Get
        Set(ByVal value As Boolean)
            cboFilial.AutoPostBack = value
        End Set
    End Property

    Public Property Visible_cboCorporacao() As Boolean
        Get
            Return cboCorporacao.Visible
            'Return lblTitleCorporacao.Visible
        End Get
        Set(ByVal value As Boolean)
            cboCorporacao.Visible = value
            If value = True Then
                Me.lblDescTipo.Visible = True
            Else
                Me.lblDescTipo.Visible = False
            End If
            'lblTitleCorporacao.Visible = value
        End Set
    End Property

    Public Property IsLoja As Boolean
        Get
            IsLoja = vIsLoja
        End Get
        Set(ByVal value As Boolean)
            vIsLoja = value
        End Set
    End Property

    Public Property Departamento As String
        Get
            Departamento = vDepartamento
        End Get
        Set(ByVal value As String)
            vDepartamento = value
        End Set
    End Property

    Protected Sub cboFilial_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboFilial.SelectedIndexChanged
        RaiseEvent ListFilialChanged(sender, e)
    End Sub

    Public Property Enabled_cboFilial() As Boolean
        Get
            Return cboFilial.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboFilial.Enabled = value
        End Set
    End Property

    Private Sub PreencherFiliais()

        Select Case Me.cboCorporacao.Value
            Case 3  'Lojas
                Call ChamarGrupo("SELECT Filial, FilialLista AS [Desc] FROM Cadastros.tblCadFiliais WHERE (Tipo = 1) AND (Filial <> 2) AND (Filial <> 91) ORDER BY [Desc]")
            Case 199 'VendaEmpresaMes
                Call ChamarGrupo("SELECT Filial, Descricao AS [Desc] FROM Cadastros.tblCadFiliais WHERE Filial IN (99,198,199,98) ORDER BY [Desc]")
                Me.cboFilial.Text = 99 'Empreesa sem Apoio
            Case 207    'Super / Hiper
                Call ChamarGrupo("SELECT CodSuperHiper AS Filial, Descricao AS [Desc] FROM Cadastros.tblCadFiliais_SuperHiper ORDER BY Descricao")
                Me.cboFilial.Text = 207 'Super
            Case 205    'Regional
                Call ChamarGrupo("SELECT CodRegional AS Filial, Descricao AS [Desc] FROM Cadastros.tblCadFiliais_Regional ORDER BY Descricao")
                Me.cboFilial.Text = 205 'Regional Edison
            Case 200    'Região
                Call ChamarGrupo("SELECT CodRegiao AS Filial, Descricao AS [Desc] FROM Cadastros.tblCadFiliais_Regiao ORDER BY Descricao")
                Me.cboFilial.Text = 200 'Região Curitiba
        End Select

    End Sub

    Private Sub ChamarGrupo(ByVal iStr As String)
        Dim conn As New SqlConnection   ' Criando o objeto connection
        Dim cmd As New SqlCommand
        Dim da As New SqlDataAdapter
        Dim ds As New DataSet

        conn.ConnectionString = Conexao.gerManager ' "Data Source=WIN-DJITT2B93NO;Initial Catalog=gerManager;User ID=sa;Password=rd700@1"
        cmd.Connection = conn
        cmd.CommandText = iStr
        cmd.CommandType = CommandType.Text
        da.SelectCommand = cmd
        da.Fill(ds, "Produtos") ' Preenchendo o DataSet

        ' Desconectando o Banco de Dados
        conn.Dispose()
        cmd.Dispose()
        da.Dispose()

        cboFilial.DataSource = ds
        cboFilial.DataBind()
    End Sub

    Protected Sub cboCorporacao_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboCorporacao.SelectedIndexChanged

        Call PreencherFiliais()
        Select Case Me.cboCorporacao.Value
            Case 3  'Lojas
                Me.cboFilial.Text = 3
            Case 199    'Empresa
                Me.cboFilial.Text = 99
        End Select
        RaiseEvent ListCorporacaoChanged(sender, e)
    End Sub

    ''' <summary>
    ''' Define se é Lojas ou Corporação. Código das Lojas = 1.   Código da Corporação = 199.
    ''' </summary>
    ''' <value></value>
    ''' <returns>
    ''' Define se é Lojas ou Corporação. Código das Lojas = 1.   Código da Corporação = 199.
    ''' </returns>
    ''' <remarks>
    ''' Define se é Lojas ou Corporação. Código das Lojas = 1.   Código da Corporação = 199.
    ''' </remarks>
    Public Property CallCorporacao() As String
        Get
            Return cboCorporacao.Value
        End Get
        Set(ByVal value As String)
            cboCorporacao.Value = value
        End Set
    End Property

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Select Case LCase(Trim(oProjeto.BuscarLocalDoUsuario(Page.User.Identity.Name)))
                Case "adm"
                    Me.cboFilial.Enabled = True
                Case "loja"
                    Me.cboFilial.Enabled = False
                    Me.cboCorporacao.Visible = False
                    lblDescTipo.Visible = False
                Case Else
                    Me.cboFilial.Enabled = True
            End Select

            Me.cboCorporacao.Text = 3   'Todos os usuários caem na opção loja (se for usuario da Adm cai na filial 100)
            Call PreencherFiliais()
            Me.cboFilial.Text = oProjeto.Filial
            IsLoja = oProjeto.Isloja
            Departamento = oProjeto.BuscarDepartamentoDoUsuario(Page.User.Identity.Name)
        End If



    End Sub

    Sub DataBindFilial()
        PreencherFiliais()

    End Sub


    'Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender

    '    If Not IsPostBack Then
    '        If IsLoja = False Then
    '            cboFilial.Value = 3
    '        End If

    '    End If

    'End Sub
End Class
