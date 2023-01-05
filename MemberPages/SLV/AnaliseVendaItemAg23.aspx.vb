Imports DevExpress.Web

Partial Class MemberPages_SLV_AnaliseVendaItemAg23
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(71, User.Identity.Name)
            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = Year(Now())
            Me.cboAno.CallAno = Year(Now())
            Me.cboMesInicial.AutoPostBack = False
            Me.cboMesFinal.AutoPostBack = False

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Análise de Vendas e Agenda 23 por Seção - PGR71"
    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        On Error Resume Next
        If e.DataColumn.FieldName = "percCresc" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

        If e.DataColumn.FieldName = "percMargemAT" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If

    End Sub

    Protected Sub btnExcel_BotaoClick(sender As Object, e As EventArgs) Handles btnExcel.BotaoClick
        Me.btnExcel.CallGridViewID = "grid"
    End Sub


    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback
        Session("sSECAO") = Me.cboSecao.CallSecao
        Session("sANO") = Me.cboAno.CallAno
        Session("sMES_INICIAL") = Me.cboMesInicial.CallMes
        Session("sMES_FINAL") = Me.cboMesFinal.CallMes

        If Me.chkCabecalho.Checked = True Then
            Me.grid.Settings.ShowVerticalScrollBar = True
        Else
            Me.grid.Settings.ShowVerticalScrollBar = False
        End If

        If Me.grid.Visible = False Then Me.grid.Visible = True
        Me.grid.DataBind()
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            Me.cboSecao.CallSecaoDesc = "01-SECA PESADA"
        End If
    End Sub
End Class
