
Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_Checklist_Manutencao_EliminarDiasCalculoChecklist
    Inherits System.Web.UI.Page

    Dim oData As New clDataDb
    Dim oVem As New VendaEmpresaMes
    Private connCadastro As String = Conexao.gerCadastros_str
    Private connChecklist As String = Conexao.gerCheckList

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVem.AtualizarEstatisticaPrograma(349, User.Identity.Name)
            txtData.Value = DateTime.Now.ToString("yyyy-MM-dd")

            carregaSelects()

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Manutenção de Datas da Pontuação do Checklist - PGR349"
        End If
    End Sub

    Private Sub carregaSelects()
        Dim constr As String = ConfigurationManager.ConnectionStrings("gerCadastrosConnectionString").ConnectionString
        Dim selectSQL As String = "SELECT Filial ,RTRIM(FilialLista) AS nomeFilial FROM Cadastros.tblCadFiliaisLista WHERE (IdLojasCDs=1 or isAtacarejo = 1) ORDER BY Filial"

        Using con As New SqlConnection(constr)
            Using cmd As New SqlCommand(selectSQL)
                Using sda As New SqlDataAdapter()
                    cmd.Connection = con
                    sda.SelectCommand = cmd
                    Using ds As New DataSet()
                        sda.Fill(ds)
                        selFilial.DataSource = ds.Tables(0)
                        selFilial.DataTextField = "nomeFilial"
                        selFilial.DataValueField = "Filial"
                        selFilial.DataBind()
                    End Using
                End Using
            End Using
        End Using

        selFilial.Items.Insert(0, New ListItem("99 - Todas as lojas", "99"))
        selFilial.SelectedIndex = 0

    End Sub

    Protected Sub btn_Cadastrar_Dia_Click(sender As Object, e As EventArgs) Handles btn_Cadastrar_Dia.Click
        Session("sDia") = txtData.Value

        Using con As New SqlConnection(connCadastro)
            Using cmdTest As New SqlCommand("dbo.usp_Atualiza_Cadastro_Feriado", con)
                cmdTest.CommandType = CommandType.StoredProcedure
                cmdTest.Parameters.AddWithValue("@dia", txtData.Value)
                cmdTest.Parameters.AddWithValue("@idFilial", selFilial.SelectedValue)
                Try
                    con.Open()
                    cmdTest.ExecuteNonQuery()
                    Beep()
                    grid.DataBind()
                    If selFilial.SelectedValue = "99" Then
                        oVem.UserMsgBox(Me, "A Data foi incluida para todas as Filiais!!! Recalcule a Pontuação do Checklist")
                    Else
                        oVem.UserMsgBox(Me, "A Data foi incluida para a Filial selecionada!!! Recalcule a Pontuação do Checklist")
                    End If
                Catch ex As Exception
                    oVem.UserMsgBox(Me, "Erro na inclusão da data! (" + Err.Description + ")")
                Finally
                    cmdTest.Dispose()
                    con.Close()
                End Try
            End Using
        End Using

    End Sub

    Protected Sub btn_Recalcular_Click(sender As Object, e As EventArgs) Handles btn_Recalcular.Click
        Session("sDia") = txtData.Value
        If selFilial.SelectedValue = "99" Then
            oVem.UserMsgBox(Me, "Para executar o recalculo de todas as filiais entre em contato com o Desenvolvimento 'Eliseu/Guilherme' - (Controladoria)")
        Else
            Using con As New SqlConnection(connChecklist)
                Using cmdTest As New SqlCommand("Pontuacao.usp_RECALCULA_NOTAS_FILIAL", con)
                    cmdTest.CommandType = CommandType.StoredProcedure
                    cmdTest.Parameters.AddWithValue("@dia", txtData.Value)
                    cmdTest.Parameters.AddWithValue("@idFilial", selFilial.SelectedValue)
                    Try
                        con.Open()
                        cmdTest.ExecuteNonQuery()
                        Beep()
                        grid.DataBind()
                        oVem.UserMsgBox(Me, "Pontuação do Checklist recalculada com Sucesso!!!")
                    Catch ex As Exception
                        oVem.UserMsgBox(Me, "Erro no recalculo! Entre em contato com o Suporte! (" + Err.Description + ")")
                    Finally
                        cmdTest.Dispose()
                        con.Close()
                    End Try
                End Using
            End Using
        End If

    End Sub

    Protected Sub btn_Excluir_Click(sender As Object, e As EventArgs) Handles btn_Excluir.Click
        Session("sDia") = txtData.Value

        Using con As New SqlConnection(connCadastro)
            Using cmdTest As New SqlCommand("dbo.usp_Excluir_Data_Cadastro_Feriado", con)
                cmdTest.CommandType = CommandType.StoredProcedure
                cmdTest.Parameters.AddWithValue("@dia", txtData.Value)
                cmdTest.Parameters.AddWithValue("@idFilial", selFilial.SelectedValue)
                Try
                    con.Open()
                    cmdTest.ExecuteNonQuery()
                    Beep()
                    grid.DataBind()
                    If selFilial.SelectedValue = "99" Then
                        oVem.UserMsgBox(Me, "A Data informada foi Excluida!!! Recalcule a Pontuação do Checklist")
                    Else
                        oVem.UserMsgBox(Me, "A Data informada foi Excluida para a Filial selecionada!!! Recalcule a Pontuação do Checklist")
                    End If
                Catch ex As Exception
                    oVem.UserMsgBox(Me, "Erro na exclusão da data! Entre em contato com o suporte!(" + Err.Description + ")")
                Finally
                    cmdTest.Dispose()
                    con.Close()
                End Try
            End Using
        End Using

    End Sub

    Protected Sub btnBuscar_Click(sender As Object, e As EventArgs)
        Session("sDia") = txtData.Value
        grid.DataBind()
    End Sub

End Class
