Imports DevExpress.Web
Imports System.Data

Partial Class MemberPages_SLV_AnaliseVendaAA
    Inherits System.Web.UI.Page

    Protected Sub gridDepto_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridDepto.CustomSummaryCalculate
        On Error Resume Next
        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)

        If e.IsTotalSummary Then
            If summary.FieldName = "percMargemAT" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(gridDepto.GetTotalSummaryValue(gridDepto.TotalSummary("vlrVenda")))
                Dim vlrRealLucro As Decimal = Convert.ToDecimal(gridDepto.GetTotalSummaryValue(gridDepto.TotalSummary("vlrLucroComercial")))
                e.TotalValue = ((vlrRealLucro / vlrVenda) * 100)
            End If

            If summary.FieldName = "percMargemAA" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(gridDepto.GetTotalSummaryValue(gridDepto.TotalSummary("vlrVendaAA")))
                Dim vlrRealLucro As Decimal = Convert.ToDecimal(gridDepto.GetTotalSummaryValue(gridDepto.TotalSummary("vlrLucroComercialAA")))
                e.TotalValue = ((vlrRealLucro / vlrVenda) * 100)
            End If

            ' ********************************** CRESCIMENTO *********************************************************************
            If summary.FieldName = "percCresc_Vol" Then
                Dim vCrescAT As Decimal = Convert.ToDecimal(gridDepto.GetTotalSummaryValue(gridDepto.TotalSummary("Qtde")))
                Dim vCrescAA As Decimal = Convert.ToDecimal(gridDepto.GetTotalSummaryValue(gridDepto.TotalSummary("QtdeAA")))
                e.TotalValue = (((vCrescAT / vCrescAA) * 100) - 100)
            End If

            If summary.FieldName = "percCresc_Reais" Then
                Dim vCrescAT As Decimal = Convert.ToDecimal(gridDepto.GetTotalSummaryValue(gridDepto.TotalSummary("vlrVenda")))
                Dim vCrescAA As Decimal = Convert.ToDecimal(gridDepto.GetTotalSummaryValue(gridDepto.TotalSummary("vlrVendaAA")))
                e.TotalValue = (((vCrescAT / vCrescAA) * 100) - 100)
            End If

            If summary.FieldName = "percCresc_Lucro" Then
                Dim vCrescAT As Decimal = Convert.ToDecimal(gridDepto.GetTotalSummaryValue(gridDepto.TotalSummary("vlrLucroComercial")))
                Dim vCrescAA As Decimal = Convert.ToDecimal(gridDepto.GetTotalSummaryValue(gridDepto.TotalSummary("vlrLucroComercialAA")))
                e.TotalValue = (((vCrescAT / vCrescAA) * 100) - 100)
            End If


        End If
    End Sub

    Protected Sub gridDepto_CustomUnboundColumnData(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDataEventArgs) Handles gridDepto.CustomUnboundColumnData
        On Error Resume Next

        'Calculo do Percentual da Margem Real - Ano Atual
        If e.Column.FieldName = "percMargemAT" Then
            Dim vVenda As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrVenda"))
            Dim vRealLucro As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrLucroComercial"))
            If vVenda <> 0 Then
                e.Value = ((vRealLucro / vVenda) * 100)
            Else
                e.Value = 0
            End If
        End If

        'Calculo do Percentual da Margem Real - Ano Anterior
        If e.Column.FieldName = "percMargemAA" Then
            Dim vVendaAA As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrVendaAA"))
            Dim vRealLucroAA As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrLucroComercialAA"))
            If vVendaAA <> 0 Then
                e.Value = ((vRealLucroAA / vVendaAA) * 100)
            Else
                e.Value = 0
            End If
        End If

        ' ********************************** CRESCIMENTO *********************************************************************

        'Calculo do Percentual de Crescimento - Volume
        If e.Column.FieldName = "percCresc_Vol" Then
            Dim vCrescAT As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("Qtde"))
            Dim vCrescAA As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("QtdeAA"))
            If vCrescAT <> 0 Then
                e.Value = (((vCrescAT / vCrescAA) * 100) - 100)
            Else
                e.Value = 0
            End If
        End If

        'Calculo do Percentual de Crescimento - Reais
        If e.Column.FieldName = "percCresc_Reais" Then
            Dim vCrescAT As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrVenda"))
            Dim vCrescAA As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrVendaAA"))
            If vCrescAT <> 0 Then
                e.Value = (((vCrescAT / vCrescAA) * 100) - 100)
            Else
                e.Value = 0
            End If
        End If

        'Calculo do Percentual de Crescimento - Lucro
        If e.Column.FieldName = "percCresc_Lucro" Then
            Dim vCrescAT As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrLucroComercial"))
            Dim vCrescAA As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrLucroComercialAA"))
            If vCrescAT <> 0 Then
                e.Value = (((vCrescAT / vCrescAA) * 100) - 100)
            Else
                e.Value = 0
            End If
        End If

    End Sub

    Protected Sub gridDepto_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridDepto.HtmlDataCellPrepared
        On Error Resume Next
        If e.DataColumn.FieldName = "percCresc_Vol" Or
           e.DataColumn.FieldName = "percCresc_Reais" Or
           e.DataColumn.FieldName = "percCresc_Lucro" Then
            If Convert.ToDouble(e.CellValue) < 0 Then e.Cell.ForeColor = System.Drawing.Color.Red
        End If
    End Sub

    Protected Sub gridDepto_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gridDepto.HtmlFooterCellPrepared
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

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("sFILIAL") = Me.cboFilial.CallFilial
            Session("sANO") = Year(Me.cboDia.CallDiaInicial)
            Session("sUSUARIO") = User.Identity.Name
        End If
    End Sub

    Private Sub Atualizar()

        Session("sFILIAL") = Me.cboFilial.CallFilial
        Session("sANO") = Year(Me.cboDia.CallDiaInicial)
        Session("sUSUARIO") = User.Identity.Name
        Me.gridDepto.DataBind()

    End Sub

    Protected Sub btnAtualizar_BotaoClick(sender As Object, e As EventArgs) Handles btnAtualizar.BotaoClick
        clData_DW_Condor.uspFilialDias("Temp.uspAtualizarVendas", Me.cboFilial.CallFilial, Me.cboDia.CallDiaInicial, Me.cboDia.CallDiaFinal, User.Identity.Name)

        Call Atualizar()
    End Sub

    Protected Sub gridSecao_BeforePerformDataSelect(sender As Object, e As EventArgs)
        Session("sDEPTO") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

    Protected Sub gridSecao_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs)
        On Error Resume Next
        Dim gridView As ASPxGridView = TryCast(sender, ASPxGridView)
        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)

        If e.IsTotalSummary Then
            If summary.FieldName = "percMargemAT" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrVenda")))
                Dim vlrRealLucro As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrLucroComercial")))
                e.TotalValue = ((vlrRealLucro / vlrVenda) * 100)
            End If

            If summary.FieldName = "percMargemAA" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrVendaAA")))
                Dim vlrRealLucro As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrLucroComercialAA")))
                e.TotalValue = ((vlrRealLucro / vlrVenda) * 100)
            End If

            ' ********************************** CRESCIMENTO *********************************************************************
            If summary.FieldName = "percCresc_Vol" Then
                Dim vCrescAT As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("Qtde")))
                Dim vCrescAA As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("QtdeAA")))
                e.TotalValue = (((vCrescAT / vCrescAA) * 100) - 100)
            End If

            If summary.FieldName = "percCresc_Reais" Then
                Dim vCrescAT As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrVenda")))
                Dim vCrescAA As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrVendaAA")))
                e.TotalValue = (((vCrescAT / vCrescAA) * 100) - 100)
            End If

            If summary.FieldName = "percCresc_Lucro" Then
                Dim vCrescAT As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrLucroComercial")))
                Dim vCrescAA As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrLucroComercialAA")))
                e.TotalValue = (((vCrescAT / vCrescAA) * 100) - 100)
            End If


        End If
    End Sub

    Protected Sub gridSecao_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs)
        On Error Resume Next

        'Calculo do Percentual da Margem Real - Ano Atual
        If e.Column.FieldName = "percMargemAT" Then
            Dim vVenda As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrVenda"))
            Dim vRealLucro As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrLucroComercial"))
            If vVenda <> 0 Then
                e.Value = ((vRealLucro / vVenda) * 100)
            Else
                e.Value = 0
            End If
        End If

        'Calculo do Percentual da Margem Real - Ano Anterior
        If e.Column.FieldName = "percMargemAA" Then
            Dim vVendaAA As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrVendaAA"))
            Dim vRealLucroAA As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrLucroComercialAA"))
            If vVendaAA <> 0 Then
                e.Value = ((vRealLucroAA / vVendaAA) * 100)
            Else
                e.Value = 0
            End If
        End If

        ' ********************************** CRESCIMENTO *********************************************************************

        'Calculo do Percentual de Crescimento - Volume
        If e.Column.FieldName = "percCresc_Vol" Then
            Dim vCrescAT As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("Qtde"))
            Dim vCrescAA As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("QtdeAA"))
            If vCrescAT <> 0 Then
                e.Value = (((vCrescAT / vCrescAA) * 100) - 100)
            Else
                e.Value = 0
            End If
        End If

        'Calculo do Percentual de Crescimento - Reais
        If e.Column.FieldName = "percCresc_Reais" Then
            Dim vCrescAT As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrVenda"))
            Dim vCrescAA As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrVendaAA"))
            If vCrescAT <> 0 Then
                e.Value = (((vCrescAT / vCrescAA) * 100) - 100)
            Else
                e.Value = 0
            End If
        End If

        'Calculo do Percentual de Crescimento - Lucro
        If e.Column.FieldName = "percCresc_Lucro" Then
            Dim vCrescAT As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrLucroComercial"))
            Dim vCrescAA As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrLucroComercialAA"))
            If vCrescAT <> 0 Then
                e.Value = (((vCrescAT / vCrescAA) * 100) - 100)
            Else
                e.Value = 0
            End If
        End If
    End Sub

    Protected Sub gridSecao_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs)
        On Error Resume Next
        If e.DataColumn.FieldName = "percCresc_Vol" Or
           e.DataColumn.FieldName = "percCresc_Reais" Or
           e.DataColumn.FieldName = "percCresc_Lucro" Then
            If Convert.ToDouble(e.CellValue) < 0 Then e.Cell.ForeColor = System.Drawing.Color.Red
        End If
    End Sub

    Protected Sub gridSecao_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs)
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

    Protected Sub gridSecao_BeforePerformDataSelect1(sender As Object, e As EventArgs)
        Session("sSECAO") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

    Protected Sub gridSecao_CustomSummaryCalculate1(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs)
        On Error Resume Next
        Dim gridView As ASPxGridView = TryCast(sender, ASPxGridView)
        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)

        If e.IsTotalSummary Then
            If summary.FieldName = "percMargemAT" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrVenda")))
                Dim vlrRealLucro As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrLucroComercial")))
                e.TotalValue = ((vlrRealLucro / vlrVenda) * 100)
            End If

            If summary.FieldName = "percMargemAA" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrVendaAA")))
                Dim vlrRealLucro As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrLucroComercialAA")))
                e.TotalValue = ((vlrRealLucro / vlrVenda) * 100)
            End If

            ' ********************************** CRESCIMENTO *********************************************************************
            If summary.FieldName = "percCresc_Vol" Then
                Dim vCrescAT As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("Qtde")))
                Dim vCrescAA As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("QtdeAA")))
                e.TotalValue = (((vCrescAT / vCrescAA) * 100) - 100)
            End If

            If summary.FieldName = "percCresc_Reais" Then
                Dim vCrescAT As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrVenda")))
                Dim vCrescAA As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrVendaAA")))
                e.TotalValue = (((vCrescAT / vCrescAA) * 100) - 100)
            End If

            If summary.FieldName = "percCresc_Lucro" Then
                Dim vCrescAT As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrLucroComercial")))
                Dim vCrescAA As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrLucroComercialAA")))
                e.TotalValue = (((vCrescAT / vCrescAA) * 100) - 100)
            End If


        End If
    End Sub

    Protected Sub gridSecao_CustomUnboundColumnData1(sender As Object, e As ASPxGridViewColumnDataEventArgs)
        On Error Resume Next

        'Calculo do Percentual da Margem Real - Ano Atual
        If e.Column.FieldName = "percMargemAT" Then
            Dim vVenda As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrVenda"))
            Dim vRealLucro As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrLucroComercial"))
            If vVenda <> 0 Then
                e.Value = ((vRealLucro / vVenda) * 100)
            Else
                e.Value = 0
            End If
        End If

        'Calculo do Percentual da Margem Real - Ano Anterior
        If e.Column.FieldName = "percMargemAA" Then
            Dim vVendaAA As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrVendaAA"))
            Dim vRealLucroAA As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrLucroComercialAA"))
            If vVendaAA <> 0 Then
                e.Value = ((vRealLucroAA / vVendaAA) * 100)
            Else
                e.Value = 0
            End If
        End If

        ' ********************************** CRESCIMENTO *********************************************************************

        'Calculo do Percentual de Crescimento - Volume
        If e.Column.FieldName = "percCresc_Vol" Then
            Dim vCrescAT As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("Qtde"))
            Dim vCrescAA As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("QtdeAA"))
            If vCrescAT <> 0 Then
                e.Value = (((vCrescAT / vCrescAA) * 100) - 100)
            Else
                e.Value = 0
            End If
        End If

        'Calculo do Percentual de Crescimento - Reais
        If e.Column.FieldName = "percCresc_Reais" Then
            Dim vCrescAT As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrVenda"))
            Dim vCrescAA As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrVendaAA"))
            If vCrescAT <> 0 Then
                e.Value = (((vCrescAT / vCrescAA) * 100) - 100)
            Else
                e.Value = 0
            End If
        End If

        'Calculo do Percentual de Crescimento - Lucro
        If e.Column.FieldName = "percCresc_Lucro" Then
            Dim vCrescAT As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrLucroComercial"))
            Dim vCrescAA As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrLucroComercialAA"))
            If vCrescAT <> 0 Then
                e.Value = (((vCrescAT / vCrescAA) * 100) - 100)
            Else
                e.Value = 0
            End If
        End If
    End Sub

    Protected Sub gridSecao_HtmlDataCellPrepared1(sender As Object, e As ASPxGridViewTableDataCellEventArgs)
        On Error Resume Next
        If e.DataColumn.FieldName = "percCresc_Vol" Or
           e.DataColumn.FieldName = "percCresc_Reais" Or
           e.DataColumn.FieldName = "percCresc_Lucro" Then
            If Convert.ToDouble(e.CellValue) < 0 Then e.Cell.ForeColor = System.Drawing.Color.Red
        End If
    End Sub

    Protected Sub gridSecao_HtmlFooterCellPrepared1(sender As Object, e As ASPxGridViewTableFooterCellEventArgs)
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

    Protected Sub gridSubgrupo_BeforePerformDataSelect(sender As Object, e As EventArgs)
        Session("sGRUPO") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

    Protected Sub gridSubgrupo_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs)
        On Error Resume Next
        Dim gridView As ASPxGridView = TryCast(sender, ASPxGridView)
        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)

        If e.IsTotalSummary Then
            If summary.FieldName = "percMargemAT" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrVenda")))
                Dim vlrRealLucro As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrLucroComercial")))
                If vlrVenda = 0 Then
                    e.TotalValue = 0
                ElseIf vlrRealLucro = 0 Then
                    e.TotalValue = 0
                Else
                    e.TotalValue = ((vlrRealLucro / vlrVenda) * 100)
                End If
            End If

            If summary.FieldName = "percMargemAA" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrVendaAA")))
                Dim vlrRealLucro As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrLucroComercialAA")))
                If vlrVenda = 0 Then
                    e.TotalValue = 0
                ElseIf vlrRealLucro = 0 Then
                    e.TotalValue = 0
                Else
                    e.TotalValue = ((vlrRealLucro / vlrVenda) * 100)
                End If
            End If

            ' ********************************** CRESCIMENTO *********************************************************************
            If summary.FieldName = "percCresc_Vol" Then
                Dim vCrescAT As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("Qtde")))
                Dim vCrescAA As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("QtdeAA")))
                If vCrescAT = 0 Then
                    e.TotalValue = 0
                ElseIf vCrescAA = 0 Then
                    e.TotalValue = 0
                Else
                    e.TotalValue = (((vCrescAT / vCrescAA) * 100) - 100)
                End If
            End If

            If summary.FieldName = "percCresc_Reais" Then
                Dim vCrescAT As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrVenda")))
                Dim vCrescAA As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrVendaAA")))
                If vCrescAT = 0 Then
                    e.TotalValue = 0
                ElseIf vCrescAA = 0 Then
                    e.TotalValue = 0
                Else
                    e.TotalValue = (((vCrescAT / vCrescAA) * 100) - 100)
                End If
            End If

            If summary.FieldName = "percCresc_Lucro" Then
                Dim vCrescAT As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrLucroComercial")))
                Dim vCrescAA As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrLucroComercialAA")))
                If vCrescAT = 0 Then
                    e.TotalValue = 0
                ElseIf vCrescAA = 0 Then
                    e.TotalValue = 0
                Else
                    e.TotalValue = (((vCrescAT / vCrescAA) * 100) - 100)
                End If
            End If


        End If
    End Sub

    Protected Sub gridSubgrupo_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs)
        On Error Resume Next

        'Calculo do Percentual da Margem Real - Ano Atual
        If e.Column.FieldName = "percMargemAT" Then
            Dim vVenda As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrVenda"))
            Dim vRealLucro As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrLucroComercial"))
            If vVenda = 0 Then
                e.Value = 0
            ElseIf vRealLucro = 0 Then
                e.Value = 0
            Else
                e.Value = ((vRealLucro / vVenda) * 100)
            End If
        End If

        'Calculo do Percentual da Margem Real - Ano Anterior
        If e.Column.FieldName = "percMargemAA" Then
            Dim vVendaAA As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrVendaAA"))
            Dim vRealLucroAA As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrLucroComercialAA"))
            If vVendaAA = 0 Then
                e.Value = 0
            ElseIf vRealLucroAA = 0 Then
                e.Value = 0
            Else
                e.Value = ((vRealLucroAA / vVendaAA) * 100)
            End If
        End If

        ' ********************************** CRESCIMENTO *********************************************************************

        'Calculo do Percentual de Crescimento - Volume
        If e.Column.FieldName = "percCresc_Vol" Then
            Dim vCrescAT As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("Qtde"))
            Dim vCrescAA As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("QtdeAA"))
            If vCrescAT = 0 Then
                e.Value = 0
            ElseIf vCrescAA = 0 Then
                e.Value = 0
            Else
                e.Value = (((vCrescAT / vCrescAA) * 100) - 100)
            End If
        End If

        'Calculo do Percentual de Crescimento - Reais
        If e.Column.FieldName = "percCresc_Reais" Then
            Dim vCrescAT As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrVenda"))
            Dim vCrescAA As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrVendaAA"))
            If vCrescAT = 0 Then
                e.Value = 0
            ElseIf vCrescAA = 0 Then
                e.Value = 0
            Else
                e.Value = (((vCrescAT / vCrescAA) * 100) - 100)
            End If
        End If

        'Calculo do Percentual de Crescimento - Lucro
        If e.Column.FieldName = "percCresc_Lucro" Then
            Dim vCrescAT As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrLucroComercial"))
            Dim vCrescAA As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrLucroComercialAA"))
            If vCrescAT = 0 Then
                e.Value = 0
            ElseIf vCrescAA = 0 Then
                e.Value = 0
            Else
                e.Value = (((vCrescAT / vCrescAA) * 100) - 100)
            End If
        End If
    End Sub

   
    Protected Sub gridSubgrupo_CustomSummaryCalculate1(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs)
        On Error Resume Next
        Dim gridView As ASPxGridView = TryCast(sender, ASPxGridView)
        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)

        If e.IsTotalSummary Then
            If summary.FieldName = "percMargemAT" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrVenda")))
                Dim vlrRealLucro As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrLucroComercial")))
                If vlrVenda = 0 Then
                    e.TotalValue = 0
                ElseIf vlrRealLucro = 0 Then
                    e.TotalValue = 0
                Else
                    e.TotalValue = ((vlrRealLucro / vlrVenda) * 100)
                End If
            End If

            If summary.FieldName = "percMargemAA" Then
                Dim vlrVenda As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrVendaAA")))
                Dim vlrRealLucro As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrLucroComercialAA")))
                If vlrVenda = 0 Then
                    e.TotalValue = 0
                ElseIf vlrRealLucro = 0 Then
                    e.TotalValue = 0
                Else
                    e.TotalValue = ((vlrRealLucro / vlrVenda) * 100)
                End If
            End If

            ' ********************************** CRESCIMENTO *********************************************************************
            If summary.FieldName = "percCresc_Vol" Then
                Dim vCrescAT As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("Qtde")))
                Dim vCrescAA As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("QtdeAA")))
                If vCrescAT = 0 Then
                    e.TotalValue = 0
                ElseIf vCrescAA = 0 Then
                    e.TotalValue = 0
                Else
                    e.TotalValue = (((vCrescAT / vCrescAA) * 100) - 100)
                End If
            End If

            If summary.FieldName = "percCresc_Reais" Then
                Dim vCrescAT As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrVenda")))
                Dim vCrescAA As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrVendaAA")))
                If vCrescAT = 0 Then
                    e.TotalValue = 0
                ElseIf vCrescAA = 0 Then
                    e.TotalValue = 0
                Else
                    e.TotalValue = (((vCrescAT / vCrescAA) * 100) - 100)
                End If
            End If

            If summary.FieldName = "percCresc_Lucro" Then
                Dim vCrescAT As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrLucroComercial")))
                Dim vCrescAA As Decimal = Convert.ToDecimal(gridView.GetTotalSummaryValue(gridView.TotalSummary("vlrLucroComercialAA")))
                If vCrescAT = 0 Then
                    e.TotalValue = 0
                ElseIf vCrescAA = 0 Then
                    e.TotalValue = 0
                Else
                    e.TotalValue = (((vCrescAT / vCrescAA) * 100) - 100)
                End If
            End If


        End If
    End Sub

    Protected Sub gridSubgrupo_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs)
        On Error Resume Next
        If e.DataColumn.FieldName = "percCresc_Vol" Or
           e.DataColumn.FieldName = "percCresc_Reais" Or
           e.DataColumn.FieldName = "percCresc_Lucro" Then
            If Convert.ToDouble(e.CellValue) < 0 Then e.Cell.ForeColor = System.Drawing.Color.Red
        End If
    End Sub

    Protected Sub gridSubgrupo_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs)
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

    'Protected Sub gridSubgrupo_Init(sender As Object, e As EventArgs)

    '    Dim childGrid As ASPxGridView = TryCast(sender, ASPxGridView)
    '    Dim key As Object = childGrid.GetMasterRowKeyValue()

    '    Dim data As DataSet = Pt_DFAR.GetNotesDetail(key, DBDfarConnection)
    '    childGrid.DataSource = data
    '    childGrid.DataBind()

    'End Sub
End Class
