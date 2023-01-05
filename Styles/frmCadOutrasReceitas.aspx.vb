Imports System.Math
Imports System.Data
Imports System.Data.SqlClient
Imports System.IO

    Partial Class MemberPages_Planejamento_frmCadDesp
    Inherits System.Web.UI.Page

    Dim strConn As String = clData_gerManager.dbConnect   '"Data Source=CONTROLADORIA1\SQLCONTRO;Initial Catalog=gerManager;Persist Security Info=True;User ID=sa;Password=rd700@1"
    Dim strTrigger, strTriggerMeta, strUser, varCodPessoalAdm As String
    Dim varTodasContas As Integer
    Dim varFilial As String


    Sub TipoTrigger()
        If Me.rnd_Grupo.Checked = True Then
            strTrigger = "uspReaMesBusca"
            strTriggerMeta = "uspOriGrupoBuscaMes"
            Me.cboGrupo_Sub.Enabled_cboSubgrupo = False
            Me.cboGrupo_Sub.Enabled_cboGrupo = True
        Else
            strTrigger = "uspReaSubMesBusca"
            strTriggerMeta = "uspOriSubgrupoBuscaMes"
            Me.cboGrupo_Sub.Enabled_cboSubgrupo = True
            Me.cboGrupo_Sub.Enabled_cboGrupo = False
        End If
        Call DefinirOpcaoSalvar()
    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        'Lista dos Administradores das Contas de Despesas -------------------------------------
        ' 1 = Joanir
        ' 2 = João
        ' 3 = Wanclei
        ' 4 = Adailton
        ' 5 = Renato
        ' 6 = Vladimir
        ' 7 = Aliceu
        ' 8 = Elaine
        '99 = Todos
        '--------------------------------------------------------------------------------------

        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            Me.NewItem.Value = 8    'Traz lista de Outras Receitas = CatCod
            Call AdicionarItem()

            Me.NewItem.Value = Me.cboPosicao.CallPosicao     'Traz lista de Operações Comerciais
            Call AdicionarPosicao()

            '-----------------------

            oVem.AtualizarEstatisticaPrograma("51", User.Identity.Name)
            Call Definir_varFilial()
            strUser = User.Identity.Name
            'varTodasContas ->  '1=Não     2=Sim
            Dim oProjeto As New Projeto

            Select Case LCase(Trim(oProjeto.BuscarDepartamentoDoUsuario(Page.User.Identity.Name)))
                Case "administração"    'Adailton
                    varTodasContas = 1
                    varCodPessoalAdm = oProjeto.PessoaAdmin
                    Call LiberaLinksTrue()
                Case "controladoria"
                    varTodasContas = 2    '1=Não     2=Sim
                    Call LiberaLinksTrue()
                Case "supervisor", "supervisor_M"  'Supervisores
                    varTodasContas = 2    '1=Não     2=Sim
                    Call LiberaLinksTrue()
                Case "lojas"  'Supervisores
                    varTodasContas = 2    '1=Não     2=Sim
                    Call LiberaLinksTrue()
                Case Else
                    varTodasContas = 2
                    Call LiberaLinksFalse()
            End Select

            If Month(Now()) > 9 Then
                Me.cboAno.CallAno = Year(Now()) + 1
            Else
                Me.cboAno.CallAno = Year(Now())
            End If

            Call TipoTrigger()
            Call mySESSION()

        End If
    End Sub

    Private Sub Definir_varFilial()
        Select Case Me.cboFilial.CallFilial
            Case 33 'Sao Jose Pinhais - Nova
                varFilial = 24
            Case Else
                varFilial = Me.cboFilial.CallFilial
        End Select
    End Sub

    Sub AdicionarItem()
        Dim sourceItem As String = Server.HtmlEncode(NewItem.Value)
        cboGrupo_Sub.AddSourceItem(sourceItem)
    End Sub

    Sub AdicionarPosicao()
        Dim sourceItem As String = Server.HtmlEncode(NewItem.Value)
        cboGrupo_Sub.AddPosicao(sourceItem)
    End Sub

    Sub AdicionarSubgrupo()
        Dim sourceItem As String = Server.HtmlEncode(NewItem.Value)
        cboGrupo_Sub.AddSourceItemSub(sourceItem)
    End Sub

    Sub LiberaLinksTrue()
        Me.link_EmpresaMes.Visible = True
        Me.link_EmpresaAno.Visible = True
        Me.link_ApoioMes.Visible = True
        Me.link_ApoioAno.Visible = True
        Me.link_GrupoMes.Visible = True
        Me.link_GrupoAno.Visible = True
        Me.link_SubgrupoMes.Visible = True
        Me.link_SubgrupoAno.Visible = True
        Me.link_12Meses_Grupo.Visible = True
        Me.link_12Meses_GrupoAno.Visible = True
        Me.link_DRE.Visible = True
    End Sub

    Sub LiberaLinksFalse()
        Me.link_EmpresaMes.Visible = False
        Me.link_EmpresaAno.Visible = False
        Me.link_ApoioMes.Visible = False
        Me.link_ApoioAno.Visible = False
        Me.link_GrupoMes.Visible = False
        Me.link_GrupoAno.Visible = False
        Me.link_SubgrupoMes.Visible = False
        Me.link_SubgrupoAno.Visible = False
        Me.link_12Meses_Grupo.Visible = False
        Me.link_12Meses_GrupoAno.Visible = False
        Me.link_DRE.Visible = True
    End Sub

    Sub PreencherGrupo()
        ''define a string com o comando SQL e a string de conexão usando um provedor SQLClient
        'Dim oProjeto As New Projeto
        'Dim strSQL As String

        'If varTodasContas = 1 Then
        '    strSQL = "SELECT CatLinhaDesc, CatLinhaCod from listDespGrupoTodas WHERE CodPessoalAdm = " & varCodPessoalAdm & ""
        'Else
        '    strSQL = "SELECT CatLinhaDesc, CatLinhaCod from listDespGrupoTodas"
        'End If

        'Dim Conn As New SqlConnection(strConn)
        'Dim objDr As SqlDataReader
        'Dim Cmd As New SqlCommand(strSQL, Conn)
        'Conn.Open()

        'objDr = Cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection)

        'Me.cboGrupo.DataSource = objDr
        'Me.cboGrupo.DataBind()

        Call Busca_CatCod()
    End Sub

    Sub Busca_CatCod()
        Dim con As New SqlConnection(strConn)
        Dim comando As New SqlCommand("uspCategorinhaLinhaBusca_CatCod", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idCod", SqlDbType.VarChar))
        comando.Parameters("@idCod").Value = Me.cboGrupo_Sub.CallGrupo

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                Me.lblCatCod.Text = reader5.GetSqlString(0).ToString()

            End While

        Catch ex As Exception
            Beep()
            UserMsgBox(Me, ex.Message)

        Finally
            con.Close()
        End Try
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

    Sub Busca_Hist4(ByVal iMes As String)

        Dim con As New SqlConnection(strConn)

        Dim comando As New SqlCommand(strTrigger, con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.Char))
        comando.Parameters("@Ano").Value = Me.cboAno.CallAno - 4

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.VarChar))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.VarChar))
        comando.Parameters("@idFilial").Value = varFilial

        If rnd_Grupo.Checked = True Then
            comando.Parameters.Add(New SqlParameter("@idCod", Data.SqlDbType.VarChar))
            comando.Parameters("@idCod").Value = Me.cboGrupo_Sub.CallGrupo
        Else
            comando.Parameters.Add(New SqlParameter("@idCod", Data.SqlDbType.VarChar))
            comando.Parameters("@idCod").Value = Me.cboGrupo_Sub.CallSubgrupo
        End If

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                Select Case iMes
                    Case 1
                        Me.lbl_vlrHist4_1.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist4_1.Text = reader5.GetSqlMoney(1).ToString()
                    Case 2
                        Me.lbl_vlrHist4_2.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist4_2.Text = reader5.GetSqlMoney(1).ToString()
                    Case 3
                        Me.lbl_vlrHist4_3.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist4_3.Text = reader5.GetSqlMoney(1).ToString()
                    Case 4
                        Me.lbl_vlrHist4_4.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist4_4.Text = reader5.GetSqlMoney(1).ToString()
                    Case 5
                        Me.lbl_vlrHist4_5.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist4_5.Text = reader5.GetSqlMoney(1).ToString()
                    Case 6
                        Me.lbl_vlrHist4_6.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist4_6.Text = reader5.GetSqlMoney(1).ToString()
                    Case 7
                        Me.lbl_vlrHist4_7.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist4_7.Text = reader5.GetSqlMoney(1).ToString()
                    Case 8
                        Me.lbl_vlrHist4_8.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist4_8.Text = reader5.GetSqlMoney(1).ToString()
                    Case 9
                        Me.lbl_vlrHist4_9.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist4_9.Text = reader5.GetSqlMoney(1).ToString()
                    Case 10
                        Me.lbl_vlrHist4_10.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist4_10.Text = reader5.GetSqlMoney(1).ToString()
                    Case 11
                        Me.lbl_vlrHist4_11.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist4_11.Text = reader5.GetSqlMoney(1).ToString()
                    Case 12
                        Me.lbl_vlrHist4_12.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist4_12.Text = reader5.GetSqlMoney(1).ToString()
                End Select

            End While

        Catch ex As Exception
            Beep()
            UserMsgBox(Me, ex.Message)

        Finally
            con.Close()
        End Try
    End Sub

    Sub Busca_Hist3(ByVal iMes As String)

        Dim con As New SqlConnection(strConn)

        Dim comando As New SqlCommand(strTrigger, con)
        comando.CommandType = CommandType.StoredProcedure

        If rnd_Grupo.Checked = True Then
            comando.Parameters.Add(New SqlParameter("@idCod", Data.SqlDbType.VarChar))
            comando.Parameters("@idCod").Value = Me.cboGrupo_Sub.CallGrupo
        Else
            comando.Parameters.Add(New SqlParameter("@idCod", Data.SqlDbType.VarChar))
            comando.Parameters("@idCod").Value = Me.cboGrupo_Sub.CallSubgrupo
        End If

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.Char))
        comando.Parameters("@Ano").Value = Me.cboAno.CallAno - 3

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.VarChar))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.VarChar))
        comando.Parameters("@idFilial").Value = varFilial

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                Select Case iMes
                    Case 1
                        Me.lbl_vlrHist3_1.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist3_1.Text = reader5.GetSqlMoney(1).ToString()
                    Case 2
                        Me.lbl_vlrHist3_2.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist3_2.Text = reader5.GetSqlMoney(1).ToString()
                    Case 3
                        Me.lbl_vlrHist3_3.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist3_3.Text = reader5.GetSqlMoney(1).ToString()
                    Case 4
                        Me.lbl_vlrHist3_4.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist3_4.Text = reader5.GetSqlMoney(1).ToString()
                    Case 5
                        Me.lbl_vlrHist3_5.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist3_5.Text = reader5.GetSqlMoney(1).ToString()
                    Case 6
                        Me.lbl_vlrHist3_6.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist3_6.Text = reader5.GetSqlMoney(1).ToString()
                    Case 7
                        Me.lbl_vlrHist3_7.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist3_7.Text = reader5.GetSqlMoney(1).ToString()
                    Case 8
                        Me.lbl_vlrHist3_8.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist3_8.Text = reader5.GetSqlMoney(1).ToString()
                    Case 9
                        Me.lbl_vlrHist3_9.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist3_9.Text = reader5.GetSqlMoney(1).ToString()
                    Case 10
                        Me.lbl_vlrHist3_10.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist3_10.Text = reader5.GetSqlMoney(1).ToString()
                    Case 11
                        Me.lbl_vlrHist3_11.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist3_11.Text = reader5.GetSqlMoney(1).ToString()
                    Case 12
                        Me.lbl_vlrHist3_12.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist3_12.Text = reader5.GetSqlMoney(1).ToString()
                End Select

            End While

        Catch ex As Exception
            Beep()
            UserMsgBox(Me, ex.Message)

        Finally
            con.Close()
        End Try
    End Sub

    Sub Busca_Hist2(ByVal iMes As String)

        Dim con As New SqlConnection(strConn)

        Dim comando As New SqlCommand(strTrigger, con)
        comando.CommandType = CommandType.StoredProcedure

        If rnd_Grupo.Checked = True Then
            comando.Parameters.Add(New SqlParameter("@idCod", Data.SqlDbType.VarChar))
            comando.Parameters("@idCod").Value = Me.cboGrupo_Sub.CallGrupo
        Else
            comando.Parameters.Add(New SqlParameter("@idCod", Data.SqlDbType.VarChar))
            comando.Parameters("@idCod").Value = Me.cboGrupo_Sub.CallSubgrupo
        End If

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.Char))
        comando.Parameters("@Ano").Value = Me.cboAno.CallAno - 2

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.VarChar))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.VarChar))
        comando.Parameters("@idFilial").Value = varFilial

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                Select Case iMes
                    Case 1
                        Me.lbl_vlrHist2_1.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist2_1.Text = reader5.GetSqlMoney(1).ToString()
                    Case 2
                        Me.lbl_vlrHist2_2.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist2_2.Text = reader5.GetSqlMoney(1).ToString()
                    Case 3
                        Me.lbl_vlrHist2_3.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist2_3.Text = reader5.GetSqlMoney(1).ToString()
                    Case 4
                        Me.lbl_vlrHist2_4.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist2_4.Text = reader5.GetSqlMoney(1).ToString()
                    Case 5
                        Me.lbl_vlrHist2_5.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist2_5.Text = reader5.GetSqlMoney(1).ToString()
                    Case 6
                        Me.lbl_vlrHist2_6.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist2_6.Text = reader5.GetSqlMoney(1).ToString()
                    Case 7
                        Me.lbl_vlrHist2_7.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist2_7.Text = reader5.GetSqlMoney(1).ToString()
                    Case 8
                        Me.lbl_vlrHist2_8.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist2_8.Text = reader5.GetSqlMoney(1).ToString()
                    Case 9
                        Me.lbl_vlrHist2_9.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist2_9.Text = reader5.GetSqlMoney(1).ToString()
                    Case 10
                        Me.lbl_vlrHist2_10.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist2_10.Text = reader5.GetSqlMoney(1).ToString()
                    Case 11
                        Me.lbl_vlrHist2_11.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist2_11.Text = reader5.GetSqlMoney(1).ToString()
                    Case 12
                        Me.lbl_vlrHist2_12.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist2_12.Text = reader5.GetSqlMoney(1).ToString()
                End Select

            End While

        Catch ex As Exception
            Beep()
            UserMsgBox(Me, ex.Message)

        Finally
            con.Close()
        End Try
    End Sub

    Sub Busca_Hist1(ByVal iMes As String)

        Dim con As New SqlConnection(strConn)

        Dim comando As New SqlCommand(strTrigger, con)
        comando.CommandType = CommandType.StoredProcedure

        If rnd_Grupo.Checked = True Then
            comando.Parameters.Add(New SqlParameter("@idCod", Data.SqlDbType.VarChar))
            comando.Parameters("@idCod").Value = Me.cboGrupo_Sub.CallGrupo
        Else
            comando.Parameters.Add(New SqlParameter("@idCod", Data.SqlDbType.VarChar))
            comando.Parameters("@idCod").Value = Me.cboGrupo_Sub.CallSubgrupo
        End If

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.Char))
        comando.Parameters("@Ano").Value = Me.cboAno.CallAno - 1

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.VarChar))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.VarChar))
        comando.Parameters("@idFilial").Value = varFilial

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                Select Case iMes
                    Case 1
                        Me.lbl_vlrHist1_1.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist1_1.Text = reader5.GetSqlMoney(1).ToString()
                    Case 2
                        Me.lbl_vlrHist1_2.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist1_2.Text = reader5.GetSqlMoney(1).ToString()
                    Case 3
                        Me.lbl_vlrHist1_3.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist1_3.Text = reader5.GetSqlMoney(1).ToString()
                    Case 4
                        Me.lbl_vlrHist1_4.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist1_4.Text = reader5.GetSqlMoney(1).ToString()
                    Case 5
                        Me.lbl_vlrHist1_5.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist1_5.Text = reader5.GetSqlMoney(1).ToString()
                    Case 6
                        Me.lbl_vlrHist1_6.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist1_6.Text = reader5.GetSqlMoney(1).ToString()
                    Case 7
                        Me.lbl_vlrHist1_7.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist1_7.Text = reader5.GetSqlMoney(1).ToString()
                    Case 8
                        Me.lbl_vlrHist1_8.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist1_8.Text = reader5.GetSqlMoney(1).ToString()
                    Case 9
                        Me.lbl_vlrHist1_9.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist1_9.Text = reader5.GetSqlMoney(1).ToString()
                    Case 10
                        Me.lbl_vlrHist1_10.Text = reader5.GetSqlMoney(0).ToString()
                        Me.lbl_percHist1_10.Text = reader5.GetSqlMoney(1).ToString()
                    Case 11
                        Me.lbl_vlrHist1_11.Text = reader5.GetSqlMoney(0).ToString()
                        If IsDBNull(reader5.GetSqlMoney(1).ToString()) Then
                            Me.lbl_percHist1_11.Text = reader5.GetSqlMoney(1).ToString()
                        Else
                            Me.lbl_percHist1_11.Text = 0
                        End If
                    Case 12
                        Me.lbl_vlrHist1_12.Text = reader5.GetSqlMoney(0).ToString()
                        If IsDBNull(reader5.GetSqlMoney(1).ToString()) Then
                            Me.lbl_percHist1_12.Text = reader5.GetSqlMoney(1).ToString()
                        Else
                            Me.lbl_percHist1_12.Text = 0
                        End If
                End Select

            End While

        Catch ex As Exception
            Beep()
            UserMsgBox(Me, ex.Message)

        Finally
            con.Close()
        End Try
    End Sub

    Private Sub ZerarCampos()
        Me.lbl_vlrHist1_1.Text = 0
        Me.lbl_vlrHist1_2.Text = 0
        Me.lbl_vlrHist1_3.Text = 0
        Me.lbl_vlrHist1_4.Text = 0
        Me.lbl_vlrHist1_5.Text = 0
        Me.lbl_vlrHist1_6.Text = 0
        Me.lbl_vlrHist1_7.Text = 0
        Me.lbl_vlrHist1_8.Text = 0
        Me.lbl_vlrHist1_9.Text = 0
        Me.lbl_vlrHist1_10.Text = 0
        Me.lbl_vlrHist1_11.Text = 0
        Me.lbl_vlrHist1_12.Text = 0

        Me.lbl_vlrHist2_1.Text = 0
        Me.lbl_vlrHist2_2.Text = 0
        Me.lbl_vlrHist2_3.Text = 0
        Me.lbl_vlrHist2_4.Text = 0
        Me.lbl_vlrHist2_5.Text = 0
        Me.lbl_vlrHist2_6.Text = 0
        Me.lbl_vlrHist2_7.Text = 0
        Me.lbl_vlrHist2_8.Text = 0
        Me.lbl_vlrHist2_9.Text = 0
        Me.lbl_vlrHist2_10.Text = 0
        Me.lbl_vlrHist2_11.Text = 0
        Me.lbl_vlrHist2_12.Text = 0

        Me.lbl_vlrHist3_1.Text = 0
        Me.lbl_vlrHist3_2.Text = 0
        Me.lbl_vlrHist3_3.Text = 0
        Me.lbl_vlrHist3_4.Text = 0
        Me.lbl_vlrHist3_5.Text = 0
        Me.lbl_vlrHist3_6.Text = 0
        Me.lbl_vlrHist3_7.Text = 0
        Me.lbl_vlrHist3_8.Text = 0
        Me.lbl_vlrHist3_9.Text = 0
        Me.lbl_vlrHist3_10.Text = 0
        Me.lbl_vlrHist3_11.Text = 0
        Me.lbl_vlrHist3_12.Text = 0

        Me.lbl_vlrHist4_1.Text = 0
        Me.lbl_vlrHist4_2.Text = 0
        Me.lbl_vlrHist4_3.Text = 0
        Me.lbl_vlrHist4_4.Text = 0
        Me.lbl_vlrHist4_5.Text = 0
        Me.lbl_vlrHist4_6.Text = 0
        Me.lbl_vlrHist4_7.Text = 0
        Me.lbl_vlrHist4_8.Text = 0
        Me.lbl_vlrHist4_9.Text = 0
        Me.lbl_vlrHist4_10.Text = 0
        Me.lbl_vlrHist4_11.Text = 0
        Me.lbl_vlrHist4_12.Text = 0

        Me.txt_vlrMeta01.Text = 0
        Me.txt_vlrMeta02.Text = 0
        Me.txt_vlrMeta03.Text = 0
        Me.txt_vlrMeta04.Text = 0
        Me.txt_vlrMeta05.Text = 0
        Me.txt_vlrMeta06.Text = 0
        Me.txt_vlrMeta07.Text = 0
        Me.txt_vlrMeta08.Text = 0
        Me.txt_vlrMeta09.Text = 0
        Me.txt_vlrMeta10.Text = 0
        Me.txt_vlrMeta11.Text = 0
        Me.txt_vlrMeta12.Text = 0

        Me.txt_vlrVenda_01.Text = 0
        Me.txt_vlrVenda_02.Text = 0
        Me.txt_vlrVenda_03.Text = 0
        Me.txt_vlrVenda_04.Text = 0
        Me.txt_vlrVenda_05.Text = 0
        Me.txt_vlrVenda_06.Text = 0
        Me.txt_vlrVenda_07.Text = 0
        Me.txt_vlrVenda_08.Text = 0
        Me.txt_vlrVenda_09.Text = 0
        Me.txt_vlrVenda_10.Text = 0
        Me.txt_vlrVenda_11.Text = 0
        Me.txt_vlrVenda_12.Text = 0

        'Zera os campos de percentuais
        Me.lbl_percHist1_1.Text = 0
        Me.lbl_percHist1_2.Text = 0
        Me.lbl_percHist1_3.Text = 0
        Me.lbl_percHist1_4.Text = 0
        Me.lbl_percHist1_5.Text = 0
        Me.lbl_percHist1_6.Text = 0
        Me.lbl_percHist1_7.Text = 0
        Me.lbl_percHist1_8.Text = 0
        Me.lbl_percHist1_9.Text = 0
        Me.lbl_percHist1_10.Text = 0
        Me.lbl_percHist1_11.Text = 0
        Me.lbl_percHist1_12.Text = 0

        Me.lbl_percHist2_1.Text = 0
        Me.lbl_percHist2_2.Text = 0
        Me.lbl_percHist2_3.Text = 0
        Me.lbl_percHist2_4.Text = 0
        Me.lbl_percHist2_5.Text = 0
        Me.lbl_percHist2_6.Text = 0
        Me.lbl_percHist2_7.Text = 0
        Me.lbl_percHist2_8.Text = 0
        Me.lbl_percHist2_9.Text = 0
        Me.lbl_percHist2_10.Text = 0
        Me.lbl_percHist2_11.Text = 0
        Me.lbl_percHist2_12.Text = 0

        Me.lbl_percHist3_1.Text = 0
        Me.lbl_percHist3_2.Text = 0
        Me.lbl_percHist3_3.Text = 0
        Me.lbl_percHist3_4.Text = 0
        Me.lbl_percHist3_5.Text = 0
        Me.lbl_percHist3_6.Text = 0
        Me.lbl_percHist3_7.Text = 0
        Me.lbl_percHist3_8.Text = 0
        Me.lbl_percHist3_9.Text = 0
        Me.lbl_percHist3_10.Text = 0
        Me.lbl_percHist3_11.Text = 0
        Me.lbl_percHist3_12.Text = 0

        Me.lbl_percHist4_1.Text = 0
        Me.lbl_percHist4_2.Text = 0
        Me.lbl_percHist4_3.Text = 0
        Me.lbl_percHist4_4.Text = 0
        Me.lbl_percHist4_5.Text = 0
        Me.lbl_percHist4_6.Text = 0
        Me.lbl_percHist4_7.Text = 0
        Me.lbl_percHist4_8.Text = 0
        Me.lbl_percHist4_9.Text = 0
        Me.lbl_percHist4_10.Text = 0
        Me.lbl_percHist4_11.Text = 0
        Me.lbl_percHist4_12.Text = 0

        Me.txt_percMeta01.Text = 0
        Me.txt_percMeta02.Text = 0
        Me.txt_percMeta03.Text = 0
        Me.txt_percMeta04.Text = 0
        Me.txt_percMeta05.Text = 0
        Me.txt_percMeta06.Text = 0
        Me.txt_percMeta07.Text = 0
        Me.txt_percMeta08.Text = 0
        Me.txt_percMeta09.Text = 0
        Me.txt_percMeta10.Text = 0
        Me.txt_percMeta11.Text = 0
        Me.txt_percMeta12.Text = 0
    End Sub

    Sub Atualizar()
        Dim oVem As New VendaEmpresaMes
        Call MudaTitulo()

        Call ZerarCampos()

        Call Busca_Hist4(1)
        Call Busca_Hist4(2)
        Call Busca_Hist4(3)
        Call Busca_Hist4(4)
        Call Busca_Hist4(5)
        Call Busca_Hist4(6)
        Call Busca_Hist4(7)
        Call Busca_Hist4(8)
        Call Busca_Hist4(9)
        Call Busca_Hist4(10)
        Call Busca_Hist4(11)
        Call Busca_Hist4(12)
        Call Totalizar_Hist4()

        Call Busca_Hist3(1)
        Call Busca_Hist3(2)
        Call Busca_Hist3(3)
        Call Busca_Hist3(4)
        Call Busca_Hist3(5)
        Call Busca_Hist3(6)
        Call Busca_Hist3(7)
        Call Busca_Hist3(8)
        Call Busca_Hist3(9)
        Call Busca_Hist3(10)
        Call Busca_Hist3(11)
        Call Busca_Hist3(12)
        Call Totalizar_Hist3()

        Call Busca_Hist2(1)
        Call Busca_Hist2(2)
        Call Busca_Hist2(3)
        Call Busca_Hist2(4)
        Call Busca_Hist2(5)
        Call Busca_Hist2(6)
        Call Busca_Hist2(7)
        Call Busca_Hist2(8)
        Call Busca_Hist2(9)
        Call Busca_Hist2(10)
        Call Busca_Hist2(11)
        Call Busca_Hist2(12)
        Call Totalizar_Hist2()

        Call Busca_Hist1(1)
        Call Busca_Hist1(2)
        Call Busca_Hist1(3)
        Call Busca_Hist1(4)
        Call Busca_Hist1(5)
        Call Busca_Hist1(6)
        Call Busca_Hist1(7)
        Call Busca_Hist1(8)
        Call Busca_Hist1(9)
        Call Busca_Hist1(10)
        Call Busca_Hist1(11)
        Call Busca_Hist1(12)
        Call Totalizar_Hist1()

        'Buscar Meta de Venda Mensal
        oVem.BuscaOriGrupoMes(3, 1, Me.cboAno.CallAno, 1, Me.cboFilial.CallFilial)
        Me.txt_vlrVenda_01.Text = oVem.vlrOri
        oVem.BuscaOriGrupoMes(3, 1, Me.cboAno.CallAno, 2, Me.cboFilial.CallFilial)
        Me.txt_vlrVenda_02.Text = oVem.vlrOri
        oVem.BuscaOriGrupoMes(3, 1, Me.cboAno.CallAno, 3, Me.cboFilial.CallFilial)
        Me.txt_vlrVenda_03.Text = oVem.vlrOri
        oVem.BuscaOriGrupoMes(3, 1, Me.cboAno.CallAno, 4, Me.cboFilial.CallFilial)
        Me.txt_vlrVenda_04.Text = oVem.vlrOri
        oVem.BuscaOriGrupoMes(3, 1, Me.cboAno.CallAno, 5, Me.cboFilial.CallFilial)
        Me.txt_vlrVenda_05.Text = oVem.vlrOri
        oVem.BuscaOriGrupoMes(3, 1, Me.cboAno.CallAno, 6, Me.cboFilial.CallFilial)
        Me.txt_vlrVenda_06.Text = oVem.vlrOri
        oVem.BuscaOriGrupoMes(3, 1, Me.cboAno.CallAno, 7, Me.cboFilial.CallFilial)
        Me.txt_vlrVenda_07.Text = oVem.vlrOri
        oVem.BuscaOriGrupoMes(3, 1, Me.cboAno.CallAno, 8, Me.cboFilial.CallFilial)
        Me.txt_vlrVenda_08.Text = oVem.vlrOri
        oVem.BuscaOriGrupoMes(3, 1, Me.cboAno.CallAno, 9, Me.cboFilial.CallFilial)
        Me.txt_vlrVenda_09.Text = oVem.vlrOri
        oVem.BuscaOriGrupoMes(3, 1, Me.cboAno.CallAno, 10, Me.cboFilial.CallFilial)
        Me.txt_vlrVenda_10.Text = oVem.vlrOri
        oVem.BuscaOriGrupoMes(3, 1, Me.cboAno.CallAno, 11, Me.cboFilial.CallFilial)
        Me.txt_vlrVenda_11.Text = oVem.vlrOri
        oVem.BuscaOriGrupoMes(3, 1, Me.cboAno.CallAno, 12, Me.cboFilial.CallFilial)
        Me.txt_vlrVenda_12.Text = oVem.vlrOri
        Call Totalizar_Venda()

        Call BuscaMetaNoBanco(1)
        Call BuscaMetaNoBanco(2)
        Call BuscaMetaNoBanco(3)
        Call BuscaMetaNoBanco(4)
        Call BuscaMetaNoBanco(5)
        Call BuscaMetaNoBanco(6)
        Call BuscaMetaNoBanco(7)
        Call BuscaMetaNoBanco(8)
        Call BuscaMetaNoBanco(9)
        Call BuscaMetaNoBanco(10)
        Call BuscaMetaNoBanco(11)
        Call BuscaMetaNoBanco(12)
        Call Totalizar()
        Call CalcularPercentualTotal()

        'Buscar % Ano dos Históricos
        Me.lbl_percHist1_Total.Text = 0
        Me.lbl_percHist2_Total.Text = 0
        Me.lbl_percHist3_Total.Text = 0
        Me.lbl_percHist4_Total.Text = 0


        If Me.rnd_Grupo.Checked = True Then

            oVem.BuscaGrupo_ReaAno(Me.cboGrupo_Sub.CallGrupo, Me.cboAno.CallAno - 1, Me.cboFilial.CallFilial)
            Me.lbl_percHist1_Total.Text = oVEM.percOri

            oVem.BuscaGrupo_ReaAno(Me.cboGrupo_Sub.CallGrupo, Me.cboAno.CallAno - 2, Me.cboFilial.CallFilial)
            Me.lbl_percHist2_Total.Text = oVEM.percOri

            oVem.BuscaGrupo_ReaAno(Me.cboGrupo_Sub.CallGrupo, Me.cboAno.CallAno - 3, Me.cboFilial.CallFilial)
            Me.lbl_percHist3_Total.Text = oVEM.percOri

            oVem.BuscaGrupo_ReaAno(Me.cboGrupo_Sub.CallGrupo, Me.cboAno.CallAno - 4, Me.cboFilial.CallFilial)
            Me.lbl_percHist4_Total.Text = oVEM.percOri
        End If

        If Me.rnd_Subgrupo.Checked = True Then
            oVem.BuscaSubgrupo_ReaAno(Me.cboGrupo_Sub.CallGrupo, Me.cboAno.CallAno - 1, Me.cboFilial.CallFilial)
            Me.lbl_percHist1_Total.Text = oVEM.percOri

            oVem.BuscaSubgrupo_ReaAno(Me.cboGrupo_Sub.CallGrupo, Me.cboAno.CallAno - 2, Me.cboFilial.CallFilial)
            Me.lbl_percHist2_Total.Text = oVEM.percOri

            oVem.BuscaSubgrupo_ReaAno(Me.cboGrupo_Sub.CallGrupo, Me.cboAno.CallAno - 3, Me.cboFilial.CallFilial)
            Me.lbl_percHist3_Total.Text = oVEM.percOri

            oVem.BuscaSubgrupo_ReaAno(Me.cboGrupo_Sub.CallGrupo, Me.cboAno.CallAno - 4, Me.cboFilial.CallFilial)
            Me.lbl_percHist4_Total.Text = oVEM.percOri
        End If

        Me.lblOBS.Text = oVem.varDesc

        Call MudarNegativoParaVermelho()

    End Sub


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Call TipoTrigger()
        Call Definir_varFilial()
    End Sub

    Sub Totalizar_Hist4()
        Dim no As Double
        Dim Mes01, Mes02, Mes03, Mes04, Mes05, Mes06, Mes07, Mes08, Mes09, Mes10, Mes11, Mes12 As Double
        Dim Perc01, Perc02, Perc03, Perc04, Perc05, Perc06, Perc07, Perc08, Perc09, Perc10, Perc11, Perc12 As Double

        Double.TryParse(lbl_vlrHist4_Total.Text, no)

        Mes01 = CDbl(Me.lbl_vlrHist4_1.Text)
        Mes02 = CDbl(Me.lbl_vlrHist4_2.Text)
        Mes03 = CDbl(Me.lbl_vlrHist4_3.Text)
        Mes04 = CDbl(Me.lbl_vlrHist4_4.Text)
        Mes05 = CDbl(Me.lbl_vlrHist4_5.Text)
        Mes06 = CDbl(Me.lbl_vlrHist4_6.Text)
        Mes07 = CDbl(Me.lbl_vlrHist4_7.Text)
        Mes08 = CDbl(Me.lbl_vlrHist4_8.Text)
        Mes09 = CDbl(Me.lbl_vlrHist4_9.Text)
        Mes10 = CDbl(Me.lbl_vlrHist4_10.Text)
        Mes11 = CDbl(Me.lbl_vlrHist4_11.Text)
        Mes12 = CDbl(Me.lbl_vlrHist4_12.Text)
        Mes12 = CDbl(Me.lbl_vlrHist4_12.Text)

        Perc01 = CDbl(Me.lbl_percHist4_1.Text)
        Perc02 = CDbl(Me.lbl_percHist4_2.Text)
        Perc03 = CDbl(Me.lbl_percHist4_3.Text)
        Perc04 = CDbl(Me.lbl_percHist4_4.Text)
        Perc05 = CDbl(Me.lbl_percHist4_5.Text)
        Perc06 = CDbl(Me.lbl_percHist4_6.Text)
        Perc07 = CDbl(Me.lbl_percHist4_7.Text)
        Perc08 = CDbl(Me.lbl_percHist4_8.Text)
        Perc09 = CDbl(Me.lbl_percHist4_9.Text)
        Perc10 = CDbl(Me.lbl_percHist4_10.Text)
        Perc11 = CDbl(Me.lbl_percHist4_11.Text)
        Perc12 = CDbl(Me.lbl_percHist4_12.Text)

        no = 0
        no += Mes01
        no += Mes02
        no += Mes03
        no += Mes04
        no += Mes05
        no += Mes06
        no += Mes07
        no += Mes08
        no += Mes09
        no += Mes10
        no += Mes11
        no += Mes12

        Me.lbl_vlrHist4_1.Text = CSng(Mes01).ToString("n0")
        Me.lbl_vlrHist4_2.Text = CSng(Mes02).ToString("n0")
        Me.lbl_vlrHist4_3.Text = CSng(Mes03).ToString("n0")
        Me.lbl_vlrHist4_4.Text = CSng(Mes04).ToString("n0")
        Me.lbl_vlrHist4_5.Text = CSng(Mes05).ToString("n0")
        Me.lbl_vlrHist4_6.Text = CSng(Mes06).ToString("n0")
        Me.lbl_vlrHist4_7.Text = CSng(Mes07).ToString("n0")
        Me.lbl_vlrHist4_8.Text = CSng(Mes08).ToString("n0")
        Me.lbl_vlrHist4_9.Text = CSng(Mes09).ToString("n0")
        Me.lbl_vlrHist4_10.Text = CSng(Mes10).ToString("n0")
        Me.lbl_vlrHist4_11.Text = CSng(Mes11).ToString("n0")
        Me.lbl_vlrHist4_12.Text = CSng(Mes12).ToString("n0")

        Me.lbl_percHist4_1.Text = CSng(Perc01).ToString("n2")
        Me.lbl_percHist4_2.Text = CSng(Perc02).ToString("n2")
        Me.lbl_percHist4_3.Text = CSng(Perc03).ToString("n2")
        Me.lbl_percHist4_4.Text = CSng(Perc04).ToString("n2")
        Me.lbl_percHist4_5.Text = CSng(Perc05).ToString("n2")
        Me.lbl_percHist4_6.Text = CSng(Perc06).ToString("n2")
        Me.lbl_percHist4_7.Text = CSng(Perc07).ToString("n2")
        Me.lbl_percHist4_8.Text = CSng(Perc08).ToString("n2")
        Me.lbl_percHist4_9.Text = CSng(Perc09).ToString("n2")
        Me.lbl_percHist4_10.Text = CSng(Perc10).ToString("n2")
        Me.lbl_percHist4_11.Text = CSng(Perc11).ToString("n2")
        Me.lbl_percHist4_12.Text = CSng(Perc12).ToString("n2")

        Me.lbl_vlrHist4_Total.Text = CDbl(no).ToString("n0")

    End Sub

    Sub Totalizar_Hist3()
        Dim no As Double
        Dim Mes01, Mes02, Mes03, Mes04, Mes05, Mes06, Mes07, Mes08, Mes09, Mes10, Mes11, Mes12 As Double
        Dim Perc01, Perc02, Perc03, Perc04, Perc05, Perc06, Perc07, Perc08, Perc09, Perc10, Perc11, Perc12 As Double

        Double.TryParse(lbl_vlrHist3_Total.Text, no)

        Mes01 = CDbl(Me.lbl_vlrHist3_1.Text)
        Mes02 = CDbl(Me.lbl_vlrHist3_2.Text)
        Mes03 = CDbl(Me.lbl_vlrHist3_3.Text)
        Mes04 = CDbl(Me.lbl_vlrHist3_4.Text)
        Mes05 = CDbl(Me.lbl_vlrHist3_5.Text)
        Mes06 = CDbl(Me.lbl_vlrHist3_6.Text)
        Mes07 = CDbl(Me.lbl_vlrHist3_7.Text)
        Mes08 = CDbl(Me.lbl_vlrHist3_8.Text)
        Mes09 = CDbl(Me.lbl_vlrHist3_9.Text)
        Mes10 = CDbl(Me.lbl_vlrHist3_10.Text)
        Mes11 = CDbl(Me.lbl_vlrHist3_11.Text)
        Mes12 = CDbl(Me.lbl_vlrHist3_12.Text)
        Mes12 = CDbl(Me.lbl_vlrHist3_12.Text)

        Perc01 = CDbl(Me.lbl_percHist3_1.Text)
        Perc02 = CDbl(Me.lbl_percHist3_2.Text)
        Perc03 = CDbl(Me.lbl_percHist3_3.Text)
        Perc04 = CDbl(Me.lbl_percHist3_4.Text)
        Perc05 = CDbl(Me.lbl_percHist3_5.Text)
        Perc06 = CDbl(Me.lbl_percHist3_6.Text)
        Perc07 = CDbl(Me.lbl_percHist3_7.Text)
        Perc08 = CDbl(Me.lbl_percHist3_8.Text)
        Perc09 = CDbl(Me.lbl_percHist3_9.Text)
        Perc10 = CDbl(Me.lbl_percHist3_10.Text)
        Perc11 = CDbl(Me.lbl_percHist3_11.Text)
        Perc12 = CDbl(Me.lbl_percHist3_12.Text)

        no = 0
        no += Mes01
        no += Mes02
        no += Mes03
        no += Mes04
        no += Mes05
        no += Mes06
        no += Mes07
        no += Mes08
        no += Mes09
        no += Mes10
        no += Mes11
        no += Mes12

        Me.lbl_vlrHist3_1.Text = CSng(Mes01).ToString("n0")
        Me.lbl_vlrHist3_2.Text = CSng(Mes02).ToString("n0")
        Me.lbl_vlrHist3_3.Text = CSng(Mes03).ToString("n0")
        Me.lbl_vlrHist3_4.Text = CSng(Mes04).ToString("n0")
        Me.lbl_vlrHist3_5.Text = CSng(Mes05).ToString("n0")
        Me.lbl_vlrHist3_6.Text = CSng(Mes06).ToString("n0")
        Me.lbl_vlrHist3_7.Text = CSng(Mes07).ToString("n0")
        Me.lbl_vlrHist3_8.Text = CSng(Mes08).ToString("n0")
        Me.lbl_vlrHist3_9.Text = CSng(Mes09).ToString("n0")
        Me.lbl_vlrHist3_10.Text = CSng(Mes10).ToString("n0")
        Me.lbl_vlrHist3_11.Text = CSng(Mes11).ToString("n0")
        Me.lbl_vlrHist3_12.Text = CSng(Mes12).ToString("n0")

        Me.lbl_percHist3_1.Text = CSng(Perc01).ToString("n2")
        Me.lbl_percHist3_2.Text = CSng(Perc02).ToString("n2")
        Me.lbl_percHist3_3.Text = CSng(Perc03).ToString("n2")
        Me.lbl_percHist3_4.Text = CSng(Perc04).ToString("n2")
        Me.lbl_percHist3_5.Text = CSng(Perc05).ToString("n2")
        Me.lbl_percHist3_6.Text = CSng(Perc06).ToString("n2")
        Me.lbl_percHist3_7.Text = CSng(Perc07).ToString("n2")
        Me.lbl_percHist3_8.Text = CSng(Perc08).ToString("n2")
        Me.lbl_percHist3_9.Text = CSng(Perc09).ToString("n2")
        Me.lbl_percHist3_10.Text = CSng(Perc10).ToString("n2")
        Me.lbl_percHist3_11.Text = CSng(Perc11).ToString("n2")
        Me.lbl_percHist3_12.Text = CSng(Perc12).ToString("n2")

        Me.lbl_vlrHist3_Total.Text = CDbl(no).ToString("n0")

    End Sub

    Sub Totalizar_Hist2()
        On Error Resume Next
        Dim no As Double
        Dim Mes01, Mes02, Mes03, Mes04, Mes05, Mes06, Mes07, Mes08, Mes09, Mes10, Mes11, Mes12 As Double
        Dim Perc01, Perc02, Perc03, Perc04, Perc05, Perc06, Perc07, Perc08, Perc09, Perc10, Perc11, Perc12 As Double

        Double.TryParse(lbl_vlrHist2_Total.Text, no)

        Mes01 = CDbl(Me.lbl_vlrHist2_1.Text)
        Mes02 = CDbl(Me.lbl_vlrHist2_2.Text)
        Mes03 = CDbl(Me.lbl_vlrHist2_3.Text)
        Mes04 = CDbl(Me.lbl_vlrHist2_4.Text)
        Mes05 = CDbl(Me.lbl_vlrHist2_5.Text)
        Mes06 = CDbl(Me.lbl_vlrHist2_6.Text)
        Mes07 = CDbl(Me.lbl_vlrHist2_7.Text)
        Mes08 = CDbl(Me.lbl_vlrHist2_8.Text)
        Mes09 = CDbl(Me.lbl_vlrHist2_9.Text)
        Mes10 = CDbl(Me.lbl_vlrHist2_10.Text)
        Mes11 = CDbl(Me.lbl_vlrHist2_11.Text)
        Mes12 = CDbl(Me.lbl_vlrHist2_12.Text)
        Mes12 = CDbl(Me.lbl_vlrHist2_12.Text)

        Perc01 = CDbl(Me.lbl_percHist2_1.Text)
        Perc02 = CDbl(Me.lbl_percHist2_2.Text)
        Perc03 = CDbl(Me.lbl_percHist2_3.Text)
        Perc04 = CDbl(Me.lbl_percHist2_4.Text)
        Perc05 = CDbl(Me.lbl_percHist2_5.Text)
        Perc06 = CDbl(Me.lbl_percHist2_6.Text)
        Perc07 = CDbl(Me.lbl_percHist2_7.Text)
        Perc08 = CDbl(Me.lbl_percHist2_8.Text)
        Perc09 = CDbl(Me.lbl_percHist2_9.Text)
        Perc10 = CDbl(Me.lbl_percHist2_10.Text)
        Perc11 = CDbl(Me.lbl_percHist2_11.Text)
        Perc12 = CDbl(Me.lbl_percHist2_12.Text)

        no = 0
        no += Mes01
        no += Mes02
        no += Mes03
        no += Mes04
        no += Mes05
        no += Mes06
        no += Mes07
        no += Mes08
        no += Mes09
        no += Mes10
        no += Mes11
        no += Mes12

        Me.lbl_vlrHist2_1.Text = CSng(Mes01).ToString("n0")
        Me.lbl_vlrHist2_2.Text = CSng(Mes02).ToString("n0")
        Me.lbl_vlrHist2_3.Text = CSng(Mes03).ToString("n0")
        Me.lbl_vlrHist2_4.Text = CSng(Mes04).ToString("n0")
        Me.lbl_vlrHist2_5.Text = CSng(Mes05).ToString("n0")
        Me.lbl_vlrHist2_6.Text = CSng(Mes06).ToString("n0")
        Me.lbl_vlrHist2_7.Text = CSng(Mes07).ToString("n0")
        Me.lbl_vlrHist2_8.Text = CSng(Mes08).ToString("n0")
        Me.lbl_vlrHist2_9.Text = CSng(Mes09).ToString("n0")
        Me.lbl_vlrHist2_10.Text = CSng(Mes10).ToString("n0")
        Me.lbl_vlrHist2_11.Text = CSng(Mes11).ToString("n0")
        Me.lbl_vlrHist2_12.Text = CSng(Mes12).ToString("n0")

        Me.lbl_percHist2_1.Text = CSng(Perc01).ToString("n2")
        Me.lbl_percHist2_2.Text = CSng(Perc02).ToString("n2")
        Me.lbl_percHist2_3.Text = CSng(Perc03).ToString("n2")
        Me.lbl_percHist2_4.Text = CSng(Perc04).ToString("n2")
        Me.lbl_percHist2_5.Text = CSng(Perc05).ToString("n2")
        Me.lbl_percHist2_6.Text = CSng(Perc06).ToString("n2")
        Me.lbl_percHist2_7.Text = CSng(Perc07).ToString("n2")
        Me.lbl_percHist2_8.Text = CSng(Perc08).ToString("n2")
        Me.lbl_percHist2_9.Text = CSng(Perc09).ToString("n2")
        Me.lbl_percHist2_10.Text = CSng(Perc10).ToString("n2")
        Me.lbl_percHist2_11.Text = CSng(Perc11).ToString("n2")
        Me.lbl_percHist2_12.Text = CSng(Perc12).ToString("n2")

        Me.lbl_vlrHist2_Total.Text = CDbl(no).ToString("n0")

    End Sub

    Sub Totalizar_Hist1()
        On Error Resume Next
        Dim no As Double
        Dim Mes01, Mes02, Mes03, Mes04, Mes05, Mes06, Mes07, Mes08, Mes09, Mes10, Mes11, Mes12 As Double
        Dim Perc01, Perc02, Perc03, Perc04, Perc05, Perc06, Perc07, Perc08, Perc09, Perc10, Perc11, Perc12 As Double

        Double.TryParse(lbl_vlrHist1_Total.Text, no)

        Mes01 = CDbl(Me.lbl_vlrHist1_1.Text)
        Mes02 = CDbl(Me.lbl_vlrHist1_2.Text)
        Mes03 = CDbl(Me.lbl_vlrHist1_3.Text)
        Mes04 = CDbl(Me.lbl_vlrHist1_4.Text)
        Mes05 = CDbl(Me.lbl_vlrHist1_5.Text)
        Mes06 = CDbl(Me.lbl_vlrHist1_6.Text)
        Mes07 = CDbl(Me.lbl_vlrHist1_7.Text)
        Mes08 = CDbl(Me.lbl_vlrHist1_8.Text)
        Mes09 = CDbl(Me.lbl_vlrHist1_9.Text)
        Mes10 = CDbl(Me.lbl_vlrHist1_10.Text)
        Mes11 = CDbl(Me.lbl_vlrHist1_11.Text)
        Mes12 = CDbl(Me.lbl_vlrHist1_12.Text)
        Mes12 = CDbl(Me.lbl_vlrHist1_12.Text)

        If Me.lbl_percHist1_1.Text = "" Then
            Perc01 = 0
        Else
            Perc01 = CDbl(Me.lbl_percHist1_1.Text)
        End If

        If Me.lbl_percHist1_2.Text = "" Then
            Perc02 = 0
        Else
            Perc02 = CDbl(Me.lbl_percHist1_2.Text)
        End If

        If Me.lbl_percHist1_3.Text = "" Then
            Perc03 = 0
        Else
            Perc03 = CDbl(Me.lbl_percHist1_3.Text)
        End If

        If Me.lbl_percHist1_4.Text = "" Then
            Perc04 = 0
        Else
            Perc04 = CDbl(Me.lbl_percHist1_4.Text)
        End If

        If Me.lbl_percHist1_5.Text = "" Then
            Perc05 = 0
        Else
            Perc05 = CDbl(Me.lbl_percHist1_5.Text)
        End If

        If Me.lbl_percHist1_6.Text = "" Then
            Perc06 = 0
        Else
            Perc06 = CDbl(Me.lbl_percHist1_6.Text)
        End If

        If Me.lbl_percHist1_7.Text = "" Then
            Perc07 = 0
        Else
            Perc07 = CDbl(Me.lbl_percHist1_7.Text)
        End If

        If Me.lbl_percHist1_8.Text = "" Then
            Perc08 = 0
        Else
            Perc08 = CDbl(Me.lbl_percHist1_8.Text)
        End If

        If Me.lbl_percHist1_9.Text = "" Then
            Perc09 = 0
        Else
            Perc09 = CDbl(Me.lbl_percHist1_9.Text)
        End If

        If Me.lbl_percHist1_10.Text = "" Then
            Perc10 = 0
        Else
            Perc10 = CDbl(Me.lbl_percHist1_10.Text)
        End If

        If Me.lbl_percHist1_11.Text = "" Then
            Perc11 = 0
        Else
            Perc11 = CDbl(Me.lbl_percHist1_11.Text)
        End If

        If Me.lbl_percHist1_12.Text = "" Then
            Perc12 = 0
        Else
            Perc12 = CDbl(Me.lbl_percHist1_12.Text)
        End If

        no = 0
        no += Mes01
        no += Mes02
        no += Mes03
        no += Mes04
        no += Mes05
        no += Mes06
        no += Mes07
        no += Mes08
        no += Mes09
        no += Mes10
        no += Mes11
        no += Mes12

        Me.lbl_vlrHist1_1.Text = CSng(Mes01).ToString("n0")
        Me.lbl_vlrHist1_2.Text = CSng(Mes02).ToString("n0")
        Me.lbl_vlrHist1_3.Text = CSng(Mes03).ToString("n0")
        Me.lbl_vlrHist1_4.Text = CSng(Mes04).ToString("n0")
        Me.lbl_vlrHist1_5.Text = CSng(Mes05).ToString("n0")
        Me.lbl_vlrHist1_6.Text = CSng(Mes06).ToString("n0")
        Me.lbl_vlrHist1_7.Text = CSng(Mes07).ToString("n0")
        Me.lbl_vlrHist1_8.Text = CSng(Mes08).ToString("n0")
        Me.lbl_vlrHist1_9.Text = CSng(Mes09).ToString("n0")
        Me.lbl_vlrHist1_10.Text = CSng(Mes10).ToString("n0")
        Me.lbl_vlrHist1_11.Text = CSng(Mes11).ToString("n0")
        Me.lbl_vlrHist1_12.Text = CSng(Mes12).ToString("n0")

        Me.lbl_percHist1_1.Text = CSng(Perc01).ToString("n2")
        Me.lbl_percHist1_2.Text = CSng(Perc02).ToString("n2")
        Me.lbl_percHist1_3.Text = CSng(Perc03).ToString("n2")
        Me.lbl_percHist1_4.Text = CSng(Perc04).ToString("n2")
        Me.lbl_percHist1_5.Text = CSng(Perc05).ToString("n2")
        Me.lbl_percHist1_6.Text = CSng(Perc06).ToString("n2")
        Me.lbl_percHist1_7.Text = CSng(Perc07).ToString("n2")
        Me.lbl_percHist1_8.Text = CSng(Perc08).ToString("n2")
        Me.lbl_percHist1_9.Text = CSng(Perc09).ToString("n2")
        Me.lbl_percHist1_10.Text = CSng(Perc10).ToString("n2")
        Me.lbl_percHist1_11.Text = CSng(Perc11).ToString("n2")
        Me.lbl_percHist1_12.Text = CSng(Perc12).ToString("n2")

        Me.lbl_vlrHist1_Total.Text = CDbl(no).ToString("n0")

    End Sub

    Sub Totalizar_Venda()
        Dim no As Double
        Dim Mes01, Mes02, Mes03, Mes04, Mes05, Mes06, Mes07, Mes08, Mes09, Mes10, Mes11, Mes12 As Double

        Double.TryParse(txt_vlrVenda_Total.Text, no)

        If Me.txt_vlrVenda_01.Text = "" Then Me.txt_vlrVenda_01.Text = 0
        If Me.txt_vlrVenda_02.Text = "" Then Me.txt_vlrVenda_02.Text = 0
        If Me.txt_vlrVenda_03.Text = "" Then Me.txt_vlrVenda_03.Text = 0
        If Me.txt_vlrVenda_04.Text = "" Then Me.txt_vlrVenda_04.Text = 0
        If Me.txt_vlrVenda_05.Text = "" Then Me.txt_vlrVenda_05.Text = 0
        If Me.txt_vlrVenda_06.Text = "" Then Me.txt_vlrVenda_06.Text = 0
        If Me.txt_vlrVenda_07.Text = "" Then Me.txt_vlrVenda_07.Text = 0
        If Me.txt_vlrVenda_08.Text = "" Then Me.txt_vlrVenda_08.Text = 0
        If Me.txt_vlrVenda_09.Text = "" Then Me.txt_vlrVenda_09.Text = 0
        If Me.txt_vlrVenda_10.Text = "" Then Me.txt_vlrVenda_10.Text = 0
        If Me.txt_vlrVenda_11.Text = "" Then Me.txt_vlrVenda_11.Text = 0
        If Me.txt_vlrVenda_12.Text = "" Then Me.txt_vlrVenda_12.Text = 0

        Mes01 = CDbl(Me.txt_vlrVenda_01.Text)
        Mes02 = CDbl(Me.txt_vlrVenda_02.Text)
        Mes03 = CDbl(Me.txt_vlrVenda_03.Text)
        Mes04 = CDbl(Me.txt_vlrVenda_04.Text)
        Mes05 = CDbl(Me.txt_vlrVenda_05.Text)
        Mes06 = CDbl(Me.txt_vlrVenda_06.Text)
        Mes07 = CDbl(Me.txt_vlrVenda_07.Text)
        Mes08 = CDbl(Me.txt_vlrVenda_08.Text)
        Mes09 = CDbl(Me.txt_vlrVenda_09.Text)
        Mes10 = CDbl(Me.txt_vlrVenda_10.Text)
        Mes11 = CDbl(Me.txt_vlrVenda_11.Text)
        Mes12 = CDbl(Me.txt_vlrVenda_12.Text)

        no = 0
        no += Mes01
        no += Mes02
        no += Mes03
        no += Mes04
        no += Mes05
        no += Mes06
        no += Mes07
        no += Mes08
        no += Mes09
        no += Mes10
        no += Mes11
        no += Mes12

        Me.txt_vlrVenda_01.Text = CDbl(Mes01).ToString("n0")
        Me.txt_vlrVenda_02.Text = CDbl(Mes02).ToString("n0")
        Me.txt_vlrVenda_03.Text = CDbl(Mes03).ToString("n0")
        Me.txt_vlrVenda_04.Text = CDbl(Mes04).ToString("n0")
        Me.txt_vlrVenda_05.Text = CDbl(Mes05).ToString("n0")
        Me.txt_vlrVenda_06.Text = CDbl(Mes06).ToString("n0")
        Me.txt_vlrVenda_07.Text = CDbl(Mes07).ToString("n0")
        Me.txt_vlrVenda_08.Text = CDbl(Mes08).ToString("n0")
        Me.txt_vlrVenda_09.Text = CDbl(Mes09).ToString("n0")
        Me.txt_vlrVenda_10.Text = CDbl(Mes10).ToString("n0")
        Me.txt_vlrVenda_11.Text = CDbl(Mes11).ToString("n0")
        Me.txt_vlrVenda_12.Text = CDbl(Mes12).ToString("n0")

        Me.txt_vlrVenda_Total.Text = CDbl(no).ToString("n0")
    End Sub

    Sub Totalizar()
        Dim no As Double
        Dim Mes01, Mes02, Mes03, Mes04, Mes05, Mes06, Mes07, Mes08, Mes09, Mes10, Mes11, Mes12 As Double

        Double.TryParse(lbl_vlrMetaTotal.Text, no)

        If Me.txt_vlrMeta01.Text = "" Then Me.txt_vlrMeta01.Text = 0
        If Me.txt_vlrMeta02.Text = "" Then Me.txt_vlrMeta02.Text = 0
        If Me.txt_vlrMeta03.Text = "" Then Me.txt_vlrMeta03.Text = 0
        If Me.txt_vlrMeta04.Text = "" Then Me.txt_vlrMeta04.Text = 0
        If Me.txt_vlrMeta05.Text = "" Then Me.txt_vlrMeta05.Text = 0
        If Me.txt_vlrMeta06.Text = "" Then Me.txt_vlrMeta06.Text = 0
        If Me.txt_vlrMeta07.Text = "" Then Me.txt_vlrMeta07.Text = 0
        If Me.txt_vlrMeta08.Text = "" Then Me.txt_vlrMeta08.Text = 0
        If Me.txt_vlrMeta09.Text = "" Then Me.txt_vlrMeta09.Text = 0
        If Me.txt_vlrMeta10.Text = "" Then Me.txt_vlrMeta10.Text = 0
        If Me.txt_vlrMeta11.Text = "" Then Me.txt_vlrMeta11.Text = 0
        If Me.txt_vlrMeta12.Text = "" Then Me.txt_vlrMeta12.Text = 0

        Mes01 = CDbl(Me.txt_vlrMeta01.Text)
        Mes02 = CDbl(Me.txt_vlrMeta02.Text)
        Mes03 = CDbl(Me.txt_vlrMeta03.Text)
        Mes04 = CDbl(Me.txt_vlrMeta04.Text)
        Mes05 = CDbl(Me.txt_vlrMeta05.Text)
        Mes06 = CDbl(Me.txt_vlrMeta06.Text)
        Mes07 = CDbl(Me.txt_vlrMeta07.Text)
        Mes08 = CDbl(Me.txt_vlrMeta08.Text)
        Mes09 = CDbl(Me.txt_vlrMeta09.Text)
        Mes10 = CDbl(Me.txt_vlrMeta10.Text)
        Mes11 = CDbl(Me.txt_vlrMeta11.Text)
        Mes12 = CDbl(Me.txt_vlrMeta12.Text)

        no = 0
        no += Mes01
        no += Mes02
        no += Mes03
        no += Mes04
        no += Mes05
        no += Mes06
        no += Mes07
        no += Mes08
        no += Mes09
        no += Mes10
        no += Mes11
        no += Mes12

        Me.txt_vlrMeta01.Text = CDbl(Mes01).ToString("n0")
        Me.txt_vlrMeta02.Text = CDbl(Mes02).ToString("n0")
        Me.txt_vlrMeta03.Text = CDbl(Mes03).ToString("n0")
        Me.txt_vlrMeta04.Text = CDbl(Mes04).ToString("n0")
        Me.txt_vlrMeta05.Text = CDbl(Mes05).ToString("n0")
        Me.txt_vlrMeta06.Text = CDbl(Mes06).ToString("n0")
        Me.txt_vlrMeta07.Text = CDbl(Mes07).ToString("n0")
        Me.txt_vlrMeta08.Text = CDbl(Mes08).ToString("n0")
        Me.txt_vlrMeta09.Text = CDbl(Mes09).ToString("n0")
        Me.txt_vlrMeta10.Text = CDbl(Mes10).ToString("n0")
        Me.txt_vlrMeta11.Text = CDbl(Mes11).ToString("n0")
        Me.txt_vlrMeta12.Text = CDbl(Mes12).ToString("n0")

        Me.lbl_vlrMetaTotal.Text = CDbl(no).ToString("n0")

        'If CSng(Me.txt_vlrMeta01.Text) < 0 Then Me.txt_vlrMeta01.ForeColor = Drawing.Color.Red

        ''If CSng(Me.txt_vlrMeta01.Text) >= 0 Then Me.txt_vlrMeta01.ForeColor = Drawing.Color.Black

    End Sub

    Protected Sub rnd_Subgrupo_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rnd_Subgrupo.CheckedChanged
        Call TipoTrigger()
        Call Atualizar()
        Call CalcularTodosPercentuaisMeta()
    End Sub

    Sub CalcularPercentualTotal()
        If Me.lbl_vlrMetaTotal.Text <> 0 Then
            Me.lbl_percMetaTotal.Text = ((Me.lbl_vlrMetaTotal.Text / Me.txt_vlrVenda_Total.Text) * 100).ToString("n2")
        Else
            Me.lbl_percMetaTotal.Text = 0
        End If
    End Sub

    Protected Sub txt_vlrMeta01_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta01.TextChanged
        Call Totalizar()
        Me.txt_percMeta01.Text = ((Me.txt_vlrMeta01.Text / Me.txt_vlrVenda_01.Text) * 100).ToString("n2")
        Call CalcularPercentualTotal()
        Me.txt_vlrMeta02.Focus()
    End Sub

    Protected Sub txt_vlrMeta02_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta02.TextChanged
        Call Totalizar()
        Me.txt_percMeta02.Text = ((Me.txt_vlrMeta02.Text / Me.txt_vlrVenda_02.Text) * 100).ToString("n2")
        Call CalcularPercentualTotal()
        Me.txt_vlrMeta03.Focus()
    End Sub

    Protected Sub txt_vlrMeta03_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta03.TextChanged
        Call Totalizar()
        Me.txt_percMeta03.Text = ((Me.txt_vlrMeta03.Text / Me.txt_vlrVenda_03.Text) * 100).ToString("n2")
        Call CalcularPercentualTotal()
        Me.txt_vlrMeta04.Focus()
    End Sub

    Protected Sub txt_vlrMeta04_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta04.TextChanged
        Call Totalizar()
        Me.txt_percMeta04.Text = ((Me.txt_vlrMeta04.Text / Me.txt_vlrVenda_04.Text) * 100).ToString("n2")
        Call CalcularPercentualTotal()
        Me.txt_vlrMeta05.Focus()
    End Sub

    Protected Sub txt_vlrMeta05_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta05.TextChanged
        Call Totalizar()
        Me.txt_percMeta05.Text = ((Me.txt_vlrMeta05.Text / Me.txt_vlrVenda_05.Text) * 100).ToString("n2")
        Call CalcularPercentualTotal()
        Me.txt_vlrMeta06.Focus()
    End Sub

    Protected Sub txt_vlrMeta06_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta06.TextChanged
        Call Totalizar()
        Me.txt_percMeta06.Text = ((Me.txt_vlrMeta06.Text / Me.txt_vlrVenda_06.Text) * 100).ToString("n2")
        Call CalcularPercentualTotal()
        Me.txt_vlrMeta07.Focus()
    End Sub

    Protected Sub txt_vlrMeta07_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta07.TextChanged
        Call Totalizar()
        Me.txt_percMeta07.Text = ((Me.txt_vlrMeta07.Text / Me.txt_vlrVenda_07.Text) * 100).ToString("n2")
        Call CalcularPercentualTotal()
        Me.txt_vlrMeta08.Focus()
    End Sub

    Protected Sub txt_vlrMeta08_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta08.TextChanged
        Call Totalizar()
        Me.txt_percMeta08.Text = ((Me.txt_vlrMeta08.Text / Me.txt_vlrVenda_08.Text) * 100).ToString("n2")
        Call CalcularPercentualTotal()
        Me.txt_vlrMeta09.Focus()
    End Sub

    Protected Sub txt_vlrMeta09_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta09.TextChanged
        Call Totalizar()
        Me.txt_percMeta09.Text = ((Me.txt_vlrMeta09.Text / Me.txt_vlrVenda_09.Text) * 100).ToString("n2")
        Call CalcularPercentualTotal()
        Me.txt_vlrMeta10.Focus()
    End Sub

    Protected Sub txt_vlrMeta10_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta10.TextChanged
        Call Totalizar()
        Me.txt_percMeta10.Text = ((Me.txt_vlrMeta10.Text / Me.txt_vlrVenda_10.Text) * 100).ToString("n2")
        Call CalcularPercentualTotal()
        Me.txt_vlrMeta11.Focus()
    End Sub

    Protected Sub txt_vlrMeta11_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta11.TextChanged
        Call Totalizar()
        Me.txt_percMeta11.Text = ((Me.txt_vlrMeta11.Text / Me.txt_vlrVenda_11.Text) * 100).ToString("n2")
        Call CalcularPercentualTotal()
        Me.txt_vlrMeta12.Focus()
    End Sub

    Protected Sub txt_vlrMeta12_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_vlrMeta12.TextChanged
        Call Totalizar()
        Me.txt_percMeta12.Text = ((Me.txt_vlrMeta12.Text / Me.txt_vlrVenda_12.Text) * 100).ToString("n2")
        Call CalcularPercentualTotal()
        Me.txt_vlrMeta01.Focus()
    End Sub

    Protected Sub txt_percMeta01_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percMeta01.TextChanged

        Me.txt_vlrMeta01.Text = ((Me.txt_vlrVenda_01.Text * Me.txt_percMeta01.Text) / 100).ToString("n")
        Call Totalizar()
        Call CalcularPercentualTotal()
        Call PercMetaFormata()
        Me.txt_percMeta02.Focus()

    End Sub

    Sub PercMetaFormata()
        If Me.txt_vlrMeta01.Text = 0 Then Me.txt_percMeta01.Text = 0
        If Me.txt_vlrMeta02.Text = 0 Then Me.txt_percMeta02.Text = 0
        If Me.txt_vlrMeta03.Text = 0 Then Me.txt_percMeta03.Text = 0
        If Me.txt_vlrMeta04.Text = 0 Then Me.txt_percMeta04.Text = 0
        If Me.txt_vlrMeta05.Text = 0 Then Me.txt_percMeta05.Text = 0
        If Me.txt_vlrMeta06.Text = 0 Then Me.txt_percMeta06.Text = 0
        If Me.txt_vlrMeta07.Text = 0 Then Me.txt_percMeta07.Text = 0
        If Me.txt_vlrMeta08.Text = 0 Then Me.txt_percMeta08.Text = 0
        If Me.txt_vlrMeta09.Text = 0 Then Me.txt_percMeta09.Text = 0
        If Me.txt_vlrMeta10.Text = 0 Then Me.txt_percMeta10.Text = 0
        If Me.txt_vlrMeta11.Text = 0 Then Me.txt_percMeta11.Text = 0
        If Me.txt_vlrMeta12.Text = 0 Then Me.txt_percMeta12.Text = 0

        Me.txt_percMeta01.Text = (Me.txt_percMeta01.Text * 1).ToString("n2")
        Me.txt_percMeta02.Text = (Me.txt_percMeta02.Text * 1).ToString("n2")
        Me.txt_percMeta03.Text = (Me.txt_percMeta03.Text * 1).ToString("n2")
        Me.txt_percMeta04.Text = (Me.txt_percMeta04.Text * 1).ToString("n2")
        Me.txt_percMeta05.Text = (Me.txt_percMeta05.Text * 1).ToString("n2")
        Me.txt_percMeta06.Text = (Me.txt_percMeta06.Text * 1).ToString("n2")
        Me.txt_percMeta07.Text = (Me.txt_percMeta07.Text * 1).ToString("n2")
        Me.txt_percMeta08.Text = (Me.txt_percMeta08.Text * 1).ToString("n2")
        Me.txt_percMeta09.Text = (Me.txt_percMeta09.Text * 1).ToString("n2")
        Me.txt_percMeta10.Text = (Me.txt_percMeta10.Text * 1).ToString("n2")
        Me.txt_percMeta11.Text = (Me.txt_percMeta11.Text * 1).ToString("n2")
        Me.txt_percMeta12.Text = (Me.txt_percMeta12.Text * 1).ToString("n2")

    End Sub

    Protected Sub txt_percMeta02_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percMeta02.TextChanged
        Me.txt_vlrMeta02.Text = ((Me.txt_vlrVenda_02.Text * Me.txt_percMeta02.Text) / 100).ToString("n")
        Call Totalizar()
        Call CalcularPercentualTotal()
        Call PercMetaFormata()
        Me.txt_percMeta03.Focus()
    End Sub

    Protected Sub txt_percMeta03_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percMeta03.TextChanged
        Me.txt_vlrMeta03.Text = ((Me.txt_vlrVenda_03.Text * Me.txt_percMeta03.Text) / 100).ToString("n")
        Call Totalizar()
        Call CalcularPercentualTotal()
        Call PercMetaFormata()
        Me.txt_percMeta04.Focus()
    End Sub

    Protected Sub txt_percMeta04_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percMeta04.TextChanged
        Me.txt_vlrMeta04.Text = ((Me.txt_vlrVenda_04.Text * Me.txt_percMeta04.Text) / 100).ToString("n")
        Call Totalizar()
        Call CalcularPercentualTotal()
        Call PercMetaFormata()
        Me.txt_percMeta05.Focus()
    End Sub

    Protected Sub txt_percMeta05_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percMeta05.TextChanged
        Me.txt_vlrMeta05.Text = ((Me.txt_vlrVenda_05.Text * Me.txt_percMeta05.Text) / 100).ToString("n")
        Call Totalizar()
        Call CalcularPercentualTotal()
        Call PercMetaFormata()
        Me.txt_percMeta06.Focus()
    End Sub

    Protected Sub txt_percMeta06_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percMeta06.TextChanged
        Me.txt_vlrMeta06.Text = ((Me.txt_vlrVenda_06.Text * Me.txt_percMeta06.Text) / 100).ToString("n")
        Call Totalizar()
        Call CalcularPercentualTotal()
        Call PercMetaFormata()
        Me.txt_percMeta07.Focus()
    End Sub

    Protected Sub txt_percMeta07_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percMeta07.TextChanged
        Me.txt_vlrMeta07.Text = ((Me.txt_vlrVenda_07.Text * Me.txt_percMeta07.Text) / 100).ToString("n")
        Call Totalizar()
        Call CalcularPercentualTotal()
        Call PercMetaFormata()
        Me.txt_percMeta08.Focus()
    End Sub

    Protected Sub txt_percMeta08_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percMeta08.TextChanged
        Me.txt_vlrMeta08.Text = ((Me.txt_vlrVenda_08.Text * Me.txt_percMeta08.Text) / 100).ToString("n")
        Call Totalizar()
        Call CalcularPercentualTotal()
        Call PercMetaFormata()
        Me.txt_percMeta09.Focus()
    End Sub

    Protected Sub txt_percMeta09_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percMeta09.TextChanged
        Me.txt_vlrMeta09.Text = ((Me.txt_vlrVenda_09.Text * Me.txt_percMeta09.Text) / 100).ToString("n")
        Call Totalizar()
        Call CalcularPercentualTotal()
        Call PercMetaFormata()
        Me.txt_percMeta10.Focus()
    End Sub

    Protected Sub txt_percMeta10_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percMeta10.TextChanged
        Me.txt_vlrMeta10.Text = ((Me.txt_vlrVenda_10.Text * Me.txt_percMeta10.Text) / 100).ToString("n")
        Call Totalizar()
        Call CalcularPercentualTotal()
        Call PercMetaFormata()
        Me.txt_percMeta11.Focus()
    End Sub

    Protected Sub txt_percMeta11_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percMeta11.TextChanged
        Me.txt_vlrMeta11.Text = ((Me.txt_vlrVenda_11.Text * Me.txt_percMeta11.Text) / 100).ToString("n")
        Call Totalizar()
        Call CalcularPercentualTotal()
        Call PercMetaFormata()
        Me.txt_percMeta12.Focus()
    End Sub

    Protected Sub txt_percMeta12_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_percMeta12.TextChanged
        Me.txt_vlrMeta12.Text = ((Me.txt_vlrVenda_12.Text * Me.txt_percMeta12.Text) / 100).ToString("n")
        Call Totalizar()
        Call CalcularPercentualTotal()
        Call PercMetaFormata()
        Me.txt_percMeta01.Focus()
    End Sub

    Public Function SalvarCorporacao(ByVal idCod As String, ByVal Mes As String) As Boolean

        Dim gravou As Boolean
        Dim con As New SqlConnection(strConn)
        Dim comando As New SqlCommand("usp_OriLoja_Corp_Salvar", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idNivel", SqlDbType.SmallInt))
        comando.Parameters("@idNivel").Value = Me.cboPosicao.CallPosicao

        comando.Parameters.Add(New SqlParameter("@idCod", SqlDbType.Int))
        comando.Parameters("@idCod").Value = idCod

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.Int))
        comando.Parameters("@Ano").Value = Me.cboAno.CallAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.SmallInt))
        comando.Parameters("@Mes").Value = Mes

        comando.Parameters.Add(New SqlParameter("@idGrupoSub", SqlDbType.SmallInt))
        comando.Parameters("@idGrupoSub").Value = 1 'por Grupo

        Try
            con.Open()
            gravou = comando.ExecuteNonQuery    'Executa o comando, porém não retorna nenhum dado.
        Catch ex As Exception
            UserMsgBox(Me, ex.Message & ". Módulo: SalvarCorporacao")

        Finally 'Tudo o que estiver entre o "Finally" e o "End Try" será executado mesmo após a mensagem de erro.
            con.Close() 'Fecha o banco de dados
        End Try

        Return gravou   'Toda função tem retornar alguma coisa
        'Neste caso o retorno será dados pela variavel "gavou"

    End Function

    Sub BuscaMetaNoBanco(ByVal iMes As String)
        Dim con As New SqlConnection(strConn)
        Dim comando As New SqlCommand(strTriggerMeta, con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idPosicao", SqlDbType.TinyInt))
        comando.Parameters("@idPosicao").Value = Me.cboPosicao.CallPosicao

        comando.Parameters.Add(New SqlParameter("@idCod", SqlDbType.SmallInt))
        If Me.rnd_Grupo.Checked = True Then
            comando.Parameters("@idCod").Value = Me.cboGrupo_Sub.CallGrupo
        Else
            comando.Parameters("@idCod").Value = Me.cboGrupo_Sub.CallSubgrupo
        End If

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = Me.cboAno.CallAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = iMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = Me.cboFilial.CallFilial

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                Select Case iMes
                    Case 1
                        Me.txt_vlrMeta01.Text = reader5.GetSqlMoney(0).ToString()
                        Me.txt_percMeta01.Text = CDbl(reader5.GetSqlMoney(1)).ToString("n2")
                    Case 2
                        Me.txt_vlrMeta02.Text = reader5.GetSqlMoney(0).ToString()
                        Me.txt_percMeta02.Text = CDbl(reader5.GetSqlMoney(1)).ToString("n2")
                    Case 3
                        Me.txt_vlrMeta03.Text = reader5.GetSqlMoney(0).ToString()
                        Me.txt_percMeta03.Text = CDbl(reader5.GetSqlMoney(1)).ToString("n2")
                    Case 4
                        Me.txt_vlrMeta04.Text = reader5.GetSqlMoney(0).ToString()
                        Me.txt_percMeta04.Text = CDbl(reader5.GetSqlMoney(1)).ToString("n2")
                    Case 5
                        Me.txt_vlrMeta05.Text = reader5.GetSqlMoney(0).ToString()
                        Me.txt_percMeta05.Text = CDbl(reader5.GetSqlMoney(1)).ToString("n2")
                    Case 6
                        Me.txt_vlrMeta06.Text = reader5.GetSqlMoney(0).ToString()
                        Me.txt_percMeta06.Text = CDbl(reader5.GetSqlMoney(1)).ToString("n2")
                    Case 7
                        Me.txt_vlrMeta07.Text = reader5.GetSqlMoney(0).ToString()
                        Me.txt_percMeta07.Text = CDbl(reader5.GetSqlMoney(1)).ToString("n2")
                    Case 8
                        Me.txt_vlrMeta08.Text = reader5.GetSqlMoney(0).ToString()
                        Me.txt_percMeta08.Text = CDbl(reader5.GetSqlMoney(1)).ToString("n2")
                    Case 9
                        Me.txt_vlrMeta09.Text = reader5.GetSqlMoney(0).ToString()
                        Me.txt_percMeta09.Text = CDbl(reader5.GetSqlMoney(1)).ToString("n2")
                    Case 10
                        Me.txt_vlrMeta10.Text = reader5.GetSqlMoney(0).ToString()
                        Me.txt_percMeta10.Text = CDbl(reader5.GetSqlMoney(1)).ToString("n2")
                    Case 11
                        Me.txt_vlrMeta11.Text = reader5.GetSqlMoney(0).ToString()
                        Me.txt_percMeta11.Text = CDbl(reader5.GetSqlMoney(1)).ToString("n2")
                    Case 12
                        Me.txt_vlrMeta12.Text = reader5.GetSqlMoney(0).ToString()
                        Me.txt_percMeta12.Text = CDbl(reader5.GetSqlMoney(1)).ToString("n2")
                End Select

            End While

        Catch ex As Exception
            Beep()
            UserMsgBox(Me, ex.Message)

        Finally
            con.Close()
        End Try
    End Sub

    Sub MudaTitulo()
        Me.lbl_TituloAno4.Text = "Hist. " & Me.cboAno.CallAno - 4
        Me.lbl_TituloAno3.Text = "Hist. " & Me.cboAno.CallAno - 3
        Me.lbl_TituloAno2.Text = "Hist. " & Me.cboAno.CallAno - 2
        Me.lbl_TituloAno1.Text = "Hist. " & Me.cboAno.CallAno - 1
    End Sub

    Protected Sub rnd_Grupo_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rnd_Grupo.CheckedChanged
        Call TipoTrigger()
        Call Atualizar()
        Call CalcularTodosPercentuaisMeta()
    End Sub

    Protected Sub btnPreencher_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPreencher.Click
        If Me.txt_Preencher12meses.Text <> "" Then
            If Me.rndValor.Checked = True Then
                Me.txt_vlrMeta01.Text = Me.txt_Preencher12meses.Text
                Me.txt_vlrMeta02.Text = Me.txt_Preencher12meses.Text
                Me.txt_vlrMeta03.Text = Me.txt_Preencher12meses.Text
                Me.txt_vlrMeta04.Text = Me.txt_Preencher12meses.Text
                Me.txt_vlrMeta05.Text = Me.txt_Preencher12meses.Text
                Me.txt_vlrMeta06.Text = Me.txt_Preencher12meses.Text
                Me.txt_vlrMeta07.Text = Me.txt_Preencher12meses.Text
                Me.txt_vlrMeta08.Text = Me.txt_Preencher12meses.Text
                Me.txt_vlrMeta09.Text = Me.txt_Preencher12meses.Text
                Me.txt_vlrMeta10.Text = Me.txt_Preencher12meses.Text
                Me.txt_vlrMeta11.Text = Me.txt_Preencher12meses.Text
                Me.txt_vlrMeta12.Text = Me.txt_Preencher12meses.Text
                Call CalcularTodosPercentuaisMeta()
            Else

                Me.txt_percMeta01.Text = Me.txt_Preencher12meses.Text
                Me.txt_percMeta02.Text = Me.txt_Preencher12meses.Text
                Me.txt_percMeta03.Text = Me.txt_Preencher12meses.Text
                Me.txt_percMeta04.Text = Me.txt_Preencher12meses.Text
                Me.txt_percMeta05.Text = Me.txt_Preencher12meses.Text
                Me.txt_percMeta06.Text = Me.txt_Preencher12meses.Text
                Me.txt_percMeta07.Text = Me.txt_Preencher12meses.Text
                Me.txt_percMeta08.Text = Me.txt_Preencher12meses.Text
                Me.txt_percMeta09.Text = Me.txt_Preencher12meses.Text
                Me.txt_percMeta10.Text = Me.txt_Preencher12meses.Text
                Me.txt_percMeta11.Text = Me.txt_Preencher12meses.Text
                Me.txt_percMeta12.Text = Me.txt_Preencher12meses.Text


                Me.txt_vlrMeta01.Text = ((Me.txt_vlrVenda_01.Text * Me.txt_percMeta01.Text) / 100).ToString("n")
                Me.txt_vlrMeta02.Text = ((Me.txt_vlrVenda_02.Text * Me.txt_percMeta02.Text) / 100).ToString("n")
                Me.txt_vlrMeta03.Text = ((Me.txt_vlrVenda_03.Text * Me.txt_percMeta03.Text) / 100).ToString("n")
                Me.txt_vlrMeta04.Text = ((Me.txt_vlrVenda_04.Text * Me.txt_percMeta04.Text) / 100).ToString("n")
                Me.txt_vlrMeta05.Text = ((Me.txt_vlrVenda_05.Text * Me.txt_percMeta05.Text) / 100).ToString("n")
                Me.txt_vlrMeta06.Text = ((Me.txt_vlrVenda_06.Text * Me.txt_percMeta06.Text) / 100).ToString("n")
                Me.txt_vlrMeta07.Text = ((Me.txt_vlrVenda_07.Text * Me.txt_percMeta07.Text) / 100).ToString("n")
                Me.txt_vlrMeta08.Text = ((Me.txt_vlrVenda_08.Text * Me.txt_percMeta08.Text) / 100).ToString("n")
                Me.txt_vlrMeta09.Text = ((Me.txt_vlrVenda_09.Text * Me.txt_percMeta09.Text) / 100).ToString("n")
                Me.txt_vlrMeta10.Text = ((Me.txt_vlrVenda_10.Text * Me.txt_percMeta10.Text) / 100).ToString("n")
                Me.txt_vlrMeta11.Text = ((Me.txt_vlrVenda_11.Text * Me.txt_percMeta11.Text) / 100).ToString("n")
                Me.txt_vlrMeta12.Text = ((Me.txt_vlrVenda_12.Text * Me.txt_percMeta12.Text) / 100).ToString("n")

            End If
            Call Totalizar()
            Call CalcularPercentualTotal()
            Me.txt_Preencher12meses.Text = ""
        End If
    End Sub

    Protected Sub txt_Preencher12meses_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_Preencher12meses.TextChanged
        On Error Resume Next
        Me.btnPreencher.Focus()
        Me.txt_Preencher12meses.Text = (Me.txt_Preencher12meses.Text * 1).ToString("n2")
    End Sub

    Sub CalcularTodosPercentuaisMeta()
        Me.txt_percMeta01.Text = ((Me.txt_vlrMeta01.Text / Me.txt_vlrVenda_01.Text) * 100).ToString("n2")
        Me.txt_percMeta02.Text = ((Me.txt_vlrMeta02.Text / Me.txt_vlrVenda_02.Text) * 100).ToString("n2")
        Me.txt_percMeta03.Text = ((Me.txt_vlrMeta03.Text / Me.txt_vlrVenda_03.Text) * 100).ToString("n2")
        Me.txt_percMeta04.Text = ((Me.txt_vlrMeta04.Text / Me.txt_vlrVenda_04.Text) * 100).ToString("n2")
        Me.txt_percMeta05.Text = ((Me.txt_vlrMeta05.Text / Me.txt_vlrVenda_05.Text) * 100).ToString("n2")
        Me.txt_percMeta06.Text = ((Me.txt_vlrMeta06.Text / Me.txt_vlrVenda_06.Text) * 100).ToString("n2")
        Me.txt_percMeta07.Text = ((Me.txt_vlrMeta07.Text / Me.txt_vlrVenda_07.Text) * 100).ToString("n2")
        Me.txt_percMeta08.Text = ((Me.txt_vlrMeta08.Text / Me.txt_vlrVenda_08.Text) * 100).ToString("n2")
        Me.txt_percMeta09.Text = ((Me.txt_vlrMeta09.Text / Me.txt_vlrVenda_09.Text) * 100).ToString("n2")
        Me.txt_percMeta10.Text = ((Me.txt_vlrMeta10.Text / Me.txt_vlrVenda_10.Text) * 100).ToString("n2")
        Me.txt_percMeta11.Text = ((Me.txt_vlrMeta11.Text / Me.txt_vlrVenda_11.Text) * 100).ToString("n2")
        Me.txt_percMeta12.Text = ((Me.txt_vlrMeta12.Text / Me.txt_vlrVenda_12.Text) * 100).ToString("n2")
        Call CalcularPercentualTotal()
    End Sub

    Protected Sub btnDividir_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnDividir.Click
        Dim vlrMeta As String
        If Me.txt_Dividir12meses.Text <> "" Then
            vlrMeta = (Me.txt_Dividir12meses.Text / 12).ToString("n")

            Me.txt_vlrMeta01.Text = vlrMeta
            Me.txt_vlrMeta02.Text = vlrMeta
            Me.txt_vlrMeta03.Text = vlrMeta
            Me.txt_vlrMeta04.Text = vlrMeta
            Me.txt_vlrMeta05.Text = vlrMeta
            Me.txt_vlrMeta06.Text = vlrMeta
            Me.txt_vlrMeta07.Text = vlrMeta
            Me.txt_vlrMeta08.Text = vlrMeta
            Me.txt_vlrMeta09.Text = vlrMeta
            Me.txt_vlrMeta10.Text = vlrMeta
            Me.txt_vlrMeta11.Text = vlrMeta
            Me.txt_vlrMeta12.Text = vlrMeta
            Call Totalizar()
            Call CalcularTodosPercentuaisMeta()
            Me.txt_Dividir12meses.Text = ""
        End If

    End Sub

    Protected Sub txt_Dividir12meses_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_Dividir12meses.TextChanged
        Me.txt_Dividir12meses.Text = (Me.txt_Dividir12meses.Text * 1).ToString("n2")
        Me.btnDividir.Focus()
    End Sub

    Sub DefinirOpcaoSalvar()
        If Me.cboAno.CallAno = 2012 Then
            If Me.rnd_Subgrupo.Checked = True Then
                Me.btnSalvar.Enabled = True
            Else
                Me.btnSalvar.Enabled = False
            End If
        Else
            Me.btnSalvar.Enabled = False
        End If
    End Sub

    Protected Sub rndValor_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rndValor.CheckedChanged
        Me.btnPreencher.Enabled = True
        Me.txt_Preencher12meses.Focus()
    End Sub

    Protected Sub rndPerc_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles rndPerc.CheckedChanged
        Me.btnPreencher.Enabled = True
        Me.txt_Preencher12meses.Focus()
    End Sub

    Protected Sub btnCalcular_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCalcular.Click

        Dim varIndicador, varAcrescimo, varCalc, varH As Single

        If Me.txt_Indicador.Text = "" Then
            varIndicador = 0
        Else
            varIndicador = Me.txt_Indicador.Text
        End If

        If Me.txt_Acrescimo.Text = "" Then
            varAcrescimo = 0
        Else
            varAcrescimo = Me.txt_Acrescimo.Text
        End If

        'Janeiro
        varCalc = 0
        varH = 0
        varCalc = (((Me.lbl_vlrHist1_1.Text * varIndicador) / 100) + lbl_vlrHist1_1.Text)
        varH = (((varCalc * varAcrescimo) / 100) + varCalc)
        Me.txt_vlrMeta01.Text = varH

        'Fevereiro
        varCalc = 0
        varH = 0
        varCalc = (((Me.lbl_vlrHist1_2.Text * varIndicador) / 100) + lbl_vlrHist1_2.Text)
        varH = (((varCalc * varAcrescimo) / 100) + varCalc)
        Me.txt_vlrMeta02.Text = varH

        'Março
        varCalc = 0
        varH = 0
        varCalc = (((Me.lbl_vlrHist1_3.Text * varIndicador) / 100) + lbl_vlrHist1_3.Text)
        varH = (((varCalc * varAcrescimo) / 100) + varCalc)
        Me.txt_vlrMeta03.Text = varH

        'Abril
        varCalc = 0
        varH = 0
        varCalc = (((Me.lbl_vlrHist1_4.Text * varIndicador) / 100) + lbl_vlrHist1_4.Text)
        varH = (((varCalc * varAcrescimo) / 100) + varCalc)
        Me.txt_vlrMeta04.Text = varH

        'Maio
        varCalc = 0
        varH = 0
        varCalc = (((Me.lbl_vlrHist1_5.Text * varIndicador) / 100) + lbl_vlrHist1_5.Text)
        varH = (((varCalc * varAcrescimo) / 100) + varCalc)
        Me.txt_vlrMeta05.Text = varH

        'Junho
        varCalc = 0
        varH = 0
        varCalc = (((Me.lbl_vlrHist1_6.Text * varIndicador) / 100) + lbl_vlrHist1_6.Text)
        varH = (((varCalc * varAcrescimo) / 100) + varCalc)
        Me.txt_vlrMeta06.Text = varH

        'Julho
        varCalc = 0
        varH = 0
        varCalc = (((Me.lbl_vlrHist1_7.Text * varIndicador) / 100) + lbl_vlrHist1_7.Text)
        varH = (((varCalc * varAcrescimo) / 100) + varCalc)
        Me.txt_vlrMeta07.Text = varH

        'Agosto
        varCalc = 0
        varH = 0
        varCalc = (((Me.lbl_vlrHist1_8.Text * varIndicador) / 100) + lbl_vlrHist1_8.Text)
        varH = (((varCalc * varAcrescimo) / 100) + varCalc)
        Me.txt_vlrMeta08.Text = varH

        'Setembro
        varCalc = 0
        varH = 0
        varCalc = (((Me.lbl_vlrHist1_9.Text * varIndicador) / 100) + lbl_vlrHist1_9.Text)
        varH = (((varCalc * varAcrescimo) / 100) + varCalc)
        Me.txt_vlrMeta09.Text = varH

        'Outubro
        varCalc = 0
        varH = 0
        varCalc = (((Me.lbl_vlrHist1_10.Text * varIndicador) / 100) + lbl_vlrHist1_10.Text)
        varH = (((varCalc * varAcrescimo) / 100) + varCalc)
        Me.txt_vlrMeta10.Text = varH

        'Novembro
        varCalc = 0
        varH = 0
        varCalc = (((Me.lbl_vlrHist1_11.Text * varIndicador) / 100) + lbl_vlrHist1_11.Text)
        varH = (((varCalc * varAcrescimo) / 100) + varCalc)
        Me.txt_vlrMeta11.Text = varH

        'Dezembro
        varCalc = 0
        varH = 0
        varCalc = (((Me.lbl_vlrHist1_12.Text * varIndicador) / 100) + lbl_vlrHist1_12.Text)
        varH = (((varCalc * varAcrescimo) / 100) + varCalc)
        Me.txt_vlrMeta12.Text = varH

        Call Totalizar()
        Call CalcularTodosPercentuaisMeta()

    End Sub

    Protected Sub txt_Indicador_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_Indicador.TextChanged
        Me.txt_Indicador.Text = (Me.txt_Indicador.Text * 1).ToString("n2")
        Me.txt_Acrescimo.Focus()
    End Sub

    Protected Sub txt_Acrescimo_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txt_Acrescimo.TextChanged
        Me.txt_Acrescimo.Text = (Me.txt_Acrescimo.Text * 1).ToString("n2")
        Me.btnCalcular.Focus()
    End Sub

    Public Overloads Overrides Sub VerifyRenderingInServerForm(ByVal control As Control)
        ' Verifies that the control is rendered
    End Sub

    Sub mySESSION()
        Session("IDPOSICAO") = Me.cboPosicao.CallPosicao    'Define a posição atual da Posição
        Session("IDFILIAL") = Me.cboFilial.CallFilial
        Session("VALUE1") = 7
    End Sub

    Sub MudarNegativoParaVermelho()
        'Ano - 1
        'Valor
        If CDbl(Me.lbl_vlrHist1_1.Text) < 0 Then Me.lbl_vlrHist1_1.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist1_2.Text) < 0 Then Me.lbl_vlrHist1_2.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist1_3.Text) < 0 Then Me.lbl_vlrHist1_3.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist1_4.Text) < 0 Then Me.lbl_vlrHist1_4.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist1_5.Text) < 0 Then Me.lbl_vlrHist1_5.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist1_6.Text) < 0 Then Me.lbl_vlrHist1_6.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist1_7.Text) < 0 Then Me.lbl_vlrHist1_7.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist1_8.Text) < 0 Then Me.lbl_vlrHist1_8.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist1_9.Text) < 0 Then Me.lbl_vlrHist1_9.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist1_10.Text) < 0 Then Me.lbl_vlrHist1_10.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist1_11.Text) < 0 Then Me.lbl_vlrHist1_11.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist1_12.Text) < 0 Then Me.lbl_vlrHist1_12.ForeColor = Drawing.Color.Red

        'Percentual
        If CDbl(Me.lbl_percHist1_1.Text) < 0 Then Me.lbl_percHist1_1.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist1_2.Text) < 0 Then Me.lbl_percHist1_2.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist1_3.Text) < 0 Then Me.lbl_percHist1_3.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist1_4.Text) < 0 Then Me.lbl_percHist1_4.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist1_5.Text) < 0 Then Me.lbl_percHist1_5.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist1_6.Text) < 0 Then Me.lbl_percHist1_6.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist1_7.Text) < 0 Then Me.lbl_percHist1_7.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist1_8.Text) < 0 Then Me.lbl_percHist1_8.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist1_9.Text) < 0 Then Me.lbl_percHist1_9.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist1_10.Text) < 0 Then Me.lbl_percHist1_10.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist1_11.Text) < 0 Then Me.lbl_percHist1_11.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist1_12.Text) < 0 Then Me.lbl_percHist1_12.ForeColor = Drawing.Color.Red

        'Ano - 2
        'Valor
        If CDbl(Me.lbl_vlrHist2_1.Text) < 0 Then Me.lbl_vlrHist2_1.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist2_2.Text) < 0 Then Me.lbl_vlrHist2_2.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist2_3.Text) < 0 Then Me.lbl_vlrHist2_3.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist2_4.Text) < 0 Then Me.lbl_vlrHist2_4.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist2_5.Text) < 0 Then Me.lbl_vlrHist2_5.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist2_6.Text) < 0 Then Me.lbl_vlrHist2_6.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist2_7.Text) < 0 Then Me.lbl_vlrHist2_7.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist2_8.Text) < 0 Then Me.lbl_vlrHist2_8.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist2_9.Text) < 0 Then Me.lbl_vlrHist2_9.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist2_10.Text) < 0 Then Me.lbl_vlrHist2_10.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist2_11.Text) < 0 Then Me.lbl_vlrHist2_11.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist2_12.Text) < 0 Then Me.lbl_vlrHist2_12.ForeColor = Drawing.Color.Red

        'Percentual
        If CDbl(Me.lbl_percHist2_1.Text) < 0 Then Me.lbl_percHist2_1.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist2_2.Text) < 0 Then Me.lbl_percHist2_2.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist2_3.Text) < 0 Then Me.lbl_percHist2_3.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist2_4.Text) < 0 Then Me.lbl_percHist2_4.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist2_5.Text) < 0 Then Me.lbl_percHist2_5.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist2_6.Text) < 0 Then Me.lbl_percHist2_6.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist2_7.Text) < 0 Then Me.lbl_percHist2_7.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist2_8.Text) < 0 Then Me.lbl_percHist2_8.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist2_9.Text) < 0 Then Me.lbl_percHist2_9.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist2_10.Text) < 0 Then Me.lbl_percHist2_10.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist2_11.Text) < 0 Then Me.lbl_percHist2_11.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist2_12.Text) < 0 Then Me.lbl_percHist2_12.ForeColor = Drawing.Color.Red

        'Ano - 3
        'Valor
        If CDbl(Me.lbl_vlrHist3_1.Text) < 0 Then Me.lbl_vlrHist3_1.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist3_2.Text) < 0 Then Me.lbl_vlrHist3_2.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist3_3.Text) < 0 Then Me.lbl_vlrHist3_3.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist3_4.Text) < 0 Then Me.lbl_vlrHist3_4.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist3_5.Text) < 0 Then Me.lbl_vlrHist3_5.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist3_6.Text) < 0 Then Me.lbl_vlrHist3_6.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist3_7.Text) < 0 Then Me.lbl_vlrHist3_7.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist3_8.Text) < 0 Then Me.lbl_vlrHist3_8.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist3_9.Text) < 0 Then Me.lbl_vlrHist3_9.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist3_10.Text) < 0 Then Me.lbl_vlrHist3_10.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist3_11.Text) < 0 Then Me.lbl_vlrHist3_11.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist3_12.Text) < 0 Then Me.lbl_vlrHist3_12.ForeColor = Drawing.Color.Red

        'Percentual
        If CDbl(Me.lbl_percHist3_1.Text) < 0 Then Me.lbl_percHist3_1.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist3_2.Text) < 0 Then Me.lbl_percHist3_2.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist3_3.Text) < 0 Then Me.lbl_percHist3_3.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist3_4.Text) < 0 Then Me.lbl_percHist3_4.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist3_5.Text) < 0 Then Me.lbl_percHist3_5.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist3_6.Text) < 0 Then Me.lbl_percHist3_6.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist3_7.Text) < 0 Then Me.lbl_percHist3_7.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist3_8.Text) < 0 Then Me.lbl_percHist3_8.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist3_9.Text) < 0 Then Me.lbl_percHist3_9.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist3_10.Text) < 0 Then Me.lbl_percHist3_10.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist3_11.Text) < 0 Then Me.lbl_percHist3_11.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist3_12.Text) < 0 Then Me.lbl_percHist3_12.ForeColor = Drawing.Color.Red

        'Ano - 4
        'Valor
        If CDbl(Me.lbl_vlrHist4_1.Text) < 0 Then Me.lbl_vlrHist4_1.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist4_2.Text) < 0 Then Me.lbl_vlrHist4_2.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist4_3.Text) < 0 Then Me.lbl_vlrHist4_3.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist4_4.Text) < 0 Then Me.lbl_vlrHist4_4.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist4_5.Text) < 0 Then Me.lbl_vlrHist4_5.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist4_6.Text) < 0 Then Me.lbl_vlrHist4_6.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist4_7.Text) < 0 Then Me.lbl_vlrHist4_7.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist4_8.Text) < 0 Then Me.lbl_vlrHist4_8.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist4_9.Text) < 0 Then Me.lbl_vlrHist4_9.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist4_10.Text) < 0 Then Me.lbl_vlrHist4_10.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist4_11.Text) < 0 Then Me.lbl_vlrHist4_11.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist4_12.Text) < 0 Then Me.lbl_vlrHist4_12.ForeColor = Drawing.Color.Red

        'Percentual
        If CDbl(Me.lbl_percHist4_1.Text) < 0 Then Me.lbl_percHist4_1.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist4_2.Text) < 0 Then Me.lbl_percHist4_2.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist4_3.Text) < 0 Then Me.lbl_percHist4_3.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist4_4.Text) < 0 Then Me.lbl_percHist4_4.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist4_5.Text) < 0 Then Me.lbl_percHist4_5.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist4_6.Text) < 0 Then Me.lbl_percHist4_6.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist4_7.Text) < 0 Then Me.lbl_percHist4_7.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist4_8.Text) < 0 Then Me.lbl_percHist4_8.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist4_9.Text) < 0 Then Me.lbl_percHist4_9.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist4_10.Text) < 0 Then Me.lbl_percHist4_10.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist4_11.Text) < 0 Then Me.lbl_percHist4_11.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist4_12.Text) < 0 Then Me.lbl_percHist4_12.ForeColor = Drawing.Color.Red

        '************************  > 0 *******************************************
        'Ano - 1
        'Valor
        If CDbl(Me.lbl_vlrHist1_1.Text) >= 0 Then Me.lbl_vlrHist1_1.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist1_2.Text) >= 0 Then Me.lbl_vlrHist1_2.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist1_3.Text) >= 0 Then Me.lbl_vlrHist1_3.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist1_4.Text) >= 0 Then Me.lbl_vlrHist1_4.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist1_5.Text) >= 0 Then Me.lbl_vlrHist1_5.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist1_6.Text) >= 0 Then Me.lbl_vlrHist1_6.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist1_7.Text) >= 0 Then Me.lbl_vlrHist1_7.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist1_8.Text) >= 0 Then Me.lbl_vlrHist1_8.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist1_9.Text) >= 0 Then Me.lbl_vlrHist1_9.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist1_10.Text) >= 0 Then Me.lbl_vlrHist1_10.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist1_11.Text) >= 0 Then Me.lbl_vlrHist1_11.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist1_12.Text) >= 0 Then Me.lbl_vlrHist1_12.ForeColor = Drawing.Color.Black

        'Percentual
        If CDbl(Me.lbl_percHist1_1.Text) >= 0 Then Me.lbl_percHist1_1.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist1_2.Text) >= 0 Then Me.lbl_percHist1_2.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist1_3.Text) >= 0 Then Me.lbl_percHist1_3.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist1_4.Text) >= 0 Then Me.lbl_percHist1_4.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist1_5.Text) >= 0 Then Me.lbl_percHist1_5.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist1_6.Text) >= 0 Then Me.lbl_percHist1_6.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist1_7.Text) >= 0 Then Me.lbl_percHist1_7.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist1_8.Text) >= 0 Then Me.lbl_percHist1_8.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist1_9.Text) >= 0 Then Me.lbl_percHist1_9.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist1_10.Text) >= 0 Then Me.lbl_percHist1_10.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist1_11.Text) >= 0 Then Me.lbl_percHist1_11.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist1_12.Text) >= 0 Then Me.lbl_percHist1_12.ForeColor = Drawing.Color.Black

        'Ano - 2
        'Valor
        If CDbl(Me.lbl_vlrHist2_1.Text) >= 0 Then Me.lbl_vlrHist2_1.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist2_2.Text) >= 0 Then Me.lbl_vlrHist2_2.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist2_3.Text) >= 0 Then Me.lbl_vlrHist2_3.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist2_4.Text) >= 0 Then Me.lbl_vlrHist2_4.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist2_5.Text) >= 0 Then Me.lbl_vlrHist2_5.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist2_6.Text) >= 0 Then Me.lbl_vlrHist2_6.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist2_7.Text) >= 0 Then Me.lbl_vlrHist2_7.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist2_8.Text) >= 0 Then Me.lbl_vlrHist2_8.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist2_9.Text) >= 0 Then Me.lbl_vlrHist2_9.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist2_10.Text) >= 0 Then Me.lbl_vlrHist2_10.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist2_11.Text) >= 0 Then Me.lbl_vlrHist2_11.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist2_12.Text) >= 0 Then Me.lbl_vlrHist2_12.ForeColor = Drawing.Color.Black

        'Percentual
        If CDbl(Me.lbl_percHist2_1.Text) >= 0 Then Me.lbl_percHist2_1.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist2_2.Text) >= 0 Then Me.lbl_percHist2_2.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist2_3.Text) >= 0 Then Me.lbl_percHist2_3.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist2_4.Text) >= 0 Then Me.lbl_percHist2_4.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist2_5.Text) >= 0 Then Me.lbl_percHist2_5.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist2_6.Text) >= 0 Then Me.lbl_percHist2_6.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist2_7.Text) >= 0 Then Me.lbl_percHist2_7.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist2_8.Text) >= 0 Then Me.lbl_percHist2_8.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist2_9.Text) >= 0 Then Me.lbl_percHist2_9.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist2_10.Text) >= 0 Then Me.lbl_percHist2_10.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist2_11.Text) >= 0 Then Me.lbl_percHist2_11.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist2_12.Text) >= 0 Then Me.lbl_percHist2_12.ForeColor = Drawing.Color.Black

        'Ano - 3
        'Valor
        If CDbl(Me.lbl_vlrHist3_1.Text) >= 0 Then Me.lbl_vlrHist3_1.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist3_2.Text) >= 0 Then Me.lbl_vlrHist3_2.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist3_3.Text) >= 0 Then Me.lbl_vlrHist3_3.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist3_4.Text) >= 0 Then Me.lbl_vlrHist3_4.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist3_5.Text) >= 0 Then Me.lbl_vlrHist3_5.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist3_6.Text) >= 0 Then Me.lbl_vlrHist3_6.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist3_7.Text) >= 0 Then Me.lbl_vlrHist3_7.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist3_8.Text) >= 0 Then Me.lbl_vlrHist3_8.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist3_9.Text) >= 0 Then Me.lbl_vlrHist3_9.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist3_10.Text) >= 0 Then Me.lbl_vlrHist3_10.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist3_11.Text) >= 0 Then Me.lbl_vlrHist3_11.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist3_12.Text) >= 0 Then Me.lbl_vlrHist3_12.ForeColor = Drawing.Color.Black

        'Percentual
        If CDbl(Me.lbl_percHist3_1.Text) >= 0 Then Me.lbl_percHist3_1.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist3_2.Text) >= 0 Then Me.lbl_percHist3_2.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist3_3.Text) >= 0 Then Me.lbl_percHist3_3.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist3_4.Text) >= 0 Then Me.lbl_percHist3_4.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist3_5.Text) >= 0 Then Me.lbl_percHist3_5.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist3_6.Text) >= 0 Then Me.lbl_percHist3_6.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist3_7.Text) >= 0 Then Me.lbl_percHist3_7.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist3_8.Text) >= 0 Then Me.lbl_percHist3_8.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist3_9.Text) >= 0 Then Me.lbl_percHist3_9.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist3_10.Text) >= 0 Then Me.lbl_percHist3_10.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist3_11.Text) >= 0 Then Me.lbl_percHist3_11.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist3_12.Text) >= 0 Then Me.lbl_percHist3_12.ForeColor = Drawing.Color.Black

        'Ano - 4
        'Valor
        If CDbl(Me.lbl_vlrHist4_1.Text) >= 0 Then Me.lbl_vlrHist4_1.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist4_2.Text) >= 0 Then Me.lbl_vlrHist4_2.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist4_3.Text) >= 0 Then Me.lbl_vlrHist4_3.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist4_4.Text) >= 0 Then Me.lbl_vlrHist4_4.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist4_5.Text) >= 0 Then Me.lbl_vlrHist4_5.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist4_6.Text) >= 0 Then Me.lbl_vlrHist4_6.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist4_7.Text) >= 0 Then Me.lbl_vlrHist4_7.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist4_8.Text) >= 0 Then Me.lbl_vlrHist4_8.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist4_9.Text) >= 0 Then Me.lbl_vlrHist4_9.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist4_10.Text) >= 0 Then Me.lbl_vlrHist4_10.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist4_11.Text) >= 0 Then Me.lbl_vlrHist4_11.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist4_12.Text) >= 0 Then Me.lbl_vlrHist4_12.ForeColor = Drawing.Color.Black

        'Percentual
        If CDbl(Me.lbl_percHist4_1.Text) >= 0 Then Me.lbl_percHist4_1.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist4_2.Text) >= 0 Then Me.lbl_percHist4_2.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist4_3.Text) >= 0 Then Me.lbl_percHist4_3.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist4_4.Text) >= 0 Then Me.lbl_percHist4_4.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist4_5.Text) >= 0 Then Me.lbl_percHist4_5.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist4_6.Text) >= 0 Then Me.lbl_percHist4_6.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist4_7.Text) >= 0 Then Me.lbl_percHist4_7.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist4_8.Text) >= 0 Then Me.lbl_percHist4_8.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist4_9.Text) >= 0 Then Me.lbl_percHist4_9.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist4_10.Text) >= 0 Then Me.lbl_percHist4_10.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist4_11.Text) >= 0 Then Me.lbl_percHist4_11.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist4_12.Text) >= 0 Then Me.lbl_percHist4_12.ForeColor = Drawing.Color.Black

        'Totalizador ****************************************************************************************
        'Valor
        If CDbl(Me.lbl_vlrHist1_Total.Text) < 0 Then Me.lbl_vlrHist1_Total.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist2_Total.Text) < 0 Then Me.lbl_vlrHist2_Total.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist3_Total.Text) < 0 Then Me.lbl_vlrHist3_Total.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_vlrHist4_Total.Text) < 0 Then Me.lbl_vlrHist4_Total.ForeColor = Drawing.Color.Red

        If CDbl(Me.lbl_vlrHist1_Total.Text) >= 0 Then Me.lbl_vlrHist1_Total.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist2_Total.Text) >= 0 Then Me.lbl_vlrHist2_Total.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist3_Total.Text) >= 0 Then Me.lbl_vlrHist3_Total.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_vlrHist4_Total.Text) >= 0 Then Me.lbl_vlrHist4_Total.ForeColor = Drawing.Color.Black

        On Error Resume Next
        'Percentual
        If CDbl(Me.lbl_percHist1_Total.Text) < 0 Then Me.lbl_percHist1_Total.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist2_Total.Text) < 0 Then Me.lbl_percHist2_Total.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist3_Total.Text) < 0 Then Me.lbl_percHist3_Total.ForeColor = Drawing.Color.Red
        If CDbl(Me.lbl_percHist4_Total.Text) < 0 Then Me.lbl_percHist4_Total.ForeColor = Drawing.Color.Red

        If CDbl(Me.lbl_percHist1_Total.Text) >= 0 Then Me.lbl_percHist1_Total.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist2_Total.Text) >= 0 Then Me.lbl_percHist2_Total.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist3_Total.Text) >= 0 Then Me.lbl_percHist3_Total.ForeColor = Drawing.Color.Black
        If CDbl(Me.lbl_percHist4_Total.Text) >= 0 Then Me.lbl_percHist4_Total.ForeColor = Drawing.Color.Black

    End Sub

    Sub SalvarGrupoDespesa()
        Dim sConnStr As String = strConn
        Dim cnBKTest As New SqlConnection(sConnStr)
        Dim cmdTest As New SqlCommand("uspCalculaTotalDespesa", cnBKTest)

        cmdTest.CommandType = Data.CommandType.StoredProcedure

        cmdTest.Parameters.Add(New SqlParameter("@idPosicao", Data.SqlDbType.Char))
        cmdTest.Parameters("@idPosicao").Value = Me.cboPosicao.CallPosicao

        cmdTest.Parameters.Add(New SqlParameter("@Ano", Data.SqlDbType.Char))
        cmdTest.Parameters("@Ano").Value = Me.cboAno.CallAno

        cmdTest.Parameters.Add(New SqlParameter("@idFilial", Data.SqlDbType.VarChar))
        cmdTest.Parameters("@idFilial").Value = Me.cboFilial.CallFilial

        cmdTest.Parameters.Add(New SqlParameter("@userName", Data.SqlDbType.VarChar))
        cmdTest.Parameters("@userName").Value = User.Identity.Name

        cmdTest.Parameters.Add(New SqlParameter("@idCat", Data.SqlDbType.VarChar))
        cmdTest.Parameters("@idCat").Value = lblCatCod.Text

        cnBKTest.Open()
        cmdTest.ExecuteNonQuery()
        cnBKTest.Close()
    End Sub

    Protected Sub cboAno_ListAnoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.ListAnoChanged
        Call DefinirOpcaoSalvar()
        Call Atualizar()
    End Sub

    Protected Sub cboFilial_ListFilialChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboFilial.ListFilialChanged
        Call Atualizar()
        Call mySESSION()
    End Sub

    Protected Sub cboPosicao_ListPosicaoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboPosicao.ListPosicaoChanged
        Call Atualizar()
        Call mySESSION()
    End Sub

    Protected Sub btnSalvar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSalvar.Click
        Dim oVem As New VendaEmpresaMes
        'Salvar Subgrupo - Mes
        oVem.Salvar_Ori_Subgrupo_Mes(Me.cboPosicao.CallPosicao, Me.cboGrupo_Sub.CallSubgrupo, Me.cboAno.CallAno, 1, Me.cboFilial.CallFilial, Me.txt_vlrMeta01.Text, Me.txt_percMeta01.Text, User.Identity.Name, Me.cboGrupo_Sub.CallGrupo)
        oVem.Salvar_Ori_Subgrupo_Mes(Me.cboPosicao.CallPosicao, Me.cboGrupo_Sub.CallSubgrupo, Me.cboAno.CallAno, 2, Me.cboFilial.CallFilial, Me.txt_vlrMeta02.Text, Me.txt_percMeta02.Text, User.Identity.Name, Me.cboGrupo_Sub.CallGrupo)
        oVem.Salvar_Ori_Subgrupo_Mes(Me.cboPosicao.CallPosicao, Me.cboGrupo_Sub.CallSubgrupo, Me.cboAno.CallAno, 3, Me.cboFilial.CallFilial, Me.txt_vlrMeta03.Text, Me.txt_percMeta03.Text, User.Identity.Name, Me.cboGrupo_Sub.CallGrupo)
        oVem.Salvar_Ori_Subgrupo_Mes(Me.cboPosicao.CallPosicao, Me.cboGrupo_Sub.CallSubgrupo, Me.cboAno.CallAno, 4, Me.cboFilial.CallFilial, Me.txt_vlrMeta04.Text, Me.txt_percMeta04.Text, User.Identity.Name, Me.cboGrupo_Sub.CallGrupo)
        oVem.Salvar_Ori_Subgrupo_Mes(Me.cboPosicao.CallPosicao, Me.cboGrupo_Sub.CallSubgrupo, Me.cboAno.CallAno, 5, Me.cboFilial.CallFilial, Me.txt_vlrMeta05.Text, Me.txt_percMeta05.Text, User.Identity.Name, Me.cboGrupo_Sub.CallGrupo)
        oVem.Salvar_Ori_Subgrupo_Mes(Me.cboPosicao.CallPosicao, Me.cboGrupo_Sub.CallSubgrupo, Me.cboAno.CallAno, 6, Me.cboFilial.CallFilial, Me.txt_vlrMeta06.Text, Me.txt_percMeta06.Text, User.Identity.Name, Me.cboGrupo_Sub.CallGrupo)
        oVem.Salvar_Ori_Subgrupo_Mes(Me.cboPosicao.CallPosicao, Me.cboGrupo_Sub.CallSubgrupo, Me.cboAno.CallAno, 7, Me.cboFilial.CallFilial, Me.txt_vlrMeta07.Text, Me.txt_percMeta07.Text, User.Identity.Name, Me.cboGrupo_Sub.CallGrupo)
        oVem.Salvar_Ori_Subgrupo_Mes(Me.cboPosicao.CallPosicao, Me.cboGrupo_Sub.CallSubgrupo, Me.cboAno.CallAno, 8, Me.cboFilial.CallFilial, Me.txt_vlrMeta08.Text, Me.txt_percMeta08.Text, User.Identity.Name, Me.cboGrupo_Sub.CallGrupo)
        oVem.Salvar_Ori_Subgrupo_Mes(Me.cboPosicao.CallPosicao, Me.cboGrupo_Sub.CallSubgrupo, Me.cboAno.CallAno, 9, Me.cboFilial.CallFilial, Me.txt_vlrMeta09.Text, Me.txt_percMeta09.Text, User.Identity.Name, Me.cboGrupo_Sub.CallGrupo)
        oVem.Salvar_Ori_Subgrupo_Mes(Me.cboPosicao.CallPosicao, Me.cboGrupo_Sub.CallSubgrupo, Me.cboAno.CallAno, 10, Me.cboFilial.CallFilial, Me.txt_vlrMeta10.Text, Me.txt_percMeta10.Text, User.Identity.Name, Me.cboGrupo_Sub.CallGrupo)
        oVem.Salvar_Ori_Subgrupo_Mes(Me.cboPosicao.CallPosicao, Me.cboGrupo_Sub.CallSubgrupo, Me.cboAno.CallAno, 11, Me.cboFilial.CallFilial, Me.txt_vlrMeta11.Text, Me.txt_percMeta11.Text, User.Identity.Name, Me.cboGrupo_Sub.CallGrupo)
        oVem.Salvar_Ori_Subgrupo_Mes(Me.cboPosicao.CallPosicao, Me.cboGrupo_Sub.CallSubgrupo, Me.cboAno.CallAno, 12, Me.cboFilial.CallFilial, Me.txt_vlrMeta12.Text, Me.txt_percMeta12.Text, User.Identity.Name, Me.cboGrupo_Sub.CallGrupo)

        'Salvar Subgrupo - Ano
        oVem.Salvar_Ori_Subgrupo_Ano(Me.cboPosicao.CallPosicao, Me.cboGrupo_Sub.CallSubgrupo, Me.cboAno.CallAno, Me.cboFilial.CallFilial, Me.lbl_vlrMetaTotal.Text, Me.lbl_percMetaTotal.Text, User.Identity.Name, Me.cboGrupo_Sub.CallGrupo)

        'Salvar Grupo - Mês
        oVem.Salvar_Ori_Grupo_Mes_BaseSubgrupo(Me.cboPosicao.CallPosicao, Me.cboGrupo_Sub.CallGrupo, Me.cboAno.CallAno, Me.cboFilial.CallFilial, User.Identity.Name, Me.lblCatCod.Text)

        'Call SalvarCorporacao(Me.cboGrupo.SelectedValue, 1)
        'Call SalvarCorporacao(Me.cboGrupo.SelectedValue, 2)
        'Call SalvarCorporacao(Me.cboGrupo.SelectedValue, 3)
        'Call SalvarCorporacao(Me.cboGrupo.SelectedValue, 4)
        'Call SalvarCorporacao(Me.cboGrupo.SelectedValue, 5)
        'Call SalvarCorporacao(Me.cboGrupo.SelectedValue, 6)
        'Call SalvarCorporacao(Me.cboGrupo.SelectedValue, 7)
        'Call SalvarCorporacao(Me.cboGrupo.SelectedValue, 8)
        'Call SalvarCorporacao(Me.cboGrupo.SelectedValue, 9)
        'Call SalvarCorporacao(Me.cboGrupo.SelectedValue, 10)
        'Call SalvarCorporacao(Me.cboGrupo.SelectedValue, 11)
        'Call SalvarCorporacao(Me.cboGrupo.SelectedValue, 12)

        'Call SalvarAno(Me.cboPosicao.SelectedValue, Me.cboGrupo.SelectedValue, Me.cboAno.SelectedValue, Me.cboFilial.SelectedValue, Me.txt_vlrMetaTotal.Text, Me.txt_percMetaTotal.Text, Me.lblUser.Text)
        UserMsgBox(Me, "As metas foram salvas com sucesso!!!")
    End Sub

    Protected Sub link_Mes_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles link_Mes.Click
        Call Linkar("Planejamento/Despesas/viewMetaDespUnicaLojaMes.aspx", Me.lblCatCod.Text)
    End Sub

    Private Sub Linkar(ByVal link As String, ByVal idCat As String)
        Dim url As String = link & "?idCat=" & idCat & ""
        Dim sb As New StringBuilder()
        sb.Append("<script type = 'text/javascript'>")
        sb.Append("window.open('")
        sb.Append(url)
        sb.Append("');")
        sb.Append("</script>")
        ClientScript.RegisterStartupScript(Me.GetType(), "script", sb.ToString())
    End Sub

    Protected Sub link_Ano_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles link_Ano.Click
        Call Linkar("Planejamento/Despesas/viewMetaDespUnicaLojaAno.aspx", Me.lblCatCod.Text)
    End Sub

    Protected Sub link_EmpresaMes_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles link_EmpresaMes.Click
        Call Linkar("Planejamento/Despesas/viewMetaDespUnicaEmpresaMes.aspx", Me.lblCatCod.Text)
    End Sub

    Protected Sub link_EmpresaAno_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles link_EmpresaAno.Click
        Call Linkar("Planejamento/Despesas/viewMetaDespUnicaEmpresaAno.aspx", Me.lblCatCod.Text)
    End Sub

    Protected Sub link_ApoioMes_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles link_ApoioMes.Click
        Call Linkar("Planejamento/Despesas/viewMetaDespUnicaApoioMes.aspx", Me.lblCatCod.Text)
        '~/MemberPages/Planejamento/Despesas/viewMetaDespUnicaApoioMes.aspx
    End Sub

    Protected Sub link_ApoioAno_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles link_ApoioAno.Click
        Call Linkar("Planejamento/Despesas/viewMetaDespUnicaApoioAno.aspx", Me.lblCatCod.Text)
        '~/MemberPages/Planejamento/Despesas/viewMetaDespUnicaApoioAno.aspx
    End Sub

    Protected Sub link_GrupoMes_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles link_GrupoMes.Click
        Call Linkar("Planejamento/Despesas/viewMetaDespUnicaGrupoMes.aspx", Me.lblCatCod.Text)
        '~/MemberPages/Planejamento/Despesas/viewMetaDespUnicaGrupoMes.aspx 
    End Sub

    Protected Sub link_GrupoAno_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles link_GrupoAno.Click
        Call Linkar("Planejamento/Despesas/viewMetaDespUnicaGrupoAno.aspx", Me.lblCatCod.Text)
        '~/MemberPages/Planejamento/Despesas/viewMetaDespUnicaGrupoAno.aspx
    End Sub

    Protected Sub link_SubgrupoMes_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles link_SubgrupoMes.Click
        Call Linkar("Planejamento/Despesas/viewMetaDespUnicaSubGrupoMes.aspx", Me.lblCatCod.Text)
        '~/MemberPages/Planejamento/Despesas/viewMetaDespUnicaSubGrupoMes.aspx
    End Sub

    Protected Sub link_SubgrupoAno_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles link_SubgrupoAno.Click
        Call Linkar("Planejamento/Despesas/viewMetaDespUnicaSubGrupoAno.aspx", Me.lblCatCod.Text)
        '~/MemberPages/Planejamento/Despesas/viewMetaDespUnicaSubGrupoAno.aspx
    End Sub

    Protected Sub link_12Meses_Grupo_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles link_12Meses_Grupo.Click
        Call Linkar("Planejamento/Despesas/Consulta12Meses_OriGrupo.aspx", Me.lblCatCod.Text)
        '~/MemberPages/Planejamento/Despesas/Consulta12Meses_OriGrupo.aspx
    End Sub

    Protected Sub link_12Meses_GrupoAno_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles link_12Meses_GrupoAno.Click
        Call Linkar("Planejamento/Despesas/Consulta12Meses_OriSubgrupo.aspx", Me.lblCatCod.Text)
        '~/MemberPages/Planejamento/Despesas/Consulta12Meses_OriSubgrupo.aspx
    End Sub

    Protected Sub link_DRE_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles link_DRE.Click
        Call Linkar("Planejamento/viewDRE_Loja.aspx", Me.lblCatCod.Text)
        '~/MemberPages/Planejamento/viewDRE_Loja.aspx
    End Sub

    Protected Sub cboGrupo_Sub_ListGrupoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboGrupo_Sub.ListGrupoChanged
        Call Atualizar()
    End Sub

    Protected Sub cboGrupo_Sub_ListSubgrupoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboGrupo_Sub.ListSubgrupoChanged
        Call Atualizar()
        Call CalcularTodosPercentuaisMeta()
    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            Me.txt_vlrMeta01.Focus()
        End If

    End Sub

    Protected Sub Page_PreRenderComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            Me.NewItem.Value = oVem.Buscar_IDSubGrupo(Me.cboGrupo_Sub.CallGrupo)
            Call AdicionarSubgrupo()
            Call Busca_CatCod()

            Call Atualizar()
            Call PercMetaFormata()
        End If
        If Me.cboFilial.IsLoja = True Then Me.btnSalvar.Enabled = False
    End Sub
End Class
