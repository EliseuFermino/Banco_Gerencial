Imports DevExpress.Web

Partial Class MemberPages_Planejamento_Perdas_viewQuebraOriginal12meses
    Inherits System.Web.UI.Page

    Protected Sub cbPanel1_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel1.Callback
        Call Atualizar()

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(182, User.Identity.Name)
            Me.cboAno.AnoInicial = 2011
            Me.cboAno.AnoFinal = Year(Now()) + 1
            Me.cboAno.CallAno = Year(Now())
            Me.cboAno.AutoPostBack = False
            Call Atualizar()
        End If
    End Sub

    Private Sub Atualizar()
        Session("sANO") = Me.cboAno.CallAno
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Me.grid1.DataBind()
    End Sub

    Protected Sub grid1_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid1.CustomSummaryCalculate
        On Error Resume Next
        Dim gridView As ASPxGridView = TryCast(sender, ASPxGridView)
        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)

        If e.IsTotalSummary Then
            'Janeiro
            If summary.FieldName = "percPerdaMes01" Then
                Dim vMes01 As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vMes01")))
                Dim pMes01 As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("pMes01")))
                e.TotalValue = ((pMes01 / vMes01) * 100)
            End If

            'Fevereiro
            If summary.FieldName = "percPerdaMes02" Then
                Dim vMes02 As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vMes02")))
                Dim pMes02 As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("pMes02")))
                e.TotalValue = ((pMes02 / vMes02) * 100)
            End If

            'Março
            If summary.FieldName = "percPerdaMes03" Then
                Dim vMes03 As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vMes03")))
                Dim pMes03 As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("pMes03")))
                e.TotalValue = ((pMes03 / vMes03) * 100)
            End If

            'Abril
            If summary.FieldName = "percPerdaMes04" Then
                Dim vMes04 As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vMes04")))
                Dim pMes04 As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("pMes04")))
                e.TotalValue = ((pMes04 / vMes04) * 100)
            End If

            'Maio
            If summary.FieldName = "percPerdaMes05" Then
                Dim vMes05 As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vMes05")))
                Dim pMes05 As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("pMes05")))
                e.TotalValue = ((pMes05 / vMes05) * 100)
            End If

            'Junho
            If summary.FieldName = "percPerdaMes06" Then
                Dim vMes06 As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vMes06")))
                Dim pMes06 As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("pMes06")))
                e.TotalValue = ((pMes06 / vMes06) * 100)
            End If

            'Julho
            If summary.FieldName = "percPerdaMes07" Then
                Dim vMes07 As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vMes07")))
                Dim pMes07 As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("pMes07")))
                e.TotalValue = ((pMes07 / vMes07) * 100)
            End If

            'Agosto
            If summary.FieldName = "percPerdaMes08" Then
                Dim vMes08 As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vMes08")))
                Dim pMes08 As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("pMes08")))
                e.TotalValue = ((pMes08 / vMes08) * 100)
            End If

            'Setembro
            If summary.FieldName = "percPerdaMes09" Then
                Dim vMes09 As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vMes09")))
                Dim pMes09 As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("pMes09")))
                e.TotalValue = ((pMes09 / vMes09) * 100)
            End If

            'Outubro
            If summary.FieldName = "percPerdaMes10" Then
                Dim vMes10 As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vMes10")))
                Dim pMes10 As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("pMes10")))
                e.TotalValue = ((pMes10 / vMes10) * 100)
            End If

            'Novembro
            If summary.FieldName = "percPerdaMes11" Then
                Dim vMes11 As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vMes11")))
                Dim pMes11 As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("pMes11")))
                e.TotalValue = ((pMes11 / vMes11) * 100)
            End If

            'Dezembro
            If summary.FieldName = "percPerdaMes12" Then
                Dim vMes12 As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vMes12")))
                Dim pMes12 As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("pMes12")))
                e.TotalValue = ((pMes12 / vMes12) * 100)
            End If

            'Ano
            If summary.FieldName = "percPerdaAno" Then
                Dim vAno As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vAno")))
                Dim pAno As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("pAno")))
                e.TotalValue = ((pAno / vAno) * 100)
            End If

        End If
    End Sub

    Protected Sub cboFilial_ListCorporacaoChanged(sender As Object, e As EventArgs) Handles cboFilial.ListCorporacaoChanged
        If Me.cboFilial.CallFilial = 99 Then
            Me.cboFilial.Enabled_cboFilial = False
        Else
            Me.cboFilial.Enabled_cboFilial = True
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Meta Original da Agenda 23 por Seção - 12 Meses - PGR182"
    End Sub

    Protected Sub grid1_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid1.HtmlDataCellPrepared
        On Error Resume Next
        If e.DataColumn.FieldName = "pMes01" Or
            e.DataColumn.FieldName = "pMes02" Or
            e.DataColumn.FieldName = "pMes03" Or
            e.DataColumn.FieldName = "pMes04" Or
            e.DataColumn.FieldName = "pMes05" Or
            e.DataColumn.FieldName = "pMes06" Or
            e.DataColumn.FieldName = "pMes07" Or
            e.DataColumn.FieldName = "pMes08" Or
            e.DataColumn.FieldName = "pMes09" Or
            e.DataColumn.FieldName = "pMes10" Or
            e.DataColumn.FieldName = "pMes11" Or
            e.DataColumn.FieldName = "pMes12" Or
            e.DataColumn.FieldName = "pAno" Or
                e.DataColumn.FieldName = "percPerdaMes01" Or
                e.DataColumn.FieldName = "percPerdaMes02" Or
                e.DataColumn.FieldName = "percPerdaMes03" Or
                e.DataColumn.FieldName = "percPerdaMes04" Or
                e.DataColumn.FieldName = "percPerdaMes05" Or
                e.DataColumn.FieldName = "percPerdaMes06" Or
                e.DataColumn.FieldName = "percPerdaMes07" Or
                e.DataColumn.FieldName = "percPerdaMes08" Or
                e.DataColumn.FieldName = "percPerdaMes09" Or
                e.DataColumn.FieldName = "percPerdaMes10" Or
                e.DataColumn.FieldName = "percPerdaMes11" Or
                e.DataColumn.FieldName = "percPerdaMes12" Or
                e.DataColumn.FieldName = "percPerdaAno" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If
    End Sub

    Protected Sub grid1_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid1.HtmlFooterCellPrepared
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
