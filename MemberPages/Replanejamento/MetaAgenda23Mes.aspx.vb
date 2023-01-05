Imports DevExpress.Web

Partial Class MemberPages_Replanejamento_MetaAgenda23Mes
    Inherits System.Web.UI.Page


    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(390, User.Identity.Name)

            Dim varAno As Int32
            varAno = Year(Now())

            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = varAno
            Me.cboAno.CallAno = varAno

            Me.cboAno.AutoPostBack = False
            Me.cboMes.AutoPostBack = False

            oFun.Grid_Column_BorderRight(grid, "difPerc", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "nomeFilial", Drawing.Color.Gray, BorderStyle.Solid, 1)

            oFun.Grid_Column_BorderLeft(grid, "vlrRealAg23_M4", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percRealAgenda23_Media", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(grid, "percRealAgenda23_M4", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "percRealAgenda23_M3", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "percRealAgenda23_M2", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "percRealAgenda23_M1", Drawing.Color.Gray, BorderStyle.Dashed, 2)
            oFun.Grid_Column_BorderRight(grid, "percMetaAgenda23MA", Drawing.Color.Gray, BorderStyle.Dashed, 1)

            oFun.Grid_Column_BorderRight(grid, "difPercMA", Drawing.Color.Gray, BorderStyle.Dashed, 2)

            oFun.Grid_Column_BorderRight(grid, "percRealAgenda23_Acum", Drawing.Color.Gray, BorderStyle.Dashed, 1)

            oFun.Grid_Column_BorderRight(grid, "percRealAgenda23", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "percMetaAgenda23", Drawing.Color.Gray, BorderStyle.Solid, 1)



        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Meta de Agenda 23 por Mês - PGR390"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            cboSize.CallSize = 100
            mySession()

            Atualizar()
            Titulos()
        End If
    End Sub

#End Region

    Private Sub mySession()
        Session("sANO") = Me.cboAno.CallAno
        Session("sMES") = Me.cboMes.CallMes

    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
        Titulos()
    End Sub

    Private Sub Atualizar()
        mySession()
        ' oFun.Grid_Title(grid, "Titulo do Formulário")
        Me.grid.DataBind()
    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)
    End Sub

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMetaAgenda23", "vlrMetaAgenda23", "vlrMetaVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMetaAgenda23MA", "vlrMetaAgenda23MA", "vlrMetaVendaMA", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percRealAgenda23", "vlrRealAgenda23", "vlrRealVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percRealAgenda23_M1", "vlrRealAg23_M1", "vlrRealVenda_M1", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percRealAgenda23_M2", "vlrRealAg23_M2", "vlrRealVenda_M2", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percRealAgenda23_M3", "vlrRealAg23_M3", "vlrRealVenda_M3", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percRealAgenda23_M4", "vlrRealAg23_M4", "vlrRealVenda_M4", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "difPerc", "percMetaAgenda23", "percRealAgenda23", Funcoes.CalculateType.Decrease)

        oFun.Grid_Footer_Calculate(sender, e, grid, "percRealAg23_2014", "vlrRealAg23_2014", "vlrRealVenda2014", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percRealAg23_2015", "vlrRealAg23_2015", "vlrRealVenda2015", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percRealAg23_2016", "vlrRealAg23_2016", "vlrRealVenda2016", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percRealAgenda23_Acum", "vlrRealAg23AcumAtual", "vlrRealAcumAtual", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percRealAgenda23_Media", "vlrRealAg23AcumAtual", "vlrRealAcumAtual", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "difPercMA", "percMetaAgenda23MA", "percRealAgenda23_M1", Funcoes.CalculateType.Decrease)


    End Sub

    Protected Sub grid_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles grid.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "difPerc", "percMetaAgenda23", "percRealAgenda23", Funcoes.CalculateType.Decrease)
        oFun.Grid_Calculate(e, "difPercMA", "percMetaAgenda23MA", "percRealAgenda23_M1", Funcoes.CalculateType.Decrease)
    End Sub


    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "vlrRealAgenda23")
        oFun.Grid_RedIsNegative(e, "percRealAgenda23")
        oFun.Grid_RedIsNegative(e, "difPerc")
        oFun.Grid_RedIsNegative(e, "difPercMA")
    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Private Sub Titulos()

        Dim vMes As Byte = cboMes.CallMes
        Dim vAno As Int16 = cboAno.CallAno

        Select Case vMes
            Case 1
                oFun.Grid_ColumnTitle(grid, "band_M1", DateAndTime.MonthName(12, False) & "/" & vAno - 1)
                oFun.Grid_ColumnTitle(grid, "band_M2", DateAndTime.MonthName(11, False) & "/" & vAno - 2)
                oFun.Grid_ColumnTitle(grid, "band_M3", DateAndTime.MonthName(10, False) & "/" & vAno - 3)
                oFun.Grid_ColumnTitle(grid, "band_M4", DateAndTime.MonthName(9, False) & "/" & vAno - 4)
            Case 2
                oFun.Grid_ColumnTitle(grid, "band_M1", DateAndTime.MonthName(1, False) & "/" & vAno)
                oFun.Grid_ColumnTitle(grid, "band_M2", DateAndTime.MonthName(12, False) & "/" & vAno - 1)
                oFun.Grid_ColumnTitle(grid, "band_M3", DateAndTime.MonthName(11, False) & "/" & vAno - 1)
                oFun.Grid_ColumnTitle(grid, "band_M4", DateAndTime.MonthName(10, False) & "/" & vAno - 1)
            Case 3
                oFun.Grid_ColumnTitle(grid, "band_M1", DateAndTime.MonthName(2, False) & "/" & vAno)
                oFun.Grid_ColumnTitle(grid, "band_M2", DateAndTime.MonthName(1, False) & "/" & vAno)
                oFun.Grid_ColumnTitle(grid, "band_M3", DateAndTime.MonthName(12, False) & "/" & vAno - 1)
                oFun.Grid_ColumnTitle(grid, "band_M4", DateAndTime.MonthName(11, False) & "/" & vAno - 1)
            Case 4
                oFun.Grid_ColumnTitle(grid, "band_M1", DateAndTime.MonthName(3, False) & "/" & vAno)
                oFun.Grid_ColumnTitle(grid, "band_M2", DateAndTime.MonthName(2, False) & "/" & vAno)
                oFun.Grid_ColumnTitle(grid, "band_M3", DateAndTime.MonthName(1, False) & "/" & vAno)
                oFun.Grid_ColumnTitle(grid, "band_M4", DateAndTime.MonthName(12, False) & "/" & vAno - 1)
            Case Else
                oFun.Grid_ColumnTitle(grid, "band_M1", DateAndTime.MonthName(vMes - 1, False) & "/" & vAno)
                oFun.Grid_ColumnTitle(grid, "band_M2", DateAndTime.MonthName(vMes - 2, False) & "/" & vAno)
                oFun.Grid_ColumnTitle(grid, "band_M3", DateAndTime.MonthName(vMes - 3, False) & "/" & vAno)
                oFun.Grid_ColumnTitle(grid, "band_M4", DateAndTime.MonthName(vMes - 4, False) & "/" & vAno)
        End Select

        oFun.Grid_ColumnTitle(grid, "band_Atual", DateAndTime.MonthName(vMes, False) & "/" & vAno)
        oFun.Grid_ColumnTitle(grid, "band_atual_meta", DateAndTime.MonthName(vMes, False) & "/" & vAno)


    End Sub


End Class

