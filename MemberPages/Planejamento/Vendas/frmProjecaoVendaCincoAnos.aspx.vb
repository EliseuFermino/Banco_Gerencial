Imports DevExpress.Web

Partial Class MemberPages_Planejamento_Vendas_frmProjecaoVendaCincoAnos
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes

    Protected Sub ASPxGridView1_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles ASPxGridView1.CustomSummaryCalculate

        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percM1", "Ano_M1", "Ano_M2", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "perc0", "Ano_0", "Ano_M1", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "perc1", "Ano_1", "Ano_0", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "perc2", "Ano_2", "Ano_1", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "perc3", "Ano_3", "Ano_2", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "perc4", "Ano_4", "Ano_3", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "perc5", "Ano_5", "Ano_4", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "perc6", "Ano_6", "Ano_5", Funcoes.CalculateType.Growth)

    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percM1")
        oFun.Grid_RedIsNegative(e, "perc0")
        oFun.Grid_RedIsNegative(e, "perc1")
        oFun.Grid_RedIsNegative(e, "perc2")
        oFun.Grid_RedIsNegative(e, "perc3")
        oFun.Grid_RedIsNegative(e, "perc4")
        oFun.Grid_RedIsNegative(e, "perc5")
        oFun.Grid_RedIsNegative(e, "perc6")

        oFun.Grid_ColorCell(e, "perc1", 6, Drawing.Color.LightPink)
        oFun.Grid_ColorCell(e, "perc2", 6, Drawing.Color.LightPink)
        oFun.Grid_ColorCell(e, "perc3", 6, Drawing.Color.LightPink)
        oFun.Grid_ColorCell(e, "perc4", 6, Drawing.Color.LightPink)
        oFun.Grid_ColorCell(e, "perc5", 6, Drawing.Color.LightPink)
        oFun.Grid_ColorCell(e, "perc6", 6, Drawing.Color.LightPink)
    End Sub

    Protected Sub ASPxGridView1_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles ASPxGridView1.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(184, User.Identity.Name)
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Projeção de Venda Total até 2020 - PGR184"
        End If

    End Sub

    Protected Sub btnAtualizar_Click(sender As Object, e As EventArgs) Handles btnAtualizar.Click
        Me.ASPxGridView1.DataBind()
    End Sub
End Class
