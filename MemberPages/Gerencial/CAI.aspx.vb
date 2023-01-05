Imports System.Web.UI
Imports DevExpress.Web.ASPxPivotGrid
Imports DevExpress.XtraPivotGrid


Partial Class MemberPages_Gerencial_CAI
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            Dim fieldFullName = New DevExpress.Web.ASPxPivotGrid.PivotGridField() With {.Caption = "fieldOrderAmount_1", .Area = PivotArea.DataArea}

            With fieldFullName
                .UnboundFieldName = "fieldFullName1"
                .Caption = "% CAI"
                .UnboundType = DevExpress.Data.UnboundColumnType.Decimal
                .UnboundExpression = "[" & fieldvlrCAI.ExpressionFieldName & "]" & " / " & "[" & fieldvlrVenda.ExpressionFieldName & "]" & " * 100"
                .CellFormat.FormatType = DevExpress.Utils.FormatType.Numeric
                .CellFormat.FormatString = "{0:n2}%"
            End With

            pivotGrid.Fields.Add(fieldFullName)

        End If


        


    End Sub

 
    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Total do CAI"
    End Sub

    Protected Sub pivotGrid_CustomUnboundFieldData(sender As Object, e As DevExpress.Web.ASPxPivotGrid.CustomFieldDataEventArgs) Handles pivotGrid.CustomUnboundFieldData
        'On Error Resume Next
        ''If Object.ReferenceEquals(e.Field, fieldOrderAmount) Then
        ''    'e.Value = Convert.ToDecimal(e.GetListSourceColumnValue("vlrCAI")) * Convert.ToDecimal(e.GetListSourceColumnValue("vlrVenda"))
        ''    e.Value = ((Convert.ToDecimal(e.GetListSourceColumnValue("vlrCAI")) / Convert.ToDecimal(e.GetListSourceColumnValue("vlrVenda"))) * 100)
        ''End If

        'Dim vlrCAI As Decimal = Convert.ToDecimal(e.GetListSourceColumnValue("vlrCAI"))
        'Dim vlrVenda As Decimal = Convert.ToDecimal(e.GetListSourceColumnValue("vlrVenda"))

        'e.Value = ((vlrCAI / vlrVenda) * 100)

    End Sub
End Class
