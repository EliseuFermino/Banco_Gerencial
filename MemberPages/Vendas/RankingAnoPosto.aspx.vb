Imports System.Data
Imports DevExpress.Web
Imports System.Data.SqlClient

Partial Class MemberPages_RankingAnoPosto
    Inherits System.Web.UI.Page

    Private vlrMeta As Decimal = 0
    Private vlrRea As Decimal = 0
    Private percPart_vlrRea As Decimal = 0
    Private vlrMA As Decimal = 0
    Private vlrAA1 As Decimal = 0
    Private vlrAA2 As Decimal = 0
    Private vlrAA3 As Decimal = 0
    Private percCresc_RealMeta As Decimal = 0
    Private percMA As Decimal = 0
    Private percCresc_RealAA1 As Decimal = 0
    Private percCresc_RealAA3 As Decimal = 0
    Private percCresc_RealAA2 As Decimal = 0
    Private vlrMetaAnual As Decimal = 0
    Private percCresc_MetaAnual As Decimal = 0
    Private percMargMeta As Decimal = 0
    Private percMargReal As Decimal = 0
    Private percMargemDif As Decimal = 0
    Private percMargCheia As Decimal = 0

#Region " Variaveis Ultima Linha"


    Private Qtde_AA As Decimal = 0
    Private vlrVenda_AA As Decimal = 0

    Private Qtde_AT As Decimal = 0
    Private vlrVenda_AT As Decimal = 0

    Private percMargem_AA As Decimal = 0
    Private percMargem_AT As Decimal = 0
    Private percPart_AA As Decimal = 0
    Private percPart_AT As Decimal = 0

    Private percCresc_Venda As Decimal = 0
    Private percCresc_Qtde As Decimal = 0
    Private percCresc_Lucro As Decimal = 0


    Private percMargemSellout_AT As Decimal = 0
    Private percMargemFinal_AT As Decimal = 0

    Private percMargemSellout_AA As Decimal = 0
    Private percMargemFinal_AA As Decimal = 0


#End Region


    Dim oFun As New Funcoes
    Dim oTime As New myDateTimes

    Sub BuscaTitulo()

        If Me.cboAno.CallAno = Year(DateAndTime.Now()) Then
            oFun.Grid_Title(ASPxGridView1, "Ranking de Vendas Acumulado - Período de 01/01/" & Me.cboAno.CallAno & " à " & DateAndTime.Today.AddDays(-1) & ".")
        Else
            oFun.Grid_Title(ASPxGridView1, "Ranking de Vendas Acumulado - Período de 01/01/" & Me.cboAno.CallAno & " à " & GetLastDayOfMonth(12, Me.cboAno.CallAno) & ".")
        End If
    End Sub

    Public Function GetLastDayOfMonth(ByVal intMonth As Byte, ByVal intYear As Int16) As Date
        GetLastDayOfMonth = DateSerial(intYear, intMonth + 1, 0)
    End Function




    Protected Sub chkAnoAnterior_CheckedChanged(sender As Object, e As EventArgs) Handles chkAnoAnterior.CheckedChanged

        If Me.chkAnoAnterior.Checked = True Then
            oFun.Grid_Column_Visible(ASPxGridView1, "percCresc_RealAA3", True)
            oFun.Grid_Column_Visible(ASPxGridView1, "vlrAA3", True)
        Else
            oFun.Grid_Column_Visible(ASPxGridView1, "percCresc_RealAA3", False)
            oFun.Grid_Column_Visible(ASPxGridView1, "vlrAA3", False)
        End If
    End Sub

    Protected Sub chkFixarCabecalho_chkFixarCabecalhoChecked(sender As Object, e As EventArgs) Handles chkFixarCabecalho.chkFixarCabecalhoChecked
        If Me.chkFixarCabecalho.Checked = True Then
            Me.ASPxGridView1.Settings.ShowVerticalScrollBar = True
        Else
            Me.ASPxGridView1.Settings.ShowVerticalScrollBar = False
        End If
    End Sub

    Private Sub Atualizar()
        mySession()
        Call MudarLegendaAnos()
        Me.ASPxGridView1.DataBind()

        Call BuscaTitulo()
    End Sub

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes

            oVem.AtualizarEstatisticaPrograma(43, User.Identity.Name)
            Me.chkFixarCabecalho.Checked = True

            cboAno.AutoPostBack = False
            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = Year(Now())
            If Month(DateAndTime.Now()) > 2 Then
                Me.cboAno.CallAno = Year(Now())
            Else
                Me.cboAno.CallAno = Year(Now()) - 1
            End If


            Session("sANO") = Me.cboAno.CallAno
            Call MudarLegendaAnos()
            Call Atualizar()
            mySession()

            
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Ranking de Vendas dos Postos Anual - PGR43"
        End If

    End Sub

