
Imports System.Data
Imports System.Data.SqlClient

Partial Class Tesouraria_AlteracaoConta
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes

    Private Sub LimparControles()

        Me.txtNomeCompleto.Text = ""
        Me.txtMatricula.Text = ""
        Me.txtCPF.Text = ""
        Me.txtPIS.Text = ""
        Me.txtCarteiraDeTrabalho.Text = ""
        Me.txtDataNascimento.Text = ""
        Me.txtLocalNascimento.Text = ""
        Me.cboUFNascimento.Text = ""

        Me.txtNomeDoConjuge.Text = ""
        Me.txtNomeDoPai.Text = ""
        Me.txtNomeDaMae.Text = ""
        Me.cboSexo.Text = ""
        Me.txtNumeroRG.Text = ""
        Me.txtOrgaoEmissorRG.Text = ""
        Me.cboUF_RG.Text = ""
        Me.txtDOC.Text = ""

        Me.txtDataAdmissao.Text = ""
        Me.txtEndereco.Text = ""
        Me.txtNumero.Text = ""
        Me.txtComplemento.Text = ""
        Me.txtBairro.Text = ""
        Me.txtCidade.Text = ""
        Me.cboUF.Text = ""
        Me.txtCEP.Text = ""

        Me.txtTelefone.Text = ""
        Me.txtEmail.Text = ""

        Me.txtRenda.Text = ""
        Me.txtCtaDestinoBanco.Text = ""
        Me.txtCtaDestinoAgencia.Text = ""
        Me.txtCtaDestinoDV.Text = ""

        ItemsDefault()

    End Sub

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(225, User.Identity.Name)

            Me.cboFilial.Visible_cboCorporacao = False

            Me.btnAlterar.Enabled = True

            Me.cboFilial.AutoPostBack = True

            ItemsDefault()
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Alteração de Contas - PGR228"
        End If
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            Session("sFILIAL") = Me.cboFilial.CallFilial
            Me.cboCPF.DataBind()
        End If
    End Sub

#End Region


    Private Sub ItemsDefault()
        Me.cboOcupacao.SelectedValue = 999
        Me.cboGrauDeInstrucao.SelectedValue = 0
        Me.cboEstadoCivil.SelectedValue = 1

        Me.txtNomeCompleto.Focus()
    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Me.cboCPF.DataBind()
        Me.cboCPF.CallCPF = Nothing
    End Sub

    Protected Sub cboCPF_ListCPFChanged(sender As Object, e As EventArgs) Handles cboCPF.ListCPFChanged
        On Error Resume Next
        Dim oTes As New Tesouraria
        Dim varCPF As String

        LimparControles()

        varCPF = Me.cboCPF.CallCPF

        Select Case varCPF.Length
            Case 10
                varCPF = "0" & varCPF
            Case 9
                varCPF = "00" & varCPF
            Case 8
                varCPF = "000" & varCPF
        End Select

        oTes.BuscaCadastro(CLng(Me.cboCPF.CallCPF))

        Me.txtNomeCompleto.Text = oTes.NomeCompleto

        ClearIfNull(txtMatricula, oTes.Matricula)

        Me.txtCPF.Text = varCPF
        Me.txtDataNascimento.Text = oTes.DataNascimento
        Me.txtLocalNascimento.Text = oTes.LocalNascimento
        Me.cboUFNascimento.Text = oTes.UF_Nascimento
        Me.cboEstadoCivil.Text = oTes.EstadoCivil
        Me.txtNomeDoConjuge.Text = oTes.NomeDoConjuge
        Me.txtNomeDoPai.Text = oTes.NomeDoPai
        Me.txtNomeDaMae.Text = oTes.NomeDaMae
        Me.cboSexo.Text = oTes.Sexo
        ClearIfNull(Me.txtNumeroRG, oTes.NumeroDoRG)
        Me.txtOrgaoEmissorRG.Text = oTes.OrgaoEmissor
        Me.cboUF_RG.Text = oTes.UFRG
        Me.txtDOC.Text = oTes.DOC
        Me.cboOcupacao.Text = oTes.Ocupacao
        Me.txtDataAdmissao.Text = oTes.DataAdmissao
        Me.txtEndereco.Text = oTes.Endereco

        ClearIfNull(Me.txtNumero, oTes.Numero)
        ClearIfNull(Me.txtComplemento, oTes.Complemento)
        Me.txtBairro.Text = oTes.Bairro
        Me.txtCidade.Text = oTes.Cidade
        Me.cboUF.Text = oTes.UF
        Me.txtCEP.Text = oTes.CEP
        Me.txtTelefone.Text = oTes.DDD & oTes.Telefone

        Me.txtEmail.Text = oTes.Email

        Me.cboGrauDeInstrucao.Text = oTes.GrauDeInstrucao
        Me.txtRenda.Text = oTes.Renda





    End Sub

    Private Sub ClearIfNull(ByVal iTextBox As TextBox, iObject As Object)
        If iObject.Equals("Null") Then
            iTextBox.Text = String.Empty
        Else
            iTextBox.Text = iObject
        End If
    End Sub

