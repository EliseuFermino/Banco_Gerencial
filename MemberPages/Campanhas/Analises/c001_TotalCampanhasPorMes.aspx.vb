Imports DevExpress.Web

Partial Class MemberPages_Campanhas_Analises_TotalCampanhaPorMes
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(144, User.Identity.Name)
            Me.cboAno.AnoInicial = 2014
            Me.cboAno.AnoFinal = Year(Now())
            Me.cboAno.CallAno = Year(Now())
            cboMes.AutoPostBack = False
            cboAno.AutoPostBack = False
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Analise de Históricos de Campanhas - PGR144"
        End If
    End Sub


#Region " Grid_Sintetico"

    Protected Sub gridTabelaSintetica_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridTabelaSintetica.CustomSummaryCalculate

        oFun.Grid_Footer_Calculate(sender, e, gridTabelaSintetica, "percMargem", "vlrLucro", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gridTabelaSintetica, "percMargemSellOut", "vlrLucroSellOut", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gridTabelaSintetica, "difMargemPerc", "percMargem", "percMargemSellOut", Funcoes.CalculateType.Sum)

    End Sub

    Protected Sub gridTabelaSintetica_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridTabelaSintetica.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "vlrVenda")
        oFun.Grid_RedIsNegative(e, "difMargemVlr")
        oFun.Grid_RedIsNegative(e, "difMargemPerc")
        oFun.Grid_RedIsNegative(e, "vlrLucro")

    End Sub

    Protected Sub gridTabelaSintetica_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gridTabelaSintetica.HtmlFooterCellPrepared

        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

#End Region

    Protected Sub gridTabela1_BeforePerformDataSelect(sender As Object, e As EventArgs)
        Session("sCAMPANHA") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

    Protected Sub gridTabela1_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs)

        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "vlrVenda")
        oFun.Grid_RedIsNegative(e, "difMargemVlr")
        oFun.Grid_RedIsNegative(e, "difMargemPerc")
        oFun.Grid_RedIsNegative(e, "vlrLucro")

    End Sub

    Protected Sub gridTabela1_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs)

        oFun.Grid_Footer_Calculate_Detail(sender, e, "percMargem", "vlrLucro", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate_Detail(sender, e, "percMargemSellOut", "vlrLucroSellOut", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate_Detail(sender, e, "difMargemPerc", "percMargem", "percMargemSellOut", Funcoes.CalculateType.Sum)
       
    End Sub

    Protected Sub gridTabela1_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs)
        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback
        Session("sANO") = Me.cboAno.CallAno
        Session("sMES") = Me.cboMes.CallMes
        gridTabelaSintetica.DataBind()
    End Sub

End Class
