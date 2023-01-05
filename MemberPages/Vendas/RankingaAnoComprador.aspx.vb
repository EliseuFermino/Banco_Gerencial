Imports DevExpress.Web

Partial Class MemberPages_RankingAnoComprador
    Inherits System.Web.UI.Page

#Region " Variaveis"

    Private vlrMeta As Decimal = 0
    Private vlrRea As Decimal = 0
    Private percPart_vlrRea As Decimal = 0
    Private vlrMA As Decimal = 0
    Private vlrAA1 As Decimal = 0
    Private vlrAA2 As Decimal = 0
    Private vlrAA3 As Decimal = 0
    Private percCresc_RealMeta As Decimal = 0
    Private percMA As Decimal = 0
    Private percCresc_RealAA1 As Decimal = 0
    Private percCresc_RealAA3 As Decimal = 0
    Private percCresc_RealAA2 As Decimal = 0
    Private vlrMetaAnual As Decimal = 0
    Private percCresc_MetaAnual As Decimal = 0
    Private percMargMeta As Decimal = 0
    Private percMargReal As Decimal = 0
    Private percMargemDif As Decimal = 0

#End Region

    Sub BuscaTitulo()
        Me.ASPxGridView1.SettingsText.Title = "Ranking de Vendas Acumulado - Período de 01/01/" & Me.cboAno.CallAno & " à " & DateAndTime.Today.AddDays(-1) & "."
        Call AlterarTituloGridPrincipal()
    End Sub

    Private Sub AlterarTituloGridPrincipal()
        Session("sANO") = Me.cboAno.CallAno
        'Mudar Legendas
        Me.ASPxGridView1.Columns.Item("bandAtual").Caption = Me.cboAno.CallAno

        Me.ASPxGridView1.Columns.Item("bandAA1").Caption = Me.cboAno.CallAno - 1
        Me.ASPxGridView1.Columns.Item("bandAA2").Caption = Me.cboAno.CallAno - 2
        Me.ASPxGridView1.Columns.Item("bandAA3").Caption = Me.cboAno.CallAno - 3

        Me.ASPxGridView1.Columns.Item("bandCrescAA1").Caption = Me.cboAno.CallAno - 1
        Me.ASPxGridView1.Columns.Item("bandCrescAA2").Caption = Me.cboAno.CallAno - 2
        Me.ASPxGridView1.Columns.Item("bandCrescAA3").Caption = Me.cboAno.CallAno - 3

        Me.chkAnoAnterior.Text = "Exibir " & Me.cboAno.CallAno - 3
    End Sub

    Public Function GetLastDayOfMonth(ByVal intMonth As Byte, ByVal intYear As Int16) As Date
        GetLastDayOfMonth = DateSerial(intYear, intMonth + 1, 0)
    End Function

#Region " Page"

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes

            oVem.AtualizarEstatisticaPrograma(111, User.Identity.Name)
            Me.chkFixarCabecalho.Checked = True

            Me.cboAno.AutoPostBack = False
            Me.cboAno.AnoInicial = 2013
            Me.cboAno.AnoFinal = Year(Now())
            Me.cboAno.CallAno = Year(Now())


        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Ranking de Vendas Anual por Comprador - PGR111"
        End If

    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            Session("sANO") = Me.cboAno.CallAno
            Me.ASPxGridView1.DataBind()
            Call BuscaTitulo()
            Call AlterarTituloGridPrincipal()
            Me.cboSize.Text = 100
        End If
    End Sub

#End Region

