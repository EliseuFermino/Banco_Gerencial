
Imports DevExpress.Data
Imports DevExpress.Web

Partial Class Campanha_Material_Escolar
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVem As New VendaEmpresaMes

    Private Sub Campanha_Material_Escolar_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            cboAno.AnoInicial = 2019
            cboAno.AnoFinal = 2021
            cboAno.CallAno = 2020

            Session("sANO") = cboAno.CallAno

            Dim nameCookie As HttpCookie = Request.Cookies("gerUserName")

            Dim varTitulo As String = "Período  -  Ano 2018:  de 01/01/2018 à 03/02/2018    -    Ano 2019: de 01/01/2019 à 03/02/2019"

            ASPxPageControl1.ActiveTabIndex = 0

            oFun.Grid_Title(gridParticipacao, varTitulo)
            oFun.Grid_Title(grid_Principal, varTitulo)
            oFun.Grid_Title(grid_Principal_Meta, varTitulo)
            oFun.Grid_Title(grid_Filial, varTitulo)
            oFun.Grid_Title(grid_Filial_Meta, varTitulo)
            oFun.Grid_Title(grid_Item, varTitulo)
            oFun.Grid_Title(grid_Produto_Meta, varTitulo)

            oFun.Grid_Column_BorderRight(grid_Principal, "descCategoria", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid_Principal, "percCresc_Qtde", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid_Principal, "percCresc_Venda", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid_Principal, "percPart_VendasAT", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid_Principal, "percCresc_LucroPDV", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid_Principal, "percCresc_LucroTotal", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid_Principal, "difMargemPDV", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid_Principal, "difMargemTotal", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid_Principal, "rnk", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid_Principal, "percCresc_precoMedio", Drawing.Color.Gray, BorderStyle.Solid, 2)


            oFun.Grid_Column_BorderRight(grid_Filial, "descFilial", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid_Filial, "percCresc_Qtde", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid_Filial, "percCresc_Venda", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid_Filial, "percPart_VendasAT", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid_Filial, "percCresc_LucroPDV", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid_Filial, "percCresc_LucroTotal", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid_Filial, "difMargemPDV", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid_Filial, "difMargemTotal", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid_Filial, "rnk", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid_Filial, "percCresc_precoMedio", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(grid_Item, "nomeProduto", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid_Item, "percCresc_Qtde", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid_Item, "percCresc_Venda", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid_Item, "percPart_VendasAT", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid_Item, "percCresc_LucroPDV", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid_Item, "percCresc_LucroTotal", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid_Item, "difMargemPDV", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid_Item, "difMargemTotal", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid_Item, "rnk", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid_Item, "percCresc_precoMedio", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(grid_Produto_Meta, "nomeProduto", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid_Produto_Meta, "percChegada", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(gridParticipacao, "DateAbrev1", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(gridParticipacao, "percPartVendaAA", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(gridParticipacao, "percAtingMeta", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(gridParticipacao, "percPartVendaAT", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(gridParticipacao, "percCresc", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(gridParticipacao, "running_percCrescVenda", Drawing.Color.Gray, BorderStyle.Solid, 2)

            gridParticipacao.Columns.Item("percPartVendaAT").ToolTip = "Até o dia " + DateAndTime.Now.AddDays(-1).ToString("dd/MM/yyyy") + " o Percentual de Participação esta baseado na venda real, e a partir do dia " + DateAndTime.Now.ToString("dd/MM/yyyy") + " o Percentual de Participação esta baseado na Meta"
            gridParticipacao.Columns.Item("running_percPartVendaAT").ToolTip = "Até o dia " + DateAndTime.Now.AddDays(-1).ToString("dd/MM/yyyy") + " o Percentual de Participação esta baseado na venda real, e a partir do dia " + DateAndTime.Now.ToString("dd/MM/yyyy") + " o Percentual de Participação esta baseado na Meta"




        End If

    End Sub

    Private Sub grid_Filial_CustomSummaryCalculate(sender As Object, e As CustomSummaryEventArgs) Handles grid_Filial.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, grid_Filial, "percCresc_Venda", "vlrVendaAT", "vlrVendaAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid_Filial, "percCresc_Qtde", "QtdeAT", "QtdeAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid_Filial, "percCresc_LucroPDV", "vlrLucroComercialAT", "vlrLucroComercialAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid_Filial, "percCresc_LucroTotal", "vlrLucroTotalAT", "vlrLucroTotalAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid_Filial, "percMargemPDV_AA", "vlrLucroComercialAA", "vlrVendaAA", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid_Filial, "percMargemPDV_AT", "vlrLucroComercialAT", "vlrVendaAT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid_Filial, "difMargemPDV", "percMargemPDV_AT", "percMargemPDV_AA", Funcoes.CalculateType.Decrease)

        oFun.Grid_Footer_Calculate(sender, e, grid_Filial, "percMargemTotal_AA", "vlrLucroTotalAA", "vlrVendaAA", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid_Filial, "percMargemTotal_AT", "vlrLucroTotalAT", "vlrVendaAT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid_Filial, "difMargemTotal", "percMargemTotal_AT", "percMargemTotal_AA", Funcoes.CalculateType.Decrease)

        oFun.Grid_Footer_Calculate(sender, e, grid_Filial, "precoMedioAA", "vlrVendaAA", "QtdeAA", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, grid_Filial, "precoMedioAT", "vlrVendaAT", "QtdeAT", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, grid_Filial, "percCresc_precoMedio", "precoMedioAT", "precoMedioAA", Funcoes.CalculateType.Growth)
    End Sub

    Private Sub grid_Filial_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles grid_Filial.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "difMargemPDV", "percMargemPDV_AT", "percMargemPDV_AA", Funcoes.CalculateType.Decrease)
        oFun.Grid_Calculate(e, "difMargemTotal", "percMargemTotal_AT", "percMargemTotal_AA", Funcoes.CalculateType.Decrease)
        oFun.Grid_Calculate(e, "precoMedioAA", "vlrVendaAA", "QtdeAA", Funcoes.CalculateType.Division)
        oFun.Grid_Calculate(e, "precoMedioAT", "vlrVendaAT", "QtdeAT", Funcoes.CalculateType.Division)
        oFun.Grid_Calculate(e, "percCresc_precoMedio", "precoMedioAT", "precoMedioAA", Funcoes.CalculateType.Growth)
    End Sub

    Private Sub grid_Filial_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid_Filial.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percCresc_Qtde")
        oFun.Grid_RedIsNegative(e, "percCresc_Venda")
        oFun.Grid_RedIsNegative(e, "percPart_VendasAT")
        oFun.Grid_RedIsNegative(e, "percCresc_LucroPDV")
        oFun.Grid_RedIsNegative(e, "QtdeAA")
        oFun.Grid_RedIsNegative(e, "QtdeAT")
        oFun.Grid_RedIsNegative(e, "difQtde")
        oFun.Grid_RedIsNegative(e, "difVenda")
        oFun.Grid_RedIsNegative(e, "vlrLucroComercialAA")
        oFun.Grid_RedIsNegative(e, "vlrLucroComercialAT")
        oFun.Grid_RedIsNegative(e, "difLucroPDV")
        oFun.Grid_RedIsNegative(e, "vlrLucroTotalAA")
        oFun.Grid_RedIsNegative(e, "vlrLucroTotalAT")
        oFun.Grid_RedIsNegative(e, "difLucroTotal")
        oFun.Grid_RedIsNegative(e, "percMargemPDV_AA")
        oFun.Grid_RedIsNegative(e, "percMargemPDV_AT")
        oFun.Grid_RedIsNegative(e, "difMargemPDV")
        oFun.Grid_RedIsNegative(e, "difMargemTotal")
        oFun.Grid_RedIsNegative(e, "percCresc_LucroTotal")
        oFun.Grid_RedIsNegative(e, "percCresc_precoMedio")
    End Sub

    Private Sub grid_Filial_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid_Filial.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Private Sub grid_Filial_Meta_CustomSummaryCalculate(sender As Object, e As CustomSummaryEventArgs) Handles grid_Filial_Meta.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, grid_Filial_Meta, "percAting", "vlrVendaAT", "vlrVendaMeta", Funcoes.CalculateType.Growth)
    End Sub

    Private Sub grid_Filial_Meta_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid_Filial_Meta.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percAting")
        oFun.Grid_RedIsNegative(e, "Dif")
    End Sub

    Private Sub grid_Filial_Meta_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid_Filial_Meta.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Private Sub grid_Item_CustomSummaryCalculate(sender As Object, e As CustomSummaryEventArgs) Handles grid_Item.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, grid_Item, "percCresc_Venda", "vlrVendaAT", "vlrVendaAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid_Item, "percCresc_Qtde", "QtdeAT", "QtdeAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid_Item, "percCresc_LucroPDV", "vlrLucroComercialAT", "vlrLucroComercialAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid_Item, "percCresc_LucroTotal", "vlrLucroTotalAT", "vlrLucroTotalAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid_Item, "percMargemPDV_AA", "vlrLucroComercialAA", "vlrVendaAA", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid_Item, "percMargemPDV_AT", "vlrLucroComercialAT", "vlrVendaAT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid_Item, "difMargemPDV", "percMargemPDV_AT", "percMargemPDV_AA", Funcoes.CalculateType.Decrease)

        oFun.Grid_Footer_Calculate(sender, e, grid_Item, "percMargemTotal_AA", "vlrLucroTotalAA", "vlrVendaAA", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid_Item, "percMargemTotal_AT", "vlrLucroTotalAT", "vlrVendaAT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid_Item, "difMargemTotal", "percMargemTotal_AT", "percMargemTotal_AA", Funcoes.CalculateType.Decrease)

        oFun.Grid_Footer_Calculate(sender, e, grid_Item, "precoMedioAA", "vlrVendaAA", "QtdeAA", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, grid_Item, "precoMedioAT", "vlrVendaAT", "QtdeAT", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, grid_Item, "percCresc_precoMedio", "precoMedioAT", "precoMedioAA", Funcoes.CalculateType.Growth)
    End Sub

    Private Sub grid_Item_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles grid_Item.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "difMargemPDV", "percMargemPDV_AT", "percMargemPDV_AA", Funcoes.CalculateType.Decrease)
        oFun.Grid_Calculate(e, "difMargemTotal", "percMargemTotal_AT", "percMargemTotal_AA", Funcoes.CalculateType.Decrease)
        oFun.Grid_Calculate(e, "precoMedioAA", "vlrVendaAA", "QtdeAA", Funcoes.CalculateType.Division)
        oFun.Grid_Calculate(e, "precoMedioAT", "vlrVendaAT", "QtdeAT", Funcoes.CalculateType.Division)
        oFun.Grid_Calculate(e, "percCresc_precoMedio", "precoMedioAT", "precoMedioAA", Funcoes.CalculateType.Growth)
    End Sub

    Private Sub grid_Item_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid_Item.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percCresc_Qtde")
        oFun.Grid_RedIsNegative(e, "percCresc_Venda")
        oFun.Grid_RedIsNegative(e, "percPart_VendasAT")
        oFun.Grid_RedIsNegative(e, "percCresc_LucroPDV")
        oFun.Grid_RedIsNegative(e, "QtdeAA")
        oFun.Grid_RedIsNegative(e, "QtdeAT")
        oFun.Grid_RedIsNegative(e, "difQtde")
        oFun.Grid_RedIsNegative(e, "difVenda")
        oFun.Grid_RedIsNegative(e, "vlrLucroComercialAA")
        oFun.Grid_RedIsNegative(e, "vlrLucroComercialAT")
        oFun.Grid_RedIsNegative(e, "difLucroPDV")
        oFun.Grid_RedIsNegative(e, "vlrLucroTotalAA")
        oFun.Grid_RedIsNegative(e, "vlrLucroTotalAT")
        oFun.Grid_RedIsNegative(e, "difLucroTotal")
        oFun.Grid_RedIsNegative(e, "percMargemPDV_AA")
        oFun.Grid_RedIsNegative(e, "percMargemPDV_AT")
        oFun.Grid_RedIsNegative(e, "difMargemPDV")
        oFun.Grid_RedIsNegative(e, "difMargemTotal")
        oFun.Grid_RedIsNegative(e, "percCresc_LucroTotal")
        oFun.Grid_RedIsNegative(e, "percCresc_precoMedio")
    End Sub

    Private Sub grid_Item_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid_Item.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Private Sub grid_Principal_CustomSummaryCalculate(sender As Object, e As CustomSummaryEventArgs) Handles grid_Principal.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, grid_Principal, "percCresc_Venda", "vlrVendaAT", "vlrVendaAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid_Principal, "percCresc_Qtde", "QtdeAT", "QtdeAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid_Principal, "percCresc_LucroPDV", "vlrLucroComercialAT", "vlrLucroComercialAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid_Principal, "percCresc_LucroTotal", "vlrLucroTotalAT", "vlrLucroTotalAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid_Principal, "percMargemPDV_AA", "vlrLucroComercialAA", "vlrVendaAA", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid_Principal, "percMargemPDV_AT", "vlrLucroComercialAT", "vlrVendaAT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid_Principal, "difMargemPDV", "percMargemPDV_AT", "percMargemPDV_AA", Funcoes.CalculateType.Decrease)

        oFun.Grid_Footer_Calculate(sender, e, grid_Principal, "percMargemTotal_AA", "vlrLucroTotalAA", "vlrVendaAA", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid_Principal, "percMargemTotal_AT", "vlrLucroTotalAT", "vlrVendaAT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid_Principal, "difMargemTotal", "percMargemTotal_AT", "percMargemTotal_AA", Funcoes.CalculateType.Decrease)

        oFun.Grid_Footer_Calculate(sender, e, grid_Principal, "precoMedioAA", "vlrVendaAA", "QtdeAA", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, grid_Principal, "precoMedioAT", "vlrVendaAT", "QtdeAT", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, grid_Principal, "percCresc_precoMedio", "precoMedioAT", "precoMedioAA", Funcoes.CalculateType.Growth)
    End Sub

    Private Sub grid_Principal_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles grid_Principal.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "difMargemPDV", "percMargemPDV_AT", "percMargemPDV_AA", Funcoes.CalculateType.Decrease)
        oFun.Grid_Calculate(e, "difMargemTotal", "percMargemTotal_AT", "percMargemTotal_AA", Funcoes.CalculateType.Decrease)
        oFun.Grid_Calculate(e, "precoMedioAA", "vlrVendaAA", "QtdeAA", Funcoes.CalculateType.Division)
        oFun.Grid_Calculate(e, "precoMedioAT", "vlrVendaAT", "QtdeAT", Funcoes.CalculateType.Division)
        oFun.Grid_Calculate(e, "percCresc_precoMedio", "precoMedioAT", "precoMedioAA", Funcoes.CalculateType.Growth)

    End Sub

    Private Sub grid_Principal_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid_Principal.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percCresc_Qtde")
        oFun.Grid_RedIsNegative(e, "percCresc_Venda")
        oFun.Grid_RedIsNegative(e, "percPart_VendasAT")
        oFun.Grid_RedIsNegative(e, "percCresc_LucroPDV")
        oFun.Grid_RedIsNegative(e, "QtdeAA")
        oFun.Grid_RedIsNegative(e, "QtdeAT")
        oFun.Grid_RedIsNegative(e, "difQtde")
        oFun.Grid_RedIsNegative(e, "difVenda")
        oFun.Grid_RedIsNegative(e, "vlrLucroComercialAA")
        oFun.Grid_RedIsNegative(e, "vlrLucroComercialAT")
        oFun.Grid_RedIsNegative(e, "difLucroPDV")
        oFun.Grid_RedIsNegative(e, "vlrLucroTotalAA")
        oFun.Grid_RedIsNegative(e, "vlrLucroTotalAT")
        oFun.Grid_RedIsNegative(e, "difLucroTotal")
        oFun.Grid_RedIsNegative(e, "percMargemPDV_AA")
        oFun.Grid_RedIsNegative(e, "percMargemPDV_AT")
        oFun.Grid_RedIsNegative(e, "difMargemPDV")
        oFun.Grid_RedIsNegative(e, "difMargemTotal")
        oFun.Grid_RedIsNegative(e, "percCresc_LucroTotal")
        oFun.Grid_RedIsNegative(e, "percCresc_precoMedio")

    End Sub

    Private Sub grid_Principal_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid_Principal.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Private Sub grid_Principal_Meta_CustomSummaryCalculate(sender As Object, e As CustomSummaryEventArgs) Handles grid_Principal_Meta.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, grid_Principal_Meta, "percAting", "vlrVendaAT", "vlrVendaMeta", Funcoes.CalculateType.Growth)
    End Sub

    Private Sub grid_Principal_Meta_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid_Principal_Meta.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percAting")
        oFun.Grid_RedIsNegative(e, "Dif")
    End Sub

    Private Sub grid_Principal_Meta_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid_Principal_Meta.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Private Sub grid_Produto_Meta_CustomSummaryCalculate(sender As Object, e As CustomSummaryEventArgs) Handles grid_Produto_Meta.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, grid_Produto_Meta, "percAting", "vlrVendaAT", "vlrVendaMeta", Funcoes.CalculateType.Growth)
    End Sub

    Private Sub grid_Produto_Meta_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid_Produto_Meta.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percAting")
        oFun.Grid_RedIsNegative(e, "Dif")
    End Sub

    Private Sub grid_Produto_Meta_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid_Produto_Meta.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub ASPxPageControl1_TabClick(source As Object, e As TabControlCancelEventArgs) Handles ASPxPageControl1.TabClick
        Session("sANO") = cboAno.CallAno
        Select Case e.Tab.VisibleIndex()
            Case 0  'Participação
                oVem.AtualizarEstatisticaPrograma(364, "Eder")
            Case 1  'Comparativo por Categoria
                oVem.AtualizarEstatisticaPrograma(365, "Eder")
            Case 2  'Comparativo por Filial
                oVem.AtualizarEstatisticaPrograma(366, "Eder")
            Case 3  'Comparativo por Produto
                oVem.AtualizarEstatisticaPrograma(367, "Eder")
            Case 4  'Meta x Realizado - por Filial
                oVem.AtualizarEstatisticaPrograma(368, "Eder")
            Case 5  'Meta x Realizado - por Categoria
                oVem.AtualizarEstatisticaPrograma(369, "Eder")
            Case 6  'Meta x Realizado - por Produto
                oVem.AtualizarEstatisticaPrograma(370, "Eder")
            Case 7  'Meta x Realizado - Cadastro
                oVem.AtualizarEstatisticaPrograma(371, "Eder")
        End Select

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Campanha - Material Escolar"
        End If
    End Sub

    Private Sub gridParticipacao_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridParticipacao.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "difMeta")
        oFun.Grid_RedIsNegative(e, "percAtingMeta")
        oFun.Grid_RedIsNegative(e, "difVenda")
        oFun.Grid_RedIsNegative(e, "percCresc")
        oFun.Grid_RedIsNegative(e, "running_percCrescVenda")

    End Sub

    Private Sub gridParticipacao_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gridParticipacao.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Private Sub gridParticipacao_CustomSummaryCalculate(sender As Object, e As CustomSummaryEventArgs) Handles gridParticipacao.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, gridParticipacao, "percAtingMeta", "vlrVendaAT", "vlrMeta", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridParticipacao, "percCresc", "vlrVendaAT", "vlrVendaAA", Funcoes.CalculateType.Growth)

    End Sub

    Private Sub Campanha_Material_Escolar_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            Session("sANO") = cboAno.CallAno

            Dim vAnoAT As Int16 = cboAno.CallAno
            Dim vAnoAA As Int16 = cboAno.CallAno - 1

            ' Titulos 
            ' Grid_Participação -----------------------------------------------------------------------------------
            oFun.Grid_ColumnTitle(gridParticipacao, "gridParticipacao_AA", vAnoAA)
            oFun.Grid_ColumnTitle(gridParticipacao, "gridParticipacao_AT", vAnoAT)

            oFun.Grid_ColumnTitle(gridParticipacao, "gridParticipacao_Diferenca", vAnoAA & " x " & vAnoAT)

            oFun.Grid_ColumnTitle(gridParticipacao, "running_vlrVendaAA", vAnoAA)
            oFun.Grid_ColumnTitle(gridParticipacao, "running_vlrVendaAT", vAnoAT)

            oFun.Grid_ColumnTitle(gridParticipacao, "running_percPartVendaAA", vAnoAA)
            oFun.Grid_ColumnTitle(gridParticipacao, "running_percPartVendaAT", vAnoAT)


            ' Grid_Principal -----------------------------------------------------------------------------------
            oFun.Grid_ColumnTitle(grid_Principal, "QtdeAA", vAnoAA)
            oFun.Grid_ColumnTitle(grid_Principal, "QtdeAT", vAnoAT)
            oFun.Grid_ColumnTitle(grid_Principal, "vlrVendaAA", vAnoAA)
            oFun.Grid_ColumnTitle(grid_Principal, "vlrVendaAT", vAnoAT)
            oFun.Grid_ColumnTitle(grid_Principal, "percPart_VendasAA", vAnoAA)
            oFun.Grid_ColumnTitle(grid_Principal, "percPart_VendasAT", vAnoAT)
            oFun.Grid_ColumnTitle(grid_Principal, "vlrLucroComercialAA", vAnoAA)
            oFun.Grid_ColumnTitle(grid_Principal, "vlrLucroComercialAT", vAnoAT)
            oFun.Grid_ColumnTitle(grid_Principal, "vlrLucroTotalAA", vAnoAA)
            oFun.Grid_ColumnTitle(grid_Principal, "vlrLucroTotalAT", vAnoAT)
            oFun.Grid_ColumnTitle(grid_Principal, "percMargemPDV_AA", vAnoAA)
            oFun.Grid_ColumnTitle(grid_Principal, "percMargemPDV_AT", vAnoAT)
            oFun.Grid_ColumnTitle(grid_Principal, "percMargemTotal_AA", vAnoAA)
            oFun.Grid_ColumnTitle(grid_Principal, "percMargemTotal_AT", vAnoAT)
            oFun.Grid_ColumnTitle(grid_Principal, "precoMedioAA", vAnoAA)
            oFun.Grid_ColumnTitle(grid_Principal, "precoMedioAT", vAnoAT)

            ' Grid_Filial -----------------------------------------------------------------------------------
            oFun.Grid_ColumnTitle(grid_Filial, "QtdeAA", vAnoAA)
            oFun.Grid_ColumnTitle(grid_Filial, "QtdeAT", vAnoAT)

            oFun.Grid_ColumnTitle(grid_Filial, "vlrVendaAA", vAnoAA)
            oFun.Grid_ColumnTitle(grid_Filial, "vlrVendaAT", vAnoAT)

            oFun.Grid_ColumnTitle(grid_Filial, "percPart_VendasAA", vAnoAA)
            oFun.Grid_ColumnTitle(grid_Filial, "percPart_VendasAT", vAnoAT)

            oFun.Grid_ColumnTitle(grid_Filial, "vlrLucroComercialAA", vAnoAA)
            oFun.Grid_ColumnTitle(grid_Filial, "vlrLucroComercialAT", vAnoAT)

            oFun.Grid_ColumnTitle(grid_Filial, "vlrLucroTotalAA", vAnoAA)
            oFun.Grid_ColumnTitle(grid_Filial, "vlrLucroTotalAT", vAnoAT)

            oFun.Grid_ColumnTitle(grid_Filial, "percMargemPDV_AA", vAnoAA)
            oFun.Grid_ColumnTitle(grid_Filial, "percMargemPDV_AT", vAnoAT)

            oFun.Grid_ColumnTitle(grid_Filial, "percMargemTotal_AA", vAnoAA)
            oFun.Grid_ColumnTitle(grid_Filial, "percMargemTotal_AT", vAnoAT)

            oFun.Grid_ColumnTitle(grid_Filial, "precoMedioAA", vAnoAA)
            oFun.Grid_ColumnTitle(grid_Filial, "precoMedioAT", vAnoAT)

            ' grid_Item -----------------------------------------------------------------------------------
            oFun.Grid_ColumnTitle(grid_Item, "precoMedioAA", vAnoAA)
            oFun.Grid_ColumnTitle(grid_Item, "precoMedioAT", vAnoAT)

            oFun.Grid_ColumnTitle(grid_Item, "QtdeAA", vAnoAA)
            oFun.Grid_ColumnTitle(grid_Item, "QtdeAT", vAnoAT)

            oFun.Grid_ColumnTitle(grid_Item, "vlrVendaAA", vAnoAA)
            oFun.Grid_ColumnTitle(grid_Item, "vlrVendaAT", vAnoAT)

            oFun.Grid_ColumnTitle(grid_Item, "percPart_VendasAA", vAnoAA)
            oFun.Grid_ColumnTitle(grid_Item, "percPart_VendasAT", vAnoAT)

            oFun.Grid_ColumnTitle(grid_Item, "vlrLucroComercialAA", vAnoAA)
            oFun.Grid_ColumnTitle(grid_Item, "vlrLucroComercialAT", vAnoAT)

            oFun.Grid_ColumnTitle(grid_Item, "vlrLucroTotalAA", vAnoAA)
            oFun.Grid_ColumnTitle(grid_Item, "vlrLucroTotalAT", vAnoAT)

            oFun.Grid_ColumnTitle(grid_Item, "percMargemPDV_AA", vAnoAA)
            oFun.Grid_ColumnTitle(grid_Item, "percMargemPDV_AT", vAnoAT)

            oFun.Grid_ColumnTitle(grid_Item, "percMargemTotal_AA", vAnoAA)
            oFun.Grid_ColumnTitle(grid_Item, "percMargemTotal_AT", vAnoAT)

            oFun.Grid_ColumnTitle(grid_Item, "precoMedioAA", vAnoAA)
            oFun.Grid_ColumnTitle(grid_Item, "precoMedioAT", vAnoAT)


            ' grid_Filial_Meta -----------------------------------------------------------------------------------
            oFun.Grid_ColumnTitle(grid_Filial_Meta, "vlrVendaAAF", vAnoAA)
            oFun.Grid_ColumnTitle(grid_Principal_Meta, "vlrVendaAAF", vAnoAA)
            oFun.Grid_ColumnTitle(grid_Produto_Meta, "vlrVendaAAF", vAnoAA)
        End If
    End Sub

    Private Sub cboAno_ListAnoChanged(sender As Object, e As EventArgs) Handles cboAno.ListAnoChanged
        Session("sANO") = cboAno.CallAno
    End Sub
End Class
