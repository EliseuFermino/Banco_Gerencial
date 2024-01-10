Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_Patrimonio_CadPatrimonio
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes
    Dim oFun As New Funcoes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            oVem.AtualizarEstatisticaPrograma(330, User.Identity.Name)

            Dim DiaOntem As Date

                DiaOntem = DateAndTime.DateAdd(DateInterval.Day, -1, Date.Today)

                'cboDia_Inicio.Date = Today
                'cboDia_Inicio.MinDate  = DiaOntem

                txtEAN.Attributes.Add("autocomplete", "off")
                txtPreco.Attributes.Add("autocomplete", "off")
                txtQtde.Attributes.Add("autocomplete", "off")

                Enabled_Fields_False()

                cboDia_Inicio.Date = Today

            End If
    End Sub

    Private Sub BuscarProduto(ByVal iEAN As Int64)

        Dim varNomeFornecedor As String = ""
        Dim con As New SqlConnection(Conexao.gerManager)
        Dim comando As New SqlCommand("Cadastros.uspBuscarProdutoPeloEAN", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@EAN", SqlDbType.BigInt))
        comando.Parameters("@EAN").Value = iEAN

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                lblDescProduto.Text = reader5.GetSqlInt32(0).ToString & " - " & reader5.GetSqlString(1).ToString

            End While

        Catch ex As Exception
            Select Case Err.Number
                Case 5
                    oVem.UserMsgBox(Me, Err.Number & " - " & ex.Message)
                    'oVem.UserMsgBox(Me, "Este fornecedor não existe. Verifique.")
                Case Else
                    oVem.UserMsgBox(Me, Err.Number & " - " & ex.Message)
            End Select
        Finally
            con.Close()
        End Try

    End Sub

    Protected Sub TextEAN_TextChanged(sender As Object, e As EventArgs) Handles txtEAN.TextChanged
        If Not String.IsNullOrWhiteSpace(txtEAN.Text) Then
            BuscarProduto(txtEAN.Text)
            txtQtde.Focus()
        End If
        
    End Sub

    Protected Sub txtPreco_TextChanged(sender As Object, e As EventArgs) Handles txtPreco.TextChanged
        Totalizar()
        txtNomeFiscalAbordagem.Focus()
    End Sub

    Private Sub Totalizar()
        txtPreco.Text = Replace(txtPreco.Text, ".", ",")
        txtQtde.Text = Replace(txtQtde.Text, ".", ",")

        If Not String.IsNullOrWhiteSpace(txtQtde.Text) Then
            If Not String.IsNullOrWhiteSpace(txtPreco.Text) Then
                lblTotal.Text = (CDec(txtQtde.Text) * CDec(txtPreco.Text)).ToString("n2")
            End If
        End If
    End Sub

    Protected Sub txtQtde_TextChanged(sender As Object, e As EventArgs) Handles txtQtde.TextChanged
        Totalizar()
        txtPreco.Focus()
    End Sub


    Private Sub Enabled_Fields_True()
        txtEAN.Enabled = True
        txtQtde.Enabled = True
        txtPreco.Enabled = True
        txtNomeFiscalAbordagem.Enabled = True
        txt_Observacao.Enabled = True
        cboDia_Inicio.Enabled = True
        txtNomeFiscalConstatou.Enabled = True
        txtHora.Enabled = True
        txtNumCamera.Enabled = True
        txtDVR.Enabled = True

        rndReativa.Enabled = True
        rndPreventiva.Enabled = True
        rndEncaminhamentoPolicia.Enabled = True

        cboFurtante.Enabled = True
        txtIdade.Enabled = True

    End Sub

    Private Sub Enabled_Fields_False()
        txtEAN.Enabled = False
        txtQtde.Enabled = False
        txtPreco.Enabled = False
        txtNomeFiscalAbordagem.Enabled = False
        txt_Observacao.Enabled = False
        cboDia_Inicio.Enabled = False
        txtNomeFiscalConstatou.Enabled = False
        txtHora.Enabled = False
        txtNumCamera.Enabled = False
        txtDVR.Enabled = False

        rndReativa.Enabled = False
        rndPreventiva.Enabled = False
        rndEncaminhamentoPolicia.Enabled = False
        cboFurtante.Enabled = False
        txtIdade.Enabled = False

    End Sub

    Protected Sub btnNovo_Click(sender As Object, e As EventArgs) Handles btnNovo.Click

        chkFixarDados.Enabled = False

        btnNovo.Enabled = False
        btnCancel.Enabled = True
        btnSave.Enabled = True

        Enabled_Fields_True()
        txtEAN.Focus()
    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        chkFixarDados.Enabled = True
        chkFixarDados.Checked = False

        btnCancel.Enabled = False
        btnSave.Enabled = False
        btnNovo.Enabled = True
        Clear_Fields()
        Enabled_Fields_False()


        rndEncaminhamentoPolicia.Checked = False
        rndPreventiva.Checked = False
        rndReativa.Checked = True

    End Sub

    Private Sub Clear_Fields()
        txtEAN.Text = ""
        lblDescProduto.Text = ""
        txtQtde.Text = ""
        txtPreco.Text = ""
        txtNomeFiscalAbordagem.Text = ""
        txt_Observacao.Text = ""
        'cboDia_Inicio.Text = ""
        txtNomeFiscalConstatou.Text = ""
        txtHora.Text = ""
        txtNumCamera.Text = ""
        txtDVR.Text = ""
        lblTotal.Text = ""
        txtIdade.Text = ""
    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click

        Dim varReativaPreventiva As Byte
        If rndReativa.Checked = True Then varReativaPreventiva = 1 'Reativa
        If rndPreventiva.Checked = True Then varReativaPreventiva = 2 'Preventiva
        If rndEncaminhamentoPolicia.Checked = True Then varReativaPreventiva = 3 'Encaminhamento Policia



        If String.IsNullOrWhiteSpace(txtEAN.Text) Then
            Beep()
            oVem.UserMsgBox(Me, "O campo 'EAN' não foi preenchido! Preenchimento obrigatório")
            txtEAN.Focus()
            Exit Sub
        ElseIf String.IsNullOrWhiteSpace(txtQtde.Text) Then
            Beep()
            oVem.UserMsgBox(Me, "O campo 'Quantidade' não foi preenchido! Preenchimento obrigatório")
            txtQtde.Focus()
            Exit Sub
        ElseIf String.IsNullOrWhiteSpace(txtPreco.Text) Then
            Beep()
            oVem.UserMsgBox(Me, "O campo 'Preço' não foi preenchido! Preenchimento obrigatório")
            txtPreco.Focus()
            Exit Sub
        ElseIf String.IsNullOrWhiteSpace(txtNomeFiscalAbordagem.Text) Then
            Beep()
            oVem.UserMsgBox(Me, "O campo 'Nome Fiscal que realizou abordagem' não foi preenchido! Preenchimento obrigatório")
            txtNomeFiscalAbordagem.Focus()
            Exit Sub
        ElseIf String.IsNullOrWhiteSpace(txtNumCamera.Text) Then
            Beep()
            oVem.UserMsgBox(Me, "O campo 'Nº da Camera' não foi preenchido! Preenchimento obrigatório")
            txtNumCamera.Focus()
            Exit Sub
        ElseIf String.IsNullOrWhiteSpace(txtDVR.Text) Then
            Beep()
            oVem.UserMsgBox(Me, "O campo 'Nº do DVR' não foi preenchido! Preenchimento obrigatório")
            txtDVR.Focus()
            Exit Sub
        Else
            Try

                Dim tbl As New tblDados

                tbl.idFilial = cboFilial.CallFilial
                tbl.EAN = txtEAN.Text
                tbl.Qtde = txtQtde.Text
                tbl.Preco = txtPreco.Text
                tbl.Total = lblTotal.Text
                tbl.NomeFiscalAbordagem = txtNomeFiscalAbordagem.Text
                tbl.NomeFiscalConstatou = txtNomeFiscalConstatou.Text
                tbl.idReativaPreventiva = varReativaPreventiva
                tbl.idFurtante = cboFurtante.Value
                tbl.IdadeFurtante = txtIdade.Text
                tbl.Dia = cboDia_Inicio.Date
                tbl.Hora = txtHora.Text
                tbl.NumCamera = txtNumCamera.Text
                tbl.DVR = txtDVR.Text
                tbl.Observacao = txt_Observacao.Text
                tbl.DiaCadastro = Today

                Using contexto As New gerProjetos_Entities
                    contexto.tblDados.Add(tbl)
                    contexto.SaveChanges()

                    'lblError.Text = "Cliente atualizado com sucesso !!"
                    oVem.UserMsgBox(Me, "O Lançamento foi salvo com sucesso!!!")

                    If chkFixarDados.Checked = True Then
                        Enabled_Fields_False()

                        txtEAN.Enabled = True
                        txtQtde.Enabled = True
                        txtPreco.Enabled = True

                        txtEAN.Text = ""
                        lblDescProduto.Text = ""
                        txtQtde.Text = ""
                        txtPreco.Text = ""

                        txtEAN.Focus()
                    Else
                        Enabled_Fields_False()
                        btnCancel.Enabled = False
                        btnSave.Enabled = False
                        btnNovo.Enabled = True
                        Clear_Fields()
                    End If

                End Using
            Catch ex As Exception
                oVem.UserMsgBox(Me, ex.Message)

                Beep()
                oVem.UserMsgBox(Me, "PROBLEMA!!! Esse Lançamento não foi salvo. Entre em contato com a Jesuli no Ramal 3725")

            End Try
        End If

        

        'If Not (String.IsNullOrWhiteSpace(txtNome.Text)) Or Not _
        '       (String.IsNullOrWhiteSpace(txtEndereco.Text)) Or Not _
        '           (String.IsNullOrWhiteSpace(txtTelefone.Text)) Or Not _
        '               (String.IsNullOrWhiteSpace(txtEmail.Text)) Then
        '    'cria um novo objeto cliente
        '    Dim cli As New Cliente
        '    'atualiza os dados do objeto
        '    cli.nome = txtNome.Text
        '    cli.endereco = txtEndereco.Text
        '    cli.telefone = txtTelefone.Text
        '    cli.email = txtEmail.Text

        '    'cria um novo contexto
        '    Dim contexto As New CadastroEntities
        '    'adiciona a entidade ao contexto
        '    contexto.Clientes.Add(cli)
        '    'persiste as informação no banco de dados
        '    contexto.SaveChanges()
        'Else
        '    lblmsg.Text = "Informe os dados para incluir um novo Cliente"
        'End If



        ' ---------------------------------------------------------------------------------------------------------------------------------------------------------------------

        'Dim varReativaPreventiva As Byte
        'If rndReativa.Checked = True Then varReativaPreventiva = 1 'Reativa
        'If rndPreventiva.Checked = True Then varReativaPreventiva = 2 'Preventiva
        'If rndEncaminhamentoPolicia.Checked = True Then varReativaPreventiva = 3 'Encaminhamento Policia


        'If lblDescProduto.Text = "Null - Null" Then
        '    oVem.UserMsgBox(Me, "Você deve informar um EAN válido. O cadastro não foi Salvo.")
        '    txtEAN.Focus()
        '    Exit Sub
        'ElseIf lblDescProduto.Text = "" Then
        '    oVem.UserMsgBox(Me, "Você deve informar um EAN válido. O cadastro não foi Salvo.")
        '    txtEAN.Focus()
        '    Exit Sub
        'Else

        '    Dim oDB As New clDataDb
        '    oDB.ExecuteStoredProcedure("Patrimonio.usp_Insert_Dados", Conexao.gerProjetos.ConnectionString, "@Dia", CDate(cboDia_Inicio.Text),
        '                                                                                                    "@Hora", CStr(txtHora.Text),
        '                                                                                                      "@EAN", txtEAN.Text,
        '                                                                                                      "@Qtde", Replace(txtQtde.Text, ",", "."),
        '                                                                                                      "@Preco", Replace(txtPreco.Text, ",", "."),
        '                                                                                                      "@Total", Replace(lblTotal.Text, ",", "."),
        '                                                                                                      "@NomeFiscalAbordagem", txtNomeFiscalAbordagem.Text,
        '                                                                                                      "@Observacao", txt_Observacao.Text,
        '                                                                                                      "@NomeFiscalConstatou", txtNomeFiscalConstatou.Text,
        '                                                                                                      "@NumCamera", txtNumCamera.Text,
        '                                                                                                      "@DVR", txtDVR.Text,
        '                                                                                                      "@idFilial", cboFilial.CallFilial,
        '                                                                                                      "@idReativaPreventiva", varReativaPreventiva
        '    )


        '        oVem.UserMsgBox(Me, "Plano de Ação salvo com sucesso!!!")
        '        'End If
        '        ' Descrição de Erro
        '        'lblError.Text = oDB.varDesc & " - " & txtHora.Text & ":30"

        '        If chkFixarDados.Checked = True Then
        '            Enabled_Fields_False()

        '            txtEAN.Enabled = True
        '            txtQtde.Enabled = True
        '            txtPreco.Enabled = True

        '            txtEAN.Text = ""
        '            lblDescProduto.Text = ""
        '            txtQtde.Text = ""
        '            txtPreco.Text = ""
        '            txtIdade.Text = ""

        '            txtEAN.Focus()
        '        Else
        '            Enabled_Fields_False()
        '            btnCancel.Enabled = False
        '            btnSave.Enabled = False
        '            btnNovo.Enabled = True
        '            Clear_Fields()
        '        End If



        '    End If



        '',
        ''                                                                                                      "@idFurtante", 1,
        ''                                                                                                      "@idadeFurtante", "aa"


        ''Dim idCat As String = Request.QueryString("idCat")
        ''If CInt(idCat) > 0 Then
        ''    oDB.ExecuteStoredProcedure("PDCA.usp_Update_PlanoAcao", Conexao.gerProjetos.ConnectionString, "@ID", CInt(idCat),
        ''                                                                                                                  "@Area", cboArea.Value,
        ''                                                                                                                  "@Conta", cboConta.Value,
        ''                                                                                                                  "@Problema", cboTarefa.SelectedValue,
        ''                                                                                                                  "@Causa", cboCausa.Text,
        ''                                                                                                                  "@Acao", txt_Acao.Text,
        ''                                                                                                                  "@DiaInicial", cboDia_Inicio.Value,
        ''                                                                                                                  "@DiaFinal", cboDia_Fim.Value,
        ''                                                                                                                  "@Responsavel", txt_Responsavel.Text,
        ''                                                                                                                  "@Observacao", txt_Observacao.Text
        ''                )
        ''    oVem.UserMsgBox(Me, "Plano de Ação foi atualizado com sucesso!!!")
        ''Else

        ''If oDB.varDesc.Length > 0 Then
        ''    oVem.UserMsgBox(Me, "PROBLEMA!!! Esse registro não foi salvo. Entre em contato com Eliseu no Ramal 2038 ou no telefone 9671-8959")
        ''    lblError.Text = oDB.varDesc
        ''Else

    End Sub



End Class

