Imports System.Data
Imports System.Data.SqlClient

Partial Class Ranking_planej01_Ficha
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes
    Dim oProjeto As New Projeto

    Protected Sub btnNovo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNovo.Click
        Call LimparControles()
        Call Desativa_SomenteLeitura()

        cboProjeto.StatusProjeto_Or_Subprojeto()
        Select Case cboProjeto.varTipo
            Case 1
                cboProjeto.Enabled_cboProjeto = False
            Case 2
                cboProjeto.Enabled_cboProjeto = False
                cboProjeto.Enabled_cboSubProjeto = False
            Case 3
                cboProjeto.Enabled_cboProjeto = False
                cboProjeto.Enabled_cboSubProjeto = False
                cboProjeto.Enabled_cboTarefas = False
        End Select



        Me.btnNovo.Enabled = False
        Me.btnAlterar.Enabled = False
        Me.btnExcluir.Enabled = False
        Me.btnCancelar.Enabled = True
        Me.btnSalvar.Enabled = True
        Session("varSalvarAlterar") = 1
    End Sub

    Sub LimparControles()
        Me.txtSubProjeto.Text = ""
        Me.txtObjetivoProjeto.Text = ""
        Me.txtDataInicio.Text = ""
        Me.txtDataTermino.Text = ""
        Me.cboCoordenador.Value = ""
        Me.txtFacilitador.Text = ""
        Me.txtParticipantes.Text = ""
        Me.cboPeriodicidade.Value = ""
    End Sub

    Sub Salvar()

        If Me.txtSubProjeto.Text = Nothing Then
            oVem.UserMsgBox(Me, "Você deve preencher o 'Nome do Sub-Projeto'!!!")
            Me.txtSubProjeto.Focus()
            Exit Sub
        End If

        If Me.txtObjetivoProjeto.Text = Nothing Then
            oVem.UserMsgBox(Me, "Você deve preencher o 'Objetivo do Sub-Projeto'!!!")
            Me.txtObjetivoProjeto.Focus()
            Exit Sub
        End If

        If Me.txtDataInicio.Text = Nothing Then
            oVem.UserMsgBox(Me, "Você deve preencher o 'Data de Inicio'!!!")
            Me.txtDataInicio.Focus()
            Exit Sub
        End If

        If Me.txtDataTermino.Text = Nothing Then
            oVem.UserMsgBox(Me, "Você deve preencher o 'Data de Término'!!!")
            Me.txtDataTermino.Focus()
            Exit Sub
        End If

        If Me.txtParticipantes.Text = Nothing Then
            oVem.UserMsgBox(Me, "Você deve preencher os 'Participantes'!!!")
            Me.txtParticipantes.Focus()
            Exit Sub
        End If

        If Me.cboCoordenador.Text = Nothing Then
            oVem.UserMsgBox(Me, "Você deve selecionar um 'Coordenador'!!!")
            Me.cboCoordenador.Focus()
            Exit Sub
        End If

        If Me.cboPeriodicidade.Text = Nothing Then
            oVem.UserMsgBox(Me, "Você deve selecionar uma 'Periodicidade'!!!")
            Me.cboPeriodicidade.Focus()
            Exit Sub
        End If




        Dim cnBKTest As New SqlConnection()
        cnBKTest = Conexao.gerProjetos
        Dim cmdTest As New SqlCommand("uspProjetoSalvar", cnBKTest)

        cmdTest.CommandType = Data.CommandType.StoredProcedure

        If Session("varSalvarAlterar") = 1 Then    'Novo Registro
            cmdTest.Parameters.Add(New SqlParameter("@idSubProjeto", Data.SqlDbType.SmallInt))
            cmdTest.Parameters("@idSubProjeto").Value = 0
        End If

        If Session("varSalvarAlterar") = 2 Then    'Alterar Registro
            cmdTest.Parameters.Add(New SqlParameter("@idSubProjeto", Data.SqlDbType.SmallInt))
            cmdTest.Parameters("@idSubProjeto").Value = Me.cboProjeto.Value_cboSubProjeto
        End If

        cmdTest.Parameters.Add(New SqlParameter("@SubProjetoDesc", Data.SqlDbType.VarChar))
        cmdTest.Parameters("@SubProjetoDesc").Value = Me.txtSubProjeto.Text

        cmdTest.Parameters.Add(New SqlParameter("@idProjeto", Data.SqlDbType.SmallInt))
        cmdTest.Parameters("@idProjeto").Value = Me.cboProjeto.Value_cboProjeto

        cmdTest.Parameters.Add(New SqlParameter("@Coordenador", Data.SqlDbType.SmallInt))
        cmdTest.Parameters("@Coordenador").Value = Me.cboCoordenador.Value

        cmdTest.Parameters.Add(New SqlParameter("@Objetivos", Data.SqlDbType.VarChar))
        cmdTest.Parameters("@Objetivos").Value = Me.txtObjetivoProjeto.Text

        cmdTest.Parameters.Add(New SqlParameter("@DataInicial", Data.SqlDbType.SmallDateTime))
        cmdTest.Parameters("@DataInicial").Value = Me.txtDataInicio.Date

        cmdTest.Parameters.Add(New SqlParameter("@DataFinal", Data.SqlDbType.SmallDateTime))
        cmdTest.Parameters("@DataFinal").Value = Me.txtDataTermino.Date

        cmdTest.Parameters.Add(New SqlParameter("@Facilitador", Data.SqlDbType.VarChar))
        cmdTest.Parameters("@Facilitador").Value = Me.txtFacilitador.Text

        cmdTest.Parameters.Add(New SqlParameter("@Participantes", Data.SqlDbType.VarChar))
        cmdTest.Parameters("@Participantes").Value = Me.txtParticipantes.Text

        cmdTest.Parameters.Add(New SqlParameter("@Periodicidade", Data.SqlDbType.TinyInt))
        cmdTest.Parameters("@Periodicidade").Value = Me.cboPeriodicidade.Value

        cmdTest.Parameters.Add(New SqlParameter("@IPUser", Data.SqlDbType.VarChar))
        cmdTest.Parameters("@IPUser").Value = BuscaIP()

        cnBKTest.Open()
        cmdTest.ExecuteNonQuery()
        cnBKTest.Close()

        oVem.UserMsgBox(Me, "A ficha do projeto foi salvo com sucesso!!!")

        Call ControlesIniciais()
        Call Ativa_SomenteLeitura()

        Me.cboProjeto.Text_cboSubProjeto = Me.txtSubProjeto.Text

    End Sub

    Function BuscaIP() As String
        Dim IPUsuario As String
        IPUsuario = System.Web.HttpContext.Current.Request.ServerVariables("HTTP X FORWARDED FOR")

        If IPUsuario = "" Then
            IPUsuario = System.Web.HttpContext.Current.Request.ServerVariables("REMOTE_ADDR")
        End If
        Return IPUsuario
    End Function

    Protected Sub btnSalvar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSalvar.Click

        Call Salvar()


    End Sub

    Sub BuscarProjetos()

        Dim con As New SqlConnection()
        con = Conexao.gerProjetos
        Dim strSQL As String = "SELECT ProjetoID, CoordenadorID, ProjetoObjetivo, CAST(ProjetoDataInicio AS DATETIME), CAST(ProjetoDataFinal AS DATETIME), ProjetoFacilitador, ProjetoParticipantes, PeriodicidadeID FROM projFicha WHERE SubProjetoID = " & Session("idProjeto") & ""
        Dim comando As New SqlCommand(strSQL, con)
        comando.CommandType = CommandType.Text

        Try

            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                Me.txtObjetivoProjeto.Text = reader5.GetSqlString(2).ToString
                Me.txtDataInicio.Date = reader5.GetSqlDateTime(3).ToString
                Me.txtDataTermino.Date = reader5.GetSqlDateTime(4).ToString
                Me.cboCoordenador.Value = reader5.GetSqlInt16(1).ToString
                Me.txtFacilitador.Text = reader5.GetSqlString(5).ToString
                Me.txtParticipantes.Text = reader5.GetSqlString(6).ToString
                Me.cboPeriodicidade.Value = reader5.GetSqlValue(7).ToString
            End While

        Catch ex As Exception
            Beep()
            oVem.UserMsgBox(Me, ex.Message)

        Finally
            con.Close()
        End Try
    End Sub

    Sub BuscarTipoUsuario()

        Dim con As New SqlConnection()
        con = Conexao.gerProjetos
        Dim cmdTest As New SqlCommand("uspBuscarTipoUsuario", con)
        cmdTest.CommandType = Data.CommandType.StoredProcedure

        cmdTest.Parameters.Add(New SqlParameter("@userName", Data.SqlDbType.VarChar))
        cmdTest.Parameters("@userName").Value = User.Identity.Name

        cmdTest.Parameters.Add(New SqlParameter("@idProjeto", Data.SqlDbType.TinyInt))
        cmdTest.Parameters("@idProjeto").Value = Me.cboProjeto.Value_cboProjeto

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = cmdTest.ExecuteReader()
            While reader5.Read

                If reader5.GetSqlByte(0) = 1 Then
                    Call HabilitarBotoes()
                Else
                    Call DesabilitarBotoes()
                End If

            End While

        Catch ex As Exception
            Beep()
            oVem.UserMsgBox(Me, ex.Message)

        Finally
            con.Close()
        End Try
    End Sub

    Protected Sub btnExcluir_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExcluir.Click

        Dim cnBKTest As New SqlConnection()
        Try
            cnBKTest = Conexao.gerProjetos
            Dim cmdTest As New SqlCommand("DELETE FROM projFicha WHERE SubProjetoID = " & Me.cboProjeto.Value_cboSubProjeto & "", cnBKTest)

            cnBKTest.Open()
            cmdTest.ExecuteNonQuery()
            cnBKTest.Close()

            oVem.UserMsgBox(Me, "A ficha do projeto foi excluida com sucesso!!!")

            Call ControlesIniciais()
            Call BuscarProjetos()
            Session("idProjeto") = Me.cboProjeto.Value_cboProjeto
            Me.txtSubProjeto.Text = Me.cboProjeto.Text_cboSubProjeto
            Me.cboProjeto.Enabled_cboProjeto = True
            Me.cboProjeto.Enabled_cboSubProjeto = True

            Call Ativa_SomenteLeitura()
        Catch ex As Exception
            Select Case Err.Number
                Case 5
                    oVem.UserMsgBox(Me, "Você não pode excluir esse Sub-Projeto! Há Atas vinculados a ele. Para excluir esse Sub-Projeto exclua as Atas primeiro. O Sub-Projeto não foi excluido.")
                Case Else
                    oVem.UserMsgBox(Me, Err.Number & " - " & Err.Description)
            End Select
        Finally
            cnBKTest.Close()
        End Try

    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

   

    End Sub

    Sub DesabilitarBotoes()
        Me.btnAlterar.Enabled = False
        Me.btnCancelar.Enabled = False
        Me.btnExcluir.Enabled = False
        Me.btnNovo.Enabled = False
        Me.btnSalvar.Enabled = False
        'Me.cboProjeto.Enabled = False
        Me.cboCoordenador.Enabled = False
    End Sub

    Sub DesabilitarBotoes_SomenteConsulta()
        Me.btnAlterar.Enabled = False
        Me.btnCancelar.Enabled = False
        Me.btnExcluir.Enabled = False
        Me.btnNovo.Enabled = False
        Me.btnSalvar.Enabled = False
        'Me.cboProjeto.Enabled = True
        Me.cboCoordenador.Enabled = False
    End Sub

    Sub HabilitarBotoes()
        Me.btnAlterar.Enabled = True
        Me.btnExcluir.Enabled = True
        Me.cboCoordenador.Enabled = True
    End Sub

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            oVem.AtualizarEstatisticaPrograma(23, User.Identity.Name)
            Me.divDados.Visible = True

            cboProjeto.StatusProjeto_Or_Subprojeto()
            lblNome.Text = cboProjeto.DescricaoDoProjeto

            'Me.cboProjeto.Text = Session("idProjeto")


            'Call DesabilitarBotoes()

            Select Case oProjeto.CoordenadorProjeto(User.Identity.Name)
                Case 1
                    Call HabilitarBotoes()
                Case 2
                    Call DesabilitarBotoes()
                Case 3
                    Call DesabilitarBotoes_SomenteConsulta()
            End Select

            Me.cboProjeto.Value_cboProjeto = oProjeto.NumeroDoProjeto(User.Identity.Name)

            Select Case oProjeto.CoordenadorProjeto(User.Identity.Name)
                Case 1  'Tem acesso a todos projetos
                    Me.cboProjeto.Enabled_cboProjeto = True
                Case 3  'Tem acesso a todos projetos
                    Me.cboProjeto.Enabled_cboProjeto = True
                Case Else
                    Me.cboProjeto.Enabled_cboProjeto = False
            End Select

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Projeto - Ficha"
        End If

    End Sub

