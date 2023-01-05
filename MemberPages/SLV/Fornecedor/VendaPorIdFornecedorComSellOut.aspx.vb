Imports DevExpress.Web

Partial Class MemberPages_SLV_Fornecedor_VendaPorIdFornecedorComSellOut
    Inherits System.Web.UI.Page

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback

        Session("sDIAINICIAL") = Me.cboPeriodo.CallDiaInicial
        Session("sDIAFINAL") = Me.cboPeriodo.CallDiaFinal
        Session("sFORNECEDOR") = Me.cboFornecedor.CallFornecedor


        Me.grid.Visible = True
        Me.grid.DataBind()
    End Sub

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate
        On Error Resume Next
        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)

        If e.IsTotalSummary Then
            If summary.FieldName = "percMargem" Then
                Dim vVendaAT As Decimal = Convert.ToDecimal(grid.GetTotalSummaryValue(grid.TotalSummary("vlrVenda")))
                Dim vMargemAT As Decimal = Convert.ToDecimal(grid.GetTotalSummaryValue(grid.TotalSummary("vlrLucro")))

                If vVendaAT > 0 Then
                    e.TotalValue = vMargemAT / vVendaAT * 100
                Else
                    e.TotalValue = 0
                End If
            End If


            If e.Item.FieldName = "percMargemSellOut" Then
                Dim vVendaAT As Decimal = Convert.ToDecimal(grid.GetTotalSummaryValue(grid.TotalSummary("vlrVenda")))
                Dim vMargemSellOut As Decimal = Convert.ToDecimal(grid.GetTotalSummaryValue(grid.TotalSummary("LucroSellOut")))

                If vVendaAT > 0 Then
                    e.TotalValue = vMargemSellOut / vVendaAT * 100
                Else
                    e.TotalValue = 0
                End If
            End If

            If e.Item.FieldName = "percMargemPraticada" Then
                Dim pMargemEfetiva As Decimal = Convert.ToDecimal(grid.GetTotalSummaryValue(grid.TotalSummary("percMargem")))
                Dim pMargemSellOut As Decimal = Convert.ToDecimal(grid.GetTotalSummaryValue(grid.TotalSummary("percMargemSellOut")))

                If pMargemSellOut > 0 Then
                    e.TotalValue = (pMargemEfetiva + pMargemSellOut)
                Else
                    e.TotalValue = 0
                End If
            End If

        End If
    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        On Error Resume Next
        If e.DataColumn.FieldName = "percMargemSellOut" Or
            e.DataColumn.FieldName = "percMargem" Or
            e.DataColumn.FieldName = "vlrLucro" Or
            e.DataColumn.FieldName = "vlrLucroPraticado" Or
            e.DataColumn.FieldName = "percMargemPraticada" Or
            e.DataColumn.FieldName = "LucroSellOut" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(146, User.Identity.Name)
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Venda com SellOut dos Produtos de um Fornecedor - PGR146"
    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared
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
End Class
