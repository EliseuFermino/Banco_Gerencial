
Partial Class MemberPages_SLV_Item_VendaItemLoja_a_Loja
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(310, User.Identity.Name)
            oFun.Grid_Column_BorderRight(grid, "numCliente", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "Estoque_Qtde", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderLeft(grid, "QtdVendasAA", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderLeft(grid, "vlrVendasAA", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderLeft(grid, "vlrLucroComercial", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percMargemFinal", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percMargemSO", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "percMargemSOK", Drawing.Color.Gray, BorderStyle.Dashed, 1)

            oFun.Grid_Column_BorderRight(grid, "QtdeTotalPerda", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "vlrTotalPerda", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "percQuebra_Vlr", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(grid, "QtdeDivergencia", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "QtdeAgenda23", Drawing.Color.Gray, BorderStyle.Dashed, 1)

            oFun.Grid_Column_BorderRight(grid, "vlrDivergencia", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "percAg23_Vlr", Drawing.Color.Gray, BorderStyle.Dashed, 1)


            Titulos()

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete

        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Venda por Item - Loja a Loja - PGR310"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender

        If Not IsPostBack Then
            cboSize.CallSize = 100
        End If
    End Sub

#End Region
 

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Session("sPRODUTO") = cboProduto.CallProduto
        Session("sDIA_INICIAL") = cboPeriodo.CallDiaInicial
        Session("sDIA_FINAL") = cboPeriodo.CallDiaFinal
        grid.Visible = True
        Titulos()
        grid.DataBind()

        'lblInfo.Text = "Session(sPRODUTO) " & Session("sPRODUTO") & " <br> Session(sDIA_INICIAL) " & Session("sDIA_INICIAL") & " <br> Session(sDIA_FINAL) " & Session("sDIA_FINAL")

        'If Session("sDIA_FINAL") = DateAndTime.Today Then
        '    oFun.Grid_Column_Visible(grid, "Estoque_Qtde", True)
        '    oFun.Grid_ColumnTitle(grid, "Estoque_Qtde", "Estoque Qtde em <br> " & DateAndTime.Today.Date & " <br> as 06:00 horas")
        'Else
        '    oFun.Grid_Column_Visible(grid, "Estoque_Qtde", False)
        'End If



    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)

    End Sub

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescQtde", "QtdVendas", "QtdVendasAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCresc", "vlrVendas", "vlrVendasAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargem", "vlrLucroComercial", "vlrVendas", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "PrecoMedio", "vlrVendas", "QtdVendas", Funcoes.CalculateType.Division)

        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemSO", "LucroSellOut", "vlrVendas", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemSOK", "LucroSellOut_Kit", "vlrVendas", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemFinal", "vlrLucroFinal", "vlrVendas", Funcoes.CalculateType.ValueOverRevenue)

        oFun.Grid_Footer_Calculate(sender, e, grid, "percQuebra_Vlr", "vlrTotalPerda", "vlrVendas", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percAg23_Vlr", "vlrAgenda23", "vlrVendas", Funcoes.CalculateType.ValueOverRevenue)

    End Sub

    Protected Sub grid_CustomUnboundColumnData(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDataEventArgs) Handles grid.CustomUnboundColumnData
        On Error Resume Next
        oFun.Grid_Calculate(e, "percMargemFinal", "vlrLucroFinal", "vlrVendas", Funcoes.CalculateType.ValueOverRevenue)
    End Sub


    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        On Error Resume Next
        oFun.Grid_RedIsNegative(e, "vlrLucroComercial")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "vlrLucroFinal")
        oFun.Grid_RedIsNegative(e, "percMargemFinal")
        oFun.Grid_RedIsNegative(e, "percCrescQtde")
        oFun.Grid_RedIsNegative(e, "percCresc")

        oFun.Grid_RedIsNegative(e, "QtdeAgenda51")
        oFun.Grid_RedIsNegative(e, "QtdeAgenda52")
        oFun.Grid_RedIsNegative(e, "QtdeAgenda23")
        oFun.Grid_RedIsNegative(e, "QtdeDivergencia")
        oFun.Grid_RedIsNegative(e, "QtdeTotalPerda")

        oFun.Grid_RedIsNegative(e, "vlrAgenda51")
        oFun.Grid_RedIsNegative(e, "vlrAgenda52")
        oFun.Grid_RedIsNegative(e, "vlrAgenda23")
        oFun.Grid_RedIsNegative(e, "vlrDivergencia")
        oFun.Grid_RedIsNegative(e, "vlrTotalPerda")
        oFun.Grid_RedIsNegative(e, "percQuebra_Vlr")
        oFun.Grid_RedIsNegative(e, "percAg23_Vlr")

    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub grid_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles grid.HtmlRowPrepared
        On Error Resume Next
        oFun.grid_RowSelectedWhole(grid, e, "Descricao", "99 - Empresa", Drawing.Color.LightGreen, True)
    End Sub

    Private Sub Titulos()
        Dim vAno As Int16 = Year(cboPeriodo.CallDiaFinal)
        'oFun.Grid_ColumnTitle(grid, "Estoque_Qtde", "Estoque Qtde em <br> " & cboPeriodo.CallDiaFinal)
        oFun.Grid_ColumnTitle(grid, "QtdVendasAA", vAno - 1)
        oFun.Grid_ColumnTitle(grid, "QtdVendas", vAno)

        oFun.Grid_ColumnTitle(grid, "vlrVendasAA", vAno - 1)
        oFun.Grid_ColumnTitle(grid, "vlrVendas", vAno)
    End Sub

    'Protected Sub btnAtualiza_Click(sender As Object, e As EventArgs) Handles btnAtualiza.Click
    '    lblInfo.Text = "Session(sPRODUTO) " & Session("sPRODUTO") & " <br> Session(sDIA_INICIAL) " & Session("sDIA_INICIAL") & " <br> Session(sDIA_FINAL) " & Session("sDIA_FINAL")

    '    'If Session("sDIA_FINAL") = DateAndTime.Today Then
    '    '    oFun.Grid_Column_Visible(grid, "Estoque_Qtde", True)
    '    '    oFun.Grid_ColumnTitle(grid, "Estoque_Qtde", "Estoque Qtde em <br> " & DateAndTime.Today.Date & " <br> as 06:00 horas")
    '    'Else
    '    '    oFun.Grid_Column_Visible(grid, "Estoque_Qtde", False)
    '    'End If

    'End Sub

End Class

