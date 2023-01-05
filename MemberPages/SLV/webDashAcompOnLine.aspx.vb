
Partial Class MemberPages_SLV_webDashAcompOnLine
    Inherits System.Web.UI.Page

    Dim varTitle As String
    Dim myDate As Date
    Dim oFun As New Funcoes

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        If Now.Hour > 8 Then
            Session("sDIA") = Today
            myDate = Date.Now
        Else
            Session("sDIA") = Today.AddDays(-1)
            myDate = Date.Now.AddDays(-1)
        End If

    End Sub

    'Protected Sub ASPxGridView1_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared
    '    Dim vPercMarg, vPerc30, vPerc As Single

    '    vPercMarg = e.DataColumn.FieldName = "percMarg"
    '    vPerc30 = vPercMarg * 30 / 100
    '    vPerc = vPercMarg - vPerc30

    '    If e.DataColumn.FieldName = "percMarg" Then
    '        If Convert.ToDouble(e.CellValue) < vPerc Then
    '            e.Cell.BackColor = System.Drawing.Color.Yellow
    '            e.Cell.ForeColor = System.Drawing.Color.Red
    '        End If

    '        If Convert.ToDouble(e.CellValue) < 0 Then
    '            e.Cell.ForeColor = System.Drawing.Color.Red
    '        End If
    '    End If

    '    'If e.DataColumn.FieldName = "vlrDifAA" Then
    '    '    If Convert.ToDouble(e.CellValue) < 0 Then
    '    '        e.Cell.ForeColor = System.Drawing.Color.Red
    '    '    End If
    '    'End If
    'End Sub

    Protected Sub gridDepto1_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridDepto1.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percRealMargem")
        oFun.Grid_RedIsNegative(e, "percMargSelout")

    End Sub

    Protected Sub gridDepto2_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridDepto2.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percRealMargem")
        oFun.Grid_RedIsNegative(e, "percMargSelout")

    End Sub

    Protected Sub gridDepto3_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridDepto3.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percRealMargem")
        oFun.Grid_RedIsNegative(e, "percMargSelout")
    End Sub

    Protected Sub gridDepto4_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridDepto4.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percRealMargem")
        oFun.Grid_RedIsNegative(e, "percMargSelout")

    End Sub

    Protected Sub gridDepto5_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridDepto5.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percRealMargem")
        oFun.Grid_RedIsNegative(e, "percMargSelout")

    End Sub


    Protected Sub Page_PreRenderComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRenderComplete
        Dim oVem As New VendaEmpresaMes

        Dim inputDate As Date
        Dim result As Boolean = Date.TryParse(myDate, inputDate)

        If result = True Then

            varTitle = " Itens Negativos da Empresa " & myDate.ToString("dd/MM/yyyy") & "."
            CType(Master.FindControl("lblTitle"), Label).Text = varTitle
        Else
            varTitle = " Ops! Dia com problema!"
            CType(Master.FindControl("lblTitle"), Label).Text = varTitle
        End If

    End Sub


    Protected Sub ASPxGridView2_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView2.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percRealMargem")
        oFun.Grid_RedIsNegative(e, "percMargSelout")
    End Sub

    Protected Sub grid_Top30_Lucro_Negativo_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid_Top30_Lucro_Negativo.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "LucroComercial")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "vlrLucroFinal")
        oFun.Grid_RedIsNegative(e, "percMargemFinal")
    End Sub

    Protected Sub grid_Top30_Lucro_Negativo_CustomUnboundColumnData(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDataEventArgs) Handles grid_Top30_Lucro_Negativo.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "precoVenda", "Venda", "QtdVendas", Funcoes.CalculateType.Division)
    End Sub

    Protected Sub grid_Top30_Lucro_Negativo_HtmlFooterCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableFooterCellEventArgs) Handles grid_Top30_Lucro_Negativo.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub grid_Top30_Lucro_Negativo_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid_Top30_Lucro_Negativo.CustomSummaryCalculate
        On Error Resume Next

        oFun.Grid_Footer_Calculate(sender, e, grid_Top30_Lucro_Negativo, "percMargem", "LucroComercial", "Venda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid_Top30_Lucro_Negativo, "percMargemSellOut", "LucroSellOut", "Venda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid_Top30_Lucro_Negativo, "percMargemFinal", "vlrLucroFinal", "Venda", Funcoes.CalculateType.ValueOverRevenue)


    End Sub

End Class
