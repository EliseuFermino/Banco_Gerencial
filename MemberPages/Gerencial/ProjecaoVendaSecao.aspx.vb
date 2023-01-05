Imports DevExpress.Web
Imports System.Data

Partial Class MemberPages_Gerencial_ProjecaoVendaSecao
    Inherits System.Web.UI.Page

    Private vlrRealAA As Decimal = 0
    Private vlrMeta As Decimal = 0
    Private vlrReal As Decimal = 0
    Private perCrescMeta As Decimal = 0
    Private percCresc As Decimal = 0
    Private projAting As Decimal = 0
    Private percAting As Decimal = 0
    Private perCrescAting As Decimal = 0

    Private percMargReal As Decimal = 0
    Private percMargCheia As Decimal = 0

    Dim oFun As New Funcoes

    Protected Sub ASPxGridView1_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles ASPxGridView1.CustomSummaryCalculate
        On Error Resume Next
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Start Then
            vlrRealAA = 0
            vlrMeta = 0
            vlrReal = 0
            perCrescMeta = 0
            percCresc = 0
            projAting = 0
            percAting = 0
            perCrescAting = 0
            percMargReal = 0
            percMargCheia = 0

        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Calculate Then

            Dim myFilter As Int16 = Convert.ToInt16(e.GetValue("idFilial"))
            If myFilter = 253 Then
                vlrRealAA += Convert.ToDecimal(e.GetValue("vlrRealAA"))
                vlrMeta += Convert.ToDecimal(e.GetValue("vlrMeta"))
                vlrReal += Convert.ToDecimal(e.GetValue("vlrReal"))
                perCrescMeta += Convert.ToDecimal(e.GetValue("perCrescMeta"))
                percCresc += Convert.ToDecimal(e.GetValue("percCresc"))
                projAting += Convert.ToDecimal(e.GetValue("projAting"))
                percAting += Convert.ToDecimal(e.GetValue("percAting"))
                perCrescAting += Convert.ToDecimal(e.GetValue("perCrescAting"))
                percMargReal += Convert.ToDecimal(e.GetValue("percMargReal"))
                percMargCheia += Convert.ToDecimal(e.GetValue("percMargCheia"))

            End If

        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Finalize Then
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRealAA" Then e.TotalValue = vlrRealAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrMeta" Then e.TotalValue = vlrMeta
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrReal" Then e.TotalValue = vlrReal
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "perCrescMeta" Then e.TotalValue = perCrescMeta
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCresc" Then e.TotalValue = percCresc
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "projAting" Then e.TotalValue = projAting
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percAting" Then e.TotalValue = percAting
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "perCrescAting" Then e.TotalValue = perCrescAting
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargReal" Then e.TotalValue = percMargReal
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargCheia" Then e.TotalValue = percMargCheia
        End If


    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percCresc")
        oFun.Grid_RedIsNegative(e, "perCrescAting")
        oFun.Grid_RedIsNegative(e, "perCrescMeta")
        oFun.Grid_RedIsNegative(e, "percAting")

        oFun.Grid_RedIsNegative(e, "percMargPDV")
        oFun.Grid_RedIsNegative(e, "percMargFinal")


        If e.DataColumn.FieldName = "idFilial" Then
            Select Case Convert.ToDouble(e.CellValue)
                Case "207", "208", "250", "251"
                    e.Cell.ForeColor = System.Drawing.Color.LightGoldenrodYellow
                Case "249", "240", "253"
                    e.Cell.ForeColor = System.Drawing.Color.Lavender
            End Select
        End If

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Me.ASPxGridView1.Columns.Item("vlrRealAA").Caption = "Venda " & Year(DateAndTime.Now()) - 1
            'Me.ASPxGridView1.Columns.Item("bandMeta").Caption = "Meta " & Year(DateAndTime.Now())
        End If

    End Sub

    Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete

        Dim NomeMes As String
        Dim oVem As New VendaEmpresaMes
        oVem.AtualizarEstatisticaPrograma(83, User.Identity.Name)

        Select Case DateAndTime.Now.AddDays(-1).Month
            Case 1
                NomeMes = "Janeiro"
            Case 2
                NomeMes = "Fevereiro"
            Case 3
                NomeMes = "Março"
            Case 4
                NomeMes = "Abril"
            Case 5
                NomeMes = "Maio"
            Case 6
                NomeMes = "Junho"
            Case 7
                NomeMes = "Julho"
            Case 8
                NomeMes = "Agosto"
            Case 9
                NomeMes = "Setembro"
            Case 10
                NomeMes = "Outubro"
            Case 11
                NomeMes = "Novembro"
            Case 12
                NomeMes = "Dezembro"
        End Select

        Me.ASPxGridView1.SettingsText.Title = "Projeção de Vendas - " & NomeMes & "/" & myDateTimes.YearToday

        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Projeção de Vendas - PGR83"
    End Sub

    Protected Sub ASPxGridView1_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles ASPxGridView1.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub ASPxGridView1_HtmlRowPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles ASPxGridView1.HtmlRowPrepared
        If e.RowType <> GridViewRowType.Data Then
        End If

        Dim NomeColuna As String = e.GetValue("idFilial")

        Select Case NomeColuna
            Case "207", "208", "251", "250"
                e.Row.BackColor = System.Drawing.Color.LightGray
                e.Row.Font.Bold = True
            Case "240"
                e.Row.BackColor = System.Drawing.Color.Lavender
                e.Row.Font.Bold = True
            Case "254"
                e.Row.BackColor = System.Drawing.Color.LightSteelBlue
                e.Row.Font.Bold = True
            Case "6099"
                e.Row.BackColor = System.Drawing.Color.PeachPuff
                e.Row.Font.Bold = True
            Case "253"
                e.Row.BackColor = System.Drawing.Color.LightGreen
                e.Row.Font.Bold = True
        End Select
    End Sub




End Class
