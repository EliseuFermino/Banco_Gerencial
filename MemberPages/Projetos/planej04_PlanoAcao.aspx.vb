Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_planej04_PlanoAcao
    Inherits System.Web.UI.Page
    Dim varStatus As Byte
    Dim oVem As New VendaEmpresaMes

    Protected Sub ASPxButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ASPxButton1.Click
        Call BuscarDatas()
    End Sub

    Protected Sub btnSalvar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSalvar.Click
        If CStr(Me.cboStatusTarefa.Text.Length) < 1 Then
            Beep()
            oVem.UserMsgBox(Me, "Você deve selecionar um 'Status' para poder salvar o Plano de Ação.")
            Exit Sub
        End If
        Call SalvarPlanoDeAcao()
    End Sub

    Protected Sub ASPxButton2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnFechar.Click
        varStatus = 1
        Me.grid.DataBind()
    End Sub

#Region " GridView"

    Protected Sub grid_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles grid.DataBound
        On Error Resume Next
        Me.grid.FocusedRowIndex = Me.grid.FindVisibleIndexByKeyValue(RetornaNumeroPlanoAcao())

    End Sub

    Protected Sub grid_HtmlRowPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles grid.HtmlRowPrepared
        If e.RowType = DevExpress.Web.GridViewRowType.Data Then
        End If
        Dim bidstat As String = Convert.ToString(grid.GetRowValuesByKeyValue(e.KeyValue, "StatusTarefa"))
        If bidstat = "Em Andamento" Then
            e.Row.ForeColor = System.Drawing.Color.RoyalBlue
        End If

        If bidstat = "Em Atraso" Then
            e.Row.BackColor = System.Drawing.Color.Red
            e.Row.ForeColor = System.Drawing.Color.White
        End If

        If bidstat = "Cancelado" Then
            e.Row.ForeColor = System.Drawing.Color.Black
        End If

        If bidstat = "Concluido" Then
            e.Row.ForeColor = System.Drawing.Color.DarkGreen
        End If
    End Sub

