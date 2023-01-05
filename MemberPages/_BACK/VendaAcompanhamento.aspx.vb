Imports DevExpress.Web
Imports System.Data

Partial Class MemberPages_Vendas_VendaAcompanhamento
    Inherits System.Web.UI.Page

    Private vlrRealAA As Decimal = 0
    Private percDifCresc As Decimal = 0
    Private vlrSugestaoVenda As Decimal = 0
    Private vlrMetaVenda As Decimal = 0
    Private vlrRealVenda As Decimal = 0
    Private percAting As Decimal = 0
    Private percMetaMargem As Decimal = 0
    Private percRealMargem As Decimal = 0
    Private percRealMargemSellOut As Decimal = 0
    Private difMargem As Decimal = 0
    Private vlrMetaMargem As Decimal = 0
    Private vlrRealMargem As Decimal = 0
    Private difLucro As Decimal = 0
    Private percAtingLucro As Decimal = 0
    Private numClientes As Decimal = 0
    Private vlrVendaFunc As Decimal = 0
    Private vlrTicketMedio As Decimal = 0
    Private vlrVendaCheckout As Decimal = 0
    Private vlrVendaMetragem As Decimal = 0
    Private vlrRealVendaClube As Decimal = 0

    Private percRealMargemClube As Decimal = 0
    Private percRealMargemSellOutClube As Decimal = 0
    Private numClientesClube As Decimal = 0
    Private vlrTicketMedioClube As Decimal = 0
    Private vlrRealMargemSellOutKit As Decimal = 0
    Private percRealMargemSellOutKit As Decimal = 0

    Dim oFun As New Funcoes
    Dim oCon As New Conexao

    '*********************************************************************************
    'A atualização do Ranking Diário é feito pelo Stored Procedure
    'gerManager.Ranking.uspRankingDiarioAtualiza_w
    '************************************************************************************

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init

        'Dim oVen As New VendaEmpresaMes
        'oVen.Permissa_Acesso_Programa(sender, e, Page.User.Identity.Name, VendaEmpresaMes.TipoMenu.Menu_Vertical, 12, Request.CurrentExecutionFilePath)

        If Not IsPostBack Then






            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(1, User.Identity.Name)

            If CInt(DateAndTime.Now.Hour) > 9 Then
                'If CInt(DateAndTime.Now.Hour) > 7 Then
                Session("sDIA") = Me.cboDia.CallDia.Date
            Else
                Session("sDIA") = Me.cboDia.CallDia.Date.AddDays(-1)
            End If
            Me.cboDia.CallDia = Session("sDIA")

            Session("sUSUARIO") = LCase(Page.User.Identity.Name)


        End If
    End Sub

    Private Sub AtualizarVendaAno()
        On Error Resume Next
        ' Me.lblVendaAno.Text = CDec(oCon.spScalar_pAno(Conexao.gerManager, "Vendas.uspBuscarVendaEmpresaAno", Year(DateAdd(DateInterval.Day, -1, Me.cboDia.CallDia)))).ToString("n0")
    End Sub

    Protected Sub ASPxGridView1_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles ASPxGridView1.CustomSummaryCalculate
        On Error Resume Next
        Dim myDate As String
        myDate = Me.cboDia.CallDia.Year & "-" & Me.cboDia.CallDia.Month & "-" & Me.cboDia.CallDia.Day

        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Start Then
            vlrRealAA = 0
            percDifCresc = 0
            vlrSugestaoVenda = 0
            vlrMetaVenda = 0
            vlrRealVenda = 0
            percAting = 0
            percMetaMargem = 0
            percRealMargem = 0
            percRealMargemSellOut = 0
            difMargem = 0
            vlrMetaMargem = 0
            vlrRealMargem = 0
            difLucro = 0
            percAtingLucro = 0
            numClientes = 0
            vlrVendaFunc = 0
            vlrTicketMedio = 0
            vlrVendaCheckout = 0
            vlrVendaMetragem = 0
            vlrRealVendaClube = 0

            percRealMargemClube = 0
            percRealMargemSellOutClube = 0
            numClientesClube = 0
            vlrTicketMedioClube = 0
            vlrRealMargemSellOutKit = 0
            percRealMargemSellOutKit = 0

        End If

        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Calculate Then
            Dim myFilter As Int16 = Convert.ToInt16(e.GetValue("idFilial"))
            If myFilter = 253 Then
                vlrRealAA += Convert.ToDecimal(e.GetValue("vlrRealAA"))
                percDifCresc += Convert.ToDecimal(e.GetValue("percDifCresc"))
                vlrSugestaoVenda += Convert.ToDecimal(e.GetValue("vlrSugestaoVenda"))
                vlrMetaVenda += Convert.ToDecimal(e.GetValue("vlrMetaVenda"))
                vlrRealVenda += Convert.ToDecimal(e.GetValue("vlrRealVenda"))
                percAting += Convert.ToDecimal(e.GetValue("percAting"))
                percMetaMargem += Convert.ToDecimal(e.GetValue("percMetaMargem"))
                percRealMargem += Convert.ToDecimal(e.GetValue("percRealMargem"))
                percRealMargemSellOut += Convert.ToDecimal(e.GetValue("percRealMargemSellOut"))
                difMargem += Convert.ToDecimal(e.GetValue("difMargem"))
                vlrMetaMargem += Convert.ToDecimal(e.GetValue("vlrMetaMargem"))
                vlrRealMargem += Convert.ToDecimal(e.GetValue("vlrRealMargem"))
                difLucro += Convert.ToDecimal(e.GetValue("difLucro"))
                percAtingLucro += Convert.ToDecimal(e.GetValue("percAtingLucro"))
                numClientes += Convert.ToDecimal(e.GetValue("numClientes"))
                vlrVendaFunc += Convert.ToDecimal(e.GetValue("vlrVendaFunc"))
                vlrTicketMedio += Convert.ToDecimal(e.GetValue("vlrTicketMedio"))
                vlrVendaCheckout += Convert.ToDecimal(e.GetValue("vlrVendaCheckout"))
                vlrVendaMetragem += Convert.ToDecimal(e.GetValue("vlrVendaMetragem"))
                vlrRealVendaClube += Convert.ToDecimal(e.GetValue("vlrRealVendaClube"))

                percRealMargemClube += Convert.ToDecimal(e.GetValue("percRealMargemClube"))
                percRealMargemSellOutClube += Convert.ToDecimal(e.GetValue("percRealMargemSellOutClube"))
                numClientesClube += Convert.ToDecimal(e.GetValue("numClientesClube"))
                vlrTicketMedioClube += Convert.ToDecimal(e.GetValue("vlrTicketMedioClube"))
                vlrRealMargemSellOutKit += Convert.ToDecimal(e.GetValue("vlrRealMargemSellOutKit"))
                percRealMargemSellOutKit += Convert.ToDecimal(e.GetValue("percRealMargemSellOutKit"))

            End If
        End If

        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Finalize Then
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRealAA" Then e.TotalValue = vlrRealAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percDifCresc" Then e.TotalValue = percDifCresc
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrSugestaoVenda" Then e.TotalValue = vlrSugestaoVenda
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrMetaVenda" Then e.TotalValue = vlrMetaVenda
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRealVenda" Then e.TotalValue = vlrRealVenda
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percAting" Then e.TotalValue = percAting
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMetaMargem" Then e.TotalValue = percMetaMargem
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRealMargem" Then e.TotalValue = percRealMargem
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRealMargemSellOut" Then e.TotalValue = percRealMargemSellOut
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "difMargem" Then e.TotalValue = difMargem
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrMetaMargem" Then e.TotalValue = vlrMetaMargem
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRealMargem" Then e.TotalValue = vlrRealMargem
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "difLucro" Then e.TotalValue = difLucro
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percAtingLucro" Then e.TotalValue = percAtingLucro
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "numClientes" Then e.TotalValue = numClientes
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrVendaFunc" Then e.TotalValue = vlrVendaFunc
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrTicketMedio" Then e.TotalValue = vlrTicketMedio
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrVendaCheckout" Then e.TotalValue = vlrVendaCheckout
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrVendaMetragem" Then e.TotalValue = vlrVendaMetragem
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRealVendaClube" Then e.TotalValue = vlrRealVendaClube

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRealMargemClube" Then e.TotalValue = percRealMargemClube
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRealMargemSellOutClube" Then e.TotalValue = percRealMargemSellOutClube
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "numClientesClube" Then e.TotalValue = numClientesClube
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrTicketMedioClube" Then e.TotalValue = vlrTicketMedioClube
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRealMargemSellOutKit" Then e.TotalValue = vlrRealMargemSellOutKit
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percRealMargemSellOutKit" Then e.TotalValue = percRealMargemSellOutKit

        End If

    End Sub

    Protected Sub ASPxGridView1_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles ASPxGridView1.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "percAting", "100", "20", Funcoes.CalculateType.Growth)

    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared

        On Error Resume Next

        oFun.Grid_RedIsNegative(e, "percAting")
        oFun.Grid_RedIsNegative(e, "percDifCresc")
        oFun.Grid_RedIsNegative(e, "percAtingLucro")
        oFun.Grid_RedIsNegative(e, "difMargem")
        oFun.Grid_RedIsNegative(e, "difLucro")

        oFun.Grid_RedIsNegative(e, "percRealMargem")
        oFun.Grid_RedIsNegative(e, "percRealMargemSellOut")
        oFun.Grid_RedIsNegative(e, "difMargemFinal")
        oFun.Grid_RedIsNegative(e, "percRealMargemClube")
        oFun.Grid_RedIsNegative(e, "vlrRealMargem")


        ' LUCRO 
        'If e.DataColumn.FieldName = "difMargem" Then
        '    If Convert.ToDouble(e.CellValue) < 0 Then
        '        e.Cell.BackColor = System.Drawing.Color.MistyRose
        '    End If
        'End If

        If e.DataColumn.FieldName = "percRealMargemClube" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.BackColor = System.Drawing.Color.MistyRose
            End If
        End If

        If e.DataColumn.FieldName = "percRealMargem" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.BackColor = System.Drawing.Color.MistyRose
            End If
        End If

        If e.DataColumn.FieldName = "vlrRealMargem" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.BackColor = System.Drawing.Color.MistyRose
            End If
        End If


    End Sub

    Protected Sub chkFixar_CheckedChanged(sender As Object, e As EventArgs) Handles chkFixar.CheckedChanged
        If Me.chkFixar.Checked = False Then
            ASPxGridView1.Settings.ShowVerticalScrollBar = False
        Else
            ASPxGridView1.Settings.ShowVerticalScrollBar = True
        End If
    End Sub

