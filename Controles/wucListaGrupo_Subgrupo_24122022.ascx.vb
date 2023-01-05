Imports System.Data
Imports System.Data.SqlClient
Imports System.Drawing


Partial Class Controles_wucListaGrupo_Subgrupo
    Inherits System.Web.UI.UserControl

    Dim strConn As String = clData_gerManager.dbConnect '"Data Source=CONTROLADORIA1\SQLCONTRO;Initial Catalog=gerManager;Persist Security Info=True;User ID=sa;Password=rd700@1"
    Public Event ListGrupoChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event ListSubgrupoChanged(ByVal sender As Object, ByVal e As EventArgs)

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

    Public Property Subgrupo_Label_ForeColor() As Color
        Get
            Return LabelColor
        End Get
        Set(value As Color)
            LabelColor = value
            Me.lblSubgrupo.ForeColor = LabelColor
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

    Protected Sub cboGrupo_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboGrupo.SelectedIndexChanged

        Dim oVem As New VendaEmpresaMes
        RaiseEvent ListGrupoChanged(sender, e)
        'Session("@Grupo") = Me.cboGrupo.Value

        Select Case Me.cboGrupo.Value
            Case 5, 43, 44

            Case Else
                Me.cboSubGrupo.Value = oVem.Buscar_IDSubGrupo(Me.cboGrupo.Value)
        End Select




    End Sub

    Protected Sub cboSubGrupo_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboSubGrupo.SelectedIndexChanged
        RaiseEvent ListSubgrupoChanged(sender, e)
    End Sub

#Region " Enabled"

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

#End Region

#Region " AutoPostBack"

    Public Property AutoPostBack_cboGrupo() As Boolean
        Get
            Return cboGrupo.AutoPostBack
        End Get
        Set(ByVal value As Boolean)
            cboGrupo.AutoPostBack = value
        End Set
    End Property

    Public Property AutoPostBack_cboSubgrupo() As Boolean
        Get
            Return cboSubGrupo.AutoPostBack
        End Get
        Set(ByVal value As Boolean)
            cboSubGrupo.AutoPostBack = value
        End Set
    End Property

