Imports System.Data
Imports System.Data.SqlClient

Partial Class Ranking_planej06_DiarioBordo
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes
    Dim oProjeto As New Projeto

    Sub Salvar()

        Dim ID As Integer
        StatusProjeto_Or_Subprojeto()
        
        Using conn = Conexao.gerProjetos
            Using cmdTest As New SqlCommand("uspProjDiarioBordoSalvar", conn)
                cmdTest.CommandType = CommandType.StoredProcedure

                cmdTest.Parameters.AddWithValue("@Dia", Me.txtDia.Date)
                cmdTest.Parameters.AddWithValue("@ProjetoID", Session("idProjeto"))
                cmdTest.Parameters.AddWithValue("@Memo", CStr(Trim(Me.txtMemo.Text)))
                cmdTest.Parameters.AddWithValue("@UserName", User.Identity.Name)
                cmdTest.Parameters.AddWithValue("@Tipo", Session("idTipo"))

                cmdTest.Parameters.Add("@dbID", SqlDbType.SmallInt, 0, "dbID")
                cmdTest.Parameters("@dbID").Direction = ParameterDirection.Output

                Try
                    conn.Open()
                    cmdTest.ExecuteNonQuery()
                    ID = cmdTest.Parameters("@dbID").Value
                    conn.Close()
                    oVem.UserMsgBox(Me, "O Diário de Bordo foi salvo com sucesso!!!")
                    Me.cboList.DataBind()
                    Call TelaAposSalvar()
                    Me.cboList.Text = ID & "; " & Me.txtDia.Text

                Catch ex As Exception
                    oVem.UserMsgBox(Me, "Módulo: Salvar - " & ex.Message)
                    oVem.UserMsgBox(Me, "Houve um problema. O Diário de Bordo não foi salvo.")
                End Try
                conn.Close()
            End Using
        End Using

    End Sub

    Sub Atualizar()

        StatusProjeto_Or_Subprojeto()

        Using conn = Conexao.gerProjetos
            Using cmdTest As New SqlCommand("uspProjDiarioBordoAtualizar", conn)
                cmdTest.CommandType = CommandType.StoredProcedure

                cmdTest.Parameters.AddWithValue("@dbID", CInt(Replace(Left(Me.cboList.Value, 3), ";", "")))
                cmdTest.Parameters.AddWithValue("@ProjetoID", Session("idProjeto"))
                cmdTest.Parameters.AddWithValue("@Memo", CStr(Trim(Me.txtMemo.Text)))
                cmdTest.Parameters.AddWithValue("@UserName", User.Identity.Name)

                Try
                    conn.Open()
                    cmdTest.ExecuteNonQuery()
                    conn.Close()
                    oVem.UserMsgBox(Me, "O Diário de Bordo nº " & CInt(Replace(Left(Me.cboList.Value, 3), ";", "")) & " foi salvo com sucesso!!!")
                    Call TelaAposSalvar()

                Catch ex As Exception
                    oVem.UserMsgBox(Me, "Módulo: Atualizar - " & ex.Message)
                    oVem.UserMsgBox(Me, "Houve um problema. O Diário de Bordo não foi salvo.")
                End Try
                conn.Close()
            End Using
        End Using

    End Sub

    Private Sub TelaAposSalvar()
        Me.btnSalvar.Enabled = False
        Me.btnCancelar.Enabled = False
        Me.btnNovo.Enabled = True
        Me.btnAlterar.Enabled = True
        Me.btnExcluir.Enabled = True
        Me.cboList.Enabled = True
        Me.cboProjeto.Enabled_cboProjeto = True
        Me.txtMemo.Enabled = False
    End Sub

 

    Sub LimparControles()
        Me.txtDia.Text = ""
        Me.txtDiarioID.Text = ""
        Me.txtMemo.Text = ""
        Me.cboList.Value = ""
    End Sub

    Private Sub TelaNova()
        Me.btnNovo.Enabled = True
        Me.btnSalvar.Enabled = False
        Me.btnCancelar.Enabled = False
        Me.btnAlterar.Enabled = False
        Me.btnExcluir.Enabled = False
        Call LimparControles()
        Me.cboList.Enabled = True
        Me.txtDia.Enabled = False
        Me.txtMemo.Enabled = False
    End Sub


    Sub ExcluirDiarioBordo()

        Dim cnBKTest As New SqlConnection()
        cnBKTest = Conexao.gerProjetos
        Dim cmdTest As New SqlCommand("DELETE FROM projDiarioBordo WHERE dbID = " & CInt(Replace(Left(Me.cboList.Value, 3), ";", "")) & "", cnBKTest)

        Try
            cnBKTest.Open()
            cmdTest.ExecuteNonQuery()
            cnBKTest.Close()
            oVem.UserMsgBox(Me, "O Diário de Bordo foi excluido com sucesso!!!")
            cboList.DataBind()
            Call TelaNova()
        Catch ex As Exception
            oVem.UserMsgBox(Me, "Módulo: ExcluirDiarioBordo - " & ex.Message)
            oVem.UserMsgBox(Me, "Houve um problema, o Diário de Bordo não foi excluido.")
        Finally
            cnBKTest.Close()
        End Try

    End Sub

    Sub BuscarDiarios()

        Dim con As New SqlConnection()
        con = Conexao.gerProjetos
        Dim strSQL As String = "SELECT dbDia, dbTexto FROM projDiarioBordo WHERE dbID = " & CInt(Replace(Left(Me.cboList.Value, 3), ";", "")) & ""
        Dim comando As New SqlCommand(strSQL, con)
        comando.CommandType = CommandType.Text

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                Me.txtDia.Date = reader5.GetSqlDateTime(0)
                Me.txtMemo.Text = reader5.GetSqlString(1).ToString
            End While

            Me.btnAlterar.Enabled = True
            Me.btnExcluir.Enabled = True
            Me.btnNovo.Enabled = True

        Catch ex As Exception
            oVem.UserMsgBox(Me, "Módulo: BuscarDiarios - " & ex.Message)

        Finally
            con.Close()
        End Try
    End Sub

    Protected Sub cboList_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboList.SelectedIndexChanged
        Call BuscarDiarios()
        Call SomenteLeitura()
    End Sub

    Private Sub DisabledControles()
        Me.btnAlterar.Enabled = False
        Me.btnCancelar.Enabled = False
        Me.btnExcluir.Enabled = False
        Me.btnNovo.Enabled = False
        Me.btnSalvar.Enabled = False
    End Sub

    Private Sub SomenteLeitura()
        Select Case Session("SomenteLeitura")
            Case 1  'Somente Leitura - Acesso a todos Projetos
                Me.cboProjeto.Enabled_cboProjeto = True
                Call DisabledControles()
            Case 2  'Projeto Especificadp
                Call DisabledControles()
                Me.cboProjeto.Enabled_cboProjeto = False
        End Select
    End Sub


