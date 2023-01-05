
#Region " Imports"

Imports Microsoft.VisualBasic
Imports DevExpress.Web
Imports System.Drawing
Imports System.Web.UI.WebControls.BorderStyle
Imports System.Web.UI.WebControls.Unit
Imports DevExpress.Data
Imports DevExpress.XtraCharts


#End Region

Public Class Funcoes

    Public Enum CalculateType As Byte
        Growth = 1
        ValueOverRevenue = 2
        Decrease = 3
        Sum = 4
        Multiplication = 5
        Division = 6
        MultiplicationOverRevenue = 7
        Growth_Real = 8
    End Enum

    Public Enum CasaDecimais As Byte
        Nenhuma = 0
        Uma = 1
        Duas = 2
        Três = 3
        Quatro = 4
    End Enum

    Public Sub CheckBoxStatusExibir(ByVal iCheckBox As ASPxCheckBox, ByVal gridViewName As ASPxGridView, ByVal descObjecto As String)
        If iCheckBox.Checked = True Then
            gridViewName.Columns.Item(descObjecto).Visible = True
        Else
            gridViewName.Columns.Item(descObjecto).Visible = False
        End If
    End Sub

#Region " Grid"

    Public Sub Grid_Column_Visible(ByVal gridViewName As ASPxGridView, ByVal columnName As String, iHideShow As Boolean)
        gridViewName.Columns.Item(columnName).Visible = iHideShow
    End Sub


    'Public Sub Grid_Column_LeftFixar(ByVal gridViewName As ASPxGridView, ByVal columnName As String, ByVal iFixar As GridViewColumnFixedStyle)

    '    gridViewName.Columns.Item(columnName).FixedStyle = iFixar

    'End Sub

    Public Sub Grid_Column_BorderRight(ByVal gridViewName As ASPxGridView, ByVal columnName As String,
                                       ByVal iColor As Drawing.Color, ByVal iBorderStyle As BorderStyle, ByVal iBorderWidth As Unit)

        'Formata a borda das colunas e rodapés
        With gridViewName.Columns.Item(columnName).CellStyle.BorderRight
            .BorderColor = iColor
            .BorderStyle = iBorderStyle
            .BorderWidth = iBorderWidth
        End With

        With gridViewName.Columns.Item(columnName).GroupFooterCellStyle.BorderRight
            .BorderColor = iColor
            .BorderStyle = iBorderStyle
            .BorderWidth = iBorderWidth
        End With

        With gridViewName.Columns.Item(columnName).FooterCellStyle.BorderRight
            .BorderColor = iColor
            .BorderStyle = iBorderStyle
            .BorderWidth = iBorderWidth
        End With

    End Sub

    Public Sub Grid_Column_BorderLeft(ByVal gridViewName As ASPxGridView, ByVal columnName As String,
                                   ByVal iColor As Drawing.Color, ByVal iBorderStyle As BorderStyle, ByVal iBorderWidth As Unit)

        'Formata a borda das colunas e rodapés
        With gridViewName.Columns.Item(columnName).CellStyle.BorderLeft
            .BorderColor = iColor
            .BorderStyle = iBorderStyle
            .BorderWidth = iBorderWidth
        End With

        With gridViewName.Columns.Item(columnName).GroupFooterCellStyle.BorderLeft
            .BorderColor = iColor
            .BorderStyle = iBorderStyle
            .BorderWidth = iBorderWidth
        End With

        With gridViewName.Columns.Item(columnName).FooterCellStyle.BorderLeft
            .BorderColor = iColor
            .BorderStyle = iBorderStyle
            .BorderWidth = iBorderWidth
        End With

    End Sub

    Public Sub Grid_RedIsNegative(ByVal e As ASPxGridViewTableDataCellEventArgs, nameColumn As String)
        If e.DataColumn.FieldName = nameColumn Then
            If IsDBNull(e.CellValue) = False Then
                If Convert.ToDouble(e.CellValue) < 0 Then
                    e.Cell.ForeColor = System.Drawing.Color.Red
                End If
            End If

        End If
    End Sub

    Public Sub Exporter_RedIsNegative(ByVal e As ASPxGridViewExportRenderingEventArgs, nameColumn As String)
        If e.RowType <> GridViewRowType.Data Then
            Return
        End If
        If TryCast(e.Column, GridViewDataColumn).FieldName = nameColumn AndAlso e.RowType <> GridViewRowType.Header Then
            If Convert.ToDecimal(e.TextValue) > 0.0 Then
                e.BrickStyle.ForeColor = Color.Black
            Else
                e.BrickStyle.ForeColor = Color.Red
            End If
        End If
    End Sub

    Public Sub grid_ForeColorCell_Igual(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs, nameColumn As String, ByVal iValor As Integer, iColor As Drawing.Color)
        If e.DataColumn.FieldName = nameColumn Then
            If e.CellValue = iValor Then
                e.Cell.ForeColor = iColor
            End If
        End If
    End Sub

    Public Sub grid_ForeColorCell_Igual(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs, nameColumn As String, ByVal iValor As String, iColor As Drawing.Color)
        If e.DataColumn.FieldName = nameColumn Then
            If e.CellValue = iValor Then
                e.Cell.ForeColor = iColor
            End If
        End If
    End Sub


    Public Sub Grid_ColorCell(ByVal e As ASPxGridViewTableDataCellEventArgs, nameColumn As String, ByVal iValorMenorQue As Integer, iColor As Drawing.Color)
        If e.DataColumn.FieldName = nameColumn Then
            If IsDBNull(e.CellValue) = False Then
                If Convert.ToDouble(e.CellValue) < iValorMenorQue Then
                    e.Cell.ForeColor = iColor
                End If
            End If

        End If
    End Sub




    Public Sub Grid_Calculate(ByVal e As ASPxGridViewColumnDataEventArgs, ByVal nameColumn As String,
                                    ByVal valueOne As String, ByVal valueTwo As String, ByVal iCalculateType As CalculateType)

        On Error Resume Next
        If e.Column.FieldName = nameColumn Then
            Dim vOne As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue(valueOne))
            Dim vTwo As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue(valueTwo))

            Select Case iCalculateType
                Case CalculateType.Growth, CalculateType.ValueOverRevenue
                    If IsNothing(vOne) Then
                        e.Value = 0
                    ElseIf IsNothing(vTwo) Then
                        e.Value = 0
                    Else
                        If iCalculateType = CalculateType.Growth Then
                            e.Value = (((vOne / vTwo) * 100) - 100)
                        ElseIf iCalculateType = CalculateType.ValueOverRevenue Then
                            e.Value = ((vOne / vTwo) * 100)
                        End If
                    End If

                Case CalculateType.Decrease
                    e.Value = (vOne - vTwo)
                Case CalculateType.Sum
                    e.Value = (vOne + vTwo)
                Case CalculateType.Division
                    If IsNothing(vOne) Or IsDBNull(vOne) Then
                        e.Value = 0
                    ElseIf IsNothing(vTwo) Or IsDBNull(vTwo) Then
                        e.Value = 0
                    Else
                        e.Value = (vOne / vTwo)
                    End If
                Case CalculateType.Multiplication
                    e.Value = (vOne * vTwo)
            End Select
        End If

    End Sub

    Public Sub Grid_RedIsNegativeFooter(sender As Object, e As ASPxGridViewTableFooterCellEventArgs)
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

    Public Sub Grid_Color_By_Column_Footer_DisplayText(sender As Object, e As ASPxGridViewSummaryDisplayTextEventArgs, ByVal gridViewName As ASPxGridView, ByVal iColumnName As String, iColor1 As Drawing.Color, iColor2 As Drawing.Color, iColumnName_Bold As Boolean)

        If e.Item.FieldName = iColumnName Then
            gridViewName.Columns.Item(iColumnName).FooterCellStyle.Font.Bold = iColumnName_Bold
            If Convert.ToDecimal(e.Value) < 0 Then
                gridViewName.Columns.Item(iColumnName).FooterCellStyle.ForeColor = iColor1
            Else
                gridViewName.Columns.Item(iColumnName).FooterCellStyle.ForeColor = iColor2
            End If
        End If

    End Sub

    Public Sub Grid_Footer_Calculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs, ByVal gridViewName As ASPxGridView,
                                           ByVal nameColumn As String, ByVal valueOne As String, ByVal valueTwo As String, ByVal iCalculateType As CalculateType)
        'On Error Resume Next
        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)

        If e.IsGroupSummary Then
            If summary.FieldName = nameColumn Then
                Dim vOne As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, gridViewName.GroupSummary(valueOne)))
                Dim vTwo As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, gridViewName.GroupSummary(valueTwo)))

                Select Case iCalculateType
                    Case CalculateType.Growth, CalculateType.ValueOverRevenue
                        If IsNothing(vOne) Then
                            e.TotalValue = 0
                        ElseIf IsNothing(vTwo) Then
                            e.TotalValue = 0
                        ElseIf vOne = 0 Then
                            e.TotalValue = 0
                        ElseIf vTwo = 0 Then
                            e.TotalValue = 0
                        Else
                            If iCalculateType = CalculateType.Growth Then
                                e.TotalValue = (((vOne / vTwo) * 100) - 100)
                            ElseIf iCalculateType = CalculateType.ValueOverRevenue Then
                                e.TotalValue = ((vOne / vTwo) * 100)
                            End If
                        End If

                    Case CalculateType.Decrease, CalculateType.Sum, CalculateType.Division
                        If iCalculateType = CalculateType.Decrease Then
                            e.TotalValue = (vOne - vTwo)
                        ElseIf iCalculateType = CalculateType.Sum Then
                            e.TotalValue = (vOne + vTwo)
                        ElseIf iCalculateType = CalculateType.Division Then
                            e.TotalValue = (vOne / vTwo)
                        End If



                End Select

            End If
        ElseIf e.IsTotalSummary Then
            If summary.FieldName = nameColumn Then
                Dim vOne As Decimal = Convert.ToDecimal(gridViewName.GetTotalSummaryValue(gridViewName.TotalSummary(valueOne)))
                Dim vTwo As Decimal = Convert.ToDecimal(gridViewName.GetTotalSummaryValue(gridViewName.TotalSummary(valueTwo)))

                Select Case iCalculateType
                    Case CalculateType.Growth, CalculateType.ValueOverRevenue
                        If IsNothing(vOne) Or vOne = 0 Then
                            e.TotalValue = 0
                        ElseIf IsNothing(vTwo) Or vTwo = 0 Then
                            e.TotalValue = 0
                        Else
                            If iCalculateType = CalculateType.Growth Then
                                e.TotalValue = (((vOne / vTwo) * 100) - 100)
                            ElseIf iCalculateType = CalculateType.ValueOverRevenue Then
                                e.TotalValue = ((vOne / vTwo) * 100)
                            End If
                        End If

                    Case CalculateType.Decrease, CalculateType.Sum, CalculateType.Division
                        If IsNothing(vOne) Or vOne = 0 Then
                            e.TotalValue = 0
                        ElseIf IsNothing(vTwo) Or vTwo = 0 Then
                            e.TotalValue = 0
                        Else
                            If iCalculateType = CalculateType.Decrease Then
                                e.TotalValue = (vOne - vTwo)
                            ElseIf iCalculateType = CalculateType.Sum Then
                                e.TotalValue = (vOne + vTwo)
                            ElseIf iCalculateType = CalculateType.Division Then
                                e.TotalValue = (vOne / vTwo)
                            End If
                        End If
                End Select

            End If
        End If

    End Sub


    Public Sub Grid_Footer_Calculate_var_valueTwo(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs, ByVal gridViewName As ASPxGridView,
                                        ByVal nameColumn As String, ByVal valueOne As String, ByVal valueTwo As String, ByVal iCalculateType As CalculateType)
        'On Error Resume Next
        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)

        If e.IsGroupSummary Then
            If summary.FieldName = nameColumn Then
                Dim vOne As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, gridViewName.GroupSummary(valueOne)))
                Dim vTwo As Decimal = valueTwo

                Select Case iCalculateType
                    Case CalculateType.Growth, CalculateType.ValueOverRevenue
                        If IsNothing(vOne) Then
                            e.TotalValue = 0
                        ElseIf IsNothing(vTwo) Then
                            e.TotalValue = 0
                        ElseIf vOne = 0 Then
                            e.TotalValue = 0
                        ElseIf vTwo = 0 Then
                            e.TotalValue = 0
                        Else
                            If iCalculateType = CalculateType.Growth Then
                                e.TotalValue = (((vOne / vTwo) * 100) - 100)
                            ElseIf iCalculateType = CalculateType.ValueOverRevenue Then
                                e.TotalValue = ((vOne / vTwo) * 100)
                            End If
                        End If

                    Case CalculateType.Decrease, CalculateType.Sum, CalculateType.Division
                        If iCalculateType = CalculateType.Decrease Then
                            e.TotalValue = (vOne - vTwo)
                        ElseIf iCalculateType = CalculateType.Sum Then
                            e.TotalValue = (vOne + vTwo)
                        ElseIf iCalculateType = CalculateType.Division Then
                            e.TotalValue = (vOne / vTwo)
                        End If



                End Select

            End If
        ElseIf e.IsTotalSummary Then
            If summary.FieldName = nameColumn Then
                Dim vOne As Decimal = Convert.ToDecimal(gridViewName.GetTotalSummaryValue(gridViewName.TotalSummary(valueOne)))
                Dim vTwo As Decimal = valueTwo

                Select Case iCalculateType
                    Case CalculateType.Growth, CalculateType.ValueOverRevenue
                        If IsNothing(vOne) Or vOne = 0 Then
                            e.TotalValue = 0
                        ElseIf IsNothing(vTwo) Or vTwo = 0 Then
                            e.TotalValue = 0
                        Else
                            If iCalculateType = CalculateType.Growth Then
                                e.TotalValue = (((vOne / vTwo) * 100) - 100)
                            ElseIf iCalculateType = CalculateType.ValueOverRevenue Then
                                e.TotalValue = ((vOne / vTwo) * 100)
                            End If
                        End If

                    Case CalculateType.Decrease, CalculateType.Sum, CalculateType.Division
                        If IsNothing(vOne) Or vOne = 0 Then
                            e.TotalValue = 0
                        ElseIf IsNothing(vTwo) Or vTwo = 0 Then
                            e.TotalValue = 0
                        Else
                            If iCalculateType = CalculateType.Decrease Then
                                e.TotalValue = (vOne - vTwo)
                            ElseIf iCalculateType = CalculateType.Sum Then
                                e.TotalValue = (vOne + vTwo)
                            ElseIf iCalculateType = CalculateType.Division Then
                                e.TotalValue = (vOne / vTwo)
                            End If
                        End If
                End Select

            End If
        End If

    End Sub


    Public Sub Grid_Footer_Calculate_SellOut(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs, ByVal gridViewName As ASPxGridView,
                                        ByVal nameColumn As String, ByVal vlrLucro As String, ByVal vlrLucroSellOut As String, ByVal vlrVenda As String)

        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)

        If e.IsGroupSummary Then

            If summary.FieldName = nameColumn Then
                Dim vLucro As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, gridViewName.GroupSummary(vlrLucro)))
                Dim vLucroSellOut As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, gridViewName.GroupSummary(vlrLucroSellOut)))
                Dim vVenda As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, gridViewName.GroupSummary(vlrVenda)))

                If IsNothing(vLucro) Then
                    e.TotalValue = 0
                ElseIf IsNothing(vLucroSellOut) Then
                    e.TotalValue = 0
                ElseIf IsNothing(vVenda) Then
                    e.TotalValue = 0
                Else
                    e.TotalValue = (((vLucro + vLucroSellOut) / vVenda) * 100)
                End If

            ElseIf e.IsTotalSummary Then
                If summary.FieldName = nameColumn Then
                    Dim vLucro As Decimal = Convert.ToDecimal(gridViewName.GetTotalSummaryValue(gridViewName.TotalSummary(vlrLucro)))
                    Dim vLucroSellOut As Decimal = Convert.ToDecimal(gridViewName.GetTotalSummaryValue(gridViewName.TotalSummary(vlrLucroSellOut)))
                    Dim vVenda As Decimal = Convert.ToDecimal(gridViewName.GetTotalSummaryValue(gridViewName.TotalSummary(vlrVenda)))

                    If IsNothing(vLucro) Then
                        e.TotalValue = 0
                    ElseIf IsNothing(vLucroSellOut) Then
                        e.TotalValue = 0
                    ElseIf IsNothing(vVenda) Then
                        e.TotalValue = 0
                    Else
                        e.TotalValue = (((vLucro + vLucroSellOut) / vVenda) * 100)
                    End If

                End If
            End If

        End If

    End Sub

    Public Sub Grid_Footer_Calculate_VendaInformada(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs, ByVal gridViewName As ASPxGridView,
                                       ByVal nameColumn As String, ByVal valueOne As String, ByVal vlrVenda As Decimal)
        'On Error Resume Next
        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)

        If e.IsGroupSummary Then
            If summary.FieldName = nameColumn Then
                Dim vOne As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, gridViewName.GroupSummary(valueOne)))
                Dim vTwo As Decimal = vlrVenda


                If IsNothing(vOne) Then
                    e.TotalValue = 0
                ElseIf IsNothing(vTwo) Then
                    e.TotalValue = 0
                ElseIf vOne = 0 Then
                    e.TotalValue = 0
                ElseIf vTwo = 0 Then
                    e.TotalValue = 0
                Else
                    e.TotalValue = ((vOne / vTwo) * 100)
                End If

            End If
        ElseIf e.IsTotalSummary Then
            If summary.FieldName = nameColumn Then
                Dim vOne As Decimal = Convert.ToDecimal(gridViewName.GetTotalSummaryValue(gridViewName.TotalSummary(valueOne)))
                Dim vTwo As Decimal = vlrVenda

                If IsNothing(vOne) Or vOne = 0 Then
                    e.TotalValue = 0
                ElseIf IsNothing(vTwo) Or vTwo = 0 Then
                    e.TotalValue = 0
                Else
                    e.TotalValue = ((vOne / vTwo) * 100)

                End If

            End If
        End If

    End Sub



    Public Sub Grid_FixHeader(ByVal iCheckBox As ASPxCheckBox, ByVal gridViewName As ASPxGridView)
        If iCheckBox.Checked = True Then
            gridViewName.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Visible
        Else
            gridViewName.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Hidden
        End If
    End Sub

    Public Sub Grid_Title(ByVal gridViewName As ASPxGridView, TitleName As String)
        gridViewName.Settings.ShowTitlePanel = True
        gridViewName.SettingsText.Title = TitleName
    End Sub

    Public Sub Grid_ColumnTitle(ByVal gridViewName As ASPxGridView, columnName As String, titleName As String)
        gridViewName.Columns().Item(columnName).Caption = titleName
    End Sub

    Public Sub Exporter_ColumnTitle(e As ASPxGridViewExportRenderingEventArgs, ByVal iNameField As String, iNameTitle As String)

        Dim dataColumn As GridViewDataColumn = TryCast(e.Column, GridViewDataColumn)
        If e.RowType = GridViewRowType.Header AndAlso dataColumn IsNot Nothing AndAlso dataColumn.FieldName = iNameField Then
            e.Text = iNameTitle
            e.TextValue = e.Text
        End If

    End Sub


    Public Sub Grid_Footer_Calculate_Detail(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs,
                                           ByVal nameColumn As String, ByVal valueOne As String, ByVal valueTwo As String, ByVal iCalculateType As CalculateType)

        Dim gridViewName As ASPxGridView = TryCast(sender, ASPxGridView)
        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)

        If e.IsGroupSummary Then
            If summary.FieldName = nameColumn Then
                Dim vOne As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, gridViewName.GroupSummary(valueOne)))
                Dim vTwo As Decimal = Convert.ToDecimal(e.GetGroupSummary(e.GroupRowHandle, gridViewName.GroupSummary(valueTwo)))

                Select Case iCalculateType
                    Case CalculateType.Growth, CalculateType.ValueOverRevenue
                        If IsNothing(vOne) Then
                            e.TotalValue = 0
                        ElseIf IsNothing(vTwo) Then
                            e.TotalValue = 0
                        Else
                            If iCalculateType = CalculateType.Growth Then
                                e.TotalValue = (((vOne / vTwo) * 100) - 100)
                            ElseIf iCalculateType = CalculateType.ValueOverRevenue Then
                                e.TotalValue = ((vOne / vTwo) * 100)
                            End If
                        End If

                    Case CalculateType.Decrease, CalculateType.Sum
                        If iCalculateType = CalculateType.Decrease Then
                            e.TotalValue = (vOne - vTwo)
                        ElseIf iCalculateType = CalculateType.Sum Then
                            e.TotalValue = (vOne + vTwo)
                        End If

                End Select

            End If
        ElseIf e.IsTotalSummary Then
            If summary.FieldName = nameColumn Then
                Dim vOne As Decimal = Convert.ToDecimal(gridViewName.GetTotalSummaryValue(gridViewName.TotalSummary(valueOne)))
                Dim vTwo As Decimal = Convert.ToDecimal(gridViewName.GetTotalSummaryValue(gridViewName.TotalSummary(valueTwo)))

                Select Case iCalculateType
                    Case CalculateType.Growth, CalculateType.ValueOverRevenue
                        If IsNothing(vOne) Then
                            e.TotalValue = 0
                        ElseIf IsNothing(vTwo) Then
                            e.TotalValue = 0
                        Else
                            If iCalculateType = CalculateType.Growth Then
                                e.TotalValue = (((vOne / vTwo) * 100) - 100)
                            ElseIf iCalculateType = CalculateType.ValueOverRevenue Then
                                e.TotalValue = ((vOne / vTwo) * 100)
                            End If
                        End If

                    Case CalculateType.Decrease, CalculateType.Sum
                        If iCalculateType = CalculateType.Decrease Then
                            e.TotalValue = (vOne - vTwo)
                        ElseIf iCalculateType = CalculateType.Sum Then
                            e.TotalValue = (vOne + vTwo)
                        End If
                End Select

            End If
        End If

    End Sub

    Public Sub Grid_RedIsNegative_ColorPositive(ByVal e As ASPxGridViewTableDataCellEventArgs, nameColumn As String, ByVal iColor As Drawing.Color)
        If e.DataColumn.FieldName = nameColumn Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            Else
                e.Cell.ForeColor = iColor
            End If
        End If
    End Sub

    Public Sub Grid_Size(ByVal iGrid As ASPxGridView, iValue As Byte, Optional ByVal OnlyHorizontal As Boolean = False)

        Dim gridWith As Int16
        Dim gridHeight As Int16

        'Select Case iValue
        '    Case 150
        '        gridHeight = 600
        '        gridWith = 500 * 157 / 100
        'End Select

        If iValue = 100 Then
            gridHeight = 400
        Else
            If OnlyHorizontal = False Then
                If iValue = 100 Then
                    gridHeight = 400 * 95 / 100
                    iGrid.SettingsPager.PageSize = 16
                ElseIf iValue = 120 Then
                    gridHeight = 400 * 110 / 100
                    iGrid.SettingsPager.PageSize = 17
                ElseIf iValue = 130 Then
                    gridHeight = 400 * 110 / 100
                    iGrid.SettingsPager.PageSize = 17
                ElseIf iValue = 140 Then
                    gridHeight = 400 * 110 / 100
                    iGrid.SettingsPager.PageSize = 17
                ElseIf iValue = 150 Then
                    gridHeight = 400 * 115 / 100
                    iGrid.SettingsPager.PageSize = 18
                ElseIf iValue = 160 Then
                    gridHeight = 400 * 120 / 100
                    iGrid.SettingsPager.PageSize = 20
                ElseIf iValue = 170 Then
                    gridHeight = 400 * 145 / 100
                    iGrid.SettingsPager.PageSize = 24
                ElseIf iValue = 180 Then
                    gridHeight = 400 * 168 / 100
                    iGrid.SettingsPager.PageSize = 28
                ElseIf iValue = 190 Then
                    gridHeight = 400 * 195 / 100
                    iGrid.SettingsPager.PageSize = 32
                ElseIf iValue = 200 Then
                    gridHeight = 400 * 217 / 100
                    iGrid.SettingsPager.PageSize = 38
                End If
            Else
                If iValue = 200 Then
                    gridHeight = 400

                ElseIf iValue = 150 Then
                    gridHeight = 400

                ElseIf iValue = 170 Then
                    gridHeight = 400

                Else
                    gridHeight = 400

                End If
            End If

        End If


        iGrid.Settings.VerticalScrollableHeight = gridHeight
        iGrid.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Visible

    End Sub

    Public Sub grid_RowSelectedWhole(ByVal iGrid As ASPxGridView, e As DevExpress.Web.ASPxGridViewTableRowEventArgs, ByVal nameColumn As String, iFilter As String, ByVal iColor As Drawing.Color, iBold As Boolean)

        If e.RowType <> GridViewRowType.Data Then
            Return
        End If

        Dim NomeColuna As String = Convert.ToString(e.GetValue(nameColumn))

        If NomeColuna = iFilter Then
            e.Row.BackColor = iColor
            e.Row.Font.Bold = iBold
        End If


    End Sub

    

    Public Sub Grid_FillCell_ForeColor_WithFilter(ByVal e As ASPxGridViewTableDataCellEventArgs, nameColumn As String, iFilter As String)

        If e.DataColumn.FieldName = nameColumn Then
            If e.CellValue = iFilter Then
                e.Cell.ForeColor = System.Drawing.Color.LightGreen
            End If
        End If

    End Sub

    Public Sub Grid_Column_Width(ByVal iGrid As ASPxGridView, nameColumn As String, iWidth As Int16)

        iGrid.Columns(nameColumn).Width = iWidth

    End Sub

    Public Sub Grid_OrderByColumn(ByVal gridViewName As ASPxGridView, ByVal nameColumn As String, orderColumn As DevExpress.Data.ColumnSortOrder)

        gridViewName.SortBy(gridViewName.Columns(nameColumn), orderColumn)

    End Sub

    Public Sub Grid_Column_Wrap(ByVal gridViewName As ASPxGridView, ByVal columnName As String, iTrueFalse As DevExpress.Utils.DefaultBoolean)

        gridViewName.Columns(columnName).CellStyle.Wrap = iTrueFalse

    End Sub

    Public Sub Grid_Column_Index(ByVal gridViewName As ASPxGridView, ByVal columnName As String, numIndex As Byte)

        gridViewName.Columns(columnName).VisibleIndex = numIndex

    End Sub

    Public Sub Grid_Column_GroupIndex(ByVal gridViewName As ASPxGridView, ByVal columnName As String, numIndex As Integer)

        TryCast(gridViewName.Columns(columnName), GridViewDataColumn).GroupIndex = numIndex
    End Sub

    Public Sub Grid_ColumnFormat(ByVal gridViewName As ASPxGridView, ByVal columnName As String, ByVal myCaption As String, ByVal myToolTip As String, ByVal numDecimals As CasaDecimais, Optional ByVal myWidth As Byte = 70)

        gridViewName.Columns(columnName).Width = myWidth
        gridViewName.Columns(columnName).Caption = myCaption
        gridViewName.Columns(columnName).ToolTip = myToolTip

        Select Case numDecimals
            Case CasaDecimais.Nenhuma
                TryCast(gridViewName.Columns(columnName), GridViewDataTextColumn).PropertiesTextEdit.DisplayFormatString = "n0"
            Case CasaDecimais.Uma
                TryCast(gridViewName.Columns(columnName), GridViewDataTextColumn).PropertiesTextEdit.DisplayFormatString = "n1"
            Case CasaDecimais.Duas
                TryCast(gridViewName.Columns(columnName), GridViewDataTextColumn).PropertiesTextEdit.DisplayFormatString = "n2"
            Case CasaDecimais.Três
                TryCast(gridViewName.Columns(columnName), GridViewDataTextColumn).PropertiesTextEdit.DisplayFormatString = "n3"
            Case CasaDecimais.Quatro
                TryCast(gridViewName.Columns(columnName), GridViewDataTextColumn).PropertiesTextEdit.DisplayFormatString = "n4"
        End Select

        TryCast(gridViewName.Columns(columnName), GridViewDataTextColumn).PropertiesTextEdit.EncodeHtml = False

    End Sub

    Public Sub Grid_Decimals(ByVal gridViewName As ASPxGridView, columnName As String, numDecimals As CasaDecimais)
        On Error Resume Next
        Select Case numDecimals
            Case CasaDecimais.Nenhuma
                TryCast(gridViewName.Columns(columnName), GridViewDataTextColumn).PropertiesTextEdit.DisplayFormatString = "n0"
            Case CasaDecimais.Uma
                TryCast(gridViewName.Columns(columnName), GridViewDataTextColumn).PropertiesTextEdit.DisplayFormatString = "n1"
            Case CasaDecimais.Duas
                TryCast(gridViewName.Columns(columnName), GridViewDataTextColumn).PropertiesTextEdit.DisplayFormatString = "n2"
            Case CasaDecimais.Três
                TryCast(gridViewName.Columns(columnName), GridViewDataTextColumn).PropertiesTextEdit.DisplayFormatString = "n3"
            Case CasaDecimais.Quatro
                TryCast(gridViewName.Columns(columnName), GridViewDataTextColumn).PropertiesTextEdit.DisplayFormatString = "n4"
        End Select

        TryCast(gridViewName.Columns(columnName), GridViewDataTextColumn).PropertiesTextEdit.EncodeHtml = False
    End Sub

    Public Sub Grid_Footer_Visible(ByVal gridViewName As ASPxGridView, ExibirRodape As Boolean)

        If ExibirRodape = False Then
            gridViewName.Settings.ShowFooter = False
        Else
            gridViewName.Settings.ShowFooter = True
        End If

    End Sub


