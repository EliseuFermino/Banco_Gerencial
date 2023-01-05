
Partial Class MemberPages_Vendas_AnaliseHoraComparativa
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes

    Protected Sub ASPxGridView1_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles ASPxGridView1.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percCresc", "vlrVendaAT", "vlrVendaAA", Funcoes.CalculateType.Growth)
    End Sub

    

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percCresc")
        oFun.Grid_RedIsNegative(e, "Dif")
    End Sub

    Protected Sub ASPxGridView1_HtmlFooterCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableFooterCellEventArgs) Handles ASPxGridView1.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(328, Page.User.Identity.Name)
            cboDia1.Visible_btnAvanca = False
            cboDia1.Visible_btnVolta = False

            cboDia2.Visible_btnAvanca = False
            cboDia2.Visible_btnVolta = False

            cboDia1.CallDia = DateAndTime.Now().AddDays(-7)
            cboDia2.CallDia = DateAndTime.Now().AddMonths(-1)

            Session("sDIA1") = cboDia1.CallDia
            Session("sDIA2") = cboDia2.CallDia

            ASPxGridView1.DataBind()
            ASPxGridView2.DataBind()
            AlterarTitulo()

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Vendas por Hora - Comparativo - PGR328"
        End If
    End Sub

    Private Sub AlterarTitulo()
        oFun.Grid_ColumnTitle(ASPxGridView1, "vlrVendaAA", "Venda <br> " & cboDia1.CallDia.Date)
        oFun.Grid_ColumnTitle(ASPxGridView2, "vlrVendaAA", "Venda <br> " & cboDia2.CallDia.Date)

        lblTitulo1.Text = "Comparativo de Venda com o Dia " & cboDia1.CallDia.Date
        lblTitulo2.Text = "Comparativo de Venda com o Dia " & cboDia2.CallDia.Date
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then

            cboDia1.CallDia = DateAndTime.Now().AddDays(-7)
            cboDia2.CallDia = DateAndTime.Now().AddMonths(-1)

            AlterarTitulo()

            lblTitulo1.Text = "Comparativo de Venda com o Dia " & cboDia1.CallDia.Date
            lblTitulo2.Text = "Comparativo de Venda com o Dia " & cboDia2.CallDia.Date

            ASPxGridView1.DataBind()
            ASPxGridView2.DataBind()
        End If
    End Sub

    Protected Sub ASPxGridView2_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles ASPxGridView2.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView2, "percCresc", "vlrVendaAT", "vlrVendaAA", Funcoes.CalculateType.Growth)
    End Sub

    Protected Sub ASPxGridView2_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView2.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percCresc")
        oFun.Grid_RedIsNegative(e, "Dif")
    End Sub

    Protected Sub ASPxGridView2_HtmlFooterCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableFooterCellEventArgs) Handles ASPxGridView2.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub cboDia1_ListDiaChanged(sender As Object, e As EventArgs) Handles cboDia1.ListDiaChanged
        Dim Dia1 As Date
        Dia1 = cboDia1.CallDia
        Session("sDIA1") = Dia1
        ASPxGridView1.DataBind()
        AlterarTitulo()
    End Sub

    Protected Sub cboDia2_ListDiaChanged(sender As Object, e As EventArgs) Handles cboDia2.ListDiaChanged
        Dim Dia2 As Date
        Dia2 = cboDia2.CallDia
        Session("sDIA2") = Dia2
        ASPxGridView2.DataBind()
        AlterarTitulo()
    End Sub
End Class
