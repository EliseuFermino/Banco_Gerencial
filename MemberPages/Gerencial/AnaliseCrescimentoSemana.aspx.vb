Imports DevExpress.Web

Partial Class MemberPages_Gerencial_AnaliseCrescimentoSemana
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(132, User.Identity.Name)
            Me.cboAno.AnoInicial = 2013
            Me.cboAno.AnoFinal = Year(Now())
            Me.cboAno.CallAno = Year(Now())

            Me.cboSemana.CallSemana = 1


        End If
    End Sub

    Protected Sub cbPanel1_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel1.Callback
        Call Atualizar()
    End Sub

    Private Sub Atualizar()

        Session("sANO") = Me.cboAno.CallAno
        Session("sMES") = Me.cboMes.CallMes
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Session("sSEMANA") = Me.cboSemana.CallSemana

        Me.lblTituloResumoMes.Text = "Resumo por Dia da Semana - Mês de " & Me.cboMes.CallMesDesc & " - Unidade " & Me.cboFilial.CallFilialNome
        Me.lblTituloResumoAno.Text = "Resumo por Dia da Semana - Ano " & Me.cboAno.CallAno & " - Unidade " & Me.cboFilial.CallFilialNome
        Me.lblTituloDetalhado.Text = "Resumo Detalhado de " & Me.cboSemana.CallSemanaDesc & " - Unidade " & Me.cboFilial.CallFilialNome
        Me.lblTitulo_ResumoAno_TodasLojas.Text = "Resumo por Dia da Semana - " & Me.cboSemana.CallSemanaDesc & " - Ano " & Me.cboAno.CallAno & " - Loja a Loja."
        Me.lblTitulo_ResumoMes_TodasLojas.Text = "Resumo por Dia da Semana - " & Me.cboSemana.CallSemanaDesc & " - Mês " & Me.cboMes.CallMesDesc & " - Loja a Loja."

        Me.graficoResumoAno.DataBind()
        Me.graficoResumoMes.DataBind()
        Me.GraficoResumoAno_TodasLojas.DataBind()
        Me.GraficoResumoMes_TodasLojas.DataBind()

        Me.grafico1.DataBind()
        Me.grafico2.DataBind()
        Me.grafico3.DataBind()

        Me.gridDia.DataBind()
        Me.gridMes.DataBind()
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Analise do Crescimento da Semana - PGR132"
    End Sub

    Protected Sub gridMes_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridMes.CustomSummaryCalculate
        On Error Resume Next
        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)

        If e.IsGroupSummary Then
            If summary.FieldName = "percCresc" Then
                Dim vlrVendaAT As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, gridMes.GroupSummary("vlrVendaAT")))
                Dim vlrVendaAA As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, gridMes.GroupSummary("vlrVendaAA")))
                e.TotalValue = (((vlrVendaAT / vlrVendaAA) * 100) - 100)
            End If
        ElseIf e.IsTotalSummary Then
            If summary.FieldName = "percCresc" Then
                Dim vlrVendaAT As Decimal = Convert.ToDecimal(gridMes.GetTotalSummaryValue(gridMes.TotalSummary("vlrVendaAT")))
                Dim vlrVendaAA As Decimal = Convert.ToDecimal(gridMes.GetTotalSummaryValue(gridMes.TotalSummary("vlrVendaAA")))
                e.TotalValue = (((vlrVendaAT / vlrVendaAA) * 100) - 100)
            End If
        End If
    End Sub

    Protected Sub gridMes_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridMes.HtmlDataCellPrepared
        If e.DataColumn.FieldName = "percCresc" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If
    End Sub

    Protected Sub gridMes_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gridMes.HtmlFooterCellPrepared
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

    Protected Sub gridDia_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridDia.HtmlDataCellPrepared
        If e.DataColumn.FieldName = "perc" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            If Me.cboFilial.IsLoja = False Then Me.cboFilial.CallFilial = 3
            Call Atualizar()
        End If
    End Sub
End Class