#Region " Grid por Comprador"

    Protected Sub ASPxGridView1_AfterPerformCallback(sender As Object, e As ASPxGridViewAfterPerformCallbackEventArgs) Handles ASPxGridView1.AfterPerformCallback
        Call AlterarTituloGridPrincipal()
    End Sub

    Protected Sub ASPxGridView1_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles ASPxGridView1.CustomSummaryCalculate

        'On Error Resume Next
        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)
        'Return the vendas record 

        If e.IsTotalSummary Then
            If summary.FieldName = "percCresc_RealMeta" Then
                Dim vlrMetaVenda As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("vlrMeta")))
                Dim vlrVenda As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("vlrRea")))
                If vlrMetaVenda = 0 Then
                    e.TotalValue = 0
                ElseIf vlrVenda = 0 Then
                    e.TotalValue = 0
                Else
                    e.TotalValue = (((vlrVenda / vlrMetaVenda) * 100) - 100)
                End If

            End If

            If summary.FieldName = "percCresc_RealAA1" Then
                Dim vlrVendaAA1 As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("vlrAA1")))
                Dim vlrVenda As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("vlrRea")))

                If vlrVendaAA1 = 0 Then
                    e.TotalValue = 0
                ElseIf vlrVenda = 0 Then
                    e.TotalValue = 0
                Else
                    e.TotalValue = (((vlrVenda / vlrVendaAA1) * 100) - 100)
                End If
            End If

            If summary.FieldName = "percCresc_RealAA2" Then
                Dim vlrVendaAA2 As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("vlrAA2")))
                Dim vlrVenda As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("vlrRea")))

                If vlrVendaAA2 = 0 Then
                    e.TotalValue = 0
                ElseIf vlrVenda = 0 Then
                    e.TotalValue = 0
                Else
                    e.TotalValue = (((vlrVenda / vlrVendaAA2) * 100) - 100)
                End If
            End If

            If summary.FieldName = "percCresc_RealAA3" Then
                Dim vlrVendaAA3 As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("vlrAA3")))
                Dim vlrVenda As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("vlrRea")))

                If vlrVendaAA3 = 0 Then
                    e.TotalValue = 0
                ElseIf vlrVenda = 0 Then
                    e.TotalValue = 0
                Else
                    e.TotalValue = (((vlrVenda / vlrVendaAA3) * 100) - 100)
                End If
            End If

            If summary.FieldName = "percMargMeta" Then
                Dim vlrMetaLucro As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("vlrMargMeta")))
                Dim vlrMetaVenda As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("vlrMeta")))

                If vlrMetaLucro = 0 Then
                    e.TotalValue = 0
                ElseIf vlrMetaVenda = 0 Then
                    e.TotalValue = 0
                Else
                    e.TotalValue = ((vlrMetaLucro / vlrMetaVenda) * 100)
                End If
            End If

            If summary.FieldName = "percMargReal" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("vlrRea")))
                Dim vlrRealLucro As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("vlrMargReal")))

                If vlrRealLucro = 0 Then
                    e.TotalValue = 0
                ElseIf vlrVenda = 0 Then
                    e.TotalValue = 0
                Else
                    e.TotalValue = ((vlrRealLucro / vlrVenda) * 100)
                End If
            End If

            If summary.FieldName = "percMargemDif" Then
                Dim percMargMeta As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("percMargMeta")))
                Dim percMargReal As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("percMargReal")))
                e.TotalValue = percMargReal - percMargMeta
            End If

            If summary.FieldName = "percMargemSellOut" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("vlrRea")))
                Dim vlrRealLucroSellOut As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("LucroSellOut")))

                If vlrRealLucroSellOut = 0 Then
                    e.TotalValue = 0
                ElseIf vlrVenda = 0 Then
                    e.TotalValue = 0
                Else
                    e.TotalValue = ((vlrRealLucroSellOut / vlrVenda) * 100)
                End If
            End If

            If summary.FieldName = "percMargemFinal" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("vlrRea")))
                Dim vlrRealLucro As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("vlrMargReal")))
                Dim vlrRealLucroSellOut As Decimal = Convert.ToDecimal(ASPxGridView1.GetTotalSummaryValue(ASPxGridView1.TotalSummary("LucroSellOut")))

                If vlrRealLucroSellOut = 0 Then
                    e.TotalValue = 0
                ElseIf vlrVenda = 0 Then
                    e.TotalValue = 0
                Else
                    e.TotalValue = (((vlrRealLucro + vlrRealLucroSellOut) / vlrVenda) * 100)
                End If
            End If

        End If

    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared
        On Error Resume Next
        If e.DataColumn.FieldName = "percMargemDif" Or
            e.DataColumn.FieldName = "percMA" Or
            e.DataColumn.FieldName = "difMargemSellOut" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percCresc_RealMeta" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percCresc_RealAA1" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percCresc_RealAA2" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percCresc_RealAA3" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percCresc_MetaAnual" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

    End Sub

    Protected Sub ASPxGridView1_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles ASPxGridView1.HtmlFooterCellPrepared
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

    Protected Sub ASPxGridView1_HtmlRowPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles ASPxGridView1.HtmlRowPrepared
        If e.RowType <> GridViewRowType.Data Then
        End If

        Dim NomeColuna As String = e.GetValue("idComprador")

        Select Case NomeColuna
            Case "207", "208", "215", "250"
                e.Row.BackColor = System.Drawing.Color.LightGray
                e.Row.Font.Bold = True
            Case "240", "255"
                e.Row.BackColor = System.Drawing.Color.Lavender
                e.Row.Font.Bold = True
        End Select
        'LightYellow
        'Lavender
    End Sub

