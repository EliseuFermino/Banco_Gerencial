Imports DevExpress.Web

Partial Class MemberPages_Quebras_AnaliseComposicaoQuebraMes
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(92, User.Identity.Name)
            Me.cboAnoInicial.AnoInicial = 2011
            Me.cboAnoInicial.AnoFinal = Year(Now())
            Me.cboAnoInicial.CallAno = Year(Now())

            Me.cboAnoFinal.AnoInicial = 2011
            Me.cboAnoFinal.AnoFinal = Year(Now())
            Me.cboAnoFinal.CallAno = Year(Now())

            Me.cboAnoInicial.CallAno = Year(Now())
            Session("sANO_INICIAL") = Me.cboAnoInicial.CallAno
            Session("sANO_FINAL") = Me.cboAnoFinal.CallAno
            Session("sMES_INICIAL") = Me.cboMesInicial.CallMes
            Session("sMES_FINAL") = Me.cboMesFinal.CallMes
            Session("sFILIAL") = Me.cboFilial.CallFilial

            Me.cboAnoInicial.AutoPostBack = False
            Me.cboAnoFinal.AutoPostBack = False
            Me.cboMesFinal.AutoPostBack = False
            Me.cboMesInicial.AutoPostBack = False
            Me.cboFilial.AutoPostBack = False

            Me.btnAtualizar.btnSalvar_Text = "Atualizar"
        End If
    End Sub

    Private Sub Atualizar()
        Session("sANO_INICIAL") = Me.cboAnoInicial.CallAno
        Session("sANO_FINAL") = Me.cboAnoFinal.CallAno
        Session("sMES_INICIAL") = Me.cboMesInicial.CallMes
        Session("sMES_FINAL") = Me.cboMesFinal.CallMes
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Me.gridDepto.DataBind()
    End Sub

    Protected Sub btnAtualizar_BotaoClick(sender As Object, e As EventArgs) Handles btnAtualizar.BotaoClick
        Call Atualizar()
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Ánalise de Quebra por Item"
    End Sub

    Protected Sub gridDepto_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridDepto.CustomSummaryCalculate
        On Error Resume Next
        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)

       If e.IsTotalSummary Then
            'Percentual Total de Margem
            If summary.FieldName = "percCresc" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(gridDepto.GetTotalSummaryValue(gridDepto.TotalSummary("vlrVenda")))
                Dim vlrQuebra As Decimal = Convert.ToDecimal(gridDepto.GetTotalSummaryValue(gridDepto.TotalSummary("vlrQuebra")))
                e.TotalValue = ((vlrQuebra / vlrVenda) * 100)
            End If

            'Percentual De Margem
            If summary.FieldName = "percMargem" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(gridDepto.GetTotalSummaryValue(gridDepto.TotalSummary("vlrVenda")))
                Dim vlrMargem As Decimal = Convert.ToDecimal(gridDepto.GetTotalSummaryValue(gridDepto.TotalSummary("vlrMargem")))
                e.TotalValue = ((vlrMargem / vlrVenda) * 100)
            End If

        End If
    End Sub
    
    Protected Sub gridSecao_BeforePerformDataSelect(sender As Object, e As EventArgs)
        Session("sDEPTO") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

    Protected Sub ASPxGridView1_BeforePerformDataSelect(sender As Object, e As EventArgs)
        Session("sSECAO") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

    Protected Sub ASPxGridView1_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs)
        On Error Resume Next
        Dim gridView As ASPxGridView = TryCast(sender, ASPxGridView)
        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)

        If e.IsGroupSummary Then
            'Percentual De Crescimento de Perda
            If summary.FieldName = "percCresc" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, gridView.GroupSummary("vlrVenda")))
                Dim vlrQuebra As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, gridView.GroupSummary("vlrQuebra")))
                e.TotalValue = ((vlrQuebra / vlrVenda) * 100)
            End If

            'Percentual De Margem
            If summary.FieldName = "percMargem" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, gridView.GroupSummary("vlrVenda")))
                Dim vlrMargem As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, gridView.GroupSummary("vlrMargem")))
                e.TotalValue = ((vlrMargem / vlrVenda) * 100)
            End If

        ElseIf e.IsTotalSummary Then
            'Percentual Total de Margem
            If summary.FieldName = "percCresc" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrVenda")))
                Dim vlrQuebra As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrQuebra")))
                e.TotalValue = ((vlrQuebra / vlrVenda) * 100)
            End If

            'Percentual De Margem
            If summary.FieldName = "percMargem" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrVenda")))
                Dim vlrMargem As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrMargem")))
                e.TotalValue = ((vlrMargem / vlrVenda) * 100)
            End If

        End If

    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs)
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

        If e.DataColumn.FieldName = "vlrDiv" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "QtdeDiv" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

    End Sub

    Protected Sub ASPxGridView1_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs)
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

    Protected Sub gridDepto_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridDepto.HtmlDataCellPrepared
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

        If e.DataColumn.FieldName = "vlrDiv" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "QtdeDiv" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

    End Sub

    Protected Sub gridDepto_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gridDepto.HtmlFooterCellPrepared
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

    Protected Sub gridSecao_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs)
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

        If e.DataColumn.FieldName = "vlrDiv" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "QtdeDiv" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If
    End Sub

    Protected Sub gridSecao_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs)
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

    Protected Sub gridSecao_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs)
        On Error Resume Next
        Dim gridView As ASPxGridView = TryCast(sender, ASPxGridView)
        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)

        If e.IsTotalSummary Then
            'Percentual Total de Margem
            If summary.FieldName = "percCresc" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrVenda")))
                Dim vlrQuebra As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrQuebra")))
                e.TotalValue = ((vlrQuebra / vlrVenda) * 100)
            End If

            'Percentual De Margem
            If summary.FieldName = "percMargem" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrVenda")))
                Dim vlrMargem As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrMargem")))
                e.TotalValue = ((vlrMargem / vlrVenda) * 100)
            End If

        End If
    End Sub

    Protected Sub cboFilial_ListCorporacaoChanged(sender As Object, e As EventArgs) Handles cboFilial.ListCorporacaoChanged
        If Me.cboFilial.CallCorporacao = 199 Then
            Me.cboFilial.Enabled_cboFilial = False
        Else
            Me.cboFilial.Enabled_cboFilial = True
        End If

    End Sub
End Class
