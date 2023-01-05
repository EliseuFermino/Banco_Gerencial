#Region " Imports"

Imports DevExpress.Web
Imports System
Imports System.Data.SqlClient
Imports System.Data

#End Region

Partial Class MemberPages_SLV_SLV005_Perdas
    Inherits System.Web.UI.Page

    Private connDW As String = clData_DW_Condor.dbConnect
    Dim oFun As New Funcoes
    Dim oVem As New VendaEmpresaMes

#Region " Variaveis Ultima Linha"

    Private Qtde_AA As Decimal = 0
    Private vlrVenda_AA As Decimal = 0
    Private vlrLucro_AA As Decimal = 0
    Private vlrLucroSellout_AA As Decimal = 0
    Private vlrCAI_AA As Decimal = 0

    Private Qtde_AT As Decimal = 0
    Private vlrVenda_AT As Decimal = 0
    Private vlrLucro_AT As Decimal = 0
    Private vlrLucroSellout_AT As Decimal = 0
    Private vlrCAI_AT As Decimal = 0

    Private vlrVenda_meta As Decimal = 0
    Private vlrLucro_meta As Decimal = 0
    Private difValorMeta As Decimal = 0
    Private difValorMetaLucro As Decimal = 0

    Private percMargem_AA As Decimal = 0
    Private percMargem_AT As Decimal = 0
    Private percPart_AA As Decimal = 0
    Private percPart_AT As Decimal = 0

    Private percCresc_Venda As Decimal = 0
    Private percCresc_Qtde As Decimal = 0
    Private percCresc_Lucro As Decimal = 0

    Private percAtingMetaVlr As Decimal = 0
    Private percAtingMetaLucro As Decimal = 0
    Private percMargem_meta As Decimal = 0
    Private difPercMargem As Decimal = 0

    Private percCAI_AA As Decimal = 0
    Private percCAI_AT As Decimal = 0

    Private vlrLucroFinal_AT As Decimal = 0
    Private percMargemSellout_AT As Decimal = 0
    Private percMargemFinal_AT As Decimal = 0

    Private vlrLucroFinal_AA As Decimal = 0
    Private percMargemSellout_AA As Decimal = 0
    Private percMargemFinal_AA As Decimal = 0

    Private vlrAgenda23 As Decimal = 0
    Private vlrMetaAgenda23 As Decimal = 0
    Private difValorMetaAg23 As Decimal = 0
    Private percAtingMetaAg23 As Decimal = 0

    Private precoMedio_AA As Decimal = 0
    Private precoMedio_AT As Decimal = 0

    Private percCrescReal As Decimal = 0
    Private precoMedioCresc As Decimal = 0

    Private percAtingMetaVlrG As Decimal = 0