#Region " PAGE"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            oFun.Grid_Title(gridAcompanhamentoSupervisor, "Acompanhamento por Regional")
            oFun.Grid_Title(gridAcompanhamentoCidade, "Acompanhamento por Cidade")
            oFun.Grid_Title(gridAcompanhamentoRegiao, "Acompanhamento por Região")

            oFun.Grid_Column_BorderRight(ASPxGridView1, "percDifCresc", Drawing.Color.Gray, BorderStyle.Solid, 2)

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Acompanhamento de Vendas Diárias - PGR1"
            Call AtualizarVendaAno()

            cboFilial_ItensMaisVendidos.Checked_Empresa = True
            cboFilial_ItensMaisVendidos2.Checked_Empresa = True
            cboFilial_ItensLucroNegativo.Checked_Empresa = True
            cboFilial_ItensMaisVendidos.CallFilial = 99
            cboFilial_ItensMaisVendidos2.CallFilial = 99
            cboFilial_ItensLucroNegativo.CallFilial = 99


            Session("sFILIAL") = 99
            Session("sFILIAL_VENDA_ITEM_1") = 99
            Session("sFILIAL_VENDA_ITEM_2") = 99
            Session("sFILIAL_LUCRO_NEGATIVO") = 99

            gridItensMaisVendidos.DataBind()
            gridItensMaisVendidos2.DataBind()

        End If
    End Sub