#End Region

    Private Sub MudarLegendaAnos()
        oFun.Grid_ColumnTitle(ASPxGridView1, "bandAtual", cboAno.CallAno)

        oFun.Grid_ColumnTitle(ASPxGridView1, "bandAA1", cboAno.CallAno - 1)
        oFun.Grid_ColumnTitle(ASPxGridView1, "bandAA2", cboAno.CallAno - 2)
        oFun.Grid_ColumnTitle(ASPxGridView1, "bandAA3", cboAno.CallAno - 3)

        oFun.Grid_ColumnTitle(ASPxGridView1, "bandCrescAA1", cboAno.CallAno - 1)
        oFun.Grid_ColumnTitle(ASPxGridView1, "bandCrescAA2", cboAno.CallAno - 2)
        oFun.Grid_ColumnTitle(ASPxGridView1, "bandCrescAA3", cboAno.CallAno - 3)

        Me.chkAnoAnterior.Text = "Exibir " & Me.cboAno.CallAno - 3

    End Sub

    Private Sub mySession()
        Dim myDiaInicial As Date
        Dim myDiaFinal As Date

        myDiaInicial = oTime.GetFirstDayOfYear_baseYear(cboAno.CallAno)

        If cboAno.CallAno = oTime.YearToday Then
            myDiaFinal = DateAndTime.Today.AddDays(-1)
        Else
            myDiaFinal = oTime.GetLastDayOfMonth_baseYearMonth(12, cboAno.CallAno)
        End If

        Session("sANO") = cboAno.CallAno
        Session("sDATA_INICIAL") = myDiaInicial
        Session("sDATA_FINAL") = myDiaFinal
        Session("sFILIAL") = 99
        Session("sMESMOSDIAS") = 1
    End Sub

  

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
    End Sub


    Protected Sub ASPxGridView1_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles ASPxGridView1.CustomSummaryCalculate
        On Error Resume Next
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Start Then
            vlrMeta = 0
            vlrRea = 0
            percPart_vlrRea = 0
            vlrMA = 0
            vlrAA1 = 0
            vlrAA2 = 0
            vlrAA3 = 0
            percCresc_RealMeta = 0
            percMA = 0
            percCresc_RealAA1 = 0
            percCresc_RealAA3 = 0
            percCresc_RealAA2 = 0
            vlrMetaAnual = 0
            percCresc_MetaAnual = 0
            percMargMeta = 0
            percMargReal = 0
            percMargemDif = 0
            percMargCheia = 0
        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Calculate Then

            Dim myFilter As Int16 = Convert.ToInt16(e.GetValue("idFilial"))
            If myFilter = 254 Then
                vlrMeta += Convert.ToDecimal(e.GetValue("vlrMeta"))
                vlrRea += Convert.ToDecimal(e.GetValue("vlrRea"))
                percPart_vlrRea += Convert.ToDecimal(e.GetValue("percPart_vlrRea"))
                vlrMA += Convert.ToDecimal(e.GetValue("vlrMA"))
                vlrAA1 += Convert.ToDecimal(e.GetValue("vlrAA1"))
                vlrAA2 += Convert.ToDecimal(e.GetValue("vlrAA2"))
                vlrAA3 += Convert.ToDecimal(e.GetValue("vlrAA3"))
                percCresc_RealMeta += Convert.ToDecimal(e.GetValue("percCresc_RealMeta"))
                percMA += Convert.ToDecimal(e.GetValue("percMA"))
                percCresc_RealAA1 += Convert.ToDecimal(e.GetValue("percCresc_RealAA1"))
                percCresc_RealAA3 += Convert.ToDecimal(e.GetValue("percCresc_RealAA3"))
                percCresc_RealAA2 += Convert.ToDecimal(e.GetValue("percCresc_RealAA2"))
                vlrMetaAnual += Convert.ToDecimal(e.GetValue("vlrMetaAnual"))
                percCresc_MetaAnual += Convert.ToDecimal(e.GetValue("percCresc_MetaAnual"))
                percMargMeta += Convert.ToDecimal(e.GetValue("percMargMeta"))
                percMargReal += Convert.ToDecimal(e.GetValue("percMargReal"))
                percMargemDif += Convert.ToDecimal(e.GetValue("percMargemDif"))
                percMargCheia += Convert.ToDecimal(e.GetValue("percMargCheia"))
            End If

        End If
        If e.SummaryProcess = DevExpress.Data.CustomSummaryProcess.Finalize Then
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrMeta" Then e.TotalValue = vlrMeta
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrRea" Then e.TotalValue = vlrRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percPart_vlrRea" Then e.TotalValue = percPart_vlrRea
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrMA" Then e.TotalValue = vlrMA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrAA1" Then e.TotalValue = vlrAA1
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrAA2" Then e.TotalValue = vlrAA2
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrAA3" Then e.TotalValue = vlrAA3
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCresc_RealMeta" Then e.TotalValue = percCresc_RealMeta
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMA" Then e.TotalValue = percMA
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCresc_RealAA1" Then e.TotalValue = percCresc_RealAA1
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCresc_RealAA3" Then e.TotalValue = percCresc_RealAA3
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCresc_RealAA2" Then e.TotalValue = percCresc_RealAA2
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "vlrMetaAnual" Then e.TotalValue = vlrMetaAnual
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percCresc_MetaAnual" Then e.TotalValue = percCresc_MetaAnual
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargMeta" Then e.TotalValue = percMargMeta
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargReal" Then e.TotalValue = percMargReal
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargemDif" Then e.TotalValue = percMargemDif
            If DirectCast(e.Item, ASPxSummaryItem).FieldName = "percMargCheia" Then e.TotalValue = percMargCheia
        End If

    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "percMargemDif")
        oFun.Grid_RedIsNegative(e, "percCresc_RealMeta")
        oFun.Grid_RedIsNegative(e, "percCresc_RealAA1")
        oFun.Grid_RedIsNegative(e, "percCresc_RealAA2")
        oFun.Grid_RedIsNegative(e, "percCresc_RealAA3")
        oFun.Grid_RedIsNegative(e, "percCresc_MetaAnual")

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
            Case "255"
                e.Row.BackColor = System.Drawing.Color.LightGreen
                e.Row.Font.Bold = True
        End Select
        'LightYellow
        'Lavender
    End Sub


End Class
