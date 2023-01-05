#Region " Imports"

Imports DevExpress.Web

Imports System.Data.SqlClient
Imports System.Data

#End Region

Partial Class Media_Agenda23_Meta
    Inherits System.Web.UI.Page

    Private connDW As String = clData_DW_Condor.dbConnect
    Dim oFun As New Funcoes

#Region " Variaveis Ultima Linha"

    Private vlrAg23_Mes6 As Decimal = 0
    Private vlrAg23_Mes5 As Decimal = 0
    Private vlrAg23_Mes4 As Decimal = 0
    Private vlrAg23_Mes3 As Decimal = 0
    Private vlrAg23_Mes2 As Decimal = 0
    Private vlrAg23_Mes1 As Decimal = 0
    Private percAg23_Mes6 As Decimal = 0
    Private percAg23_Mes5 As Decimal = 0
    Private percAg23_Mes4 As Decimal = 0
    Private percAg23_Mes3 As Decimal = 0
    Private percAg23_Mes2 As Decimal = 0
    Private percAg23_Mes1 As Decimal = 0
    Private vlrAg23_Media As Decimal = 0
    Private percAg23_Media As Decimal = 0

#End Region

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback

        Dim oVem As New VendaEmpresaMes

        CallSession()

        Me.grid.Settings.ShowFilterRow = False
        oVem.AtualizarEstatisticaPrograma(401, User.Identity.Name)

        grid.DataBind()

        Call Titulos()
        Me.cbPanel.SettingsLoadingPanel.Delay = 0

    End Sub

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            cboAno.CallAno = Year(DateAndTime.Now)
            cboFilial.AutoPostBack = False
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then

            Dim oVem As New VendaEmpresaMes

            CallSession()

            Me.grid.Settings.ShowFilterRow = False


            Call Titulos()

            Me.cbPanel.SettingsLoadingPanel.Delay = 0

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Meta de Quebra com Base nos Últimos 6 Meses - Agenda 23 - PGR401"
            CType(Master.Master.FindControl("lblTitle"), Label).ToolTip = "Informações do Relizado das Agendas 23 (Quebras) dos últimos 6 meses que serve como base para o cálculo das Metas de Agenda 23. "
        End If

    End Sub

#End Region