#End Region

    Protected Sub btnExportar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExportar.Click
        Me.ExporterExcel1.WriteXlsToResponse()
    End Sub

#Region " Grid por Seção"

    Protected Sub ASPxGridView2_BeforePerformDataSelect(sender As Object, e As EventArgs)
        Session("sCOMPRADOR") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

    Protected Sub ASPxGridView2_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs)
        On Error Resume Next
        If e.DataColumn.FieldName = "percMargemDif" Or
            e.DataColumn.FieldName = "percMA" Or
            e.DataColumn.FieldName = "difMargemSellOut" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percCresc_RealMeta" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percCresc_RealAA1" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percCresc_RealAA2" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percCresc_RealAA3" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percCresc_MetaAnual" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

    End Sub

    Protected Sub ASPxGridView2_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs)

        On Error Resume Next
        Dim gridView As ASPxGridView = TryCast(sender, ASPxGridView)
        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)
        'Return the vendas record 

        If e.IsTotalSummary Then
            If summary.FieldName = "percCresc_RealMeta" Then
                Dim vlrMetaVenda As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrMeta")))
                Dim vlrVenda As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrRea")))
                e.TotalValue = (((vlrVenda / vlrMetaVenda) * 100) - 100)
            End If

            If summary.FieldName = "percMA" Then
                Dim vlrVendaMA As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrMA")))
                Dim vlrVenda As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrRea")))
                e.TotalValue = (((vlrVenda / vlrVendaMA) * 100) - 100)
            End If

            If summary.FieldName = "percCresc_RealAA1" Then
                Dim vlrVendaAA1 As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrAA1")))
                Dim vlrVenda As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrRea")))
                e.TotalValue = (((vlrVenda / vlrVendaAA1) * 100) - 100)
            End If

            If summary.FieldName = "percCresc_RealAA2" Then
                Dim vlrVendaAA2 As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrAA2")))
                Dim vlrVenda As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrRea")))
                e.TotalValue = (((vlrVenda / vlrVendaAA2) * 100) - 100)
            End If

            If summary.FieldName = "percCresc_RealAA3" Then
                Dim vlrVendaAA3 As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrAA3")))
                Dim vlrVenda As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrRea")))
                e.TotalValue = (((vlrVenda / vlrVendaAA3) * 100) - 100)
            End If

            If summary.FieldName = "percMargMeta" Then
                Dim vlrMetaLucro As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrMargMeta")))
                Dim vlrMetaVenda As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrMeta")))
                e.TotalValue = ((vlrMetaLucro / vlrMetaVenda) * 100)
            End If

            If summary.FieldName = "percMargReal" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrRea")))
                Dim vlrRealLucro As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrMargReal")))
                e.TotalValue = ((vlrRealLucro / vlrVenda) * 100)
            End If

            If summary.FieldName = "percMargemDif" Then
                Dim percMargMeta As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("percMargMeta")))
                Dim percMargReal As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("percMargReal")))
                e.TotalValue = percMargReal - percMargMeta
            End If

            If summary.FieldName = "percMargemSellOut" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrRea")))
                Dim vlrRealLucroSellOut As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("LucroSellOut")))

                If IsNothing(e.TotalValue) Then
                    e.TotalValue = 0
                Else
                    e.TotalValue = ((vlrRealLucroSellOut / vlrVenda) * 100)
                End If
            End If

            If summary.FieldName = "percMargemFinal" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrRea")))
                Dim vlrRealLucro As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrMargReal")))
                Dim vlrRealLucroSellOut As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("LucroSellOut")))

                If IsNothing(e.TotalValue) Then
                    e.TotalValue = 0
                Else
                    e.TotalValue = (((vlrRealLucro + vlrRealLucroSellOut) / vlrVenda) * 100)
                End If
            End If

        End If
    End Sub

    Protected Sub ASPxGridView2_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs)
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

    Protected Sub ASPxGridView2_Load(sender As Object, e As EventArgs)

        Dim gridView As ASPxGridView = TryCast(sender, ASPxGridView)

        'Detail View
        gridView.Columns.Item("bandAtual").Caption = Me.cboAno.CallAno

        gridView.Columns.Item("bandAA1").Caption = Me.cboAno.CallAno - 1
        gridView.Columns.Item("bandAA2").Caption = Me.cboAno.CallAno - 2
        gridView.Columns.Item("bandAA3").Caption = Me.cboAno.CallAno - 3

        gridView.Columns.Item("bandCrescAA1").Caption = Me.cboAno.CallAno - 1
        gridView.Columns.Item("bandCrescAA2").Caption = Me.cboAno.CallAno - 2
        gridView.Columns.Item("bandCrescAA3").Caption = Me.cboAno.CallAno - 3

        'Mosta / Oculta - Meta do Ano
        If Me.chkMetaMes.Checked = True Then
            gridView.Columns.Item("bandMetaMes").Visible = True
        Else
            gridView.Columns.Item("bandMetaMes").Visible = False
        End If

        'Mostra / Oculta - Lucro do Ano
        If Me.chkLucro.Checked = True Then
            gridView.Columns.Item("bandLucro").Visible = True
        Else
            gridView.Columns.Item("bandLucro").Visible = False
        End If

        'Mostra / Oculta - Venda Ano AA2
        If Me.chkAnoAnterior.Checked = True Then
            gridView.Columns.Item("percCresc_RealAA3").Visible = True
            gridView.Columns.Item("vlrAA3").Visible = True
            gridView.Columns.Item("percCresc_RealAA2").Visible = True
            gridView.Columns.Item("vlrAA2").Visible = True
        Else
            gridView.Columns.Item("percCresc_RealAA3").Visible = False
            gridView.Columns.Item("vlrAA3").Visible = False
            gridView.Columns.Item("percCresc_RealAA2").Visible = False
            gridView.Columns.Item("vlrAA2").Visible = False
        End If

    End Sub

