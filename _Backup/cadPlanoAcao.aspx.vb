Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_cadPlanoAcao
    Inherits System.Web.UI.Page

    'Dim oVem As New VendaEmpresaMes

    'Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load


    '    If Not IsPostBack Then
    '        oVem.AtualizarEstatisticaPrograma(315, Page.User.Identity.Name)

    '        cboCausa.SelectedIndex = -1

    '        cboFilial.cboFilial_Visible_Legenda = False
    '        cboDia.Date = DateAndTime.Today
    '        Enabled_Fields_False()

    '        lblError.Visible = True

    '        Dim idCat As String = Request.QueryString("idCat")
    '        If CInt(idCat) > 0 Then
    '            Buscar_PlanoDeAcao()

    '            btnNovo.Enabled = False
    '            btnCancel.Enabled = True
    '            btnSave.Enabled = True
    '            Enabled_Fields_True()
    '            txt_Acao.Focus()

    '        End If

    '        Session("sFILIAL") = cboFilial.CallFilial

    '    End If

    'End Sub

    'Private Sub Clear_Fields()
    '    txt_Acao.Text = ""
    '    txt_Responsavel.Text = ""
    '    txt_Observacao.Text = ""
    '    cboDia_Inicio.Date = Nothing
    '    cboDia_Fim.Date = Nothing
    'End Sub

    'Private Sub Enabled_Fields_True()
    '    cboCausa.Enabled = True
    '    cboTarefa.Enabled = True
    '    txt_Acao.Enabled = True
    '    txt_Responsavel.Enabled = True
    '    txt_Observacao.Enabled = True
    '    cboDia_Inicio.Enabled = True
    '    cboDia_Fim.Enabled = True

    'End Sub

    'Private Sub Enabled_Fields_False()
    '    cboCausa.Enabled = False
    '    cboTarefa.Enabled = False
    '    txt_Acao.Enabled = False
    '    txt_Responsavel.Enabled = False
    '    txt_Observacao.Enabled = False
    '    cboDia_Inicio.Enabled = False
    '    cboDia_Fim.Enabled = False
    'End Sub

    'Protected Sub btnNovo_Click(sender As Object, e As EventArgs) Handles btnNovo.Click
    '    btnNovo.Enabled = False
    '    btnCancel.Enabled = True
    '    btnSave.Enabled = True
    '    Clear_Fields()
    '    Enabled_Fields_True()
    '    cboCausa.Focus()

    '    Session("sID") = cboTarefa.SelectedValue
    '    cboCausa.DataBind()

    '    lblError.Text = cboTarefa.SelectedValue
    'End Sub

    'Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
    '    btnCancel.Enabled = False
    '    btnSave.Enabled = False
    '    btnNovo.Enabled = True
    '    Clear_Fields()
    '    Enabled_Fields_False()
    'End Sub

    'Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click

    '    Dim oDB As New clDataDb

    '    Dim idCat As String = Request.QueryString("idCat")
    '    If CInt(idCat) > 0 Then
    '        oDB.ExecuteStoredProcedure("PDCA.usp_Update_PlanoAcao", Conexao.gerProjetos.ConnectionString, "@ID", CInt(idCat),
    '                                                                                                                      "@Area", cboArea.Value,
    '                                                                                                                      "@Conta", cboConta.Value,
    '                                                                                                                      "@Problema", cboTarefa.SelectedValue,
    '                                                                                                                      "@Causa", cboCausa.Text,
    '                                                                                                                      "@Acao", txt_Acao.Text,
    '                                                                                                                      "@DiaInicial", cboDia_Inicio.Value,
    '                                                                                                                      "@DiaFinal", cboDia_Fim.Value,
    '                                                                                                                      "@Responsavel", txt_Responsavel.Text,
    '                                                                                                                      "@Observacao", txt_Observacao.Text
    '                    )
    '        oVem.UserMsgBox(Me, "Plano de Ação foi atualizado com sucesso!!!")
    '    Else
    '        oDB.ExecuteStoredProcedure("PDCA.usp_Insert_PlanoAcao", Conexao.gerProjetos.ConnectionString, "@DataCadastro", cboDia.Value,
    '                                                                                                          "@Area", cboArea.Value,
    '                                                                                                          "@Conta", cboConta.Value,
    '                                                                                                          "@Problema", cboTarefa.SelectedValue,
    '                                                                                                          "@Causa", cboCausa.Text,
    '                                                                                                          "@Acao", txt_Acao.Text,
    '                                                                                                          "@DiaInicial", cboDia_Inicio.Value,
    '                                                                                                          "@DiaFinal", cboDia_Fim.Value,
    '                                                                                                          "@Responsavel", txt_Responsavel.Text,
    '                                                                                                          "@Observacao", txt_Observacao.Text,
    '                                                                                                          "@idFilial", cboFilial.CallFilial
    '        )
    '        oVem.UserMsgBox(Me, "Plano de Ação salvo com sucesso!!!")
    '    End If
    '    ' Descrição de Erro
    '    lblError.Text = oDB.varDesc

    '    Enabled_Fields_False()
    '    btnCancel.Enabled = False
    '    btnSave.Enabled = False
    '    btnNovo.Enabled = True

    'End Sub

    'Sub Buscar_PlanoDeAcao()


    '    Dim idCat As String = Request.QueryString("idCat")
    '    Dim idFilial As String = Request.QueryString("idFilial")

    '    cboFilial.CallFilial = idFilial

    '    dsListaProblemaCausa.DataBind()

    '    Dim con As New SqlConnection()
    '    con = Conexao.gerProjetos

    '    Dim comando As New SqlCommand("PDCA.usp_Buscar_PlanoAcao", con)
    '    comando.CommandType = CommandType.StoredProcedure

    '    comando.Parameters.Add(New SqlParameter("@ID", Data.SqlDbType.Int))
    '    comando.Parameters("@ID").Value = idCat

    '    Try
    '        con.Open()
    '        Dim reader5 As SqlDataReader
    '        reader5 = comando.ExecuteReader()
    '        While reader5.Read
    '            cboDia.Text = CDate(reader5.GetSqlString(0).ToString())
    '            cboArea.Text = reader5.GetByte(1)
    '            cboConta.Text = reader5.GetByte(2)
    '            cboCausa.Text = Trim(reader5.GetSqlString(3).ToString())
    '            txt_Acao.Text = Trim(reader5.GetSqlString(4).ToString())
    '            cboDia_Inicio.Date = CDate(reader5.GetSqlString(5).ToString())
    '            cboDia_Fim.Date = CDate(reader5.GetSqlString(6).ToString())
    '            txt_Responsavel.Text = Trim(reader5.GetSqlString(7).ToString())
    '            txt_Observacao.Text = Trim(reader5.GetSqlString(8).ToString())
    '        End While

    '    Catch ex As Exception
    '        Beep()
    '        oVem.UserMsgBox(Me, "Módulo: BuscarAtas - " & ex.Message)
    '    Finally
    '        con.Close()
    '    End Try

    'End Sub

    'Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
    '    AtualizarSWOT()
    'End Sub

    'Protected Sub cboArea_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboArea.SelectedIndexChanged
    '    AtualizarSWOT()
    'End Sub

    'Private Sub AtualizarSWOT()
    '    Session("sFILIAL") = cboFilial.CallFilial
    '    Session("sAREA") = cboArea.Value
    '    Session("sCONTA") = cboConta.Value
    '    Session("sID") = cboTarefa.SelectedItem
    '    cboTarefa.DataBind()
    '    cboCausa.DataBind()


    'End Sub

    'Protected Sub cboConta_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboConta.SelectedIndexChanged
    '    AtualizarSWOT()
    'End Sub

    'Protected Sub cboTarefa_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboTarefa.SelectedIndexChanged
    '    'Session("sID") = cboTarefa.SelectedValue
    '    'lblError.Text = Session("sID")
    '    'dsListaCausa.DataBind()
    '    'cboCausa.DataBind()
    'End Sub

End Class
