Imports System.Data
Imports System.Data.SqlClient
Imports DevExpress.Xpf.Scheduler.Drawing

Partial Class MemberPages_Quebras_Validade_CadastroValidade
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            oVem.AtualizarEstatisticaPrograma(239, User.Identity.Name)
            cboFilial.Visible_cboCorporacao = False

            Dim DiaHoje, DiaMaximo As Date
            DiaHoje = Date.Today
            DiaMaximo = DateAndTime.DateAdd(DateInterval.Day, 60, DiaHoje)

            cboDia.MinDate = DiaHoje
            cboDia.MaxDate = DiaMaximo

            txtEAN.Attributes.Add("autocomplete", "off")
            txtPreco.Attributes.Add("autocomplete", "off")
            txtQtde.Attributes.Add("autocomplete", "off")

            cboFilial.Caption_Filial = ""

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Cadastro de Produtos à Vencer - PGR239"
        End If
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            cboSecao.CallSecaoDesc = "01-Seca Pesada"
            cboSecao.cboSecao_Enabled = False
        End If
    End Sub

    Private Sub BuscarProduto(ByVal iEAN As Int64)

        Dim varNomeFornecedor As String = ""
        Dim con As New SqlConnection(Conexao.gerManager)
        Dim comando As New SqlCommand("Cadastros.uspBuscarProdutoPeloEAN_New", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@EAN", SqlDbType.BigInt))
        comando.Parameters("@EAN").Value = iEAN

        Try
            con.Open()
            Dim reader5 As SqlDataReader
            reader5 = comando.ExecuteReader()
            While reader5.Read

                lblDescProduto.Text = reader5.GetSqlInt32(0).ToString & " - " & reader5.GetSqlString(1).ToString
                cboSecao.CallSecaoDesc = reader5.GetSqlString(2).ToString
                cboDia.Focus()

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
        BuscarProduto(txtEAN.Text)
        cboDia.Focus()
    End Sub

    Protected Sub txtPreco_TextChanged(sender As Object, e As EventArgs) Handles txtPreco.TextChanged
        Totalizar()
    End Sub

    Private Sub Totalizar()
        lblTotal.Text = (CDec(txtQtde.Text) * CDec(txtPreco.Text)).ToString("n2")
    End Sub

    Protected Sub txtQtde_TextChanged(sender As Object, e As EventArgs) Handles txtQtde.TextChanged
        Totalizar()
        txtPreco.Focus()
    End Sub

    Protected Sub txtRua_TextChanged(sender As Object, e As EventArgs) Handles txtRua.TextChanged
        txtEAN.Focus()
    End Sub

    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs) Handles btnSalvar.Click

        If txtRua.Text = Nothing Then
            oVem.UserMsgBox(Me, "Você deve informar o nº do 'Corredor'?")
            txtRua.Focus()
            Exit Sub
        End If

        If txtEAN.Text = Nothing Then
            oVem.UserMsgBox(Me, "Você deve informar o 'EAN'?")
            txtEAN.Focus()
            Exit Sub
        End If

        If cboDia.Text = Nothing Then
            oVem.UserMsgBox(Me, "Você deve informar o 'Vencimento'?")
            cboDia.Focus()
            Exit Sub
        End If

        If txtQtde.Text = 0.0 Then
            oVem.UserMsgBox(Me, "Você deve informar a 'Quantidade'?")
            txtQtde.Focus()
            Exit Sub
        End If

        If txtPreco.Text = 0.0 Then
            oVem.UserMsgBox(Me, "Você deve informar o 'Preço'?")
            txtPreco.Focus()
            Exit Sub
        End If

        Call Salvar()
    End Sub


    Public Function Salvar() As Boolean

        Dim gravou As Boolean
        Dim con As New SqlConnection(Conexao.DW_Condor_One_ConnectionString)
        Dim comando As New SqlCommand("Validade.uspInsert", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Setor", SqlDbType.SmallInt))
        comando.Parameters("@Setor").Value = cboSecao.CallSecao

        comando.Parameters.Add(New SqlParameter("@numCorredor", SqlDbType.SmallInt))
        comando.Parameters("@numCorredor").Value = txtRua.Text

        comando.Parameters.Add(New SqlParameter("@EAN", SqlDbType.BigInt))
        comando.Parameters("@EAN").Value = txtEAN.Text

        comando.Parameters.Add(New SqlParameter("@dataVencimento", SqlDbType.Date))
        comando.Parameters("@dataVencimento").Value = cboDia.Date

        comando.Parameters.Add(New SqlParameter("@vlrPrecoVenda", SqlDbType.Money))
        comando.Parameters("@vlrPrecoVenda").Value = txtPreco.Text

        comando.Parameters.Add(New SqlParameter("@Quantidade", SqlDbType.Money))
        comando.Parameters("@Quantidade").Value = txtQtde.Text

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.SmallInt))
        comando.Parameters("@idFilial").Value = cboFilial.CallFilial

        comando.Parameters.Add(New SqlParameter("@Usuario", SqlDbType.VarChar))
        comando.Parameters("@Usuario").Value = Page.User.Identity.Name

        Try
            con.Open()
            gravou = comando.ExecuteNonQuery    'Executa o comando, porém não retorna nenhum dado.
            oVem.UserMsgBox(Me, "O Cadastro foi salvo com sucesso!!!")
            LimparDados()
            txtRua.Focus()
        Catch ex As Exception
            Select Case Err.Number
                Case 5
                    ' oVem.UserMsgBox(Me, Err.Number & " - " & ex.Message)
                    oVem.UserMsgBox(Me, Err.Number & " - " & ex.Message & " - Erro Case 5")
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

    Private Sub LimparDados()
        txtRua.Text = ""
        txtEAN.Text = ""
        cboDia.Text = ""
        txtQtde.Text = ""
        txtPreco.Text = ""
        lblDescProduto.Text = ""
    End Sub

    Protected Sub cboDia_DateChanged(sender As Object, e As EventArgs) Handles cboDia.DateChanged

      
            txtQtde.Focus()


    End Sub
End Class