#End Region

    Protected Sub gvDetail_AfterPerformCallback(sender As Object, e As ASPxGridViewAfterPerformCallbackEventArgs) Handles gvDetail.AfterPerformCallback

        If chkVendas.Checked = True Then
            oFun.Grid_Column_Visible(gvDetail, "vlrVenda_AT", True)
        Else
            oFun.Grid_Column_Visible(gvDetail, "vlrVenda_AT", False)
        End If

        ' Volume
        If chkVolume.Checked = True Then
            oFun.Grid_Column_Visible(gvDetail, "QtdVendas", True)
        Else
            oFun.Grid_Column_Visible(gvDetail, "QtdVendas", False)
        End If

        ' Lucro Total
        If chkMargem.Checked = True Then
            oFun.Grid_Column_Visible(gvDetail, "vlrLucroTotal", True)
        Else
            oFun.Grid_Column_Visible(gvDetail, "vlrLucroTotal", False)
        End If

        ' Preco Medio
        If chkPrecoMedio.Checked = True Then
            oFun.Grid_Column_Visible(gvDetail, "precoMedio", True)
        Else
            oFun.Grid_Column_Visible(gvDetail, "precoMedio", False)
        End If

        ' Numero de Clentes
        If chkNumClientes.Checked = True Then
            oFun.Grid_Column_Visible(gvDetail, "numCliente", True)
        Else
            oFun.Grid_Column_Visible(gvDetail, "numCliente", False)
        End If

    End Sub

    Protected Sub gvFamilia_AfterPerformCallback(sender As Object, e As ASPxGridViewAfterPerformCallbackEventArgs) Handles gvFamilia.AfterPerformCallback

        If chkVendas.Checked = True Then
            oFun.Grid_Column_Visible(gvFamilia, "vlrVenda_AT", True)
        Else
            oFun.Grid_Column_Visible(gvFamilia, "vlrVenda_AT", False)
        End If

        ' Volume
        If chkVolume.Checked = True Then
            oFun.Grid_Column_Visible(gvFamilia, "QtdVendas", True)
        Else
            oFun.Grid_Column_Visible(gvFamilia, "QtdVendas", False)
        End If

        ' Lucro Total
        If chkMargem.Checked = True Then
            oFun.Grid_Column_Visible(gvFamilia, "vlrLucroTotal", True)
        Else
            oFun.Grid_Column_Visible(gvFamilia, "vlrLucroTotal", False)
        End If

        ' Preco Medio
        If chkPrecoMedio.Checked = True Then
            oFun.Grid_Column_Visible(gvFamilia, "precoMedio", True)
        Else
            oFun.Grid_Column_Visible(gvFamilia, "precoMedio", False)
        End If

        '' Numero de Clentes
        'If chkNumClientes.Checked = True Then
        '    oFun.Grid_Column_Visible(gvFamilia, "numCliente", True)
        'Else
        '    oFun.Grid_Column_Visible(gvFamilia, "numCliente", False)
        'End If

    End Sub

    Protected Sub gvFamilia_CustomCallback(sender As Object, e As ASPxGridViewCustomCallbackEventArgs) Handles gvFamilia.CustomCallback

        Dim categoryId As String = gvMaster.GetRowValues(gvMaster.FocusedRowIndex, "idProdutoSecao").ToString()

        dsFamilia.SelectParameters("idProdutoSecao").DefaultValue = categoryId
        gvFamilia.DataBind()

    End Sub

    Protected Sub gvDetail_CustomCallback(sender As Object, e As ASPxGridViewCustomCallbackEventArgs) Handles gvDetail.CustomCallback

        Dim categoryId As String = gvFamilia.GetRowValues(gvFamilia.FocusedRowIndex, "idProdutoSubgrupo").ToString()

        adsProducts.SelectParameters("idProdutoSubgrupo").DefaultValue = categoryId
        gvDetail.DataBind()

    End Sub

    Protected Sub graph_item_CustomCallback(sender As Object, e As DevExpress.XtraCharts.Web.CustomCallbackEventArgs) Handles graph_item.CustomCallback

        Dim categoryId As String = gvDetail.GetRowValues(gvDetail.FocusedRowIndex, "idProduto").ToString()

        dsGrafico.SelectParameters("idProduto").DefaultValue = categoryId
        graph_item.DataBind()

    End Sub


    Protected Sub gvLojas_CustomCallback(sender As Object, e As ASPxGridViewCustomCallbackEventArgs) Handles gvLojas.CustomCallback

        Dim categoryId As String = gvMasterLojas.GetRowValues(gvMasterLojas.FocusedRowIndex, "idProdutoSecao").ToString()

        DSGrid2.SelectParameters("idProdutoSecao").DefaultValue = categoryId
        gvLojas.DataBind()

    End Sub




