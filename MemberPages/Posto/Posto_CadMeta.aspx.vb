Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_Posto_Posto_CadMeta
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes

#Region " PAGE"

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim vMes As Int16
            vMes = cboMes.Date.Month


            cboAno.AnoInicial = 2019
            cboAno.AnoFinal = 2023
            cboAno.CallAno = Year(DateAndTime.Today.AddDays(-1)) + 1
            cboMes.Date = DateAndTime.Today.AddMonths(2)

            Session("sANO") = cboAno.CallAno
            Session("sMES") = cboMes.Date.Month
            Session("sFILIAL") = cboFilial.CallFilial

            grid.DataBind()

            oFun.Grid_Column_BorderLeft(grid, "vlrReal_M3", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "vlrReal_AA", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "vlrMeta", Drawing.Color.Gray, BorderStyle.Dashed, 1)

            oFun.Grid_Column_BorderRight(grid, "vlrMetaComb", Drawing.Color.Gray, BorderStyle.Solid, 1)

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Posto - Cadastro de Metas - PGR400"
        End If
    End Sub

#End Region

    Protected Sub cbPanelGrid_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanelGrid.Callback

        Session("sANO") = cboAno.CallAno

        Session("sMES") = cboMes.Date.Month
        Session("sFILIAL") = cboFilial.CallFilial
        grid.DataBind()
        Call Titulos()

    End Sub

    Protected Sub cbPanelConv_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanelConv.Callback
        Session("sANO") = cboAno.CallAno

        Session("sFILIAL") = cboFilial.CallFilial
        GridConv.DataBind()
        Call Titulos_Conv()
    End Sub

    Protected Sub cbPanelOleo_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanelOleo.Callback
        Session("sANO") = cboAno.CallAno

        Session("sFILIAL") = cboFilial.CallFilial
        gridOleo.DataBind()
        Call Titulos_Oleo()
    End Sub

    Protected Sub cbPanelLavagem_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanelLavagem.Callback
        Session("sANO") = cboAno.CallAno

        Session("sFILIAL") = cboFilial.CallFilial
        gridLavagem.DataBind()
        Call Titulos_Lavagem()
    End Sub

    Private Sub Titulos()
        On Error Resume Next

        Dim vMes As Byte
        vMes = Session("sMES")

        Dim varMesDesc_M1, varMesDesc_M2, varMesDesc_M3 As String

        Dim varMesDesc As String = MonthName(Month(cboMes.Value))


        oFun.Grid_ColumnTitle(grid, "vlrReal_M1", varMesDesc & " " & cboAno.CallAno - 2)
        oFun.Grid_ColumnTitle(grid, "vlrReal_M2", varMesDesc & " " & cboAno.CallAno - 3)
        oFun.Grid_ColumnTitle(grid, "vlrReal_M3", varMesDesc & " " & cboAno.CallAno - 4)

        oFun.Grid_ColumnTitle(grid, "vlrMeta", "Volume <br> " & varMesDesc & " " & cboAno.CallAno)
        oFun.Grid_ColumnTitle(grid, "vlrReal_AA", varMesDesc & " " & cboAno.CallAno - 1)

        oFun.Grid_ColumnTitle(grid, "percCresc_Meta", "Cresc. s/" & cboAno.CallAno - 1)
        oFun.Grid_ColumnTitle(grid, "percCresc_Meta_MA", "Cresc. s/" & cboAno.CallAno - 2)
      
    End Sub


    Private Sub Titulos_Conv()
        On Error Resume Next

        Dim vMes As Byte
        vMes = Session("sMES")

        Dim varMesDesc_M1, varMesDesc_M2, varMesDesc_M3 As String

        Dim varMesDesc As String = MonthName(Month(cboMes.Value))


        oFun.Grid_ColumnTitle(GridConv, "vlrReal_M1", varMesDesc & " " & cboAno.CallAno - 2)
        oFun.Grid_ColumnTitle(GridConv, "vlrReal_M2", varMesDesc & " " & cboAno.CallAno - 3)
        oFun.Grid_ColumnTitle(GridConv, "vlrReal_M3", varMesDesc & " " & cboAno.CallAno - 4)

        oFun.Grid_ColumnTitle(GridConv, "vlrMeta", "Reais <br> " & varMesDesc & " " & cboAno.CallAno)
        oFun.Grid_ColumnTitle(GridConv, "vlrReal_AA", varMesDesc & " " & cboAno.CallAno - 1)

        oFun.Grid_ColumnTitle(GridConv, "percCresc_Meta", "Cresc. s/" & cboAno.CallAno - 1)
        oFun.Grid_ColumnTitle(GridConv, "percCresc_Meta_MA", "Cresc. s/" & cboAno.CallAno - 2)

        ' GRID OLEO
        oFun.Grid_ColumnTitle(gridOleo, "vlrReal_M1", varMesDesc & " " & cboAno.CallAno - 2)
        oFun.Grid_ColumnTitle(gridOleo, "vlrReal_M2", varMesDesc & " " & cboAno.CallAno - 3)
        oFun.Grid_ColumnTitle(gridOleo, "vlrReal_M3", varMesDesc & " " & cboAno.CallAno - 4)

        oFun.Grid_ColumnTitle(gridOleo, "vlrMeta", "Reais <br> " & varMesDesc & " " & cboAno.CallAno)
        oFun.Grid_ColumnTitle(gridOleo, "vlrReal_AA", varMesDesc & " " & cboAno.CallAno - 1)

        oFun.Grid_ColumnTitle(gridOleo, "percCresc_Meta", "Cresc. s/" & cboAno.CallAno - 1)
        oFun.Grid_ColumnTitle(gridOleo, "percCresc_Meta_MA", "Cresc. s/" & cboAno.CallAno - 2)

        ' GRID LAVAGEM
        oFun.Grid_ColumnTitle(gridLavagem, "vlrReal_M1", varMesDesc & " " & cboAno.CallAno - 2)
        oFun.Grid_ColumnTitle(gridLavagem, "vlrReal_M2", varMesDesc & " " & cboAno.CallAno - 3)
        oFun.Grid_ColumnTitle(gridLavagem, "vlrReal_M3", varMesDesc & " " & cboAno.CallAno - 4)

        oFun.Grid_ColumnTitle(gridLavagem, "vlrMeta", "Reais <br> " & varMesDesc & " " & cboAno.CallAno)
        oFun.Grid_ColumnTitle(gridLavagem, "vlrReal_AA", varMesDesc & " " & cboAno.CallAno - 1)

        oFun.Grid_ColumnTitle(gridLavagem, "percCresc_Meta", "Cresc. s/" & cboAno.CallAno - 1)
        oFun.Grid_ColumnTitle(gridLavagem, "percCresc_Meta_MA", "Cresc. s/" & cboAno.CallAno - 2)

    End Sub

    Private Sub Titulos_Oleo()
        On Error Resume Next

        Dim vMes As Byte
        vMes = Session("sMES")

        Dim varMesDesc_M1, varMesDesc_M2, varMesDesc_M3 As String

        Dim varMesDesc As String = MonthName(Month(cboMes.Value))

        ' GRID OLEO
        oFun.Grid_ColumnTitle(gridOleo, "vlrReal_M1", varMesDesc & " " & cboAno.CallAno - 2)
        oFun.Grid_ColumnTitle(gridOleo, "vlrReal_M2", varMesDesc & " " & cboAno.CallAno - 3)
        oFun.Grid_ColumnTitle(gridOleo, "vlrReal_M3", varMesDesc & " " & cboAno.CallAno - 4)

        oFun.Grid_ColumnTitle(gridOleo, "vlrMeta", "Reais <br> " & varMesDesc & " " & cboAno.CallAno)
        oFun.Grid_ColumnTitle(gridOleo, "vlrReal_AA", varMesDesc & " " & cboAno.CallAno - 1)

        oFun.Grid_ColumnTitle(gridOleo, "percCresc_Meta", "Cresc. s/" & cboAno.CallAno - 1)
        oFun.Grid_ColumnTitle(gridOleo, "percCresc_Meta_MA", "Cresc. s/" & cboAno.CallAno - 2)
    

    End Sub

    Private Sub Titulos_Lavagem()
        On Error Resume Next

        Dim vMes As Byte
        vMes = Session("sMES")

        Dim varMesDesc_M1, varMesDesc_M2, varMesDesc_M3 As String

        Dim varMesDesc As String = MonthName(Month(cboMes.Value))

        ' GRID LAVAGEM
        oFun.Grid_ColumnTitle(gridLavagem, "vlrReal_M1", varMesDesc & " " & cboAno.CallAno - 2)
        oFun.Grid_ColumnTitle(gridLavagem, "vlrReal_M2", varMesDesc & " " & cboAno.CallAno - 3)
        oFun.Grid_ColumnTitle(gridLavagem, "vlrReal_M3", varMesDesc & " " & cboAno.CallAno - 4)

        oFun.Grid_ColumnTitle(gridLavagem, "vlrMeta", "Reais <br> " & varMesDesc & " " & cboAno.CallAno)
        oFun.Grid_ColumnTitle(gridLavagem, "vlrReal_AA", varMesDesc & " " & cboAno.CallAno - 1)

        oFun.Grid_ColumnTitle(gridLavagem, "percCresc_Meta", "Cresc. s/" & cboAno.CallAno - 1)
        oFun.Grid_ColumnTitle(gridLavagem, "percCresc_Meta_MA", "Cresc. s/" & cboAno.CallAno - 2)

    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            Call Titulos()

        End If
    End Sub

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCresc_Meta", "vlrMeta", "vlrReal_AA", Funcoes.CalculateType.Growth)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCresc_Meta_MA", "vlrMeta", "vlrReal_M1", Funcoes.CalculateType.Growth)
    End Sub

    Protected Sub grid_CustomUnboundColumnData(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDataEventArgs) Handles grid.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "percCresc_Meta", "vlrMeta", "vlrReal_AA", Funcoes.CalculateType.Growth)
        oFun.Grid_Calculate(e, "percCresc_Meta_MA", "vlrMeta", "vlrReal_M1", Funcoes.CalculateType.Growth)

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percCresc_Meta")
        oFun.Grid_RedIsNegative(e, "percCresc_Meta_MA")
    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

   

End Class
