
Partial Class MemberPages_Resultado_Financeiro_ResultadoFinanceiroDefinitivo
    Inherits System.Web.UI.Page

    Private Venda01 As Double = 0
    Private Venda02 As Double = 0
    Private Part As Double = 0

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Dim oVem As New VendaEmpresaMes
        oVem.ListaDasFiliais(Me.cboFilial, "Filial", "Desc")
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        'Largura das Colunas
        With Me.GridView1
            .Columns(0).ItemStyle.Width = 80
            .Columns(1).ItemStyle.Width = 120
            .Columns(2).ItemStyle.Width = 120
            .Columns(3).ItemStyle.Width = 120
            .Columns(4).ItemStyle.Width = 120
        End With

        'Calcula os Totais
        If e.Row.RowType = DataControlRowType.DataRow Then
            Venda01 += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "vlrEntradas"))
            Venda02 += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "vlrSaidas"))
            Part += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "vlrRecDespFinanc"))

        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(2).Text = Venda01.ToString("n2")
            e.Row.Cells(3).Text = Venda02.ToString("n2")
            e.Row.Cells(6).Text = Part.ToString("n2")
        End If
    End Sub

End Class