#End Region

    Protected Sub SqlDS2_Selected(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles SqlDS2.Selected
        If e.AffectedRows = 0 Then
            Me.btnAta.Enabled = False
            Me.ASPxButton1.Enabled = False
        Else
            Me.btnAta.Enabled = True
            Me.ASPxButton1.Enabled = True
        End If
    End Sub

    Private Sub ExcluirProjetoDefine()
        Dim strSQL As String = "DELETE FROM projProjetoDefine WHERE PlanoAcaoID=" & Me.txtTarefaID.Value & " AND AtaID=" & Me.txtAtaID.Value & ""

        Dim Conn As New SqlConnection()
        Conn = Conexao.gerProjetos
        Dim objDr As SqlDataReader
        Dim Cmd As New SqlCommand(strSQL, Conn)

        Try
            Conn.Open()
            objDr = Cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            Conn.Close()
        Catch ex As Exception
            oVem.UserMsgBox(Me, "Módulo:  ExcluirProjetoDefine - " & ex.Message)
        Finally
            Conn.Close()
        End Try
    End Sub

    Protected Sub cboStatusTarefa_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboStatusTarefa.SelectedIndexChanged
        If Me.cboStatusTarefa.Value = "Concluido" Then
            Me.ftxt_Conclusao.Enabled = False
        Else
            Me.ftxt_Conclusao.Enabled = True
        End If
    End Sub


#Region " Buscar Atas"

    Protected Sub panAta_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles panAta.PreRender
        Call BuscarAtas()
    End Sub

    Sub BuscarAtas()
        If Me.txtAtaID.Value = 0 Then
            Me.lblDia.Text = ""
            Me.txtMemoParticipantes.Text = ""
            Me.txtMemoObjetivos.Text = ""
            Me.txtMemoDiscussao.Text = ""
            Me.lblEtapa.Text = ""
            Me.lblSubProjeto.Text = ""
            Me.lblProjeto.Text = ""
            Me.lblAta.Text = ""
        Else
            Dim con As New SqlConnection()
            con = Conexao.gerProjetos
            'Dim strSQL As String = "SELECT projAta.ataDia, projAta.ataParticipantes, projAta.ataObjetivos, projAta.ataDiscussao, projProjetoSub.ProjetoSubDesc, projEtapas.etapaDesc " & _
            '                       "FROM projAta INNER JOIN projProjetoSub ON projAta.SubProjetoID = projProjetoSub.ProjetoSubID INNER JOIN projEtapas ON projAta.EtapaID = projEtapas.EtapaID " & _
            '                       "WHERE ataID = " & Me.txtAtaID.Value & ""
            Dim comando As New SqlCommand("uspPlanoDeAcao_BuscarAta", con)
            comando.CommandType = CommandType.StoredProcedure

            comando.Parameters.Add(New SqlParameter("@idAta", Data.SqlDbType.SmallInt))
            comando.Parameters("@idAta").Value = Me.txtAtaID.Value

            Try
                con.Open()
                Dim reader5 As SqlDataReader
                reader5 = comando.ExecuteReader()
                While reader5.Read
                    Me.lblDia.Text = reader5.GetSqlDateTime(0)
                    Me.txtMemoParticipantes.Text = Trim(reader5.GetSqlString(1).ToString())
                    Me.txtMemoObjetivos.Text = Trim(reader5.GetSqlString(2).ToString())
                    Me.txtMemoDiscussao.Text = Trim(reader5.GetSqlString(3).ToString())
                    Me.lblEtapa.Text = Trim(reader5.GetSqlString(5).ToString())
                    Me.lblSubProjeto.Text = Trim(reader5.GetSqlString(4).ToString())
                End While
                Me.lblProjeto.Text = Me.cboAcompProjeto.Text_cboProjeto
                Me.lblAta.Text = Me.txtAtaID.Value
            Catch ex As Exception
                Beep()
                oVem.UserMsgBox(Me, "Módulo: BuscarAtas - " & ex.Message)
            Finally
                con.Close()
            End Try
        End If
    End Sub

#End Region

#Region " Plano de Ação"

    Sub BuscarPlanoAcao()

        If Me.txtvarStatus.Value = 2 Then
            Call LimparTela_PlanoAcao()
        Else
            Dim con As New SqlConnection()
            con = Conexao.gerProjetos
            Dim strSQL As String = "SELECT Oque, Quem, Porque, Quanto, Onde, StatusTarefa, Quando, DataConclusao, Como, ProjetoID, SubProjetoID, EtapaID FROM projPlanoAcao WHERE PlanoAcaoID = " & Me.txtTarefaID.Value & ""
            Dim comando As New SqlCommand(strSQL, con)
            comando.CommandType = CommandType.Text

            Try
                con.Open()
                Dim reader5 As SqlDataReader
                reader5 = comando.ExecuteReader()
                While reader5.Read
                    Me.ftxt_Oque.Text = reader5.GetSqlString(0)
                    Me.ftxt_Quem.Text = reader5.GetSqlString(1)
                    Me.ftxt_Porque.Text = reader5.GetSqlString(2)
                    Me.ftxt_Quanto.Text = reader5.GetSqlString(3)
                    Me.ftxt_Onde.Text = reader5.GetSqlString(4)
                    Me.cboStatusTarefa.Text = reader5.GetSqlString(5)
                    Me.ftxt_Quando.Text = reader5.GetSqlString(6)
                    Me.ftxt_Como.Text = reader5.GetSqlString(8)
                    Me.ftxt_Conclusao.Text = reader5.GetSqlString(7)

                    'Me.txtProjetoID.Text = reader5.GetSqlInt16(9).ToString
                    'Me.txtSubProjetoID.Text = reader5.GetSqlInt16(10).ToString
                    'Me.txtEtapaID.Text = reader5.GetSqlInt16(11).ToString
                End While

            Catch ex As Exception
                oVem.UserMsgBox(Me, "Classe: BuscarPlanoAcao - " & ex.Message)

            Finally
                con.Close()
            End Try
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

    Protected Sub panPlanoAcao_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles panPlanoAcao.PreRender
        If Me.txtvarStatus.Value = 2 Then
            Call LimparTela_PlanoAcao()
        Else
            Call BuscarPlanoAcao()
        End If
    End Sub

    Private Sub ExcluirPlanoDeAcao()
        Dim strSQL As String = "DELETE FROM projPlanoAcao WHERE PlanoAcaoID = " & Me.txtTarefaID.Value & ""

        Dim Conn As New SqlConnection()
        Conn = Conexao.gerProjetos
        Dim objDr As SqlDataReader
        Dim Cmd As New SqlCommand(strSQL, Conn)

        Try
            Conn.Open()
            objDr = Cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection)
            Conn.Close()
        Catch ex As Exception
            oVem.UserMsgBox(Me, "Módulo:  ExcluirPlanoDeAcao - " & ex.Message)
        Finally
            Conn.Close()
        End Try
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
        Me.btnSalvar.Enabled = False
        Me.btnExcluirPA.Enabled = True
        Me.btnAlterarPA.Enabled = True
        Me.btnFechar.Enabled = True
        Me.btnCancelarPA.Enabled = False
        Me.cboStatusTarefa.Enabled = False
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
        Me.btnSalvar.Enabled = True
        Me.btnCancelarPA.Enabled = True
        Me.btnExcluirPA.Enabled = False
        Me.btnAlterarPA.Enabled = False
        Me.btnFechar.Enabled = False
        Me.cboStatusTarefa.Enabled = True
        Me.cboStatusTarefa.ReadOnly = False

    End Sub

    Protected Sub btnAlterarPA_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAlterarPA.Click
        Call AbrirControlesPA()
    End Sub

    Protected Sub btnCancelarPA_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelarPA.Click
        Call BuscarPlanoAcao()
        Call FecharControlesPA()
    End Sub

    Protected Sub btnExcluirPA_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExcluirPA.Click
        Me.txtvarStatus.Text = 2   'O Plano de Ação foi excluido
        Call ExcluirProjetoDefine()
        Call ExcluirPlanoDeAcao()
        Me.txtTarefaID.Value = 0
        Call FecharControlesPA()
        Me.btnAlterarPA.Enabled = False
        Me.btnSalvar.Enabled = False
        Me.btnExcluirPA.Enabled = False
        oVem.UserMsgBox(Me, "O Plano de Ação foi excluido com sucesso!!!")
    End Sub

    Sub SalvarPlanoDeAcao()
        varStatus = 2

        Using conn = Conexao.gerProjetos
            Using cmdTest As New SqlCommand("uspPlanoDeAcao_Atualizar", conn)
                cmdTest.CommandType = Data.CommandType.StoredProcedure
                With cmdTest.Parameters
                    .AddWithValue("@PlanoAcaoID", Me.txtTarefaID.Text)
                    .AddWithValue("@Oque", Me.ftxt_Oque.Text)
                    .AddWithValue("@Quem", Me.ftxt_Quem.Text)
                    .AddWithValue("@Porque", Me.ftxt_Porque.Text)
                    .AddWithValue("@Quando", Me.ftxt_Quando.Text)
                    .AddWithValue("@Onde", Me.ftxt_Onde.Text)
                    .AddWithValue("@Como", Me.ftxt_Como.Text)
                    .AddWithValue("@Quanto", Me.ftxt_Quanto.Text)
                    .AddWithValue("@DataConclusao", CStr(Today))
                    .AddWithValue("@UserName", LCase(User.Identity.Name))
                    .AddWithValue("@StatusTarefa", Me.cboStatusTarefa.Value)
                End With
                Try
                    conn.Open()
                    cmdTest.ExecuteNonQuery()
                    conn.Close()

                    oVem.UserMsgBox(Me, "O Plano de Ação foi salvo com sucesso!!!")
                    Me.grid.DataBind()
                    Call FecharControlesPA()
                Catch ex As Exception
                    oVem.UserMsgBox(Me, "Classe: SalvarPlanoDeAcao. Erro: " & Err.Number & "-" & Err.Description)
                Finally
                    conn.Close()
                End Try
            End Using
        End Using
    End Sub

