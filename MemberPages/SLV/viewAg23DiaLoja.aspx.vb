
Partial Class MemberPages_SLV_viewAg23DiaLoja
    Inherits System.Web.UI.Page

    Protected Sub btnAtualizar_BotaoClick(sender As Object, e As EventArgs) Handles btnAtualizar.BotaoClick
        Session("sANO") = Me.cboAno.CallAno
        Session("sMES") = Me.cboMes.CallMes
        Session("sFILIAL") = Me.cboFilial.CallFilial

        Me.grid.Visible = True
        Me.grid.DataBind()
    End Sub

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        Dim oVem As New VendaEmpresaMes
        If Not IsPostBack Then
            oVem.AtualizarEstatisticaPrograma(76, User.Identity.Name)
            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = Year(Now())
            Me.cboAno.CallAno = Year(Now())
            Me.cboFilial.Visible_cboCorporacao = False
            Me.cboFilial.AutoPostBack = False

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Consulta Agendas de Quebra - por Total e Dia"
    End Sub

    Protected Sub chkVerTudo_CheckedChanged(sender As Object, e As EventArgs) Handles chkVerTudo.CheckedChanged
        If Me.chkVerTudo.Checked = True Then
            grid.Settings.ShowVerticalScrollBar = False
        Else
            grid.Settings.ShowVerticalScrollBar = True
        End If
    End Sub

End Class
