
#Region " Imports"

Imports DevExpress.Web
Imports System
Imports System.Data.SqlClient
Imports System.Data

#End Region

Partial Class MemberPages_Flash_SLV005_Perdas
    Inherits System.Web.UI.Page

    Private connDW As String = clData_DW_Condor.dbConnect
    Dim oFun As New Funcoes
    Dim oVem As New VendaEmpresaMes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            Dim vAno As String = Year(DateAndTime.Today.AddDays(-1))
            Dim vMes As String = MonthName(Month(DateAndTime.Today.AddDays(-1)))

            oVem.AtualizarEstatisticaPrograma(370, Page.User.Identity.Name)
            box1.Visible = False
            box2.Visible = False

            Session("sFILIAL") = cboFilial.CallFilial
            Session("sTIPO") = 1
            Session("sMERCADOLOGICO") = 1
            Session("sPRODUTO") = 0
            Session("sPRODUTO_SECAO") = 0
            Session("sSUBGRUPO_SECAO") = 0
            Session("sPRODUTO_SUBGRUPO") = 0
            Session("sDEPARTAMENTO10") = 1

            chartPercentual.ToolTip = "O mês de " & vMes & " de " & vAno & " sempre será do dia primeiro do mes até ontem."

        End If

    End Sub


    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            On Error Resume Next
            Dim oVem As New VendaEmpresaMes

            cboPeriodo.Visible_MesAnterior = False
            cboPeriodo.Visible_MesmosDias = False
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

            chartPercentual.DataBind()

            'gvMaster.DataBind()
            'adsProducts.SelectParameters("idProdutoSecao").DefaultValue = gvMaster.GetRowValues(gvMaster.FocusedRowIndex, "idProdutoSecao").ToString()

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Perdas por Nivel - PGR395"
            CType(Master.FindControl("lblTitle"), Label).ToolTip = "Analise das informações de Perdas por Nivel"
        End If

    End Sub

    Private Sub CallSession()

        Session("sDATA_INICIAL") = Me.cboPeriodo.CallDiaInicial
        Session("sDATA_FINAL") = Me.cboPeriodo.CallDiaFinal

        Session("sOPCAO") = 1
        Session("sMERCADOLOGICO") = 1

        Session("sFILIAL") = cboFilial.CallFilial

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

        ' DEPARTAMENTO 10
        If chkDepartamento10.Checked = True Then
            Session("sDEPARTAMENTO10") = 1  'MES ANTERIOR
        Else
            Session("sDEPARTAMENTO10") = 0  'ANO ANTERIOR
        End If

        ' lblError.Text = "sFILIAL = " & Session("sFILIAL")

    End Sub

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