#End Region

    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click
        Call ControlesIniciais()
        Call BuscarProjetos()
        Session("idProjeto") = Me.cboProjeto.Value_cboProjeto
        Me.txtSubProjeto.Text = Me.cboProjeto.Text_cboSubProjeto


        Me.cboProjeto.Enabled_cboProjeto = True
        Me.cboProjeto.Enabled_cboSubProjeto = True
        Me.cboProjeto.Enabled_cboTarefas = True

        Call Ativa_SomenteLeitura()

    End Sub


    Protected Sub btnAlterar_Click(sender As Object, e As EventArgs) Handles btnAlterar.Click
        Session("varSalvarAlterar") = 2
        Call Desativa_SomenteLeitura()
        Me.btnNovo.Enabled = False
        Me.btnSalvar.Enabled = True
        Me.btnExcluir.Enabled = False
        Me.btnAlterar.Enabled = False
        Me.btnCancelar.Enabled = True
    End Sub

    Private Sub ControlesIniciais()
        Me.btnAlterar.Enabled = True
        Me.btnNovo.Enabled = True
        Me.btnSalvar.Enabled = False
        Me.btnExcluir.Enabled = True
        Me.btnCancelar.Enabled = False

        Me.cboProjeto.DataBind_cboSubProjeto()
        Me.cboProjeto.SelectedIndex_cboSubProjeto = 0

        Me.cboProjeto.Enabled_cboProjeto = True
        Me.cboProjeto.Enabled_cboSubProjeto = True

    End Sub

    Private Sub Ativa_SomenteLeitura()
        Me.txtSubProjeto.ReadOnly = True
        Me.txtObjetivoProjeto.ReadOnly = True
        Me.txtDataInicio.ReadOnly = True
        Me.txtDataTermino.ReadOnly = True
        Me.cboCoordenador.ReadOnly = True
        Me.txtFacilitador.ReadOnly = True
        Me.txtParticipantes.ReadOnly = True
        Me.cboPeriodicidade.ReadOnly = True
    End Sub

    Private Sub Desativa_SomenteLeitura()
        Me.txtSubProjeto.ReadOnly = False
        Me.txtObjetivoProjeto.ReadOnly = False
        Me.txtDataInicio.ReadOnly = False
        Me.txtDataTermino.ReadOnly = False
        Me.cboCoordenador.ReadOnly = False
        Me.txtFacilitador.ReadOnly = False
        Me.txtParticipantes.ReadOnly = False
        Me.cboPeriodicidade.ReadOnly = False
    End Sub


