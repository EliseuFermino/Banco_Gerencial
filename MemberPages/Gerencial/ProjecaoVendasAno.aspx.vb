Imports DevExpress.Web
Imports System.Data

Partial Class MemberPages_Gerencial_ProjecaoVendasAno
    Inherits System.Web.UI.Page

    Private vlrRealAA As Decimal = 0
    Private vlrMeta As Decimal = 0
    Private vlrReal As Decimal = 0
    Private percAtingRM As Decimal = 0
    Private percCrescRM As Decimal = 0
    Private vlrProjecaoAA As Decimal = 0
    Private percAtingAA As Decimal = 0
    Private percCrescAA As Decimal = 0
    Private vlrOri As Decimal = 0
    Private difMeta As Decimal = 0

    Dim oFun As New Funcoes

    Protected Sub ASPxGridView1_CustomSummaryCalculate(ByVal sender As Object, ByVal e As DevExpress.Data.CustomSummaryEventArgs) Handles ASPxGridView1.CustomSummaryCalculate

        On Error Resume Next
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Start Then
            vlrRealAA = 0
            vlrMeta = 0
            vlrReal = 0
            percAtingRM = 0
            percCrescRM = 0
            vlrProjecaoAA = 0
            percAtingAA = 0
            percCrescAA = 0
            vlrOri = 0
            difMeta = 0
        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Calculate Then

            Dim myFilter As Int16 = Convert.ToInt16(e.GetValue("idFilial"))
            If myFilter = 255 Then
                vlrRealAA += Convert.ToDecimal(e.GetValue("vlrRealAA"))
                vlrMeta += Convert.ToDecimal(e.GetValue("vlrMeta"))

                vlrReal += Convert.ToDecimal(e.GetValue("vlrReal"))
                percAtingRM += Convert.ToDecimal(e.GetValue("percAtingRM"))
                percCrescRM += Convert.ToDecimal(e.GetValue("percCrescRM"))
                vlrProjecaoAA += Convert.ToDecimal(e.GetValue("vlrProjecaoAA"))

                percAtingAA += Convert.ToDecimal(e.GetValue("percAtingAA"))
                percCrescAA += Convert.ToDecimal(e.GetValue("percCrescAA"))
                vlrOri += Convert.ToDecimal(e.GetValue("vlrOri"))
                difMeta += Convert.ToDecimal(e.GetValue("difMeta"))
            End If

        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Finalize Then
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRealAA" Then e.TotalValue = vlrRealAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrMeta" Then e.TotalValue = vlrMeta

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrReal" Then e.TotalValue = vlrReal
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percAtingRM" Then e.TotalValue = percAtingRM
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCrescRM" Then e.TotalValue = percCrescRM

            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrProjecaoAA" Then e.TotalValue = vlrProjecaoAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percAtingAA" Then e.TotalValue = percAtingAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCrescAA" Then e.TotalValue = percCrescAA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrOri" Then e.TotalValue = vlrOri
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "difMeta" Then e.TotalValue = difMeta
        End If


    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percCrescRM")
        oFun.Grid_RedIsNegative(e, "percCrescAA")
        oFun.Grid_RedIsNegative(e, "percAtingAA")
        oFun.Grid_RedIsNegative(e, "percAtingRM")
        oFun.Grid_RedIsNegative(e, "difMeta")

        If e.DataColumn.FieldName = "idFilial" Then
            Select Case Convert.ToDouble(e.CellValue)
                Case "207", "208", "250", "215"
                    e.Cell.ForeColor = System.Drawing.Color.LightGoldenrodYellow
                Case "249", "240", "255"
                    e.Cell.ForeColor = System.Drawing.Color.Lavender
            End Select
        End If

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(206, User.Identity.Name)
            Me.ASPxGridView1.SettingsText.Title = "Projeção de Vendas - " & Year(DateAndTime.Now())
            Me.ASPxGridView1.DataBind()
            Me.ASPxGridView1.Columns.Item("vlrRealAA").Caption = "Venda " & Year(DateAndTime.Now()) - 1
            Me.ASPxGridView1.Columns.Item("bandMeta").Caption = "Meta " & Year(DateAndTime.Now())

            lblObs.Anotacao1 = "Passos de Atualização"
            lblObs.Anotacao2 = "01 - Atualiza Todos os Dias as 06:05 da manhã pelo JOB - gerTran_Vendas_AtualizarTodosRankings no 10.1.1.18 <br /> " & _
                                "02 - Servidor 10.1.1.18, Banco: gerTran_Vendas, Stored Procedure: Vendas.uspImportarVendas_DiaAnterior <br /> " & _
                                        " &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dentro da Stored tem a stored 'gerManager.Ranking.uspAtualizarTodosRankings' <br />" & _
                               "03 - dentro da stored 'gerManager.Ranking.uspAtualizarTodosRankings' tem uma stored 'gerBI.dbo.uspAtualizaProjecaoVendasAno' <br />" & _
                               "04 - o Grid é atulizado pela query 'SELECT * FROM tblProjecaoVendasAno', no banco gerBI, servidor 10.1.1.14"


        End If
    End Sub

    Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Projeção de Vendas Anual - PGR206"
        End If
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
            Case "253"
                e.Row.BackColor = System.Drawing.Color.Yellow
                e.Row.Font.Bold = True
            Case "254"
                e.Row.BackColor = System.Drawing.Color.LightSteelBlue
                e.Row.Font.Bold = True
            Case "6099"
                e.Row.BackColor = System.Drawing.Color.PeachPuff
                e.Row.Font.Bold = True
            Case "255"
                e.Row.BackColor = System.Drawing.Color.LightGreen
                e.Row.Font.Bold = True
        End Select
    End Sub


    Private Sub AtualizarDados()
        Me.ASPxGridView1.DataBind()
    End Sub

End Class
