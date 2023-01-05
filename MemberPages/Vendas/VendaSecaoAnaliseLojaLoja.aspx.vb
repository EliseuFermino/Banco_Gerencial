Imports DevExpress.Web

Partial Class MemberPages_Vendas_VendaSecaoAnaliseLojaLoja
    Inherits System.Web.UI.Page

#Region " Variavei"

    Private vlrVendaAA As Decimal = 0
    Private vlrVendaAT As Decimal = 0
    Private percCrescVenda As Decimal = 0
    Private percAting As Decimal = 0
    Private clientesAA As Decimal = 0
    Private clientesAT As Decimal = 0
    Private vlrMargemAA As Decimal = 0
    Private vlrMargemAT As Decimal = 0
    Private difClientes As Decimal = 0
    Private percCrescClientes As Decimal = 0
    Private difVlrMargem As Decimal = 0
    Private percCrescMargem As Decimal = 0
    Private percDifCresc As Decimal = 0
    Private percMargemAA As Decimal = 0
    Private percMargemAT As Decimal = 0
    Private difMargem As Decimal = 0

    Private vlrMetaVenda As Decimal = 0
    Private ticketMedioAA As Decimal = 0
    Private ticketMedioAT As Decimal = 0

    Dim oFun As New Funcoes
    Dim oDT As New myDateTimes

#End Region

#Region " PAGE"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(265, User.Identity.Name)

            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = Year(Now())
            Me.cboAno.CallAno = Year(Now())

            Me.cboFilial.CallCorporacao = 199
            cboFilial.DataBindFilial()

            cboMes.AutoPostBack = True
            Me.cboMes.CallMes = Month(oDT.YesterdayDate())
            Session("sPROJECAO") = 2    'Não Projetar Vendas
            'AlterarTitulo()
            cboSize.CallSize = 100
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Análise Loja a Loja por Seção - PGR265"
        End If

    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            Session("sMES") = Me.cboMes.CallMes
            Me.cboFilial.CallCorporacao = 199
            cboFilial.DataBindFilial()
            cboFilial.Visible_cboCorporacao = False
            cboFilial.CallFilial = 99
            AlterarTitulo()
            Session("sFILIAL") = cboFilial.CallFilial
            Atualizar()

        End If
    End Sub

#End Region

    Private Sub mySession()
        Session("sANO") = Me.cboAno.CallAno
        Session("sFILIAL") = cboFilial.CallFilial

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

    Private Sub Atualizar()

        AlterarTitulo()

        Me.dsDadosVendas.DataBind()
        Me.ASPxGridView1.DataBind()
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

#Region " detailGrid"

    Protected Sub detailGrid_BeforePerformDataSelect(sender As Object, e As EventArgs)
        Session("sSECAO") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

    Protected Sub detailGrid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs)
        oFun.Grid_RedIsNegative(e, "percCrescVenda")
        oFun.Grid_RedIsNegative(e, "percCrescClientes")
        oFun.Grid_RedIsNegative(e, "percCrescMargem")
        oFun.Grid_RedIsNegative(e, "difClientes")
        oFun.Grid_RedIsNegative(e, "difMargem")
        oFun.Grid_RedIsNegative(e, "percAting")
        oFun.Grid_RedIsNegative(e, "difVlrMargem")
    End Sub

    Protected Sub detailGrid_Load(sender As Object, e As EventArgs)
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