#End Region

#Region " Graph"

    Public Sub Graph_InsertSignalPlus_AxisY(ByVal nameChart As DevExpress.XtraCharts.Web.WebChartControl, sender As Object, e As CustomDrawAxisLabelEventArgs)

        Dim axis As AxisBase = e.Item.Axis

        If TypeOf axis Is AxisY Or TypeOf axis Is AxisY3D Or TypeOf axis Is RadarAxisY Or TypeOf axis Is SecondaryAxisY Then
            Dim axisValue As Double = CDbl(e.Item.AxisValue)
            If axisValue < 0 Then
                e.Item.Text = e.Item.Text + "%"
                e.Item.TextColor = Drawing.Color.Red
            Else
                If axisValue > 0 Then
                    e.Item.Text = "+" + e.Item.Text + "%"
                    e.Item.TextColor = Drawing.Color.Green
                Else
                    If axisValue = 0 Then
                        e.Item.Text = "Zero"
                    End If
                End If
            End If
        End If

        ' Cast the chart's diagram to the XYDiagram type, to access its axes.
        Dim diagram As XYDiagram = TryCast(nameChart.Diagram, XYDiagram)


        ' Create a constant line.
        Dim constantLine2 As New ConstantLine(" ", 0.0)
        diagram.AxisY.ConstantLines.Add(constantLine2)


        ' Define its axis value.
        'constantLine2.AxisValue = 0.0

        ' Customize the behavior of the constant line.
        constantLine2.Visible = True
        constantLine2.ShowBehind = True

        ' Customize the appearance of the constant line.
        constantLine2.Color = Drawing.Color.Red
        constantLine2.LineStyle.DashStyle = DashStyle.Solid
        constantLine2.LineStyle.Thickness = 2


    End Sub

    Public Sub Graph_InsertSignalPlus_AxisY_SemPercentual(ByVal nameChart As DevExpress.XtraCharts.Web.WebChartControl, sender As Object, e As CustomDrawAxisLabelEventArgs)

        Dim axis As AxisBase = e.Item.Axis

        If TypeOf axis Is AxisY Or TypeOf axis Is AxisY3D Or TypeOf axis Is RadarAxisY Or TypeOf axis Is SecondaryAxisY Then
            Dim axisValue As Double = CDbl(e.Item.AxisValue)
            If axisValue < 0 Then
                e.Item.Text = e.Item.Text
                e.Item.TextColor = Drawing.Color.Red
            Else
                If axisValue > 0 Then
                    e.Item.Text = "+" + e.Item.Text
                    e.Item.TextColor = Drawing.Color.Green
                Else
                    If axisValue = 0 Then
                        e.Item.Text = "Zero"
                    End If
                End If
            End If
        End If

        ' Cast the chart's diagram to the XYDiagram type, to access its axes.
        Dim diagram As XYDiagram = TryCast(nameChart.Diagram, XYDiagram)


        ' Create a constant line.
        Dim constantLine2 As New ConstantLine(" ", 0.0)
        diagram.AxisY.ConstantLines.Add(constantLine2)


        ' Define its axis value.
        'constantLine2.AxisValue = 0.0

        ' Customize the behavior of the constant line.
        constantLine2.Visible = True
        constantLine2.ShowBehind = True

        ' Customize the appearance of the constant line.
        constantLine2.Color = Drawing.Color.Red
        constantLine2.LineStyle.DashStyle = DashStyle.Solid
        constantLine2.LineStyle.Thickness = 2


    End Sub