#End Region

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback
        Session("sANO") = Me.cboAno.CallAno
        Me.ASPxGridView1.DataBind()
        Call BuscaTitulo()

        'Ano Anterior
        If Me.chkAnoAnterior.Checked = True Then
            Me.ASPxGridView1.Columns.Item("percCresc_RealAA3").Visible = True
            Me.ASPxGridView1.Columns.Item("vlrAA3").Visible = True
            Me.ASPxGridView1.Columns.Item("percCresc_RealAA2").Visible = True
            Me.ASPxGridView1.Columns.Item("vlrAA2").Visible = True
        Else
            Me.ASPxGridView1.Columns.Item("percCresc_RealAA3").Visible = False
            Me.ASPxGridView1.Columns.Item("vlrAA3").Visible = False
            Me.ASPxGridView1.Columns.Item("percCresc_RealAA2").Visible = False
            Me.ASPxGridView1.Columns.Item("vlrAA2").Visible = False
        End If

        ' Meta Mensal
        If Me.chkMetaMes.Checked = True Then
            Me.ASPxGridView1.Columns.Item("bandMetaMes").Visible = True
        Else
            Me.ASPxGridView1.Columns.Item("bandMetaMes").Visible = False
        End If

        'Lucro
        If Me.chkLucro.Checked = True Then
            Me.ASPxGridView1.Columns.Item("bandLucro").Visible = True
        Else
            Me.ASPxGridView1.Columns.Item("bandLucro").Visible = False
        End If

        'Cabeçalho
        If Me.chkFixarCabecalho.Checked = True Then
            Me.ASPxGridView1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Visible
        Else
            Me.ASPxGridView1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Hidden
        End If

    End Sub

    Protected Sub cboSize_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged
        Dim gridWith As Int16
        Dim gridHeight As Int16

        If Me.cboSize.SelectedValue = 100 Then
            gridWith = 1000
            gridHeight = 400
        Else

            If Me.cboSize.SelectedValue = 200 Then
                gridHeight = 400 * 195 / 100
                gridWith = 1000 * 205 / 100
            ElseIf Me.cboSize.SelectedValue = 150 Then
                gridHeight = 400 * 145 / 100
                gridWith = 1000 * 157 / 100
            ElseIf Me.cboSize.SelectedValue = 170 Then
                gridHeight = 400 * 175 / 100
                gridWith = 1000 * 175 / 100
            Else
                gridHeight = 400 * Me.cboSize.SelectedValue / 100
                gridWith = 1000 * Me.cboSize.SelectedValue / 100
            End If

        End If

        Me.ASPxGridView1.Width = gridWith
        Me.ASPxGridView1.Settings.VerticalScrollableHeight = gridHeight

  


    End Sub
End Class
