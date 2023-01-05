
Partial Class wucListaComprador
    Inherits System.Web.UI.UserControl

    Public Event ListCompradorChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event ListSecaoChanged(ByVal sender As Object, ByVal e As EventArgs)
    Dim varDepto, varSecao As String

    Public Property CallComprador() As String
        Get
            Return cboComprador.Value
        End Get
        Set(ByVal value As String)
            cboComprador.Value = value
        End Set
    End Property

    Public Property Enabled() As Boolean
        Get
            Return cboComprador.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboComprador.Enabled = value
        End Set
    End Property

    Public Property CallSecao() As String
        Get
            Return cboSecao.Value
        End Get
        Set(ByVal value As String)
            cboSecao.Value = value
        End Set
    End Property

    Public Property cboComprador_Enabled() As Boolean
        Get
            Return cboComprador.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboComprador.Enabled = value
        End Set
    End Property

    Protected Sub cboComprador_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboComprador.SelectedIndexChanged
        Call PreencherSecao()
        cboSecao.SelectedIndex = 0
        RaiseEvent ListCompradorChanged(sender, e)
    End Sub

    Public Property cboComprador_Visible() As Boolean
        Get
            Return cboComprador.Visible
        End Get
        Set(ByVal value As Boolean)
            cboComprador.Visible = value
        End Set
    End Property

    Public Property cboComprador_SelectedIndex() As Byte
        Get
            Return cboComprador.SelectedIndex
        End Get
        Set(ByVal value As Byte)
            cboComprador.SelectedIndex = value
        End Set
    End Property

    Sub PreencherSecao()
        Dim strSQL As String = "SELECT a.idSecao AS idSecao, RTRIM(b.ListaReduzida) AS descSecao FROM Cadastros.tblCadSecao AS b INNER JOIN Cadastros.tblCadCompradorSecao AS a ON b.idSecao = a.idSecao WHERE a.idComprador = " & Me.cboComprador.Value & ""
        Me.cboSecao.DataSource = clData_gerManager.SqlQry(strSQL)
        Me.cboSecao.DataBind()
    End Sub


    Sub PreencherSecaoTodas()
        Dim strSQL As String = "SELECT idSecao, RTRIM(ListaReduzida) AS descSecao FROM Cadastros.tblCadSecao"
        Me.cboSecao.DataSource = clData_gerManager.SqlQry(strSQL)
        Me.cboSecao.DataBind()
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            DefinirCompradorInicial()


        End If

    End Sub

    Private Sub DefinirCompradorInicial()
        Me.cboComprador.Enabled = False
        Call DefinirUsuario(Page.User.Identity.Name)
        Call PreencherSecao()
    End Sub

    Private Sub DefinirUsuario(iNome As String)
        Select Case LCase(iNome)
            Case 1200400
                Me.CallComprador = 1200400  'LUCAS
                Me.CallSecao = 1
                varSecao = 1
            Case 1210070
                Me.CallComprador = 1210070  'DIEGO GRAÇA
                Me.CallSecao = 2
                varSecao = 2
            Case 1210070
                Me.CallComprador = 1210070  'DIEGO GRAÇA
                Me.CallSecao = 3
                varSecao = 3
            Case 1196020
                Me.CallComprador = 1196020  'ALISSON
                Me.CallSecao = 4
                varSecao = 4
            Case 1196310
                Me.CallComprador = 1196310  'DIEGO GOMES
                Me.CallSecao = 5
                varSecao = 5
            Case 215856
                Me.CallComprador = 215856   'SIMONE
                Me.CallSecao = 6
                varSecao = 6
            Case 100038
                Me.CallComprador = 100038  'FRANCIELY
                Me.CallSecao = 7
                varSecao = 7
            Case 1119370
                Me.CallComprador = 1119370  'RODRIGO
                Me.CallSecao = 8
                varSecao = 8

            Case 1276800
                Me.CallComprador = 1276800
                Me.CallSecao = 11
                varSecao = 11
            Case 1128940
                Me.CallComprador = 1128940
                Me.CallSecao = 12
                varSecao = 12
            Case 1268530
                Me.CallComprador = 993940
                Me.CallSecao = 13
                varSecao = 13
            Case 1276800
                Me.CallComprador = 1276800
                Me.CallSecao = 14
                varSecao = 15
            Case 423650
                Me.CallComprador = 423650   'ANDERSON
                Me.CallSecao = 15
                varSecao = 15
            Case 423650
                Me.CallComprador = 423650   'ANDERSON
                Me.CallSecao = 16
                varSecao = 16
            Case 1268530
                Me.CallComprador = 993940
                Me.CallSecao = 17
                varSecao = 17
            Case 1268530
                Me.CallComprador = 993940
                Me.CallSecao = 18
                varSecao = 18
            Case 1268530
                Me.CallComprador = 993940
                Me.CallSecao = 19
                varSecao = 19
            Case 1128940
                Me.CallComprador = 993940
                Me.CallSecao = 21
                varSecao = 21
            Case 100031
                Me.CallComprador = 283790
                Me.CallSecao = 22
                varSecao = 22
            Case 100031
                Me.CallComprador = 283790
                Me.CallSecao = 23
                varSecao = 23


            Case 393260
                Me.CallComprador = 393260   'ANGELO
                Me.CallSecao = 30
                varSecao = 30
            Case 393260
                Me.CallComprador = 393260   'ANGELO
                Me.CallSecao = 31
                varSecao = 31
            Case 331760
                Me.CallComprador = 331760
                Me.CallSecao = 32
                varSecao = 32
            Case 331760
                Me.CallComprador = 331760
                Me.CallSecao = 33
                varSecao = 33
            Case 1268680
                Me.CallComprador = 1268680
                Me.CallSecao = 34
                varSecao = 34
            Case 393260
                Me.CallComprador = 393260   'ANGELO
                Me.CallSecao = 35
                varSecao = 35
            Case 1268680
                Me.CallComprador = 1268680
                Me.CallSecao = 36
                varSecao = 36

            Case 1136420
                Me.CallComprador = 1136420   'ARIANE
                Me.CallSecao = 40
                varSecao = 40
            Case 1136420
                Me.CallComprador = 1136420   'ARIANE
                Me.CallSecao = 41
                varSecao = 41
            Case 1136420
                Me.CallComprador = 1136420  'ARIANE
                Me.CallSecao = 42
                varSecao = 42
            Case 1136420
                Me.CallComprador = 1136420   'ARIANE
                Me.CallSecao = 49
                varSecao = 49

            Case 331760
                Me.CallComprador = 100237   'WILLIAN
                Me.CallSecao = 50
                varSecao = 50
            Case 3331760
                Me.CallComprador = 100237  'WILLIAN
                Me.CallSecao = 51
                varSecao = 51
            Case 1197750
                Me.CallComprador = 100237   'WILLIAN
                Me.CallSecao = 52
                varSecao = 52
            Case 1197750
                Me.CallComprador = 100237   'WILLIAN
                Me.CallSecao = 53
                varSecao = 53
            Case 1197750
                Me.CallComprador = 100237   'WILLIAN
                Me.CallSecao = 54
                varSecao = 54

            Case Else
                Me.CallComprador = 0
                Me.CallSecao = 0
                varSecao = 0
                cboComprador.Enabled = True
        End Select




    End Sub

    Protected Sub cboSecao_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboSecao.SelectedIndexChanged
        RaiseEvent ListSecaoChanged(sender, e)
    End Sub


    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then

            Dim oProj As New Projeto
            Dim vDepartamento As String = LCase(LTrim(RTrim(oProj.BuscarDepartamentoDoUsuario(Page.User.Identity.Name))))
            Dim vMatricula As String = Page.User.Identity.Name

            If vDepartamento = "gestor_comercial" Then
                Session("sDEPARTAMENTO") = vDepartamento
                Session("sMATRICULA") = vMatricula
            Else
                Session("sDEPARTAMENTO") = "Todos"
                Session("sMATRICULA") = "0"
            End If

        End If
    End Sub
End Class
