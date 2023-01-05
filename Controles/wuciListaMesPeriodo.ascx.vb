Imports System.Data.SqlClient

Partial Class wucMes
    Inherits System.Web.UI.UserControl

    Public Event ListMesChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event rndMesChanged(ByVal sender As Object, ByVal e As EventArgs)
    Public Event rndPeriodoChanged(ByVal sender As Object, ByVal e As EventArgs)

    Public Property CallMes() As String
        Get
            Return cboMes.Value
        End Get
        Set(ByVal value As String)
            cboMes.Text = value
        End Set
    End Property

    Public Property CallMesDesc() As String
        Get
            Return cboMes.Text
        End Get
        Set(ByVal value As String)
            cboMes.Text = value
        End Set
    End Property

    Protected Sub cboMes_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboMes.SelectedIndexChanged
        Session("sMES") = cboMes.Value
        RaiseEvent ListMesChanged(sender, e)

    End Sub

    Public Property Enabled_cboMes() As Boolean
        Get
            Return cboMes.Enabled
        End Get
        Set(ByVal value As Boolean)
            cboMes.Enabled = value
        End Set
    End Property

    Public Property AutoPostBack_cboMes() As Boolean
        Get
            Return cboMes.AutoPostBack
        End Get
        Set(ByVal value As Boolean)
            cboMes.AutoPostBack = value
        End Set
    End Property

    Public Property rndMes_Checked() As Boolean
        Get
            Return rndMes.Checked
        End Get
        Set(ByVal value As Boolean)
            rndMes.Checked = value
        End Set
    End Property

    Public Property rndPeriodo_Checked() As Boolean
        Get
            Return rndPeriodo.Checked
        End Get
        Set(ByVal value As Boolean)
            rndPeriodo.Checked = value
        End Set
    End Property

    Public Property rndPeriodo_Enabled() As Boolean
        Get
            Return rndPeriodo.Enabled
        End Get
        Set(ByVal value As Boolean)
            rndPeriodo.Enabled = value
        End Set
    End Property

    Protected Sub rndMes_CheckedChanged(sender As Object, e As EventArgs) Handles rndMes.CheckedChanged
        If rndMes.Checked = True Then
            Session("sMES_PERIODO") = 1
            Call Define_cboMes()

            Call DefineMes()

            RaiseEvent rndMesChanged(sender, e)
        End If
    End Sub

    Private Sub DefineMes()

        Dim varMesAtual As Byte = DateAndTime.Now().Month

        If varMesAtual = 1 Then
            Me.cboMes.SelectedIndex = 0
            Session("sMES") = 1
        Else
            Me.cboMes.Value = CByte(Month(Now()) - 1)
            Session("sMES") = CByte(Month(Now()) - 1)
        End If

    End Sub

    Protected Sub rndPeriodo_CheckedChanged(sender As Object, e As EventArgs) Handles rndPeriodo.CheckedChanged
        If Me.rndPeriodo.Checked = True Then
            Session("sMES_PERIODO") = 2
            Call Define_cboMes()

            Session("sMES") = 13

            RaiseEvent rndPeriodoChanged(sender, e)
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Session("sMES_PERIODO") = 1
            Call Define_cboMes()

            

        End If
    End Sub


    Private Sub Define_cboMes()
        Select Case Session("sMES_PERIODO")
            Case 1
                Preenche_cboMes("SELECT [mes], [descMes] FROM [tblCadMes] WHERE ([mes] < 13) ORDER BY [mes]")
            Case 2
                Preenche_cboMes("SELECT [mes], [descMes] FROM [tblCadMes] WHERE TeoricoPeriodo=1 ORDER BY TeoricoPeriodoOrdem")
            Case Else
                Preenche_cboMes("SELECT [mes], [descMes] FROM [tblCadMes] WHERE ([mes] < 13) ORDER BY [mes]")
        End Select

    End Sub


    Public Sub Preenche_cboMes(ByVal iStr As String)
        Dim selectSQL As String = iStr
        Dim con As New SqlConnection(Conexao.gerCadastros_str)
        Dim cmd As New SqlCommand(selectSQL, con)

        ' Open the connection
        con.Open()

        ' Define the binding
        cboMes.DataSource = cmd.ExecuteReader()
        cboMes.TextField = "descMes"
        cboMes.ValueField = "mes"

        ' Activate the binding.
        cboMes.DataBind()

        con.Close()

        cboMes.SelectedIndex = 0

    End Sub


    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            DefineMes()
        End If
    End Sub
End Class
