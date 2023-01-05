Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_cadProblemaCausa
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes
    Dim oFun As New Funcoes
    Dim oDb As New clDataDb

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            'oVem.AtualizarEstatisticaPrograma(316, Page.User.Identity.Name)

            cboDia.Date = DateAndTime.Today
            Enabled_Fields_False()
            cboSWOT.Enabled = False

            ' Descrição de Erro
            lblError.Visible = False

            btnCancel.Enabled = False
            btnSave.Enabled = False

            Dim idCat As String = Request.QueryString("idCat")

            If CInt(idCat) > 0 Then
                Buscar_ProblemaCausa(idCat)

                btnNovo.Enabled = False
                btnCancel.Enabled = True
                btnSave.Enabled = True
                Enabled_Fields_True()
                txtProblema.Focus()


            Else
                Atualizar()
            End If

            If rndSemSWOT.Checked = True Then
                cboSWOT.Visible = False
                lblCaptionSWOT.Visible = False
            Else
                cboSWOT.Visible = True
                lblCaptionSWOT.Visible = True
            End If

        End If
    End Sub


    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click

        Dim oDB As New clDataDb
        Dim idCat As String = Request.QueryString("idCat")

        Dim optSWOT As Byte
        If rndSemSWOT.Checked = True Then optSWOT = 0
        If rndForcas.Checked = True Then optSWOT = 1
        If rndFraquezas.Checked = True Then optSWOT = 2
        If rndOportunidade.Checked = True Then optSWOT = 3
        If rndAmeacas.Checked = True Then optSWOT = 4

        Try



            'Dim idCat As String = Request.QueryString("idCat")
            'If CInt(idCat) > 0 Then
            '    oDB.ExecuteStoredProcedure("PDCA.usp_Update_ProblemaBusca", Conexao.gerProjetos.ConnectionString, "@ID", CInt(idCat),
            '                                                                                                     "@Area", cboArea.Value,
            '                                                                                                      "@Conta", cboConta.Value,
            '                                                                                                      "@Problema", txtProblema.Text,
            '                                                                                                      "@Causa1", txt_Causa1.Text,
            '                                                                                                      "@Causa2", txt_Causa2.Text,
            '                                                                                                      "@Causa3", txt_Causa3.Text,
            '                                                                                                      "@Causa4", txt_Causa4.Text,
            '                                                                                                      "@Causa5", txt_Causa5.Text,
            '                                                                                                      "@Causa6", txt_Causa6.Text,
            '                                                                                                      "@descSWOT", cboSWOT.Text,
            '                                                                                                      "@idSWOT", optSWOT
            '    )
            '    oVem.UserMsgBox(Me, "Problema e Causa foi atualizado com sucesso!!!")
            'Else
            If rndSemSWOT.Checked = True Then

                If CInt(idCat) > 0 Then
                    oDB.ExecuteStoredProcedure("PDCA.usp_Update_ProblemaBusca", Conexao.gerProjetos.ConnectionString, "@ID", CInt(idCat),
                                                                                                                     "@Area", cboArea.Value,
                                                                                                                      "@Conta", cboConta.Value,
                                                                                                                      "@Problema", txtProblema.Text,
                                                                                                                      "@Causa1", txt_Causa1.Text,
                                                                                                                      "@Causa2", txt_Causa2.Text,
                                                                                                                      "@Causa3", txt_Causa3.Text,
                                                                                                                      "@Causa4", txt_Causa4.Text,
                                                                                                                      "@Causa5", txt_Causa5.Text,
                                                                                                                      "@Causa6", txt_Causa6.Text,
                                                                                                                      "@descSWOT", cboSWOT.Text,
                                                                                                                      "@idSWOT", optSWOT
                    )
                    oVem.UserMsgBox(Me, "Problema e Causa foi atualizado com sucesso!!!")
                Else

                    oDB.ExecuteStoredProcedure("PDCA.usp_Insert_ProblemaCausa", Conexao.gerProjetos.ConnectionString, "@DataCadastro", cboDia.Date,
                                                                                                                 "@Area", cboArea.Value,
                                                                                                                 "@Conta", cboConta.Value,
                                                                                                                 "@Problema", txtProblema.Text,
                                                                                                                 "@Causa1", txt_Causa1.Text,
                                                                                                                 "@Causa2", txt_Causa2.Text,
                                                                                                                 "@Causa3", txt_Causa3.Text,
                                                                                                                 "@Causa4", txt_Causa4.Text,
                                                                                                                 "@Causa5", txt_Causa5.Text,
                                                                                                                 "@Causa6", txt_Causa6.Text,
                                                                                                                 "@idFilial", cboFilial.CallFilial,
                                                                                                                 "@cboSWOT", "99",
                                                                                                                 "@descSWOT", "Padrão",
                                                                                                                 "@idSWOT", optSWOT
               )
                    oVem.UserMsgBox(Me, "Problema e Causa foi salvo com sucesso!!!")
                End If
            Else
                If CInt(idCat) > 0 Then
                    oDB.ExecuteStoredProcedure("PDCA.usp_Update_ProblemaBusca", Conexao.gerProjetos.ConnectionString, "@ID", CInt(idCat),
                                                                                                                     "@Area", cboArea.Value,
                                                                                                                      "@Conta", cboConta.Value,
                                                                                                                      "@Problema", txtProblema.Text,
                                                                                                                      "@Causa1", txt_Causa1.Text,
                                                                                                                      "@Causa2", txt_Causa2.Text,
                                                                                                                      "@Causa3", txt_Causa3.Text,
                                                                                                                      "@Causa4", txt_Causa4.Text,
                                                                                                                      "@Causa5", txt_Causa5.Text,
                                                                                                                      "@Causa6", txt_Causa6.Text,
                                                                                                                      "@descSWOT", cboSWOT.Text,
                                                                                                                      "@idSWOT", optSWOT
                    )
                    oVem.UserMsgBox(Me, "Problema e Causa foi atualizado com sucesso!!!")
                Else
                    oDB.ExecuteStoredProcedure("PDCA.usp_Insert_ProblemaCausa", Conexao.gerProjetos.ConnectionString, "@DataCadastro", cboDia.Date,
                                                                                                                 "@Area", cboArea.Value,
                                                                                                                 "@Conta", cboConta.Value,
                                                                                                                 "@Problema", txtProblema.Text,
                                                                                                                 "@Causa1", txt_Causa1.Text,
                                                                                                                 "@Causa2", txt_Causa2.Text,
                                                                                                                 "@Causa3", txt_Causa3.Text,
                                                                                                                 "@Causa4", txt_Causa4.Text,
                                                                                                                 "@Causa5", txt_Causa5.Text,
                                                                                                                 "@Causa6", txt_Causa6.Text,
                                                                                                                 "@idFilial", cboFilial.CallFilial,
                                                                                                                 "@cboSWOT", cboSWOT.Value,
                                                                                                                 "@descSWOT", cboSWOT.Text,
                                                                                                                 "@idSWOT", optSWOT
               )
                    oVem.UserMsgBox(Me, "Problema e Causa foi salvo com sucesso!!!")
                End If

            End If

            ' Descrição de Erro
            lblError.Text = oDB.varDesc

            Enabled_Fields_False()
            btnCancel.Enabled = False
            btnSave.Enabled = False
            btnNovo.Enabled = True

        Catch ex As Exception
            lblError.Text = ex.Message

        Finally


        End Try

    End Sub

    Private Sub Clear_Fields()
        txtProblema.Text = ""
        txt_Causa1.Text = ""
        txt_Causa2.Text = ""
        txt_Causa3.Text = ""
        txt_Causa4.Text = ""
        txt_Causa5.Text = ""
        txt_Causa6.Text = ""
    End Sub

    Private Sub Enabled_Fields_True()
        txtProblema.Enabled = True
        txt_Causa1.Enabled = True
        txt_Causa2.Enabled = True
        txt_Causa3.Enabled = True
        txt_Causa4.Enabled = True
        txt_Causa5.Enabled = True
        txt_Causa6.Enabled = True
    End Sub

    Private Sub Enabled_Fields_False()
        txtProblema.Enabled = False
        txt_Causa1.Enabled = False
        txt_Causa2.Enabled = False
        txt_Causa3.Enabled = False
        txt_Causa4.Enabled = False
        txt_Causa5.Enabled = False
        txt_Causa6.Enabled = False
    End Sub

    Protected Sub btnNovo_Click(sender As Object, e As EventArgs) Handles btnNovo.Click

        'If cboSWOT.SelectedIndex < 0 Then
        '    cboSWOT.Focus()
        '    Exit Sub
        '    oVem.UserMsgBox(Me, "Eliseu")
        'End If

        btnNovo.Enabled = False
        btnCancel.Enabled = True
        btnSave.Enabled = True
        Clear_Fields()
        Enabled_Fields_True()
        txtProblema.Focus()

    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        btnCancel.Enabled = False
        btnSave.Enabled = False
        btnNovo.Enabled = True

        Dim idCat As String = Request.QueryString("idCat")

        If CInt(idCat) <= 0 Then Clear_Fields()

        Enabled_Fields_False()
    End Sub

    Sub Buscar_ProblemaCausa(ByVal idCat As String)


        Dim con As New SqlConnection()
        con = Conexao.gerProjetos

        Dim comando As New SqlCommand("PDCA.usp_Buscar_ProblemaCausa", con)
        comando.CommandType = CommandType.StoredProcedure

        'comando.Parameters.Add(New SqlParameter("@idFilial", Data.SqlDbType.TinyInt))
        'comando.Parameters("@idFilial").Value = Session("sFILIAL")

        'comando.Parameters.Add(New SqlParameter("@idFilial", Data.SqlDbType.TinyInt))
        'comando.Parameters("@idFilial").Value = Session("sFILIAL")

        comando.Parameters.Add(New SqlParameter("@ID", Data.SqlDbType.Int))
        comando.Parameters("@ID").Value = idCat

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                cboArea.Value = reader5.GetSqlByte(1).ToString()
                cboConta.Value = reader5.GetSqlByte(2).ToString()
                txtProblema.Text = Trim(reader5.GetSqlString(3).ToString())
                txt_Causa1.Text = Trim(reader5.GetSqlString(4).ToString())
                txt_Causa2.Text = Trim(reader5.GetSqlString(5).ToString())
                txt_Causa3.Text = Trim(reader5.GetSqlString(6).ToString())
                txt_Causa4.Text = Trim(reader5.GetSqlString(7).ToString())
                txt_Causa5.Text = Trim(reader5.GetSqlString(8).ToString())
                txt_Causa6.Text = Trim(reader5.GetSqlString(9).ToString())

                ''Preencher_rnd(reader5.GetByte(12))
                cboSWOT.Value = reader5.GetSqlByte(10)
                cboFilial.CallFilial = reader5.GetSqlByte(11).ToString()

                cboDia.Date = reader5.GetSqlString(0).ToString()
            End While

        Catch ex As Exception
            Beep()
            oVem.UserMsgBox(Me, "Módulo: BuscarAtas - " & ex.Message)
            lblError.Text = "Náo Trouxe a Data"
        Finally
            con.Close()

        End Try

    End Sub

    Protected Sub rndSWOT_CheckedChanged(sender As Object, e As EventArgs)
        Atualizar()
    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        Clear_Fields()
        Atualizar()
    End Sub

    Sub Atualizar()

        Session("sFILIAL") = cboFilial.CallFilial

        If rndSemSWOT.Checked = True Then Session("sSWOT") = 0
        If rndForcas.Checked = True Then Session("sSWOT") = 1
        If rndFraquezas.Checked = True Then Session("sSWOT") = 2
        If rndOportunidade.Checked = True Then Session("sSWOT") = 3
        If rndAmeacas.Checked = True Then Session("sSWOT") = 4

        If rndSemSWOT.Checked = True Then
            cboSWOT.Enabled = False
        Else
            cboSWOT.Enabled = True
            cboSWOT.DataBind()
        End If

        Buscar_Problema_Causa()

    End Sub

    Private Sub Preencher_rnd(ByVal myValue As Byte)

        Select Case myValue
            Case 0
                rnd_det(True, False, False, False, False)
            Case 1
                rnd_det(False, True, False, False, False)
            Case 2
                rnd_det(False, False, True, False, False)
            Case 3
                rnd_det(False, False, False, True, False)
            Case 4
                rnd_det(False, False, False, False, True)
        End Select

    End Sub

    Private Sub rnd_det(ByVal Padrao As Boolean, ByVal Forcas As Boolean, ByVal Fraquezas As Boolean, ByVal Oportunidades As Boolean, ByVal Ameacas As Boolean)

        rndSemSWOT.Checked = Padrao
        rndForcas.Checked = Forcas
        rndFraquezas.Checked = Fraquezas
        rndOportunidade.Checked = Oportunidades
        rndAmeacas.Checked = Ameacas

        Atualizar()
    End Sub

    Protected Sub btnEdit_Click(sender As Object, e As EventArgs) Handles btnEdit.Click

        btnNovo.Enabled = False
        btnEdit.Enabled = False
        btnCancel.Enabled = True
        btnSave.Enabled = True
        Clear_Fields()
        Buscar_Problema_Causa()
        Enabled_Fields_True()
        txtProblema.Focus()

    End Sub



    Sub Buscar_Problema_Causa()

        Dim con As New SqlConnection()
        con = Conexao.gerProjetos
        Dim strSQL As String = "PDCA.usp_Buscar_ProblemaCausa"
        Dim comando As New SqlCommand(strSQL, con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idFilial", Data.SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = cboFilial.CallFilial

        comando.Parameters.Add(New SqlParameter("@Dia", Data.SqlDbType.Date))
        comando.Parameters("@Dia").Value = cboDia.Date

        comando.Parameters.Add(New SqlParameter("@Area", Data.SqlDbType.TinyInt))
        comando.Parameters("@Area").Value = cboArea.Value

        comando.Parameters.Add(New SqlParameter("@Conta", Data.SqlDbType.TinyInt))
        comando.Parameters("@Conta").Value = cboConta.Value

        comando.Parameters.Add(New SqlParameter("@idSWOT", Data.SqlDbType.TinyInt))
        comando.Parameters("@idSWOT").Value = Session("sSWOT")


        comando.Parameters.Add(New SqlParameter("@cboSWOT", Data.SqlDbType.TinyInt))
        comando.Parameters("@cboSWOT").Value = cboSWOT.Value



        Try

            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read
                txtProblema.Text = reader5.GetSqlString(0).ToString
                txt_Causa1.Text = reader5.GetSqlString(1).ToString
                txt_Causa2.Text = reader5.GetSqlString(2).ToString
                txt_Causa3.Text = reader5.GetSqlString(3).ToString
                txt_Causa4.Text = reader5.GetSqlString(4).ToString
                txt_Causa5.Text = reader5.GetSqlString(5).ToString
                txt_Causa6.Text = reader5.GetSqlString(6).ToString
                cboSWOT.Value = reader5.GetSqlByte(7).ToString
            End While

        Catch ex As Exception
            Beep()
            ' oVem.UserMsgBox(Me, ex.Message)

        Finally
            con.Close()
        End Try
    End Sub

    Protected Sub cboSWOT_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboSWOT.SelectedIndexChanged
        Clear_Fields()
        btnEdit.Enabled = True
        Buscar_Problema_Causa()
    End Sub

 
End Class
