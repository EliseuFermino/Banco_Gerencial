Imports DevExpress.Web


Partial Class MemberPages_NovaDRE
    Inherits System.Web.UI.Page


    Protected Sub ASPxGridView2_BeforePerformDataSelect(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("KEY1") = CType(sender, ASPxGridView).GetMasterRowKeyValue()
    End Sub

    Protected Sub ASPxGridView3_BeforePerformDataSelect(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("KEY2") = CType(sender, ASPxGridView).GetMasterRowKeyValue()
    End Sub

    
    Protected Sub ASPxGridView1_HtmlRowPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles ASPxGridView1.HtmlRowPrepared
        If e.RowType <> GridViewRowType.Data Then
            Return
        End If

        Dim NomeColuna As String = Convert.ToInt16(e.GetValue("idG1"))

        Select Case NomeColuna
            Case 3, 10, 12, 15, 19
                e.Row.BackColor = System.Drawing.Color.LightGray
                e.Row.Font.Bold = True
            Case 21, 24
                e.Row.BackColor = System.Drawing.Color.Yellow
                e.Row.Font.Bold = True
            Case 26
                e.Row.BackColor = System.Drawing.Color.LightGreen
                e.Row.Font.Bold = True
            Case 20, 22, 23, 25
                e.Row.BackColor = System.Drawing.Color.LightGoldenrodYellow
            Case 6
                e.Row.BackColor = System.Drawing.Color.LavenderBlush
            Case 7
                e.Row.BackColor = System.Drawing.Color.AliceBlue
        End Select
       

    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared
        On Error Resume Next
        If e.DataColumn.FieldName = "vlrAA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If
        If e.DataColumn.FieldName = "percAA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrMA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If
        If e.DataColumn.FieldName = "percMA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrMeta" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If
        If e.DataColumn.FieldName = "percMeta" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlr" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If
        If e.DataColumn.FieldName = "perc" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

    End Sub

    Protected Sub ASPxGridView4_BeforePerformDataSelect(ByVal sender As Object, ByVal e As System.EventArgs)
        Session("KEY3") = CType(sender, ASPxGridView).GetMasterRowKeyValue()
    End Sub

  
    Protected Sub ASPxGridView2_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs)
        On Error Resume Next
        If e.DataColumn.FieldName = "vlrAA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If
        If e.DataColumn.FieldName = "percAA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrMA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If
        If e.DataColumn.FieldName = "percMA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrMeta" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If
        If e.DataColumn.FieldName = "percMeta" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlr" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If
        If e.DataColumn.FieldName = "perc" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Me.cboAno.AnoInicial = 2011
            Me.cboAno.AnoFinal = 2013

        End If
    End Sub
End Class
