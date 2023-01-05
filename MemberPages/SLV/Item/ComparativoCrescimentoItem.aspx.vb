
Partial Class MemberPages_SLV_Item_ComparativoCrescimentoItem
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim varAno As Int16
    Dim varMes As Byte
    Dim varMesAT, varMesMA As String

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(223, User.Identity.Name)

            mySession()
            cboDia.Visible_MesmosDias = True
            cboDia.Visible_MesAnterior = True

            cboDia.AutoPostBack_cboDiaInicial = False
            cboDia.AutoPostBack_cboDiaFinal = False

            AtualizarTitulo()

            cboSize.CallSize = 100

            oFun.Grid_Column_BorderRight(grid, "percCresc", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percCrescVolume", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(grid, "LucroAT", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "LucroSellOutAT", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "LucroCheiaAT", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(grid, "percMargemAT", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percMargemSellOutAT", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percMargemCheiaAT", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(grid, "nomeFornecedor", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "NomeFornecedorPrincipal", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "DataInclusao", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(grid, "vlrImpostoAT", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "QtdeTrocas", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "EAN", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(grid, "percCAI_AT", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percCAI_AA", Drawing.Color.Gray, BorderStyle.Dashed, 1)

            oFun.Grid_Column_BorderRight(grid, "percImpostos_AT", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(grid, "percMAI_AT", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percMAI_AA", Drawing.Color.Gray, BorderStyle.Dashed, 1)

            grid.Visible = False

            'grid.DataBind()
        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Comparativo de Crescimento por Item - PGR223"
        End If

    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            If Not cboFilial.IsLoja Then
                oFun.Grid_Column_Visible(grid, "bandCAI", True)
                oFun.Grid_Column_Visible(grid, "bandMAI", True)
            End If

        End If

    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            'mySession()
            'grid.DataBind()
        End If
    End Sub

#End Region

    Private Sub AtualizarTitulo()
        On Error Resume Next

        Dim varMesAtual As Byte = DateAndTime.Now().AddDays(-1).Month

        varAno = Year(cboDia.CallDiaFinal)
        varMes = Month(cboDia.CallDiaFinal)

        varMesAT = MonthName(varMes, False)

        If varMesAtual = 1 Then
            varMesMA = 1
        Else
            varMesMA = MonthName(varMes - 1, False)
        End If



        If cboDia.Checked_MesAnterior = True Then

            oFun.Grid_ColumnTitle(grid, "precoMedioAA", varMesMA)
            oFun.Grid_ColumnTitle(grid, "precoMedioAT", varMesAT)

            oFun.Grid_ColumnTitle(grid, "rnkAA", varMesMA)
            oFun.Grid_ColumnTitle(grid, "rnkAT", varMesAT)

            oFun.Grid_ColumnTitle(grid, "QtdVendasAA", varMesMA)
            oFun.Grid_ColumnTitle(grid, "QtdVendasAT", varMesAT)

            oFun.Grid_ColumnTitle(grid, "VendaAA", varMesMA)
            oFun.Grid_ColumnTitle(grid, "VendaAT", varMesAT)

            oFun.Grid_ColumnTitle(grid, "vlrImpostoAA", varMesMA)
            oFun.Grid_ColumnTitle(grid, "vlrImpostoAT", varMesAT)

            oFun.Grid_ColumnTitle(grid, "LucroAA", varMesMA)
            oFun.Grid_ColumnTitle(grid, "LucroAT", varMesAT)

            oFun.Grid_ColumnTitle(grid, "LucroSellOutAA", varMesMA)
            oFun.Grid_ColumnTitle(grid, "LucroSellOutAT", varMesAT)

            oFun.Grid_ColumnTitle(grid, "LucroCheiaAA", varMesMA)
            oFun.Grid_ColumnTitle(grid, "LucroCheiaAT", varMesAT)

            oFun.Grid_ColumnTitle(grid, "percMargemAA", varMesMA)
            oFun.Grid_ColumnTitle(grid, "percMargemAT", varMesAT)

            oFun.Grid_ColumnTitle(grid, "percMargemSellOutAA", varMesMA)
            oFun.Grid_ColumnTitle(grid, "percMargemSellOutAT", varMesAT)

            oFun.Grid_ColumnTitle(grid, "percMargemCheiaAA", varMesMA)
            oFun.Grid_ColumnTitle(grid, "percMargemCheiaAT", varMesAT)

            oFun.Grid_ColumnTitle(grid, "vlrCAI_AA", varMesMA)
            oFun.Grid_ColumnTitle(grid, "vlrCAI_AT", varMesAT)

            oFun.Grid_ColumnTitle(grid, "vlrMAI_AA", varMesMA)
            oFun.Grid_ColumnTitle(grid, "vlrMAI_AT", varMesAT)

            oFun.Grid_ColumnTitle(grid, "percImpostos_AA", varMesMA)
            oFun.Grid_ColumnTitle(grid, "percImpostos_AT", varMesAT)

            oFun.Grid_ColumnTitle(grid, "bandEstoque", "Estoque em " & cboDia.CallDiaFinal)

        Else

            oFun.Grid_ColumnTitle(grid, "precoMedioAA", varAno - 1)
            oFun.Grid_ColumnTitle(grid, "precoMedioAT", varAno)

            oFun.Grid_ColumnTitle(grid, "rnkAA", varAno - 1)
            oFun.Grid_ColumnTitle(grid, "rnkAT", varAno)

            oFun.Grid_ColumnTitle(grid, "QtdVendasAA", varAno - 1)
            oFun.Grid_ColumnTitle(grid, "QtdVendasAT", varAno)

            oFun.Grid_ColumnTitle(grid, "VendaAA", varAno - 1)
            oFun.Grid_ColumnTitle(grid, "VendaAT", varAno)

            oFun.Grid_ColumnTitle(grid, "vlrImpostoAA", varAno - 1)
            oFun.Grid_ColumnTitle(grid, "vlrImpostoAT", varAno)

            oFun.Grid_ColumnTitle(grid, "LucroAA", varAno - 1)
            oFun.Grid_ColumnTitle(grid, "LucroAT", varAno)

            oFun.Grid_ColumnTitle(grid, "LucroSellOutAA", varAno - 1)
            oFun.Grid_ColumnTitle(grid, "LucroSellOutAT", varAno)

            oFun.Grid_ColumnTitle(grid, "LucroCheiaAA", varAno - 1)
            oFun.Grid_ColumnTitle(grid, "LucroCheiaAT", varAno)

            oFun.Grid_ColumnTitle(grid, "percMargemAA", varAno - 1)
            oFun.Grid_ColumnTitle(grid, "percMargemAT", varAno)

            oFun.Grid_ColumnTitle(grid, "percMargemSellOutAA", varAno - 1)
            oFun.Grid_ColumnTitle(grid, "percMargemSellOutAT", varAno)

            oFun.Grid_ColumnTitle(grid, "percMargemCheiaAA", varAno - 1)
            oFun.Grid_ColumnTitle(grid, "percMargemCheiaAT", varAno)

            oFun.Grid_ColumnTitle(grid, "vlrCAI_AA", varAno - 1)
            oFun.Grid_ColumnTitle(grid, "vlrCAI_AT", varAno)

            oFun.Grid_ColumnTitle(grid, "vlrMAI_AA", varAno - 1)
            oFun.Grid_ColumnTitle(grid, "vlrMAI_AT", varAno)

            oFun.Grid_ColumnTitle(grid, "percImpostos_AA", varAno - 1)
            oFun.Grid_ColumnTitle(grid, "percImpostos_AT", varAno)

            oFun.Grid_ColumnTitle(grid, "bandEstoque", "Estoque em " & cboDia.CallDiaFinal)

        End If

    End Sub

    Protected Sub grid_AfterPerformCallback(sender As Object, e As DevExpress.Web.ASPxGridViewAfterPerformCallbackEventArgs) Handles grid.AfterPerformCallback
        AtualizarTitulo()
    End Sub


    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate
        On Error Resume Next
        'Percentual Margem Ano Anterior
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemAA", "LucroAA", "VendaAA", Funcoes.CalculateType.ValueOverRevenue)

        'Percentual Margem Ano Atual
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemAT", "LucroAT", "VendaAT", Funcoes.CalculateType.ValueOverRevenue)

        'Percentual Margem Cheia Ano Anterior
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemCheiaAA", "LucroCheiaAA", "VendaAA", Funcoes.CalculateType.ValueOverRevenue)

        'Percentual Margem Cheia Ano Atual
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemCheiaAT", "LucroCheiaAT", "VendaAT", Funcoes.CalculateType.ValueOverRevenue)

        'Percentual Crescimento Volume
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescVolume", "QtdVendasAT", "QtdVendasAA", Funcoes.CalculateType.Growth)

        'Percentual Crescimento Vendas
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCresc", "VendaAT", "VendaAA", Funcoes.CalculateType.Growth)

        'Valor Preço Médio - Ano Anterior
        oFun.Grid_Footer_Calculate(sender, e, grid, "precoMedioAA", "VendaAA", "QtdVendasAA", Funcoes.CalculateType.Division)

        'Valor Preço Médio - Ano Antual
        oFun.Grid_Footer_Calculate(sender, e, grid, "precoMedioAT", "VendaAT", "QtdVendasAT", Funcoes.CalculateType.Division)

        'Inflacao
        oFun.Grid_Footer_Calculate(sender, e, grid, "Inflacao", "precoMedioAT", "precoMedioAA", Funcoes.CalculateType.Growth)

        'Percentual Crescimento Real
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCrescReal", "percCresc", "Inflacao", Funcoes.CalculateType.Decrease)

        'Percentual Margem Sell-Out Ano Anterior
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemSellOutAA", "LucroSellOutAA", "VendaAA", Funcoes.CalculateType.ValueOverRevenue)

        'Percentual Margem Sell-Out Ano Atual
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemSellOutAT", "LucroSellOutAT", "VendaAT", Funcoes.CalculateType.ValueOverRevenue)

        'Percentual CAI Ano Anterior
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCAI_AA", "vlrCAI_AA", "VendaAT", Funcoes.CalculateType.ValueOverRevenue)

        'Percentual CAI Ano Atual
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCAI_AT", "vlrCAI_AT", "VendaAT", Funcoes.CalculateType.ValueOverRevenue)

        'Percentual MAI Ano Anterior
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMAI_AA", "vlrMAI_AA", "VendaAT", Funcoes.CalculateType.ValueOverRevenue)

        'Percentual MAI Ano Atual
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMAI_AT", "vlrMAI_AT", "VendaAT", Funcoes.CalculateType.ValueOverRevenue)

        'Percentual Impostos Ano Anterior
        oFun.Grid_Footer_Calculate(sender, e, grid, "percImpostos_AA", "vlrImpostoAA", "VendaAA", Funcoes.CalculateType.ValueOverRevenue)

        'Percentual Impostos Ano Anterior
        oFun.Grid_Footer_Calculate(sender, e, grid, "percImpostos_AT", "vlrImpostoAT", "VendaAT", Funcoes.CalculateType.ValueOverRevenue)

    End Sub

    Protected Sub grid_ExportRenderBrick(sender As Object, e As DevExpress.Web.ASPxGridViewExportRenderingEventArgs) Handles grid.ExportRenderBrick

        Dim varMesAtual As Byte = DateAndTime.Now().AddDays(-1).Month

        varAno = Year(cboDia.CallDiaFinal)
        varMes = Month(cboDia.CallDiaFinal)

        varMesAT = MonthName(varMes, False)


        If varMesAtual = 1 Then
            varMesMA = 1
        Else
            varMesMA = MonthName(varMesAtual - 1, False)
        End If

        If cboDia.Checked_MesAnterior Then

            oFun.Exporter_ColumnTitle(e, "precoMedioAA", varMesMA)
            oFun.Exporter_ColumnTitle(e, "precoMedioAT", varMesAT)

            oFun.Exporter_ColumnTitle(e, "QtdVendasAA", varMesMA)
            oFun.Exporter_ColumnTitle(e, "QtdVendasAT", varMesAT)

            oFun.Exporter_ColumnTitle(e, "pesoAA", varMesMA)
            oFun.Exporter_ColumnTitle(e, "pesoAT", varMesAT)

            oFun.Exporter_ColumnTitle(e, "VendaAA", varMesMA)
            oFun.Exporter_ColumnTitle(e, "VendaAT", varMesAT)

            oFun.Exporter_ColumnTitle(e, "numClientesAA", varMesMA)
            oFun.Exporter_ColumnTitle(e, "numClientesAT", varMesAT)

            oFun.Exporter_ColumnTitle(e, "rnkAT", varMesAT)
            oFun.Exporter_ColumnTitle(e, "rnkAA", varMesMA)

            oFun.Exporter_ColumnTitle(e, "ImpostosAT", varMesAT)
            oFun.Exporter_ColumnTitle(e, "ImpostosAA", varMesMA)

            oFun.Exporter_ColumnTitle(e, "LucroComercialAT", varMesAT)
            oFun.Exporter_ColumnTitle(e, "LucroComercialAA", varMesMA)

            oFun.Exporter_ColumnTitle(e, "LucroSellOutAT", varMesAT)
            oFun.Exporter_ColumnTitle(e, "LucroSellOutAA", varMesMA)

            oFun.Exporter_ColumnTitle(e, "LucroCheioAT", varMesAT)
            oFun.Exporter_ColumnTitle(e, "LucroCheioAA", varMesMA)

            oFun.Exporter_ColumnTitle(e, "percMargemComercialAT", varMesAT)
            oFun.Exporter_ColumnTitle(e, "percMargemComercialAA", varMesMA)

            oFun.Exporter_ColumnTitle(e, "percMargemSellOutAT", varMesAT)
            oFun.Exporter_ColumnTitle(e, "percMargemSellOutAA", varMesMA)

            oFun.Exporter_ColumnTitle(e, "percMargemCheioAT", varMesAT)
            oFun.Exporter_ColumnTitle(e, "percMargemCheioAA", varMesMA)

            oFun.Exporter_ColumnTitle(e, "bandEstoque", "Estoque em " & cboDia.CallDiaFinal)

            oFun.Exporter_ColumnTitle(e, "vlrCAI_AA", varMesMA)
            oFun.Exporter_ColumnTitle(e, "vlrCAI_AT", varMesAT)

            oFun.Exporter_ColumnTitle(e, "vlrMAI_AA", varMesMA)
            oFun.Exporter_ColumnTitle(e, "vlrMAI_AT", varMesAT)

        Else

            oFun.Exporter_ColumnTitle(e, "precoMedioAA", varAno - 1)
            oFun.Exporter_ColumnTitle(e, "precoMedioAT", varAno)

            oFun.Exporter_ColumnTitle(e, "QtdVendasAA", varAno - 1)
            oFun.Exporter_ColumnTitle(e, "QtdVendasAT", varAno)

            oFun.Exporter_ColumnTitle(e, "pesoAA", varAno - 1)
            oFun.Exporter_ColumnTitle(e, "pesoAT", varAno)

            oFun.Exporter_ColumnTitle(e, "VendaAA", varAno - 1)
            oFun.Exporter_ColumnTitle(e, "VendaAT", varAno)

            oFun.Exporter_ColumnTitle(e, "numClientesAA", varAno - 1)
            oFun.Exporter_ColumnTitle(e, "numClientesAT", varAno)

            oFun.Exporter_ColumnTitle(e, "rnkAT", varAno)
            oFun.Exporter_ColumnTitle(e, "rnkAA", varAno - 1)

            oFun.Exporter_ColumnTitle(e, "ImpostosAT", varAno)
            oFun.Exporter_ColumnTitle(e, "ImpostosAA", varAno - 1)

            oFun.Exporter_ColumnTitle(e, "LucroComercialAT", varAno)
            oFun.Exporter_ColumnTitle(e, "LucroComercialAA", varAno - 1)

            oFun.Exporter_ColumnTitle(e, "LucroSellOutAT", varAno)
            oFun.Exporter_ColumnTitle(e, "LucroSellOutAA", varAno - 1)

            oFun.Exporter_ColumnTitle(e, "LucroCheioAT", varAno)
            oFun.Exporter_ColumnTitle(e, "LucroCheioAA", varAno - 1)

            oFun.Exporter_ColumnTitle(e, "percMargemComercialAT", varAno)
            oFun.Exporter_ColumnTitle(e, "percMargemComercialAA", varAno - 1)

            oFun.Exporter_ColumnTitle(e, "percMargemSellOutAT", varAno)
            oFun.Exporter_ColumnTitle(e, "percMargemSellOutAA", varAno - 1)

            oFun.Exporter_ColumnTitle(e, "percMargemCheioAT", varAno)
            oFun.Exporter_ColumnTitle(e, "percMargemCheioAA", varAno - 1)

            oFun.Exporter_ColumnTitle(e, "bandEstoque", "Estoque em " & cboDia.CallDiaFinal)

            oFun.Exporter_ColumnTitle(e, "vlrCAI_AA", varAno - 1)
            oFun.Exporter_ColumnTitle(e, "vlrCAI_AT", varAno)

            oFun.Exporter_ColumnTitle(e, "vlrMAI_AA", varAno - 1)
            oFun.Exporter_ColumnTitle(e, "vlrMAI_AT", varAno)

        End If


    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percMargemAA")
        oFun.Grid_RedIsNegative(e, "percMargemAT")
        oFun.Grid_RedIsNegative(e, "percMargemCheiaAT")
        oFun.Grid_RedIsNegative(e, "percMargemCheiaAA")
        oFun.Grid_RedIsNegative(e, "percCresc")
        oFun.Grid_RedIsNegative(e, "percCrescVolume")
        oFun.Grid_RedIsNegative(e, "precoMedioAA")
        oFun.Grid_RedIsNegative(e, "precoMedioAT")
        oFun.Grid_RedIsNegative(e, "Inflacao")
        oFun.Grid_RedIsNegative(e, "percCrescReal")
        oFun.Grid_RedIsNegative(e, "LucroAA")
        oFun.Grid_RedIsNegative(e, "LucroAT")
        oFun.Grid_RedIsNegative(e, "LucroCheiaAA")
        oFun.Grid_RedIsNegative(e, "LucroCheiaAT")
        oFun.Grid_RedIsNegative(e, "QtdeEstoque")
        oFun.Grid_RedIsNegative(e, "vlrEstoque")
        oFun.Grid_RedIsNegative(e, "QtdeTrocas")
    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, Me.cboSize.CallSize, False)
    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub


    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback

        mySession()

        grid.Visible = True
        AtualizarTitulo()
        Ocultar_Ano_Anterior()
        Me.grid.DataBind()


    End Sub

    Private Sub mySession()

        Session("sDIA_INICIAL") = cboDia.CallDiaInicial
        Session("sDIA_FINAL") = cboDia.CallDiaFinal

        If Me.rndMesmosItens.Checked = True Then Session("sITENS") = 1 'Mesmos os Itens
        If Me.rndTodosItens.Checked = True Then Session("sITENS") = 2 'Todos os Itens

        If cboDia.Checked_MesmosDias = True Then
            Session("sMESMOS_DIAS") = 1
        Else
            Session("sMESMOS_DIAS") = 0
        End If

        If cboDia.Checked_MesAnterior = True Then
            Session("sMES_ANTERIOR") = 1    'Normal
        Else
            Session("sMES_ANTERIOR") = 0    ' Define Mes Anterior
        End If

        Session("sFILIAL") = cboFilial.CallFilial

        If cboFilial.CallCorporacao = 3 Then
            Session("sTIPO") = "Lojas"
        ElseIf cboFilial.CallCorporacao = 9 Then
            Session("sTIPO") = "Delivery"
        End If

        

    End Sub

    Private Sub Ocultar_Ano_Anterior()

        If chkOcultarAnoAnterior.Checked = True Then
            oFun.Grid_Column_Visible(grid, "QtdVendasAA", False)
            oFun.Grid_Column_Visible(grid, "VendaAA", False)
            oFun.Grid_Column_Visible(grid, "LucroSellOutAA", False)
            oFun.Grid_Column_Visible(grid, "LucroCheiaAA", False)
            oFun.Grid_Column_Visible(grid, "LucroAA", False)
            oFun.Grid_Column_Visible(grid, "vlrImpostoAA", False)
            oFun.Grid_Column_Visible(grid, "vlrCAI_AA", False)
            oFun.Grid_Column_Visible(grid, "vlrMAI_AA", False)
            oFun.Grid_Column_Visible(grid, "percMargemAA", False)
            oFun.Grid_Column_Visible(grid, "precoMedioAA", False)
            oFun.Grid_Column_Visible(grid, "percMargemCheiaAA", False)
            oFun.Grid_Column_Visible(grid, "percMargemSellOutAA", False)
            oFun.Grid_Column_Visible(grid, "percCAI_AA", False)
            oFun.Grid_Column_Visible(grid, "percMAI_AA", False)
            oFun.Grid_Column_Visible(grid, "percImpostos_AA", False)
            oFun.Grid_Column_Visible(grid, "rnkAA", False)
            oFun.Grid_Column_Visible(grid, "percCrescVolume", False)
            oFun.Grid_Column_Visible(grid, "percCresc", False)

            oFun.Grid_Column_Width(grid, "percMargemAT", 100)
            oFun.Grid_Column_Width(grid, "percMargemCheiaAT", 100)
            oFun.Grid_Column_Width(grid, "percMargemSellOutAT", 120)
            oFun.Grid_Column_Width(grid, "percImpostos_AT", 80)

        Else
            oFun.Grid_Column_Visible(grid, "QtdVendasAA", True)
            oFun.Grid_Column_Visible(grid, "VendaAA", True)
            oFun.Grid_Column_Visible(grid, "LucroSellOutAA", True)
            oFun.Grid_Column_Visible(grid, "LucroCheiaAA", True)
            oFun.Grid_Column_Visible(grid, "LucroAA", True)
            oFun.Grid_Column_Visible(grid, "vlrImpostoAA", True)
            oFun.Grid_Column_Visible(grid, "vlrCAI_AA", True)
            oFun.Grid_Column_Visible(grid, "vlrMAI_AA", True)
            oFun.Grid_Column_Visible(grid, "percMargemAA", True)
            oFun.Grid_Column_Visible(grid, "precoMedioAA", True)
            oFun.Grid_Column_Visible(grid, "percMargemCheiaAA", True)
            oFun.Grid_Column_Visible(grid, "percMargemSellOutAA", True)
            oFun.Grid_Column_Visible(grid, "percCAI_AA", True)
            oFun.Grid_Column_Visible(grid, "percMAI_AA", True)
            oFun.Grid_Column_Visible(grid, "percImpostos_AA", True)
            oFun.Grid_Column_Visible(grid, "rnkAA", True)
            oFun.Grid_Column_Visible(grid, "percCrescVolume", True)
            oFun.Grid_Column_Visible(grid, "percCresc", True)

            oFun.Grid_Column_Width(grid, "percMargemAT", 60)
            oFun.Grid_Column_Width(grid, "percMargemCheiaAT", 60)
            oFun.Grid_Column_Width(grid, "percMargemSellOutAT", 60)
            oFun.Grid_Column_Width(grid, "percImpostos_AT", 60)
        End If

    End Sub
  
End Class
