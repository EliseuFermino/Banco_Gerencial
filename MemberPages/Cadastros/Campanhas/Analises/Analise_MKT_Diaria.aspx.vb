
Partial Class MemberPages_Campanhas_Analises_Analise_MKT_Diaria
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(331, User.Identity.Name)

            oFun.Grid_Column_BorderRight(grid, "descCampanha", Drawing.Color.DimGray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "Data", Drawing.Color.DimGray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "CodProduto", Drawing.Color.DimGray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "CodLoja", Drawing.Color.DimGray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "QtdVendas", Drawing.Color.DimGray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "percPartVenda", Drawing.Color.DimGray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "VendaGeral", Drawing.Color.DimGray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "LucroComercial", Drawing.Color.DimGray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "LucroSellOut", Drawing.Color.DimGray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "LucroCheio", Drawing.Color.DimGray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "percPartClientes", Drawing.Color.DimGray, BorderStyle.Solid, 1)

        End If

    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            mySession()
            cboSize.CallSize = 150

            Session("sDIA_INICIAL") = DateAndTime.Now().AddDays(-2)
            Session("sDIA_FINAL") = cboPeriodo.CallDiaFinal

            cboPeriodo.CallDiaInicial = DateAndTime.Now().AddDays(-2).Date

            Atualizar()
            ChangeTitle()
        End If
    End Sub

#End Region

    Private Sub mySession()
        Session("sDIA_INICIAL") = cboPeriodo.CallDiaInicial
        Session("sDIA_FINAL") = cboPeriodo.CallDiaFinal

    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()

        If chkDatas.Checked = True Then
            oFun.Grid_Column_Visible(grid, "bandDatas", True)
        Else
            oFun.Grid_Column_Visible(grid, "bandDatas", False)
        End If

        If chkProdutos.Checked = True Then
            oFun.Grid_Column_Visible(grid, "bandProduto", True)
        Else
            oFun.Grid_Column_Visible(grid, "bandProduto", False)
        End If

        If chkLojas.Checked = True Then
            oFun.Grid_Column_Visible(grid, "bandLoja", True)
        Else
            oFun.Grid_Column_Visible(grid, "bandLoja", False)
        End If

        If chkVendaEmpresaGeral.Checked = True Then
            oFun.Grid_Column_Visible(grid, "bandVendaGeral", True)
        Else
            oFun.Grid_Column_Visible(grid, "bandVendaGeral", False)
        End If

        If chkLucroPDV.Checked = True Then
            oFun.Grid_Column_Visible(grid, "bandLucroPDV", True)
        Else
            oFun.Grid_Column_Visible(grid, "bandLucroPDV", False)
        End If

        If chkSellOut.Checked = True Then
            oFun.Grid_Column_Visible(grid, "bandLucroSellOut", True)
        Else
            oFun.Grid_Column_Visible(grid, "bandLucroSellOut", False)
        End If


        grid.DataBind()

    End Sub

    Private Sub Atualizar()
        mySession()
    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)

    End Sub

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, grid, "percPartVenda", "Venda", "VendaGeral", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percPartClientes", "numCliente", "numCliente_Geral", Funcoes.CalculateType.ValueOverRevenue)
    End Sub


    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "LucroComercial")
        oFun.Grid_RedIsNegative(e, "aa_LucroComercial")
        oFun.Grid_RedIsNegative(e, "m1_LucroComercial")
        oFun.Grid_RedIsNegative(e, "m2_LucroComercial")
        oFun.Grid_RedIsNegative(e, "m3_LucroComercial")

        oFun.Grid_RedIsNegative(e, "LucroCheio")
        oFun.Grid_RedIsNegative(e, "aa_LucroCheio")
        oFun.Grid_RedIsNegative(e, "m1_LucroCheio")
        oFun.Grid_RedIsNegative(e, "m2_LucroCheio")
        oFun.Grid_RedIsNegative(e, "m3_LucroCheio")


    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Private Sub ChangeTitle()

        Dim data As Date
        Dim aa_data As Date
        Dim m3_data As Date
        Dim m2_data As Date
        Dim m1_data As Date

        data = cboPeriodo.CallDiaFinal
        m3_data = cboPeriodo.CallDiaFinal.AddMonths(-3)
        m2_data = cboPeriodo.CallDiaFinal.AddMonths(-2)
        m1_data = cboPeriodo.CallDiaFinal.AddMonths(-1)
        aa_data = cboPeriodo.CallDiaFinal.AddYears(-1)

        myColumn("Data", data)
        myColumn("m1_Data", m1_data)
        myColumn("m2_Data", m2_data)
        myColumn("m3_Data", m3_data)
        myColumn("aa_Data", aa_data)

        myColumn("CodProduto", data)
        myColumn("m1_CodProduto", m1_data)
        myColumn("m2_CodProduto", m2_data)
        myColumn("m3_CodProduto", m3_data)
        myColumn("aa_CodProduto", aa_data)

        myColumn("CodLoja", data)
        myColumn("m1_CodLoja", m1_data)
        myColumn("m2_CodLoja", m2_data)
        myColumn("m3_CodLoja", m3_data)
        myColumn("aa_CodLoja", aa_data)

        myColumn("QtdVendas", data)
        myColumn("m1_QtdVendas", m1_data)
        myColumn("m2_QtdVendas", m2_data)
        myColumn("m3_QtdVendas", m3_data)
        myColumn("aa_QtdVendas", aa_data)

        myColumn("Venda", data)
        myColumn("m1_Venda", m1_data)
        myColumn("m2_Venda", m2_data)
        myColumn("m3_Venda", m3_data)
        myColumn("aa_Venda", aa_data)

        myColumn("VendaGeral", data)
        myColumn("m1_VendaGeral", m1_data)
        myColumn("m2_VendaGeral", m2_data)
        myColumn("m3_VendaGeral", m3_data)
        myColumn("aa_VendaGeral", aa_data)

        myColumn("LucroComercial", data)
        myColumn("m1_LucroComercial", m1_data)
        myColumn("m2_LucroComercial", m2_data)
        myColumn("m3_LucroComercial", m3_data)
        myColumn("aa_LucroComercial", aa_data)

        myColumn("LucroSellOut", data)
        myColumn("m1_LucroSellOut", m1_data)
        myColumn("m2_LucroSellOut", m2_data)
        myColumn("m3_LucroSellOut", m3_data)
        myColumn("aa_LucroSellOut", aa_data)

        myColumn("LucroCheio", data)
        myColumn("m1_LucroCheio", m1_data)
        myColumn("m2_LucroCheio", m2_data)
        myColumn("m3_LucroCheio", m3_data)
        myColumn("aa_LucroCheio", aa_data)

        myColumn("numCliente", data)
        myColumn("m1_numCliente", m1_data)
        myColumn("m2_numCliente", m2_data)
        myColumn("m3_numCliente", m3_data)
        myColumn("aa_numCliente", aa_data)

    End Sub

    Private Sub myColumn(ByVal nameField As String, ByVal nameObject As Object)
        oFun.Grid_ColumnTitle(grid, nameField, Format(nameObject, "MMM/yy"))
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Analise de Campanha - PGR331"
        End If
    End Sub

End Class