#Region " ASPxGridView1"

    Protected Sub ASPxGridView1_HtmlDataCellPrepared1(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percCrescVenda")
        oFun.Grid_RedIsNegative(e, "percCrescClientes")
        oFun.Grid_RedIsNegative(e, "percCrescMargem")
        oFun.Grid_RedIsNegative(e, "difClientes")
        oFun.Grid_RedIsNegative(e, "difMargem")
        oFun.Grid_RedIsNegative(e, "percAting")
        oFun.Grid_RedIsNegative(e, "difVlrMargem")
    End Sub

    Protected Sub ASPxGridView1_HtmlFooterCellPrepared1(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles ASPxGridView1.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub ASPxGridView1_CustomSummaryCalculate1(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles ASPxGridView1.CustomSummaryCalculate
        On Error Resume Next
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Start Then
            vlrVendaAA = 0
            vlrVendaAT = 0
            percCrescVenda = 0
            percAting = 0
            clientesAA = 0
            clientesAT = 0
            vlrMargemAA = 0
            vlrMargemAT = 0
            difClientes = 0
            percCrescClientes = 0
            difVlrMargem = 0
            percCrescMargem = 0
            percMargemAA = 0
            percMargemAT = 0
            difMargem = 0
            vlrMetaVenda = 0
            ticketMedioAA = 0
            ticketMedioAT = 0
 
        End If

        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Calculate Then
            Dim myFilter As String = Convert.ToString(e.GetValue("descSecao"))
            If myFilter = "Total" Then
                vlrVendaAA += Convert.ToDecimal(e.GetValue("vlrVendaAA"))
                vlrVendaAT += Convert.ToDecimal(e.GetValue("vlrVendaAT"))
                percCrescVenda += Convert.ToDecimal(e.GetValue("percCrescVenda"))
                percAting += Convert.ToDecimal(e.GetValue("percAting"))
                clientesAA += Convert.ToDecimal(e.GetValue("clientesAA"))
                clientesAT += Convert.ToDecimal(e.GetValue("clientesAT"))
                vlrMargemAA += Convert.ToDecimal(e.GetValue("vlrMargemAA"))
                vlrMargemAT += Convert.ToDecimal(e.GetValue("vlrMargemAT"))
                difClientes += Convert.ToDecimal(e.GetValue("difClientes"))
                percCrescClientes += Convert.ToDecimal(e.GetValue("percCrescClientes"))
                difVlrMargem += Convert.ToDecimal(e.GetValue("difVlrMargem"))
                percCrescMargem += Convert.ToDecimal(e.GetValue("percCrescMargem"))
                percMargemAA += Convert.ToDecimal(e.GetValue("percMargemAA"))
                percMargemAT += Convert.ToDecimal(e.GetValue("percMargemAT"))
                difMargem += Convert.ToDecimal(e.GetValue("difMargem"))

                vlrMetaVenda += Convert.ToDecimal(e.GetValue("vlrMetaVenda"))
                ticketMedioAA += Convert.ToDecimal(e.GetValue("ticketMedioAA"))
                ticketMedioAT += Convert.ToDecimal(e.GetValue("ticketMedioAT"))
            End If
        End If

        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Finalize Then
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrVendaAA" Then e.TotalValue = vlrVendaAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrVendaAT" Then e.TotalValue = vlrVendaAT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCrescVenda" Then e.TotalValue = percCrescVenda
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percAting" Then e.TotalValue = percAting
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "clientesAA" Then e.TotalValue = clientesAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "clientesAT" Then e.TotalValue = clientesAT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrMargemAA" Then e.TotalValue = vlrMargemAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrMargemAT" Then e.TotalValue = vlrMargemAT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "difClientes" Then e.TotalValue = difClientes
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCrescClientes" Then e.TotalValue = percCrescClientes
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "difVlrMargem" Then e.TotalValue = difVlrMargem
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCrescMargem" Then e.TotalValue = percCrescMargem
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargemAA" Then e.TotalValue = percMargemAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargemAT" Then e.TotalValue = percMargemAT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "difMargem" Then e.TotalValue = difMargem

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrMetaVenda" Then e.TotalValue = vlrMetaVenda
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "ticketMedioAA" Then e.TotalValue = ticketMedioAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "ticketMedioAT" Then e.TotalValue = ticketMedioAT

        End If

        ' ****************************************************************************************************************************************

       
    End Sub

    Protected Sub ASPxGridView1_HtmlRowPrepared(sender As Object, e As ASPxGridViewTableRowEventArgs) Handles ASPxGridView1.HtmlRowPrepared
        Dim gridDetail As ASPxGridView = TryCast(sender, ASPxGridView)

        oFun.grid_RowSelectedWhole(gridDetail, e, "descSecao", "Depto 1", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gridDetail, e, "descSecao", "Depto 2", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gridDetail, e, "descSecao", "Depto 3", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gridDetail, e, "descSecao", "Depto 4", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gridDetail, e, "descSecao", "Depto 5", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gridDetail, e, "descSecao", "Total", Drawing.Color.LightGreen, True)
    End Sub

#End Region

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

    Protected Sub cboMes_ListMesChanged(sender As Object, e As EventArgs) Handles cboMes.ListMesChanged
        Session("sMES") = Me.cboMes.CallMes
        ChecarPeriodo()

    End Sub

End Class
