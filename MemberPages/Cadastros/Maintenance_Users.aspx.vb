Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_Cadastros_Maintenance_Users
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes


    Public Function Salvar() As Boolean

        Dim gravou As Boolean
        Dim con As New SqlConnection(Conexao.gerCont_str)
        Dim comando As New SqlCommand("dbo.uspAlteraExcluirUsuario", con)
        comando.CommandType = CommandType.StoredProcedure

        ' 1 --
        comando.Parameters.Add(New SqlParameter("@Incluir_Excluir", SqlDbType.VarChar))
        comando.Parameters("@Incluir_Excluir").Value = CType(rbl_Incluir_Excluir.Value, String)

        ' 2 --
        comando.Parameters.Add(New SqlParameter("@UserName", SqlDbType.VarChar))
        comando.Parameters("@UserName").Value = txtUserName.Text

        ' 3 --
        comando.Parameters.Add(New SqlParameter("@Departamento", SqlDbType.VarChar))
        comando.Parameters("@Departamento").Value = CType(cboDepartamento.Value, String)

        ' 4 --
        comando.Parameters.Add(New SqlParameter("@Local", SqlDbType.VarChar))
        comando.Parameters("@Local").Value = CType(rbl_Loja_Adm.SelectedItem.Value, String)

        ' 5 --
        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.SmallInt))
        comando.Parameters("@idFilial").Value = cboFilial.CallFilial

        ' 6 --
        comando.Parameters.Add(New SqlParameter("@isLoja", SqlDbType.VarChar))
        comando.Parameters("@isLoja").Value = isLoja.Value


        Try
            con.Open()
            gravou = comando.ExecuteNonQuery    'Executa o comando, porém não retorna nenhum dado.
            oVem.UserMsgBox(Me, "O Cadastro foi salvo com sucesso!!!")
            LimparDados()
            txtUserName.Focus()
        Catch ex As Exception
            Select Case Err.Number
                Case 5
                    ' oVem.UserMsgBox(Me, Err.Number & " - " & ex.Message)
                    oVem.UserMsgBox(Me, Err.Number & " - " & ex.Message & " - Erro Case 5")
                Case Else
                    oVem.UserMsgBox(Me, Err.Number & " - " & ex.Message)
            End Select
            'oVem.UserMsgBox(Me, Err.Number & " - " & ex.Message)

        Finally 'Tudo o que estiver entre o "Finally" e o "End Try" será executado mesmo após a mensagem de erro.
            con.Close() 'Fecha o banco de dados
        End Try

        Return gravou   'Toda função tem retornar alguma coisa
        'Neste caso o retorno será dados pela variavel "gavou"

    End Function

    Private Sub LimparDados()
        txtUserName.Text = ""
       
    End Sub

    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs) Handles btnSalvar.Click
        Call Salvar()
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            cboFilial.Caption_Filial = ""
        End If
    End Sub
End Class
