Imports DevExpress.Web
Imports System.Data

Partial Class MemberPages_Vendas_Working
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
            Me.btnAtualizar.btnSalvar_Text = "Atualizar"
            Call ExibirTopItens()
        End If
    End Sub

    Private Sub AtualizarVendaAno()
        On Error Resume Next
        Me.lblVendaAno.Text = CDec(oCon.spScalar_pAno(Conexao.gerManager, "Vendas.uspBuscarVendaEmpresaAno", Year(DateAdd(DateInterval.Day, -1, Me.cboDia.CallDia)))).ToString("n0")
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

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percAting")
        oFun.Grid_RedIsNegative(e, "percDifCresc")
        oFun.Grid_RedIsNegative(e, "percAtingLucro")
        oFun.Grid_RedIsNegative(e, "difMargem")
        oFun.Grid_RedIsNegative(e, "difLucro")

        oFun.Grid_RedIsNegative(e, "percRealMargem")
        oFun.Grid_RedIsNegative(e, "percRealMargemSellOut")

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

            cboFilial_ItensMaisVendidos.Checked_Empresa = True
            cboFilial_ItensMaisVendidos.AutoPostBack_Empresa = True

            cboFilial_ItensMaisVendidos2.Checked_Empresa = True
            cboFilial_ItensMaisVendidos2.AutoPostBack_Empresa = True

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Acompanhamento de Vendas Diárias - PGR1"
            Call AtualizarVendaAno()

            cboFilial_ItensMaisVendidos.CallFilial = 99
        End If
    End Sub

