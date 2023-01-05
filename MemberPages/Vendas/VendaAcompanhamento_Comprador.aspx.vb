Imports DevExpress.Web

Partial Class MemberPages_Vendas_VendaAcompanhamento_Comprador
    Inherits System.Web.UI.Page

    Dim oCon As New Conexao
    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes
    Dim oProd As New Produtos

    Dim vAno As Int16
    Dim vMes As Byte


    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = " &nbsp  Acompanhamento de Vendas Diárias por Comprador - PGR388"

        End If
    End Sub

    Private Sub AtualizarVendaAno()
        On Error Resume Next
        vAno = Year(DateAdd(DateInterval.Day, -1, Me.cboDia.Value))
        Me.txtVendaAno.Text = CDec(oCon.spScalar_pAno_Field(Conexao.gerManager, "Vendas.uspBuscarVendaEmpresaAno_Comprador", vAno, "idComprador", Session("sUSUARIO"))).ToString("n0")
    End Sub


    Private Sub Atualizar()
        Dim descDia As String
        Dim nomeComprador As String

        nomeComprador = oProd.BuscarNomeComprador(CInt(Session("sUSUARIO")))


        lblComprador_GR1.Text = nomeComprador
        lblTOP30_Venda.Text = nomeComprador
        lblTOP30_Volume.Text = nomeComprador
        lblTOP30_Lucro.Text = nomeComprador
        lblTOP30_Menos.Text = nomeComprador

        Session("sDIA") = cboDia.Value

        descDia = DateAndTime.WeekdayName(Weekday(cboDia.Value))
        vAno = Year(cboDia.Value)

        ASPxGridView1.DataBind()
        oFun.Grid_ColumnTitle(ASPxGridView1, "vlrRealAA", "Venda <br>" & descDia)
        oFun.Grid_ColumnTitle(ASPxGridView1, "bandAnoAnterior", "Realizado Ano " & vAno - 1)
        oFun.Grid_ColumnTitle(ASPxGridView1, "bandVendaAnoAtual", "Meta x Realizado - Vendas - Ano " & vAno)

        oFun.Grid_Title(ASPxGridView1, "Dia " & FormatDateTime(cboDia.Value, DateFormat.ShortDate) & " - " & descDia & " -  Acompanhamento de Vendas do Comprador " & nomeComprador)
        Atualizar_Estatistica()
    End Sub

    Protected Sub ASPxGridView1_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles ASPxGridView1.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percAting", "vlrRealVenda", "vlrMetaVenda", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percDifCresc", "vlrRealVenda", "vlrRealAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "vlrTicketMedio", "vlrRealVenda", "numClientes", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percMetaMargem", "vlrMetaMargem", "vlrMetaVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percRealMargem", "vlrRealMargem", "vlrRealVenda", Funcoes.CalculateType.ValueOverRevenue)

        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "difMargem", "percRealMargem", "percMetaMargem", Funcoes.CalculateType.Decrease)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percAtingLucro", "vlrRealMargem", "vlrMetaMargem", Funcoes.CalculateType.Growth)

        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percRealMargemSellOut", "vlrMargemFinal", "vlrRealVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percConclusao", "vlrRealVenda", "vlrMetaVenda", Funcoes.CalculateType.ValueOverRevenue)


    End Sub

    Protected Sub ASPxGridView1_CustomUnboundColumnData(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDataEventArgs) Handles ASPxGridView1.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "vlrDifVenda", "vlrRealVenda", "vlrMetaVenda", Funcoes.CalculateType.Decrease)
        oFun.Grid_Calculate(e, "difMargem", "percRealMargem", "percMetaMargem", Funcoes.CalculateType.Decrease)
        'difMargem
    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percAting")
        oFun.Grid_RedIsNegative(e, "percDifCresc")
        oFun.Grid_RedIsNegative(e, "percAtingLucro")
        oFun.Grid_RedIsNegative(e, "difMargem")
        oFun.Grid_RedIsNegative(e, "difLucro")

        oFun.Grid_RedIsNegative(e, "percRealMargem")
        oFun.Grid_RedIsNegative(e, "percRealMargemSellOut")
        oFun.Grid_RedIsNegative(e, "vlrDifVenda")
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(388, Page.User.Identity.Name)

            Dim vMercadologico As Byte = 4



            If CInt(DateAndTime.Now.Hour) > 9 Then
                'If CInt(DateAndTime.Now.Hour) > 7 Then
                cboDia.Date = DateAndTime.Now()
            Else
                cboDia.Date = DateAndTime.Now().AddDays(-1)
            End If

            Session("sDIA") = cboDia.Value
            vAno = Year(cboDia.Date)
            vMes = Month(cboDia.Date)
            Session("sANO") = vAno
            Session("sMES") = vMes
            Session("sMERCADOLOGICO") = vMercadologico

            Call Atualizar()
            Call AtualizarVendaAno()

            oFun.Grid_Column_BorderRight(ASPxGridView1, "vlrMargemFinal", Drawing.Color.DarkSlateGray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "percAtingLucro", Drawing.Color.DarkSlateGray, BorderStyle.Dashed, 1)

            ' ----

            Dim sDia As String = FormatDateTime(cboDia.Value, DateFormat.ShortDate)
            Session("sDIA") = cboDia.Value

            oFun.Grid_Title(gridItensMaisVendidos, "Top 30 - Itens Mais Vendidos na Empresa - Dia " & sDia)
            oFun.Grid_Title(gridItensMenosVendidos, "Top 30 - Volume Mais Vendido na Empresa - Dia " & sDia)
            oFun.Grid_Title(gridItensMaisVendidosLucro, "Top 30 - Lucro dos Itens Mais Vendidos na Empresa - Dia " & sDia)
            oFun.Grid_Title(gridItensMenosVendidosEmpresa, "Top 30 - Itens Menos Vendidos na Empresa - Dia " & sDia)

        End If
    End Sub


    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then

            Call Atualizar()


        End If
    End Sub

    Protected Sub ASPxGridView1_HtmlFooterCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableFooterCellEventArgs) Handles ASPxGridView1.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
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

