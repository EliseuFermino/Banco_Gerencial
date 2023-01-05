Imports DevExpress.Web

Partial Class MemberPages_Campanhas_Analises_c001
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(143, User.Identity.Name)
            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = Year(Now())
            Me.cboAno.CallAno = Year(Now())

            Call OcultarDados()
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Analise de Campanhas"
        If Not IsPostBack Then

            Me.cboMes.CallMes = Month(DateAndTime.Now()) - 1
            Session("sANO") = Me.cboAno.CallAno
            Session("sMES") = Me.cboMes.CallMes

            Me.dsListaCampanha.DataBind()
            Me.cboCampanha.SelectedIndex = 0

            'If Me.cboCampanha.SelectedIndex - 1 Then
            '    Me.btnAtualizar.Enabled = False
            'End If

        End If
    End Sub

    Protected Sub cboMes_ListMesChanged(sender As Object, e As EventArgs) Handles cboMes.ListMesChanged
        Call AtualizarLista()
        Me.dsListaCampanha.DataBind()
        Call OcultarDados()
        Me.cboCampanha.SelectedIndex = 0

        'If Me.cboCampanha.SelectedIndex - 1 Then
        '    Me.btnAtualizar.Enabled = False
        'End If
    End Sub

    Private Sub Atualizar()

        Me.cbPanel.SettingsLoadingPanel.ShowImage = True
        Me.cbPanel.SettingsLoadingPanel.Delay = 0
        'Session("sFILIAL") = Me.cboFilial.CallFilial
        Session("sCAMPANHA") = Me.cboCampanha.Value
        Session("sANO") = Me.cboAno.CallAno

        Me.lblTituloGrafico1.Text = Me.cboCampanha.SelectedItem().ToString
        Me.grafico1.DataBind()
        Me.grid2.DataBind()
        Me.gridTabela1.DataBind()
        Me.cbPanel.SettingsLoadingPanel.ShowImage = False

        Me.cboProdutos.Text = ""
        Me.gridTabela1.SettingsText.Title = "Campanha " & Me.cboCampanha.Text.ToString
        Me.graficoItem1.Visible = False
        Me.graficoItem2.Visible = False
        Me.divTitulo4.Visible = False
    End Sub

    Private Sub AtualizarLista()
        Session("sANO") = Me.cboAno.CallAno
        Session("sMES") = Me.cboMes.CallMes
    End Sub

    Protected Sub btnAtualizar_Click(sender As Object, e As EventArgs) Handles btnAtualizar.Click
        Call Atualizar()
        Call ExibirDados()
    End Sub

    Protected Sub cboCampanha_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboCampanha.Callback
        Me.dsListaCampanha.DataBind()
    End Sub

    Protected Sub cboTipo_TextChanged(sender As Object, e As EventArgs) Handles cboTipo.TextChanged
        Me.dsListaCampanha.DataBind()
        Call OcultarDados()
        Me.cboCampanha.SelectedIndex = 0
    End Sub

    Private Sub OcultarDados()
        Me.grafico1.Visible = False
        Me.grid2.Visible = False
        Me.graficoItem1.Visible = False
        Me.graficoItem2.Visible = False
        Me.gridItemTodasLojas.Visible = False
        Me.gridTabela1.Visible = False
        Me.lblTituloGrafico1.Visible = False

        Me.divTitulo1.Visible = False
        Me.divTitulo2.Visible = False
        Me.divTitulo3.Visible = False
        Me.divTitulo4.Visible = False
        Me.divTitulo5.Visible = False
        Me.divTituloTabelaItem1.Visible = False

        Me.cboProdutos.Visible = False
        Me.lblDescProdutos.Visible = False
    End Sub

    Private Sub ExibirDados()
        Me.grafico1.Visible = True
        Me.grid2.Visible = True
        Me.gridTabela1.Visible = True
        Me.lblTituloGrafico1.Visible = True

        Me.divTitulo1.Visible = True
        Me.divTitulo2.Visible = True

        Me.divTitulo3.Visible = True
        Me.divTituloTabelaItem1.Visible = True

        Me.cboProdutos.Visible = True
        Me.lblDescProdutos.Visible = True
    End Sub

    Protected Sub cboTipo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboTipo.SelectedIndexChanged
        Call OcultarDados()
    End Sub

    Protected Sub cboProdutos_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboProdutos.SelectedIndexChanged
        Session("sPRODUTO") = Me.cboProdutos.Value
        Me.graficoItem1.Visible = True
        Me.graficoItem2.Visible = True
        Me.gridItemTodasLojas.Visible = True
        Me.divTitulo4.Visible = True
        Me.divTitulo5.Visible = True
        Me.lblTitulo5.Text = "Analise Loja a Loja do Item " & Me.cboProdutos.SelectedItem().ToString
        Me.graficoItem1.DataBind()
        Me.graficoItem2.DataBind()
        Me.gridItemTodasLojas.Visible = True
    End Sub

