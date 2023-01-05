Imports DevExpress.Web
Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_SLV_AnaliseVenda_PorSecaoSemana
    Inherits System.Web.UI.Page

    Private QtdeAT As Decimal = 0
    Private vlrVendaAT As Decimal = 0
    Private percPartAT As Decimal = 0
    Private vlrMargemAT As Decimal = 0
    Private percMargemAT As Decimal = 0

    Private QtdeAA As Decimal = 0
    Private vlrVendaAA As Decimal = 0
    Private percPartAA As Decimal = 0
    Private vlrMargemAA As Decimal = 0
    Private percMargemAA As Decimal = 0

    Private vlrMeta As Decimal = 0
    Private percMargemMeta As Decimal = 0

    Private percCresc As Decimal = 0
    Private percCrescQtde As Decimal = 0
    Private percCrescLucro As Decimal = 0

    Protected Sub btnAtualizar_BotaoClick(sender As Object, e As EventArgs) Handles btnAtualizar.BotaoClick
        clData_gerManager.uspSecaoDiasSemana("SLV.AtualizarAnaliseVendaSecao_porSecao_porDiaSemana", Me.cboSecao.CallSecao, Me.cboDia.CallDiaInicial, Me.cboDia.CallDiaFinal, User.Identity.Name, Me.cboSemana.CallSemana)

        Session("sUSUARIO") = User.Identity.Name

        Me.grid.Visible = True
        Me.grid.DataBind()

        Me.wucOpcoesSLV.Visible = True

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Análise de Vendas por Seção e por Semana"
    End Sub

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate
        On Error Resume Next
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Start Then
            QtdeAT = 0
            vlrVendaAT = 0
            percPartAT = 0
            vlrMargemAT = 0
            percMargemAT = 0

            QtdeAA = 0
            vlrVendaAA = 0
            percPartAA = 0
            vlrMargemAA = 0
            percMargemAA = 0

            vlrMeta = 0
            percMargemMeta = 0

            percCresc = 0
            percCrescQtde = 0
            percCrescLucro = 0

        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Calculate Then

            Dim myFilter As Int16 = Convert.ToInt16(e.GetValue("idFilial"))
            If myFilter = 255 Then
                QtdeAT += Convert.ToDecimal(e.GetValue("QtdeAT"))
                vlrVendaAT += Convert.ToDecimal(e.GetValue("vlrVendaAT"))
                percPartAT += Convert.ToDecimal(e.GetValue("percPartAT"))
                vlrMargemAT += Convert.ToDecimal(e.GetValue("vlrMargemAT"))
                percMargemAT += Convert.ToDecimal(e.GetValue("percMargemAT"))

                QtdeAA += Convert.ToDecimal(e.GetValue("QtdeAA"))
                vlrVendaAA += Convert.ToDecimal(e.GetValue("vlrVendaAA"))
                percPartAA += Convert.ToDecimal(e.GetValue("percPartAA"))
                vlrMargemAA += Convert.ToDecimal(e.GetValue("vlrMargemAA"))
                percMargemAA += Convert.ToDecimal(e.GetValue("percMargemAA"))

                vlrMeta += Convert.ToDecimal(e.GetValue("vlrMeta"))
                percMargemMeta += Convert.ToDecimal(e.GetValue("percMargemMeta"))

                percCresc += Convert.ToDecimal(e.GetValue("percCresc"))
                percCrescQtde += Convert.ToDecimal(e.GetValue("percCrescQtde"))
                percCrescLucro += Convert.ToDecimal(e.GetValue("percCrescLucro"))
            End If

        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Finalize Then
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "QtdeAT" Then e.TotalValue = QtdeAT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrVendaAT" Then e.TotalValue = vlrVendaAT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percPartAT" Then e.TotalValue = percPartAT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrMargemAT" Then e.TotalValue = vlrMargemAT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargemAT" Then e.TotalValue = percMargemAT

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "QtdeAA" Then e.TotalValue = QtdeAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrVendaAA" Then e.TotalValue = vlrVendaAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percPartAA" Then e.TotalValue = percPartAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrMargemAA" Then e.TotalValue = vlrMargemAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargemAA" Then e.TotalValue = percMargemAA

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrMeta" Then e.TotalValue = vlrMeta
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargemMeta" Then e.TotalValue = percMargemMeta

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCresc" Then e.TotalValue = percCresc
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCrescQtde" Then e.TotalValue = percCrescQtde
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCrescLucro" Then e.TotalValue = percCrescLucro

        End If

        'Diferença de Meta Margem x Real Margem
        If e.Item.FieldName = "difPercMargem" Then
            Dim Meta As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("percMargemMeta")
            Dim Realizado As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary("percMargemAT")

            Dim vMeta As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(Meta))
            Dim vRealizado As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(Realizado))

            If vRealizado > 0 Then
                e.TotalValue = vRealizado - vMeta
            End If
        End If


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

        ' Margem - percentual Ano Atual
        If e.Column.FieldName = "percMargemAT" Then
            Dim vMetaVenda As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrVendaAT"))
            Dim vRealMargem As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrMargemAT"))
            If vMetaVenda <> 0 Then
                e.Value = vRealMargem / vMetaVenda * 100
            Else
                e.Value = 0
            End If
        End If

        ' Margem - percentual Ano Anterior
        If e.Column.FieldName = "percMargemAA" Then
            Dim vMetaVenda As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrVendaAA"))
            Dim vRealMargem As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrMargemAA"))
            If vMetaVenda <> 0 Then
                e.Value = vRealMargem / vMetaVenda * 100
            Else
                e.Value = 0
            End If
        End If

        ' Crescimento - percentual Venda
        If e.Column.FieldName = "percCresc" Then
            Dim VendaAT As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrVendaAT"))
            Dim VendaAA As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrVendaAA"))
            If VendaAT <> 0 Then
                e.Value = (((VendaAT / VendaAA) * 100) - 100)
            Else
                e.Value = 0
            End If
        End If

        ' Crescimento - percentual Quantidade
        If e.Column.FieldName = "percCrescQtde" Then
            Dim vlrAT As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("QtdeAT"))
            Dim vlrAA As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("QtdeAA"))
            If vlrAT <> 0 Then
                e.Value = (((vlrAT / vlrAA) * 100) - 100)
            Else
                e.Value = 0
            End If
        End If

        ' Crescimento - percentual Lucro
        If e.Column.FieldName = "percCrescLucro" Then
            Dim vlrAT As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrMargemAT"))
            Dim vlrAA As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrMargemAA"))
            If vlrAT <> 0 Then
                e.Value = (((vlrAT / vlrAA) * 100) - 100)
            Else
                e.Value = 0
            End If
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
            Case "249", "255", "240"
                e.Row.BackColor = System.Drawing.Color.Lavender
                e.Row.Font.Bold = True
        End Select
        'LightYellow
        'Lavender

        'e.Row.BackColor = System.Drawing.Color.Honeydew     'Verde Claro
        'e.Row.BackColor = System.Drawing.Color.LightGray    'Cinza Claro
    End Sub

    Protected Sub btnExcel_BotaoClick(sender As Object, e As EventArgs) Handles btnExcel.BotaoClick
        Me.btnExcel.CallGridViewID = "grid"
    End Sub

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        Dim oVem As New VendaEmpresaMes
        If Not IsPostBack Then
            oVem.AtualizarEstatisticaPrograma(69, User.Identity.Name)
            Me.cboSecao.CallSecao = 1
            Me.wucOpcoesSLV.Visible = False
        End If
    End Sub

    Protected Sub chkCabecalho_CheckedChanged(sender As Object, e As EventArgs) Handles chkCabecalho.CheckedChanged
        If Me.chkCabecalho.Checked = True Then
            Me.grid.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Visible
        Else
            Me.grid.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Hidden
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

    Protected Sub wucOpcoesSLV_chkMetaChecked(sender As Object, e As EventArgs) Handles wucOpcoesSLV.chkMetaChecked
        If Me.wucOpcoesSLV.chkMeta_Checked = True Then
            Me.grid.Columns.Item("bandMeta").Visible = True
        Else
            Me.grid.Columns.Item("bandMeta").Visible = False
        End If
    End Sub

#End Region

End Class
