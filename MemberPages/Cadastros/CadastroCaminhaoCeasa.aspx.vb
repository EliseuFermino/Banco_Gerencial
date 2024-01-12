Imports System.Data
Imports System.Data.SqlClient
Imports DevExpress.SharePoint
Imports DevExpress.Web
Imports DevExpress.Xpf.Grid

Partial Class MemberPages_Quebras_Validade_CadastroValidade
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes
    Dim oPro As New Projeto
    Dim selects As New preencheSelects
    Private vDepartamento As String
    Private vFilial As String

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            vFilial = oPro.BuscarLocalDoUsuario(Page.User.Identity.Name)
            vDepartamento = LCase(Trim(oPro.Buscar_Departamento_Usuario(Page.User.Identity.Name)))
            oVem.AtualizarEstatisticaPrograma(426, User.Identity.Name)
            txtData.Value = DateTime.Now()
            selects.Define_Filial(3, vDepartamento, User.Identity.Name, vFilial, selFilial)

            Atualizar()


        End If
    End Sub

    Private Sub Atualizar()
        Session("sDIA") = txtData.Value
        grid_Dados.DataBind()
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Cadastro de Chegada Caminhão CEASA - PGR426"
        End If
    End Sub

    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs) Handles btnSalvar.Click

        If (txtEntrada.Value = "" Or txtSaida.Value = "") Then
            ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertaCampos('Preencha os campos corretamente antes de prosseguir!');", True)
            Exit Sub
        End If

        If (txtEntrada.Value > txtSaida.Value) Then
            ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertaCampos('Atenção! O Horário de saída não pode ser menor que o de entrada!');", True)
            Exit Sub
        End If

        Call Salvar()

        grid_Dados.DataBind()

        ScriptManager.RegisterStartupScript(sender, Me.GetType(), "Script", "alertSucess();", True)

    End Sub


    Public Function Salvar() As Boolean

        Dim gravou As Boolean
        Dim con As New SqlConnection(Conexao.DW_Condor_One_ConnectionString)
        Dim comando As New SqlCommand("uspInsert_CaminhaoHorarioCeasa", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Dia", SqlDbType.Date))
        comando.Parameters("@Dia").Value = txtData.Value

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.SmallInt))
        comando.Parameters("@idFilial").Value = selFilial.SelectedValue

        comando.Parameters.Add(New SqlParameter("@horaInicial", SqlDbType.Time))
        comando.Parameters("@horaInicial").Value = txtEntrada.Value

        comando.Parameters.Add(New SqlParameter("@horaFinal", SqlDbType.Time))
        comando.Parameters("@horaFinal").Value = txtSaida.Value

        comando.Parameters.Add(New SqlParameter("@Usuario", SqlDbType.VarChar))
        comando.Parameters("@Usuario").Value = Page.User.Identity.Name

        comando.Parameters.Add(New SqlParameter("@Obs", SqlDbType.VarChar))
        comando.Parameters("@Obs").Value = txtObs.Value.ToString().ToUpper()

        Try
            con.Open()
            gravou = comando.ExecuteNonQuery    'Executa o comando, porém não retorna nenhum dado.
            oVem.UserMsgBox(Me, "O Cadastro foi salvo com sucesso!!!")
            'LimparDados()
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

    'Private Sub LimparDados()
    '    txtSaida.Value = ""
    '    txtEntrada.Value = ""
    '    txtObs.Value = ""
    'End Sub
    Protected Sub ASPxGridView1_HtmlRowPrepared(sender As Object, e As ASPxGridViewTableRowEventArgs) Handles grid_Dados.HtmlRowPrepared

        Dim NomeColuna As String = e.GetValue("Entrada")
        Select Case NomeColuna
            Case ""
                e.Row.BackColor = System.Drawing.Color.LightCoral
                e.Row.Font.Bold = True
        End Select

    End Sub

    Protected Sub txtData_DateChanged(sender As Object, e As EventArgs)
        Atualizar()
    End Sub
End Class
