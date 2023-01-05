Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_Resultado_Financeiro_frmResumoFinanceiro
    Inherits System.Web.UI.Page

    Private tM01 As Double = 0
    Private tM02 As Double = 0
    Private tM03 As Double = 0
    Private tM04 As Double = 0
    Private tM05 As Double = 0
    Private tM06 As Double = 0
    Private tM07 As Double = 0
    Private tM08 As Double = 0
    Private tM09 As Double = 0
    Private tM10 As Double = 0
    Private tM11 As Double = 0
    Private tM12 As Double = 0
    Private tTotal As Double = 0
    Dim strConn As String = Conexao.gerContSQL1_str

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Me.lbl_UserName.Text = User.Identity.Name

        If Month(Now()) > 1 Then
            Me.ASPxComboBox1.Text = Year(Now())
        Else
            Me.ASPxComboBox1.Text = Year(Now()) - 1
        End If

        Call AtualizarConsulta()
    End Sub

    Protected Sub ASPxComboBox1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ASPxComboBox1.SelectedIndexChanged
        Call AtualizarConsulta()
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        'Largura das Colunas
        With Me.GridView1
            .Columns(0).ItemStyle.Width = 20
            .Columns(1).ItemStyle.Width = 150
            .Columns(2).ItemStyle.Width = 70
            .Columns(3).ItemStyle.Width = 70
            .Columns(4).ItemStyle.Width = 70
            .Columns(5).ItemStyle.Width = 70
            .Columns(6).ItemStyle.Width = 70
            .Columns(7).ItemStyle.Width = 70
            .Columns(8).ItemStyle.Width = 70
            .Columns(9).ItemStyle.Width = 70
            .Columns(10).ItemStyle.Width = 70
            .Columns(11).ItemStyle.Width = 70
            .Columns(12).ItemStyle.Width = 70
            .Columns(13).ItemStyle.Width = 70
            .Columns(14).ItemStyle.Width = 80

        End With

        'Calcula os Totais
        If e.Row.RowType = DataControlRowType.DataRow Then
            tM01 += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "M01"))
            tM02 += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "M02"))
            tM03 += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "M03"))
            tM04 += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "M04"))
            tM05 += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "M05"))
            tM06 += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "M06"))
            tM07 += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "M07"))
            tM08 += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "M08"))
            tM09 += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "M09"))
            tM10 += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "M10"))
            tM11 += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "M11"))
            tM12 += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "M12"))
            tTotal += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "Total"))

        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(2).Text = tM01.ToString("n0")
            e.Row.Cells(3).Text = tM02.ToString("n0")
            e.Row.Cells(4).Text = tM03.ToString("n0")
            e.Row.Cells(5).Text = tM04.ToString("n0")
            e.Row.Cells(6).Text = tM05.ToString("n0")
            e.Row.Cells(7).Text = tM06.ToString("n0")
            e.Row.Cells(8).Text = tM07.ToString("n0")
            e.Row.Cells(9).Text = tM08.ToString("n0")
            e.Row.Cells(10).Text = tM09.ToString("n0")
            e.Row.Cells(11).Text = tM10.ToString("n0")
            e.Row.Cells(12).Text = tM11.ToString("n0")
            e.Row.Cells(13).Text = tM12.ToString("n0")
            e.Row.Cells(14).Text = tTotal.ToString("n0")

            'Deixa a cor em vermelho se o valor for negativo
            If CDbl(e.Row.Cells(2).Text) < 0 Then e.Row.Cells(2).ForeColor = Drawing.Color.Red 'Vermelho
            If CDbl(e.Row.Cells(3).Text) < 0 Then e.Row.Cells(3).ForeColor = Drawing.Color.Red 'Vermelho
            If CDbl(e.Row.Cells(4).Text) < 0 Then e.Row.Cells(4).ForeColor = Drawing.Color.Red 'Vermelho
            If CDbl(e.Row.Cells(5).Text) < 0 Then e.Row.Cells(5).ForeColor = Drawing.Color.Red 'Vermelho
            If CDbl(e.Row.Cells(6).Text) < 0 Then e.Row.Cells(6).ForeColor = Drawing.Color.Red 'Vermelho
            If CDbl(e.Row.Cells(7).Text) < 0 Then e.Row.Cells(7).ForeColor = Drawing.Color.Red 'Vermelho
            If CDbl(e.Row.Cells(8).Text) < 0 Then e.Row.Cells(8).ForeColor = Drawing.Color.Red 'Vermelho
            If CDbl(e.Row.Cells(9).Text) < 0 Then e.Row.Cells(9).ForeColor = Drawing.Color.Red 'Vermelho
            If CDbl(e.Row.Cells(10).Text) < 0 Then e.Row.Cells(10).ForeColor = Drawing.Color.Red 'Vermelho
            If CDbl(e.Row.Cells(11).Text) < 0 Then e.Row.Cells(11).ForeColor = Drawing.Color.Red 'Vermelho
            If CDbl(e.Row.Cells(12).Text) < 0 Then e.Row.Cells(12).ForeColor = Drawing.Color.Red 'Vermelho
            If CDbl(e.Row.Cells(13).Text) < 0 Then e.Row.Cells(13).ForeColor = Drawing.Color.Red 'Vermelho
            If CDbl(e.Row.Cells(14).Text) < 0 Then e.Row.Cells(14).ForeColor = Drawing.Color.Red 'Vermelho

        End If

        If e.Row.RowType = DataControlRowType.DataRow Then

            If DataBinder.Eval(e.Row.DataItem, "M01") < 0D Then e.Row.Cells(2).ForeColor = Drawing.Color.Red
            If DataBinder.Eval(e.Row.DataItem, "M02") < 0D Then e.Row.Cells(3).ForeColor = Drawing.Color.Red
            If DataBinder.Eval(e.Row.DataItem, "M03") < 0D Then e.Row.Cells(4).ForeColor = Drawing.Color.Red
            If DataBinder.Eval(e.Row.DataItem, "M04") < 0D Then e.Row.Cells(5).ForeColor = Drawing.Color.Red
            If DataBinder.Eval(e.Row.DataItem, "M05") < 0D Then e.Row.Cells(6).ForeColor = Drawing.Color.Red
            If DataBinder.Eval(e.Row.DataItem, "M06") < 0D Then e.Row.Cells(7).ForeColor = Drawing.Color.Red
            If DataBinder.Eval(e.Row.DataItem, "M07") < 0D Then e.Row.Cells(8).ForeColor = Drawing.Color.Red
            If DataBinder.Eval(e.Row.DataItem, "M08") < 0D Then e.Row.Cells(9).ForeColor = Drawing.Color.Red
            If DataBinder.Eval(e.Row.DataItem, "M09") < 0D Then e.Row.Cells(10).ForeColor = Drawing.Color.Red
            If DataBinder.Eval(e.Row.DataItem, "M10") < 0D Then e.Row.Cells(11).ForeColor = Drawing.Color.Red
            If DataBinder.Eval(e.Row.DataItem, "M11") < 0D Then e.Row.Cells(12).ForeColor = Drawing.Color.Red
            If DataBinder.Eval(e.Row.DataItem, "M12") < 0D Then e.Row.Cells(13).ForeColor = Drawing.Color.Red
            If DataBinder.Eval(e.Row.DataItem, "Total") < 0D Then e.Row.Cells(14).ForeColor = Drawing.Color.Red
        End If

    End Sub

    Sub AtualizarConsulta()

        Dim sConnStr As String = strConn
        Dim cnBKTest As New SqlConnection(sConnStr)
        Dim cmdTest As New SqlCommand("uspResFin_AtualizaResumo12meses", cnBKTest)

        cmdTest.CommandType = Data.CommandType.StoredProcedure

        cmdTest.Parameters.Add(New SqlParameter("@Ano", Data.SqlDbType.SmallInt))
        cmdTest.Parameters("@Ano").Value = Me.ASPxComboBox1.Value

        cmdTest.Parameters.Add(New SqlParameter("@userName", Data.SqlDbType.VarChar))
        cmdTest.Parameters("@userName").Value = User.Identity.Name

        cnBKTest.Open()
        cmdTest.ExecuteNonQuery()
        'Call AtualizarGridView()
        cnBKTest.Close()

    End Sub

End Class
