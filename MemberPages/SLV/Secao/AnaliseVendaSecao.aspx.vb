Imports DevExpress.Web
Imports System.Data
Imports System.Data.SqlClient


Partial Class MemberPages_SLV_AnaliseVendaSecao
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes

    Protected Sub btnAtualizar_BotaoClick(sender As Object, e As EventArgs) Handles btnAtualizar.BotaoClick

        Dim vMesInicial As Byte
        vMesInicial = Me.cboDia.CallDiaInicial.Month

        clData_gerManager.uspSecaoDias("SLV.AtualizarAnaliseVendaSecao_porSecao", Me.cboSecao.Text, Me.cboDia.CallDiaInicial, Me.cboDia.CallDiaFinal, User.Identity.Name)
        Session("sUSUARIO") = User.Identity.Name

        Me.grid.Visible = True
        Me.wucOpcoesSLV.Visible = True
        Me.grid.DataBind()

        Call OcultarMesAnterior()
        Me.grafico.Visible = True

    End Sub

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init

        If Not IsPostBack Then
            oVem.AtualizarEstatisticaPrograma(68, User.Identity.Name)
            Me.cboSecao.Text = 11
            Me.wucOpcoesSLV.Visible = False

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Análise de Vendas - por Seção"

    End Sub

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate
        On Error Resume Next

        'Return the vendas record 
        Dim dt As DataTable = clData_gerManager.TableGet("SLV.AnaliseAnoAnterior", "Usuario='" & User.Identity.Name & "' AND idFilial=255", "")
        Dim dr As DataRow = dt.Rows(0)

        'Ano Anterior
        If e.Item.FieldName = "QtdeAA" Then e.TotalValue = dr("QtdeAA")
        If e.Item.FieldName = "vlrVendaAA" Then e.TotalValue = dr("vlrVendaAA")
        If e.Item.FieldName = "percPartAA" Then e.TotalValue = dr("percPartAA")
        If e.Item.FieldName = "vlrMargemAA" Then e.TotalValue = dr("vlrMargemAA")
        If e.Item.FieldName = "percMargemAA" Then e.TotalValue = dr("percMargemAA")

        If e.Item.FieldName = "QtdeMA" Then e.TotalValue = dr("QtdeMA")
        If e.Item.FieldName = "vlrVendaMA" Then e.TotalValue = dr("vlrVendaMA")
        If e.Item.FieldName = "percPartMA" Then e.TotalValue = dr("percPartMA")
        If e.Item.FieldName = "vlrMargemMA" Then e.TotalValue = dr("vlrMargemMA")
        If e.Item.FieldName = "percMargemMA" Then e.TotalValue = dr("percMargemMA")

        'Ano Atual
        If e.Item.FieldName = "QtdeAT" Then e.TotalValue = dr("QtdeAT")
        If e.Item.FieldName = "vlrVendaAT" Then e.TotalValue = dr("vlrVendaAT")
        If e.Item.FieldName = "percPartAT" Then e.TotalValue = dr("percPartAT")
        If e.Item.FieldName = "vlrMargemAT" Then e.TotalValue = dr("vlrMargemAT")
        If e.Item.FieldName = "percMargemAT" Then e.TotalValue = dr("percMargemAT")

        'Crescimento
        If e.Item.FieldName = "percCresc" Then e.TotalValue = dr("percCresc")
        If e.Item.FieldName = "percCrescQtde" Then e.TotalValue = dr("percCrescQtde")
        If e.Item.FieldName = "percCrescLucro" Then e.TotalValue = dr("percCrescLucro")

        'Meta
        If e.Item.FieldName = "vlrMeta" Then e.TotalValue = dr("vlrMeta")
        If e.Item.FieldName = "vlrMargemMeta" Then e.TotalValue = dr("vlrMargemMeta")
        If e.Item.FieldName = "percMargemMeta" Then e.TotalValue = dr("percMargemMeta")
        If e.Item.FieldName = "difPercMargem" Then e.TotalValue = (dr("percMargemAT") - dr("percMargemMeta"))

        If e.Item.FieldName = "percAtingMetaVlr" Then
            Dim Meta As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("vlrMeta")
            Dim Realizado As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("vlrVendaAT")

            Dim vMeta As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(Meta))
            Dim vRealizado As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(Realizado))

            If vRealizado > 0 Then
                e.TotalValue = (((vRealizado / vMeta) * 100) - 100)
            End If
        End If
    End Sub

    Protected Sub grid_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles grid.CustomUnboundColumnData
        On Error Resume Next
        If e.Column.FieldName = "percAtingMetaVlr" Then
            Dim vMetaVenda As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrMeta"))
            Dim vRealVenda As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrVendaAT"))
            If vRealVenda <> 0 Then
                e.Value = ((vRealVenda / vMetaVenda) * 100) - 100
            Else
                e.Value = 0
            End If
        End If

        If e.Column.FieldName = "difPercMargem" Then
            Dim vMetaPercMargem As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("percMargemMeta"))
            Dim vRealPercMargem As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("percMargemAT"))
            If vRealPercMargem <> 0 Then
                e.Value = vRealPercMargem - vMetaPercMargem
            Else
                e.Value = 0
            End If
        End If
    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        On Error Resume Next
        If e.DataColumn.FieldName = "percCresc" Or
            e.DataColumn.FieldName = "percAtingMetaVlr" Or
            e.DataColumn.FieldName = "percAtingAg23" Or
            e.DataColumn.FieldName = "percCrescAg23" Or
            e.DataColumn.FieldName = "difPercMargem" Then
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
        Me.grid.Columns.Item("bandMesAnterior").Visible = True
    End Sub

    Private Sub OcultarMesAnterior()
        Me.grid.Columns.Item("bandMesAnterior").Visible = False
    End Sub

    Protected Sub btnExcel_BotaoClick(sender As Object, e As EventArgs) Handles btnExcel.BotaoClick
        Me.btnExcel.CallGridViewID = "grid"
    End Sub

    Protected Sub chkCabecalho_CheckedChanged(sender As Object, e As EventArgs) Handles chkCabecalho.CheckedChanged
        If Me.chkCabecalho.Checked = True Then
            Me.grid.Settings.ShowVerticalScrollBar = True
        Else
            Me.grid.Settings.ShowVerticalScrollBar = False
        End If
    End Sub

    Protected Sub grid_SummaryDisplayText(sender As Object, e As ASPxGridViewSummaryDisplayTextEventArgs) Handles grid.SummaryDisplayText
        On Error Resume Next
        If e.Item.FieldName = "percAtingMetaVlr" Then
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.grid.Columns.Item("percAtingMetaVlr").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.grid.Columns.Item("percAtingMetaVlr").FooterCellStyle.ForeColor = Drawing.Color.Black
            End If
        End If

        If e.Item.FieldName = "difPercMargem" Then
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.grid.Columns.Item("difPercMargem").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.grid.Columns.Item("difPercMargem").FooterCellStyle.ForeColor = Drawing.Color.Black
            End If
        End If

        If e.Item.FieldName = "percCrescLucro" Then
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.grid.Columns.Item("percCrescLucro").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.grid.Columns.Item("percCrescLucro").FooterCellStyle.ForeColor = Drawing.Color.Black
            End If
        End If

        If e.Item.FieldName = "percCrescQtde" Then
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.grid.Columns.Item("percCrescQtde").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.grid.Columns.Item("percCrescQtde").FooterCellStyle.ForeColor = Drawing.Color.Black
            End If
        End If

        If e.Item.FieldName = "percCresc" Then
            If Convert.ToDecimal(e.Value) < 0 Then
                Me.grid.Columns.Item("percCresc").FooterCellStyle.ForeColor = Drawing.Color.Red
            Else
                Me.grid.Columns.Item("percCresc").FooterCellStyle.ForeColor = Drawing.Color.Black
            End If
        End If
    End Sub

