
Partial Class MemberPages_Resultado_Financeiro_viewImpostoFiscal
    Inherits System.Web.UI.Page

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared
        If e.DataColumn.FieldName = "vlrCompras" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrCOFINS" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrPIS" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrICMS" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "Total" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

    End Sub

    Protected Sub ASPxGridView1_SummaryDisplayText(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewSummaryDisplayTextEventArgs) Handles ASPxGridView1.SummaryDisplayText
       
        If Convert.ToDouble(e.Value) < 0 Then
            Me.ASPxGridView1.Columns.Item("vlrCOFINS").FooterCellStyle.ForeColor = Drawing.Color.Red
        End If

        If Convert.ToDouble(e.Value) < 0 Then
            Me.ASPxGridView1.Columns.Item("vlrPIS").FooterCellStyle.ForeColor = Drawing.Color.Red
        End If

        If Convert.ToDouble(e.Value) < 0 Then
            Me.ASPxGridView1.Columns.Item("vlrICMS").FooterCellStyle.ForeColor = Drawing.Color.Red
        End If

        If Convert.ToDouble(e.Value) < 0 Then
            Me.ASPxGridView1.Columns.Item("Total").FooterCellStyle.ForeColor = Drawing.Color.Red
        End If
    End Sub

   
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Month(Now()) > 1 Then
            Me.cboAno.Text = Year(Now())
        Else
            Me.cboAno.Text = Year(Now()) - 1
        End If

        Me.cboMes.Text = Month(Now) - 1
    End Sub
End Class