#End Region

#Region " Page"

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Dim oVem As New VendaEmpresaMes
        Dim oProjeto As New Projeto

        If Not IsPostBack() Then oVem.AtualizarEstatisticaPrograma(26, User.Identity.Name)

        varStatus = 1

        Select Case oProjeto.CoordenadorProjeto(User.Identity.Name)
            Case 1  'Tem acesso a todos projetos
                Me.cboAcompProjeto.Enabled_cboProjeto = True
            Case 3  'Tem acesso a todos projetos
                Me.cboAcompProjeto.Enabled_cboProjeto = True
            Case Else
                Me.cboAcompProjeto.Enabled_cboProjeto = False
        End Select

        Me.cboAcompProjeto.Value_cboProjeto = oProjeto.NumeroDoProjeto(User.Identity.Name)

        Session("idTela") = 4
        Call FecharControlesPA()

        Select Case Session("SomenteLeitura")
            Case 1  'Somente Leitura - Acesso a todos Projetos
                Me.btnAlterarPA.Enabled = False
                Me.btnExcluirPA.Enabled = False
                Me.cboAcompProjeto.Enabled_cboProjeto = True
            Case 2  'Projeto Especificadp
                Me.btnAlterarPA.Enabled = False
                Me.btnExcluirPA.Enabled = False
        End Select

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Projetos - Plano de Ação"
        End If

    End Sub


