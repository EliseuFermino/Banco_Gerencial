
Partial Class MemberPages_Planejamento_Vendas_viewVendaCorrigidasMes
    Inherits System.Web.UI.Page

    Protected Sub GridView1_RowCreated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowCreated
        On Error Resume Next
        If e.Row.RowType = DataControlRowType.DataRow Then
            If DataBinder.Eval(e.Row.DataItem, "percCresc") < 0D Then e.Row.Cells(8).ForeColor = Drawing.Color.Red
        End If
    End Sub


    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Me.cboFilial.cboFilial_AutoPostBack = True
            Me.cboMes.AutoPostBack = True

            Session("sFILIAL") = Me.cboFilial.CallFilial
            Session("sMES") = Me.cboMes.CallMes
        End If

    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        Session("sFILIAL") = Me.cboFilial.CallFilial
        GridView1.DataBind()
    End Sub

    Protected Sub cboMes_ListMesChanged(sender As Object, e As EventArgs) Handles cboMes.ListMesChanged
        Session("sMES") = Me.cboMes.CallMes
        GridView1.DataBind()
    End Sub
    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Vendas Corrigidas pelo IPCA (IBGE)"
    End Sub


End Class
