﻿Imports DevExpress.Web

Partial Class MemberPages_SLV_AnaliseTotalDiario
    Inherits System.Web.UI.Page

    Protected Sub btnAtualizar_BotaoClick(sender As Object, e As EventArgs) Handles btnAtualizar.BotaoClick

        Session("sUSUARIO") = User.Identity.Name
        Me.grid.Visible = True
        Me.grid.DataBind()

    End Sub

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        Dim oVem As New VendaEmpresaMes
        If Not IsPostBack Then
            oVem.AtualizarEstatisticaPrograma(74, User.Identity.Name)

            Me.cboAno.AnoInicial = 2009
            Me.cboAno.AnoFinal = Year(DateAndTime.Now())
            Me.cboAno.CallAno = Year(DateAndTime.Now())
            Me.cboMesInicial.AutoPostBack = False
            Me.cboFilial.AutoPostBack = False
            Me.cboAno.AutoPostBack = False

            Session("sANO") = Me.cboAno.CallAno
            Session("sMES") = Me.cboMesInicial.CallMes
            Session("sFILIAL") = Me.cboFilial.CallFilial

            Dim oProjeto As New Projeto
            Dim Depto As String
            Depto = Trim(oProjeto.BuscarDepartamentoDoUsuario(Page.User.Identity.Name))
            Select Case Depto
                Case "Loja"
                    Me.cboFilial.Visible = True
               
                Case Else
                    Me.cboFilial.Visible = True
            End Select

            Me.cboMesInicial.LabelDescMes = "Mês Inicial: "
            Me.cboMesInicial.CallMes = 1


        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Análise de Vendas - Todas Seções"
    End Sub

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate
        'On Error Resume Next
        'Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)
        'Dim NomeColuna As String = Convert.ToString(e.GetValue("descSecao"))
        'Dim val As Object = grid.GetRowValues(5, (TryCast(grid.Columns(5), GridViewDataColumn)).FieldName)

        'If e.IsTotalSummary Then
        '    If summary.FieldName = "QtdeAA" Then
        '        ' Dim vlrMetaVenda As Decimal = Convert.ToDecimal(grid.GetRowValues(e.Item("QtdeAA")))
        '        ' Dim vlrVenda As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("vlrVenda")))
        '        e.TotalValue = val


        '    End If
        'End If





    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        'On Error Resume Next
        'If e.DataColumn.FieldName = "percCresc" Then
        '    If Convert.ToDouble(e.CellValue) < 0 Then
        '        e.Cell.ForeColor = System.Drawing.Color.Red
        '    End If
        'End If

        'If e.DataColumn.FieldName = "percCrescQtde" Then
        '    If Convert.ToDouble(e.CellValue) < 0 Then
        '        e.Cell.ForeColor = System.Drawing.Color.Red
        '    End If
        'End If

        'If e.DataColumn.FieldName = "percCrescLucro" Then
        '    If Convert.ToDouble(e.CellValue) < 0 Then
        '        e.Cell.ForeColor = System.Drawing.Color.Red
        '    End If
        'End If

        'If e.DataColumn.FieldName = "percMargemAT" Then
        '    If Convert.ToDouble(e.CellValue) < 0 Then
        '        e.Cell.ForeColor = System.Drawing.Color.Red
        '    End If
        'End If

        'If e.DataColumn.FieldName = "percMargemAA" Then
        '    If Convert.ToDouble(e.CellValue) < 0 Then
        '        e.Cell.ForeColor = System.Drawing.Color.Red
        '    End If
        'End If

        'If e.DataColumn.FieldName = "percMargemMA" Then
        '    If Convert.ToDouble(e.CellValue) < 0 Then
        '        e.Cell.ForeColor = System.Drawing.Color.Red
        '    End If
        'End If

        'If e.DataColumn.FieldName = "vlrMargemAT" Then
        '    If Convert.ToDouble(e.CellValue) < 0 Then
        '        e.Cell.ForeColor = System.Drawing.Color.Red
        '    End If
        'End If

        'If e.DataColumn.FieldName = "vlrMargemAA" Then
        '    If Convert.ToDouble(e.CellValue) < 0 Then
        '        e.Cell.ForeColor = System.Drawing.Color.Red
        '    End If
        'End If

        'If e.DataColumn.FieldName = "vlrMargemMA" Then
        '    If Convert.ToDouble(e.CellValue) < 0 Then
        '        e.Cell.ForeColor = System.Drawing.Color.Red
        '    End If
        'End If



        'If e.DataColumn.FieldName = "descDepto" Then
        '    If e.CellValue = "08-vasilhame e engradados" Then
        '        e.Cell.ForeColor = System.Drawing.Color.LightGreen
        '    End If
        'End If

    End Sub

    Protected Sub grid_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles grid.HtmlRowPrepared
        On Error Resume Next
        If e.RowType <> GridViewRowType.Data Then
            Return
        End If

        Dim NomeColuna As String = Convert.ToString(e.GetValue("descSecao"))

        Select Case NomeColuna
            Case "Depto 1", "Depto 2", "Depto 3", "Depto 4", "Depto 5"
                e.Row.BackColor = System.Drawing.Color.LightGray
                e.Row.Font.Bold = True
            Case "Total"
                e.Row.BackColor = System.Drawing.Color.LightGreen
                e.Row.Font.Bold = True
        End Select

    End Sub

    Protected Sub btnExcel_BotaoClick(sender As Object, e As EventArgs) Handles btnExcel.BotaoClick
        Me.btnExcel.CallGridViewID = "grid"
    End Sub

    Protected Sub optSLV_chkAAChecked(sender As Object, e As EventArgs) Handles optSLV.chkAAChecked
        If Me.optSLV.chkAA_Checked = True Then
            Me.grid.Columns.Item("QtdeAA").Visible = True
            Me.grid.Columns.Item("vlrVendaAA").Visible = True
            Me.grid.Columns.Item("percMargemAA").Visible = True
            Me.grid.Columns.Item("vlrMargemAA").Visible = True
        Else
            Me.grid.Columns.Item("QtdeAA").Visible = False
            Me.grid.Columns.Item("vlrVendaAA").Visible = False
            Me.grid.Columns.Item("percMargemAA").Visible = False
            Me.grid.Columns.Item("vlrMargemAA").Visible = False
        End If
    End Sub

    Private Sub ExibirMesAnterior()
        Me.grid.Columns.Item("QtdeMA").Visible = True
        Me.grid.Columns.Item("vlrVendaMA").Visible = True
        Me.grid.Columns.Item("percMargemMA").Visible = True
        Me.grid.Columns.Item("vlrMargemMA").Visible = True
        Me.grid.Columns.Item("percPartMA").Visible = True

    End Sub

    Protected Sub optSLV_chkMetaChecked(sender As Object, e As EventArgs) Handles optSLV.chkMetaChecked
        If Me.optSLV.chkMeta_Checked = True Then   '
            Me.grid.Columns.Item("vlrMeta").Visible = True
            Me.grid.Columns.Item("percMargemMeta").Visible = True
        Else
            Me.grid.Columns.Item("vlrMeta").Visible = False
            Me.grid.Columns.Item("percMargemMeta").Visible = False
        End If
    End Sub

    Protected Sub chkCabecalho_CheckedChanged(sender As Object, e As EventArgs) Handles chkCabecalho.CheckedChanged
        If Me.chkCabecalho.Checked = True Then
            Me.grid.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Visible
            Me.grid.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Hidden
        End If
    End Sub

    Protected Sub cboAno_ListAnoChanged(sender As Object, e As EventArgs) Handles cboAno.ListAnoChanged
        Session("sANO") = Me.cboAno.CallAno
    End Sub

    Protected Sub cboFilial_ListCorporacaoChanged(sender As Object, e As EventArgs) Handles cboFilial.ListCorporacaoChanged
        Session("sFILIAL") = Me.cboFilial.CallFilial
    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        Session("sFILIAL") = Me.cboFilial.CallFilial
    End Sub

    Protected Sub cboMesInicial_ListMesChanged(sender As Object, e As EventArgs) Handles cboMesInicial.ListMesChanged
        Session("sMES") = Me.cboMesInicial.CallMes
    End Sub
End Class
