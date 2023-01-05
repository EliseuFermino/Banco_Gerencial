
Partial Class MemberPages_SLV_Fornecedor_VendaFornecedorComSellOut
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback
        Session("sDIAINICIAL") = Me.cboPeriodo.CallDiaInicial
        Session("sDIAFINAL") = Me.cboPeriodo.CallDiaFinal
        Session("sBASE_CNPJ") = Me.chkCNPJ_Principal.Value

        Call PreencherTitle()
        Call PreencherBordas()

        Select Case cboExibir.Value
            Case 1
                Visible_Lucro(True)
                Visible_Margem(True)

            Case 2  'Margem
                Visible_Lucro(False)
                Visible_Margem(True)

            Case 3  'Lucro
                Visible_Margem(False)
                Visible_Lucro(True)
        End Select

        Me.grid.Visible = True
        Me.grid.DataBind()

        'Label1.Text = Session("sDIAINICIAL") & " --  " & Session("sDIAFINAL")

    End Sub

    Private Sub Visible_Margem(ByVal iBoolean As Boolean)
        oFun.Grid_Column_Visible(grid, "bandMargem", iBoolean)
        oFun.Grid_Column_Visible(grid, "bandMargemSellOut", iBoolean)
        oFun.Grid_Column_Visible(grid, "bandMargemPraticada", iBoolean)
    End Sub

    Private Sub Visible_Lucro(ByVal iBoolean As Boolean)
        oFun.Grid_Column_Visible(grid, "bandLucro", iBoolean)
        oFun.Grid_Column_Visible(grid, "bandLucroPraticado", iBoolean)
        oFun.Grid_Column_Visible(grid, "bandLucroSellOut", iBoolean)
    End Sub

    Protected Sub grid_ExportRenderBrick(sender As Object, e As DevExpress.Web.ASPxGridViewExportRenderingEventArgs) Handles grid.ExportRenderBrick
        PreencherTitle()
    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared


        oFun.Grid_RedIsNegative(e, "percCresc_QtdeAA")
        oFun.Grid_RedIsNegative(e, "percCresc_vlrVendaAA")
        oFun.Grid_RedIsNegative(e, "percCresc_vlrLucroAA")
        oFun.Grid_RedIsNegative(e, "percCresc_LucroSellOutAA")
        oFun.Grid_RedIsNegative(e, "vlrLucroAA")
        oFun.Grid_RedIsNegative(e, "vlrLucroAT")
        oFun.Grid_RedIsNegative(e, "vlrLucroPraticadoAA")
        oFun.Grid_RedIsNegative(e, "vlrLucroPraticadoAT")
        oFun.Grid_RedIsNegative(e, "percCresc_vlrLucroPraticadoAA")

        oFun.Grid_RedIsNegative(e, "percMargemAA")
        oFun.Grid_RedIsNegative(e, "percMargemAT")
        oFun.Grid_RedIsNegative(e, "percMargemDif")

        oFun.Grid_RedIsNegative(e, "percMargemPraticadaAA")
        oFun.Grid_RedIsNegative(e, "percMargemPraticadaAT")
        oFun.Grid_RedIsNegative(e, "percMargemPraticadaDif")

        oFun.Grid_RedIsNegative(e, "percMargemSellOutAA")
        oFun.Grid_RedIsNegative(e, "percMargemSellOutAT")
        oFun.Grid_RedIsNegative(e, "percMargemSellOutDif")

        'If e.DataColumn.FieldName = "percMargemSellOut" Or
        '    e.DataColumn.FieldName = "percMargem" Or
        '    e.DataColumn.FieldName = "vlrLucro" Or
        '    e.DataColumn.FieldName = "vlrLucroPraticado" Or
        '    e.DataColumn.FieldName = "percMargemPraticada" Or
        '    e.DataColumn.FieldName = "LucroSellOut" Then
        '    If Convert.ToDouble(e.CellValue) < 0 Then
        '        e.Cell.ForeColor = System.Drawing.Color.Red
        '    End If
        'End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(145, User.Identity.Name)
            cboSize.CallSize = 100
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete

        CType(Master.FindControl("lblTitle"), Label).Text = "Venda por Fornecedor com SellOut - PGR145"

    End Sub

    Private Sub PreencherTitle()
        Dim myDateFinal As Date
        Dim Mes As Byte
        Dim AnoAT, AnoAA As Int16
        Dim myMesName, myDiaAT, myDiaAA As String

        myDateFinal = Me.cboPeriodo.CallDiaFinal
        Mes = Month(myDateFinal)
        myMesName = MonthName(Mes, True)
        AnoAT = Year(myDateFinal)
        AnoAA = AnoAT - 1
        myDiaAT = myMesName & "/" & AnoAT
        myDiaAA = myMesName & "/" & AnoAA

        'Qtde
        oFun.Grid_ColumnTitle(grid, "QtdeAA", myDiaAA)
        oFun.Grid_ColumnTitle(grid, "QtdeAT", myDiaAT)

        'Vendas
        oFun.Grid_ColumnTitle(grid, "vlrVendaAA", myDiaAA)
        oFun.Grid_ColumnTitle(grid, "vlrVendaAT", myDiaAT)

        'Margem
        oFun.Grid_ColumnTitle(grid, "percMargemAA", myDiaAA)
        oFun.Grid_ColumnTitle(grid, "percMargemAT", myDiaAT)

        'Lucro
        oFun.Grid_ColumnTitle(grid, "vlrLucroAA", myDiaAA)
        oFun.Grid_ColumnTitle(grid, "vlrLucroAT", myDiaAT)

        'Margem Sell-Out
        oFun.Grid_ColumnTitle(grid, "percMargemSellOutAA", myDiaAA)
        oFun.Grid_ColumnTitle(grid, "percMargemSellOutAT", myDiaAT)

        'Lucro Sell-Out
        oFun.Grid_ColumnTitle(grid, "LucroSellOutAA", myDiaAA)
        oFun.Grid_ColumnTitle(grid, "LucroSellOutAT", myDiaAT)

        'Margem Praticada
        oFun.Grid_ColumnTitle(grid, "percMargemPraticadaAA", myDiaAA)
        oFun.Grid_ColumnTitle(grid, "percMargemPraticadaAT", myDiaAT)

        'Lucro Praticado
        oFun.Grid_ColumnTitle(grid, "vlrLucroPraticadoAA", myDiaAA)
        oFun.Grid_ColumnTitle(grid, "vlrLucroPraticadoAT", myDiaAT)

        'VALOR DO CAI
        oFun.Grid_ColumnTitle(grid, "vlrCAI_AA", myDiaAA)
        oFun.Grid_ColumnTitle(grid, "vlrCAI_AT", myDiaAT)

        'PERCENTUAL DO CAI
        oFun.Grid_ColumnTitle(grid, "percCAI_AA", myDiaAA)
        oFun.Grid_ColumnTitle(grid, "percCAI_AT", myDiaAT)

    End Sub

    Private Sub PreencherBordas()

        oFun.Grid_Column_BorderRight(grid, "nomeFornecedor", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "percCresc_QtdeAA", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "percCresc_vlrVendaAA", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "percMargemDif", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "percCresc_vlrLucroAA", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "percMargemSellOutDif", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "percCresc_LucroSellOutAA", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "percMargemPraticadaDif", Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(grid, "percCresc_vlrLucroPraticadoAA", Drawing.Color.Gray, BorderStyle.Solid, 2)

    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize

        Select Case cboSize.CallSize
            Case 80
                grid.SettingsPager.PageSize = 10
            Case 90
                grid.SettingsPager.PageSize = 13
            Case 100
                grid.SettingsPager.PageSize = 15
            Case 110
                grid.SettingsPager.PageSize = 17
            Case 120
                grid.SettingsPager.PageSize = 18
            Case 130
                grid.SettingsPager.PageSize = 20
            Case 140
                grid.SettingsPager.PageSize = 24
            Case 150
                grid.SettingsPager.PageSize = 28
            Case 160
                grid.SettingsPager.PageSize = 32
            Case 170
                grid.SettingsPager.PageSize = 36
            Case Else
                grid.SettingsPager.PageSize = 15
        End Select

        oFun.Grid_Size(grid, cboSize.CallSize)
        PreencherTitle()
        PreencherBordas()
        grid.DataBind()
    End Sub

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCAI_AA", "vlrCAI_AA", "vlrVendaAA", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCAI_AT", "vlrCAI_AT", "vlrVendaAT", Funcoes.CalculateType.ValueOverRevenue)
    End Sub
End Class
