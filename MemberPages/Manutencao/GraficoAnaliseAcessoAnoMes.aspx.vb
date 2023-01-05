
Partial Class MemberPages_Manutencao_GraficoAnaliseAcessoAnoMes
    Inherits System.Web.UI.Page

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Análise de Crescimento dos Acessos - PGR235"
        End If
    End Sub


End Class