#Region " gridItensCampanha"

    Protected Sub gridTabela1_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridTabela1.CustomSummaryCalculate
        On Error Resume Next

        'Calculo da Margem Total do Ano Atual
        If e.Item.FieldName = "percMargem" Then
            Dim vlrVendaAT As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("vlrVenda")
            Dim vlrMargemAT As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("vlrLucro")

            Dim vVendaAT As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(vlrVendaAT))
            Dim vMargemAT As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(vlrMargemAT))

            If vVendaAT > 0 Then
                e.TotalValue = vMargemAT / vVendaAT * 100
            End If
        End If

        If e.Item.FieldName = "percMargemSellOut" Then
            Dim vlrVendaAT As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("vlrVenda")
            Dim vlrMargemSellOut As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("vlrLucroSellOut")

            Dim vVendaAT As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(vlrVendaAT))
            Dim vMargemSellOut As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(vlrMargemSellOut))

            If vVendaAT > 0 Then
                e.TotalValue = vMargemSellOut / vVendaAT * 100
            End If
        End If

        If e.Item.FieldName = "difMargemPerc" Then
            Dim percMargemEfetiva As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("percMargem")
            Dim percMargemSellOut As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("percMargemSellOut")

            Dim pMargemEfetiva As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(percMargemEfetiva))
            Dim pMargemSellOut As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(percMargemSellOut))

            If pMargemSellOut > 0 Then
                e.TotalValue = (pMargemSellOut + pMargemEfetiva)
            End If
        End If

        If e.Item.FieldName = "difMargemVlr" Then
            Dim vlrMargemEfetiva As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("vlrLucro")
            Dim vlrMargemSellOut As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("vlrLucroSellOut")

            Dim vMargemEfetiva As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(vlrMargemEfetiva))
            Dim vMargemSellOut As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(vlrMargemSellOut))

            If vMargemSellOut > 0 Then
                e.TotalValue = (vMargemSellOut + vMargemEfetiva)
            End If
        End If


    End Sub

    Protected Sub gridTabela1_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridTabela1.HtmlDataCellPrepared
        If e.DataColumn.FieldName = "percMargem" Or
            e.DataColumn.FieldName = "percMargemSellOut" Or
            e.DataColumn.FieldName = "vlrLucroSellOut" Or
            e.DataColumn.FieldName = "difMargemPerc" Or
            e.DataColumn.FieldName = "difMargemVlr" Or
            e.DataColumn.FieldName = "vlrLucro" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

    End Sub

    Protected Sub gridTabela1_HtmlFooterCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableFooterCellEventArgs) Handles gridTabela1.HtmlFooterCellPrepared
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

#End Region

    Protected Sub cboCampanha_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboCampanha.SelectedIndexChanged
        Call OcultarDados()
    End Sub

    Protected Sub gridItemTodasLojas_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridItemTodasLojas.CustomSummaryCalculate
        On Error Resume Next

        'Calculo da Margem Total do Ano Atual
        If e.Item.FieldName = "percMargem" Then
            Dim vlrVendaAT As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("vlrVenda")
            Dim vlrMargemAT As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("vlrLucro")

            Dim vVendaAT As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(vlrVendaAT))
            Dim vMargemAT As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(vlrMargemAT))

            If vVendaAT > 0 Then
                e.TotalValue = vMargemAT / vVendaAT * 100
            End If
        End If

        If e.Item.FieldName = "percMargemSellOut" Then
            Dim vlrVendaAT As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("vlrVenda")
            Dim vlrMargemSellOut As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("vlrLucroSellOut")

            Dim vVendaAT As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(vlrVendaAT))
            Dim vMargemSellOut As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(vlrMargemSellOut))

            If vVendaAT > 0 Then
                e.TotalValue = vMargemSellOut / vVendaAT * 100
            End If
        End If

        If e.Item.FieldName = "percMargemFinal" Then
            Dim vlrMargemEfetiva As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("vlrLucro")
            Dim vlrMargemSellOut As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("vlrLucroSellOut")
            Dim vlrVenda As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("vlrVenda")

            Dim vMargemEfetiva As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(vlrMargemEfetiva))
            Dim vMargemSellOut As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(vlrMargemSellOut))
            Dim vVenda As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(vlrVenda))

            If vMargemSellOut > 0 Then
                e.TotalValue = (((vMargemSellOut + vMargemEfetiva) / vVenda) * 100)
            End If
        End If

    End Sub

    Protected Sub gridItemTodasLojas_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridItemTodasLojas.HtmlDataCellPrepared
        If e.DataColumn.FieldName = "percMargem" Or
    e.DataColumn.FieldName = "percMargemSellOut" Or
    e.DataColumn.FieldName = "vlrLucroSellOut" Or
    e.DataColumn.FieldName = "difMargemPerc" Or
    e.DataColumn.FieldName = "difMargemVlr" Or
    e.DataColumn.FieldName = "vlrLucro" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If
    End Sub

    Protected Sub gridItemTodasLojas_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gridItemTodasLojas.HtmlFooterCellPrepared
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