#End Region

    Protected Sub ASPxGridView1_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles ASPxGridView1.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub ASPxGridView1_HtmlRowPrepared(sender As Object, e As ASPxGridViewTableRowEventArgs) Handles ASPxGridView1.HtmlRowPrepared

        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "207", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "208", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "215", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "250", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "240", Drawing.Color.Lavender, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "253", Drawing.Color.LightBlue, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "254", Drawing.Color.LightBlue, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "255", Drawing.Color.LightGreen, True)

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

        Me.ASPxGridView1.DataBind()
        Me.gridHoras.DataBind()
        AtualizarVendaAno()

        'Call ExibirTopItens()
        Call ExibirGraficosCidadeRegiao()

    End Sub

    Protected Sub chkEstatisticas_CheckedChanged(sender As Object, e As EventArgs) Handles chkEstatisticas.CheckedChanged
        oFun.CheckBoxStatusExibir(chkEstatisticas, ASPxGridView1, "bandEstatisticas")
        oFun.CheckBoxStatusExibir(chkEstatisticas, gridAcompanhamentoSupervisor, "bandEstatisticas")
        oFun.CheckBoxStatusExibir(chkEstatisticas, gridAcompanhamentoCidade, "bandEstatisticas")
        oFun.CheckBoxStatusExibir(chkEstatisticas, gridAcompanhamentoRegiao, "bandEstatisticas")

    End Sub

    Protected Sub btnAtualizar_BotaoClick(sender As Object, e As EventArgs) Handles btnAtualizar.BotaoClick
        Call Atualizar()
        Call AtualizarVendaAno()
    End Sub

    Protected Sub gridHoras_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridHoras.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "perc")

    End Sub

    Private Sub ExibirTopItens()
        'Dim mDia As Date
        'mDia = Me.cboDia.CallDia
        'If mDia < DateAndTime.Today Then
        '    'Me.divTitulo_ItensMaisVendidos.Visible = True
        '    'Me.gridItensMaisVendidos.Visible = True

        '    Me.divTitulo_ItensMenosVendidos.Visible = True
        '    Me.gridItensMenosVendidos.Visible = True

        '    Me.divTituloItensMaisVendidosLucro.Visible = True
        '    Me.gridItensMaisVendidosLucro.Visible = True

        '    Me.divTituloItensMenosVendidosEmpresa.Visible = True
        '    Me.gridItensMenosVendidosEmpresa.Visible = True

        'Else
        '    'Me.divTitulo_ItensMaisVendidos.Visible = False
        '    'Me.gridItensMaisVendidos.Visible = False

        '    Me.divTitulo_ItensMenosVendidos.Visible = False
        '    Me.gridItensMenosVendidos.Visible = False

        '    Me.gridItensMaisVendidosLucro.Visible = False
        '    Me.divTituloItensMaisVendidosLucro.Visible = False

        '    Me.divTituloItensMenosVendidosEmpresa.Visible = False
        '    Me.gridItensMenosVendidosEmpresa.Visible = False
        'End If
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

    Protected Sub gridItensMenosVendidos_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles gridItensMenosVendidos.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "precoVenda", "Venda", "QtdVendas", Funcoes.CalculateType.Division)
    End Sub

    Protected Sub gridItensMaisVendidosLucro_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles gridItensMaisVendidosLucro.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "precoVenda", "Venda", "QtdVendas", Funcoes.CalculateType.Division)
    End Sub

    Protected Sub gridItensMenosVendidosEmpresa_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles gridItensMenosVendidosEmpresa.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "precoVenda", "Venda", "QtdVendas", Funcoes.CalculateType.Division)
    End Sub

    Protected Sub grid_Venda_ItemComSellOut_Empresa_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles grid_Venda_ItemComSellOut_Empresa.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "precoVenda", "Venda", "QtdVendas", Funcoes.CalculateType.Division)
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then

            If cboFilial_ItensMaisVendidos.Checked_Empresa = True Then
                cboFilial_ItensMaisVendidos.CallFilial_Text = "99 - Empresa"
                Session("sFILIAL") = 99
                cboFilial_ItensMaisVendidos.Enabled_Filial = False
            End If

            If cboFilial_ItensMaisVendidos2.Checked_Empresa = True Then
                cboFilial_ItensMaisVendidos2.CallFilial_Text = "99 - Empresa"
                Session("sFILIAL2") = 99
                cboFilial_ItensMaisVendidos2.Enabled_Filial = False
            End If

        End If
    End Sub

    Protected Sub cboFilial_ItensMaisVendidos_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial_ItensMaisVendidos.ListFilialChanged
        Session("sFILIAL") = cboFilial_ItensMaisVendidos.CallFilial
        gridItensMaisVendidos.DataBind()
        oFun.Grid_Title(gridItensMaisVendidos, cboFilial_ItensMaisVendidos.CallFilial_Text & " - Top 30 - Itens Mais Vendidos na Empresa")
    End Sub

  

    Protected Sub cboFilial_ItensMaisVendidos_optEmpresaChanged(sender As Object, e As EventArgs) Handles cboFilial_ItensMaisVendidos.optEmpresaChanged

        If cboFilial_ItensMaisVendidos.Checked_Empresa = True Then
            Session("sFILIAL") = 99
            cboFilial_ItensMaisVendidos.CallFilial_Text = "99 - Empresa"
            cboFilial_ItensMaisVendidos.Enabled_Filial = False
        End If

        If cboFilial_ItensMaisVendidos.Checked_Empresa = False Then

            Session("sFILIAL") = 3
            cboFilial_ItensMaisVendidos.CallFilial_Text = "03 - S. Felicidade"

            cboFilial_ItensMaisVendidos.Enabled_Filial = True
        End If

        gridItensMaisVendidos.DataBind()
        oFun.Grid_Title(gridItensMaisVendidos, cboFilial_ItensMaisVendidos.CallFilial_Text & " - Top 30 - Itens Mais Vendidos ")

    End Sub

    Protected Sub cboFilial_ItensMaisVendidos2_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial_ItensMaisVendidos2.ListFilialChanged
        Session("sFILIAL2") = cboFilial_ItensMaisVendidos2.CallFilial
        gridItensMaisVendidos2.DataBind()
        oFun.Grid_Title(gridItensMaisVendidos2, cboFilial_ItensMaisVendidos2.CallFilial_Text & " - Top 30 - Itens Mais Vendidos")
    End Sub

    Protected Sub cboFilial_ItensMaisVendidos2_optEmpresaChanged(sender As Object, e As EventArgs) Handles cboFilial_ItensMaisVendidos2.optEmpresaChanged

        If cboFilial_ItensMaisVendidos2.Checked_Empresa = True Then
            Session("sFILIAL2") = 99
            cboFilial_ItensMaisVendidos2.CallFilial_Text = "99 - Empresa"
            cboFilial_ItensMaisVendidos2.Enabled_Filial = False
        End If

        If cboFilial_ItensMaisVendidos2.Checked_Empresa = False Then

            Session("sFILIAL2") = 3
            cboFilial_ItensMaisVendidos2.CallFilial_Text = "03 - S. Felicidade"

            cboFilial_ItensMaisVendidos2.Enabled_Filial = True
        End If

        gridItensMaisVendidos2.DataBind()
        oFun.Grid_Title(gridItensMaisVendidos2, cboFilial_ItensMaisVendidos2.CallFilial_Text & " - Top 30 - Itens Mais Vendidos ")


    End Sub
End Class