#End Region

    Protected Sub ASPxGridView1_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles ASPxGridView1.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub ASPxGridView1_HtmlRowPrepared(sender As Object, e As ASPxGridViewTableRowEventArgs) Handles ASPxGridView1.HtmlRowPrepared

        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "207", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "208", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "251", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "250", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "240", Drawing.Color.LightGreen, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "253", Drawing.Color.Yellow, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "254", Drawing.Color.LightBlue, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "255", Drawing.Color.LightGreen, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "6099", Drawing.Color.PeachPuff, True)

    End Sub

    Protected Sub cboDia_DiaVaiClick(sender As Object, e As EventArgs) Handles cboDia.DiaVaiClick
        Call Atualizar()
    End Sub

    Protected Sub cboDia_DiaVoltaClick(sender As Object, e As EventArgs) Handles cboDia.DiaVoltaClick
        Call Atualizar()
    End Sub

    Protected Sub cboDia_ListDiaChanged(sender As Object, e As EventArgs) Handles cboDia.ListDiaChanged
        Call Atualizar()
    End Sub

    Private Sub Atualizar()
        Session("sDIA") = Me.cboDia.CallDia
        Session("sFILIAL") = 99

        Me.ASPxGridView1.DataBind()
        Me.gridHoras.DataBind()
        AtualizarVendaAno()

        Call ExibirGraficosCidadeRegiao()

    End Sub

    Protected Sub chkEstatisticas_CheckedChanged(sender As Object, e As EventArgs) Handles chkEstatisticas.CheckedChanged
        oFun.CheckBoxStatusExibir(chkEstatisticas, ASPxGridView1, "bandEstatisticas")
        oFun.CheckBoxStatusExibir(chkEstatisticas, gridAcompanhamentoSupervisor, "bandEstatisticas")
        oFun.CheckBoxStatusExibir(chkEstatisticas, gridAcompanhamentoCidade, "bandEstatisticas")
        oFun.CheckBoxStatusExibir(chkEstatisticas, gridAcompanhamentoRegiao, "bandEstatisticas")

    End Sub

    Protected Sub gridHoras_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridHoras.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "perc")

    End Sub


    Private Sub ExibirGraficosCidadeRegiao()
        Dim mDia As Date
        mDia = Me.cboDia.CallDia
        If mDia <= DateAndTime.Today Then
            Me.divTitulo_GraficoCidade.Visible = True
            Me.divTitulo_GraficoRegiao.Visible = True
            Me.grafParticipacaoCidade.Visible = True
            Me.grafParticipacaoRegiao.Visible = True
            Me.grafPaticipacaoCidade_Percentual.Visible = True
            Me.grafPaticipacaoRegiao_Percentual.Visible = True

        Else
            Me.divTitulo_GraficoCidade.Visible = False
            Me.divTitulo_GraficoRegiao.Visible = False
            Me.grafParticipacaoCidade.Visible = False
            Me.grafParticipacaoRegiao.Visible = False
            Me.grafPaticipacaoCidade_Percentual.Visible = False
            Me.grafPaticipacaoRegiao_Percentual.Visible = False
        End If
    End Sub

    Protected Sub gridItensMaisVendidos_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridItensMaisVendidos.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "LucroComercial")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "vlrLucroFinal")
        oFun.Grid_RedIsNegative(e, "percMargemFinal")
    End Sub

    Protected Sub gridItensMaisVendidos2_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridItensMaisVendidos2.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "LucroComercial")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "vlrLucroFinal")
        oFun.Grid_RedIsNegative(e, "percMargemFinal")
    End Sub

    Protected Sub gridItensMenosVendidos_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridItensMenosVendidos.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "LucroComercial")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "vlrLucroFinal")
        oFun.Grid_RedIsNegative(e, "percMargemFinal")
    End Sub

    Protected Sub gridItensMaisVendidosLucro_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridItensMaisVendidosLucro.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "LucroComercial")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "vlrLucroFinal")
        oFun.Grid_RedIsNegative(e, "percMargemFinal")
    End Sub

    Protected Sub gridItensMenosVendidosEmpresa_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridItensMenosVendidosEmpresa.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "LucroComercial")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "vlrLucroFinal")
        oFun.Grid_RedIsNegative(e, "percMargemFinal")
    End Sub

    Protected Sub grid_Venda_ItemComSellOut_Empresa_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid_Venda_ItemComSellOut_Empresa.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "LucroComercial")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "vlrLucroFinal")
        oFun.Grid_RedIsNegative(e, "percMargemFinal")
    End Sub


    Protected Sub gridAcompanhamentoSupervisor_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridAcompanhamentoSupervisor.CustomSummaryCalculate
        On Error Resume Next
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoSupervisor, "percDifCresc", "vlrRealVenda", "vlrRealAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoSupervisor, "percAting", "vlrRealVenda", "vlrMetaVenda", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoSupervisor, "percMetaMargem", "vlrMetaMargem", "vlrMetaVenda", Funcoes.CalculateType.ValueOverRevenue)

        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoSupervisor, "percAtingLucro", "vlrRealMargem", "vlrMetaMargem", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoSupervisor, "percRealMargem", "vlrRealMargem", "vlrRealVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoSupervisor, "percRealMargemSellOut", "vlrRealMargemSellOut", "vlrRealVenda", Funcoes.CalculateType.ValueOverRevenue)

        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoSupervisor, "difMargem", "percRealMargem", "percMetaMargem", Funcoes.CalculateType.Decrease)

        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoSupervisor, "vlrVendaMetragem", "vlrRealVenda", "numMetragem", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoSupervisor, "vlrVendaFunc", "vlrRealVenda", "numFunc", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoSupervisor, "vlrVendaCheckout", "vlrRealVenda", "numCheckout", Funcoes.CalculateType.Division)

        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoSupervisor, "vlrTicketMedio", "vlrRealVenda", "numClientes", Funcoes.CalculateType.Division)

    End Sub

    Protected Sub gridAcompanhamentoSupervisor_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridAcompanhamentoSupervisor.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percAting")
        oFun.Grid_RedIsNegative(e, "percDifCresc")
        oFun.Grid_RedIsNegative(e, "percAtingLucro")
        oFun.Grid_RedIsNegative(e, "difMargem")
        oFun.Grid_RedIsNegative(e, "difLucro")

        oFun.Grid_RedIsNegative(e, "percRealMargem")
        oFun.Grid_RedIsNegative(e, "percRealMargemSellOut")
    End Sub

    Protected Sub gridAcompanhamentoSupervisor_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gridAcompanhamentoSupervisor.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub


#Region " CIDADE"

    Protected Sub gridAcompanhamentoCidade_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridAcompanhamentoCidade.CustomSummaryCalculate
        On Error Resume Next
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoCidade, "percDifCresc", "vlrRealVenda", "vlrRealAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoCidade, "percAting", "vlrRealVenda", "vlrMetaVenda", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoCidade, "percMetaMargem", "vlrMetaMargem", "vlrMetaVenda", Funcoes.CalculateType.ValueOverRevenue)

        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoCidade, "percAtingLucro", "vlrRealMargem", "vlrMetaMargem", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoCidade, "percRealMargem", "vlrRealMargem", "vlrRealVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoCidade, "percRealMargemSellOut", "vlrRealMargemSellOut", "vlrRealVenda", Funcoes.CalculateType.ValueOverRevenue)

        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoCidade, "difMargem", "percRealMargem", "percMetaMargem", Funcoes.CalculateType.Decrease)

        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoCidade, "vlrVendaMetragem", "vlrRealVenda", "numMetragem", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoCidade, "vlrVendaFunc", "vlrRealVenda", "numFunc", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoCidade, "vlrVendaCheckout", "vlrRealVenda", "numCheckout", Funcoes.CalculateType.Division)

        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoCidade, "vlrTicketMedio", "vlrRealVenda", "numClientes", Funcoes.CalculateType.Division)

    End Sub

    Protected Sub gridAcompanhamentoCidade_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridAcompanhamentoCidade.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percAting")
        oFun.Grid_RedIsNegative(e, "percDifCresc")
        oFun.Grid_RedIsNegative(e, "percAtingLucro")
        oFun.Grid_RedIsNegative(e, "difMargem")
        oFun.Grid_RedIsNegative(e, "difLucro")

        oFun.Grid_RedIsNegative(e, "percRealMargem")
        oFun.Grid_RedIsNegative(e, "percRealMargemSellOut")
    End Sub

    Protected Sub gridAcompanhamentoCidade_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gridAcompanhamentoCidade.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

