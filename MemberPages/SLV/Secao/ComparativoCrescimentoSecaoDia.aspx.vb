Imports DevExpress.Web

Partial Class MemberPages_SLV_Item_ComparativoCrescimentoSecaoDia
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes

#Region " Variaveis Ultima Linha"

    Private QtdVendasAA As Decimal = 0
    Private VendaAA As Decimal = 0
    Private LucroAA As Decimal = 0
    Private percMargemAA As Decimal = 0

    Private QtdVendasAT As Decimal = 0
    Private VendaAT As Decimal = 0
    Private LucroAT As Decimal = 0
    Private percMargemAT As Decimal = 0

    Private percCrescVolume As Decimal = 0
    Private percCresc As Decimal = 0

    Private precoMedioAA As Decimal = 0
    Private precoMedioAT As Decimal = 0
    Private Inflacao As Decimal = 0
    Private percCrescReal As Decimal = 0


#End Region

    Private Sub Sessions()

        Session("sDIA_INICIAL") = cboDia.CallDiaInicial
        Session("sDIA_FINAL") = cboDia.CallDiaFinal

        If Me.rndMesmosItens.Checked = True Then Session("sITENS") = 1 'Mesmos os Itens
        If Me.rndTodosItens.Checked = True Then Session("sITENS") = 2 'Todos os Itens

        If chkMesmosDias.Checked = True Then
            Session("sMESMOS_DIAS") = 0
        Else
            Session("sMESMOS_DIAS") = 1
        End If


    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(233, User.Identity.Name)

            'Me.cboMesInicial.CallMes = Month(Now()) - 1
            'Me.cboMesFinal.CallMes = Month(Now()) - 1

            chkMesmosDias.Checked = False
            Sessions()

            AtualizarTitulo()

            cboSize.CallSize = 100

            grid.DataBind()
        End If

    End Sub

    Private Sub AtualizarTitulo()
        'oFun.Grid_ColumnTitle(grid, "bandAnoAnterior", Me.cboAno.CallAno - 1)
        'oFun.Grid_ColumnTitle(grid, "bandAnoAtual", Me.cboAno.CallAno)
        'oFun.Grid_ColumnTitle(grid, "precoMedioAA", Me.cboAno.CallAno - 1)
        'oFun.Grid_ColumnTitle(grid, "precoMedioAT", Me.cboAno.CallAno)
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Comparativo de Crescimento por Seção - Dia - PGR233"
        End If

    End Sub

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate

        On Error Resume Next

        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Start Then

            QtdVendasAA = 0
            VendaAA = 0
            LucroAA = 0
            percMargemAA = 0

            QtdVendasAT = 0
            VendaAT = 0
            LucroAT = 0
            percMargemAT = 0

            percCrescVolume = 0
            percCresc = 0

            precoMedioAA = 0
            precoMedioAT = 0
            Inflacao = 0
            percCrescReal = 0

        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Calculate Then

            Dim myFilter As Int16 = Convert.ToInt16(e.GetValue("idProdutoSecao"))
            If myFilter = 799 Then

                QtdVendasAA += Convert.ToDecimal(e.GetValue("QtdVendasAA"))
                VendaAA += Convert.ToDecimal(e.GetValue("VendaAA"))
                LucroAA += Convert.ToDecimal(e.GetValue("LucroAA"))
                percMargemAA += Convert.ToDecimal(e.GetValue("percMargemAA"))

                QtdVendasAT += Convert.ToDecimal(e.GetValue("QtdVendasAT"))
                VendaAT += Convert.ToDecimal(e.GetValue("VendaAT"))
                LucroAT += Convert.ToDecimal(e.GetValue("LucroAT"))
                percMargemAT += Convert.ToDecimal(e.GetValue("percMargemAT"))

                percCrescVolume += Convert.ToDecimal(e.GetValue("percCrescVolume"))
                percCresc += Convert.ToDecimal(e.GetValue("percCresc"))

                precoMedioAA += Convert.ToDecimal(e.GetValue("precoMedioAA"))
                precoMedioAT += Convert.ToDecimal(e.GetValue("precoMedioAT"))
                Inflacao += Convert.ToDecimal(e.GetValue("Inflacao"))
                percCrescReal += Convert.ToDecimal(e.GetValue("percCrescReal"))

            End If

        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Finalize Then
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "QtdVendasAA" Then e.TotalValue = QtdVendasAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "VendaAA" Then e.TotalValue = VendaAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "LucroAA" Then e.TotalValue = LucroAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargemAA" Then e.TotalValue = percMargemAA

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "QtdVendasAT" Then e.TotalValue = QtdVendasAT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "VendaAT" Then e.TotalValue = VendaAT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "LucroAT" Then e.TotalValue = LucroAT
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargemAT" Then e.TotalValue = percMargemAT


            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCrescVolume" Then e.TotalValue = percCrescVolume
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCresc" Then e.TotalValue = percCresc

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "precoMedioAA" Then e.TotalValue = precoMedioAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "precoMedioAT" Then e.TotalValue = precoMedioAT

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "Inflacao" Then e.TotalValue = Inflacao
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCrescReal" Then e.TotalValue = percCrescReal

        End If


    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percMargemAA")
        oFun.Grid_RedIsNegative(e, "percMargemAT")
        oFun.Grid_RedIsNegative(e, "percCresc")
        oFun.Grid_RedIsNegative(e, "percCrescVolume")
        oFun.Grid_RedIsNegative(e, "precoMedioAA")
        oFun.Grid_RedIsNegative(e, "precoMedioAT")
        oFun.Grid_RedIsNegative(e, "Inflacao")
        oFun.Grid_RedIsNegative(e, "percCrescReal")
        oFun.Grid_RedIsNegative(e, "LucroAA")
        oFun.Grid_RedIsNegative(e, "LucroAT")
    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, Me.cboSize.CallSize)
    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback

        Sessions()

        Me.grid.DataBind()

    End Sub


    Protected Sub grid_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles grid.HtmlRowPrepared

        oFun.grid_RowSelectedWhole(grid, e, "nomeProduto", "Depto 1", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "nomeProduto", "Depto 2", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "nomeProduto", "Depto 3", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "nomeProduto", "Depto 4", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "nomeProduto", "Depto 5", Drawing.Color.LightGray, True)

        oFun.grid_RowSelectedWhole(grid, e, "nomeProduto", "Total", Drawing.Color.LightGreen, True)


    End Sub


End Class
