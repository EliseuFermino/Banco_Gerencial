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
                Session("sDIA") = Me.cboDia.CallDia.Date
            Else
                Session("sDIA") = Me.cboDia.CallDia.Date.AddDays(-1)
            End If
            Me.cboDia.CallDia = Session("sDIA")
            Me.btnAtualizar.btnSalvar_Text = "Atualizar"
            Call ExibirTopItens()
        End If
    End Sub

    Private Sub AtualizarVendaAno()
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
        End If

        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Calculate Then
            Dim myFilter As Int16 = Convert.ToInt16(e.GetValue("idFilial"))
            If myFilter = 255 Then
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
        End If

    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percAting")
        oFun.Grid_RedIsNegative(e, "percDifCresc")
        oFun.Grid_RedIsNegative(e, "percAtingLucro")
        oFun.Grid_RedIsNegative(e, "difMargem")
        oFun.Grid_RedIsNegative(e, "difLucro")
    End Sub

    Protected Sub chkFixar_CheckedChanged(sender As Object, e As EventArgs) Handles chkFixar.CheckedChanged
        If Me.chkFixar.Checked = False Then
            ASPxGridView1.Settings.ShowVerticalScrollBar = False
        Else
            ASPxGridView1.Settings.ShowVerticalScrollBar = True
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'cboSecao.cboSecao_VisibleLabel = False
            cboProduto.Visible = False
            cboSecao.Visible = False

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Acompanhamento de Vendas Diárias - PGR1"
            Call AtualizarVendaAno()
        End If
    End Sub

    Protected Sub optNumCliente_CheckedChanged(sender As Object, e As EventArgs) Handles optNumCliente.CheckedChanged
        oFun.CheckBoxStatusExibir(optNumCliente, ASPxGridView1, "numClientes")
  
    End Sub

    Protected Sub ASPxGridView1_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles ASPxGridView1.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub ASPxGridView1_HtmlRowPrepared(sender As Object, e As ASPxGridViewTableRowEventArgs) Handles ASPxGridView1.HtmlRowPrepared

        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "207", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "208", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "215", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "250", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "240", Drawing.Color.Lavender, True)
        oFun.grid_RowSelectedWhole(ASPxGridView1, e, "idFilial", "255", Drawing.Color.Lavender, True)
      
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
        Session("sSECAO") = cboSecao.CallSecao
        Me.ASPxGridView1.DataBind()
        Me.gridHoras.DataBind()
        AtualizarVendaAno()

        Call ExibirTopItens()
        Call ExibirGraficosCidadeRegiao()

    End Sub

    Protected Sub chkLucratividade_CheckedChanged(sender As Object, e As EventArgs) Handles chkLucratividade.CheckedChanged
        oFun.CheckBoxStatusExibir(chkLucratividade, ASPxGridView1, "bandLucratividade")
        Call AumentarLargura()
    End Sub

    Protected Sub chkEstatisticas_CheckedChanged(sender As Object, e As EventArgs) Handles chkEstatisticas.CheckedChanged
        oFun.CheckBoxStatusExibir(chkEstatisticas, ASPxGridView1, "bandEstatisticas")
        Call AumentarLargura()
    End Sub

    Private Sub AumentarLargura()
        If Me.chkFixar.Checked = True Then
            If Me.chkLucratividade.Checked = True And Me.chkEstatisticas.Checked = True Then
                Me.ASPxGridView1.Width = 1300
            ElseIf Me.chkLucratividade.Checked = False And Me.chkEstatisticas.Checked = False Then
                Me.ASPxGridView1.Width = 900
            ElseIf Me.chkLucratividade.Checked = True Then
                Me.ASPxGridView1.Width = 1100
            ElseIf Me.chkEstatisticas.Checked = True Then
                Me.ASPxGridView1.Width = 1100
            Else
                Me.ASPxGridView1.Width = 900
            End If
        End If
    End Sub

    Protected Sub btnAtualizar_BotaoClick(sender As Object, e As EventArgs) Handles btnAtualizar.BotaoClick
        Call Atualizar()
        Call AtualizarVendaAno()
    End Sub

    Protected Sub gridHoras_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridHoras.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "perc")
      
    End Sub

    Private Sub ExibirTopItens()
        Dim mDia As Date
        mDia = Me.cboDia.CallDia
        If mDia < DateAndTime.Today Then
            Me.divTitulo_ItensMaisVendidos.Visible = True
            Me.gridItensMaisVendidos.Visible = True

            Me.divTitulo_ItensMenosVendidos.Visible = True
            Me.gridItensMenosVendidos.Visible = True

            Me.divTituloItensMaisVendidosLucro.Visible = True
            Me.gridItensMaisVendidosLucro.Visible = True

            Me.divTituloItensMenosVendidosEmpresa.Visible = True
            Me.gridItensMenosVendidosEmpresa.Visible = True

        Else
            Me.divTitulo_ItensMaisVendidos.Visible = False
            Me.gridItensMaisVendidos.Visible = False

            Me.divTitulo_ItensMenosVendidos.Visible = False
            Me.gridItensMenosVendidos.Visible = False

            Me.gridItensMaisVendidosLucro.Visible = False
            Me.divTituloItensMaisVendidosLucro.Visible = False

            Me.divTituloItensMenosVendidosEmpresa.Visible = False
            Me.gridItensMenosVendidosEmpresa.Visible = False
        End If
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

    Protected Sub rndSecao_CheckedChanged(sender As Object, e As EventArgs) Handles rndSecao.CheckedChanged
        If rndSecao.Checked = True Then

            Session("sSECAO") = 1
            cboSecao.Visible = True
            cboSecao.CallSecaoDesc = "01-Seca Pesada"

            cboProduto.Visible = False
            ASPxGridView1.DataSourceID = "dsVendaSecao"
            ASPxGridView1.DataBind()

            gridHoras.DataSourceID = "dsVendaPorHora_Secao"
            gridHoras.DataBind()

        End If
    End Sub

    Protected Sub rndTotal_CheckedChanged(sender As Object, e As EventArgs) Handles rndTotal.CheckedChanged
        If rndTotal.Checked = True Then
            cboSecao.Visible = False
            cboProduto.Visible = False
            ASPxGridView1.DataSourceID = "dsVendaLoja"
            ASPxGridView1.DataBind()

            gridHoras.DataSourceID = "dsVendaPorHora"
            gridHoras.DataBind()

        End If
    End Sub

    Protected Sub rndItem_CheckedChanged(sender As Object, e As EventArgs) Handles rndItem.CheckedChanged
        If rndItem.Checked = True Then
            cboProduto.Visible = True
            cboSecao.Visible = False
        End If
    End Sub

    Protected Sub cboSecao_ListSecaoChanged(sender As Object, e As EventArgs) Handles cboSecao.ListSecaoChanged
        'Session("sSECAO") = cboSecao.CallSecao
        Call Atualizar()
    End Sub
End Class
