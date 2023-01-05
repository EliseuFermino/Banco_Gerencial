Imports DevExpress.Web
Imports DevExpress.XtraCharts

Partial Class MemberPages_Vendas_VendaLoja
    Inherits System.Web.UI.Page
    Dim oFun As New Funcoes


    Protected Sub ASPxGridView1_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles ASPxGridView1.CustomSummaryCalculate
        On Error Resume Next

        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percAting", "vlrVenda", "vlrMetaVenda", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percAtingLucro", "vlrMargem", "vlrMetaLucro", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percMargem", "vlrMargem", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percMetaMargem", "vlrMetaLucro", "vlrMetaVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "difMargem", "percMargem", "percMetaMargem", Funcoes.CalculateType.Decrease)

        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percMetaMargem", "vlrMetaLucro", "vlrMetaVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "vlrMedFunc", "vlrVenda", "numFuncionarios", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "ticketMedio", "vlrVenda", "NumCliente", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "vlrMedCheckout", "vlrVenda", "numCheckOut", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "vlrMedMetragem", "vlrVenda", "MetragemAreaVenda", Funcoes.CalculateType.Division)

        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percAgenda23_Dif", "percAgenda23", "percMeta_Agenda23", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percAgenda23", "vlrAgenda23", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)



    End Sub

    Protected Sub ASPxGridView1_CustomUnboundColumnData(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDataEventArgs) Handles ASPxGridView1.CustomUnboundColumnData
        On Error Resume Next
        'Calculo do Percentual de Atingimento da Venda - Meta x Realizado

        oFun.Grid_Calculate(e, "percAting", "vlrVenda", "vlrMetaVenda", Funcoes.CalculateType.Growth)

        oFun.Grid_Calculate(e, "percMetaMargem", "vlrMetaLucro", "vlrMetaVenda", Funcoes.CalculateType.ValueOverRevenue)

        'Calculo do Percentual da Margem Real
        oFun.Grid_Calculate(e, "percMargem", "vlrMargem", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)

        'Diferença de Percentual da Margem (% Margem Real - % Margem Meta)
        oFun.Grid_Calculate(e, "difMargem", "percMargem", "percMetaMargem", Funcoes.CalculateType.Decrease)

        'Diferença de Valor da Lucratividade (Valor Margem Real - Valor Margem Meta)
        oFun.Grid_Calculate(e, "difLucro", "vlrMargem", "vlrMetaLucro", Funcoes.CalculateType.Decrease)

        'Percentual de Atingimento de Meta da Lucratividade
        oFun.Grid_Calculate(e, "percAtingLucro", "vlrMargem", "vlrMetaLucro", Funcoes.CalculateType.Growth)

        oFun.Grid_Calculate(e, "ticketMedio", "vlrVenda", "NumCliente", Funcoes.CalculateType.Division)


        oFun.Grid_Calculate(e, "vlrMedFunc", "vlrVenda", "numFuncionarios", Funcoes.CalculateType.Division)

        oFun.Grid_Calculate(e, "vlrMedCheckout", "vlrVenda", "numCheckOut", Funcoes.CalculateType.Division)
        oFun.Grid_Calculate(e, "vlrMedMetragem", "vlrVenda", "MetragemAreaVenda", Funcoes.CalculateType.Division)

        oFun.Grid_Calculate(e, "vlrAgenda23_Dif", "vlrMeta_Agenda23", "vlrAgenda23", Funcoes.CalculateType.Decrease)
        oFun.Grid_Calculate(e, "percAgenda23_Dif", "percAgenda23", "percMeta_Agenda23", Funcoes.CalculateType.Decrease)

        oFun.Grid_Calculate(e, "dif_vlrVenda_vlrMeta", "vlrVenda", "vlrMetaVenda", Funcoes.CalculateType.Decrease)


    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared
        On Error Resume Next

        oFun.Grid_RedIsNegative(e, "percAgenda23_Dif")
        oFun.Grid_RedIsNegative(e, "vlrAgenda23_Dif")
        oFun.Grid_RedIsNegative(e, "difLucro")
        oFun.Grid_RedIsNegative(e, "difMargem")
        oFun.Grid_RedIsNegative(e, "percAtingLucro")
        oFun.Grid_RedIsNegative(e, "percAting")
        oFun.Grid_RedIsNegative(e, "dif_vlrVenda_vlrMeta")

    End Sub

