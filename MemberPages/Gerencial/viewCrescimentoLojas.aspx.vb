
Partial Class MemberPages_Gerencial_viewCrescimentoLojas
    Inherits System.Web.UI.Page

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            CType(Master.FindControl("lblTitle"), Label).Text = "Gráfico de Crescimento de Vendas - 163"
            oVem.AtualizarEstatisticaPrograma(163, User.Identity.Name)

        End If

    End Sub


End Class
