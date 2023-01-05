
Partial Class Controles_MargemNegativaFilial
    Inherits System.Web.UI.UserControl

    Dim oFun As New Funcoes


    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        Atualizar()
        
    End Sub

    Protected Sub grid1_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid1.CustomSummaryCalculate

        oFun.Grid_Footer_Calculate(sender, e, grid1, "percMargem", "vlrLucroComercial", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
    End Sub

    Protected Sub grid1_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid1.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "vlrLucroComercial")
        oFun.Grid_RedIsNegative(e, "percMargem")
    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
    End Sub

    Private Sub Atualizar()

        Dim numHora As Byte
        numHora = DatePart(DateInterval.Hour, DateAndTime.Now())

        If cboFilial.IsLoja = True Then
            btnAtualizar.Visible = False
            grid2.Visible = False
            cboFilial.Visible = False
        End If

        oFun.Grid_Title(grid1, "Margem Formada pelos Itens que estão negativo na loja nesse momento<br> Posição até " & numHora & ":00")
        oFun.Grid_Title(grid2, "Margem Formada pelos Itens que estão negativo na loja nesse momento por Filial - Posição até " & numHora & ":00")
        Session("sFILIAL") = cboFilial.CallFilial
        grid1.DataBind()
        grid2.DataBind()
    End Sub



    Protected Sub grid1_HtmlFooterCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableFooterCellEventArgs) Handles grid1.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub grid2_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid2.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, grid2, "percMargem", "vlrLucroComercial", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)

    End Sub

    Protected Sub grid2_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid2.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "vlrLucroComercial")
        oFun.Grid_RedIsNegative(e, "percMargem")
    End Sub

    Protected Sub grid2_HtmlFooterCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableFooterCellEventArgs) Handles grid2.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub
End Class
