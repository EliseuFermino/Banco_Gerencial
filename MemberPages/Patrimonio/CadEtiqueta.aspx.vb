Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_Patrimonio_CadEtiqueta
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes
    Dim oFun As New Funcoes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            oVem.AtualizarEstatisticaPrograma(329, User.Identity.Name)

            Dim DiaOntem As Date

            DiaOntem = DateAndTime.DateAdd(DateInterval.Day, -1, Date.Today)

            'cboDia_Inicio.Date = Today
            'cboDia_Inicio.MinDate  = DiaOntem


            txt_Observacao.Attributes.Add("autocomplete", "off")


            Enabled_Fields_False()

            cboDia_Inicio.Date = Today

        End If
    End Sub



    Private Sub Enabled_Fields_True()

        txt_Observacao.Enabled = True
        cboDia_Inicio.Enabled = True
        txtNomeFiscalConstatou.Enabled = True
        txtHora.Enabled = True

        rndCasulo.Enabled = True
        rndEtiquetaRigida.Enabled = True
        rndEtiquetaRigidaChinelo.Enabled = True
        rndGargalo.Enabled = True
        rndLabel.Enabled = True



    End Sub

    Private Sub Enabled_Fields_False()

        txt_Observacao.Enabled = False
        cboDia_Inicio.Enabled = False
        txtNomeFiscalConstatou.Enabled = False
        txtHora.Enabled = False

        rndCasulo.Enabled = False
        rndEtiquetaRigida.Enabled = False
        rndEtiquetaRigidaChinelo.Enabled = False
        rndGargalo.Enabled = False
        rndLabel.Enabled = False

    End Sub

    Protected Sub btnNovo_Click(sender As Object, e As EventArgs) Handles btnNovo.Click

        chkFixarDados.Enabled = False

        btnNovo.Enabled = False
        btnCancel.Enabled = True
        btnSave.Enabled = True

        Enabled_Fields_True()

    End Sub

    Protected Sub btnCancel_Click(sender As Object, e As EventArgs) Handles btnCancel.Click
        chkFixarDados.Enabled = True
        chkFixarDados.Checked = False

        btnCancel.Enabled = False
        btnSave.Enabled = False
        btnNovo.Enabled = True
        Clear_Fields()
        Enabled_Fields_False()


        rndCasulo.Enabled = True
        rndEtiquetaRigida.Enabled = False
        rndEtiquetaRigidaChinelo.Enabled = False
        rndGargalo.Enabled = False
        rndLabel.Enabled = False

    End Sub

    Private Sub Clear_Fields()

        txt_Observacao.Text = ""
        'cboDia_Inicio.Text = ""
        txtNomeFiscalConstatou.Text = ""
        txtHora.Text = ""

    End Sub

    Protected Sub btnSave_Click(sender As Object, e As EventArgs) Handles btnSave.Click

        Dim varEtiqueta As Byte
        If rndCasulo.Checked = True Then varEtiqueta = 7
        If rndEtiquetaRigida.Checked = True Then varEtiqueta = 8
        If rndEtiquetaRigidaChinelo.Checked = True Then varEtiqueta = 9
        If rndGargalo.Checked = True Then varEtiqueta = 10
        If rndLabel.Checked = True Then varEtiqueta = 11


        If String.IsNullOrWhiteSpace(txtNomeFiscalConstatou.Text) Then
            Beep()
            oVem.UserMsgBox(Me, "O campo 'Nome Fiscal que Constatou' não foi preenchido! Preenchimento obrigatório")
            txtNomeFiscalConstatou.Focus()
            Exit Sub
        Else
            Try

                Dim tbl As New tblDados

                tbl.idFilial = cboFilial.CallFilial
                tbl.NomeFiscalConstatou = txtNomeFiscalConstatou.Text
                tbl.idEtiqueta = varEtiqueta
                tbl.Dia = cboDia_Inicio.Date
                tbl.Hora = txtHora.Text

                tbl.Observacao = txt_Observacao.Text
                tbl.DiaCadastro = Today

                Using contexto As New gerProjetos_Entities
                    contexto.tblDados.Add(tbl)
                    contexto.SaveChanges()

                    'lblError.Text = "Cliente atualizado com sucesso !!"
                    oVem.UserMsgBox(Me, "O Lançamento foi salvo com sucesso!!!")

                    If chkFixarDados.Checked = True Then
                        Enabled_Fields_False()

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
                oVem.UserMsgBox(Me, "PROBLEMA!!! Esse Lançamento não foi salvo. Entre em contato com Eliseu no Ramal 2038 ou no telefone 9671-8959")

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

