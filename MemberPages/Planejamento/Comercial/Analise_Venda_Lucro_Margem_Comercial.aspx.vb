Imports DevExpress.Data
Imports DevExpress.Web

Partial Class MemberPages_Planejamento_Comercial_Analise_Venda_Lucro_Margem_Comercial
    Inherits System.Web.UI.Page
    

    Private vlrRealAA As Decimal = 0
    Private vlrMetaVenda As Decimal = 0
    Private vlrVendaProjetada As Decimal = 0
    Private vlrRealMA As Decimal = 0
    Private vlrRealMA1 As Decimal = 0
    Private vlrRealMA2 As Decimal = 0
    Private vlrRealMAVG As Decimal = 0
    Private vlrLucroTotalAA As Decimal = 0
    Private vlrMetaLucroTotalAA As Decimal = 0
    Private vlrLucroTotalMA As Decimal = 0
    Private percPart_RealAA As Decimal = 0
    Private percPart_MetaVenda As Decimal = 0
    Private percPart_Projetada As Decimal = 0
    Private percPart_RealMA As Decimal = 0
    Private percPart_RealMA1 As Decimal = 0
    Private percPart_RealMA2 As Decimal = 0
    Private percPart_RealMAVG As Decimal = 0
    Private percCresc_1 As Decimal = 0
    Private percCresc_Lucro As Decimal = 0
    Private percMargemAA As Decimal = 0
    Private percMargemMeta As Decimal = 0
    Private percMargemMA As Decimal = 0

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes
    Dim vAno As Int16
    Dim vMes As Byte


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            oVen.AtualizarEstatisticaPrograma(355, User.Identity.Name)
            cboAno.AnoInicial = 2019
            cboAno.AnoFinal = myDateTimes.YearToday + 1
            cboAno.CallAno = myDateTimes.YearToday
            cboSize.AutoPostBack = False
            cboMes.AutoPostBack = False
        End If

    End Sub

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback
        On Error Resume Next
        gridDados.Visible = True
        Session("sANO") = cboAno.CallAno
        Session("sSECAO") = cboSecao.CallSecao
        Session("sMES") = cboMes.CallMes
        gridDados.DataBind()
        ' lblError.Text = "Session ANO " & Session("sANO") & " Session Mes " & Session("sMES") & " Session Secao " & Session("sSECAO")

        If chkExibirHistorico.Checked = False Then
            oFun.Grid_Column_Visible(gridDados, "percPart_RealMA", False)
            oFun.Grid_Column_Visible(gridDados, "percPart_RealMA1", False)
            oFun.Grid_Column_Visible(gridDados, "percPart_RealMA2", False)

            oFun.Grid_Column_Visible(gridDados, "vlrRealMA", False)
            oFun.Grid_Column_Visible(gridDados, "vlrRealMA1", False)
            oFun.Grid_Column_Visible(gridDados, "vlrRealMA2", False)
        Else
            oFun.Grid_Column_Visible(gridDados, "percPart_RealMA", True)
            oFun.Grid_Column_Visible(gridDados, "percPart_RealMA1", True)
            oFun.Grid_Column_Visible(gridDados, "percPart_RealMA2", True)

            oFun.Grid_Column_Visible(gridDados, "vlrRealMA", True)
            oFun.Grid_Column_Visible(gridDados, "vlrRealMA1", True)
            oFun.Grid_Column_Visible(gridDados, "vlrRealMA2", True)
        End If

        Titulos()

    End Sub

    Private Sub Titulos()

        On Error Resume Next

        Dim vMesProjetado As Byte = clDataDb.ExecuteStoredProcedure_Scalar("gerKnowledge.Date.usp_MesDaProjecaoDeVedas", Conexao.gerKnowledge_str)
        Dim mf As New MyFunction
        vAno = cboAno.CallAno
        vMes = cboMes.CallMes

        gridDados.Columns("vlrRealAA").Caption = "Real " & mf.UpperCaseFirstLetter(MonthName(vMes, False) & "<br>" & vAno - 1)
        gridDados.Columns("vlrMetaVenda").Caption = "Meta " & mf.UpperCaseFirstLetter(MonthName(vMes, False) & "<br>" & vAno)

        gridDados.Columns("vlrMetaLucroTotalAA").Caption = "Meta " & mf.UpperCaseFirstLetter(MonthName(vMes, False) & "<br>" & vAno)
        gridDados.Columns("percMargemMeta").Caption = "Meta " & mf.UpperCaseFirstLetter(MonthName(vMes, False) & "<br>" & vAno)

        gridDados.Columns("vlrLucroTotalAA").Caption = "Real " & mf.UpperCaseFirstLetter(MonthName(vMes, False) & "<br>" & vAno - 1)
        gridDados.Columns("percMargemAA").Caption = "Real " & mf.UpperCaseFirstLetter(MonthName(vMes, False) & "<br>" & vAno - 1)

        gridDados.Columns("vlrVendaProjetada").Caption = "Projetado " & mf.UpperCaseFirstLetter(MonthName(vMesProjetado, False) & "<br>" & vAno)

        oFun.Grid_ColumnTitle(gridDados, "vlrRealMA", "Real " & mf.UpperCaseFirstLetter(MonthName(vMesProjetado - 1, False) & "<br>" & vAno))
        oFun.Grid_ColumnTitle(gridDados, "vlrRealMA1", "Real " & mf.UpperCaseFirstLetter(MonthName(vMesProjetado - 2, False) & "<br>" & vAno))
        oFun.Grid_ColumnTitle(gridDados, "vlrRealMA2", "Real " & mf.UpperCaseFirstLetter(MonthName(vMesProjetado - 3, False) & "<br>" & vAno))
        oFun.Grid_ColumnTitle(gridDados, "vlrRealMAVG", "Últimos Três<br>Meses Fechados")

        gridDados.Columns("vlrLucroTotalMA").Caption = "Real " & mf.UpperCaseFirstLetter(MonthName(vMesProjetado - 1, False) & "<br>" & vAno)
        gridDados.Columns("percMargemMA").Caption = "Real " & mf.UpperCaseFirstLetter(MonthName(vMesProjetado - 1, False) & "<br>" & vAno)

        'Bordes
        oFun.Grid_Column_BorderRight(gridDados, "percPart_Projetada", Drawing.Color.DimGray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(gridDados, "percPart_RealMA2", Drawing.Color.DimGray, BorderStyle.Dashed, 1)
        oFun.Grid_Column_BorderRight(gridDados, "percPart_RealMAVG", Drawing.Color.DimGray, BorderStyle.Solid, 2)

        With gridDados.Columns("percCresc_1").CellStyle.BorderRight
            .BorderColor = Drawing.Color.DarkSlateGray
            .BorderStyle = BorderStyle.Dashed
            .BorderWidth = 1
        End With

        With gridDados.Columns("vlrLucroTotalMA").CellStyle.BorderRight
            .BorderColor = Drawing.Color.DarkSlateGray
            .BorderStyle = BorderStyle.Solid
            .BorderWidth = 2
        End With

        With gridDados.Columns("nomeFilial").CellStyle.BorderRight
            .BorderColor = Drawing.Color.DarkSlateGray
            .BorderStyle = BorderStyle.Solid
            .BorderWidth = 2
        End With

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Análise de Metas por Seção - PGR355"
        End If

    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then

            Session("sANO") = cboAno.CallAno
            Session("sSECAO") = cboSecao.CallSecao

            gridDados.DataBind()

            'lblError.Text = "Session ANO " & Session("sANO") & " Session Mes " & Session("sMES") & " Session Secao " & Session("sSECAO")

            Titulos()
        End If
    End Sub

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridDados.CustomSummaryCalculate
        On Error Resume Next
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Start Then
            vlrRealAA = 0
            vlrMetaVenda = 0
            vlrVendaProjetada = 0
            vlrRealMA = 0
            vlrRealMA1 = 0
            vlrRealMA2 = 0
            vlrRealMAVG = 0
            vlrLucroTotalAA = 0
            vlrMetaLucroTotalAA = 0
            vlrLucroTotalMA = 0
            percPart_RealAA = 0
            percPart_MetaVenda = 0
            percPart_Projetada = 0
            percPart_RealMA = 0
            percPart_RealMA1 = 0
            percPart_RealMA2 = 0
            percPart_RealMAVG = 0
            percCresc_1 = 0
            percCresc_Lucro = 0
            percMargemAA = 0
            percMargemMeta = 0
            percMargemMA = 0

        End If

        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Calculate Then
            Dim myFilter As Int16 = Convert.ToInt16(e.GetValue("idFilial"))
            If myFilter = 253 Then
                vlrRealAA += Convert.ToDecimal(e.GetValue("vlrRealAA"))
                vlrMetaVenda += Convert.ToDecimal(e.GetValue("vlrMetaVenda"))
                vlrVendaProjetada += Convert.ToDecimal(e.GetValue("vlrVendaProjetada"))
                vlrRealMA += Convert.ToDecimal(e.GetValue("vlrRealMA"))
                vlrRealMA1 += Convert.ToDecimal(e.GetValue("vlrRealMA1"))
                vlrRealMA2 += Convert.ToDecimal(e.GetValue("vlrRealMA2"))
                vlrRealMAVG += Convert.ToDecimal(e.GetValue("vlrRealMAVG"))
                vlrLucroTotalAA += Convert.ToDecimal(e.GetValue("vlrLucroTotalAA"))
                vlrMetaLucroTotalAA += Convert.ToDecimal(e.GetValue("vlrMetaLucroTotalAA"))
                vlrLucroTotalMA += Convert.ToDecimal(e.GetValue("vlrLucroTotalMA"))
                percPart_RealAA += Convert.ToDecimal(e.GetValue("percPart_RealAA"))
                percPart_MetaVenda += Convert.ToDecimal(e.GetValue("percPart_MetaVenda"))
                percPart_Projetada += Convert.ToDecimal(e.GetValue("percPart_Projetada"))
                percPart_RealMA += Convert.ToDecimal(e.GetValue("percPart_RealMA"))
                percPart_RealMA1 += Convert.ToDecimal(e.GetValue("percPart_RealMA1"))
                percPart_RealMA2 += Convert.ToDecimal(e.GetValue("percPart_RealMA2"))
                percPart_RealMAVG += Convert.ToDecimal(e.GetValue("percPart_RealMAVG"))
                percCresc_1 += Convert.ToDecimal(e.GetValue("percCresc_1"))
                percCresc_Lucro += Convert.ToDecimal(e.GetValue("percCresc_Lucro"))
                percMargemAA += Convert.ToDecimal(e.GetValue("percMargemAA"))
                percMargemMeta += Convert.ToDecimal(e.GetValue("percMargemMeta"))
                percMargemMA += Convert.ToDecimal(e.GetValue("percMargemMA"))

            End If
        End If

        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Finalize Then
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRealAA" Then e.TotalValue = vlrRealAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrMetaVenda" Then e.TotalValue = vlrMetaVenda
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrVendaProjetada" Then e.TotalValue = vlrVendaProjetada
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRealMA" Then e.TotalValue = vlrRealMA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRealMA1" Then e.TotalValue = vlrRealMA1
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRealMA2" Then e.TotalValue = vlrRealMA2
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRealMAVG" Then e.TotalValue = vlrRealMAVG
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrLucroTotalAA" Then e.TotalValue = vlrLucroTotalAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrMetaLucroTotalAA" Then e.TotalValue = vlrMetaLucroTotalAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrLucroTotalMA" Then e.TotalValue = vlrLucroTotalMA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percPart_RealAA" Then e.TotalValue = percPart_RealAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percPart_MetaVenda" Then e.TotalValue = percPart_MetaVenda
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percPart_Projetada" Then e.TotalValue = percPart_Projetada
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percPart_RealMA" Then e.TotalValue = percPart_RealMA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percPart_RealMA1" Then e.TotalValue = percPart_RealMA1
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percPart_RealMA2" Then e.TotalValue = percPart_RealMA2
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percPart_RealMAVG" Then e.TotalValue = percPart_RealMAVG
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCresc_1" Then e.TotalValue = percCresc_1
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCresc_Lucro" Then e.TotalValue = percCresc_Lucro
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargemAAm" Then e.TotalValue = percMargemAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargemMeta" Then e.TotalValue = percMargemMeta
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargemMA" Then e.TotalValue = percMargemMA
            
        End If

        ' ----------------------------------------------------------------------------------------------------------------------------------------------------

        oFun.Grid_Footer_Calculate(sender, e, gridDados, "percCresc_1", "vlrMetaVenda", "vlrRealAA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, gridDados, "percCresc_Lucro", "vlrMetaLucroTotalAA", "vlrLucroTotalAA", Funcoes.CalculateType.Growth)

        oFun.Grid_Footer_Calculate(sender, e, gridDados, "percMargemAA", "vlrLucroTotalAA", "vlrRealAA", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gridDados, "percMargemMeta", "vlrMetaLucroTotalAA", "vlrMetaVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gridDados, "percMargemMA", "vlrLucroTotalMA", "vlrRealMA", Funcoes.CalculateType.ValueOverRevenue)


    End Sub

    Protected Sub gridDados_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles gridDados.CustomUnboundColumnData
        On Error Resume Next
        If e.Column.FieldName = "vlrRealMAVG" Then
            Dim vOne As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrRealMA"))
            Dim vTwo As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrRealMA1"))
            Dim vThree As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("vlrRealMA2"))
            e.Value = ((vOne + vTwo + vThree) / 3)
        End If
        
        If e.Column.FieldName = "percPart_RealMAVG" Then
            Dim vOne As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("percPart_RealMA"))
            Dim vTwo As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("percPart_RealMA1"))
            Dim vThree As Decimal = Convert.ToDecimal(e.GetListSourceFieldValue("percPart_RealMA2"))
            e.Value = ((vOne + vTwo + vThree) / 3)
        End If

    End Sub

    Protected Sub gridDados_ExportRenderBrick(sender As Object, e As ASPxGridViewExportRenderingEventArgs) Handles gridDados.ExportRenderBrick

        On Error Resume Next

        Dim vMesProjetado As Byte = clDataDb.ExecuteStoredProcedure_Scalar("gerKnowledge.Date.usp_MesDaProjecaoDeVedas", Conexao.gerKnowledge_str)
        Dim mf As New MyFunction
        vAno = cboAno.CallAno
        vMes = cboMes.CallMes

        oFun.Exporter_ColumnTitle(e, "vlrRealAA", "Real " & mf.UpperCaseFirstLetter(MonthName(vMes, False) & " " & vAno - 1))
        oFun.Exporter_ColumnTitle(e, "vlrMetaVenda", "Meta " & mf.UpperCaseFirstLetter(MonthName(vMes, False) & " " & vAno))

        oFun.Exporter_ColumnTitle(e, "vlrMetaLucroTotalAA", "Meta " & mf.UpperCaseFirstLetter(MonthName(vMes, False) & " " & vAno))
        oFun.Exporter_ColumnTitle(e, "percMargemMeta", "Meta " & mf.UpperCaseFirstLetter(MonthName(vMes, False) & " " & vAno))

        oFun.Exporter_ColumnTitle(e, "vlrLucroTotalAA", "Real " & mf.UpperCaseFirstLetter(MonthName(vMes, False) & " " & vAno - 1))
        oFun.Exporter_ColumnTitle(e, "percMargemAA", "Real " & mf.UpperCaseFirstLetter(MonthName(vMes, False) & " " & vAno - 1))

        oFun.Exporter_ColumnTitle(e, "vlrVendaProjetada", "Projetado " & mf.UpperCaseFirstLetter(MonthName(vMesProjetado, False) & " " & vAno))
        oFun.Exporter_ColumnTitle(e, "vlrRealMA", "Real " & mf.UpperCaseFirstLetter(MonthName(vMesProjetado - 1, False) & " " & vAno))

        oFun.Exporter_ColumnTitle(e, "vlrLucroTotalMA", "Real " & mf.UpperCaseFirstLetter(MonthName(vMesProjetado - 1, False) & " " & vAno))
        oFun.Exporter_ColumnTitle(e, "percMargemMA", "Real " & mf.UpperCaseFirstLetter(MonthName(vMesProjetado - 1, False) & " " & vAno))

    End Sub

    Protected Sub gridDados_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridDados.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percCresc_1")
        oFun.Grid_RedIsNegative(e, "percCresc_Lucro")

    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(gridDados, cboSize.CallSize)
    End Sub

    Protected Sub gridDados_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gridDados.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub gridDados_HtmlRowPrepared(sender As Object, e As ASPxGridViewTableRowEventArgs) Handles gridDados.HtmlRowPrepared

        oFun.grid_RowSelectedWhole(gridDados, e, "idFilial", "207", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gridDados, e, "idFilial", "208", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gridDados, e, "idFilial", "251", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gridDados, e, "idFilial", "250", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gridDados, e, "idFilial", "240", Drawing.Color.LightGreen, True)
        oFun.grid_RowSelectedWhole(gridDados, e, "idFilial", "253", Drawing.Color.Yellow, True)
        oFun.grid_RowSelectedWhole(gridDados, e, "idFilial", "254", Drawing.Color.LightBlue, True)
        oFun.grid_RowSelectedWhole(gridDados, e, "idFilial", "255", Drawing.Color.LightGreen, True)
        oFun.grid_RowSelectedWhole(gridDados, e, "idFilial", "6099", Drawing.Color.PeachPuff, True)

    End Sub

End Class