#End Region

    Public Function Calculate(ByVal valueOne As String, ByVal valueTwo As String, ByVal iCalculateType As CalculateType) As Decimal

        Dim vOne As Decimal = Decimal.Parse(valueOne)
        Dim vTwo As Decimal = Decimal.Parse(valueTwo)

        Select Case iCalculateType
            Case CalculateType.Growth, CalculateType.ValueOverRevenue, CalculateType.MultiplicationOverRevenue
                If IsNothing(vOne) Or vOne = 0 Then
                    vOne = 0
                    Calculate = 0
                    Exit Function
                ElseIf IsNothing(vTwo) Or vTwo = 0 Then
                    vTwo = 0
                    Calculate = 0
                    Exit Function
                Else
                    If iCalculateType = CalculateType.Growth Then
                        Calculate = (((vOne / vTwo) * 100) - 100)
                    ElseIf iCalculateType = CalculateType.ValueOverRevenue Then
                        Calculate = ((vOne / vTwo) * 100)
                    ElseIf iCalculateType = CalculateType.MultiplicationOverRevenue Then
                        Calculate = ((vOne * vTwo) / 100)
                    End If
                End If

            Case CalculateType.Decrease, CalculateType.Sum
                If iCalculateType = CalculateType.Decrease Then
                    Calculate = (vOne - vTwo)
                ElseIf iCalculateType = CalculateType.Sum Then
                    Calculate = (vOne + vTwo)
                End If

            Case CalculateType.Multiplication, CalculateType.Division
                If iCalculateType = CalculateType.Multiplication Then
                    Calculate = (vOne * vTwo)
                ElseIf iCalculateType = CalculateType.Division Then
                    Calculate = (vOne / vTwo)
                End If

        End Select

        Return Calculate

    End Function

    Public Sub Label_RedIsNegative(ByVal iLabel As Label)
        If CDbl(iLabel.Text) < 0.0 Then
            iLabel.ForeColor = Drawing.Color.Red
        Else
            iLabel.ForeColor = Drawing.Color.Black
        End If
    End Sub

    Public Sub TextBox_RedIsNegative(ByVal iTextBox As TextBox)
        If CDbl(iTextBox.Text) < 0.0 Then
            iTextBox.ForeColor = Drawing.Color.Red
        Else
            iTextBox.ForeColor = Drawing.Color.Black
        End If
    End Sub

    Public Sub TextBox_RedIsNegative(ByVal iTextBox As TextBox, iColorPositive As Drawing.Color)
        If CDbl(iTextBox.Text) < 0.0 Then
            iTextBox.ForeColor = Drawing.Color.Red
        Else
            iTextBox.ForeColor = iColorPositive
        End If
    End Sub

    Public Sub TextBox_Enabled_True(ByVal iTextBox As TextBox)
        iTextBox.Enabled = True
    End Sub

    Public Sub TextBox_Enabled_False(ByVal iTextBox As TextBox)
        iTextBox.Enabled = False
    End Sub

    Public Sub TextBox_ClearField(ByVal iTextBox As TextBox)
        iTextBox.Text = ""
    End Sub

