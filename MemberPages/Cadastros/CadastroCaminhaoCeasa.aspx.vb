Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_Quebras_Validade_CadastroValidade
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes
    Dim oPro As New Projeto

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim setor As String

            oVem.AtualizarEstatisticaPrograma(426, User.Identity.Name)
            cboFilial.Visible_cboCorporacao = False

            cboDia.Date = DateAndTime.Today()
            cboDia.AutoPostBack = True

            txtHorariaChegada.Attributes.Add("autocomplete", "off")
            txtHorariaSaiada.Attributes.Add("autocomplete", "off")

            cboFilial.Caption_Filial = ""

            setor = oPro.BuscarDepartamentoDoUsuario(Page.User.Identity.Name)

            'If setor = "Controladoria" Then
            '    cboDia.Enabled = True
            'Else
            '    cboDia.Enabled = False
            'End If



        End If
    End Sub

    Private Sub Atualizar()
        Session("sDIA") = cboDia.Date
        grid_Dados.DataBind()
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Cadastro de Chegada Caminhão CEASA - PGR426"
        End If
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            txtHorariaChegada.Focus()
        End If
    End Sub

    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs) Handles btnSalvar.Click

        If cboDia.Text = Nothing Then
            oVem.UserMsgBox(Me, "Você deve informar o 'Vencimento'?")
            txtHorariaChegada.Focus()
            Exit Sub
        End If
   
        Call Salvar()
    End Sub


    Public Function Salvar() As Boolean

        Dim gravou As Boolean
        Dim con As New SqlConnection(Conexao.DW_Condor_One_ConnectionString)
        Dim comando As New SqlCommand("uspInsert_CaminhaoHorarioCeasa", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Dia", SqlDbType.Date))
        comando.Parameters("@Dia").Value = cboDia.Date

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.SmallInt))
        comando.Parameters("@idFilial").Value = cboFilial.CallFilial

        comando.Parameters.Add(New SqlParameter("@horaInicial", SqlDbType.Time))
        comando.Parameters("@horaInicial").Value = txtHorariaChegada.Text

        comando.Parameters.Add(New SqlParameter("@horaFinal", SqlDbType.Time))
        comando.Parameters("@horaFinal").Value = txtHorariaSaiada.Text

        comando.Parameters.Add(New SqlParameter("@Usuario", SqlDbType.VarChar))
        comando.Parameters("@Usuario").Value = Page.User.Identity.Name

        Try
            con.Open()
            gravou = comando.ExecuteNonQuery    'Executa o comando, porém não retorna nenhum dado.
            oVem.UserMsgBox(Me, "O Cadastro foi salvo com sucesso!!!")
            LimparDados()
            txtHorariaChegada.Focus()
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
        txtHorariaChegada.Text = ""
        txtHorariaSaiada.Text = ""
 
    End Sub

  
    Protected Sub cboDia_DateChanged(sender As Object, e As EventArgs) Handles cboDia.DateChanged
        Atualizar()
    End Sub
End Class
