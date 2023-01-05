
Partial Class MemberPages_Vendas_Analises_EstoqueForaDeLinha
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            oVem.AtualizarEstatisticaPrograma(272, Page.User.Identity.Name)
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Estoque Fora de Linha - PGR272"
        End If
    End Sub
End Class
