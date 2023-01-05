
Imports DevExpress.Web

Partial Class Ranking_MetaDeVenda
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Dim oVem As New VendaEmpresaMes
        If Not IsPostBack Then
            oVem.AtualizarEstatisticaPrograma(13, User.Identity.Name)
            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = Year(Now()) + 7
            Me.cboAno.CallAno = Year(DateAdd(DateInterval.Month, -2, DateAndTime.Now()))
            Session("sANO") = Me.cboAno.CallAno
            Me.cboAno.AutoPostBack = True
            Call MudarTitulo()
            Me.labelSource.Text = "Para atualizar: Atualize o Teórico. Vá em Opções => Manutenção => Atualizações => Atualizar Teórico."
        End If
    End Sub

    Protected Sub gridDetail_DataSelect(ByVal sender As Object, ByVal e As EventArgs)
        Session("FILIAL") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

    Protected Sub gridMaster_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridMaster.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "DifRevOri")
        oFun.Grid_RedIsNegative(e, "percDifReaOri")
        oFun.Grid_RedIsNegative(e, "percDifReaRev")

    End Sub

    Protected Sub cboAno_ListAnoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.ListAnoChanged
        Session("sANO") = Me.cboAno.CallAno
        Me.gridMaster.DataBind()
        Call MudarTitulo()
    End Sub

    Protected Sub gridDetail_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs)
        If e.DataColumn.FieldName = "vlrDifRevOri" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percReaRev" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percReaOri" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If
    End Sub

    Private Sub MudarTitulo()
        Me.gridMaster.SettingsText.Title = "Meta de Vendas por Regional, Região e Tipo " & Me.cboAno.CallAno & " - Lojas"
    End Sub

    Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Análise de Meta x Realizado - Vendas - por Regional, Região e Tipo"
    End Sub

    Protected Sub btnExportar_Click(sender As Object, e As EventArgs) Handles btnExportar.Click
        Me.ExporterExcel1.WriteXlsToResponse()
    End Sub

    Protected Sub gridMaster_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gridMaster.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub
End Class