#Region " PANEL "

    Protected Sub cbPanelGrid_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanelGrid.Callback

        Call Atualizar()

    End Sub

    Protected Sub cbPanelItens_Callback(sender As Object, e As CallbackEventArgsBase) Handles cbPanelItens.Callback

        Dim sDia As String = FormatDateTime(cboDia.Value, DateFormat.ShortDate)

        Session("sDIA") = cboDia.Value
        gridItensMaisVendidos.DataBind()
        gridItensMenosVendidos.DataBind()

        oFun.Grid_Title(gridItensMaisVendidos, "Top 30 - Itens Mais Vendidos na Empresa - Dia " & sDia)
        oFun.Grid_Title(gridItensMenosVendidos, "Top 30 - Volume Mais Vendido na Empresa - Dia " & sDia)
        oFun.Grid_Title(gridItensMaisVendidosLucro, "Top 30 - Lucro dos Itens Mais Vendidos na Empresa - Dia " & sDia)
        oFun.Grid_Title(gridItensMenosVendidosEmpresa, "Top 30 - Itens Menos Vendidos na Empresa - Dia " & sDia)

        Atualizar_Estatistica()
    End Sub

#End Region

#Region " GRID "


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

    Protected Sub gridItensMaisVendidos_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles gridItensMaisVendidos.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "precoVenda", "Venda", "QtdVendas", Funcoes.CalculateType.Division)
        oFun.Grid_Calculate(e, "percMargem", "LucroComercial", "Venda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Calculate(e, "percMargemSellOut", "LucroSellOut", "Venda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Calculate(e, "percMargemFinal", "vlrLucroFinal", "Venda", Funcoes.CalculateType.ValueOverRevenue)
    End Sub

    Protected Sub gridItensMenosVendidos_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles gridItensMenosVendidos.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "precoVenda", "Venda", "QtdVendas", Funcoes.CalculateType.Division)

    End Sub

    Protected Sub gridItensMaisVendidosLucro_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles gridItensMaisVendidosLucro.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "precoVenda", "Venda", "QtdVendas", Funcoes.CalculateType.Division)
        oFun.Grid_Calculate(e, "percMargem", "LucroComercial", "Venda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Calculate(e, "percMargemSellOut", "LucroSellOut", "Venda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Calculate(e, "percMargemFinal", "vlrLucroFinal", "Venda", Funcoes.CalculateType.ValueOverRevenue)
    End Sub

    Protected Sub gridItensMenosVendidosEmpresa_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles gridItensMenosVendidosEmpresa.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "precoVenda", "Venda", "QtdVendas", Funcoes.CalculateType.Division)
    End Sub

#End Region

    Private Sub Atualizar_Estatistica()
        On Error Resume Next

        Dim vTotal_SKU As Integer
        Dim vPercAting_TOP30 As String
        Dim sDia As String = FormatDateTime(cboDia.Value, DateFormat.ShortDate)

        vTotal_SKU = oCon.spScalar_pDia_Field(Conexao.DW_str, "Comprador.uspS_Total_SKUs_Vendidos", cboDia.Date, "idComprador", Session("sUSUARIO"))

        vPercAting_TOP30 = oCon.spScalar_pDia_Field(Conexao.DW_str, "Comprador.uspS_Total_Participacao_TOP30_Dia", cboDia.Date, "idComprador", Session("sUSUARIO"))

        lbl_ItensMaisVendidos.Text = " Os 30 SKU's 'Mais Vendidos' de um Total de " & vTotal_SKU & " SKU's representam " & CDec(vPercAting_TOP30).ToString("n2") & "% do Total Vendido no Dia " & sDia
    End Sub


End Class
