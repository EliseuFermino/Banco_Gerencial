Imports DevExpress.Web

Partial Class MemberPages_Quebras_appQuebras001
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            Dim myAno As Int16 = Year(DateAndTime.Now())

            oVem.AtualizarEstatisticaPrograma(93, User.Identity.Name)

            Me.cboAnoInicial.AnoInicial = 2011
            Me.cboAnoInicial.AnoFinal = myAno
            Me.cboAnoInicial.CallAno = myAno

            Me.cboAnoFinal.AnoInicial = 2011
            Me.cboAnoFinal.AnoFinal = myAno
            Me.cboAnoFinal.CallAno = myAno

            Me.cboAnoInicial.AutoPostBack = False
            Me.cboAnoFinal.AutoPostBack = False
            Me.cboMesInicial.AutoPostBack = False
            Me.cboMesFinal.AutoPostBack = False
            Me.cboFilial.AutoPostBack = False

            Me.txtTop.Text = 10

            Me.chkFixarCabecalho.Checked = True

            Call Atualizar()
        End If
    End Sub

    Private Sub Atualizar()
        Session("sANO_INICIAL") = Me.cboAnoInicial.CallAno
        Session("sMES_INICIAL") = Me.cboMesInicial.CallMes
        Session("sANO_FINAL") = Me.cboAnoFinal.CallAno
        Session("sMES_FINAL") = Me.cboMesFinal.CallMes
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Session("sTOP") = CInt(Me.txtTop.Text)

        Me.grid.DataBind()
    End Sub

    Protected Sub ASPxCallbackPanel1_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles ASPxCallbackPanel1.Callback
        Call Atualizar()
    End Sub


    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Ánalise de Quebra por Item - TOP'n"
    End Sub


    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs)
        'On Error Resume Next
        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)

        If e.IsGroupSummary Then

            If summary.FieldName = "percCresc" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, grid.GroupSummary("vlrVenda")))
                Dim vlrQuebra As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, grid.GroupSummary("vlrQuebra")))
                If vlrVenda AndAlso vlrQuebra <> 0 Then
                    e.TotalValue = ((vlrQuebra / vlrVenda) * 100)
                Else
                    e.TotalValue = 0
                End If

            End If

            'Percentual De Margem
            If summary.FieldName = "percMargem" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, grid.GroupSummary("vlrVenda")))
                Dim vlrMargem As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, grid.GroupSummary("vlrMargem")))
                If vlrVenda AndAlso vlrMargem <> 0 Then
                    e.TotalValue = ((vlrMargem / vlrVenda) * 100)
                Else
                    e.TotalValue = 0
                End If

            End If

        ElseIf e.IsTotalSummary Then
            'Percentual Total de Margem
            If summary.FieldName = "percCresc" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(grid.GetTotalSummaryValue(grid.TotalSummary("vlrVenda")))
                Dim vlrQuebra As Decimal = Convert.ToDecimal(grid.GetTotalSummaryValue(grid.TotalSummary("vlrQuebra")))
                If vlrVenda AndAlso vlrQuebra <> 0 Then
                    e.TotalValue = ((vlrQuebra / vlrVenda) * 100)
                Else
                    e.TotalValue = 0
                End If

            End If

            'Percentual De Margem
            If summary.FieldName = "percMargem" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(grid.GetTotalSummaryValue(grid.TotalSummary("vlrVenda")))
                Dim vlrMargem As Decimal = Convert.ToDecimal(grid.GetTotalSummaryValue(grid.TotalSummary("vlrMargem")))
                If vlrVenda AndAlso vlrMargem <> 0 Then
                    e.TotalValue = ((vlrMargem / vlrVenda) * 100)
                Else
                    e.TotalValue = 0
                End If

            End If

        End If

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs)
        'On Error Resume Next
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

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs)
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

    Protected Sub chkFixarCabecalho_CheckedChanged(sender As Object, e As EventArgs) Handles chkFixarCabecalho.CheckedChanged
        If Me.chkFixarCabecalho.Checked = True Then
            Me.grid.Settings.VerticalScrollBarMode = True
        Else
            Me.grid.Settings.VerticalScrollBarMode = False
        End If
    End Sub
End Class
