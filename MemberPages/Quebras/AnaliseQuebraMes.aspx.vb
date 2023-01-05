Imports DevExpress.Web

Partial Class MemberPages_Quebras_AnaliseQuebraMes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Me.cboAno.AnoInicial = 2011
            Me.cboAno.AnoFinal = Year(Now())
            Me.cboAno.CallAno = Year(Now())

            Session("sANO") = Me.cboAno.CallAno
            Session("sMESINICIAL") = Me.cboMesInicial.CallMes
            Session("sMESFINAL") = Me.cboMesFinal.CallMes
            Session("sFILIAL") = Me.cboFilial.CallFilial

            Me.cboAno.AutoPostBack = False
            Me.cboMesInicial.AutoPostBack = False
            Me.cboMesFinal.AutoPostBack = False
            Me.cboFilial.AutoPostBack = False

            Me.btnAtualizar.btnSalvar_Text = "Atualizar"
        End If
    End Sub

    Private Sub Atualizar()
        Session("sANO") = Me.cboAno.CallAno
        Session("sMESINICIAL") = Me.cboMesInicial.CallMes
        Session("sMESFINAL") = Me.cboMesFinal.CallMes
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Me.ASPxGridView1.DataBind()
    End Sub

    Protected Sub btnAtualizar_BotaoClick(sender As Object, e As EventArgs) Handles btnAtualizar.BotaoClick
        Call Atualizar()
    End Sub

    Protected Sub ASPxGridView1_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles ASPxGridView1.CustomSummaryCalculate
        On Error Resume Next
        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)

        If e.IsGroupSummary Then
            'Percentual De Crescimento de Perda
            If summary.FieldName = "percCresc" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, ASPxGridView1.GroupSummary("vlrVenda")))
                Dim vlrQuebra As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, ASPxGridView1.GroupSummary("vlrQuebra")))
                e.TotalValue = ((vlrQuebra / vlrVenda) * 100)
            End If

            'Percentual De Margem
            If summary.FieldName = "percMargem" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, ASPxGridView1.GroupSummary("vlrVenda")))
                Dim vlrMargem As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, ASPxGridView1.GroupSummary("vlrMargem")))
                e.TotalValue = ((vlrMargem / vlrVenda) * 100)
            End If

        ElseIf e.IsTotalSummary Then
            'Percentual Total de Margem
            If summary.FieldName = "percCresc" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("vlrVenda")))
                Dim vlrQuebra As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("vlrQuebra")))
                e.TotalValue = ((vlrQuebra / vlrVenda) * 100)
            End If

            'Percentual De Margem
            If summary.FieldName = "percMargem" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("vlrVenda")))
                Dim vlrMargem As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("vlrMargem")))
                e.TotalValue = ((vlrMargem / vlrVenda) * 100)
            End If
            
        End If
    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared
        On Error Resume Next
        If e.DataColumn.FieldName = "percCresc" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "Qtde52" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "Qtde23" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrAg52" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrAg23" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrQuebra" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "QtdeQuebra" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

    End Sub

    Protected Sub ASPxGridView1_HtmlFooterCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableFooterCellEventArgs) Handles ASPxGridView1.HtmlFooterCellPrepared
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

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Ánalise de Quebra por Item"
    End Sub
End Class