#Region " GRID -  gvMaster"

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
            oFun.Grid_Column_Visible(gvMaster, "percMargemFinal_AT", True)
        Else
            oFun.Grid_Column_Visible(gvMaster, "vlrLucroFinal_AT", False)
            oFun.Grid_Column_Visible(gvMaster, "percMargemFinal_AT", False)
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

        oFun.CheckBoxStatusExibir(chkMeta_Agenda23, gvMaster, "bandMetaAg23")



    End Sub

    Protected Sub gvMaster_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gvMaster.CustomSummaryCalculate
        On Error Resume Next
        oFun.Grid_Footer_Calculate(sender, e, gvMaster, "percDiv", "vlrDivergencia_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gvMaster, "percAg23", "vlrAg23_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gvMaster, "percTotalPerda", "vlrTotalPerda_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gvMaster, "percMargemFinal_AT", "vlrLucroFinal_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gvMaster, "precoMedio_AT", "vlrVenda_AT", "Qtde_AT", Funcoes.CalculateType.Division)

        ' ---

        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)

        If e.IsTotalSummary Then
            If summary.FieldName = "percAtingMetaAg23" Then
                Dim i_vlrAg23_AT As Decimal = Convert.ToDecimal(gvMaster.GetTotalSummaryValue(gvMaster.TotalSummary("vlrAg23_AT")))
                Dim i_vlrAg23_meta As Decimal = Convert.ToDecimal(gvMaster.GetTotalSummaryValue(gvMaster.TotalSummary("vlrAg23_meta")))
                e.TotalValue = (((i_vlrAg23_AT / i_vlrAg23_meta) * 100) - 100) * -1
            End If

        End If

    End Sub

    Protected Sub gvMaster_SummaryDisplayText(sender As Object, e As ASPxGridViewSummaryDisplayTextEventArgs) Handles gvMaster.SummaryDisplayText

        oFun.Grid_Color_By_Column_Footer_DisplayText(sender, e, gvMaster, "vlrTotalPerda_AT", Drawing.Color.Red, Drawing.Color.Black, True)
        oFun.Grid_Color_By_Column_Footer_DisplayText(sender, e, gvMaster, "percTotalPerda", Drawing.Color.Red, Drawing.Color.Black, True)

        oFun.Grid_Color_By_Column_Footer_DisplayText(sender, e, gvMaster, "vlrDivergencia_AT", Drawing.Color.Red, Drawing.Color.Black, True)
        oFun.Grid_Color_By_Column_Footer_DisplayText(sender, e, gvMaster, "percDiv", Drawing.Color.Red, Drawing.Color.Black, True)
        oFun.Grid_Color_By_Column_Footer_DisplayText(sender, e, gvMaster, "vlrAg23_AT", Drawing.Color.Red, Drawing.Color.Black, True)
        oFun.Grid_Color_By_Column_Footer_DisplayText(sender, e, gvMaster, "percAg23", Drawing.Color.Red, Drawing.Color.Black, True)

        oFun.Grid_Color_By_Column_Footer_DisplayText(sender, e, gvMaster, "vlrAg23_meta", Drawing.Color.Green, Drawing.Color.Green, True)
       

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

        oFun.Grid_Calculate(e, "percDiv", "vlrDivergencia_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Calculate(e, "percAg23", "vlrAg23_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)


        oFun.Grid_Calculate(e, "percTotalPerda", "vlrTotalPerda_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)


    End Sub

    Protected Sub gvMaster_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gvMaster.HtmlFooterCellPrepared

        'oFun.Grid_RedIsNegativeFooter(sender, e)

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

    Protected Sub gvMaster_DataBound(sender As Object, e As EventArgs) Handles gvMaster.DataBound
        If Not IsPostBack Then
            DirectCast(sender, ASPxGridView).FocusedRowIndex = -1
        End If
    End Sub

#End Region

#Region " GRID - gvFamilia "

    Protected Sub gvFamilia_CustomCallback(sender As Object, e As ASPxGridViewCustomCallbackEventArgs) Handles gvFamilia.CustomCallback

        On Error Resume Next

        Dim categoryId As String = gvMaster.GetRowValues(gvMaster.FocusedRowIndex, "idProdutoSecao").ToString()

        Session("sPRODUTO_SECAO") = categoryId

        dsFamilia.SelectParameters("idProdutoSecao").DefaultValue = categoryId
        gvFamilia.DataBind()



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
            oFun.Grid_Column_Visible(gvFamilia, "percMargemFinal_AT", True)
        Else
            oFun.Grid_Column_Visible(gvFamilia, "vlrLucroTotal", False)
            oFun.Grid_Column_Visible(gvFamilia, "percMargemFinal_AT", False)
        End If

        ' Preco Medio
        If chkPrecoMedio.Checked = True Then
            oFun.Grid_Column_Visible(gvFamilia, "precoMedio", True)
        Else
            oFun.Grid_Column_Visible(gvFamilia, "precoMedio", False)
        End If

    End Sub

    Protected Sub gvFamilia_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gvFamilia.CustomSummaryCalculate
        On Error Resume Next
        oFun.Grid_Footer_Calculate(sender, e, gvFamilia, "percDiv", "vlrDivergencia_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gvFamilia, "percAg23", "vlrAg23_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gvFamilia, "percTotalPerda", "vlrTotalPerda_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gvFamilia, "percMargemFinal_AT", "vlrLucroTotal", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gvFamilia, "precoMedio_AT", "vlrVenda_AT", "QtdVendas", Funcoes.CalculateType.Division)

    End Sub

    Protected Sub gvFamilia_CustomUnboundColumnData(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDataEventArgs) Handles gvFamilia.CustomUnboundColumnData
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

    Protected Sub gvFamilia_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gvFamilia.HtmlFooterCellPrepared

        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

    Protected Sub gvFamilia_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gvFamilia.HtmlDataCellPrepared
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

    Protected Sub gvFamilia_DataBound(sender As Object, e As EventArgs) Handles gvFamilia.DataBound
        If Not IsPostBack Then
            DirectCast(sender, ASPxGridView).FocusedRowIndex = -1
        End If
    End Sub

#End Region

#Region " GRID - gvDetail"

    Protected Sub gvDetail_CustomCallback(sender As Object, e As ASPxGridViewCustomCallbackEventArgs) Handles gvDetail.CustomCallback

        On Error Resume Next

        If rndItensFamilia.Checked = True Then
            Session("sSUBGRUPO_SECAO") = 1
            Dim categoryId As String = gvFamilia.GetRowValues(gvFamilia.FocusedRowIndex, "idProdutoSubgrupo").ToString()

            Session("sPRODUTO_SUBGRUPO") = categoryId
            adsProducts.SelectParameters("idProdutoSubgrupo").DefaultValue = categoryId
        End If

        If rndItensSecao.Checked = True Then
            Session("sSUBGRUPO_SECAO") = 2
            Dim categoryId As String = gvMaster.GetRowValues(gvMaster.FocusedRowIndex, "idProdutoSecao").ToString()

            Session("sPRODUTO_SUBGRUPO") = categoryId
            adsProducts.SelectParameters("idProdutoSubgrupo").DefaultValue = categoryId
        End If


        gvDetail.DataBind()

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
            oFun.Grid_Column_Visible(gvDetail, "percMargemFinal", True)
        Else
            oFun.Grid_Column_Visible(gvDetail, "vlrLucroTotal", False)
            oFun.Grid_Column_Visible(gvDetail, "percMargemFinal", False)
        End If

        ' Preco Medio
        If chkPrecoMedio.Checked = True Then
            oFun.Grid_Column_Visible(gvDetail, "precoMedio", True)
        Else
            oFun.Grid_Column_Visible(gvDetail, "precoMedio", False)
        End If

  

    End Sub

    Protected Sub gvDetail_CustomUnboundColumnData(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDataEventArgs) Handles gvDetail.CustomUnboundColumnData
        On Error Resume Next

        oFun.Grid_Calculate(e, "percDiv", "vlrDivergencia_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Calculate(e, "percAg23", "vlrAg23_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Calculate(e, "percTotalPerda", "vlrTotalPerda_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)

        oFun.Grid_Calculate(e, "percMargemFinal", "vlrLucroTotal", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)


    End Sub

    Protected Sub gvDetail_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gvDetail.CustomSummaryCalculate

        oFun.Grid_Footer_Calculate(sender, e, gvDetail, "percDiv", "vlrDivergencia_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gvDetail, "percAg23", "vlrAg23_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gvDetail, "percTotalPerda", "vlrTotalPerda_AT", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gvDetail, "percMargemFinal", "vlrLucroTotal", "vlrVenda_AT", Funcoes.CalculateType.ValueOverRevenue)


    End Sub

    Protected Sub gvDetail_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gvDetail.HtmlDataCellPrepared
        On Error Resume Next
        oFun.Grid_RedIsNegative(e, "percCresc_Venda")
        oFun.Grid_RedIsNegative(e, "percAtingMetaVlr")
        oFun.Grid_RedIsNegative(e, "difPercMargem")

        oFun.Grid_RedIsNegative(e, "percMargem_AT")

        oFun.Grid_RedIsNegative(e, "difValorMeta")
        oFun.Grid_RedIsNegative(e, "difValorMetaLucro")
        oFun.Grid_RedIsNegative(e, "percAtingMetaLucro")

        oFun.Grid_RedIsNegative(e, "vlrLucro_AT")

        oFun.Grid_RedIsNegative(e, "vlrDivergencia_AT")
        oFun.Grid_RedIsNegative(e, "vlrAg23_AT")
        oFun.Grid_RedIsNegative(e, "vlrTotalPerda_AT")

        oFun.Grid_RedIsNegative(e, "percDiv")
        oFun.Grid_RedIsNegative(e, "percAg23")
        oFun.Grid_RedIsNegative(e, "percTotalPerda")




    End Sub

    Protected Sub gvDetail_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gvDetail.HtmlFooterCellPrepared

        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

    Protected Sub gvDetail_DataBound(sender As Object, e As EventArgs) Handles gvDetail.DataBound
        If Not IsPostBack Then
            DirectCast(sender, ASPxGridView).FocusedRowIndex = -1
        End If
    End Sub

#End Region


    Protected Sub graph_item_CustomCallback(sender As Object, e As DevExpress.XtraCharts.Web.CustomCallbackEventArgs) Handles graph_item.CustomCallback

        Dim categoryId As String = gvDetail.GetRowValues(gvDetail.FocusedRowIndex, "idProduto").ToString()

        Session("sPRODUTO") = categoryId

        dsGrafico.SelectParameters("idProduto").DefaultValue = categoryId

        graph_item.DataBind()

    End Sub

    Protected Sub graph_secao_CustomCallback(sender As Object, e As DevExpress.XtraCharts.Web.CustomCallbackEventArgs) Handles graph_secao.CustomCallback

        Dim categoryId As String = gvMaster.GetRowValues(gvMaster.FocusedRowIndex, "idProdutoSecao").ToString()

        dsGraficoSecao.SelectParameters("idProdutoSecao").DefaultValue = categoryId
        graph_secao.DataBind()

    End Sub

    Protected Sub graph_familia_CustomCallback(sender As Object, e As DevExpress.XtraCharts.Web.CustomCallbackEventArgs) Handles graph_familia.CustomCallback

        Dim categoryId As String = gvFamilia.GetRowValues(gvFamilia.FocusedRowIndex, "idProdutoSubgrupo").ToString()

        dsGraficoFamilia.SelectParameters("idProdutoSubgrupo").DefaultValue = categoryId
        graph_familia.DataBind()

    End Sub


    Protected Sub cboPanel_Callback(sender As Object, e As CallbackEventArgsBase) Handles cboPanel.Callback
        ' On Error Resume Next

        Session("sPRODUTO") = 0
        Session("sPRODUTO_SECAO") = 0
        Session("sSUBGRUPO_SECAO") = 0
        Session("sPRODUTO_SUBGRUPO") = 0

        Call CallSession()

        chartPercentual.DataBind()

        gvMaster.Visible = True
        'gvMasterLojas.Visible = False
        'gvLojas.Visible = False
        gvDetail.Visible = True

        gvMaster.DataBind()
        gvFamilia.DataBind()
        gvDetail.DataBind()

        graph_familia.DataBind()
        graph_item.DataBind()

        'btnBotaoGrafico.Visible = True
        'oFun.Grid_Title(gvDetail, "Perdas por Item")

        'graph_item.Visible = True

    End Sub


 
End Class
