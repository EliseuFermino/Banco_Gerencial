Imports DevExpress.Web

Partial Class MemberPages_GE_DistribuicaoVendas
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init

        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(85, User.Identity.Name)
            Me.cboAno.CallAno = 2012
            Me.cboMes.CallMes = 10
            Me.cboFilial.CallFilial = 6

            Session("sANO") = Me.cboAno.CallAno
            Session("sMES") = Me.cboMes.CallMes
            Session("sFILIAL") = Me.cboFilial.CallFilial

            Me.cboAno.AutoPostBack = True
            Me.cboMes.AutoPostBack = True
            Me.cboFilial.AutoPostBack = True

        End If
    End Sub

    Protected Sub chkQtde_CheckedChanged(sender As Object, e As EventArgs) Handles chkQtde.CheckedChanged
        If Me.chkQtde.Checked = True Then
            Call ChartQuantidade()
        End If
        Me.chart50.DataBind()
    End Sub

    Private Sub ChartQuantidade()
        Me.chart50.DataSourceID = "dsSecao50"
        Me.chart51.DataSourceID = "dsSecao51"
        Me.chart52.DataSourceID = "dsSecao52"
        Me.chart53.DataSourceID = "dsSecao53"
        Me.chart54.DataSourceID = "dsSecao54"
    End Sub

    Private Sub ChartValor()
        Me.chart50.DataSourceID = "dsSecao50v"
        Me.chart51.DataSourceID = "dsSecao51v"
        Me.chart52.DataSourceID = "dsSecao52v"
        Me.chart53.DataSourceID = "dsSecao53v"
        Me.chart54.DataSourceID = "dsSecao54v"
    End Sub

    Protected Sub chkValor_CheckedChanged(sender As Object, e As EventArgs) Handles chkValor.CheckedChanged
        If Me.chkValor.Checked = True Then
            Call ChartValor()
        End If
        Me.chart50.DataBind()
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

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Distribuição das Vendas de Garantia Estendida"
    End Sub

    Protected Sub cboFilial_ListCorporacaoChanged(sender As Object, e As EventArgs) Handles cboFilial.ListCorporacaoChanged
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Call Atualizar()
    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Call Atualizar()
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
End Class