#Region " PAGE"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        On Error Resume Next
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(78, User.Identity.Name)

            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = Year(Now())
            Me.cboAno.CallAno = Year(Now())

            Me.cboMes.CallMes = Month(Now())
            Session("sPROJECAO") = 2    'Não Projetar Vendas
            Session("sOPCAO") = 1   'TOTAL
            Session("sMERCADOLOGICO") = 0
            oFun.Grid_Title(ASPxGridView1, "Analise por Total")

            With cboMercadologico
                .Visible_rdGrupo = False
                .Visible_rdSubgrupo = False
            End With

            Call Titulos()
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Analise de Vendas por Filial - PGR78"
        End If

    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            'If Not Me.cboFilial.IsLoja Then
            '    Me.cboFilial.CallFilial = 3
            'Else
            '    Me.cboFilial.Visible_cboCorporacao = False
            'End If

            Session("sANO") = Me.cboAno.CallAno
            Session("sMES") = Me.cboMes.CallMes
            'Session("sFILIAL") = Me.cboFilial.CallFilial

            'oFun.Grid_Title(gridItensMaisVendidos, "Top 20 - Itens Mais Vendidos na Loja no Mês")
            'oFun.Grid_Title(gridItensMenosVendidos, "Top 20 - Volume Mais Vendido na Loja no Mês")
            'oFun.Grid_Title(gridItensMaisVendidosLucro, "Top 20 - Lucro dos Itens Mais Vendidos na Loja no Mês")

        End If
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then

            Me.dsDadosVendas.DataBind()
            Me.ASPxGridView1.DataBind()
            'Me.gridItensMaisVendidos.DataBind()
            'Me.gridItensMenosVendidos.DataBind()
            'Me.gridItensMaisVendidosLucro.DataBind()
            'Me.WebChartControl1.DataBind()

        End If
    End Sub

#End Region

    Protected Sub ASPxGridView1_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles ASPxGridView1.HtmlFooterCellPrepared

        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub



    Protected Sub cboAno_ListAnoChanged(sender As Object, e As EventArgs) Handles cboAno.ListAnoChanged
        Session("sANO") = Me.cboAno.CallAno
    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Call Titulos()
    End Sub

#Region " Titulos"

    Private Sub Titulos()
        'Me.lblTituloGraficoCrescimento24Meses.Text = "Crescimento de Venda sobre o Ano Anterior - Filial " & Me.cboFilial.CallFilialNome
        'Me.lblTituloGraficoVendas.Text = "Vendas - Filial " & Me.cboFilial.CallFilialNome
        'Me.lblTituloGraficoClientes.Text = "Número de Clientes - Filial " & Me.cboFilial.CallFilialNome
        'Me.lblTituloGraficoCrescimentoClientes.Text = "Crescimento de Clientes sobre o Ano Anterior - Filial " & Me.cboFilial.CallFilialNome

        'Me.lblNumeroClientesPorDia.Text = "Número de Clientes por Dia - Filial " & Me.cboFilial.CallFilialNome
    End Sub