#Region " Botões"

    Protected Sub btnAlterar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAlterar.Click
        Me.txtDia.Enabled = False
        Me.cboProjeto.Enabled_cboProjeto = False
        Me.txtMemo.Enabled = True
        Me.btnSalvar.Enabled = True
        Me.btnCancelar.Enabled = True
        Me.btnNovo.Enabled = False
        Me.btnAlterar.Enabled = False
        Me.btnExcluir.Enabled = False
        Me.cboList.Enabled = False
        Me.txtMemo.Focus()
    End Sub

    Protected Sub btnExcluir_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExcluir.Click
        If CInt(Trim(Me.cboList.Text.Length)) > 1 Then  'Há um Diário de Bordo selecionado
            Call ExcluirDiarioBordo()
        Else    'Nenhum Diário de Bordo selecionado
            oVem.UserMsgBox(Me, "Você precisar selecionar um Diário de Bordo para poder excluir.")
            Exit Sub
        End If
    End Sub

    Protected Sub btnCancelar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancelar.Click
        If CInt(Trim(Me.cboList.Text.Length)) > 1 Then   'O Diário de Bordo já existe
            Call BuscarDiarios()
            Call TelaAposSalvar()
        Else    'O Diário de Bordo não existe
            Call TelaNova()
        End If
    End Sub

    Protected Sub btnNovo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNovo.Click
        Me.btnSalvar.Enabled = True
        Me.btnCancelar.Enabled = True
        Me.btnNovo.Enabled = False
        Me.btnAlterar.Enabled = False
        Me.txtDia.Enabled = True
        Me.txtMemo.Enabled = True
        Me.cboList.Enabled = False
        Call LimparControles()
        Me.txtMemo.Focus()
    End Sub

    Protected Sub btnSalvar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSalvar.Click

        If CInt(Trim(Me.cboProjeto.Text_cboProjeto.Length)) < 1 Then
            oVem.UserMsgBox(Me, "Você deve selecionar um projeto para poder salvar o Diário de Bordo.")
            Exit Sub
        End If

        If CInt(Trim(Me.txtDia.Text.Length)) < 1 Then
            oVem.UserMsgBox(Me, "Você deve selecionar uma 'Dia' para poder salvar o Diário de Bordo.")
            Exit Sub
        End If

        If CInt(Trim(Me.txtMemo.Text.Length)) < 1 Then
            oVem.UserMsgBox(Me, "Você deve informar alguma informação para poder salvar o Diário de Bordo.")
            Me.txtMemo.Focus()
            Exit Sub
        End If

        If CInt(Trim(Me.cboList.Text.Length)) > 1 Then   'O Diário de Bordo já existe
            Call Atualizar()
        Else    'O Diário de Bordo não existe
            Call Salvar()
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

        If CInt(Trim((Me.cboProjeto.Text_cboProjeto.Length))) > 0 Then
            Session("idProjeto") = Me.cboProjeto.Value_cboProjeto
            iTipo = 1 'Projeto
        End If

        If CInt(Trim((Me.cboProjeto.Text_cboSubProjeto.Length))) > 0 Then
            Session("idProjeto") = Me.cboProjeto.Value_cboSubProjeto
            iTipo = 2 'Sub-Projeto
        End If

        Session("idTipo") = iTipo
        Return iTipo
    End Function


#End Region

#Region " Page"

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        If Not IsPostBack Then

            oVem.AtualizarEstatisticaPrograma(27, User.Identity.Name)

            Call TelaNova()
            Me.cboProjeto.Value_cboProjeto = oProjeto.NumeroDoProjeto(User.Identity.Name)

            Select Case oProjeto.CoordenadorProjeto(User.Identity.Name)
                Case 1
                    Me.cboProjeto.Enabled_cboProjeto = True
                Case 3
                    Me.cboProjeto.Enabled_cboProjeto = True
                Case Else
                    Me.cboProjeto.Enabled_cboProjeto = False
            End Select

            Call SomenteLeitura()
        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Projeto - Diário de Bordo"
        End If
    End Sub

#End Region

#Region " cbo"

    Protected Sub cboProjeto_SelectedIndexChanged_cboSubProjeto(sender As Object, e As EventArgs) Handles cboProjeto.SelectedIndexChanged_cboSubProjeto
        StatusProjeto_Or_Subprojeto()
        Call LimparControles()
    End Sub

    Protected Sub cboProjeto_SelectedIndexChanged_cboProjeto(sender As Object, e As EventArgs) Handles cboProjeto.SelectedIndexChanged_cboProjeto
        StatusProjeto_Or_Subprojeto()
        Call LimparControles()
    End Sub

#End Region


End Class
