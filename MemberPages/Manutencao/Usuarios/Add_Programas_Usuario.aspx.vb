
Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_Manutencao_Usuarios_Add_Programas_Usuario
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            oFun.Grid_Title(gridMenuPrincipal, "Escolher Menu Principal")


            ' Create connection usuarios
            Dim strConnectionUsuarios As String = ConfigurationManager.ConnectionStrings("gerCadastrosConnectionString").ConnectionString
            Dim myConnectionUsuarios As SqlConnection = New SqlConnection(strConnectionUsuarios)

            ' Create the command usuarios
            Dim strCommandUsuariosText As String = "SELECT USUARIO ,NOME FROM [CAD].[dbo].[TESUSUARIO] WHERE ATIVO = 1"
            Dim myCommandUsuarios As SqlCommand = New SqlCommand(strCommandUsuariosText, myConnectionUsuarios)

            ' Open database connection Usuarios
            myConnectionUsuarios.Open()

            ' Preencher o Combobox
            cboMenuprincipal.DataSource = myCommandUsuarios.ExecuteReader()
            cboMenuprincipal.TextField = "NOME"
            cboMenuprincipal.ValueField = "USUARIO"
            cboMenuprincipal.DataBind()

            ' Close the connection
            myConnectionUsuarios.Close()


            ' Create the connection
            Dim strConnectionString As String = ConfigurationManager.ConnectionStrings("ApplicationServices").ConnectionString
            Dim myConnection As SqlConnection = New SqlConnection(strConnectionString)

            ' Create the count query
            Dim strCommandTextCount As String = "SELECT COUNT(*) FROM [gerCont].[Menu].[Dados] WHERE ParentID = 0"
            Dim myCommandCount As SqlCommand = New SqlCommand(strCommandTextCount, myConnection)

            ' Open the database connection
            myConnection.Open()

            ' Count the number the Menu Principal
            lblCount_MenuPrincipal.Text = Convert.ToString(myCommandCount.ExecuteScalar())

            myConnection.Close()

        End If

    End Sub
End Class
