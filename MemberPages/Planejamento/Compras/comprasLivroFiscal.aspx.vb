
Imports System.Data
Imports System.Data.SqlClient
Imports DevExpress.Xpf.Editors.Helpers
Imports DevExpress.XtraSpreadsheet.Forms


Partial Class MemberPages_Planejamento_Compras_comprasLivroFiscal
    Inherits System.Web.UI.Page

    Private vFilial As Int16
    Private vDepartamento As String
    Dim oProj As New Projeto

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "lastData();", True)

            vFilial = oProj.Buscar_Filial_Usuario(Page.User.Identity.Name)
            Session("sFilial") = vFilial

            selUnidade.Value = vFilial

            If txtData.Value > "" Then
                Session("sData") = txtData.Value
            Else
                Session("sData") = Now.Date().AddDays(-1)
            End If

            carregaSelects()

        End If
    End Sub

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(436, User.Identity.Name)

        End If
    End Sub

    Private Sub carregaSelects()

        Dim constr As String = ConfigurationManager.ConnectionStrings("gerTempConnectionString").ConnectionString
        Dim selectSQL As String = "SELECT Filial ,RTRIM(FilialLista) AS nomeFilial FROM gerCadastros.Cadastros.tblCadFiliaisLista WHERE (IdLojasCDs=1 or isAtacarejo = 1) and Filial not in (100) ORDER BY nomeFilial"
        Dim con As New SqlConnection(Conexao.gerCadastros_str)
        Dim cmd As New SqlCommand(selectSQL, con)

        ' Open the connection
        con.Open()

        Try
            ' Define the binding
            selUnidade.DataSource = cmd.ExecuteReader()
            selUnidade.DataTextField = "nomeFilial"
            selUnidade.DataValueField = "Filial"

            'Activate the binding.
            selUnidade.DataBind()

            con.Close()

            If Session("sFilial") IsNot Nothing Then
                For i As Integer = 0 To selUnidade.Items.Count
                    If selUnidade.Items(i).Value = Session("sFilial") Then
                        selUnidade.Value = Session("sFilial")
                        selUnidade.SelectedIndex = i
                        Exit For
                    End If
                Next
            End If

        Catch ex As Exception
            'lblError.Text = iStr
        Finally
            con.Close()
        End Try

    End Sub

    Protected Sub btnFiltrar_Click(sender As Object, e As EventArgs)

        Session("sFilial") = selUnidade.Value
        Session("sData") = txtData.Value
        grvDados.DataBind()

    End Sub

    Protected Sub gridPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles gridPanel.Callback

        grvDados.DataBind()

    End Sub

End Class