#Region " ANTIGOS"

    Public Sub Totalizar12Mes_Label(ByVal iTotal As Label, ByVal iMes01 As Label, ByVal iMes02 As Label, ByVal iMes03 As Label, ByVal iMes04 As Label, ByVal iMes05 As Label, ByVal iMes06 As Label,
                                ByVal iMes07 As Label, ByVal iMes08 As Label, ByVal iMes09 As Label, ByVal iMes10 As Label, ByVal iMes11 As Label, ByVal iMes12 As Label)
        Dim no As Double
        no = 0
        no += CDbl(iMes01.Text)
        no += CDbl(iMes02.Text)
        no += CDbl(iMes03.Text)
        no += CDbl(iMes04.Text)
        no += CDbl(iMes05.Text)
        no += CDbl(iMes06.Text)
        no += CDbl(iMes07.Text)
        no += CDbl(iMes08.Text)
        no += CDbl(iMes09.Text)
        no += CDbl(iMes10.Text)
        no += CDbl(iMes11.Text)
        no += CDbl(iMes12.Text)
        iTotal.Text = (no).ToString("n0")
    End Sub

    Public Sub Totalizar12Mes_TextBox(ByVal iTotal As TextBox, ByVal iMes01 As TextBox, ByVal iMes02 As TextBox, ByVal iMes03 As TextBox, ByVal iMes04 As TextBox, ByVal iMes05 As TextBox, ByVal iMes06 As TextBox,
                                ByVal iMes07 As TextBox, ByVal iMes08 As TextBox, ByVal iMes09 As TextBox, ByVal iMes10 As TextBox, ByVal iMes11 As TextBox, ByVal iMes12 As TextBox)
        Dim no As Double
        no = 0
        no += CDbl(iMes01.Text)
        no += CDbl(iMes02.Text)
        no += CDbl(iMes03.Text)
        no += CDbl(iMes04.Text)
        no += CDbl(iMes05.Text)
        no += CDbl(iMes06.Text)
        no += CDbl(iMes07.Text)
        no += CDbl(iMes08.Text)
        no += CDbl(iMes09.Text)
        no += CDbl(iMes10.Text)
        no += CDbl(iMes11.Text)
        no += CDbl(iMes12.Text)
        iTotal.Text = (no).ToString("n0")
    End Sub