#End Region

#Region " REGIAO"

    Protected Sub gridAcompanhamentoRegiao_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridAcompanhamentoRegiao.CustomSummaryCalculate
        On Error Resume Next
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoRegiao, "percDifCresc", "vlrRealVenda", "vlrRealAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoRegiao, "percAting", "vlrRealVenda", "vlrMetaVenda", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoRegiao, "percMetaMargem", "vlrMetaMargem", "vlrMetaVenda", Funcoes.CalculateType.ValueOverRevenue)

        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoRegiao, "percAtingLucro", "vlrRealMargem", "vlrMetaMargem", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoRegiao, "percRealMargem", "vlrRealMargem", "vlrRealVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoRegiao, "percRealMargemSellOut", "vlrRealMargemSellOut", "vlrRealVenda", Funcoes.CalculateType.ValueOverRevenue)

        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoRegiao, "difMargem", "percRealMargem", "percMetaMargem", Funcoes.CalculateType.Decrease)

        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoRegiao, "vlrVendaMetragem", "vlrRealVenda", "numMetragem", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoRegiao, "vlrVendaFunc", "vlrRealVenda", "numFunc", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoRegiao, "vlrVendaCheckout", "vlrRealVenda", "numCheckout", Funcoes.CalculateType.Division)

        oFun.Grid_Footer_Calculate(sender, e, gridAcompanhamentoRegiao, "vlrTicketMedio", "vlrRealVenda", "numClientes", Funcoes.CalculateType.Division)

    End Sub

    Protected Sub gridAcompanhamentoRegiao_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridAcompanhamentoRegiao.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percAting")
        oFun.Grid_RedIsNegative(e, "percDifCresc")
        oFun.Grid_RedIsNegative(e, "percAtingLucro")
        oFun.Grid_RedIsNegative(e, "difMargem")
        oFun.Grid_RedIsNegative(e, "difLucro")

        oFun.Grid_RedIsNegative(e, "percRealMargem")
        oFun.Grid_RedIsNegative(e, "percRealMargemSellOut")
    End Sub

    Protected Sub gridAcompanhamentoRegiao_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gridAcompanhamentoRegiao.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

