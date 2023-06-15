
Imports System.Data.SqlClient


Partial Class Controles_wuc_Exibir_Lojas_Atacarejos_Todos
    Inherits System.Web.UI.UserControl

    Public Property CallUnidade() As String
        Get
            Return cboUnidade.Value
        End Get
        Set(ByVal value As String)
            cboUnidade.Value = value
        End Set
    End Property

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not Me.IsPostBack Then

            ' Condor, Gigante
            Preenche_Corporacao("SELECT idUnidade ,descUnidade_Mini, icone FROM gerCadastros.Cad.tblUnidade WHERE idUnidade IN (3,8)")

        End If

    End Sub


    Public Sub Preenche_Corporacao(ByVal iStr As String)
        'On Error Resume Next

        Dim selectSQL As String = iStr
        Dim con As New SqlConnection(Conexao.gerCadastros_str)

        Dim cmd As New SqlCommand(selectSQL, con)

        ' Open the connection
        con.Open()

        ' Define the binding
        cboUnidade.DataSource = cmd.ExecuteReader()
        cboUnidade.TextField = "descUnidade_Mini"
        cboUnidade.ValueField = "idUnidade"

        ' Activate the binding.
        cboUnidade.DataBind()

        con.Close()

        cboUnidade.SelectedIndex = 0

    End Sub

End Class
