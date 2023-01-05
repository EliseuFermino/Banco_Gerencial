
Imports System.Data
Imports System.Data.SqlClient

Partial Class Tesouraria_ExclusaoConta
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes

    Private Sub LimparControles()

        Me.txtNomeCompleto.Text = ""
        Me.txtMatricula.Text = ""
        Me.txtCPF.Text = ""
        

    End Sub

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(225, User.Identity.Name)

            Me.cboFilial.Visible_cboCorporacao = False

            Me.btnSalvar.Enabled = True

            Me.cboFilial.AutoPostBack = True

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Exclusão de Contas - PGR229"
        End If
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            Session("sFILIAL") = Me.cboFilial.CallFilial
            Me.cboCPF.DataBind()
            If Me.cboFilial.IsLoja Then Me.btnSalvar.Visible = False
        End If
    End Sub

#End Region




#Region " Excluir"

    Public Function Excluir(ByVal CPF As Long) As Boolean

        Dim gravou As Boolean
        Dim con As New SqlConnection(Conexao.gerTesouraria)
        Dim comando As New SqlCommand("usp_ExcluirCadastroPeloCPF", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@CPF", SqlDbType.VarChar))
        comando.Parameters("@CPF").Value = CPF


        Try
            con.Open()
            gravou = comando.ExecuteNonQuery    'Executa o comando, porém não retorna nenhum dado.
            oVem.UserMsgBox(Me, "O Cadastro foi excluido com sucesso!!!")
            Me.cboCPF.DataBind()
            LimparControles()
        Catch ex As Exception
            Select Case Err.Number
                Case 5
                    oVem.UserMsgBox(Me, "Problemas com este CPF!!!. Verifique.")
                Case Else
                    oVem.UserMsgBox(Me, Err.Number & " - " & ex.Message)
            End Select


        Finally 'Tudo o que estiver entre o "Finally" e o "End Try" será executado mesmo após a mensagem de erro.
            con.Close() 'Fecha o banco de dados
        End Try

        Return gravou   'Toda função tem retornar alguma coisa
        'Neste caso o retorno será dados pela variavel "gavou"

    End Function

    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs) Handles btnSalvar.Click
        Call Excluir(Me.cboCPF.CallCPF)

    End Sub

#End Region

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
       

    End Sub

    Private Sub ClearIfNull(ByVal iTextBox As TextBox, iObject As Object)
        If iObject.Equals("Null") Then
            iTextBox.Text = String.Empty
        Else
            iTextBox.Text = iObject
        End If
    End Sub


  
End Class