#End Region

    Public Sub graph_Pontuacao_CheckList(sender As Object, e As CustomDrawSeriesPointEventArgs)
        ' These changes will be applied to Bar Series only.
        Dim drawOptions = CType(e.SeriesDrawOptions, BarDrawOptions)
        If drawOptions Is Nothing Then
            Return
        End If

        ' Get the fill options for the series point.
        drawOptions.FillStyle.FillMode = FillMode.Gradient
        Dim options = CType(drawOptions.FillStyle.Options, RectangleGradientFillOptions)
        If options Is Nothing Then
            Return
        End If


        ' Get the value at the current series point.
        Dim val As Double = e.SeriesPoint(0)

        ' If the value is less than 2.5, then fill the bar with green colors.
        If val >= 0.0 And val <= 70.0 Then
            options.Color2 = Color.Firebrick
            drawOptions.Color = Color.Firebrick
            drawOptions.Border.Color = Color.Firebrick
            ' ... if the value is less than 5.5, then fill the bar with yellow colors.
        ElseIf val > 70.1 And val <= 89.9999999999 Then
            options.Color2 = Color.SandyBrown
            drawOptions.Color = Color.SandyBrown
            drawOptions.Border.Color = Color.SandyBrown
        ElseIf val >= 90 And val <= 94.999999999999 Then
            options.Color2 = Color.DeepSkyBlue
            drawOptions.Color = Color.DeepSkyBlue
            drawOptions.Border.Color = Color.DeepSkyBlue
            ' ... if the value is greater, then fill the bar with red colors.
        ElseIf val >= 95.0 And val <= 98.0 Then
            options.Color2 = Color.SteelBlue
            drawOptions.Color = Color.SteelBlue
            drawOptions.Border.Color = Color.SteelBlue
            ' ... if the value is greater, then fill the bar with red colors.
        Else
            options.Color2 = Color.LimeGreen
            drawOptions.Color = Color.LimeGreen
            drawOptions.Border.Color = Color.LimeGreen
        End If
    End Sub


    ' *******************************************************  FRAMEWORK ATUALIZADO **********************************************************

    Public Sub nf_Grid_Footer_Calculate(sender As Object, e As CustomSummaryEventArgs, nameColumn As String,
                                        ByVal valueOne As String, ByVal valueTwo As String)

        If e.Item.FieldName = nameColumn Then
            Dim vlr_valueOne As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary(valueOne)
            Dim vlr_valueTwo As ASPxSummaryItem = (TryCast(sender, ASPxGridView)).TotalSummary(valueTwo)

            Dim v_valueOne As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(vlr_valueOne))
            Dim v_valueTwo As Decimal = Convert.ToDecimal((CType(sender, ASPxGridView)).GetTotalSummaryValue(vlr_valueTwo))

            If v_valueOne > 0 Then
                e.TotalValue = (((v_valueOne / v_valueTwo) * 100) - 100)
            End If
        End If

    End Sub


    Public Function RetornaNomeMes(ByVal Mes As Byte) As String

        Select Case Mes
            Case 1
                RetornaNomeMes = "Jan"
            Case 2
                RetornaNomeMes = "Fev"
            Case 3
                RetornaNomeMes = "Mar"
            Case 4
                RetornaNomeMes = "Abr"
            Case 5
                RetornaNomeMes = "Mai"
            Case 6
                RetornaNomeMes = "Jun"
            Case 7
                RetornaNomeMes = "Jul"
            Case 8
                RetornaNomeMes = "Ago"
            Case 9
                RetornaNomeMes = "Set"
            Case 10
                RetornaNomeMes = "Out"
            Case 11
                RetornaNomeMes = "Nov"
            Case 12
                RetornaNomeMes = "Dez"
            Case Else
                RetornaNomeMes = "Ver"
        End Select

    End Function

   

End Class
