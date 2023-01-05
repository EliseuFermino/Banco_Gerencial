Imports DevExpress.Web
Imports System.Data

Partial Class MemberPages_Vendas_VendaAcompanhamento_Posto
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
            If myFilter = 254 Then
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

            oFun.Grid_Column_BorderRight(ASPxGridView1, "percDifCresc", Drawing.Color.Gray, BorderStyle.Solid, 2)

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Acompanhamento de Vendas Diárias Posto- PGR000"
            Call AtualizarVendaAno()

            Session("sFILIAL") = 99
            Session("sFILIAL_VENDA_ITEM_1") = 99
            Session("sFILIAL_VENDA_ITEM_2") = 99
            Session("sFILIAL_LUCRO_NEGATIVO") = 99

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

        AtualizarVendaAno()

    End Sub

    Protected Sub chkEstatisticas_CheckedChanged(sender As Object, e As EventArgs) Handles chkEstatisticas.CheckedChanged
        oFun.CheckBoxStatusExibir(chkEstatisticas, ASPxGridView1, "bandEstatisticas")

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


    Protected Sub btnAtualizar_Click(sender As Object, e As EventArgs) Handles btnAtualizar.Click
        Call Atualizar()
    End Sub

    Protected Sub grid_Top30_Lucro_Negativo_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid_Top30_Lucro_Negativo.CustomSummaryCalculate
        On Error Resume Next

        oFun.Grid_Footer_Calculate(sender, e, grid_Top30_Lucro_Negativo, "percMargem", "LucroComercial", "Venda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid_Top30_Lucro_Negativo, "percMargemSellOut", "LucroSellOut", "Venda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid_Top30_Lucro_Negativo, "percMargemFinal", "vlrLucroFinal", "Venda", Funcoes.CalculateType.ValueOverRevenue)


    End Sub

    Protected Sub grid_Top30_Lucro_Negativo_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid_Top30_Lucro_Negativo.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub grid_Top30_Lucro_Negativo_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid_Top30_Lucro_Negativo.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "LucroComercial")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "vlrLucroFinal")
        oFun.Grid_RedIsNegative(e, "percMargemFinal")
    End Sub


End Class
