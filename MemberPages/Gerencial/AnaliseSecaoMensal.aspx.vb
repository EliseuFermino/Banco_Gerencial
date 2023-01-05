
Partial Class MemberPages_Gerencial_AnaliseSecao
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes
    Dim oDb As New clDataDb

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(255, User.Identity.Name)

            Dim varAno As Int32
            varAno = Year(Now())

            cboAno.AnoInicial = 2012
            cboAno.AnoFinal = varAno
            cboAno.CallAno = varAno

            cboAno.AutoPostBack = False
            cboSecao.AutoPostBack = False
            cboFilial.AutoPostBack = False

            mySession()

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Análise de Venda por Seção Mensal - PGR255"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            cboSize.CallSize = 100

        End If
    End Sub

#End Region

    Private Sub mySession()
        Session("sANO") = cboAno.CallAno
        Session("sSECAO") = cboSecao.CallSecao
        Session("sFILIAL") = cboFilial.CallFilial
    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
    End Sub

    Private Sub Atualizar()
        mySession()
        oFun.Grid_Title(grid, "Análise por Seção da Loja " & cboFilial.CallFilialNome & "  -  Ano " & cboAno.CallAno & "   - Seção " & cboSecao.CallSecaoDesc)

        oFun.Grid_Column_BorderRight(grid, "MesDesc", Drawing.Color.Gray, BorderStyle.Solid, 1)
        oFun.Grid_Column_BorderRight(grid, "qtdeCresc", Drawing.Color.Gray, BorderStyle.Solid, 1)
        oFun.Grid_Column_BorderRight(grid, "vendaCresc", Drawing.Color.Gray, BorderStyle.Solid, 1)
        oFun.Grid_Column_BorderRight(grid, "clientesCresc", Drawing.Color.Gray, BorderStyle.Solid, 1)
        oFun.Grid_Column_BorderRight(grid, "tmvAT", Drawing.Color.Gray, BorderStyle.Solid, 1)

        oFun.Grid_ColumnTitle(grid, "qtdeAA", cboAno.CallAno - 1)
        oFun.Grid_ColumnTitle(grid, "qtdeAT", cboAno.CallAno)

        oFun.Grid_ColumnTitle(grid, "vendaAA", cboAno.CallAno - 1)
        oFun.Grid_ColumnTitle(grid, "vendaAT", cboAno.CallAno)

        oFun.Grid_ColumnTitle(grid, "clientesAA", cboAno.CallAno - 1)
        oFun.Grid_ColumnTitle(grid, "clientesAT", cboAno.CallAno)

        oFun.Grid_ColumnTitle(grid, "tmvAA", cboAno.CallAno - 1)
        oFun.Grid_ColumnTitle(grid, "tmvAT", cboAno.CallAno)

        oFun.Grid_ColumnTitle(grid, "numPorClienteAA", cboAno.CallAno - 1)
        oFun.Grid_ColumnTitle(grid, "numPorClienteAT", cboAno.CallAno)

        Select Case cboSecao.CallSecao
            Case 12, 13, 17, 18, 21, 23
                oFun.Grid_ColumnTitle(grid, "bandEmbalagem", "Kilos por Cliente")
            Case Else
                oFun.Grid_ColumnTitle(grid, "bandEmbalagem", "Unidades por Cliente")
        End Select


        grid.DataBind()
        graphCrescimentoVenda.DataBind()
        graphVolumeCliente.DataBind()
        graphNCrescimentoClientes.DataBind()

        lblCaption_ClientesPerdidos.Text = "Total de Clientes Perdidos: " & CDbl((oDb.GetDataDB_ExecuteScalar_Parameter3("Analises.uspBuscar_NumeroDeClientesPerdidos", Conexao.DW_Condor_One_ConnectionString, "@Ano", cboAno.CallAno, "@idFilial", cboFilial.CallFilial, "@idSecao", cboSecao.CallSecao))).ToString("n0")
        lblCaption_TicketMedio.Text = "Valor do Ticket Médio: " & CDbl((oDb.GetDataDB_ExecuteScalar_Parameter3("Analises.uspBuscar_TicketMedio", Conexao.DW_Condor_One_ConnectionString, "@Ano", cboAno.CallAno, "@idFilial", cboFilial.CallFilial, "@idSecao", cboSecao.CallSecao))).ToString("n2")
        lblCaption_vlrVendaPerdida.Text = "Valor da Venda Perdida: " & CDbl((oDb.GetDataDB_ExecuteScalar_Parameter3("Analises.uspBuscar_ValorVendaPerdida", Conexao.DW_Condor_One_ConnectionString, "@Ano", cboAno.CallAno, "@idFilial", cboFilial.CallFilial, "@idSecao", cboSecao.CallSecao))).ToString("n2")

        lblCaption_ClientesPerdidosGanhos.Text = "Total de Clientes Ganhos: " & CDbl((oDb.GetDataDB_ExecuteScalar_Parameter3("Analises.uspBuscar_NumeroDeClientesGanhos", Conexao.DW_Condor_One_ConnectionString, "@Ano", cboAno.CallAno, "@idFilial", cboFilial.CallFilial, "@idSecao", cboSecao.CallSecao))).ToString("n0")
        lblCaption_TicketMedioGanhos.Text = "Valor do Ticket Médio: " & CDbl((oDb.GetDataDB_ExecuteScalar_Parameter3("Analises.uspBuscar_TicketMedioGanhos", Conexao.DW_Condor_One_ConnectionString, "@Ano", cboAno.CallAno, "@idFilial", cboFilial.CallFilial, "@idSecao", cboSecao.CallSecao))).ToString("n2")
        lblCaption_vlrVendaPerdidaGanhos.Text = "Valor da Venda Obtida: " & CDbl((oDb.GetDataDB_ExecuteScalar_Parameter3("Analises.uspBuscar_ValorVendaGanhos", Conexao.DW_Condor_One_ConnectionString, "@Ano", cboAno.CallAno, "@idFilial", cboFilial.CallFilial, "@idSecao", cboSecao.CallSecao))).ToString("n2")



    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)
    End Sub

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, grid, "qtdeCresc", "qtdeAT", "qtdeAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "vendaCresc", "vendaAT", "vendaAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "clientesCresc", "clientesAT", "clientesAA", Funcoes.CalculateType.Growth)

    End Sub


    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "qtdeDif")
        oFun.Grid_RedIsNegative(e, "qtdeCresc")
        oFun.Grid_RedIsNegative(e, "vendaCresc")
        oFun.Grid_RedIsNegative(e, "vendaDif")
        oFun.Grid_RedIsNegative(e, "clientesDif")
        oFun.Grid_RedIsNegative(e, "clientesCresc")
        oFun.Grid_RedIsNegative(e, "tmvAA")
        oFun.Grid_RedIsNegative(e, "numPorClienteAA")
        oFun.Grid_RedIsNegative(e, "numPorClienteAT")

    End Sub

    Protected Sub graphCrescimentoVenda_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles graphCrescimentoVenda.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY(graphCrescimentoVenda, sender, e)
    End Sub

    Protected Sub graphNCrescimentoClientes_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles graphNCrescimentoClientes.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY(graphNCrescimentoClientes, sender, e)
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        Atualizar()
    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub
End Class
