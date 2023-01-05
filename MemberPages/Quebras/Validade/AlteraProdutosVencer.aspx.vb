
Partial Class MemberPages_Quebras_Validade_AlteraProdutosVencer
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(308, User.Identity.Name)
            cboFilial.AutoPostBack = True
            cboFilial.Visible_cboCorporacao = False
            cboDia.CallDia = DateAndTime.Now().AddDays(-7)


        End If

    End Sub

    Protected Sub cboDia_DiaVaiClick(sender As Object, e As EventArgs) Handles cboDia.DiaVaiClick
        Session("sDIA") = cboDia.CallDia
        grid.DataBind()
    End Sub

    Protected Sub cboDia_DiaVoltaClick(sender As Object, e As EventArgs) Handles cboDia.DiaVoltaClick
        Session("sDIA") = cboDia.CallDia
        grid.DataBind()
    End Sub

    Protected Sub cboDia_ListDiaChanged(sender As Object, e As EventArgs) Handles cboDia.ListDiaChanged
        Session("sDIA") = cboDia.CallDia
        grid.DataBind()
    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        Session("sFILIAL") = cboFilial.CallFilial
        grid.DataBind()
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            Session("sFILIAL") = cboFilial.CallFilial
            Session("sDIA") = cboDia.CallDia
            grid.DataBind()
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Manutenção dos Produtos à Vencer - PGR308"
        End If
    End Sub


End Class
