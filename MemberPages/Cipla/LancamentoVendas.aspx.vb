Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_Cipla_LancamentoVendas
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            oVem.AtualizarEstatisticaPrograma(442, User.Identity.Name)

            Dim DiaHoje As Date
            DiaHoje = Date.Today

            cboDia.Date = DiaHoje

            txtPreco.Attributes.Add("autocomplete", "off")
            txtQtde.Attributes.Add("autocomplete", "off")

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = " Lançamento de Vendas - CIPLA - PGR442"
        End If
    End Sub

    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs) Handles btnSalvar.Click

        If cboDia.Text = Nothing Then
            oVem.UserMsgBox(Me, "Você deve informar o 'Dia'?")
            cboDia.Focus()
            Exit Sub
        End If

        If txtPreco.Text = 0.0 Then
            oVem.UserMsgBox(Me, "Você deve informar o 'Valor'?")
            txtPreco.Focus()
            Exit Sub
        End If

        Call Salvar()
    End Sub

    Public Function Salvar() As Boolean

        Dim gravou As Boolean
        Dim con As New SqlConnection(Conexao.DW_Condor_One_ConnectionString)
        Dim comando As New SqlCommand("Cipla.uspInsert", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@Dia", SqlDbType.Date))
        comando.Parameters("@Dia").Value = cboDia.Date

        comando.Parameters.Add(New SqlParameter("@vlrVenda", SqlDbType.Money))
        comando.Parameters("@vlrVenda").Value = txtPreco.Text

        comando.Parameters.Add(New SqlParameter("@Quantidade", SqlDbType.Money))
        comando.Parameters("@Quantidade").Value = txtQtde.Text

        comando.Parameters.Add(New SqlParameter("@Usuario", SqlDbType.VarChar))
        comando.Parameters("@Usuario").Value = Page.User.Identity.Name

        Try
            con.Open()
            gravou = comando.ExecuteNonQuery    'Executa o comando, porém não retorna nenhum dado.
            oVem.UserMsgBox(Me, "A Venda foi salva com sucesso!!!")
            'LimparDados()
            'txtRua.Focus()
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



End Class
