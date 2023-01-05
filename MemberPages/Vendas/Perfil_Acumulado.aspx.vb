Imports DevExpress.Web

Partial Class MemberPages_Vendas_Perfil_Acumulado
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(256, User.Identity.Name)
            Me.cboAno.AnoInicial = 2010
            Me.cboAno.AnoFinal = Year(DateAndTime.Now())
            Me.cboAno.CallAno = Year(DateAndTime.Now())
            Me.cboMesInicial.AutoPostBack = False
            Me.cboMesFinal.AutoPostBack = False

            cboMesInicial.LabelDescMes = "Mês Inicial"
            cboMesFinal.LabelDescMes = "Mês Final"

            Me.cboSize.CallSize = 100
            Call Atualizar()
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Perfil Acumulado - PGR256"
    End Sub

    Private Sub Atualizar()
        Session("sANO") = Me.cboAno.CallAno
        Session("sMES_INICIAL") = Me.cboMesInicial.CallMes
        Session("sMES_FINAL") = Me.cboMesFinal.CallMes
        Me.grid1.DataBind()
    End Sub

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback
        Call Atualizar()
    End Sub

    Protected Sub grid1_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid1.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percMxR")
        oFun.Grid_RedIsNegative(e, "percCrescMA")
        oFun.Grid_RedIsNegative(e, "percCrescAA")
    End Sub

    Protected Sub grid1_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles grid1.HtmlRowPrepared

        oFun.grid_RowSelectedWhole(grid1, e, "Descricao", "Empresa Total", Drawing.Color.Yellow, True)
        oFun.grid_RowSelectedWhole(grid1, e, "Descricao", "Total Lojas Super", Drawing.Color.GreenYellow, True)
        oFun.grid_RowSelectedWhole(grid1, e, "Descricao", "Total Lojas Hiper", Drawing.Color.GreenYellow, True)
        oFun.grid_RowSelectedWhole(grid1, e, "Descricao", "Total Lojas Super E", Drawing.Color.GreenYellow, True)

    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid1, cboSize.CallSize)
    End Sub
End Class
