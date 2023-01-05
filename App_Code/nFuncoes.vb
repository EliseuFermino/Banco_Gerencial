Imports Microsoft.VisualBasic
Imports DevExpress.Data
Imports DevExpress.Web

Public Class nFuncoes

    Public Sub nf_Grid_Footer_Calculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs, nameColumn As String,
                                      ByVal valueOne As String, ByVal valueTwo As String)

        If e.Item.FieldName = nameColumn Then
            Dim vlr_valueOne As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary(valueOne)
            Dim vlr_valueTwo As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary(valueTwo)

            Dim v_valueOne As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(vlr_valueOne))
            Dim v_valueTwo As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(vlr_valueTwo))

            If v_valueOne > 0 Then
                e.TotalValue = (((v_valueOne / v_valueTwo) * 100) - 100)
            End If
        End If

    End Sub

End Class
