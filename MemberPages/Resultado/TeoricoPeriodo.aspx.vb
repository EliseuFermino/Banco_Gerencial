Imports DevExpress.Web

Partial Class MemberPages_Resultado_TeoricoPeriodo
    Inherits System.Web.UI.Page

    Private vlrP1 As Decimal = 0
    Private vlrP2 As Decimal = 0
    Private vlrP3 As Decimal = 0
    Private vlrAC As Decimal = 0
    Private percP1 As Decimal = 0
    Private percP2 As Decimal = 0
    Private percP3 As Decimal = 0
    Private percAC As Decimal = 0

    Protected Sub ASPxGridView1_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles ASPxGridView1.CustomSummaryCalculate
        On Error Resume Next
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Start Then
            vlrP1 = 0
            vlrP2 = 0
            vlrP3 = 0
            vlrAC = 0

            percP1 = 0
            percP2 = 0
            percP3 = 0
            percAC = 0

        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Calculate Then

            Dim myFilter As Int16 = Convert.ToInt16(e.GetValue("idGrupo"))
            If myFilter = 47 Then
                vlrP1 += Convert.ToDecimal(e.GetValue("p1_vlrRea"))
                vlrP2 += Convert.ToDecimal(e.GetValue("p2_vlrRea"))
                vlrP3 += Convert.ToDecimal(e.GetValue("p3_vlrRea"))
                vlrAC += Convert.ToDecimal(e.GetValue("ac_vlrRea"))

                percP1 += Convert.ToDecimal(e.GetValue("p1_percRea"))
                percP2 += Convert.ToDecimal(e.GetValue("p2_percRea"))
                percP3 += Convert.ToDecimal(e.GetValue("p3_percRea"))
                percAC += Convert.ToDecimal(e.GetValue("ac_percRea"))
               
            End If

        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Finalize Then
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p1_vlrRea" Then e.TotalValue = vlrP1
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p2_vlrRea" Then e.TotalValue = vlrP2
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p3_vlrRea" Then e.TotalValue = vlrP3
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "ac_vlrRea" Then e.TotalValue = vlrAC

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p1_percRea" Then e.TotalValue = percP1
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p2_percRea" Then e.TotalValue = percP2
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "p3_percRea" Then e.TotalValue = percP3
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "ac_percRea" Then e.TotalValue = percAC

        End If
    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared
        On Error Resume Next
        ' 1º Periodo
        If e.DataColumn.FieldName = "p1_vlrOri" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "p1_vlrRev" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "p1_vlrRea" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "p1_percOri" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "p1_percRev" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "p1_percRea" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        ' 2º Periodo
        If e.DataColumn.FieldName = "p2_vlrOri" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "p2_vlrRev" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "p2_vlrRea" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "p2_percOri" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "p2_percRev" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "p2_percRea" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        ' 3º Periodo
        If e.DataColumn.FieldName = "p3_vlrOri" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "p3_vlrRev" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "p3_vlrRea" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "p3_percOri" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "p3_percRev" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "p3_percRea" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        ' Acumulado
        If e.DataColumn.FieldName = "ac_vlrOri" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "ac_vlrRev" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "ac_vlrRea" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "ac_percOri" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "ac_percRev" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "ac_percRea" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If


    End Sub

    Protected Sub ASPxGridView1_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles ASPxGridView1.HtmlFooterCellPrepared
        Dim col = TryCast(e.Column, GridViewDataColumn)
        If col Is Nothing Then
            Return
        End If

        Dim g As ASPxGridView = TryCast(sender, ASPxGridView)
        Dim fieldName As String = col.FieldName
        Dim value As Decimal

        If e.IsTotalFooter Then
            Dim item = g.TotalSummary(fieldName)
            If item Is Nothing Then
                Return
            End If
            value = CDec(g.GetTotalSummaryValue(item))
        Else
            Dim item = g.GroupSummary(fieldName)
            If item Is Nothing Then
                Return
            End If

            value = CDec(g.GetGroupSummaryValue(e.VisibleIndex, item))
        End If

        If value < 0 Then
            e.Cell.ForeColor = Drawing.Color.Red
        End If
    End Sub

    Protected Sub ASPxGridView1_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles ASPxGridView1.HtmlRowPrepared
        If e.RowType <> GridViewRowType.Data Then
        End If

        Dim NomeColuna As String = e.GetValue("idGrupo")

        Select Case NomeColuna
            Case "1", "4", "47"
                e.Row.BackColor = System.Drawing.Color.Honeydew
                e.Row.Font.Bold = True
            Case "16", "18", "20", "22", "24", "26", "28", "30", "32", "73", "34", "36"
                e.Row.BackColor = System.Drawing.Color.Beige
            Case "39", "51", "10", "50", "80"
                e.Row.BackColor = System.Drawing.Color.LavenderBlush
            Case "7", "3", "40", "42", "79", "13"
                e.Row.BackColor = System.Drawing.Color.LightGray
                e.Row.Font.Bold = True
            Case "14"
                e.Row.BackColor = System.Drawing.Color.Yellow
                e.Row.Font.Bold = True


        End Select
        'LightYellow
        'Lavender
        'LightGoldenrodYellow
        'LightGreen
        'MediumSpringGreen
        'PaleGreen
        'Gainsboro = Cinza Claro
        'Lavender = Roxo Claro
        'LightPink = Rosa Claro
        'LightSalmon = Laranja
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(148, Page.User.Identity.Name)
            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = Year(Now())
            Me.cboAno.CallAno = Year(Now())
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Resultado Teórico - por Período e Acumulado"
    End Sub

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback

        If Me.chkMostrarCabecalho.Checked = True Then
            Me.ASPxGridView1.Settings.ShowVerticalScrollBar = True
        Else
            Me.ASPxGridView1.Settings.ShowVerticalScrollBar = False
        End If

        Session("sFILIAL") = Me.cboFilial.CallFilial
        Session("sANO") = Me.cboAno.CallAno

        Me.ASPxGridView1.DataBind()
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            Session("sANO") = Me.cboAno.CallAno
            Session("sFILIAL") = Me.cboFilial.CallFilial
            Me.ASPxGridView1.DataBind()
        End If
    End Sub

    Protected Sub cboFilial_ListCorporacaoChanged(sender As Object, e As EventArgs) Handles cboFilial.ListCorporacaoChanged
        If Me.cboFilial.CallCorporacao = 3 Then
            Me.cboFilial.CallFilial = 3
        ElseIf Me.cboFilial.CallCorporacao = 199 Then
            Me.cboFilial.CallFilial = 199
        End If

    End Sub

End Class
