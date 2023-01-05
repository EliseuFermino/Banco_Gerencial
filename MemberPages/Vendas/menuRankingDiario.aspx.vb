Imports System.Data.SqlClient

Partial Class Ranking_menuRankingDiario
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        'varPermissao = Session("idPermissao")
        'If varPermissao = 1 Then
        '    Response.Redirect("~/MemberPages/MenuPrincipal.aspx", True)
        'End If
        If Not IsPostBack Then
            Session("sDIA") = Me.cboDia.CallDia
        End If
        Dim oVem As New VendaEmpresaMes
        oVem.AtualizarEstatisticaPrograma(3, User.Identity.Name)
    End Sub

    Protected Sub cboDia_DiaVaiClick(sender As Object, e As EventArgs) Handles cboDia.DiaVaiClick
        Call Atualizar()
    End Sub

    Protected Sub cboDia_DiaVoltaClick(sender As Object, e As EventArgs) Handles cboDia.DiaVoltaClick
        Call Atualizar()
    End Sub

    Protected Sub cboDia_ListDiaChanged(sender As Object, e As EventArgs) Handles cboDia.ListDiaChanged
        Session("sDIA") = Me.cboDia.CallDia
        Me.grid.DataBind()

    End Sub

    Private Sub Atualizar()
        Session("sDIA") = Me.cboDia.CallDia
        Me.grid.DataBind()
    End Sub

    Protected Sub chkFixar_CheckedChanged(sender As Object, e As EventArgs) Handles chkFixar.CheckedChanged
        If Me.chkFixar.Checked = True Then
            Me.grid.Settings.ShowVerticalScrollBar = True
        Else
            Me.grid.Settings.ShowVerticalScrollBar = False
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Vendas por Dia"
    End Sub
End Class
