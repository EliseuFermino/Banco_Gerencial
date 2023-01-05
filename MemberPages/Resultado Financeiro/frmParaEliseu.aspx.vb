Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_Resultado_Financeiro_frmParaEliseu_Novo
    Inherits System.Web.UI.Page

    Dim connString As String = Conexao.gerContSQL1_str
    Private vlrPropaganda As Double = 0
    Private vlrTranspValores As Single = 0
    Private vlrLuz As Double = 0
    Private vlrAgua As Single = 0
    Private vlrTelefone As Double = 0
    Private vlrAluguel As Double = 0
    Private vlrRateioAdm As Double = 0
    Private vlrImpVendas As Double = 0
    Private vlrImpCompras As Double = 0
    Private vlrImpExportacao As Double = 0
    Private vlrImpDif As Double = 0

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        Me.lblUserName.Text = User.Identity.Name
        If Month(Now()) > 1 Then
            Me.cboAno.Text = Year(Now())
        Else
            Me.cboAno.Text = Year(Now()) - 1
        End If
        Me.cboMes.Text = "Janeiro"
        Call AtualizarConsulta()

    End Sub

    Sub AtualizarConsulta()
        Dim sConnStr As String = connString
        Dim cnBKTest As New SqlConnection(sConnStr)
        Dim cmdTest As New SqlCommand("uspResFin_AtualizaParaEliseu", cnBKTest)

        cmdTest.CommandType = Data.CommandType.StoredProcedure

        cmdTest.Parameters.Add(New SqlParameter("@Ano", Data.SqlDbType.SmallInt))
        cmdTest.Parameters("@Ano").Value = Me.cboAno.Value

        cmdTest.Parameters.Add(New SqlParameter("@Mes", Data.SqlDbType.TinyInt))
        cmdTest.Parameters("@Mes").Value = Me.cboMes.Value

        cmdTest.Parameters.Add(New SqlParameter("@userName", Data.SqlDbType.VarChar))
        cmdTest.Parameters("@userName").Value = User.Identity.Name

        cnBKTest.Open()
        cmdTest.ExecuteNonQuery()
        cnBKTest.Close()
    End Sub

    Protected Sub cboMes_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboMes.SelectedIndexChanged
        Call AtualizarConsulta()
    End Sub


    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        With GridView1
            .Columns(0).ItemStyle.Width = 15
            .Columns(1).ItemStyle.Width = 40
            .Columns(2).ItemStyle.Width = 150   'Meta Venda
            .Columns(3).ItemStyle.Width = 90   'Meta Participação
            .Columns(4).ItemStyle.Width = 90   'Real Venda
            .Columns(5).ItemStyle.Width = 90   'Real Participação
            .Columns(6).ItemStyle.Width = 90   'Dif
            .Columns(7).ItemStyle.Width = 90   '% Atingimento
            .Columns(8).ItemStyle.Width = 90   'Margem Meta
            .Columns(9).ItemStyle.Width = 90   'Margem Real
            .Columns(10).ItemStyle.Width = 90   'Diferença
            .Columns(11).ItemStyle.Width = 90   '% Margem Meta
            .Columns(12).ItemStyle.Width = 90   '% Margem Real 
            .Columns(13).ItemStyle.Width = 80   '% Margem Real 
        End With

        'Calcula os Totais
        If e.Row.RowType = DataControlRowType.DataRow Then
            vlrPropaganda += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "vlrPropaganda"))
            vlrTranspValores += Convert.ToSingle(DataBinder.Eval(e.Row.DataItem, "vlrTranspValores"))
            vlrLuz += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "vlrLuz"))
            vlrAgua += Convert.ToSingle(DataBinder.Eval(e.Row.DataItem, "vlrAgua"))
            vlrTelefone += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "vlrTelefone"))
            vlrAluguel += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "vlrAluguel"))
            vlrRateioAdm += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "vlrRateioAdm"))
            vlrImpVendas += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "vlrImpostoVendas"))
            vlrImpCompras += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "vlrImpostoCompras"))
            vlrImpExportacao += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "vlrImpostoExportacao"))
            vlrImpDif += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "vlrImpostoDif"))

            'Aplica Cor
            Select Case e.Row.Cells(0).Text
                Case "1"
                    e.Row.BackColor = Drawing.Color.Lavender  'BurlyWood GreenYellow Lavender LightGreen
                Case "12"
                    e.Row.BackColor = Drawing.Color.Lavender 'BurlyWood GreenYellow Lavender LightGreen
                Case "16"
                    e.Row.BackColor = Drawing.Color.Lavender 'BurlyWood GreenYellow Lavender LightGreen
                Case "100"
                    e.Row.BackColor = Drawing.Color.Lavender 'BurlyWood GreenYellow Lavender LightGreen         
            End Select

            'Deixa a cor em vermelho se o valor for negativo
            If CDbl(e.Row.Cells(10).Text) < 0 Then e.Row.Cells(10).ForeColor = Drawing.Color.Red 'Vermelho
            If CDbl(e.Row.Cells(11).Text) < 0 Then e.Row.Cells(11).ForeColor = Drawing.Color.Red 'Vermelho
            If CDbl(e.Row.Cells(12).Text) < 0 Then e.Row.Cells(12).ForeColor = Drawing.Color.Red 'Vermelho
            If CDbl(e.Row.Cells(13).Text) < 0 Then e.Row.Cells(13).ForeColor = Drawing.Color.Red 'Vermelho

        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(2).Text = "Total Geral ->"
            e.Row.Cells(3).Text = (vlrPropaganda).ToString("n0")
            e.Row.Cells(4).Text = (vlrTranspValores).ToString("n")
            e.Row.Cells(5).Text = (vlrLuz).ToString("n0")
            e.Row.Cells(6).Text = (vlrAgua).ToString("n")
            e.Row.Cells(7).Text = (vlrTelefone).ToString("n0")
            e.Row.Cells(8).Text = (vlrAluguel).ToString("n0")
            e.Row.Cells(9).Text = (vlrRateioAdm).ToString("n0")
            e.Row.Cells(10).Text = (vlrImpVendas).ToString("n0")
            e.Row.Cells(11).Text = (vlrImpCompras).ToString("n0")
            e.Row.Cells(12).Text = (vlrImpExportacao).ToString("n0")
            e.Row.Cells(13).Text = (vlrImpDif).ToString("n0")

            'Deixa a cor em vermelho se o valor for negativo
            If CDbl(e.Row.Cells(10).Text) < 0 Then e.Row.Cells(10).ForeColor = Drawing.Color.Red 'Vermelho
            If CDbl(e.Row.Cells(11).Text) < 0 Then e.Row.Cells(11).ForeColor = Drawing.Color.Red 'Vermelho
            If CDbl(e.Row.Cells(12).Text) < 0 Then e.Row.Cells(12).ForeColor = Drawing.Color.Red 'Vermelho
            If CDbl(e.Row.Cells(13).Text) < 0 Then e.Row.Cells(13).ForeColor = Drawing.Color.Red 'Vermelho

        End If
    End Sub

    Protected Sub cboAno_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.SelectedIndexChanged
        Call AtualizarConsulta()
    End Sub
End Class