#Region " Grid"

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate

        On Error Resume Next

        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Start Then
            vlrAg23_Mes6 = 0
            vlrAg23_Mes5 = 0
            vlrAg23_Mes4 = 0
            vlrAg23_Mes3 = 0
            vlrAg23_Mes2 = 0
            vlrAg23_Mes1 = 0
            percAg23_Mes6 = 0
            percAg23_Mes5 = 0
            percAg23_Mes4 = 0
            percAg23_Mes3 = 0
            percAg23_Mes2 = 0
            percAg23_Mes1 = 0
            vlrAg23_Media = 0
            percAg23_Media = 0

        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Calculate Then

            Dim myFilter As Int16 = Convert.ToInt16(e.GetValue("idProdutoSecao"))
            If myFilter = 799 Then

                vlrAg23_Mes6 += Convert.ToDecimal(e.GetValue("vlrAg23_Mes6"))
                vlrAg23_Mes5 += Convert.ToDecimal(e.GetValue("vlrAg23_Mes5"))
                vlrAg23_Mes4 += Convert.ToDecimal(e.GetValue("vlrAg23_Mes4"))
                vlrAg23_Mes3 += Convert.ToDecimal(e.GetValue("vlrAg23_Mes3"))
                vlrAg23_Mes2 += Convert.ToDecimal(e.GetValue("vlrAg23_Mes2"))
                vlrAg23_Mes1 += Convert.ToDecimal(e.GetValue("vlrAg23_Mes1"))
                percAg23_Mes6 += Convert.ToDecimal(e.GetValue("percAg23_Mes6"))
                percAg23_Mes5 += Convert.ToDecimal(e.GetValue("percAg23_Mes5"))
                percAg23_Mes4 += Convert.ToDecimal(e.GetValue("percAg23_Mes4"))
                percAg23_Mes3 += Convert.ToDecimal(e.GetValue("percAg23_Mes3"))
                percAg23_Mes2 += Convert.ToDecimal(e.GetValue("percAg23_Mes2"))
                percAg23_Mes1 += Convert.ToDecimal(e.GetValue("percAg23_Mes1"))
                vlrAg23_Media += Convert.ToDecimal(e.GetValue("vlrAg23_Media"))
                percAg23_Media += Convert.ToDecimal(e.GetValue("percAg23_Media"))

            End If

        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Finalize Then
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrAg23_Mes6" Then e.TotalValue = vlrAg23_Mes6
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrAg23_Mes5" Then e.TotalValue = vlrAg23_Mes5
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrAg23_Mes4" Then e.TotalValue = vlrAg23_Mes4
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrAg23_Mes3" Then e.TotalValue = vlrAg23_Mes3
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrAg23_Mes2" Then e.TotalValue = vlrAg23_Mes2
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrAg23_Mes1" Then e.TotalValue = vlrAg23_Mes1
            
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percAg23_Mes6" Then e.TotalValue = percAg23_Mes6
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percAg23_Mes5" Then e.TotalValue = percAg23_Mes5
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percAg23_Mes4" Then e.TotalValue = percAg23_Mes4
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percAg23_Mes3" Then e.TotalValue = percAg23_Mes3
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percAg23_Mes2" Then e.TotalValue = percAg23_Mes2
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percAg23_Mes1" Then e.TotalValue = percAg23_Mes1

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrAg23_Media" Then e.TotalValue = vlrAg23_Media
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percAg23_Media" Then e.TotalValue = percAg23_Media
        End If


    End Sub


    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)
    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared

        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        On Error Resume Next
        oFun.Grid_RedIsNegative(e, "vlrAg23_Media")
        oFun.Grid_RedIsNegative(e, "vlrAg23_Mes6")
        oFun.Grid_RedIsNegative(e, "vlrAg23_Mes5")
        oFun.Grid_RedIsNegative(e, "vlrAg23_Mes4")
        oFun.Grid_RedIsNegative(e, "vlrAg23_Mes3")
        oFun.Grid_RedIsNegative(e, "vlrAg23_Mes2")
        oFun.Grid_RedIsNegative(e, "vlrAg23_Mes1")

        oFun.Grid_RedIsNegative(e, "percAg23_Media")
        oFun.Grid_RedIsNegative(e, "percAg23_Mes6")
        oFun.Grid_RedIsNegative(e, "percAg23_Mes5")
        oFun.Grid_RedIsNegative(e, "percAg23_Mes4")
        oFun.Grid_RedIsNegative(e, "percAg23_Mes3")
        oFun.Grid_RedIsNegative(e, "percAg23_Mes2")
        oFun.Grid_RedIsNegative(e, "percAg23_Mes1")

    End Sub

    Protected Sub grid_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles grid.HtmlRowPrepared

        oFun.grid_RowSelectedWhole(grid, e, "descId", "Depto 1 - Mercearia", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descId", "Depto 2 - Pereciveis", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descId", "Depto 3 - Bazar", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descId", "Depto 4 - Textil", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descId", "Depto 5 - Eletro", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descId", "Total", Drawing.Color.LightGreen, True)

    End Sub

#End Region



#Region " SESSION"

    Private Sub CallSession()
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Session("sANO") = Me.cboAno.CallAno
        Session("sMES") = Me.cboMes.CallMes

    End Sub

#End Region

    Private Sub Titulos()

        Dim vAno As Int16
        Dim vMes As Byte

        Dim Mes1 As Byte
        Dim Mes2 As Byte
        Dim Mes3 As Byte
        Dim Mes4 As Byte
        Dim Mes5 As Byte
        Dim Mes6 As Byte

        Dim Ano1 As Int16
        Dim Ano2 As Int16
        Dim Ano3 As Int16
        Dim Ano4 As Int16
        Dim Ano5 As Int16
        Dim Ano6 As Int16

        vAno = Session("sANO")
        vMes = Session("sMES")

        Select Case vMes
            Case 1
                Mes6 = 12
                Mes5 = 11
                Mes4 = 10
                Mes3 = 9
                Mes2 = 8
                Mes1 = 7

                Ano6 = vAno - 1
                Ano5 = vAno - 1
                Ano4 = vAno - 1
                Ano3 = vAno - 1
                Ano2 = vAno - 1
                Ano1 = vAno - 1
            Case 2
                Mes6 = 1
                Mes5 = 12
                Mes4 = 11
                Mes3 = 10
                Mes2 = 9
                Mes1 = 8

                Ano6 = vAno
                Ano5 = vAno - 1
                Ano4 = vAno - 1
                Ano3 = vAno - 1
                Ano2 = vAno - 1
                Ano1 = vAno - 1
            Case 3
                Mes6 = 2
                Mes5 = 1
                Mes4 = 12
                Mes3 = 11
                Mes2 = 10
                Mes1 = 9

                Ano6 = vAno
                Ano5 = vAno
                Ano4 = vAno - 1
                Ano3 = vAno - 1
                Ano2 = vAno - 1
                Ano1 = vAno - 1
            Case 4
                Mes6 = 3
                Mes5 = 2
                Mes4 = 1
                Mes3 = 12
                Mes2 = 11
                Mes1 = 10

                Ano6 = vAno
                Ano5 = vAno
                Ano4 = vAno
                Ano3 = vAno - 1
                Ano2 = vAno - 1
                Ano1 = vAno - 1
            Case 5
                Mes6 = 4
                Mes5 = 3
                Mes4 = 2
                Mes3 = 1
                Mes2 = 12
                Mes1 = 11

                Ano6 = vAno
                Ano5 = vAno
                Ano4 = vAno
                Ano3 = vAno
                Ano2 = vAno - 1
                Ano1 = vAno - 1
            Case 6
                Mes6 = 5
                Mes5 = 4
                Mes4 = 3
                Mes3 = 2
                Mes2 = 1
                Mes1 = 12

                Ano6 = vAno
                Ano5 = vAno
                Ano4 = vAno
                Ano3 = vAno
                Ano2 = vAno
                Ano1 = vAno - 1
            Case Else
                Mes6 = vMes - 1
                Mes5 = vMes - 2
                Mes4 = vMes - 3
                Mes3 = vMes - 4
                Mes2 = vMes - 5
                Mes1 = vMes - 6

                Ano6 = vAno
                Ano5 = vAno
                Ano4 = vAno
                Ano3 = vAno
                Ano2 = vAno
                Ano1 = vAno
        End Select

        Call TitleDetail("band6", Mes6, Ano6)
        Call TitleDetail("band5", Mes5, Ano5)
        Call TitleDetail("band4", Mes4, Ano4)
        Call TitleDetail("band3", Mes3, Ano3)
        Call TitleDetail("band2", Mes2, Ano2)
        Call TitleDetail("band1", Mes1, Ano1)

        oFun.Grid_ColumnTitle(grid, "bandMedia", "Meta de " & MonthName(vMes) & "/" & vAno)
        grid.Columns("bandMedia").ToolTip = "Valor e o Percentual da Meta da Agenda 23 (Quebra Conhecida) do Mês de " & MonthName(vMes) & "/" & vAno & " é a Média dos últimos 6 meses realizados"
        grid.Columns("vlrAg23_Media").ToolTip = "Valor da Meta da Agenda 23 (Quebra Conhecida) do Mês de " & MonthName(vMes) & "/" & vAno & " é a Média dos últimos 6 meses realizados"
        grid.Columns("percAg23_Media").ToolTip = "Percentual da Meta da Agenda 23 (Quebra Conhecida) do Mês de " & MonthName(vMes) & "/" & vAno & " é a Média dos últimos 6 meses realizados"

    End Sub

    Private Sub TitleDetail(ByVal iBand As String, ByVal iMes As Byte, iAno As Int16)
        On Error Resume Next
        oFun.Grid_ColumnTitle(grid, iBand, MonthName(iMes) & "/" & iAno)
        grid.Columns(iBand).ToolTip = "Valor e o Percentual da Agenda 23 (Quebra Conhecida) realizado no Mês de " & MonthName(iMes) & "/" & iAno & "."
    End Sub


    Protected Sub pb_DataBound(ByVal sender As Object, ByVal e As EventArgs)
        Dim progressBar As ASPxProgressBar = CType(sender, ASPxProgressBar)

        If progressBar.Position > 100 Then
            progressBar.Position = 100
        End If

        If progressBar.Position >= 100.0 Then
            progressBar.IndicatorStyle.BackColor = Drawing.Color.Green
        Else
            progressBar.IndicatorStyle.BackColor = Drawing.Color.LightCoral
        End If
    End Sub


End Class
