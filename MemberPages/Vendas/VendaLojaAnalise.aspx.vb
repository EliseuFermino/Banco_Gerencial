Imports DevExpress.Web

Partial Class MemberPages_Vendas_VendaLoja_Analise
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oDT As New myDateTimes

#Region " PAGE"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(258, User.Identity.Name)

            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = Year(Now())
            Me.cboAno.CallAno = Year(Now())

            cboMes.AutoPostBack = True
            Me.cboMes.CallMes = Month(oDT.YesterdayDate())
            Session("sPROJECAO") = 2    'Não Projetar Vendas
            AlterarTitulo()
            cboSize.CallSize = 100
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Analise de Vendas - PGR258"
        End If

    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then

            Session("sMES") = Me.cboMes.CallMes
            mySession()
            Me.ASPxGridView1.DataBind()

        End If
    End Sub

#End Region

    Protected Sub ASPxGridView1_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles ASPxGridView1.CustomSummaryCalculate

        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percCrescVenda", "vlrVendaAT", "vlrVendaAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percCrescClientes", "clientesAT", "clientesAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "vlrMedFuncAT", "vlrVendaAT", "numFuncAT", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "vlrMedFuncAA", "vlrVendaAA", "numFuncAA", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percCrescMargem", "vlrMargemAT", "vlrMargemAA", Funcoes.CalculateType.Division)

        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percMargemAA", "vlrMargemAA", "vlrVendaAA", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percMargemAT", "vlrMargemAT", "vlrVendaAT", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "difMargem", "percMargemAT", "percMargemAA", Funcoes.CalculateType.Decrease)

        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percAting", "vlrVendaAT", "vlrMetaVenda", Funcoes.CalculateType.Growth)

        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "ticketMedioAA", "vlrVendaAA", "clientesAA", Funcoes.CalculateType.Division)
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "ticketMedioAT", "vlrVendaAT", "clientesAT", Funcoes.CalculateType.Division)


    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percCrescVenda")
        oFun.Grid_RedIsNegative(e, "percCrescClientes")
        oFun.Grid_RedIsNegative(e, "percCrescMargem")
        oFun.Grid_RedIsNegative(e, "difClientes")
        oFun.Grid_RedIsNegative(e, "difMargem")
        oFun.Grid_RedIsNegative(e, "percAting")
        oFun.Grid_RedIsNegative(e, "difVlrMargem")

    End Sub

    Protected Sub ASPxGridView1_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles ASPxGridView1.HtmlFooterCellPrepared

        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback

        mySession()

        'Exibir todos os dados ou não (colocar barra de rolagem)
        If Me.chkFixar.Checked = False Then
            ASPxGridView1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Hidden
        Else
            ASPxGridView1.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Visible
        End If

        'Exibir ou Não a Lucratividade
        oFun.CheckBoxStatusExibir(optNumCliente, ASPxGridView1, "bandLucratividade")

        'Exibir ou Não a Margem
        oFun.CheckBoxStatusExibir(chkMargem, ASPxGridView1, "bandMargem")

        'Exibir ou Não a Meta de Venda
        oFun.CheckBoxStatusExibir(chkMetaVenda, ASPxGridView1, "bandMetaVenda")
        oFun.CheckBoxStatusExibir(chkMetaVenda, ASPxGridView1, "bandPercAting")

        Atualizar()

    End Sub

    Private Sub mySession()

        Session("sFILIAL") = Me.cboFilial.CallFilial
        Session("sANO") = Me.cboAno.CallAno

        Dim mesAtual As Byte = Month(DateTime.Today)
        Dim anoAtual As Int16 = Year(DateTime.Today)

        If cboAno.CallAno = anoAtual Then
            If cboMes.CallMes < mesAtual Then   ' Mes Fechado
                Session("sPROJECAO") = 0
                Session("sMESMOS_DIAS") = 1
            Else
                Session("sMESMOS_DIAS") = chkMesmosDias.CheckState
                If Me.rndAteOntem.Checked = True Then Session("sPROJECAO") = 3

                If Me.rndAteHoje.Checked = True Then Session("sPROJECAO") = 2

                If Me.rndProjetar.Checked = True Then Session("sPROJECAO") = 1
            End If
        Else
            Session("sPROJECAO") = 0
        End If

    End Sub

    Private Sub AlterarTitulo()

        oFun.Grid_ColumnTitle(ASPxGridView1, "vlrVendaAT", cboAno.CallAno)
        oFun.Grid_ColumnTitle(ASPxGridView1, "vlrVendaAA", cboAno.CallAno - 1)

        oFun.Grid_ColumnTitle(ASPxGridView1, "clientesAT", cboAno.CallAno)
        oFun.Grid_ColumnTitle(ASPxGridView1, "clientesAA", cboAno.CallAno - 1)

        oFun.Grid_ColumnTitle(ASPxGridView1, "clientesAT", cboAno.CallAno)
        oFun.Grid_ColumnTitle(ASPxGridView1, "clientesAA", cboAno.CallAno - 1)

        oFun.Grid_ColumnTitle(ASPxGridView1, "vlrMargemAT", cboAno.CallAno)
        oFun.Grid_ColumnTitle(ASPxGridView1, "vlrMargemAA", cboAno.CallAno - 1)

        oFun.Grid_ColumnTitle(ASPxGridView1, "percMargemAT", cboAno.CallAno)
        oFun.Grid_ColumnTitle(ASPxGridView1, "percMargemAA", cboAno.CallAno - 1)

        'Bordas
        oFun.Grid_Column_BorderRight(ASPxGridView1, "percCrescVenda", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(ASPxGridView1, "percCrescClientes", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(ASPxGridView1, "percCrescMargem", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(ASPxGridView1, "vlrMedFuncAT", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(ASPxGridView1, "ticketMedioAT", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(ASPxGridView1, "difMargem", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(ASPxGridView1, "percAting", Drawing.Color.Gray, BorderStyle.Solid, 2)

        If chkMetaVenda.Checked = True Then

            oFun.Grid_Column_BorderLeft(ASPxGridView1, "bandMetaVenda", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "percCrescVenda", Drawing.Color.Gray, BorderStyle.NotSet, 0)
            oFun.Grid_Column_BorderRight(ASPxGridView1, "vlrVendaAA", Drawing.Color.LightGray, BorderStyle.Solid, 1)
            ASPxGridView1.Columns.Item("percCrescVenda").VisibleIndex = 1
        Else
            ASPxGridView1.Columns.Item("percCrescVenda").VisibleIndex = 4

        End If

    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(ASPxGridView1, cboSize.CallSize)
    End Sub

#Region " gridDetail"

    Protected Sub gridDetail_BeforePerformDataSelect(sender As Object, e As EventArgs)
        Session("sDIA") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

    Protected Sub gridDetail_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs)
        oFun.Grid_RedIsNegative(e, "percCrescVenda")
        oFun.Grid_RedIsNegative(e, "percCrescClientes")
        oFun.Grid_RedIsNegative(e, "percCrescMargem")
        oFun.Grid_RedIsNegative(e, "difClientes")
        oFun.Grid_RedIsNegative(e, "difMargem")
        oFun.Grid_RedIsNegative(e, "percAting")
        oFun.Grid_RedIsNegative(e, "difVlrMargem")

    End Sub

    Protected Sub gridDetail_Load(sender As Object, e As EventArgs)
        Dim gridDetail As ASPxGridView = TryCast(sender, ASPxGridView)

        'Exibir todos os dados ou não (colocar barra de rolagem)
        If Me.chkFixar.Checked = False Then
            gridDetail.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Hidden
        Else
            gridDetail.Settings.VerticalScrollBarMode = DevExpress.Web.ScrollBarMode.Visible
        End If

        'Exibir ou Não a Lucratividade
        oFun.CheckBoxStatusExibir(optNumCliente, gridDetail, "bandLucratividade")

        'Exibir ou Não a Margem
        oFun.CheckBoxStatusExibir(chkMargem, gridDetail, "bandMargem")

        'Exibir ou Não a Meta de Venda
        oFun.CheckBoxStatusExibir(chkMetaVenda, gridDetail, "bandMetaVenda")
        oFun.CheckBoxStatusExibir(chkMetaVenda, gridDetail, "bandPercAting")

        ' Alterar Titulos
        oFun.Grid_ColumnTitle(gridDetail, "vlrVendaAT", cboAno.CallAno)
        oFun.Grid_ColumnTitle(gridDetail, "vlrVendaAA", cboAno.CallAno - 1)

        oFun.Grid_ColumnTitle(gridDetail, "clientesAT", cboAno.CallAno)
        oFun.Grid_ColumnTitle(gridDetail, "clientesAA", cboAno.CallAno - 1)

        oFun.Grid_ColumnTitle(gridDetail, "clientesAT", cboAno.CallAno)
        oFun.Grid_ColumnTitle(gridDetail, "clientesAA", cboAno.CallAno - 1)

        oFun.Grid_ColumnTitle(gridDetail, "vlrMargemAT", cboAno.CallAno)
        oFun.Grid_ColumnTitle(gridDetail, "vlrMargemAA", cboAno.CallAno - 1)

        oFun.Grid_ColumnTitle(gridDetail, "percMargemAT", cboAno.CallAno)
        oFun.Grid_ColumnTitle(gridDetail, "percMargemAA", cboAno.CallAno - 1)

        'Bordas
        oFun.Grid_Column_BorderRight(gridDetail, "percCrescVenda", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(gridDetail, "percCrescClientes", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(gridDetail, "percCrescMargem", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(gridDetail, "ticketMedioAT", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(gridDetail, "difMargem", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(gridDetail, "percAting", Drawing.Color.Gray, BorderStyle.Solid, 2)

        If chkMetaVenda.Checked = True Then

            oFun.Grid_Column_BorderLeft(gridDetail, "bandMetaVenda", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(gridDetail, "percCrescVenda", Drawing.Color.Gray, BorderStyle.NotSet, 0)
            oFun.Grid_Column_BorderRight(gridDetail, "vlrVendaAA", Drawing.Color.LightGray, BorderStyle.Solid, 1)
            gridDetail.Columns.Item("percCrescVenda").VisibleIndex = 1
        Else
            gridDetail.Columns.Item("percCrescVenda").VisibleIndex = 4
        End If

        ' SIZE  -----------------------------------------------------
        'Definir Linhas
        Select Case cboSize.CallSize
            Case 80
                gridDetail.Settings.VerticalScrollableHeight = 90
                gridDetail.Width = 730
            Case 90
                gridDetail.Settings.VerticalScrollableHeight = 120
                gridDetail.Width = 830
            Case 100
                gridDetail.Settings.VerticalScrollableHeight = 150
                gridDetail.Width = 930
            Case 110
                gridDetail.Settings.VerticalScrollableHeight = 160
                gridDetail.Width = 1020
            Case 120
                gridDetail.Settings.VerticalScrollableHeight = 190
                gridDetail.Width = 1120
            Case 130
                gridDetail.Settings.VerticalScrollableHeight = 230
                gridDetail.Width = 1210
            Case 140
                gridDetail.Settings.VerticalScrollableHeight = 260
                gridDetail.Width = 1300
            Case 150
                gridDetail.Settings.VerticalScrollableHeight = 280
                gridDetail.Width = 1300
        End Select

    End Sub

#End Region

    Protected Sub gridDetail_HtmlRowPrepared(sender As Object, e As ASPxGridViewTableRowEventArgs)
        Dim gridDetail As ASPxGridView = TryCast(sender, ASPxGridView)

        oFun.grid_RowSelectedWhole(gridDetail, e, "descSecao", "Depto 1", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gridDetail, e, "descSecao", "Depto 2", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gridDetail, e, "descSecao", "Depto 3", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gridDetail, e, "descSecao", "Depto 4", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gridDetail, e, "descSecao", "Depto 5", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gridDetail, e, "descSecao", "Total", Drawing.Color.LightGreen, True)

    End Sub

    Private Sub Atualizar()

        AlterarTitulo()

        Me.dsDadosVendas.DataBind()
        Me.ASPxGridView1.DataBind()
    End Sub

    Protected Sub cboMes_ListMesChanged(sender As Object, e As EventArgs) Handles cboMes.ListMesChanged
        Session("sMES") = Me.cboMes.CallMes
        ChecarPeriodo()
      
    End Sub


    Private Sub ChecarPeriodo()

        Dim mesAtual As Byte = Month(DateTime.Today)
        Dim anoAtual As Int16 = Year(DateTime.Today)

        If cboAno.CallAno = anoAtual Then
            If cboMes.CallMes < mesAtual Then   ' Mes Fechado
                rndMesFechado.Visible = True
                rndAteHoje.Visible = False
                rndAteOntem.Visible = False
                rndProjetar.Visible = False
                rndMesFechado.Checked = True
                Session("sPROJECAO") = 0
                chkMesmosDias.Enabled = False
                chkMesmosDias.Checked = False
                Session("sMESMOS_DIAS") = 1
            Else
                rndMesFechado.Visible = False
                rndAteHoje.Visible = True
                rndAteOntem.Visible = True
                rndProjetar.Visible = True
                rndAteOntem.Checked = True
                Session("sPROJECAO") = 3
                chkMesmosDias.Enabled = True
            End If
        Else
            rndMesFechado.Visible = True
            rndAteHoje.Visible = False
            rndAteOntem.Visible = False
            rndProjetar.Visible = False
            rndMesFechado.Checked = True

        End If

    End Sub


End Class