#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            oFun.Grid_Title(gvMaster, "Perdas por Seção")
            oFun.Grid_Title(gvMasterLojas, "Perdas por Seção")

            oFun.Grid_Title(gvLojas, "Perdas por Loja")
            oFun.Grid_Title(gvDetail, "Perdas por Item")



        End If

        'gvMaster.DataBind()
        'adsProducts.SelectParameters("idProdutoSecao").DefaultValue = gvMaster.GetRowValues(gvMaster.FocusedRowIndex, "idProdutoSecao").ToString()

    End Sub



    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            On Error Resume Next
            Dim oVem As New VendaEmpresaMes

            cboPeriodo.Visible_MesAnterior = True
            cboPeriodo.Visible_MesmosDias = True
            CallSession()

            cboFilial.AutoPostBack = False

            'Me.grid.Settings.ShowFilterRow = False
            ' oVem.AtualizarEstatisticaPrograma(137, User.Identity.Name)

            'Call LimparGrid()
           
            ' -----------

            Dim iProj As New Projeto
            If LCase(LTrim(RTrim(iProj.BuscarDepartamentoDoUsuario(Page.User.Identity.Name)))) = "comercial" Then
                Session("sTIPO_LISTA") = 1  ' Comprador
                Session("sMATRICULA") = Page.User.Identity.Name
            ElseIf LCase(LTrim(RTrim(iProj.BuscarDepartamentoDoUsuario(Page.User.Identity.Name)))) = "gestor_comercial" Then
                Session("sTIPO_LISTA") = 2  ' Gestor_Comercial
                Session("sMATRICULA") = Page.User.Identity.Name
            Else
                Session("sTIPO_LISTA") = 0  ' Todos
            End If

            Session("sMES_ANTERIOR") = 2

            ' -----------

            Call Titulos()

            gvMaster.DataBind()
            adsProducts.SelectParameters("idProdutoSecao").DefaultValue = gvMaster.GetRowValues(gvMaster.FocusedRowIndex, "idProdutoSecao").ToString()


        End If
    End Sub



    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Vendas Por Departamento e Seção - Visão 1 - PGR188"
            CType(Master.FindControl("lblTitle"), Label).ToolTip = "Analise as informações de Volume (Qtde), Venda, Lucro, Margem e Participação do Ano Atual, Ano Anterior e Mês Anterior. Há ainda informações de meta de venda e margem e ainda há o % de Crescimento da Venda, Volume e Lucro."
        End If

    End Sub

#End Region


