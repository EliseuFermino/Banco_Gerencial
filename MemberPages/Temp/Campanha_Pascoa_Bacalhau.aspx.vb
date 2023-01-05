Imports DevExpress.Web


Partial Class MemberPages_Campanha_Pascoa_Bacalhau
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(100, User.Identity.Name)
            Session("sCAMPANHA") = 1

            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = Year(Now())

            Me.cboAno.AutoPostBack = True
            Me.cboAno.CallAno = Year(Now())
            Session("sCAMPANHA") = 1
            Session("sANO") = Year(Now())
            oVem.Campanha_BuscarPeriodo(1, Year(Now()))

            Me.lblTitulo.Text = "Período Acumulado:  " & Year(Now()) - 1 & ": " & oVem.Dia1 & " a " & oVem.Dia2 & "."
            Me.lblTitulo1.Text = "" & Year(Now()) & ": " & oVem.Dia3 & " a " & oVem.Dia4 & "."

            Call myLegendas()
        End If
    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared
        On Error Resume Next

        If e.DataColumn.FieldName = "percCresQtde" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percCresVenda" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "Dif" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percCresLucro" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

    End Sub

    Protected Sub ASPxGridView1_HtmlRowPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles ASPxGridView1.HtmlRowPrepared
        If e.RowType <> GridViewRowType.Data Then
        End If

        Dim NomeColuna As String = e.GetValue("idFilial")

        Select Case NomeColuna
            Case "207", "208", "250", "215"
                e.Row.BackColor = System.Drawing.Color.LightGoldenrodYellow
                e.Row.Font.Bold = True
            Case "240", "99"
                e.Row.BackColor = System.Drawing.Color.LightGreen
                e.Row.Font.Bold = True
        End Select
        'LightYellow
        'Lavender
    End Sub

#Region "Meus Scipts"

    Private Sub myLegendas()
        Me.ASPxGridView1.SettingsText.Title = "Análise Total do Bacalhau " & Me.cboAno.CallAno

        'Colunas
        With Me.ASPxGridView1.Columns
            .Item("QtdeAA").Caption = Me.cboAno.CallAno - 1
            .Item("Qtde").Caption = Me.cboAno.CallAno

            .Item("VendaAA").Caption = Me.cboAno.CallAno - 1
            .Item("Venda").Caption = Me.cboAno.CallAno

            .Item("MargemAA").Caption = Me.cboAno.CallAno - 1
            .Item("Margem").Caption = Me.cboAno.CallAno

            .Item("LucroAA").Caption = Me.cboAno.CallAno - 1
            .Item("Lucro").Caption = Me.cboAno.CallAno
        End With

        Me.gridMeta.Columns.Item("VendaAA").Caption = Me.cboAno.CallAno - 1
        Me.gridMeta.Columns.Item("Meta").Caption = "Meta " & Me.cboAno.CallAno
    End Sub

#End Region

    Protected Sub cboAno_ListAnoChanged(sender As Object, e As EventArgs) Handles cboAno.ListAnoChanged
        Session("sANO") = Me.cboAno.CallAno
        Call myLegendas()
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.Master.FindControl("lblTitle"), Label).Text = "Análise da Páscoa 2013"
    End Sub

    Protected Sub gridTodosItens_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridTodosItens.CustomSummaryCalculate
        On Error Resume Next
        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)

        If e.IsGroupSummary Then
            If summary.FieldName = "percMargem" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, gridTodosItens.GroupSummary("Venda")))
                Dim vlrMargem As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, gridTodosItens.GroupSummary("LucroComercial")))

                e.TotalValue = ((vlrMargem / vlrVenda) * 100)

            End If

        ElseIf e.IsTotalSummary Then
            If summary.FieldName = "percMargem" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(gridTodosItens.GetTotalSummaryValue(gridTodosItens.TotalSummary("Venda")))
                Dim vlrMargem As Decimal = Convert.ToDecimal(gridTodosItens.GetTotalSummaryValue(gridTodosItens.TotalSummary("LucroComercial")))
                e.TotalValue = ((vlrMargem / vlrVenda) * 100)
            End If


        End If
    End Sub

    Protected Sub ASPxGridView2_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles ASPxGridView2.CustomSummaryCalculate
        On Error Resume Next
        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)

        If e.IsTotalSummary Then
            If summary.FieldName = "percMargem" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(ASPxGridView2.GetTotalSummaryValue(ASPxGridView2.TotalSummary("Venda")))
                Dim vlrMargem As Decimal = Convert.ToDecimal(ASPxGridView2.GetTotalSummaryValue(ASPxGridView2.TotalSummary("LucroComercial")))
                e.TotalValue = ((vlrMargem / vlrVenda) * 100)
            End If


        End If
    End Sub

End Class