#End Region


    Public Sub AddSourceItem(ByVal sourceItem As String)
        Me.lblCatCod.Value = sourceItem
    End Sub

    Public Sub AddSourceItemSub(ByVal sourceItem As String)
        Me.cboSubGrupo.Text = sourceItem
    End Sub

    Public Sub AddPosicao(ByVal sourceItem As String)
        Me.lblPosicao.Value = sourceItem
    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        'Me.lblCatCod.Value = 7
    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            Me.lblPosicao.Value = 1
            Call PreencherGrupo()
            Select Case Me.lblCatCod.Value
                Case 1  'Vendas
                    Me.cboGrupo.Text = 1
                Case 2  'Impostos
                    Me.cboGrupo.Text = 2
                Case 4  'Margens
                    Me.cboGrupo.Text = 6
                Case 5  'Operações Comerciais
                    Me.cboGrupo.Text = 8
                Case 7  'Despesas
                    Me.cboGrupo.Text = 15
                Case 8  'Outras Receitas
                    Me.cboGrupo.Text = 39
                Case 4  'Quebras
                    Me.cboGrupo.Text = 6
                Case 10  'Provisões de Créditos
                    Me.cboGrupo.Text = 41
                Case 11  'Resultado Financeiro
                    Me.cboGrupo.Text = 43
                Case 14  'Receita Comercial
                    Me.cboGrupo.Text = 48
                Case 17  'PLR
                    Me.cboGrupo.Text = 77
                Case Else
                    Me.cboGrupo.Text = 15
            End Select
            'If Me.lblCatCod.Value = 2 Then Me.cboGrupo.Text = 2 'Impostos
            'If Me.lblCatCod.Value = 5 Then Me.cboGrupo.Text = 8 'Operações Comerciais
            'If Me.lblCatCod.Value = 7 Then Me.cboGrupo.Text = 15 'Despesas
            'If Me.lblCatCod.Value = 8 Then Me.cboGrupo.Text = 39 'Outras Receitas
            'If Me.lblCatCod.Value = 10 Then Me.cboGrupo.Text = 41 'Provisões de Créditos
            'If Me.lblCatCod.Value = 11 Then Me.cboGrupo.Text = 43 'Resultado Financeiro
            'If Me.lblCatCod.Value = 14 Then Me.cboGrupo.Text = 48 'Receita Comercial
        End If
    End Sub

    Private Sub PreencherGrupo()
        Dim oProjeto As New Projeto
        Select Case Me.lblCatCod.Value
            Case 5  'Operações Comerciais
                If LCase(Trim(oProjeto.BuscarDepartamentoDoUsuario(Page.User.Identity.Name))) = "loja" Then
                    Call ChamarGrupo("SELECT idGrupo, listaGrupo AS GrupoDesc FROM Cadastros.tblCategoriaLinha WHERE idCat = " & Me.lblCatCod.Value & " AND idGrupo<>80 AND ISNULL(CodPessoalAdm,0)=0 ORDER BY Ordem")
                ElseIf LCase(Trim(oProjeto.BuscarDepartamentoDoUsuario(Page.User.Identity.Name))) = "loja" Then
                    Call ChamarGrupo("SELECT idGrupo, listaGrupo AS GrupoDesc FROM Cadastros.tblCategoriaLinha WHERE idCat = " & Me.lblCatCod.Value & " AND ISNULL(CodPessoalAdm,0)=0 ORDER BY Ordem")
                Else
                    Call ChamarGrupo("SELECT idGrupo, listaGrupo AS GrupoDesc FROM Cadastros.tblCategoriaLinha WHERE idCat = " & Me.lblCatCod.Value & " ORDER BY Ordem")
                End If
            Case 2, 4, 7, 8, 4, 10, 11, 14, 17  'Impostos, Despesas, Outras Receitas, Quebras, Provisões de Créditos, Resultado Financeiro, Receita Comercial
                Call ChamarGrupo("SELECT idGrupo, listaGrupo AS GrupoDesc FROM Cadastros.tblCategoriaLinha WHERE idCat = " & Me.lblCatCod.Value & " ORDER BY Ordem")
            Case 144  'Impostos, Despesas, Outras Receitas, Quebras, Provisões de Créditos, Resultado Financeiro, Receita Comercial
                Call ChamarGrupo("SELECT idGrupo, listaGrupo AS GrupoDesc FROM Cadastros.tblCategoriaLinha WHERE idGrupo BETWEEN 15 AND 38 OR idGrupo IN (14,73,74) ORDER BY Ordem")
            Case Else
                Call ChamarGrupo("SELECT idGrupo, listaGrupo AS GrupoDesc FROM Cadastros.tblCategoriaLinha ORDER BY Ordem")
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

        Me.cboGrupo.DataSource = ds
        Me.cboGrupo.DataBind()
    End Sub

    Public Property Visible_cboSubgrupo() As Boolean
        Get
            Return cboSubGrupo.Visible
        End Get
        Set(ByVal value As Boolean)
            cboSubGrupo.Visible = value
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

    Public Property Visible_LabelGrupo() As Boolean
        Get
            Return lblGrupo.Visible
        End Get
        Set(ByVal value As Boolean)
            lblGrupo.Visible = value
        End Set
    End Property

    Public Property SelectedIndex_cboSubgrupo() As Byte
        Get
            Return cboSubGrupo.SelectedIndex
        End Get
        Set(ByVal value As Byte)
            cboSubGrupo.SelectedIndex = value
        End Set
    End Property

    Public Property SelectedIndex_cboGrupo() As Byte
        Get
            Return cboGrupo.SelectedIndex
        End Get
        Set(ByVal value As Byte)
            cboGrupo.SelectedIndex = value
        End Set
    End Property

End Class
