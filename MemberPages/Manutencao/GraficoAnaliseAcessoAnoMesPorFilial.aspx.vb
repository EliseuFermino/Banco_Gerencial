
Partial Class MemberPages_Manutencao_GraficoAnaliseAcessoAnoMesPorFilial
    Inherits System.Web.UI.Page

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Análise de Crescimento dos Acessos por Usuario - PGR273"
            Session("sUSUARIO") = Page.User.Identity.Name
        End If
    End Sub


    Protected Sub cboUsuario_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboUsuario.SelectedIndexChanged
        'Session("sUSUARIO") = User.Identity.Name
        'Session("sUSUARIO") = cboUsuario.Value
        'grafDia.Visible = True
        'grafMes.Visible = True
        'SqlDataSource1.DataBind()
        'SqlDataSource2.DataBind()
        'Session("sUSUARIO") = User.Identity.Name
    End Sub

    Private Sub mySession()
       
    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
    End Sub

    Private Sub Atualizar()
        mySession()

        grafDia.Visible = True
        grafMes.Visible = True
        SqlDataSource1.DataBind()
        SqlDataSource2.DataBind()
        Session("sUSUARIO") = cboUsuario.Value
    End Sub



End Class
