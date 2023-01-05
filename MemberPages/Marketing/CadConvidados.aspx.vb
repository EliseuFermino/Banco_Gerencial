Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_Marketing_CadConvidados
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes

    Private Sub LimparControles()

        'txtCPF.Text = ""
        'lblEmpresa.Text = ""
        txtConvidado.Text = ""
        txtCargo.Text = ""

        ItemsDefault()

    End Sub

    Private Sub ItemsDefault()
        rnd_nao.Checked = True

        txtConvidado.Focus()
    End Sub


#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(234, User.Identity.Name)

            txtConvidado.Attributes.Add("autocomplete", "off")
            txtCPF.Attributes.Add("autocomplete", "off")
            txtCPF1.Attributes.Add("autocomplete", "off")

            Me.btnCancelar.Enabled = True
            Me.btnSalvar.Enabled = True
            Me.btnNovo.Enabled = False

            cboAno.AnoInicial = 2018
            cboAno.AnoFinal = 2018
            cboAno.CallAno = 2018

            'cboAno.Visible_Caption = False

            ItemsDefault()

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Cadastro de Convidados - PGR234"
        End If
    End Sub

#End Region

#Region " Btn's"

    Protected Sub btnNovo_Click(sender As Object, e As EventArgs) Handles btnNovo.Click
        LimparControles()
        txtCPF.Focus()
    End Sub

    Protected Sub btnCancelar_Click(sender As Object, e As EventArgs) Handles btnCancelar.Click
        LimparControles()
        txtCPF.Focus()

    End Sub

    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs) Handles btnSalvar.Click

        If cboDistribuidor.Text = Nothing Then
            oVem.UserMsgBox(Me, "Selecione um Responsável.")
            Exit Sub
        End If

        If rndCGC.Checked = True Then
            If txtCPF.Text = Nothing Then
                oVem.UserMsgBox(Me, "Informe o CNPJ.")
                txtCPF.Focus()
                Exit Sub
            End If
        End If

        If rndCPF.Checked = True Then
            If txtCPF1.Text = Nothing Then
                oVem.UserMsgBox(Me, "Informe o CPF.")
                txtCPF1.Focus()
                Exit Sub
            End If
        End If


        If rndCGC.Checked = True Then
            If lblEmpresa.Text = Nothing Then
                oVem.UserMsgBox(Me, "CNPJ não existe!!!")
                txtCPF.Focus()
                Exit Sub
            End If
        End If

        If rndCGC.Checked = True Then
            If txtCPF.Text = 76189406000126 Then
                oVem.UserMsgBox(Me, "Os Colaboradores deverãos ser digitados na opção 'Condor' e não 'CNPJ'. Mude para a opção 'Condor'.")
                txtCPF.Focus()
                Exit Sub
            End If
        End If


        If txtConvidado.Text = Nothing Then
            If rndCGC.Checked = True Then
                oVem.UserMsgBox(Me, "Informe o Convidado.")
                txtConvidado.Focus()
            End If

            If rndCPF.Checked = True Then
                oVem.UserMsgBox(Me, "CPF não existe!!!")
                txtCPF1.Focus()
            End If

            Exit Sub
        End If

        If txtCargo.Text = Nothing Then
            oVem.UserMsgBox(Me, "Informe o Cargo.")
            txtCargo.Focus()
            Exit Sub
        End If





        Dim varNaoSim As Byte
        Dim varCPF As Long
        Dim varTipo As Byte

        If rndCGC.Checked = True Then
            varCPF = ValidadeCNPJ()
            varTipo = 0 'Fornecedor
        End If

        If rndCPF.Checked = True Then
            varCPF = ValidadeCNPJ()
            varTipo = 3 'Pessoa Fisica
        End If

        If rndCondor.Checked = True Then
            Select Case Me.cboTipo.Value
                Case 1
                    varTipo = 1 'Colaborador
                Case 2
                    varTipo = 2 'Autoridades
                Case 4
                    varTipo = 4 'Imprensa
                Case 99
                    varTipo = 99    'Outros
            End Select
            varCPF = ValidadeCNPJ()

        End If


        If rnd_nao.Checked = True Then  'Acompanhante
            varNaoSim = 1
        Else
            varNaoSim = 2
        End If



        If Salvar(varCPF, varNaoSim, varTipo) = False Then
            Me.btnNovo.Enabled = False
            Me.btnSalvar.Enabled = True
            Me.btnCancelar.Enabled = True
            Me.txtConvidado.Focus()
        Else
            grid.DataBind()

        End If
    End Sub

