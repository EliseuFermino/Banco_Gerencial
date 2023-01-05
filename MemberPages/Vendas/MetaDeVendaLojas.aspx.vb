
Imports DevExpress.Web

Partial Class Ranking_MetaDeVenda
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes

    Protected Sub gridMaster_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridMaster.CustomSummaryCalculate
        On Error Resume Next
        Dim summary As ASPxSummaryItem = TryCast(e.Item, ASPxSummaryItem)

        If e.IsTotalSummary Then
            If summary.FieldName = "percAtingOri" Then
                Dim vlrRea As Decimal = Convert.ToDecimal(gridMaster.GetTotalSummaryValue(gridMaster.TotalSummary("vlrRea")))
                Dim vlrOri As Decimal = Convert.ToDecimal(gridMaster.GetTotalSummaryValue(gridMaster.TotalSummary("vlrOri")))
                If vlrRea = Nothing Then
                    e.TotalValue = 0
                Else
                    e.TotalValue = (((vlrRea / vlrOri) * 100) - 100)
                End If
            End If

            If summary.FieldName = "percAtingRev" Then
                Dim vlrRea As Decimal = Convert.ToDecimal(gridMaster.GetTotalSummaryValue(gridMaster.TotalSummary("vlrRea")))
                Dim vlrRev As Decimal = Convert.ToDecimal(gridMaster.GetTotalSummaryValue(gridMaster.TotalSummary("vlrRev")))

                If vlrRea = Nothing Then
                    e.TotalValue = 0
                Else
                    e.TotalValue = (((vlrRea / vlrRev) * 100) - 100)
                End If
            End If

            If summary.FieldName = "percAtingRea" Then
                Dim vlrRea As Decimal = Convert.ToDecimal(gridMaster.GetTotalSummaryValue(gridMaster.TotalSummary("vlrRea")))
                Dim vlrReaAA As Decimal = Convert.ToDecimal(gridMaster.GetTotalSummaryValue(gridMaster.TotalSummary("vlrReaAA")))

                If vlrRea = Nothing Then
                    e.TotalValue = 0
                Else
                    e.TotalValue = (((vlrRea / vlrReaAA) * 100) - 100)
                End If
            End If
        End If
    End Sub


    Protected Sub gridMaster_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridMaster.HtmlDataCellPrepared
        On Error Resume Next
        If e.DataColumn.FieldName = "DifRevOri" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percAtingOri" Or e.DataColumn.FieldName = "percAtingRev" Or e.DataColumn.FieldName = "percAtingRea" Or e.DataColumn.FieldName = "vlrDifRea" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If
    End Sub

    Protected Sub btnExportar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnExportar.Click
        Me.ExporterExcel1.WriteXlsToResponse()
    End Sub

    Protected Sub cboAno_ListAnoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.ListAnoChanged
        Session("sAno") = Me.cboAno.CallAno
        Call MudarTitulo()
    End Sub

    Private Sub MudarTitulo()
        Me.gridMaster.SettingsText.Title = "Meta de Vendas " & Me.cboAno.CallAno & " - Lojas"
        Me.gridMaster.Columns("bandMeta").Caption = "Meta " & Me.cboAno.CallAno & ""
        Me.gridMaster.Columns("vlrRea").Caption = Me.cboAno.CallAno
        Me.gridMaster.Columns("vlrReaAA").Caption = Me.cboAno.CallAno - 1
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim oVem As New VendaEmpresaMes
        If Not IsPostBack Then
            Me.cboAno.AutoPostBack = True
            Me.cboMes.AutoPostBack = True
            Me.cboMes.Visible = False

            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = Year(Now()) + 7
            Me.cboAno.CallAno = Year(DateAdd(DateInterval.Month, -2, DateAndTime.Now()))

            Session("sAno") = Me.cboAno.CallAno
            Session("sMes") = Me.cboMes.CallMes
            oVem.AtualizarEstatisticaPrograma(8, User.Identity.Name)
            Me.chkFixarCabecalho.Checked = True
            chkAno.Checked = True
            Call MudarTitulo()
            Me.labelSource.Text = "Para atualizar: Atualize o Teórico. Vá em Opções => Manutenção => Atualizações => Atualizar Teórico."

        End If
    End Sub

    Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Análise de Meta x Realizado - Vendas - por Filial - PGR8"
        End If

    End Sub

    Protected Sub chkFixarCabecalho_chkFixarCabecalhoChecked(sender As Object, e As EventArgs) Handles chkFixarCabecalho.chkFixarCabecalhoChecked
        If Me.chkFixarCabecalho.Checked = True Then
            Me.gridMaster.Settings.ShowVerticalScrollBar = True
        Else
            Me.gridMaster.Settings.ShowVerticalScrollBar = False
        End If
    End Sub

    Protected Sub gridMaster_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gridMaster.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub cboMes_ListMesChanged(sender As Object, e As EventArgs) Handles cboMes.ListMesChanged
        Session("sMes") = Me.cboMes.CallMes
        Call MudarTitulo()
    End Sub

    Protected Sub chkMes_CheckedChanged(sender As Object, e As EventArgs) Handles chkMes.CheckedChanged
        If chkMes.Checked = True Then
            cboMes.Visible = True
            cboMes.CallMes = 1
            Session("sAnoMes") = 2
        End If
    End Sub

    Protected Sub chkAno_CheckedChanged(sender As Object, e As EventArgs) Handles chkAno.CheckedChanged
        If chkAno.Checked = True Then
            cboMes.Visible = False
            Session("sAnoMes") = 1
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            cboMes.CallMes = 1
            Session("sMes") = Me.cboMes.CallMes
            Session("sAnoMes") = 1
            gridMaster.DataBind()
        End If
    End Sub
End Class