#End Region


    Protected Sub gridItensMaisVendidos_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles gridItensMaisVendidos.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "precoVenda", "Venda", "QtdVendas", Funcoes.CalculateType.Division)
    End Sub

    Protected Sub gridItensMaisVendidos2_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles gridItensMaisVendidos2.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "precoVenda", "Venda", "QtdVendas", Funcoes.CalculateType.Division)
    End Sub

    Protected Sub gridItensMenosVendidos_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles gridItensMenosVendidos.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "precoVenda", "Venda", "QtdVendas", Funcoes.CalculateType.Division)
    End Sub

    Protected Sub gridItensMaisVendidosLucro_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles gridItensMaisVendidosLucro.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "precoVenda", "Venda", "QtdVendas", Funcoes.CalculateType.Division)
    End Sub

    Protected Sub gridItensMenosVendidosEmpresa_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles gridItensMenosVendidosEmpresa.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "precoVenda", "Venda", "QtdVendas", Funcoes.CalculateType.Division)
    End Sub

    Protected Sub grid_Top30_Lucro_Negativo_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles grid_Top30_Lucro_Negativo.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "precoVenda", "Venda", "QtdVendas", Funcoes.CalculateType.Division)
    End Sub

    Protected Sub grid_Venda_ItemComSellOut_Empresa_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles grid_Venda_ItemComSellOut_Empresa.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "precoVenda", "Venda", "QtdVendas", Funcoes.CalculateType.Division)
    End Sub



    Protected Sub pb_DataBound(ByVal sender As Object, ByVal e As EventArgs)
        Dim progressBar As ASPxProgressBar = CType(sender, ASPxProgressBar)

        If progressBar.Position > 100 Then
            progressBar.Position = 100
        End If

        If progressBar.Position >= 100 Then
            progressBar.IndicatorStyle.BackColor = Drawing.Color.Green
        Else
            progressBar.IndicatorStyle.BackColor = Drawing.Color.LightCoral
        End If
    End Sub

    Protected Sub cboPaneVendaItem_1_Callback(sender As Object, e As CallbackEventArgsBase) Handles cboPaneVendaItem_1.Callback
        Session("sFILIAL_VENDA_ITEM_1") = cboFilial_ItensMaisVendidos.CallFilial
        gridItensMaisVendidos.DataBind()
    End Sub

    Protected Sub cboPaneVendaItem_2_Callback(sender As Object, e As CallbackEventArgsBase) Handles cboPaneVendaItem_2.Callback
        Session("sFILIAL_VENDA_ITEM_2") = cboFilial_ItensMaisVendidos2.CallFilial
        gridItensMaisVendidos2.DataBind()
    End Sub

    Protected Sub cboPaneLucroItemNegativo_Callback(sender As Object, e As CallbackEventArgsBase) Handles cboPaneLucroItemNegativo.Callback
        Session("sFILIAL_LUCRO_NEGATIVO") = cboFilial_ItensLucroNegativo.CallFilial
        grid_Top30_Lucro_Negativo.DataBind()
    End Sub

    Protected Sub btnAtualizar_Click(sender As Object, e As EventArgs) Handles btnAtualizar.Click
        Call Atualizar()
    End Sub



    Protected Sub grid_Top30_Lucro_Negativo_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid_Top30_Lucro_Negativo.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "LucroComercial")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "vlrLucroFinal")
        oFun.Grid_RedIsNegative(e, "percMargemFinal")
    End Sub


    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            lblVendaAno.Visible = False
        End If
    End Sub
End Class
