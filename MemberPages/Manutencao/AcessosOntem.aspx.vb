
Partial Class MemberPages_Manutencao_AcessosOntem
    Inherits System.Web.UI.Page


    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(178, User.Identity.Name)
            CType(Master.FindControl("lblTitle"), Label).Text = "Estatistica de Acesso - Ontem - PGR178"
        End If
    End Sub
End Class
