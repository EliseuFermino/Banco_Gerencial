Imports System.Data
Imports System.Data.SqlClient


Partial Class Controles_wucListaLojasComCorporacao
    Inherits System.Web.UI.UserControl

    Public Event ListFilialChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event ListCorporacaoChanged(ByVal sender As Object, ByVal e As EventArgs)

    Private vIsLoja As Boolean
    Private vIsRegional As Boolean
    Private vDepartamento As String
    Public Property idRegional As Byte
    Public Property nomeUsuario As String

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
            Return cboFilial.AutoPostBack
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

    Public Property IsRegional As Boolean
        Get
            IsRegional = vIsRegional
        End Get
        Set(ByVal value As Boolean)
            vIsRegional = value
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
        Session("sFILIAL") = cboFilial.Value
    End Sub

    Public Property Enabled_cboFilial() As Boolean
        Get
            Return cboFilial.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboFilial.Enabled = value
        End Set
    End Property

    'Private Sub PreencherFiliais()

    '    Select Case Me.cboCorporacao.Value
    '        Case 3  'Lojas
    '            Call ChamarGrupo("SELECT Filial, FilialLista AS [Desc] FROM Cadastros.tblCadFiliais WHERE (Tipo = 1) AND (Filial <> 2) AND (Filial <> 91) ORDER BY [Desc]")
    '        Case 199 'VendaEmpresaMes
    '            Call ChamarGrupo("SELECT Filial, Descricao AS [Desc] FROM Cadastros.tblCadFiliais WHERE Filial IN (99,198,199,98) ORDER BY [Desc]")
    '            Me.cboFilial.Text = 99 'Empreesa sem Apoio
    '        Case 207    'Super / Hiper
    '            Call ChamarGrupo("SELECT CodSuperHiper AS Filial, Descricao AS [Desc] FROM Cadastros.tblCadFiliais_SuperHiper ORDER BY Descricao")
    '            Me.cboFilial.Text = 207 'Super
    '        Case 205    'Regional
    '            Call ChamarGrupo("SELECT CodRegional AS Filial, Descricao AS [Desc] FROM Cadastros.tblCadFiliais_Regional ORDER BY Descricao")
    '            Me.cboFilial.Text = 205 'Regional Edison
    '        Case 200    'Região
    '            Call ChamarGrupo("SELECT CodRegiao AS Filial, Descricao AS [Desc] FROM Cadastros.tblCadFiliais_Regiao ORDER BY Descricao")
    '            Me.cboFilial.Text = 200 'Região Curitiba
    '        Case 216 'LUIS CD
    '            Call ChamarGrupo("SELECT Filial, Descricao AS [Desc] FROM Cadastros.tblCadFiliais WHERE Filial IN (1,12,16) ORDER BY [Desc]")
    '            Me.cboFilial.Text = 1 'Empreesa sem Apoio 
    '    End Select

    'End Sub

    Private Sub PreencherFiliais()

        Dim vUsuario As String = LCase(Trim(Page.User.Identity.Name))
        Dim vDepartamento As String = LCase(Trim(oProjeto.BuscarDepartamentoDoUsuario(Page.User.Identity.Name)))

        Select Case Me.cboCorporacao.Value
            Case 3  'Lojas
                Select Case vDepartamento
                    Case "supervisor"
                        If vUsuario = "bendixen" Then   'Supervisor Norte
                            idRegional = 206
                            Call ChamarGrupo("SELECT Filial, FilialLista AS [Desc] FROM Cadastros.tblCadFiliais WHERE CodigoRegional=206 ORDER BY [Desc]")
                        ElseIf vUsuario = "edison" Then
                            idRegional = 205
                            Call ChamarGrupo("SELECT Filial, FilialLista AS [Desc] FROM Cadastros.tblCadFiliais WHERE CodigoRegional=205 ORDER BY [Desc]")
                            cboFilial.SelectedIndex = 0
                        ElseIf vUsuario = "claudinei" Then
                            idRegional = 204
                            Call ChamarGrupo("SELECT Filial, FilialLista AS [Desc] FROM Cadastros.tblCadFiliais WHERE CodigoRegional=204 ORDER BY [Desc]")
                        ElseIf vUsuario = "otacilio" Then
                            idRegional = 215
                            Call ChamarGrupo("SELECT Filial, FilialLista AS [Desc] FROM Cadastros.tblCadFiliais WHERE CodigoRegional=215 ORDER BY [Desc]")
                        ElseIf vUsuario = "joão carlos" Then
                            idRegional = 214
                            Call ChamarGrupo("SELECT Filial, FilialLista AS [Desc] FROM Cadastros.tblCadFiliais WHERE CodigoRegional=214 ORDER BY [Desc]")
                        ElseIf vUsuario = "supervisor" Then
                            idRegional = 215
                            Call ChamarGrupo("SELECT Filial, FilialLista AS [Desc] FROM Cadastros.tblCadFiliais WHERE CodigoRegional=215 ORDER BY [Desc]")
                        End If
                    Case "controladoria", "presidência", "perdas", "comercial", "diretor", "gilberto", "perdas_supervisor"
                        Call ChamarGrupo("SELECT Filial, FilialLista AS [Desc] FROM Cadastros.tblCadFiliais WHERE (Tipo = 1) AND (Filial <> 2) AND (Filial <> 91) ORDER BY [Desc]")
                    Case "gerente cd"
                        Call ChamarGrupo("SELECT Filial, Descricao AS [Desc] FROM Cadastros.tblCadFiliais WHERE Filial IN (1,12,16) ORDER BY [Desc]")
                    Case "loja"
                        Call ChamarGrupo("SELECT Filial, FilialLista AS [Desc] FROM Cadastros.tblCadFiliais WHERE (Tipo = 1) AND (Filial <> 2) AND (Filial <> 91) ORDER BY [Desc]")
                    Case "administração"
                        Call ChamarGrupo("SELECT Filial, FilialLista AS [Desc] FROM Cadastros.tblCadFiliais WHERE (Tipo = 1) AND (Filial <> 2) AND (Filial <> 91) ORDER BY [Desc]")
                    Case Else
                        Call ChamarGrupo("SELECT Filial, FilialLista AS [Desc] FROM Cadastros.tblCadFiliais WHERE (Tipo = 1) AND (Filial <> 2) AND (Filial <> 91) ORDER BY [Desc]")
                End Select
            Case 199 'VendaEmpresaMes
                Call ChamarGrupo("SELECT Filial, Descricao AS [Desc] FROM Cadastros.tblCadFiliais WHERE Filial IN (99,198,199,98) ORDER BY [Desc]")
                Me.cboFilial.Text = 99 'Empreesa sem Apoio
            Case 207    'Super / Hiper
                Call ChamarGrupo("SELECT CodSuperHiper AS Filial, Descricao AS [Desc] FROM Cadastros.tblCadFiliais_SuperHiper ORDER BY Descricao")
                Me.cboFilial.Text = 207 'Super
            Case 204    'Regional
                Call ChamarGrupo("SELECT CodRegional AS Filial, Descricao AS [Desc] FROM Cadastros.tblCadFiliais_Regional ORDER BY Descricao")
                Me.cboFilial.Text = 204 'Regional Nei
            Case 205    'Regional
                Call ChamarGrupo("SELECT CodRegional AS Filial, Descricao AS [Desc] FROM Cadastros.tblCadFiliais_Regional ORDER BY Descricao")
                Me.cboFilial.Text = 205 'Regional Edison
            Case 200    'Região
                Call ChamarGrupo("SELECT CodRegiao AS Filial, Descricao AS [Desc] FROM Cadastros.tblCadFiliais_Regiao ORDER BY Descricao")
                Me.cboFilial.Text = 200 'Região Curitiba
            Case 216 'LUIS CD
                Call ChamarGrupo("SELECT Filial, Descricao AS [Desc] FROM Cadastros.tblCadFiliais WHERE Filial IN (1,12,16) ORDER BY [Desc]")
                Me.cboFilial.Text = 1 'Empreesa sem Apoio 
        End Select

    End Sub

    Private Sub ChamarGrupo(ByVal iStr As String)
        Dim Conn As New SqlConnection(connManager)
        Dim objDr As SqlDataReader
        Dim Cmd As New SqlCommand(iStr, Conn)
        Conn.Open()

        objDr = Cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection)

        Me.cboFilial.DataSource = objDr
        cboFilial.DataBind()
    End Sub

    Protected Sub cboCorporacao_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboCorporacao.SelectedIndexChanged

        Call PreencherFiliais()
        Select Case Me.cboCorporacao.Value
            Case 3  'Lojas
                Me.cboFilial.Text = 3
                Session("sFILIAL") = 3
            Case 199    'Empresa
                Me.cboFilial.Text = 99
                Session("sFILIAL") = 99
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
            Departamento = oProjeto.BuscarDepartamentoDoUsuario(Page.User.Identity.Name)

            Select Case LCase(Trim(oProjeto.BuscarLocalDoUsuario(Page.User.Identity.Name)))
                Case "adm"
                    Me.cboFilial.Enabled = True
                    If LCase(Trim(oProjeto.BuscarDepartamentoDoUsuario(Page.User.Identity.Name))) = "controladoria" Then
                        Me.cboCorporacao.Text = 199

                    Else
                        Me.cboCorporacao.Text = 3
                    End If

                Case "supervisor"
                    Me.cboFilial.Enabled = True
                    Me.cboCorporacao.Visible = False
                    lblDescTipo.Visible = False
                Case "loja"
                    Me.cboFilial.Enabled = False
                    Me.cboCorporacao.Visible = False
                    lblDescTipo.Visible = False
                    Me.cboCorporacao.Text = 3   'Todos os usuários caem na opção loja (se for usuario da Adm cai na filial 100)                
                Case Else
                    Me.cboFilial.Enabled = True
            End Select


            Call PreencherFiliais()
            Dim mytes As Byte = idRegional
            Me.cboFilial.Text = oProjeto.Filial
            IsLoja = oProjeto.Isloja
            IsRegional = oProjeto.IsRegional
            nomeUsuario = Trim(Page.User.Identity.Name)

        End If

        Session("sFILIAL") = cboFilial.Value

    End Sub

    Sub DataBindFilial()
        PreencherFiliais()

    End Sub


    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender

        If Not IsPostBack Then

            Call PreencherFiliais()
            Select Case Me.cboCorporacao.Value
                Case 3  'Lojas
                    Me.cboFilial.Text = 3
                    Session("sFILIAL") = 3
                Case 199    'Empresa
                    Me.cboFilial.Text = 99
                    Session("sFILIAL") = 99
            End Select
            RaiseEvent ListCorporacaoChanged(sender, e)

        End If

    End Sub

End Class
