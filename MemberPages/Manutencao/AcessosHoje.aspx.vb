
Partial Class MemberPages_Manutencao_AcessosHoje
    Inherits System.Web.UI.Page


    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(177, User.Identity.Name)
            CType(Master.FindControl("lblTitle"), Label).Text = "Estatistica de Acesso - Hoje - PGR177"
        End If
    End Sub
End Class
