
Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_Marketing_work_Convidado
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes

    Private Sub LimparControles()

        txtCPF.Text = ""
        lblEmpresa.Text = ""
        txtConvidado.Text = ""

        ItemsDefault()

    End Sub

    Private Sub ItemsDefault()
        rnd_nao.Checked = True

        txtCPF.Focus()
    End Sub


#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim oVem As New VendaEmpresaMes
            ' oVem.AtualizarEstatisticaPrograma(225, User.Identity.Name)


            Me.btnCancelar.Enabled = True
            Me.btnSalvar.Enabled = True
            Me.btnNovo.Enabled = False

            ItemsDefault()

        End If
    End Sub

    'Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
    '    If Not IsPostBack Then
    '        CType(Master.FindControl("lblTitle"), Label).Text = "Cadastro de Contas - PGR225"
    '    End If
    'End Sub

#End Region



#Region " Btn's"

    Protected Sub btnNovo_Click(sender As Object, e As EventArgs) Handles btnNovo.Click
        LimparControles()
        txtCPF.Focus()
    End Sub

    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click
        LimparControles()
        txtCPF.Focus()

    End Sub

#End Region

    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs) Handles btnSalvar.Click

        Dim varNaoSim As Byte
        Dim varCPF As Long

        varCPF = CLng(Left(Me.txtCPF.Text, 2) & Left(Mid(Me.txtCPF.Text, 4), 3) & Left(Mid(Me.txtCPF.Text, 8), 3) & Left(Mid(Me.txtCPF.Text, 12), 4) & Right(Me.txtCPF.Text, 2))

        If rnd_nao.Checked = True Then
            varNaoSim = 1
        Else
            varNaoSim = 2
        End If
        'Me.vs.Visible = True

        Salvar(
        cboDistribuidor.Value,
        varCPF,
        txtConvidado.Text,
        varNaoSim
       )
    End Sub


    Public Function Salvar(ByVal NomeDistribuidor As String, ByVal CPF As Long,
         ByVal NomeConvidado As String,
         ByVal NaoSim As Byte
         ) As Boolean

        Dim gravou As Boolean
        Dim con As New SqlConnection(Conexao.gerMarketing)
        Dim comando As New SqlCommand("usp_InserirNovaConta", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@NomeDistribuidor", SqlDbType.VarChar))
        comando.Parameters("@NomeDistribuidor").Value = NomeDistribuidor

        comando.Parameters.Add(New SqlParameter("@CPF", SqlDbType.VarChar))
        comando.Parameters("@CPF").Value = CPF

        comando.Parameters.Add(New SqlParameter("@NomeConvidado", SqlDbType.VarChar))
        comando.Parameters("@NomeConvidado").Value = NomeConvidado

        comando.Parameters.Add(New SqlParameter("@NaoSim", SqlDbType.TinyInt))
        comando.Parameters("@NaoSim").Value = NaoSim

        Try
            con.Open()
            gravou = comando.ExecuteNonQuery    'Executa o comando, porém não retorna nenhum dado.
            oVem.UserMsgBox(Me, "O Cadastro foi salvo com sucesso!!!")
            LimparControles()
        Catch ex As Exception
            Select Case Err.Number
                Case 5
                    oVem.UserMsgBox(Me, "Este CPF já foi digitado!!! O Cadastro não foi salvo. Verifique.")
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



End Class
