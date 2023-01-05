Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_Resultado_Financeiro_frmResFinDefinitivo
    Inherits System.Web.UI.Page

    Private Venda01 As Double = 0
    Private Venda02 As Double = 0
    Private Part As Double = 0
    Dim strConn As String = Conexao.gerContSQL1_str

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Call PreencherFilial()
        If Month(Now()) > 1 Then
            Me.cboAno.Text = Year(Now())
        Else
            Me.cboAno.Text = Year(Now()) - 1
        End If
        Me.cboMes.Text = "Janeiro"
        Me.cboFilial.Value = 1
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        'Largura das Colunas
        With Me.GridView1
            .Columns(0).ItemStyle.Width = 15
            .Columns(1).ItemStyle.Width = 80
            .Columns(2).ItemStyle.Width = 100
            .Columns(3).ItemStyle.Width = 110
            .Columns(4).ItemStyle.Width = 110
            .Columns(5).ItemStyle.Width = 100
            .Columns(6).ItemStyle.Width = 70
            .Columns(7).ItemStyle.Width = 90
            .Columns(8).ItemStyle.Width = 120
        End With

        'Calcula os Totais
        If e.Row.RowType = DataControlRowType.DataRow Then
            Venda01 += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "vlrEntradas"))
            Venda02 += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "vlrSaidas"))
            Part += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "vlrRecDespFinanc"))

        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(3).Text = Venda01.ToString("n0")
            e.Row.Cells(4).Text = Venda02.ToString("n0")
            e.Row.Cells(7).Text = Part.ToString("n2")

            If CDbl(e.Row.Cells(7).Text) < 0 Then
                e.Row.Cells(7).ForeColor = Drawing.Color.Red
            Else
                e.Row.Cells(7).ForeColor = Drawing.Color.Black
            End If

        End If

        If e.Row.RowType = DataControlRowType.DataRow Then
            If DataBinder.Eval(e.Row.DataItem, "vlrSaldoInicial") < 0D Then e.Row.Cells(2).ForeColor = Drawing.Color.Red
            If DataBinder.Eval(e.Row.DataItem, "vlrSaidas") < 0D Then e.Row.Cells(4).ForeColor = Drawing.Color.Red
            If DataBinder.Eval(e.Row.DataItem, "vlrSaldoFinal") < 0D Then e.Row.Cells(5).ForeColor = Drawing.Color.Red
            If DataBinder.Eval(e.Row.DataItem, "vlrRecDespFinanc") < 0D Then e.Row.Cells(7).ForeColor = Drawing.Color.Red
            If DataBinder.Eval(e.Row.DataItem, "vlrSaldoFinanceiro") < 0D Then e.Row.Cells(8).ForeColor = Drawing.Color.Red
        End If
    End Sub

    Sub PreencherFilial()

        'define a string com o comando SQL e a string de conexão usando um provedor SQLClient
        Dim strSQL As String = "SELECT [Filial], [Desc] FROM [listLojasAdm] ORDER BY [Filial]"

        Dim Conn As New SqlConnection(strConn)
        Dim objDr As SqlDataReader
        Dim Cmd As New SqlCommand(strSQL, Conn)
        Conn.Open()

        objDr = Cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection)

        Me.cboFilial.DataSource = objDr
        Me.cboFilial.DataBind()
        Conn.Close()
    End Sub

End Class
