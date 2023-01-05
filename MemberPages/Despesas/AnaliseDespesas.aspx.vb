
Partial Class MemberPages_Despesas_AnaliseDespesas
    Inherits System.Web.UI.Page

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Análise de Despesas"
    End Sub

   
    Protected Sub ASPxPivotGrid1_CustomCellStyle(sender As Object, e As DevExpress.Web.ASPxPivotGrid.PivotCustomCellStyleEventArgs) Handles ASPxPivotGrid1.CustomCellStyle
        If e.ColumnValueType <> DevExpress.XtraPivotGrid.PivotGridValueType.Value OrElse e.RowValueType <> DevExpress.XtraPivotGrid.PivotGridValueType.Value Then
            Return
        End If
        If Convert.ToDecimal(e.Value) < 0 Then
            e.CellStyle.ForeColor = System.Drawing.Color.Red
        Else
            e.CellStyle.ForeColor = System.Drawing.Color.Blue
        End If

        If e.RowIndex Mod 2 = 0 Then
            Return
        End If

        If e.ColumnValueType = DevExpress.XtraPivotGrid.PivotGridValueType.Value AndAlso e.RowValueType = DevExpress.XtraPivotGrid.PivotGridValueType.Value Then
            e.CellStyle.BackColor = Drawing.Color.WhiteSmoke
        End If
    End Sub
End Class
