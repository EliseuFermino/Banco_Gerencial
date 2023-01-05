

Partial Class MemberPages_Despesas_Gestor_viewDespMesTotal
    Inherits System.Web.UI.Page
    Private Venda01 As Double = 0
    Private Venda02 As Double = 0
    Private Venda03 As Double = 0

    Protected Sub GridView1_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowCreated
        If e.Row.RowType = DataControlRowType.DataRow Then
            If DataBinder.Eval(e.Row.DataItem, "difVlr") < 0D Then e.Row.Cells(5).ForeColor = Drawing.Color.Red
        End If
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        With Me.GridView1
            .Columns(0).ItemStyle.Width = 100
            .Columns(1).ItemStyle.Width = 100
            .Columns(2).ItemStyle.Width = 50
            .Columns(3).ItemStyle.Width = 100
            .Columns(4).ItemStyle.Width = 50
            .Columns(5).ItemStyle.Width = 90
        End With

        'Calcula os Totais
        If e.Row.RowType = DataControlRowType.DataRow Then
            Venda01 += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "vlrRev"))
            Venda02 += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "vlrRea"))
            Venda03 += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "difVlr"))


        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(1).Text = Venda01.ToString("n0")
            e.Row.Cells(3).Text = Venda02.ToString("n0")
            e.Row.Cells(5).Text = Venda03.ToString("n0")

            'e.Row.Cells(10).Text = (((e.Row.Cells(4).Text / e.Row.Cells(2).Text) * 100) - 100).ToString("n2")
            'e.Row.Cells(11).Text = (((e.Row.Cells(6).Text / e.Row.Cells(4).Text) * 100) - 100).ToString("n2")
            'e.Row.Cells(12).Text = (((e.Row.Cells(8).Text / e.Row.Cells(6).Text) * 100) - 100).ToString("n2")

            If e.Row.Cells(5).Text < 0 Then
                e.Row.Cells(5).ForeColor = Drawing.Color.Red
            Else
                e.Row.Cells(5).ForeColor = Drawing.Color.Black
            End If

        End If
    End Sub

End Class
