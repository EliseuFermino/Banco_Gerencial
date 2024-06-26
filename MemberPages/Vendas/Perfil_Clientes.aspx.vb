﻿Imports DevExpress.Web

Partial Class MemberPages_Vendas_Perfil_Clientes
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(372, User.Identity.Name)
            Me.cboAno.AnoInicial = 2010
            Me.cboAno.AnoFinal = Year(DateAndTime.Now())
            Me.cboAno.CallAno = Year(DateAndTime.Now())
            Me.cboMes.AutoPostBack = False
            Me.cboSize.CallSize = 100

            Call Atualizar()
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Perfil - Clientes - PGR372"
    End Sub

    Private Sub Atualizar()
        Session("sANO") = Me.cboAno.CallAno
        Session("sMES") = Me.cboMes.CallMes
        'Me.grid1.DataBind()
    End Sub

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback
        Call Atualizar()
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