#End Region


    Private Function ValidadeCNPJ() As Long

        Dim varCPF As Long

        If rndCGC.Checked = True Then varCPF = CLng(txtCPF.Text) 'CLng(Left(Me.txtCPF.Text, 2) & Left(Mid(Me.txtCPF.Text, 4), 3) & Left(Mid(Me.txtCPF.Text, 8), 3) & Left(Mid(Me.txtCPF.Text, 12), 4) & Right(Me.txtCPF.Text, 2))
        If rndCPF.Checked = True Then varCPF = CLng(txtCPF1.Text)
        If rndCondor.Checked = True Then
            If cboTipo.Value = 4 Then
                varCPF = CLng(txtCPF.Text)
            End If
        End If

        ValidadeCNPJ = varCPF

    End Function

    Public Function Salvar(ByVal CPF_CGC As Long, ByVal NaoSim As Byte, iTipo As Byte) As Boolean

        Dim gravou As Boolean
        Dim con As New SqlConnection(Conexao.gerMarketing)
        Dim comando As New SqlCommand("usp_InserirNovoConvidado", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = cboAno.CallAno

        comando.Parameters.Add(New SqlParameter("@idDistribuidor", SqlDbType.VarChar))
        comando.Parameters("@idDistribuidor").Value = cboDistribuidor.Value

        If rndCGC.Checked = True Then
            comando.Parameters.Add(New SqlParameter("@CPF_CGC", SqlDbType.VarChar))
            comando.Parameters("@CPF_CGC").Value = CPF_CGC
        ElseIf rndCPF.Checked = True Then
            comando.Parameters.Add(New SqlParameter("@CPF_CGC", SqlDbType.VarChar))
            comando.Parameters("@CPF_CGC").Value = CPF_CGC
        Else
            comando.Parameters.Add(New SqlParameter("@CPF_CGC", SqlDbType.VarChar))
            If cboTipo.Value = 4 Then   'Imprensa
                comando.Parameters("@CPF_CGC").Value = CPF_CGC
            Else
                comando.Parameters("@CPF_CGC").Value = 76189406000126   'CNPJ Condor
            End If

        End If

        comando.Parameters.Add(New SqlParameter("@NomeConvidado", SqlDbType.VarChar))
        comando.Parameters("@NomeConvidado").Value = txtConvidado.Text

        comando.Parameters.Add(New SqlParameter("@Cargo", SqlDbType.VarChar))
        comando.Parameters("@Cargo").Value = txtCargo.Text

        comando.Parameters.Add(New SqlParameter("@Acompanhante", SqlDbType.TinyInt))
        comando.Parameters("@Acompanhante").Value = NaoSim

        comando.Parameters.Add(New SqlParameter("@Usuario", SqlDbType.VarChar))
        comando.Parameters("@Usuario").Value = Page.User.Identity.Name

        comando.Parameters.Add(New SqlParameter("@idTipo", SqlDbType.TinyInt))
        comando.Parameters("@idTipo").Value = iTipo

        Try
            con.Open()
            gravou = comando.ExecuteNonQuery    'Executa o comando, porém não retorna nenhum dado.
            oVem.UserMsgBox(Me, "O Cadastro foi salvo com sucesso!!!")
            LimparControles()
        Catch ex As Exception
            Select Case Err.Number
                Case 5
                    ' oVem.UserMsgBox(Me, Err.Number & " - " & ex.Message)
                    oVem.UserMsgBox(Me, "Este Convidado já foi cadastrado por você ou outra pessoa!!!. Verifique.")
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

    Private Function BuscarNomeFornecedor(ByVal iCNPJ As Int64) As String

        Dim varNomeFornecedor As String = ""
        Dim con As New SqlConnection(Conexao.gerMarketing)
        Dim comando As New SqlCommand("uspBuscarNomeFornecedor", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idCNPJ", SqlDbType.BigInt))
        comando.Parameters("@idCNPJ").Value = iCNPJ

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                varNomeFornecedor = reader5.GetSqlString(0)

            End While

        Catch ex As Exception
            Select Case Err.Number
                Case 5
                    ' oVem.UserMsgBox(Me, Err.Number & " - " & ex.Message)
                    oVem.UserMsgBox(Me, "Este fornecedor não existe. Verifique.")
                Case Else
                    oVem.UserMsgBox(Me, Err.Number & " - " & ex.Message)
            End Select
        Finally
            con.Close()
        End Try
        BuscarNomeFornecedor = varNomeFornecedor
    End Function



    Protected Sub txtCPF1_TextChanged(sender As Object, e As EventArgs) Handles txtCPF1.TextChanged
        txtConvidado.Text = BuscarNomeFornecedor(ValidadeCNPJ())
        txtCargo.Focus()
    End Sub

#Region " rnd"

    Protected Sub rndCondor_CheckedChanged(sender As Object, e As EventArgs) Handles rndCondor.CheckedChanged
        If Me.rndCondor.Checked = True Then
            Me.lblCNPJ_Caption.Visible = False
            Me.txtCPF.Visible = False
            Me.txtCPF1.Visible = False
            Me.lblEmpresa.Visible = False
            txtConvidado.Enabled = True
            Me.cboTipo.Visible = True
            Me.cboTipo.Text = 1
            txtConvidado.Focus()
        End If
    End Sub

    Protected Sub rndCGC_CheckedChanged(sender As Object, e As EventArgs) Handles rndCGC.CheckedChanged
        If Me.rndCGC.Checked = True Then
            Me.lblCNPJ_Caption.Visible = True
            Me.txtCPF1.Visible = False
            Me.txtCPF.Visible = True
            Me.lblEmpresa.Visible = True
            txtConvidado.Enabled = True
            Me.lblCNPJ_Caption.Text = "CNPJ:"
            Me.txtCPF.Visible = True
            Me.cboTipo.Visible = False
            Me.txtCPF.Focus()
        End If
    End Sub

    Protected Sub rndCPF_CheckedChanged(sender As Object, e As EventArgs) Handles rndCPF.CheckedChanged
        If Me.rndCPF.Checked = True Then
            Me.lblCNPJ_Caption.Visible = True
            Me.txtCPF1.Visible = True
            Me.txtCPF.Visible = False
            Me.lblEmpresa.Visible = False
            txtConvidado.Enabled = False
            Me.lblCNPJ_Caption.Text = "CPF:"
            Me.cboTipo.Visible = False
            Me.txtCPF1.Focus()
        End If
    End Sub

#End Region

    Protected Sub cboDistribuidor_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboDistribuidor.SelectedIndexChanged
        grid.SettingsText.Title = "Lista de Convidados de " & cboDistribuidor.Text
        If rndCGC.Checked = True Then txtCPF.Focus()
        If rndCondor.Checked = True Then txtConvidado.Focus()
    End Sub

    Protected Sub cboTipo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboTipo.SelectedIndexChanged
        If cboTipo.Value = 4 Then   'Imprensa
            txtCPF.Visible = True
            lblEmpresa.Visible = True
            txtCPF.Focus()
        Else
            txtCPF.Visible = False
            lblEmpresa.Visible = False
            txtConvidado.Focus()
        End If

    End Sub

    

    Protected Sub txtCPF_TextChanged(sender As Object, e As EventArgs) Handles txtCPF.TextChanged

        lblEmpresa.Text = BuscarNomeFornecedor(ValidadeCNPJ())
        txtConvidado.Focus()

    End Sub
End Class
