Imports DevExpress.Web

Partial Class MemberPages_SLV_AnaliseVendaGrupo_02
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        If Not IsPostBack Then
            oVem.AtualizarEstatisticaPrograma(84, User.Identity.Name)
            Me.cboFilial.AutoPostBack = False
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Análise de Vendas - por Grupo - Todos os Grupos"
        CType(Master.FindControl("lblTitle"), Label).ToolTip = "Analise as informações de Volume (Qtde), Venda, Lucro, Margem e Participação do Ano Atual, Ano Anterior e Mês Anterior. Há ainda informações de meta de venda e margem e ainda há o % de Crescimento da Venda, Volume e Lucro."
    End Sub

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate
        On Error Resume Next
        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)
        'Calcula Margem do Ano Anterior
        If summary.FieldName = "percMargemAA" Then
            Dim vlrMargemAA As Decimal = Convert.ToDecimal(grid.GetTotalSummaryValue(grid.TotalSummary("vlrMargemAA")))
            Dim vlrVendaAA As Decimal = Convert.ToDecimal(grid.GetTotalSummaryValue(grid.TotalSummary("vlrVendaAA")))
            e.TotalValue = ((vlrMargemAA / vlrVendaAA) * 100)
        End If

        'Calcula Margem do Mês Anterior
        If summary.FieldName = "percMargemMA" Then
            Dim vlrMargemMA As Decimal = Convert.ToDecimal(grid.GetTotalSummaryValue(grid.TotalSummary("vlrMargemMA")))
            Dim vlrVendaMA As Decimal = Convert.ToDecimal(grid.GetTotalSummaryValue(grid.TotalSummary("vlrVendaMA")))
            e.TotalValue = ((vlrMargemMA / vlrVendaMA) * 100)
        End If

        'Calcula Margem do Ano Atual
        If summary.FieldName = "percMargemAT" Then
            Dim vlrMargemAT As Decimal = Convert.ToDecimal(grid.GetTotalSummaryValue(grid.TotalSummary("vlrMargemAT")))
            Dim vlrVendaAT As Decimal = Convert.ToDecimal(grid.GetTotalSummaryValue(grid.TotalSummary("vlrVendaAT")))
            e.TotalValue = ((vlrMargemAT / vlrVendaAT) * 100)
        End If

        'Calcula o Crescimento de Vendas
        If summary.FieldName = "percCresc" Then
            Dim vlrVendaAT As Decimal = Convert.ToDecimal(grid.GetTotalSummaryValue(grid.TotalSummary("vlrVendaAT")))
            Dim vlrVendaAA As Decimal = Convert.ToDecimal(grid.GetTotalSummaryValue(grid.TotalSummary("vlrVendaAA")))
            e.TotalValue = (((vlrVendaAT / vlrVendaAA) * 100) - 100)
        End If

        'Calcula o Crescimento de Volume (Qtde)
        If summary.FieldName = "percCrescQtde" Then
            Dim vlrQtdeAT As Decimal = Convert.ToDecimal(grid.GetTotalSummaryValue(grid.TotalSummary("QtdeAT")))
            Dim vlrQtdeAA As Decimal = Convert.ToDecimal(grid.GetTotalSummaryValue(grid.TotalSummary("QtdeAA")))
            e.TotalValue = (((vlrQtdeAT / vlrQtdeAA) * 100) - 100)
        End If

        'Calcula o Crescimento de Lucro
        If summary.FieldName = "percCrescLucro" Then
            Dim vlrMargemAT As Decimal = Convert.ToDecimal(grid.GetTotalSummaryValue(grid.TotalSummary("vlrMargemAT")))
            Dim vlrMargemAA As Decimal = Convert.ToDecimal(grid.GetTotalSummaryValue(grid.TotalSummary("vlrMargemAA")))
            e.TotalValue = (((vlrMargemAT / vlrMargemAA) * 100) - 100)
        End If

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        On Error Resume Next
        If e.DataColumn.FieldName = "percCresc" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percCrescQtde" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percCrescLucro" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percMargemAT" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percMargemAA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percMargemMA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrMargemAT" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrMargemAA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "vlrMargemMA" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If



        If e.DataColumn.FieldName = "descDepto" Then
            If e.CellValue = "08-vasilhame e engradados" Then
                e.Cell.ForeColor = System.Drawing.Color.LightGreen
            End If
        End If

    End Sub

    Protected Sub grid_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles grid.HtmlRowPrepared
        If e.RowType <> GridViewRowType.Data Then
        End If

        Dim NomeColuna As String = e.GetValue("idFilial")

        Select Case NomeColuna
            Case "207", "208", "215", "250"
                e.Row.BackColor = System.Drawing.Color.LightGoldenrodYellow
                e.Row.Font.Bold = True
            Case "240", "255"
                e.Row.BackColor = System.Drawing.Color.Lavender
                e.Row.Font.Bold = True
        End Select
        'LightYellow
        'Lavender

        'e.Row.BackColor = System.Drawing.Color.Honeydew     'Verde Claro
        'e.Row.BackColor = System.Drawing.Color.LightGray    'Cinza Claro
    End Sub

    Private Sub ExibirMesAnterior()
        Me.grid.Columns.Item("QtdeMA").Visible = True
        Me.grid.Columns.Item("vlrVendaMA").Visible = True
        Me.grid.Columns.Item("percMargemMA").Visible = True
        Me.grid.Columns.Item("vlrMargemMA").Visible = True
        Me.grid.Columns.Item("percPartMA").Visible = True
    End Sub

    Private Sub OcultarMesAnterior()
        Me.grid.Columns.Item("QtdeMA").Visible = False
        Me.grid.Columns.Item("vlrVendaMA").Visible = False
        Me.grid.Columns.Item("percMargemMA").Visible = False
        Me.grid.Columns.Item("percPartMA").Visible = False
        Me.grid.Columns.Item("vlrMargemMA").Visible = False
    End Sub

    Protected Sub btnExcel_BotaoClick(sender As Object, e As EventArgs) Handles btnExcel.BotaoClick
        Me.btnExcel.CallGridViewID = "grid"
    End Sub

    Protected Sub grid_SummaryDisplayText(sender As Object, e As ASPxGridViewSummaryDisplayTextEventArgs) Handles grid.SummaryDisplayText
        On Error Resume Next
        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)

        'Calcula o Crescimento de Vendas
        If summary.FieldName = "percCresc" Then
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.grid.Columns.Item("percCresc").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.grid.Columns.Item("percCresc").FooterCellStyle.ForeColor = Drawing.Color.Black
            End If
        End If

        'Calcula o Crescimento de Volume (Qtde)
        If summary.FieldName = "percCrescQtde" Then
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.grid.Columns.Item("percCrescQtde").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.grid.Columns.Item("percCrescQtde").FooterCellStyle.ForeColor = Drawing.Color.Black
            End If
        End If

        'Calcula o Crescimento de Lucro
        If summary.FieldName = "percCrescLucro" Then
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.grid.Columns.Item("percCrescLucro").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.grid.Columns.Item("percCrescLucro").FooterCellStyle.ForeColor = Drawing.Color.Black
            End If
        End If

    End Sub

    Protected Sub cbPanelGrid_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanelGrid.Callback

        clData_gerManager.uspGrupoDias_FilialSecao("SLV_Grupo.uspAtualizar_AnaliseVendaGrupo_02", Me.cboFilial.CallFilial, Me.cboMercadologico.CallSecao, Me.cboDia.CallDiaInicial, Me.cboDia.CallDiaFinal, User.Identity.Name, 2400)
        Session("sUSUARIO") = User.Identity.Name

        Me.grid.Visible = True
        Me.grid.DataBind()

        Me.grafico.Visible = True
    End Sub
End Class