#Region " Grid"

    Protected Sub gvMaster_CustomCallback(sender As Object, e As ASPxGridViewCustomCallbackEventArgs) Handles gvMaster.CustomCallback

        ' CHKS
        ' Vendas
        If chkVendas.Checked = True Then
            oFun.Grid_Column_Visible(gvMaster, "vlrVenda_AT", True)
        Else
            oFun.Grid_Column_Visible(gvMaster, "vlrVenda_AT", False)
        End If

        ' Volume
        If chkVolume.Checked = True Then
            oFun.Grid_Column_Visible(gvMaster, "Qtde_AT", True)
        Else
            oFun.Grid_Column_Visible(gvMaster, "Qtde_AT", False)
        End If

        ' Volume
        If chkMargem.Checked = True Then
            oFun.Grid_Column_Visible(gvMaster, "vlrLucroFinal_AT", True)
        Else
            oFun.Grid_Column_Visible(gvMaster, "vlrLucroFinal_AT", False)
        End If

        ' Volume
        If chkPrecoMedio.Checked = True Then
            oFun.Grid_Column_Visible(gvMaster, "precoMedio_AT", True)
        Else
            oFun.Grid_Column_Visible(gvMaster, "precoMedio_AT", False)
        End If

        If chkNumClientes.Checked = True Then
            oFun.Grid_Column_Visible(gvMaster, "numClienteAT", True)
        Else
            oFun.Grid_Column_Visible(gvMaster, "numClienteAT", False)
        End If







    End Sub

    Protected Sub gvMaster_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gvMaster.CustomSummaryCalculate

        oFun.Grid_Footer_Calculate(sender, e, gvMaster, "percDiv", "vlrDivergencia_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gvMaster, "percAg23", "vlrAg23_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gvMaster, "percTotalPerda", "vlrTotalPerda_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)

    End Sub

    Protected Sub gvMaster_CustomUnboundColumnData(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDataEventArgs) Handles gvMaster.CustomUnboundColumnData
        On Error Resume Next

        'oFun.Grid_Calculate(e, "percAtingMetaVlr", "vlrVenda_AT", "vlrVenda_meta", Funcoes.CalculateType.Growth)        '% Atingimento Meta
        oFun.Grid_Calculate(e, "percAtingMetaLucro", "vlrLucro_AT", "vlrLucro_meta", Funcoes.CalculateType.Growth)      '% Antingimento do Lucro
        oFun.Grid_Calculate(e, "difPercMargem", "percMargem_AT", "percMargem_meta", Funcoes.CalculateType.Decrease)     'Diferença de % de Margem
        oFun.Grid_Calculate(e, "difValorMeta", "vlrVenda_AT", "vlrVenda_meta", Funcoes.CalculateType.Decrease)          'Diferença valor de meta
        oFun.Grid_Calculate(e, "difValorMetaLucro", "vlrLucro_AT", "vlrLucro_meta", Funcoes.CalculateType.Decrease)     'Diferença Valor Meta de Lucro
        oFun.Grid_Calculate(e, "percCAI_AT", "vlrCAI_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)        ' Percentual CAI - AT
        oFun.Grid_Calculate(e, "percCAI_AA", "vlrCAI_AA", "vlrVenda_AA", Funcoes.CalculateType.ValueOverRevenue)        ' Percentual CAI - AA
        oFun.Grid_Calculate(e, "difValorMetaAg23", "vlrAg23_meta", "vlrAg23", Funcoes.CalculateType.Decrease)     'Diferença Valor Meta de Agenda 23
        oFun.Grid_Calculate(e, "percAtingMetaAg23", "vlrAg23_meta", "vlrAg23", Funcoes.CalculateType.Growth)      '% Antingimento da Agenda 23

        oFun.Grid_Calculate(e, "percDiv", "vlrDivergencia_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Calculate(e, "percAg23", "vlrAg23_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Calculate(e, "percTotalPerda", "vlrTotalPerda_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)

    End Sub



    Protected Sub gvMaster_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gvMaster.HtmlFooterCellPrepared

        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

    Protected Sub gvMaster_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gvMaster.HtmlDataCellPrepared
        On Error Resume Next
        oFun.Grid_RedIsNegative(e, "percCresc_Venda")
        oFun.Grid_RedIsNegative(e, "percAtingMetaVlr")
        oFun.Grid_RedIsNegative(e, "difPercMargem")

        oFun.Grid_RedIsNegative(e, "percCresc_Qtde")
        oFun.Grid_RedIsNegative(e, "percCresc_Lucro")

        oFun.Grid_RedIsNegative(e, "percMargem_AT")
        oFun.Grid_RedIsNegative(e, "percMargem_AA")

        oFun.Grid_RedIsNegative(e, "difValorMeta")
        oFun.Grid_RedIsNegative(e, "difValorMetaLucro")
        oFun.Grid_RedIsNegative(e, "percAtingMetaLucro")

        oFun.Grid_RedIsNegative(e, "difValorMetaAg23")
        oFun.Grid_RedIsNegative(e, "percAtingMetaAg23")
        oFun.Grid_RedIsNegative(e, "vlrLucro_AT")
        oFun.Grid_RedIsNegative(e, "vlrLucro_AA")

        oFun.Grid_RedIsNegative(e, "precoMedioCresc")
        oFun.Grid_RedIsNegative(e, "percCrescReal")

        oFun.Grid_RedIsNegative(e, "vlrDivergencia_AT")
        oFun.Grid_RedIsNegative(e, "vlrAg23_AT")
        oFun.Grid_RedIsNegative(e, "vlrTotalPerda_AT")

        oFun.Grid_RedIsNegative(e, "percDiv")
        oFun.Grid_RedIsNegative(e, "percAg23")
        oFun.Grid_RedIsNegative(e, "percTotalPerda")




    End Sub

    Protected Sub gvMaster_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles gvMaster.HtmlRowPrepared

        oFun.grid_RowSelectedWhole(gvMaster, e, "descId", "Depto 1 - Mercearia", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gvMaster, e, "descId", "Depto 2 - Pereciveis", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gvMaster, e, "descId", "Depto 3 - Bazar", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gvMaster, e, "descId", "Depto 4 - Textil", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gvMaster, e, "descId", "Depto 5 - Eletro", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gvMaster, e, "descId", "Total", Drawing.Color.LightGreen, True)

    End Sub



#End Region

#Region " Grid"

    Protected Sub gvMasterLojas_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gvMasterLojas.CustomSummaryCalculate

        oFun.Grid_Footer_Calculate(sender, e, gvMasterLojas, "percDiv", "vlrDivergencia_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gvMasterLojas, "percAg23", "vlrAg23_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gvMasterLojas, "percTotalPerda", "vlrTotalPerda_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)

    End Sub

    Protected Sub gvMasterLojas_CustomUnboundColumnData(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDataEventArgs) Handles gvMasterLojas.CustomUnboundColumnData
        On Error Resume Next

        'oFun.Grid_Calculate(e, "percAtingMetaVlr", "vlrVenda_AT", "vlrVenda_meta", Funcoes.CalculateType.Growth)        '% Atingimento Meta
        oFun.Grid_Calculate(e, "percAtingMetaLucro", "vlrLucro_AT", "vlrLucro_meta", Funcoes.CalculateType.Growth)      '% Antingimento do Lucro
        oFun.Grid_Calculate(e, "difPercMargem", "percMargem_AT", "percMargem_meta", Funcoes.CalculateType.Decrease)     'Diferença de % de Margem
        oFun.Grid_Calculate(e, "difValorMeta", "vlrVenda_AT", "vlrVenda_meta", Funcoes.CalculateType.Decrease)          'Diferença valor de meta
        oFun.Grid_Calculate(e, "difValorMetaLucro", "vlrLucro_AT", "vlrLucro_meta", Funcoes.CalculateType.Decrease)     'Diferença Valor Meta de Lucro
        oFun.Grid_Calculate(e, "percCAI_AT", "vlrCAI_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)        ' Percentual CAI - AT
        oFun.Grid_Calculate(e, "percCAI_AA", "vlrCAI_AA", "vlrVenda_AA", Funcoes.CalculateType.ValueOverRevenue)        ' Percentual CAI - AA
        oFun.Grid_Calculate(e, "difValorMetaAg23", "vlrAg23_meta", "vlrAg23", Funcoes.CalculateType.Decrease)     'Diferença Valor Meta de Agenda 23
        oFun.Grid_Calculate(e, "percAtingMetaAg23", "vlrAg23_meta", "vlrAg23", Funcoes.CalculateType.Growth)      '% Antingimento da Agenda 23

        oFun.Grid_Calculate(e, "percDiv", "vlrDivergencia_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Calculate(e, "percAg23", "vlrAg23_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Calculate(e, "percTotalPerda", "vlrTotalPerda_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)

    End Sub

  

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gvMasterLojas.HtmlFooterCellPrepared

        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gvMasterLojas.HtmlDataCellPrepared
        On Error Resume Next
        oFun.Grid_RedIsNegative(e, "percCresc_Venda")
        oFun.Grid_RedIsNegative(e, "percAtingMetaVlr")
        oFun.Grid_RedIsNegative(e, "difPercMargem")

        oFun.Grid_RedIsNegative(e, "percCresc_Qtde")
        oFun.Grid_RedIsNegative(e, "percCresc_Lucro")

        oFun.Grid_RedIsNegative(e, "percMargem_AT")
        oFun.Grid_RedIsNegative(e, "percMargem_AA")

        oFun.Grid_RedIsNegative(e, "difValorMeta")
        oFun.Grid_RedIsNegative(e, "difValorMetaLucro")
        oFun.Grid_RedIsNegative(e, "percAtingMetaLucro")

        oFun.Grid_RedIsNegative(e, "difValorMetaAg23")
        oFun.Grid_RedIsNegative(e, "percAtingMetaAg23")
        oFun.Grid_RedIsNegative(e, "vlrLucro_AT")
        oFun.Grid_RedIsNegative(e, "vlrLucro_AA")

        oFun.Grid_RedIsNegative(e, "precoMedioCresc")
        oFun.Grid_RedIsNegative(e, "percCrescReal")

        oFun.Grid_RedIsNegative(e, "vlrDivergencia_AT")
        oFun.Grid_RedIsNegative(e, "vlrAg23_AT")
        oFun.Grid_RedIsNegative(e, "vlrTotalPerda_AT")

        oFun.Grid_RedIsNegative(e, "percDiv")
        oFun.Grid_RedIsNegative(e, "percAg23")
        oFun.Grid_RedIsNegative(e, "percTotalPerda")




    End Sub

    Protected Sub grid_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles gvMasterLojas.HtmlRowPrepared

        oFun.grid_RowSelectedWhole(gvMasterLojas, e, "descId", "Depto 1 - Mercearia", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gvMasterLojas, e, "descId", "Depto 2 - Pereciveis", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gvMasterLojas, e, "descId", "Depto 3 - Bazar", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gvMasterLojas, e, "descId", "Depto 4 - Textil", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gvMasterLojas, e, "descId", "Depto 5 - Eletro", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gvMasterLojas, e, "descId", "Total", Drawing.Color.LightGreen, True)

    End Sub

#End Region




#Region " Grid 2 "

    Protected Sub gvDetail_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gvDetail.HtmlFooterCellPrepared

        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

    Protected Sub gvDetail_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gvDetail.CustomSummaryCalculate

        oFun.Grid_Footer_Calculate(sender, e, gvDetail, "percDiv", "vlrDivergencia_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gvDetail, "percAg23", "vlrAg23_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gvDetail, "percTotalPerda", "vlrTotalPerda_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)

    End Sub

    Protected Sub gvDetail_CustomUnboundColumnData(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDataEventArgs) Handles gvDetail.CustomUnboundColumnData
        On Error Resume Next

        oFun.Grid_Calculate(e, "percDiv", "vlrDivergencia_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Calculate(e, "percAg23", "vlrAg23_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Calculate(e, "percTotalPerda", "vlrTotalPerda_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)

    End Sub

    Protected Sub gvDetail_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gvDetail.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "vlrDivergencia_AT")
        oFun.Grid_RedIsNegative(e, "vlrAg23_AT")
        oFun.Grid_RedIsNegative(e, "vlrTotalPerda_AT")

        oFun.Grid_RedIsNegative(e, "percDiv")
        oFun.Grid_RedIsNegative(e, "percAg23")
        oFun.Grid_RedIsNegative(e, "percTotalPerda")

    End Sub

#End Region

#Region " Grid Detail Lojas "

    Protected Sub gvLojas_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gvLojas.HtmlFooterCellPrepared

        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

    Protected Sub gvLojas_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gvLojas.CustomSummaryCalculate

        oFun.Grid_Footer_Calculate(sender, e, gvLojas, "percDiv", "vlrDivergencia_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gvLojas, "percAg23", "vlrAg23_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gvLojas, "percTotalPerda", "vlrTotalPerda_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)

    End Sub

    Protected Sub gvLojas_CustomUnboundColumnData(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDataEventArgs) Handles gvLojas.CustomUnboundColumnData
        On Error Resume Next

        oFun.Grid_Calculate(e, "percDiv", "vlrDivergencia_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Calculate(e, "percAg23", "vlrAg23_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Calculate(e, "percTotalPerda", "vlrTotalPerda_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)

    End Sub

    Protected Sub gvLojas_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gvLojas.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "vlrDivergencia_AT")
        oFun.Grid_RedIsNegative(e, "vlrAg23_AT")
        oFun.Grid_RedIsNegative(e, "vlrTotalPerda_AT")

        oFun.Grid_RedIsNegative(e, "percDiv")
        oFun.Grid_RedIsNegative(e, "percAg23")
        oFun.Grid_RedIsNegative(e, "percTotalPerda")

    End Sub

#End Region


#Region " SESSION"

    Private Sub CallSession()

        On Error Resume Next

        Session("sFILIAL") = Me.cboFilial.CallFilial
        Session("sDATA_INICIAL") = Me.cboPeriodo.CallDiaInicial
        Session("sDATA_FINAL") = Me.cboPeriodo.CallDiaFinal


        If cboPeriodo.Checked_MesmosDias = True Then
            Session("sMESMOSDIAS") = 2  'Mesmos Dias
        Else
            Session("sMESMOSDIAS") = 1  'Normal
        End If


        ' MES ANTERIOR
        If cboPeriodo.Checked_MesAnterior = True Then
            Session("sMES_ANTERIOR") = 2  'MES ANTERIOR
        Else
            Session("sMES_ANTERIOR") = 1  'ANO ANTERIOR
        End If
    End Sub

#End Region

    Private Sub Titulos()

        Dim vAno As Int16
        Dim vMes As Byte

        vAno = Session("sANO")
        vMes = Session("sMES")

        If vMes = 1 Then
            If cboPeriodo.Checked_MesAnterior = True Then
                oFun.Grid_ColumnTitle(gvMaster, "bandAnoAnterior", MonthName(12) & " de " & vAno - 1)
                oFun.Grid_ColumnTitle(gvMaster, "bandAnoAtual", MonthName(vMes) & " de " & vAno)
            End If
        Else
            If cboPeriodo.Checked_MesAnterior = True Then
                oFun.Grid_ColumnTitle(gvMaster, "bandAnoAnterior", MonthName(vMes - 1) & " de " & vAno)
                oFun.Grid_ColumnTitle(gvMaster, "bandAnoAtual", MonthName(vMes) & " de " & vAno)
            End If
        End If

        If cboPeriodo.Checked_MesAnterior = False Then
            oFun.Grid_ColumnTitle(gvMaster, "bandAnoAnterior", "Ano Anterior " & vAno - 1)
            oFun.Grid_ColumnTitle(gvMaster, "bandAnoAtual", "Ano Atual " & vAno)
        End If

    End Sub


    
    Protected Sub cboPanel_Callback(sender As Object, e As CallbackEventArgsBase) Handles cboPanel.Callback
        On Error Resume Next

        Call CallSession()

        If cboFilial.CallFilial = 99 Then
            gvMaster.Visible = False
            gvMasterLojas.Visible = True
            gvDetail.Visible = False
            gvLojas.Visible = True

            gvMasterLojas.DataBind()
            gvLojas.DataBind()

            btnBotaoGrafico.Visible = False
            oFun.Grid_Title(gvLojas, "Perdas por Loja")

            graph_item.Visible = False
        Else

            gvMaster.Visible = True
            gvMasterLojas.Visible = False
            gvLojas.Visible = False
            gvDetail.Visible = True

            gvMaster.DataBind()
            gvDetail.DataBind()

            btnBotaoGrafico.Visible = True
            oFun.Grid_Title(gvDetail, "Perdas por Item")

            

            graph_item.Visible = True
        End If


    End Sub

    Protected Sub gvFamilia_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gvFamilia.CustomSummaryCalculate

        oFun.Grid_Footer_Calculate(sender, e, gvFamilia, "percDiv", "vlrDivergencia_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gvFamilia, "percAg23", "vlrAg23_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gvFamilia, "percTotalPerda", "vlrTotalPerda_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)

    End Sub







    Protected Sub gvFamilia_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles gvFamilia.CustomUnboundColumnData

        oFun.Grid_Calculate(e, "percDiv", "vlrDivergencia_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Calculate(e, "percAg23", "vlrAg23_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Calculate(e, "percTotalPerda", "vlrTotalPerda_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)

    End Sub

    Protected Sub gvFamilia_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gvFamilia.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "vlrDivergencia_AT")
        oFun.Grid_RedIsNegative(e, "vlrAg23_AT")
        oFun.Grid_RedIsNegative(e, "vlrTotalPerda_AT")

        oFun.Grid_RedIsNegative(e, "percDiv")
        oFun.Grid_RedIsNegative(e, "percAg23")
        oFun.Grid_RedIsNegative(e, "percTotalPerda")

    End Sub

    Protected Sub gvFamilia_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gvFamilia.HtmlFooterCellPrepared

        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

End Class
