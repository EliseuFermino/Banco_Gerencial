Imports System.Data
Imports System.Data.SqlClient

Partial Class Ranking_planej06_DiarioBordo
    Inherits System.Web.UI.Page
    Dim cnnStr As String = "Data Source=10.1.1.14\SQLCONTRO;Initial Catalog=gerCont;User ID=sa; PWD=rd700@1"
    Dim varPlanoAcao As Byte
    Dim varSalvarPA As Byte
    Dim varStatus As Byte

    Private Sub TelaNova()
        Me.btnSalvar.Enabled = False
        Me.btnExcluir.Enabled = False
        Me.btnCancelar.Enabled = False
        Me.btnAlterar.Enabled = False
        Me.btnNovo.Enabled = True
        Me.cboList.Enabled = True
        Me.cboList.Text = ""
        Call PreencherListaAta()
        Me.txtDia.Text = ""
        Me.lbl_SubProjetoID.Text = 0
        Me.lbl_EtapaID.Text = 0
        Call OcultarLegenda_Etapa()
        Call OcultarLegenda_SubProjeto()
        Me.txtDia.Enabled = False
        Me.btnAbrirPA.Enabled = False
        Call LimparControles()
        Call DesabilitarControles()

    End Sub

    Sub Salvar()
        Dim strSP As String
        Dim ID As Integer
        If CInt(Trim(Me.lbl_SubProjetoID.Text.Length)) > 0 Then 'Só Sub-Projeto
            If CInt(Trim(Me.lbl_EtapaID.Text.Length)) < 1 Then
                UserMsgBox(Me, "Sub: " & CInt(Trim(Me.lbl_SubProjetoID.Text.Length)) & " - Etapa: " & CInt(Trim(Me.lbl_EtapaID.Text.Length)) & "")
                strSP = "uspProjAtaSalvar_ComSubProjeto"
            Else                                                'Sub-Projeto e Etap
                strSP = "uspProjAtaSalvar_ComSubProjetoEtapa"
            End If
        Else                                                    'Sem Sub-Projeto e Só Etapa
            If CInt(Trim(Me.lbl_EtapaID.Text.Length)) > 0 Then
                strSP = "uspProjAtaSalvar_ComEtapa"
            Else
                strSP = "uspProjAtaSalvar_ComProjeto"   'Só Projeto
            End If

        End If
        Using conn As New SqlConnection(cnnStr)
            Using cmdTest As New SqlCommand(strSP, conn)
                cmdTest.CommandType = CommandType.StoredProcedure

                cmdTest.Parameters.AddWithValue("@ataDia", Me.txtDia.Date)
                cmdTest.Parameters.AddWithValue("@ataParticipantes", CStr(Trim(Me.txtMemoParticipantes.Text)))
                cmdTest.Parameters.AddWithValue("@ataObjetivos", CStr(Trim(Me.txtMemoObjetivos.Text)))
                cmdTest.Parameters.AddWithValue("@ataDiscussao", CStr(Trim(Me.txtMemoDiscussao.Text)))
                cmdTest.Parameters.AddWithValue("@ProjetoID", Me.cboProjeto.Value)
                If CInt(Me.lbl_SubProjetoID.Text) > 0 Then
                    cmdTest.Parameters.AddWithValue("@SubProjetoID", Me.lbl_SubProjetoID.Text)
                Else
                    cmdTest.Parameters.AddWithValue("@SubProjetoID", 1)
                End If

                If CInt(Me.lbl_EtapaID.Text) > 0 Then
                    cmdTest.Parameters.AddWithValue("@EtapaID", Me.lbl_EtapaID.Text)
                Else
                    cmdTest.Parameters.AddWithValue("@EtapaID", 1)
                End If

                cmdTest.Parameters.AddWithValue("@UserName", User.Identity.Name)

                cmdTest.Parameters.Add("@ataID", SqlDbType.SmallInt, 0, "ataID")
                cmdTest.Parameters("@ataID").Direction = ParameterDirection.Output

                Try
                    conn.Open()
                    cmdTest.ExecuteNonQuery()
                    ID = cmdTest.Parameters("@ataID").Value
                    conn.Close()
                    UserMsgBox(Me, "A Ata foi salva com sucesso!!!")

                    Call TelaAposSalvar()
                    Me.cboList.Text = ID & "; " & Me.txtDia.Text
                    Me.btnAbrirPA.Enabled = True

                Catch ex As Exception
                    UserMsgBox(Me, "Módulo: Salvar - " & ex.Message)
                    UserMsgBox(Me, "Houve um problema. A ata não foi salva")
                End Try
                conn.Close()
            End Using
        End Using
    End Sub

    Sub AtualizarAta()

        Dim sConnStr As String = cnnStr
        Dim cnBKTest As New SqlConnection(sConnStr)

        Dim cmdTest As New SqlCommand("uspProjAtaAtualizar_ComProjeto", cnBKTest)

        cmdTest.CommandType = Data.CommandType.StoredProcedure

        cmdTest.Parameters.Add(New SqlParameter("@ataID", Data.SqlDbType.SmallInt))
        cmdTest.Parameters("@ataID").Value = CInt(Replace(Left(Me.cboList.Value, 3), ";", ""))

        cmdTest.Parameters.Add(New SqlParameter("@ataParticipantes", Data.SqlDbType.Char))
        cmdTest.Parameters("@ataParticipantes").Value = Me.txtMemoParticipantes.Text

        cmdTest.Parameters.Add(New SqlParameter("@ataObjetivos", Data.SqlDbType.Text))
        cmdTest.Parameters("@ataObjetivos").Value = Me.txtMemoObjetivos.Text

        cmdTest.Parameters.Add(New SqlParameter("@ataDiscussao", Data.SqlDbType.Text))
        cmdTest.Parameters("@ataDiscussao").Value = Me.txtMemoDiscussao.Text

        Try
            cnBKTest.Open()
            cmdTest.ExecuteNonQuery()
            cnBKTest.Close()
            UserMsgBox(Me, "A Ata nº " & CInt(Replace(Left(Me.cboList.Value, 3), ";", "")) & " foi atualizada com sucesso!!!")
            Call TelaAposSalvar()

        Catch ex As Exception
            UserMsgBox(Me, "AtualizarAta - " & ex.Message)
            UserMsgBox(Me, "Houve um problema. A ata não foi salva")
        Finally
            cnBKTest.Close()
        End Try

    End Sub

    Protected Sub btnSalvar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSalvar.Click

        If CInt(Trim(Me.txtDia.Text.Length)) < 1 Then
            Beep()
            UserMsgBox(Me, "Você deve selecionar uma 'Data' para poder salvar a ata.")
            Exit Sub
        End If

        If CInt(Trim(Me.txtMemoParticipantes.Text.Length)) < 1 Then
            Beep()
            UserMsgBox(Me, "Você deve informar os 'Participantes' para poder salvar a ata.")
            Me.txtMemoParticipantes.Focus()
            Exit Sub
        End If

        If CInt(Trim(Me.txtMemoObjetivos.Text.Length)) < 1 Then
            Beep()
            UserMsgBox(Me, "Você deve informar os 'Objetivos desta Reunião' para poder salvar a ata.")
            Me.txtMemoObjetivos.Focus()
            Exit Sub
        End If

        If CInt(Trim(Me.txtMemoDiscussao.Text.Length)) < 1 Then
            Beep()
            UserMsgBox(Me, "Você deve informar a 'Discussão' para poder salvar a ata.")
            Me.txtMemoDiscussao.Focus()
            Exit Sub
        End If

        If CInt(Trim(Me.cboList.Text.Length)) > 1 Then   'A ata já existe
            Call AtualizarAta()
        Else    'Ata não existe
            Call Salvar()
        End If
        Me.txtvarStatus.Value = 1
    End Sub

    Private Sub TelaAposSalvar()
        Me.btnSalvar.Enabled = False
        Me.btnCancelar.Enabled = False
        Me.btnNovo.Enabled = True
        Me.btnAlterar.Enabled = True
        Me.btnExcluir.Enabled = True
        Me.cboList.Enabled = True
        Me.cboProjeto.Enabled = True
        Me.txtMemoParticipantes.Enabled = False
        Me.txtMemoObjetivos.Enabled = False
        Me.txtMemoDiscussao.Enabled = False
        Call PreencherListaAta()
    End Sub

    Private Sub DesabilitarControles()
        Me.txtDia.Enabled = False
        Me.txtMemoParticipantes.Enabled = False
        Me.txtMemoObjetivos.Enabled = False
        Me.txtMemoDiscussao.Enabled = False
        Me.btnIncluir.Enabled = False
    End Sub

    Sub GerarNovaID()

        Dim con As New SqlConnection(cnnStr)

        Dim comando As New SqlCommand("uspProjetoDiarioBordoID", con)
        comando.CommandType = CommandType.StoredProcedure

        Try
            Dim varID As Int16
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                varID = CDbl(reader5.GetSqlInt16(0).ToString).ToString("n0")
            End While
            'Me.txtDiarioID.Text = varID + 1
        Catch ex As Exception
            Beep()
            ' UserMsgBox(Me, ex.Message)

        Finally
            con.Close()
        End Try
    End Sub

    Protected Sub btnNovo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNovo.Click
        '"10.1.1.218"
        If BuscaIP() <> "10.1.1.218" Then
            Beep()
            UserMsgBox(Me, "Você só pode criar uma nova Ata na sala de reunião.")
            Exit Sub
        End If

        If Me.cboProjeto.Text = "" Then
            Beep()
            UserMsgBox(Me, "Você deve selecionar um Projeto para poder salvar a ata.")
            Exit Sub
        End If

        Call LimparControles()
        Me.cboList.Enabled = False
        Me.btnSalvar.Enabled = True
        Me.btnCancelar.Enabled = True
        Me.btnNovo.Enabled = False
        Me.btnAlterar.Enabled = False
        Me.txtDia.Enabled = True
        Me.lbl_SubProjetoID.Text = 0
        Me.lbl_EtapaID.Text = 0
        Me.btnIncluir.Enabled = True
        Call OcultarLegenda_Etapa()
        Call OcultarLegenda_SubProjeto()
        Me.txtMemoParticipantes.Focus()

    End Sub

    Private Sub ExibirLegenda_SubProjeto()
        Me.lblCaptionSubProjeto.Visible = True
        Me.lblNomeSubProjeto.Visible = True
    End Sub

    Private Sub OcultarLegenda_SubProjeto()
        Me.lblCaptionSubProjeto.Visible = False
        Me.lblNomeSubProjeto.Visible = False
    End Sub

    Private Sub ExibirLegenda_Etapa()
        Me.lblCaptionEtapa.Visible = True
        Me.lblNomeEtapa.Visible = True
    End Sub

    Private Sub OcultarLegenda_Etapa()
        Me.lblCaptionEtapa.Visible = False
        Me.lblNomeEtapa.Visible = False
    End Sub

    Private Sub LimparControles()
        Me.txtDia.Text = ""
        Me.txtMemoParticipantes.Text = ""
        Me.txtMemoObjetivos.Text = ""
        Me.txtMemoDiscussao.Text = ""
        Me.cboList.Value = ""
        Call HabilitarControles()
    End Sub

    Protected Sub btnCancelar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelar.Click
        If CInt(Trim(Me.cboList.Text.Length)) > 0 Then
            Call BuscarAtas(CInt(Replace(Left(Me.cboList.Value, 3), ";", "")))
            Call TelaAposSalvar()
        Else
            TelaNova()
        End If
    End Sub

    Sub BuscarAtas(ByVal iAtaID As String)

        Dim con As New SqlConnection(cnnStr)
        Dim strSQL As String = "SELECT ataDia, ataParticipantes, ataObjetivos, ataDiscussao, ProjetoID, ISNULL(EtapaID, 0), ISNULL(SubProjetoID, 0) " & _
                                "FROM projAta WHERE ataID = " & CInt(Replace(Left(Me.cboList.Value, 3), ";", "")) & ""
        'UserMsgBox(Me, strSQL)
        Dim comando As New SqlCommand(strSQL, con)
        comando.CommandType = CommandType.Text

        Call OcultarLegenda_Etapa()
        Call OcultarLegenda_SubProjeto()

        Try

            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                Me.txtDia.Date = reader5.GetSqlDateTime(0)
                Me.txtMemoParticipantes.Text = Trim(reader5.GetSqlString(1).ToString())
                Me.txtMemoObjetivos.Text = Trim(reader5.GetSqlString(2).ToString())
                Me.txtMemoDiscussao.Text = Trim(reader5.GetSqlString(3).ToString())
                Me.lbl_EtapaID.Text = reader5.GetSqlInt16(5).ToString()
                Me.lbl_SubProjetoID.Text = reader5.GetSqlInt16(6).ToString()
            End While

        Catch ex As Exception
            Beep()
            UserMsgBox(Me, "Módulo: BuscarAtas - " & ex.Message)

        Finally
            con.Close()
        End Try

    End Sub

    Sub HabilitarControles()
        Me.txtDia.Enabled = False
        Me.txtMemoParticipantes.Enabled = True
        Me.txtMemoObjetivos.Enabled = True
        Me.txtMemoDiscussao.Enabled = True
    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Dim oVem As New VendaEmpresaMes
        Dim oProjeto As New Projeto

        If Not IsPostBack() Then oVem.AtualizarEstatisticaPrograma(24, User.Identity.Name)
        Me.cboProjeto.Text = Session("idProjeto")

        Select Case oProjeto.CoordenadorProjeto(User.Identity.Name)
            Case 1
                Me.cboProjeto.Enabled = True
            Case Else
                Me.cboProjeto.Enabled = False
        End Select

        'Define a Seção do Programa - Session 3
        Session("idTela") = 3
        Call DesativarBotoes_PanelCadastroSPE()
        Call TelaNova()

        Call SomenteLeitura()
        
    End Sub

    Private Sub SomenteLeitura()
        Select Case Session("SomenteLeitura")
            Case 1  'Somente Leitura - Todos os Projetos
                Me.btnAbrirPA.Enabled = False
                Me.btnAlterarPAGrid.Enabled = False
                Me.btnNovo.Enabled = False
                Me.btnAlterar.Enabled = False
                Me.btnExcluir.Enabled = False
                Me.cboProjeto.Enabled = True
            Case 2  'Projeto Especifico
                Me.btnAbrirPA.Enabled = False
                Me.btnAlterarPAGrid.Enabled = False
                Me.btnNovo.Enabled = False
                Me.btnAlterar.Enabled = False
                Me.btnExcluir.Enabled = False
        End Select
    End Sub

    Public Sub UserMsgBox(ByVal F As Object, ByVal sMsg As String)
        Dim sb As New StringBuilder()
        Dim oFormObject As System.Web.UI.Control = Nothing
        Try
            sMsg = sMsg.Replace("'", "\'")
            sMsg = sMsg.Replace(Chr(34), "\" & Chr(34))
            sMsg = sMsg.Replace(vbCrLf, "\n")
            sMsg = "<script language='javascript'>alert('" & sMsg & "');</script>"
            sb = New StringBuilder()
            sb.Append(sMsg)
            For Each oFormObject In F.Controls
                If TypeOf oFormObject Is HtmlForm Then
                    Exit For
                End If
            Next
            oFormObject.Controls.AddAt(oFormObject.Controls.Count, New LiteralControl(sb.ToString()))
        Catch ex As Exception

        End Try
    End Sub

    Protected Sub btnEnviarPlanoAcao_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEnviarPlanoAcao.Click
        'If Me.chkPlanoAcao.Checked = False Then
        '    If Me.chkPlanoAcao1.Checked = False Then
        '        If Me.chkPlanoAcao2.Checked = False Then
        '            If Me.chkPlanoAcao3.Checked = False Then
        '                If Me.chkPlanoAcao4.Checked = False Then
        '                    If Me.chkPlanoAcao5.Checked = False Then
        '                        If Me.chkPlanoAcao6.Checked = False Then
        '                            If Me.chkPlanoAcao7.Checked = False Then
        '                                If Me.chkPlanoAcao8.Checked = False Then
        '                                    If Me.chkPlanoAcao9.Checked = False Then
        '                                        UserMsgBox(Me, "Você não selecionou nenhum Plano de Ação!!!")
        '                                        Exit Sub
        '                                    End If
        '                                End If
        '                            End If
        '                        End If
        '                    End If
        '                End If
        '            End If
        '        End If
        '    End If
        'End If

        'If Me.chkPlanoAcao.Checked = True Then
        '    If Me.lbl_spa.Text = 0 Then     'Novo Plano de Ação
        '        Call GerarTarefaID()
        '        Me.lbl_spa.Text = Me.txtTarefaID.Text
        '        Call SalvarAta_PlanoAcao()
        '        Call SalvarPlanoDeAcao(Me.txtMemoDecisoes.Text)
        '        Me.chkPlanoAcao.Checked = True
        '    Else
        '        Me.txtTarefaID.Text = Me.lbl_spa.Text
        '        Call SalvarAta_PlanoAcao()
        '        Call SalvarPlanoDeAcao(Me.txtMemoDecisoes.Text)
        '        Me.chkPlanoAcao.Checked = True
        '    End If
        'End If

        'If Me.chkPlanoAcao1.Checked = True Then
        '    If Me.lbl_spa1.Text = 0 Then     'Novo Plano de Ação
        '        Call GerarTarefaID()
        '        Me.lbl_spa1.Text = Me.txtTarefaID.Text
        '        Call SalvarAta_PlanoAcao()
        '        Call SalvarPlanoDeAcao(Me.txtMemoDecisoes1.Text)
        '        Me.chkPlanoAcao1.Checked = True
        '    Else
        '        Me.txtTarefaID.Text = Me.lbl_spa1.Text
        '        Call SalvarAta_PlanoAcao()
        '        Call SalvarPlanoDeAcao(Me.txtMemoDecisoes1.Text)
        '        Me.chkPlanoAcao1.Checked = True
        '    End If
        'End If

        'If Me.chkPlanoAcao2.Checked = True Then
        '    If Me.lbl_spa2.Text = 0 Then     'Novo Plano de Ação
        '        Call GerarTarefaID()
        '        Me.lbl_spa2.Text = Me.txtTarefaID.Text
        '        Call SalvarAta_PlanoAcao()
        '        Call SalvarPlanoDeAcao(Me.txtMemoDecisoes2.Text)
        '        Me.chkPlanoAcao2.Checked = True
        '    Else
        '        Me.txtTarefaID.Text = Me.lbl_spa2.Text
        '        Call SalvarAta_PlanoAcao()
        '        Call SalvarPlanoDeAcao(Me.txtMemoDecisoes2.Text)
        '        Me.chkPlanoAcao2.Checked = True
        '    End If
        'End If

        'If Me.chkPlanoAcao3.Checked = True Then
        '    If Me.lbl_spa3.Text = 0 Then     'Novo Plano de Ação
        '        Call GerarTarefaID()
        '        Me.lbl_spa3.Text = Me.txtTarefaID.Text
        '        Call SalvarAta_PlanoAcao()
        '        Call SalvarPlanoDeAcao(Me.txtMemoDecisoes3.Text)
        '        Me.chkPlanoAcao3.Checked = True
        '    Else
        '        Me.txtTarefaID.Text = Me.lbl_spa3.Text
        '        Call SalvarAta_PlanoAcao()
        '        Call SalvarPlanoDeAcao(Me.txtMemoDecisoes3.Text)
        '        Me.chkPlanoAcao3.Checked = True
        '    End If
        'End If

        'If Me.chkPlanoAcao4.Checked = True Then
        '    If Me.lbl_spa4.Text = 0 Then     'Novo Plano de Ação
        '        Call GerarTarefaID()
        '        Me.lbl_spa4.Text = Me.txtTarefaID.Text
        '        Call SalvarAta_PlanoAcao()
        '        Call SalvarPlanoDeAcao(Me.txtMemoDecisoes4.Text)
        '        Me.chkPlanoAcao4.Checked = True
        '    Else
        '        Me.txtTarefaID.Text = Me.lbl_spa4.Text
        '        Call SalvarAta_PlanoAcao()
        '        Call SalvarPlanoDeAcao(Me.txtMemoDecisoes4.Text)
        '        Me.chkPlanoAcao4.Checked = True
        '    End If
        'End If

        'If Me.chkPlanoAcao5.Checked = True Then
        '    If Me.lbl_spa5.Text = 0 Then     'Novo Plano de Ação
        '        Call GerarTarefaID()
        '        Me.lbl_spa5.Text = Me.txtTarefaID.Text
        '        Call SalvarAta_PlanoAcao()
        '        Call SalvarPlanoDeAcao(Me.txtMemoDecisoes5.Text)
        '        Me.chkPlanoAcao5.Checked = True
        '    Else
        '        Me.txtTarefaID.Text = Me.lbl_spa5.Text
        '        Call SalvarAta_PlanoAcao()
        '        Call SalvarPlanoDeAcao(Me.txtMemoDecisoes5.Text)
        '        Me.chkPlanoAcao5.Checked = True
        '    End If
        'End If

        'If Me.chkPlanoAcao6.Checked = True Then
        '    If Me.lbl_spa6.Text = 0 Then     'Novo Plano de Ação
        '        Call GerarTarefaID()
        '        Me.lbl_spa6.Text = Me.txtTarefaID.Text
        '        Call SalvarAta_PlanoAcao()
        '        Call SalvarPlanoDeAcao(Me.txtMemoDecisoes6.Text)
        '        Me.chkPlanoAcao6.Checked = True
        '    Else
        '        Me.txtTarefaID.Text = Me.lbl_spa6.Text
        '        Call SalvarAta_PlanoAcao()
        '        Call SalvarPlanoDeAcao(Me.txtMemoDecisoes6.Text)
        '        Me.chkPlanoAcao6.Checked = True
        '    End If
        'End If

        'If Me.chkPlanoAcao7.Checked = True Then
        '    If Me.lbl_spa7.Text = 0 Then     'Novo Plano de Ação
        '        Call GerarTarefaID()
        '        Me.lbl_spa7.Text = Me.txtTarefaID.Text
        '        Call SalvarAta_PlanoAcao()
        '        Call SalvarPlanoDeAcao(Me.txtMemoDecisoes7.Text)
        '        Me.chkPlanoAcao7.Checked = True
        '    Else
        '        Me.txtTarefaID.Text = Me.lbl_spa7.Text
        '        Call SalvarAta_PlanoAcao()
        '        Call SalvarPlanoDeAcao(Me.txtMemoDecisoes7.Text)
        '        Me.chkPlanoAcao7.Checked = True
        '    End If
        'End If

        'If Me.chkPlanoAcao8.Checked = True Then
        '    If Me.lbl_spa8.Text = 0 Then     'Novo Plano de Ação
        '        Call GerarTarefaID()
        '        Me.lbl_spa8.Text = Me.txtTarefaID.Text
        '        Call SalvarAta_PlanoAcao()
        '        Call SalvarPlanoDeAcao(Me.txtMemoDecisoes8.Text)
        '        Me.chkPlanoAcao8.Checked = True
        '    Else
        '        Me.txtTarefaID.Text = Me.lbl_spa8.Text
        '        Call SalvarAta_PlanoAcao()
        '        Call SalvarPlanoDeAcao(Me.txtMemoDecisoes8.Text)
        '        Me.chkPlanoAcao8.Checked = True
        '    End If
        'End If

        'If Me.chkPlanoAcao9.Checked = True Then
        '    If Me.lbl_spa9.Text = 0 Then     'Novo Plano de Ação
        '        Call GerarTarefaID()
        '        Me.lbl_spa9.Text = Me.txtTarefaID.Text
        '        Call SalvarAta_PlanoAcao()
        '        Call SalvarPlanoDeAcao(Me.txtMemoDecisoes9.Text)
        '        Me.chkPlanoAcao9.Checked = True
        '    Else
        '        Me.txtTarefaID.Text = Me.lbl_spa9.Text
        '        Call SalvarAta_PlanoAcao()
        '        Call SalvarPlanoDeAcao(Me.txtMemoDecisoes9.Text)
        '        Me.chkPlanoAcao9.Checked = True
        '    End If
        'End If

        Beep()
        UserMsgBox(Me, "O plano de ação foi salvo")

    End Sub

    Sub SalvarPlanoDeAcao(ByVal iDecisao As String)

        'Dim sConnStr As String = cnnStr
        'Dim cnBKTest As New SqlConnection(sConnStr)
        'Dim cmdTest As New SqlCommand("uspPlanoDeAcao_Salvar", cnBKTest)

        'cmdTest.CommandType = Data.CommandType.StoredProcedure

        'cmdTest.Parameters.Add(New SqlParameter("@TarefaID", Data.SqlDbType.SmallInt))
        'cmdTest.Parameters("@TarefaID").Value = Me.txtTarefaID.Text

        'cmdTest.Parameters.Add(New SqlParameter("@EtapaID", Data.SqlDbType.SmallInt))
        'cmdTest.Parameters("@EtapaID").Value = Me.cboEtapa.Value

        'cmdTest.Parameters.Add(New SqlParameter("@Oque", Data.SqlDbType.VarChar))
        'cmdTest.Parameters("@Oque").Value = iDecisao

        'cmdTest.Parameters.Add(New SqlParameter("@DataAta", Data.SqlDbType.Date))
        'cmdTest.Parameters("@DataAta").Value = Me.txtDia.Date

        'cmdTest.Parameters.Add(New SqlParameter("@IPUser", Data.SqlDbType.VarChar))
        'cmdTest.Parameters("@IPUser").Value = User.Identity.Name

        'cmdTest.Parameters.Add(New SqlParameter("@dbID", Data.SqlDbType.SmallInt))
        'cmdTest.Parameters("@dbID").Value = Me.txtDiarioID.Text

        'cnBKTest.Open()
        'cmdTest.ExecuteNonQuery()
        'cnBKTest.Close()

    End Sub

    Private Function GerarTarefaID() As Int16

        Dim con As New SqlConnection(cnnStr)

        Dim comando As New SqlCommand("uspPlanoAcaoID", con)
        comando.CommandType = CommandType.StoredProcedure

        Try
            'Dim varID As Int16
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                GerarTarefaID = reader5.GetSqlInt16(0).ToString
            End While

            If GerarTarefaID = 0 Then
                GerarTarefaID = 1
            Else
                GerarTarefaID = GerarTarefaID + 1
            End If
            Me.ftxt_PlanoAcaoID.Text = GerarTarefaID

        Catch ex As Exception
            UserMsgBox(Me, ex.Message + " - Módulo: GerarTarefaID. Reporte a Contraladoria esse problema no 3212-2038 ou 41-9671-8959.")

        Finally
            con.Close()
        End Try
    End Function

    Sub SalvarAta_PlanoAcao()

        'Dim sConnStr As String = cnnStr
        'Dim cnBKTest As New SqlConnection(sConnStr)
        'Dim cmdTest As New SqlCommand("uspProjetoDiarioBordoSalvar_PlanoAcao", cnBKTest)

        'cmdTest.CommandType = Data.CommandType.StoredProcedure

        'cmdTest.Parameters.Add(New SqlParameter("@idDiario", Data.SqlDbType.SmallInt))
        'cmdTest.Parameters("@idDiario").Value = Me.txtDiarioID.Text
        ''Decisao
        'cmdTest.Parameters.Add(New SqlParameter("@Decisoes", Data.SqlDbType.Text))
        'cmdTest.Parameters("@Decisoes").Value = Me.txtMemoDecisoes.Text

        'cmdTest.Parameters.Add(New SqlParameter("@Decisoes1", Data.SqlDbType.Text))
        'cmdTest.Parameters("@Decisoes1").Value = Me.txtMemoDecisoes1.Text

        'cmdTest.Parameters.Add(New SqlParameter("@Decisoes2", Data.SqlDbType.Text))
        'cmdTest.Parameters("@Decisoes2").Value = Me.txtMemoDecisoes2.Text

        'cmdTest.Parameters.Add(New SqlParameter("@Decisoes3", Data.SqlDbType.Text))
        'cmdTest.Parameters("@Decisoes3").Value = Me.txtMemoDecisoes3.Text

        'cmdTest.Parameters.Add(New SqlParameter("@Decisoes4", Data.SqlDbType.Text))
        'cmdTest.Parameters("@Decisoes4").Value = Me.txtMemoDecisoes4.Text

        'cmdTest.Parameters.Add(New SqlParameter("@Decisoes5", Data.SqlDbType.Text))
        'cmdTest.Parameters("@Decisoes5").Value = Me.txtMemoDecisoes5.Text

        'cmdTest.Parameters.Add(New SqlParameter("@Decisoes6", Data.SqlDbType.Text))
        'cmdTest.Parameters("@Decisoes6").Value = Me.txtMemoDecisoes6.Text

        'cmdTest.Parameters.Add(New SqlParameter("@Decisoes7", Data.SqlDbType.Text))
        'cmdTest.Parameters("@Decisoes7").Value = Me.txtMemoDecisoes7.Text

        'cmdTest.Parameters.Add(New SqlParameter("@Decisoes8", Data.SqlDbType.Text))
        'cmdTest.Parameters("@Decisoes8").Value = Me.txtMemoDecisoes8.Text

        'cmdTest.Parameters.Add(New SqlParameter("@Decisoes9", Data.SqlDbType.Text))
        'cmdTest.Parameters("@Decisoes9").Value = Me.txtMemoDecisoes9.Text

        ''SPAs

        'cmdTest.Parameters.Add(New SqlParameter("@spa", Data.SqlDbType.SmallInt))
        'cmdTest.Parameters("@spa").Value = CInt(Me.lbl_spa.Text)

        'cmdTest.Parameters.Add(New SqlParameter("@spa1", Data.SqlDbType.SmallInt))
        'cmdTest.Parameters("@spa1").Value = CInt(Me.lbl_spa1.Text)

        'cmdTest.Parameters.Add(New SqlParameter("@spa2", Data.SqlDbType.SmallInt))
        'cmdTest.Parameters("@spa2").Value = CInt(Me.lbl_spa2.Text)

        'cmdTest.Parameters.Add(New SqlParameter("@spa3", Data.SqlDbType.SmallInt))
        'cmdTest.Parameters("@spa3").Value = CInt(Me.lbl_spa3.Text)

        'cmdTest.Parameters.Add(New SqlParameter("@spa4", Data.SqlDbType.SmallInt))
        'cmdTest.Parameters("@spa4").Value = CInt(Me.lbl_spa4.Text)

        'cmdTest.Parameters.Add(New SqlParameter("@spa5", Data.SqlDbType.SmallInt))
        'cmdTest.Parameters("@spa5").Value = CInt(Me.lbl_spa5.Text)

        'cmdTest.Parameters.Add(New SqlParameter("@spa6", Data.SqlDbType.SmallInt))
        'cmdTest.Parameters("@spa6").Value = CInt(Me.lbl_spa6.Text)

        'cmdTest.Parameters.Add(New SqlParameter("@spa7", Data.SqlDbType.SmallInt))
        'cmdTest.Parameters("@spa7").Value = CInt(Me.lbl_spa7.Text)

        'cmdTest.Parameters.Add(New SqlParameter("@spa8", Data.SqlDbType.SmallInt))
        'cmdTest.Parameters("@spa8").Value = CInt(Me.lbl_spa8.Text)

        'cmdTest.Parameters.Add(New SqlParameter("@spa9", Data.SqlDbType.SmallInt))
        'cmdTest.Parameters("@spa9").Value = CInt(Me.lbl_spa9.Text)

        'cmdTest.Parameters.Add(New SqlParameter("@IPUser", Data.SqlDbType.VarChar))
        'cmdTest.Parameters("@IPUser").Value = BuscaIP()

        'cnBKTest.Open()
        'cmdTest.ExecuteNonQuery()
        'cnBKTest.Close()

    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender

        'Call Preencher_CboSupProjeto()

    End Sub

    Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Unload
        Session("idAtaStatus") = 0
    End Sub

    Protected Sub cboProjeto_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboProjeto.SelectedIndexChanged
        If CInt(Trim((Me.cboProjeto.Text.Length))) > 0 Then
            Session("idProjeto") = Me.cboProjeto.Value
        End If
        Me.txtPlanoAcaoID.Value = RetornaNumeroPlanoAcao()
        Call TelaNova()

    End Sub

    Private Sub Salvar_SubProjeto()
        Dim sConnStr As String = cnnStr
        Dim cnBKTest As New SqlConnection(sConnStr)
        Dim cmdTest As New SqlCommand("uspSubProjeto_Salvar", cnBKTest)

        cmdTest.CommandType = Data.CommandType.StoredProcedure

        cmdTest.Parameters.Add(New SqlParameter("@ProjetoID", Data.SqlDbType.SmallInt))
        cmdTest.Parameters("@ProjetoID").Value = Me.cboProjeto.Value

        cmdTest.Parameters.Add(New SqlParameter("@SubProjetoDesc", Data.SqlDbType.Text))
        cmdTest.Parameters("@SubProjetoDesc").Value = Me.txtSubProjetoSPE.Text

        cmdTest.Parameters.Add(New SqlParameter("@UserName", Data.SqlDbType.VarChar))
        cmdTest.Parameters("@UserName").Value = User.Identity.Name

        Try
            cnBKTest.Open()
            cmdTest.ExecuteNonQuery()
            cnBKTest.Close()
        Catch ex As Exception
            UserMsgBox(Me, "Módulo: Salvar_SubProjeto - " & ex.Message)
        Finally
            cnBKTest.Close()
        End Try
        
    End Sub

    Private Sub Alterar_SubProjeto()
        Dim sConnStr As String = cnnStr
        Dim cnBKTest As New SqlConnection(sConnStr)
        Dim cmdTest As New SqlCommand("uspSubProjeto_Alterar", cnBKTest)

        cmdTest.CommandType = Data.CommandType.StoredProcedure

        cmdTest.Parameters.Add(New SqlParameter("@SubProjetoID", Data.SqlDbType.SmallInt))
        cmdTest.Parameters("@SubProjetoID").Value = Me.cboSubProjetoSPE.Value

        cmdTest.Parameters.Add(New SqlParameter("@SubProjetoDesc", Data.SqlDbType.Text))
        cmdTest.Parameters("@SubProjetoDesc").Value = Me.txtSubProjetoSPE.Text

        cmdTest.Parameters.Add(New SqlParameter("@UserName", Data.SqlDbType.VarChar))
        cmdTest.Parameters("@UserName").Value = User.Identity.Name

        Try
            cnBKTest.Open()
            cmdTest.ExecuteNonQuery()
            cnBKTest.Close()
        Catch ex As Exception
            UserMsgBox(Me, ex.Message)

        Finally
            cnBKTest.Close()

        End Try

    End Sub

    Private Sub SalvarSPE()
        If Me.optSubProjetoSPE.Checked = True Then
            If CInt(Trim(Me.txtSubProjetoSPE.Text.Length)) = 0 Then
                UserMsgBox(Me, "Você deve digitar um Sub-Projeto antes de salvar.")
                Me.txtSubProjetoSPE.Focus()
                Exit Sub
            Else
                If Me.optSubProjetoSPE.Checked = True Then
                    Call Salvar_SubProjeto()
                    UserMsgBox(Me, "O Sub-Projeto foi salvo com sucesso!!!")
                Else
                    UserMsgBox(Me, "Você deve 'marcar' a opção ao lado do Sub-Projeto")
                    Exit Sub
                End If
            End If
        End If

        If Me.optEtapaSPE.Checked = True Then
            If CInt(Trim(Me.txtEtapaSPE.Text.Length)) = 0 Then
                UserMsgBox(Me, "Você deve digitar uma Etapa antes de salvar.")
                Me.txtEtapaSPE.Focus()
                Exit Sub
            Else
                If Me.optEtapaSPE.Checked = True Then
                    Call Salvar_SubProjeto()
                    UserMsgBox(Me, "O Sub-Projeto foi salvo com sucesso!!!")
                Else
                    UserMsgBox(Me, "Você deve 'marcar' a opção ao lado do Sub-Projeto")
                    Exit Sub
                End If
            End If
        End If
    End Sub

    Protected Sub btnSalvarSPE_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSalvarSPE.Click
        If CInt(Trim(Me.txtSubProjetoSPE.Text.Length)) < 1 Then
            UserMsgBox(Me, "Você deve digitar um Sub-Projeto antes de salvar.")
            Me.txtSubProjetoSPE.Focus()
            Exit Sub
        Else
            If Me.optSubProjetoSPE.Checked = True Then
                Call Salvar_SubProjeto()
                UserMsgBox(Me, "O Sub-Projeto foi salvo com sucesso!!!")
                Me.cboSubProjetoSPE.DataBind()
                Call TelaAposSalvarCadastroSPE()
            Else
                UserMsgBox(Me, "Você deve 'marcar' a opção ao lado do Sub-Projeto")
                Exit Sub
            End If
        End If
    End Sub

    Protected Sub btnAlterarSPE_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAlterarSPE.Click

        If CInt(Trim(Me.txtSubProjetoSPE.Text.Length)) = 0 Then
            UserMsgBox(Me, "Você deve digitar um Sub-Projeto antes de salvar.")
            Me.txtSubProjetoSPE.Focus()
            Exit Sub
        Else
            If Me.optSubProjetoSPE.Checked = True Then
                Call Alterar_SubProjeto()
                Call Preencher_CboSupProjeto()
                Me.dsCboSubProjeto.DataBind()
                Me.cboSubProjetoSPE.Text = Me.txtSubProjetoSPE.Text
                UserMsgBox(Me, "O Sub-Projeto foi alterado com sucesso!!!")
            Else
                UserMsgBox(Me, "Você deve 'marcar' a opção ao lado do Sub-Projeto")
                Exit Sub
            End If
        End If

    End Sub

    Protected Sub cboSubProjetoSPE_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboSubProjetoSPE.SelectedIndexChanged
        'Me.txtSubProjetoSPE.Text = Trim(Me.cboSubProjetoSPE.Text)
        Me.lbl_SubProjetoID.Text = Me.cboSubProjetoSPE.Value
        Me.lblNomeSubProjeto.Text = Me.cboSubProjetoSPE.Text
        Me.lblNomeSubProjeto.Visible = True
        Me.lblCaptionSubProjeto.Visible = True

    End Sub

    Sub Preencher_CboSupProjeto()

        'define a string com o comando SQL e a string de conexão usando um provedor SQLClient
        Dim strSQL As String = "SELECT ProjetoSubDesc, ProjetoSubID FROM projProjetoSub WHERE ProjetoID = " & Me.cboProjeto.Value & " ORDER BY ProjetoSubDesc"

        Dim Conn As New SqlConnection(cnnStr)
        Dim objDr As SqlDataReader
        Dim Cmd As New SqlCommand(strSQL, Conn)

        Try
            Conn.Open()
            objDr = Cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection)

            Me.cboSubProjetoSPE.DataSource = objDr
            Me.cboSubProjetoSPE.DataBind()
            Conn.Close()
        Catch ex As Exception
            UserMsgBox(Me, "Módulo: Preencher_CboSupProjeto - " & ex.Message)

        Finally
            Conn.Close()
        End Try

    End Sub

    Protected Sub btnOkSPE_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnOkSPE.Click

        Me.cboSubProjetoSPE.ValueField = ""
        Me.cboSubProjetoSPE.TextField = ""
        Me.cboSubProjetoSPE.Value = ""
        Me.cboSubProjetoSPE.Text = ""

        Me.cboEtapaSPE.ValueField = ""
        Me.cboEtapaSPE.TextField = ""
        Me.cboEtapaSPE.Value = ""
        Me.cboEtapaSPE.Text = ""

        ''If CInt(Trim(Me.cboEtapaSPE.Text.Length)) < 1 Then
        'If CInt(Trim(Me.cboSubProjetoSPE.Text.Length)) < 1 Then
        '    UserMsgBox(Me, "Você deve selecionar um Sub-Projeto ou uma Etapa.")
        'Else

        '    Me.lbl_SubProjetoID.Text = Me.cboSubProjetoSPE.Value
        '    'Me.cboList.DataSourceID = "dsMemorialSub"
        '    'Me.cboList.Value = RetornaIdAta_SubProjeto()
        '    'Call BuscarAtas(RetornaIdAta_SubProjeto())
        'End If
    End Sub

    Private Function RetornaIdAta_SubProjeto() As String

        Dim con As New SqlConnection(cnnStr)
        Dim strSQL As String = "Select MAX(AtaID) FROM projAta WHERE ProjetoID = " & Me.cboProjeto.Value & " AND SubProjetoID = " & Me.cboSubProjetoSPE.Value & ""
        Dim comando As New SqlCommand(strSQL, con)
        comando.CommandType = CommandType.Text

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                RetornaIdAta_SubProjeto = reader5.GetSqlInt16(0).ToString
            End While

        Catch ex As Exception
            Beep()
            UserMsgBox(Me, ex.Message)

        Finally
            con.Close()
        End Try
    End Function

    Protected Sub btnSalvarPA_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSalvarPA.Click

        If CStr(Me.cboStatusTarefa.Text.Length) < 1 Then
            UserMsgBox(Me, "Você deve selecionar um 'Status' para poder salvar o Plano de Ação.")
            Exit Sub
        End If
        If CInt(Trim(Me.ftxt_Oque.Text.Length)) < 1 Then
            UserMsgBox(Me, "Você deve preencher o campo 'O que' para poder salvar o Plano de Ação.")
            Me.ftxt_Oque.Focus()
            Exit Sub
        End If
        If CInt(Trim(Me.ftxt_Quem.Text.Length)) < 1 Then
            UserMsgBox(Me, "Você deve preencher o campo 'Quem' para poder salvar o Plano de Ação.")
            Me.ftxt_Quem.Focus()
            Exit Sub
        End If

        If CInt(Trim(Me.txtPA.Text.Length)) < 1 Then Me.txtPA.Text = 1
        If Me.txtPA.Text = 1 Then 'Salvar Normal
            Call SalvarPlanoDeAcao()
            Call SalvarProjetoDefine()
        Else    '2 - Alterar
            Call AlterarPlanoDeAcao()
            Call BuscarPlanoAcao()
        End If
        Call FecharControlesPA()
        Me.txtvarStatus.Value = 1

    End Sub

    Sub SalvarPlanoDeAcao()

        Dim sConnStr As String = cnnStr
        Using conn As New SqlConnection(sConnStr)
            Using cmdTest As New SqlCommand("uspPlanoDeAcao_Salvar", conn)
                cmdTest.CommandType = Data.CommandType.StoredProcedure
                With cmdTest.Parameters
                    .AddWithValue("@PlanoAcaoID", GerarTarefaID())
                    .AddWithValue("@Oque", Me.ftxt_Oque.Text)
                    .AddWithValue("@Quem", Me.ftxt_Quem.Text)
                    .AddWithValue("@Porque", Me.ftxt_Porque.Text)
                    .AddWithValue("@Quando", Me.ftxt_Quando.Text)
                    .AddWithValue("@Onde", Me.ftxt_Onde.Text)
                    .AddWithValue("@Como", Me.ftxt_Como.Text)
                    .AddWithValue("@Quanto", Me.ftxt_Quanto.Text)
                    .AddWithValue("@DataConclusao", Me.ftxt_Conclusao.Text)
                    .AddWithValue("@UserName", LCase(User.Identity.Name))
                    .AddWithValue("@StatusTarefa", Me.cboStatusTarefa.Text)
                    .AddWithValue("@ProjetoID", Me.cboProjeto.Value)
                    .AddWithValue("@AtaID", CInt(Replace(Left(Me.cboList.Value, 3), ";", "")))
                    If Me.lbl_SubProjetoID.Text = 0 Then
                        .AddWithValue("@SubProjetoID", 1)
                    Else
                        .AddWithValue("@SubProjetoID", Me.lbl_SubProjetoID.Text)
                    End If
                    If Me.lbl_EtapaID.Text = 0 Then
                        .AddWithValue("@EtapaID", 1)
                    Else
                        .AddWithValue("@EtapaID", Me.lbl_EtapaID.Text)
                    End If

                    Try
                        conn.Open()
                        cmdTest.ExecuteNonQuery()
                        conn.Close()
                    Catch ex As Exception
                        UserMsgBox(Me, "Classe: Salvar - " & ex.Message)
                        UserMsgBox(Me, "O Plano de Ação não foi salvo.")
                    Finally
                        conn.Close()
                    End Try
                End With
            End Using
        End Using

    End Sub

    Sub AlterarPlanoDeAcao()

        Dim sConnStr As String = cnnStr
        Using conn As New SqlConnection(sConnStr)
            Using cmdTest As New SqlCommand("uspPlanoDeAcao_Atualizar", conn)
                cmdTest.CommandType = Data.CommandType.StoredProcedure
                With cmdTest.Parameters
                    If Me.txtvarStatus.Value = 2 Then
                        .AddWithValue("@PlanoAcaoID", Me.txtPlanoAcaoID.Text)
                    Else
                        .AddWithValue("@PlanoAcaoID", Me.ftxt_PlanoAcaoID.Text)
                    End If
                    .AddWithValue("@Oque", Me.ftxt_Oque.Text)
                    .AddWithValue("@Quem", Me.ftxt_Quem.Text)
                    .AddWithValue("@Porque", Me.ftxt_Porque.Text)
                    .AddWithValue("@Quando", Me.ftxt_Quando.Text)
                    .AddWithValue("@Onde", Me.ftxt_Onde.Text)
                    .AddWithValue("@Como", Me.ftxt_Como.Text)
                    .AddWithValue("@Quanto", Me.ftxt_Quanto.Text)
                    .AddWithValue("@DataConclusao", Me.ftxt_Conclusao.Text)
                    .AddWithValue("@UserName", LCase(User.Identity.Name))
                    .AddWithValue("@StatusTarefa", Me.cboStatusTarefa.Text)
                End With
                Try
                    conn.Open()
                    cmdTest.ExecuteNonQuery()
                    conn.Close()
                    If Me.txtvarStatus.Text <> 2 Then Me.btnSalvarPA.Enabled = False
                    UserMsgBox(Me, "O Plano de Ação foi alterado com sucesso!!!")
                Catch ex As Exception
                    UserMsgBox(Me, "Classe: AlterarPlanoDeAcao - " & ex.Message)
                    UserMsgBox(Me, "O Plano de Ação não foi alterado.")
                Finally
                    conn.Close()
                End Try
            End Using
        End Using

    End Sub

    Sub SalvarProjetoDefine()

        Dim sConnStr As String = cnnStr
        Using conn As New SqlConnection(sConnStr)
            Using cmdTest As New SqlCommand("uspProjProjetoDefine_Salvar", conn)
                cmdTest.CommandType = Data.CommandType.StoredProcedure
                With cmdTest.Parameters
                    .AddWithValue("@ProjetoID", Me.cboProjeto.Value)
                    .AddWithValue("@PlanoAcaoID", Me.ftxt_PlanoAcaoID.Value)
                    .AddWithValue("@AtaID", CInt(Replace(Left(Me.cboList.Value, 3), ";", "")))
                    .AddWithValue("@UserName", User.Identity.Name)
                    If CInt(Me.lbl_SubProjetoID.Text) < 1 Then
                        .AddWithValue("@ProjetoSubID", 1)
                    Else
                        .AddWithValue("@ProjetoSubID", Me.lbl_SubProjetoID.Text)
                    End If
                    If CInt(Me.lbl_EtapaID.Text) < 1 Then
                        .AddWithValue("@EtapaID", 1)
                    Else
                        .AddWithValue("@EtapaID", Me.lbl_EtapaID.Text)
                    End If
                End With

                Try
                    conn.Open()
                    cmdTest.ExecuteNonQuery()
                    conn.Close()
                    UserMsgBox(Me, "O Plano de Ação foi salvo com sucesso!!!")
                    Me.txtvarPlanoAcao.Text = 2    'Plano Preenchido
                    Me.txtPA.Text = 1 'Salvar Normal
                    Call FecharControlesPA()
                Catch ex As Exception
                    UserMsgBox(Me, ex.Message + " - Classe: 'SalvarProjetoDefine'. Reporte a Contraladoria esse problema no 3212-2038 ou 41-9671-8959.")
                Finally
                    conn.Close()
                End Try
                
            End Using
        End Using
    End Sub

    Private Sub FecharControlesPA()
        Me.ftxt_Como.ReadOnly = True
        Me.ftxt_Conclusao.ReadOnly = True
        Me.ftxt_Onde.ReadOnly = True
        Me.ftxt_Oque.ReadOnly = True
        Me.ftxt_PlanoAcaoID.ReadOnly = True
        Me.ftxt_Porque.ReadOnly = True
        Me.ftxt_Quando.ReadOnly = True
        Me.ftxt_Quanto.ReadOnly = True
        Me.ftxt_Quem.ReadOnly = True
        Me.cboStatusTarefa.ReadOnly = True
        Me.btnSalvarPA.Enabled = False
        Me.btnExcluirPA.Enabled = True
        Me.btnAlterarPA.Enabled = True
        Me.btnFechar.Enabled = True
        Me.btnCancelarPA.Enabled = False
    End Sub

    Private Sub AbrirControlesPA()
        Me.ftxt_Como.ReadOnly = False
        Me.ftxt_Conclusao.ReadOnly = False
        Me.ftxt_Onde.ReadOnly = False
        Me.ftxt_Oque.ReadOnly = False
        Me.ftxt_PlanoAcaoID.ReadOnly = False
        Me.ftxt_Porque.ReadOnly = False
        Me.ftxt_Quando.ReadOnly = False
        Me.ftxt_Quanto.ReadOnly = False
        Me.ftxt_Quem.ReadOnly = False
        Me.btnSalvarPA.Enabled = True
        Me.btnCancelarPA.Enabled = True
        Me.btnExcluirPA.Enabled = False
        Me.btnAlterarPA.Enabled = False
        Me.btnFechar.Enabled = False

    End Sub

    Protected Sub popPlanoAcao_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles popPlanoAcao.PreRender
        If Me.txtvarStatus.Value = 2 Then   'Chamada pelo GridView
            Me.ftxt_Oque.Text = Me.txtOque.Text
            Me.ftxt_Quem.Text = Me.txtQuem.Text
            Me.ftxt_Porque.Text = Me.txtPorque.Text
            Me.ftxt_Quando.Text = Me.txtQuando.Text
            Me.ftxt_Quanto.Text = Me.txtQuanto.Text
            Me.ftxt_Conclusao.Text = Me.txtConclusao.Text
            Me.ftxt_Onde.Text = Me.txtOnde.Text
            Me.ftxt_Como.Text = Me.txtComo.Text
            Me.cboStatusTarefa.Text = Me.txtStatus.Text
        Else
            If CInt(Trim(Me.txtvarPlanoAcao.Text.Length)) < 1 Then Me.txtvarPlanoAcao.Text = 1
            If Me.txtvarPlanoAcao.Text = 1 Then
                Call LimparTela_PlanoAcao()
            End If
            Me.ftxt_Quando.Date = Now()
            Me.cboStatusTarefa.Text = "Em Andamento"
        End If
    End Sub

    Private Sub LimparTela_PlanoAcao()
        Me.ftxt_Como.Text = ""
        Me.ftxt_Conclusao.Text = ""
        Me.ftxt_Onde.Text = ""
        Me.ftxt_Oque.Text = ""
        Me.ftxt_PlanoAcaoID.Text = ""
        Me.ftxt_Porque.Text = ""
        Me.ftxt_Quando.Text = ""
        Me.ftxt_Quanto.Text = ""
        Me.ftxt_Quem.Text = ""
    End Sub

    Protected Sub btnAlterarPA_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAlterarPA.Click
        Me.txtPA.Text = 2   'Alterar
        Me.txtvarPlanoAcao.Text = 2
        Call AbrirControlesPA()
    End Sub

    Protected Sub btnAbrirPA_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAbrirPA.Click
        Me.txtvarPlanoAcao.Text = 1
        Me.txtPA.Text = 1
        Call AbrirControlesPA()
    End Sub

    Protected Sub popPlanoAcao_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles popPlanoAcao.Unload
        Me.txtvarPlanoAcao.Text = 1
        Me.txtvarStatus.Value = 1
        Me.txtPA.Text = 1
    End Sub

    Private Sub PreencherListaAta()

        Dim strSQL As String = "SELECT AtaID, CONVERT (char, ataDia, 103) AS ataDia, CONVERT (char, ataHora, 108) AS ataHora, ataObjetivos  FROM projAta WHERE (ProjetoID = " & Me.cboProjeto.Value & ") ORDER BY CAST(ataDia AS datetime) DESC"

        Dim Conn As New SqlConnection(cnnStr)
        Dim objDr As SqlDataReader
        Dim Cmd As New SqlCommand(strSQL, Conn)

        Try
            Conn.Open()
            objDr = Cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection)

            Me.cboList.DataSource = objDr
            Me.cboList.DataBind()
  
            Conn.Close()
        Catch ex As Exception
            Select Case Err.Number
                Case 0
                Case 5
                    If CInt(Trim(Me.cboList.Text.Length)) < 1 Then
                        Session("idProjeto") = 1
                        Me.cboProjeto.Text = Session("idProjeto")
                    End If
                Case Else
                    UserMsgBox(Me, "Módulo: PreencherListaAta - " & Err.Number & "-" & Err.Description)
            End Select
        Finally
            Conn.Close()
        End Try

    End Sub

    Protected Sub cboList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboList.SelectedIndexChanged
        Call BuscarAtas(CInt(Replace(Left(Me.cboList.Value, 3), ";", "")))
        If Not LCase(Trim(User.Identity.Name)) = "vladimir" Then
            Me.btnAlterar.Enabled = True
            Me.btnNovo.Enabled = True
            Me.btnExcluir.Enabled = True
            Me.btnAbrirPA.Enabled = True
            Me.txtDia.Enabled = False
            If LCase(User.Identity.Name) = "eliseu" Then Me.btnExcluir.Enabled = True

            If Me.lbl_SubProjetoID.Text = 0 Then
                Call OcultarLegenda_SubProjeto()
            Else
                Call ExibirLegenda_SubProjeto()
                Me.lblNomeSubProjeto.Text = RetornaNomeSubProjeto()
            End If

            If Me.lbl_EtapaID.Text = 0 Then
                Call OcultarLegenda_Etapa()
            Else
                Call ExibirLegenda_Etapa()
                Me.lblNomeEtapa.Text = RetornaNomeEtapa()
            End If
        End If

        Call SomenteLeitura()
    End Sub

    Private Function RetornaNomeSubProjeto() As String
        Dim con As New SqlConnection(cnnStr)
        Dim strSQL As String = "SELECT ProjetoSubDesc FROM projProjetoSub WHERE ProjetoSubID = " & CInt(Me.lbl_SubProjetoID.Text) & ""
        Dim comando As New SqlCommand(strSQL, con)
        comando.CommandType = CommandType.Text

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                RetornaNomeSubProjeto = reader5.GetSqlString(0).ToString
            End While

        Catch ex As Exception
            Beep()
            UserMsgBox(Me, "Classe: RetornaNomeSubProjeto - " & ex.Message)
        Finally
            con.Close()
        End Try
    End Function

    Private Function RetornaNumeroPlanoAcao() As Int16
        Dim con As New SqlConnection(cnnStr)
        Dim strSQL As String = "SELECT ISNULL(MIN(PlanoAcaoID),0) AS PlanoAcaoID FROM projPlanoAcao WHERE ProjetoID = " & Me.cboProjeto.Value & " AND PlanoAcaoID > 0"
        Dim comando As New SqlCommand(strSQL, con)
        comando.CommandType = CommandType.Text

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                RetornaNumeroPlanoAcao = reader5.GetSqlInt16(0).ToString
            End While

        Catch ex As Exception
            Beep()
            UserMsgBox(Me, "Classe: RetornaNumeroPlanoAcao - " & ex.Message)
        Finally
            con.Close()
        End Try
    End Function

    Private Function RetornaNomeEtapa() As String
        Dim con As New SqlConnection(cnnStr)
        Dim strSQL As String = "SELECT etapaDesc FROM projEtapas WHERE EtapaID = " & CInt(Me.lbl_EtapaID.Text) & ""
        Dim comando As New SqlCommand(strSQL, con)
        comando.CommandType = CommandType.Text

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                RetornaNomeEtapa = reader5.GetSqlString(0).ToString
            End While

        Catch ex As Exception
            Beep()
            UserMsgBox(Me, "Classe: RetornaNomeEtapa - " & ex.Message)
        Finally
            con.Close()
        End Try
    End Function

    Protected Sub btnExcluir_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExcluir.Click

        If BuscaIP() <> "10.1.1.218" Then
            Beep()
            UserMsgBox(Me, "Você só pode excluir uma Ata na sala de reunião.")
            Exit Sub
        End If

        Dim strSQL As String = "DELETE FROM projAta WHERE AtaID = " & CInt(Replace(Left(Me.cboList.Value, 3), ";", "")) & ""

        Dim Conn As New SqlConnection(cnnStr)
        Dim objDr As SqlDataReader
        Dim Cmd As New SqlCommand(strSQL, Conn)

        Try
            Conn.Open()
            objDr = Cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            Conn.Close()
            UserMsgBox(Me, "A Ata foi excluida com sucesso!!!")
            Call TelaNova()
        Catch ex As Exception
            Select Case Err.Number
                Case 0
                Case 5
                    UserMsgBox(Me, "Há Planos de Ações vinculados a esta Ata. Para poder excluir essa Ata você deve primeiro excluir os planos de ações.")
                Case Else
                    UserMsgBox(Me, "Módulo:  btnExcluir_Click - " & Err.Number & "-" & Err.Description)
            End Select

        Finally
            Conn.Close()
        End Try

    End Sub

    Function BuscaIP() As String
        Dim IPUsuario As String
        IPUsuario = System.Web.HttpContext.Current.Request.ServerVariables("HTTP X FORWARDED FOR")

        If IPUsuario = "" Then
            IPUsuario = System.Web.HttpContext.Current.Request.ServerVariables("REMOTE_ADDR")
        End If
        Return IPUsuario
    End Function

    Protected Sub btnAlterar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAlterar.Click
        If BuscaIP() <> "10.1.1.218" Then
            Beep()
            UserMsgBox(Me, "Você só pode alterar uma Ata na sala de reunião.")
            Exit Sub
        End If

        Me.cboList.Enabled = False
        Me.btnAlterar.Enabled = False
        Me.btnNovo.Enabled = False
        Me.btnExcluir.Enabled = False
        Me.btnCancelar.Enabled = True
        Me.btnSalvar.Enabled = True
        Call HabilitarControles()
    End Sub

    Private Sub DesativarBotoes_PanelCadastroSPE()
        Me.btnAlterarSPE.Enabled = False
        Me.btnCancelarSPE.Enabled = False
        Me.btnSalvarSPE.Enabled = False
        Me.btnExcluirPA.Enabled = False
        Me.txtEtapaSPE.Enabled = False
        Me.txtSubProjetoSPE.Enabled = False
        Me.optEtapaSPE.Enabled = False
        Me.optSubProjetoSPE.Enabled = False
    End Sub

    Protected Sub btnNovoSPE_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNovoSPE.Click
        Me.txtEtapaSPE.Enabled = True
        Me.txtSubProjetoSPE.Enabled = True
        Me.optEtapaSPE.Enabled = True
        Me.optSubProjetoSPE.Enabled = True
        Me.btnCancelarSPE.Enabled = True
        Me.btnSalvarSPE.Enabled = True
        Me.btnNovoSPE.Enabled = False
        Me.btnExcluirPA.Enabled = False
        Me.txtSubProjetoSPE.Focus()
    End Sub

    Private Sub TelaAposSalvarCadastroSPE()
        Me.btnNovoSPE.Enabled = True
        Me.btnAlterarSPE.Enabled = True
        Me.btnExcluirPA.Enabled = True
        Me.btnCancelarSPE.Enabled = False
        Me.btnSalvarSPE.Enabled = False
    End Sub

    Protected Sub cboEtapaSPE_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboEtapaSPE.SelectedIndexChanged
        Me.lbl_EtapaID.Text = Me.cboEtapaSPE.Value
        Me.lblNomeEtapa.Text = Me.cboEtapaSPE.Text
        Me.lblCaptionEtapa.Visible = True
        Me.lblNomeEtapa.Visible = True
    End Sub

    Protected Sub btnIncluir_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnIncluir.Click
        Me.cboSubProjetoSPE.ValueField = "ProjetoSubID"
        Me.cboSubProjetoSPE.TextField = "ProjetoSubDesc"
        Me.cboEtapaSPE.ValueField = "EtapaID"
        Me.cboEtapaSPE.TextField = "etapaDesc"
    End Sub

    Protected Sub btnAlterarPAGrid_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAlterarPAGrid.Click
     
        Me.txtvarStatus.Value = 2   'Alterar pelo GridView
        Me.txtPA.Text = 2
        Call BuscarPlanoAcao()
        Call FecharControlesPA()

    End Sub

    Sub BuscarPlanoAcao()

        If Me.txtPlanoAcaoID.Value = 0 Then
            Me.txtOque.Text = ""
            Me.txtQuem.Text = ""
            Me.txtPorque.Text = ""
            Me.txtQuanto.Text = ""
            Me.txtOnde.Text = ""
            Me.txtStatus.Text = ""
            Me.txtQuando.Text = ""
            Me.txtConclusao.Text = ""
            Me.txtComo.Text = ""
            Me.txtProjetoID.Text = ""
            Me.txtSubProjetoID.Text = ""
            Me.txtEtapaID.Text = ""
        Else

            Dim con As New SqlConnection(cnnStr)
            Dim strSQL As String = "SELECT Oque, Quem, Porque, Quanto, Onde, StatusTarefa, Quando, DataConclusao, Como, ProjetoID, SubProjetoID, EtapaID FROM projPlanoAcao WHERE PlanoAcaoID = " & Me.txtPlanoAcaoID.Value & ""
            Dim comando As New SqlCommand(strSQL, con)
            comando.CommandType = CommandType.Text

            Try
                con.Open()
                Dim reader5 As SqlDataReader
                reader5 = comando.ExecuteReader()
                While reader5.Read
                    Me.txtOque.Text = reader5.GetSqlString(0)
                    Me.txtQuem.Text = reader5.GetSqlString(1)
                    Me.txtPorque.Text = reader5.GetSqlString(2)
                    Me.txtQuanto.Text = reader5.GetSqlString(3)
                    Me.txtOnde.Text = reader5.GetSqlString(4)
                    Me.txtStatus.Text = reader5.GetSqlString(5)
                    Me.txtQuando.Text = reader5.GetSqlString(6)
                    Me.txtConclusao.Text = reader5.GetSqlString(7)
                    Me.txtComo.Text = reader5.GetSqlString(8)
                    Me.txtProjetoID.Text = reader5.GetSqlInt16(9).ToString
                    Me.txtSubProjetoID.Text = reader5.GetSqlInt16(10).ToString
                    Me.txtEtapaID.Text = reader5.GetSqlInt16(11).ToString
                End While

            Catch ex As Exception
                UserMsgBox(Me, "Classe: BuscarPlanoAcao - " & ex.Message)

            Finally
                con.Close()
            End Try
        End If
    End Sub

    Protected Sub gridViewPlanoAcao_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles gridViewPlanoAcao.DataBound
        Me.gridViewPlanoAcao.FocusedRowIndex = Me.gridViewPlanoAcao.FindVisibleIndexByKeyValue(RetornaNumeroPlanoAcao())
    End Sub

    Protected Sub btnExcluirPA_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExcluirPA.Click
        Call ExcluirProjetoDefine()
        Call ExcluirPlanoDeAcao()
        Me.txtPlanoAcaoID.Value = 0
        Call BuscarPlanoAcao()
        Call FecharControlesPA()
        Me.btnAlterarPA.Enabled = False
        Me.btnSalvarPA.Enabled = False
        Me.btnExcluirPA.Enabled = False
        UserMsgBox(Me, "O Plano de Ação foi excluido com sucesso!!!")
    End Sub

    Private Sub ExcluirPlanoDeAcao()
        Dim strSQL As String = "DELETE FROM projPlanoAcao WHERE PlanoAcaoID = " & Me.txtPlanoAcaoID.Value & ""

        Dim Conn As New SqlConnection(cnnStr)
        Dim objDr As SqlDataReader
        Dim Cmd As New SqlCommand(strSQL, Conn)

        Try
            Conn.Open()
            objDr = Cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            Conn.Close()
        Catch ex As Exception
            UserMsgBox(Me, "Módulo:  btnExcluirPA_Click - " & ex.Message)
        Finally
            Conn.Close()
        End Try
    End Sub

    Private Sub ExcluirProjetoDefine()
        Dim strSQL As String = "DELETE FROM projProjetoDefine WHERE ProjetoID=" & Me.txtProjetoID.Text & " AND ProjetoSubID=" & Me.txtSubProjetoID.Text & " AND EtapaID=" & Me.txtEtapaID.Text & " AND PlanoAcaoID = " & Me.txtPlanoAcaoID.Value & ""

        Dim Conn As New SqlConnection(cnnStr)
        Dim objDr As SqlDataReader
        Dim Cmd As New SqlCommand(strSQL, Conn)

        Try
            Conn.Open()
            objDr = Cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            Conn.Close()
        Catch ex As Exception
            UserMsgBox(Me, "Módulo:  btnExcluirPA_Click - " & ex.Message)
        Finally
            Conn.Close()
        End Try
    End Sub

    Protected Sub btnCancelarPA_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelarPA.Click
        If Me.txtvarPlanoAcao.Text = 1 Then
            Me.txtPlanoAcaoID.Value = 0
            Call BuscarPlanoAcao()
            Me.btnAlterarPA.Enabled = False
            Me.btnSalvarPA.Enabled = True
            Me.btnExcluir.Enabled = False
            Me.btnFechar.Enabled = True
            Me.btnCancelarPA.Enabled = True
        Else
            Call BuscarPlanoAcao()
            Call FecharControlesPA()
        End If
        
    End Sub

   
End Class