#Region " Atualizar"

    Protected Sub btnAlterar_Click(sender As Object, e As EventArgs) Handles btnAlterar.Click

        Dim varRenda As Decimal

        Dim varMatricula As Integer
        Dim varNumero As Integer
        Dim varCPF As Long

        varCPF = CLng(Left(Me.txtCPF.Text, 3) & Left(Mid(Me.txtCPF.Text, 5), 3) & Left(Mid(Me.txtCPF.Text, 9), 3) & Right(Me.txtCPF.Text, 2))

        Me.vs.Visible = True


        If Me.txtRenda.Text Is Nothing = True Then
            varRenda = 0
        Else
            varRenda = CDec(Me.txtRenda.Text)
        End If

        If Me.txtMatricula.Text Is Nothing = True Then
            varMatricula = 0
        Else
            varMatricula = CInt(Me.txtMatricula.Text)
        End If

        If Me.txtNumero.Text Is Nothing = True Then
            varNumero = 0
        Else
            varNumero = CInt(Me.txtNumero.Text)
        End If

        Atualizar(
        varCPF,
        Me.txtNomeCompleto.Text,
        varMatricula,
        Me.txtPIS.Text,
        Me.txtCarteiraDeTrabalho.Text,
        Me.txtDataNascimento.Text,
        Me.txtLocalNascimento.Text,
        Me.cboUFNascimento.SelectedValue,
        Me.cboEstadoCivil.SelectedValue,
        Me.txtNomeDoConjuge.Text,
        Me.txtNomeDoPai.Text,
        Me.txtNomeDaMae.Text,
        Me.cboSexo.SelectedValue,
        Me.txtNumeroRG.Text,
        Me.txtOrgaoEmissorRG.Text,
        Me.cboUF_RG.SelectedValue,
        Me.txtDOC.Text,
        Me.cboOcupacao.SelectedValue,
        Me.txtDataAdmissao.Text,
        Me.txtEndereco.Text,
        varNumero,
        Me.txtComplemento.Text,
        Me.txtBairro.Text,
        Me.txtCidade.Text,
        Me.cboUF.SelectedValue,
        Left(Me.txtCEP.Text, 5) & Right(Me.txtCEP.Text, 3),
        Me.txtTelefone.Text,
        Me.txtEmail.Text,
        Me.cboGrauDeInstrucao.SelectedValue,
        varRenda,
        User.Identity.Name,
        Me.cboFilial.CallFilial)


    End Sub


    Public Function Atualizar(ByVal CPF As Long,
      ByVal NomeCompleto As String,
      ByVal Matricula As Integer,
      ByVal PIS As String,
      ByVal CarteiraDeTrabalho As String,
      ByVal DataNascimento As Date,
      ByVal LocalNascimento As String,
      ByVal UFNascimento As Byte,
      ByVal EstadoCivil As Byte,
      ByVal NomeDoConjuge As String,
      ByVal NomeDoPai As String,
      ByVal NomeDaMae As String,
      ByVal Sexo As Byte,
      ByVal NumeroDoRG As String,
      ByVal OrgaoEmissorRG As String,
      ByVal UFRG As Byte,
      ByVal DOC As Date,
      ByVal Ocupacao As Int16,
      ByVal DataDeAdmissao As Date,
      ByVal Endereco As String,
      ByVal Numero As Integer,
      ByVal Complemento As String,
      ByVal Bairro As String,
      ByVal Cidade As String,
      ByVal UF As Byte,
      ByVal CEP As Integer,
      ByVal Telefone As String,
      ByVal Email As String,
      ByVal GrauDeInstrucao As Byte,
      ByVal Renda As Decimal,
      ByVal Usuario As String,
      ByVal idFilial As Byte) As Boolean

        Dim gravou As Boolean
        Dim con As New SqlConnection(Conexao.gerTesouraria)
        Dim comando As New SqlCommand("usp_AtualizarConta", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@CPF", SqlDbType.VarChar))
        comando.Parameters("@CPF").Value = CPF

        comando.Parameters.Add(New SqlParameter("@NomeCompleto", SqlDbType.VarChar))
        comando.Parameters("@NomeCompleto").Value = NomeCompleto

        comando.Parameters.Add(New SqlParameter("@Matricula", SqlDbType.Int))
        comando.Parameters("@Matricula").Value = Matricula

        comando.Parameters.Add(New SqlParameter("@PIS", SqlDbType.VarChar))
        comando.Parameters("@PIS").Value = PIS

        comando.Parameters.Add(New SqlParameter("@CarteiraDeTrabalho", SqlDbType.VarChar))
        comando.Parameters("@CarteiraDeTrabalho").Value = CarteiraDeTrabalho

        comando.Parameters.Add(New SqlParameter("@DataNascimento", SqlDbType.Date))
        comando.Parameters("@DataNascimento").Value = DataNascimento

        comando.Parameters.Add(New SqlParameter("@LocalNascimento", SqlDbType.VarChar))
        comando.Parameters("@LocalNascimento").Value = LocalNascimento

        comando.Parameters.Add(New SqlParameter("@UFNascimento", SqlDbType.TinyInt))
        comando.Parameters("@UFNascimento").Value = UFNascimento

        comando.Parameters.Add(New SqlParameter("@EstadoCivil", SqlDbType.TinyInt))
        comando.Parameters("@EstadoCivil").Value = EstadoCivil

        comando.Parameters.Add(New SqlParameter("@NomeDoConjuge", SqlDbType.VarChar))
        comando.Parameters("@NomeDoConjuge").Value = NomeDoConjuge

        comando.Parameters.Add(New SqlParameter("@NomeDoPai", SqlDbType.VarChar))
        comando.Parameters("@NomeDoPai").Value = NomeDoPai

        comando.Parameters.Add(New SqlParameter("@NomeDaMae", SqlDbType.VarChar))
        comando.Parameters("@NomeDaMae").Value = NomeDaMae


        comando.Parameters.Add(New SqlParameter("@Sexo", SqlDbType.TinyInt))
        comando.Parameters("@Sexo").Value = Sexo

        comando.Parameters.Add(New SqlParameter("@NumeroDoRG", SqlDbType.VarChar))
        comando.Parameters("@NumeroDoRG").Value = NumeroDoRG

        comando.Parameters.Add(New SqlParameter("@OrgaoEmissorRG", SqlDbType.VarChar))
        comando.Parameters("@OrgaoEmissorRG").Value = OrgaoEmissorRG

        comando.Parameters.Add(New SqlParameter("@UFRG", SqlDbType.TinyInt))
        comando.Parameters("@UFRG").Value = UFRG

        comando.Parameters.Add(New SqlParameter("@DOC", SqlDbType.Date))
        comando.Parameters("@DOC").Value = DOC

        comando.Parameters.Add(New SqlParameter("@Ocupacao", SqlDbType.SmallInt))
        comando.Parameters("@Ocupacao").Value = Ocupacao

        comando.Parameters.Add(New SqlParameter("@DataDeAdmissao", SqlDbType.Date))
        comando.Parameters("@DataDeAdmissao").Value = DataDeAdmissao

        comando.Parameters.Add(New SqlParameter("@Endereco", SqlDbType.VarChar))
        comando.Parameters("@Endereco").Value = Endereco

        comando.Parameters.Add(New SqlParameter("@Numero", SqlDbType.Int))
        comando.Parameters("@Numero").Value = Numero

        comando.Parameters.Add(New SqlParameter("@Complemento", SqlDbType.VarChar))
        comando.Parameters("@Complemento").Value = Complemento

        comando.Parameters.Add(New SqlParameter("@Bairro", SqlDbType.VarChar))
        comando.Parameters("@Bairro").Value = Bairro

        comando.Parameters.Add(New SqlParameter("@Cidade", SqlDbType.VarChar))
        comando.Parameters("@Cidade").Value = Cidade

        comando.Parameters.Add(New SqlParameter("@UF", SqlDbType.TinyInt))
        comando.Parameters("@UF").Value = UF

        comando.Parameters.Add(New SqlParameter("@CEP", SqlDbType.Int))
        comando.Parameters("@CEP").Value = CEP

        comando.Parameters.Add(New SqlParameter("@Telefone", SqlDbType.VarChar))
        comando.Parameters("@Telefone").Value = Telefone

        comando.Parameters.Add(New SqlParameter("@Email", SqlDbType.VarChar))
        comando.Parameters("@Email").Value = Email

        comando.Parameters.Add(New SqlParameter("@GrauDeInstrucao", SqlDbType.TinyInt))
        comando.Parameters("@GrauDeInstrucao").Value = GrauDeInstrucao

        comando.Parameters.Add(New SqlParameter("@Renda", SqlDbType.Money))
        comando.Parameters("@Renda").Value = Renda

        comando.Parameters.Add(New SqlParameter("@Usuario", SqlDbType.NChar))
        comando.Parameters("@Usuario").Value = Usuario

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = idFilial

        Try
            con.Open()
            gravou = comando.ExecuteNonQuery    'Executa o comando, porém não retorna nenhum dado.
            oVem.UserMsgBox(Me, "O Cadastro foi alterado com sucesso!!!")

        Catch ex As Exception
            Select Case Err.Number
                Case 5
                    oVem.UserMsgBox(Me, "Este CPF já foi digitado!!! O Cadastro não foi salvo. Verifique.")
                Case Else
                    oVem.UserMsgBox(Me, Err.Number & " - " & ex.Message)
            End Select
            'oVem.UserMsgBox(Me, Err.Number & " - " & ex.Message)

        Finally 'Tudo o que estiver entre o "Finally" e o "End Try" será executado mesmo após a mensagem de erro.
            con.Close() 'Fecha o banco de dados
        End Try

        Return gravou   'Toda função tem retornar alguma coisa
        'Neste caso o retorno será dados pela variavel "gavou"

    End Function

#End Region

    Protected Sub cboEstadoCivil_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboEstadoCivil.SelectedIndexChanged
        Select Case Me.cboEstadoCivil.SelectedValue
            Case 2, 3, 4 'Casado
                Me.txtNomeDoConjuge.Enabled = True
                Me.rfv_NomeConjuge.Enabled = True
                Me.txtNomeDoConjuge.Focus()
            Case Else
                Me.txtNomeDoConjuge.Enabled = False
                Me.rfv_NomeConjuge.Enabled = False
                Me.txtNomeDoPai.Focus()
        End Select
    End Sub


End Class
