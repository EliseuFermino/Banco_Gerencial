Imports DevExpress.Web

Partial Class MemberPages_Funcionarios_ComparativoMetragem
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(287, User.Identity.Name)
            Me.cboAno.AnoInicial = 2014
            Me.cboAno.AnoFinal = Year(DateAndTime.Now())
            Me.cboAno.CallAno = Year(DateAndTime.Now())
            Me.cboMes.AutoPostBack = False
            Me.cboSize.CallSize = 100
            Call Atualizar()
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Análise Entre Filiais - Base Metragem - PGR287"
    End Sub

    Private Sub Atualizar()
        Session("sANO") = Me.cboAno.CallAno
        Session("sMES") = Me.cboMes.CallMes
        Session("sFILIAL") = cboFilial.CallFilial

        Me.grid1.DataBind()
        Me.grid2.DataBind()
    End Sub

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback
        Call Atualizar()
        oFun.Grid_Column_BorderRight(grid1, "vlrVendaRealizada", Drawing.Color.Gray, BorderStyle.Solid, 1)
        oFun.Grid_Column_BorderRight(grid1, "VendaFunc_AtivoSemAprendiz", Drawing.Color.Gray, BorderStyle.Solid, 1)
        oFun.Grid_Column_BorderRight(grid1, "numFunc_Aprendiz", Drawing.Color.Gray, BorderStyle.Solid, 1)
        oFun.Grid_Column_BorderRight(grid1, "VendaFunc_AtivoComAprendiz", Drawing.Color.Gray, BorderStyle.Solid, 1)
        oFun.Grid_Column_BorderRight(grid1, "numFunc_Seguro", Drawing.Color.Gray, BorderStyle.Solid, 1)
        'oFun.Grid_Column_BorderRight(grid1, "VendaPorFuncionarios", Drawing.Color.Gray, BorderStyle.Solid, 1)

    End Sub

    Protected Sub grid1_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid1.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "difQL")
    End Sub

    Protected Sub grid2_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid2.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "difQL")
    End Sub

    Protected Sub grid1_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles grid1.HtmlRowPrepared

        oFun.grid_RowSelectedWhole(grid1, e, "Descricao", "Total", Drawing.Color.Yellow, True)

        oFun.grid_RowSelectedWhole(grid1, e, "idFilial", cboFilial.CallFilial, Drawing.Color.LightBlue, True)

    End Sub

    Protected Sub grid2_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles grid2.HtmlRowPrepared

        oFun.grid_RowSelectedWhole(grid2, e, "Descricao", "Total", Drawing.Color.Yellow, True)
        oFun.grid_RowSelectedWhole(grid2, e, "idFilial", cboFilial.CallFilial, Drawing.Color.LightBlue, True)

    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid1, cboSize.CallSize)
        oFun.Grid_Size(grid2, cboSize.CallSize)
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender

        If Not IsPostBack Then

            oFun.Grid_Title(grid1, "Classificação por Metragem")
            oFun.Grid_Title(grid2, "Classificação por Venda")

        End If

    End Sub
End Class
