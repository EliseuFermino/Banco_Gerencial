Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_Resultado_Financeiro_frmCalcFinanc
    Inherits System.Web.UI.Page
    Private tVenda As Double = 0
    Private tPart As Double = 0
    Private tFinancLoja As Double = 0
    Private tFinancCD As Double = 0
    Private tFinanc As Double = 0
    Dim strConn As String = Conexao.gerContSQL1_str

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        'Largura das Colunas
        With Me.GridView1
            .Columns(1).ItemStyle.Width = 150
            .Columns(2).ItemStyle.Width = 90
            .Columns(3).ItemStyle.Width = 50
            .Columns(4).ItemStyle.Width = 80
            .Columns(5).ItemStyle.Width = 80
            .Columns(6).ItemStyle.Width = 80
        End With

        'Calcula os Totais
        If e.Row.RowType = DataControlRowType.DataRow Then
            tVenda += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "vlrVenda"))
            tPart += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "percPart"))
            tFinancLoja += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "vlrFinancLoja"))
            tFinancCD += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "vlrFinancCD"))
            tFinanc += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "vlrFinanc"))

        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(2).Text = tVenda.ToString("n0")
            e.Row.Cells(3).Text = tPart.ToString("n2")
            e.Row.Cells(4).Text = tFinancLoja.ToString("n0")
            e.Row.Cells(5).Text = tFinancCD.ToString("n0")
            e.Row.Cells(6).Text = tFinanc.ToString("n0")

        End If
    End Sub

    Sub AtualizarConsulta()

        Dim sConnStr As String = strConn
        Dim cnBKTest As New SqlConnection(sConnStr)
        Dim cmdTest As New SqlCommand("uspResFin_Calc", cnBKTest)

        cmdTest.CommandType = Data.CommandType.StoredProcedure

        cmdTest.Parameters.Add(New SqlParameter("@Ano", Data.SqlDbType.SmallInt))
        cmdTest.Parameters("@Ano").Value = Me.cboAno.Value

        cmdTest.Parameters.Add(New SqlParameter("@Mes", Data.SqlDbType.TinyInt))
        cmdTest.Parameters("@Mes").Value = Me.cboMes.Value

        cmdTest.Parameters.Add(New SqlParameter("@userName", Data.SqlDbType.VarChar))
        cmdTest.Parameters("@userName").Value = User.Identity.Name

        cnBKTest.Open()
        cmdTest.ExecuteNonQuery()
        Dim reader5 As SqlDataReader
        reader5 = cmdTest.ExecuteReader()
        While reader5.Read
            Me.lbl_F01.Text = reader5.GetSqlMoney(0).ToDouble.ToString("n0")
            Me.lbl_F12.Text = reader5.GetSqlMoney(1).ToDouble.ToString("n0")
            Me.lbl_F16.Text = reader5.GetSqlMoney(2).ToDouble.ToString("n0")
            Me.lbl_FTotal.Text = reader5.GetSqlMoney(3).ToDouble.ToString("n0")
        End While

        Call AtualizarGridView()
        cnBKTest.Close()

    End Sub


    Protected Sub cboAno_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.SelectedIndexChanged
        Call AtualizarConsulta()
    End Sub

    Protected Sub cboMes_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboMes.SelectedIndexChanged
        Call AtualizarConsulta()
    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        On Error Resume Next
        Me.lbl_UserName.Text = User.Identity.Name
        Me.cboAno.Text = Year(Now()) - 1
        Me.cboMes.Text = 1
        Call AtualizarConsulta()
    End Sub

    Sub AtualizarGridView()

        'define a string com o comando SQL e a string de conexão usando um provedor SQLClient
        Dim strSQL As String = "SELECT DescFilial, vlrVenda, percPart, vlrFinancLoja, vlrFinancCD, vlrFinanc FROM tblResFin_Calc WHERE userName = '" & Me.lbl_UserName.Text & "' ORDER BY idFilial"
        Dim Conn As New SqlConnection(strConn)
        Dim objDr As SqlDataReader
        Dim Cmd As New SqlCommand(strSQL, Conn)

        tVenda = 0
        tPart = 0
        tFinancLoja = 0
        tFinancCD = 0
        tFinanc = 0

        Conn.Open()

        objDr = Cmd.ExecuteReader(System.Data.CommandBehavior.CloseConnection)

        Me.GridView1.DataSource = objDr
        Me.GridView1.DataBind()

        Conn.Close()
    End Sub
End Class