#End Region

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback

        'Define se é Filial ou Empresa
        If Me.cboFilial.CallFilial < 90 Then 'Filial
            Session("sTIPO") = 1
        Else
            Session("sTIPO") = 2
        End If

        Session("sANO") = Me.cboAno.CallAno
        Session("sMES") = Me.cboMes.CallMes
        Session("sFILIAL") = Me.cboFilial.CallFilial

        If Me.rndAteOntem.Checked = True Then Session("sPROJECAO") = 3
        If Me.rndAteHoje.Checked = True Then Session("sPROJECAO") = 2
        If Me.rndProjetar.Checked = True Then Session("sPROJECAO") = 1

        'Exibir todos os dados ou não (colocar barra de rolagem)
        If Me.chkFixar.Checked = False Then
            ASPxGridView1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Hidden
        Else
            ASPxGridView1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Visible
        End If

        'Exibir ou Não a Lucratividade
        If Me.optNumCliente.Checked = True Then
            Me.ASPxGridView1.Columns.Item("bandLucratividade").Visible = True
        Else
            Me.ASPxGridView1.Columns.Item("bandLucratividade").Visible = False
        End If

        'Analisar por Dia da Semana
        If Me.chkPorDia.Checked = True Then
            ASPxGridView1.GroupBy(ASPxGridView1.Columns("descNomeDia"), 0)
        Else
            ASPxGridView1.UnGroup(ASPxGridView1.Columns("descNomeDia"))
        End If

        Call Titulos()

        oFun.Grid_Title(ASPxGridView1, "Analise: " & Session("sNOME_MERCADOLOGICO"))

        Me.dsDadosVendas.DataBind()
        Me.ASPxGridView1.DataBind()
        'Me.gridItensMaisVendidos.DataBind()
        'Me.gridItensMenosVendidos.DataBind()
        'Me.gridItensMaisVendidosLucro.DataBind()
        'Me.WebChartControl1.DataBind()


    End Sub

    'Protected Sub gridItensMaisVendidos_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridItensMaisVendidos.HtmlDataCellPrepared
    '    On Error Resume Next
    '    If e.DataColumn.FieldName = "LucroComercial" Or e.DataColumn.FieldName = "percMargem" Or
    '        e.DataColumn.FieldName = "vlrLucroFinal" Or e.DataColumn.FieldName = "percMargemFinal" Then
    '        If Convert.ToDouble(e.CellValue) < 0 Then
    '            e.Cell.ForeColor = System.Drawing.Color.Red
    '        End If
    '    End If
    'End Sub

    'Protected Sub gridItensMenosVendidos_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridItensMenosVendidos.HtmlDataCellPrepared
    '    On Error Resume Next
    '    If e.DataColumn.FieldName = "LucroComercial" Or e.DataColumn.FieldName = "percMargem" Or
    '        e.DataColumn.FieldName = "vlrLucroFinal" Or e.DataColumn.FieldName = "percMargemFinal" Then
    '        If Convert.ToDouble(e.CellValue) < 0 Then
    '            e.Cell.ForeColor = System.Drawing.Color.Red
    '        End If
    '    End If
    'End Sub


    'Protected Sub gridItensMaisVendidosLucro_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridItensMaisVendidosLucro.HtmlDataCellPrepared
    '    On Error Resume Next
    '    If e.DataColumn.FieldName = "LucroComercial" Or e.DataColumn.FieldName = "percMargem" Or
    '        e.DataColumn.FieldName = "vlrLucroFinal" Or e.DataColumn.FieldName = "percMargemFinal" Then
    '        If Convert.ToDouble(e.CellValue) < 0 Then
    '            e.Cell.ForeColor = System.Drawing.Color.Red
    '        End If
    '    End If
    'End Sub

    'Protected Sub WebChartControl1_CustomDrawAxisLabel(sender As Object, e As CustomDrawAxisLabelEventArgs) Handles WebChartControl1.CustomDrawAxisLabel

    '    oFun.Graph_InsertSignalPlus_AxisY(WebChartControl1, sender, e)



    'End Sub


    'Protected Sub graficoCrescimentoCliente_CustomDrawAxisLabel(sender As Object, e As CustomDrawAxisLabelEventArgs) Handles graficoCrescimentoCliente.CustomDrawAxisLabel

    '    oFun.Graph_InsertSignalPlus_AxisY(graficoCrescimentoCliente, sender, e)



    'End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(ASPxGridView1, cboSize.CallSize)
    End Sub

    Protected Sub pb_DataBound(ByVal sender As Object, ByVal e As EventArgs)
        Dim progressBar As ASPxProgressBar = CType(sender, ASPxProgressBar)

        If progressBar.Position > 100 Then
            progressBar.Position = 100
        End If

        If progressBar.Position >= 100.0 Then
            progressBar.IndicatorStyle.BackColor = Drawing.Color.Green
        Else
            progressBar.IndicatorStyle.BackColor = Drawing.Color.LightCoral
        End If
    End Sub
    
End Class
