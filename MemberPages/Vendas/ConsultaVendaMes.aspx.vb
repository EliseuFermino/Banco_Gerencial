
Partial Class Ranking_ConsultaVendaMes
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Dim oVem As New VendaEmpresaMes
        If Not IsPostBack Then
            oVem.AtualizarEstatisticaPrograma(4, User.Identity.Name)
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Histórico de Vendas"
    End Sub

    Protected Sub wucBotaoExcel_BotaoClick(sender As Object, e As EventArgs) Handles wucBotaoExcel.BotaoClick
        wucBotaoExcel.CallGridViewID = "ASPxGridView1"
    End Sub
End Class
