Imports DevExpress.Web

Partial Class MemberPages_GE_GEresumoDepto
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(86, User.Identity.Name)
            Me.cboAno.CallAno = 2012
            Me.cboMes.CallMes = 10

            Session("sANO") = Me.cboAno.CallAno
            Session("sMES") = Me.cboMes.CallMes

            Me.cboAno.AutoPostBack = True
            Me.cboMes.AutoPostBack = True
            Me.chkFixarCabecalho.Checked = True
        End If
    End Sub

    Protected Sub cboAno_ListAnoChanged(sender As Object, e As EventArgs) Handles cboAno.ListAnoChanged
        Session("sANO") = Me.cboAno.CallAno
        Call Atualizar()
    End Sub

    Protected Sub cboMes_ListMesChanged(sender As Object, e As EventArgs) Handles cboMes.ListMesChanged
        Session("sMES") = Me.cboMes.CallMes
        Call Atualizar()
    End Sub

    Private Sub Atualizar()
        Me.gridSecao.DataBind()
    End Sub


    Protected Sub gridSecao_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridSecao.CustomSummaryCalculate
        On Error Resume Next
        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)

        If e.IsTotalSummary Then
            If summary.FieldName = "percCrescQtde" Then
                Dim vlrQtdeSLV As Decimal = Convert.ToDecimal(gridSecao.GetTotalSummaryValue(gridSecao.TotalSummary("qtdeSLV")))
                Dim vlrQtdeGE As Decimal = Convert.ToDecimal(gridSecao.GetTotalSummaryValue(gridSecao.TotalSummary("qtdeGE")))
                e.TotalValue = ((vlrQtdeGE / vlrQtdeSLV) * 100)
            End If
        End If

        If e.IsTotalSummary Then
            If summary.FieldName = "percCrescVenda" Then
                Dim vlrVendaSLV As Decimal = Convert.ToDecimal(gridSecao.GetTotalSummaryValue(gridSecao.TotalSummary("vlrVendaSLV")))
                Dim vlrVendaGE As Decimal = Convert.ToDecimal(gridSecao.GetTotalSummaryValue(gridSecao.TotalSummary("vlrVendaGE")))
                e.TotalValue = ((vlrVendaGE / vlrVendaSLV) * 100)
            End If
        End If
    End Sub

    Protected Sub chkFixarCabecalho_chkFixarCabecalhoChecked(sender As Object, e As EventArgs) Handles chkFixarCabecalho.chkFixarCabecalhoChecked
        If Me.chkFixarCabecalho.Checked = True Then
            Me.gridSecao.Settings.ShowVerticalScrollBar = True
        Else
            Me.gridSecao.Settings.ShowVerticalScrollBar = False
        End If
    End Sub

    Protected Sub btnExportar_Click(sender As Object, e As EventArgs) Handles btnExportar.Click
        Me.ASPxGridViewExporter1.WriteXlsToResponse()
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Garantia Estendida - Resumo por Departamento"
    End Sub

End Class