#Region " CheckBox Checked"

    Protected Sub wucOpcoesSLV_chkAAChecked(sender As Object, e As EventArgs) Handles wucOpcoesSLV.chkAAChecked
        If Me.wucOpcoesSLV.chkAA_Checked = True Then
            Me.grid.Columns.Item("bandAnoAnterior").Visible = True
        Else
            Me.grid.Columns.Item("bandAnoAnterior").Visible = False
        End If
    End Sub

    Protected Sub wucOpcoesSLV_chkAnoAtualChecked(sender As Object, e As EventArgs) Handles wucOpcoesSLV.chkAnoAtualChecked
        If Me.wucOpcoesSLV.chkAnoAtual_Checked = True Then
            Me.grid.Columns.Item("bandAnoAtual").Visible = True
        Else
            Me.grid.Columns.Item("bandAnoAtual").Visible = False
        End If
    End Sub

    Protected Sub wucOpcoesSLV_chkMAChecked(sender As Object, e As EventArgs) Handles wucOpcoesSLV.chkMAChecked
        If Me.wucOpcoesSLV.chkMA_Checked = True Then
            Me.grid.Columns.Item("bandMesAnterior").Visible = True
        Else
            Me.grid.Columns.Item("bandMesAnterior").Visible = False
        End If
    End Sub

    Protected Sub wucOpcoesSLV_chkMetaChecked(sender As Object, e As EventArgs) Handles wucOpcoesSLV.chkMetaChecked
        If Me.wucOpcoesSLV.chkMeta_Checked = True Then
            Me.grid.Columns.Item("bandMeta").Visible = True
        Else
            Me.grid.Columns.Item("bandMeta").Visible = False
        End If
    End Sub

#End Region

End Class