#End Region

#Region " Funções"

    ''' <summary>
    ''' 1=Projeto   2=Sub-Projeto
    ''' </summary>
    ''' <returns></returns>
    ''' <remarks></remarks>
    Private Function StatusProjeto_Or_Subprojeto() As Byte
        Dim iTipo As Byte

        If CInt(Trim((Me.cboAcompProjeto.Text_cboProjeto.Length))) > 0 Then
            Session("idProjeto") = Me.cboAcompProjeto.Value_cboProjeto
            iTipo = 1 'Projeto
        End If

        If CInt(Trim((Me.cboAcompProjeto.Text_cboSubProjeto.Length))) > 0 Then
            Session("idProjeto") = Me.cboAcompProjeto.Value_cboSubProjeto
            iTipo = 2 'Sub-Projeto
        End If

        Session("idTipo") = iTipo
        Return iTipo
    End Function

    Private Function RetornaNumeroPlanoAcao() As Int16
        Dim con As New SqlConnection()
        con = Conexao.gerProjetos
        Dim strSQL As String = "SELECT ISNULL(MIN(PlanoAcaoID),0) AS PlanoAcaoID FROM projPlanoAcao WHERE ProjetoID = " & Me.cboAcompProjeto.Value_cboProjeto & " AND PlanoAcaoID > 0"
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
            oVem.UserMsgBox(Me, "Classe: RetornaNumeroPlanoAcao - " & ex.Message)
        Finally
            con.Close()
        End Try
    End Function

    Private Function RetornaNumeroAta() As Int16
        Dim con As New SqlConnection()
        con = Conexao.gerProjetos
        Dim strSQL As String = "SELECT ISNULL(MIN(AtaID),0) AS AtaID FROM projPlanoAcao WHERE ProjetoID = " & Me.cboAcompProjeto.Value_cboProjeto & " AND PlanoAcaoID > 0"
        Dim comando As New SqlCommand(strSQL, con)
        comando.CommandType = CommandType.Text

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                RetornaNumeroAta = reader5.GetSqlInt16(0).ToString
            End While

        Catch ex As Exception
            Beep()
            oVem.UserMsgBox(Me, "Classe: RetornaNumeroAta - " & ex.Message)
        Finally
            con.Close()
        End Try
    End Function

    Function GerarTarefaID() As Int16

        Dim con As New SqlConnection()
        con = Conexao.gerProjetos

        Dim comando As New SqlCommand("uspPlanoDeAcao_BuscarAta", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@TarefaID", Data.SqlDbType.SmallInt))
        comando.Parameters("@TarefaID").Value = Me.txtTarefaID.Text

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                GerarTarefaID = reader5.GetSqlInt16(0).ToString
            End While

        Catch ex As Exception
            Beep()
            oVem.UserMsgBox(Me, ex.Message)

        Finally
            con.Close()
        End Try
    End Function

    Sub BuscarDatas()
        Dim con As New SqlConnection()
        con = Conexao.gerProjetos
        Dim strSQL As String = "SELECT Quando, DataConclusao FROM projPlanoAcao WHERE PlanoAcaoID = " & Me.txtTarefaID.Text & ""
        Dim comando As New SqlCommand(strSQL, con)
        comando.CommandType = CommandType.Text

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                Me.txtQuando.Text = reader5.GetSqlDateTime(0)
                Me.txtConclusao.Text = reader5.GetSqlDateTime(1)
            End While

        Catch ex As Exception
            Beep()
            ' oVem.UserMsgBox(Me, ex.Message)

        Finally
            con.Close()
        End Try
    End Sub

#End Region

#Region " Cbo"

    Protected Sub cboAcompProjeto_SelectedIndexChanged_cboProjeto(sender As Object, e As EventArgs) Handles cboAcompProjeto.SelectedIndexChanged_cboProjeto
        StatusProjeto_Or_Subprojeto()
        Me.txtTarefaID.Value = 0
        Me.txtAtaID.Value = 0
        Me.txtTarefaID.Value = RetornaNumeroPlanoAcao()
        Me.txtAtaID.Value = RetornaNumeroAta()
    End Sub

    Protected Sub cboAcompProjeto_SelectedIndexChanged_cboSubProjeto(sender As Object, e As EventArgs) Handles cboAcompProjeto.SelectedIndexChanged_cboSubProjeto
        StatusProjeto_Or_Subprojeto()

    End Sub

#End Region


End Class