#Region " Funções"

    Private Sub ExibirDados(ByVal VisibleExibirDados As Boolean)
        If VisibleExibirDados = True Then
            Me.divDados.Visible = True
        Else
            Me.divDados.Visible = False
        End If

    End Sub

#End Region

    Protected Sub cboProjeto_Click_btnSubprojeto(sender As Object, e As EventArgs) Handles cboProjeto.Click_btnSubprojeto

        cboProjeto.Enabled_cboSubProjeto = False
        cboProjeto.Enabled_cboTarefas = False
        cboProjeto.Enabled_btnTarefas = False

        Me.lblNome.Text = "Sub-Projeto"
        btnNovo_Click(sender, e)

        txtSubProjeto.Focus()

    End Sub

    Protected Sub cboProjeto_Click_btnTarefas(sender As Object, e As EventArgs) Handles cboProjeto.Click_btnTarefas

        cboProjeto.Enabled_cboTarefas = False

        Me.lblNome.Text = "Tarefas"
        btnNovo_Click(sender, e)

        txtSubProjeto.Focus()
    End Sub

    Protected Sub cboProjeto_SelectedIndexChanged_cboProjeto(sender As Object, e As EventArgs) Handles cboProjeto.SelectedIndexChanged_cboProjeto
        cboProjeto.StatusProjeto_Or_Subprojeto()
        lblNome.Text = cboProjeto.DescricaoDoProjeto

        Call BuscarProjetos()
        Call BuscarTipoUsuario()

        ExibirDados(True)
        Me.txtSubProjeto.Text = Me.cboProjeto.Text_cboProjeto


    End Sub

    Protected Sub cboProjeto_SelectedIndexChanged_cboSubProjeto(sender As Object, e As EventArgs) Handles cboProjeto.SelectedIndexChanged_cboSubProjeto
        cboProjeto.StatusProjeto_Or_Subprojeto()
        lblNome.Text = cboProjeto.DescricaoDoProjeto
        Call BuscarProjetos()
        Call BuscarTipoUsuario()

        ExibirDados(True)
        Me.txtSubProjeto.Text = Me.cboProjeto.Text_cboSubProjeto


    End Sub



    Protected Sub cboProjeto_SelectedIndexChanged_cboTarefas(sender As Object, e As EventArgs) Handles cboProjeto.SelectedIndexChanged_cboTarefas
        cboProjeto.StatusProjeto_Or_Subprojeto()
        lblNome.Text = cboProjeto.DescricaoDoProjeto
        Call BuscarProjetos()
        Call BuscarTipoUsuario()

        ExibirDados(True)
        Me.txtSubProjeto.Text = Me.cboProjeto.Text_cboTarefas
    End Sub
End Class
