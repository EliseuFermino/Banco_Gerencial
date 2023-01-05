
Partial Class MemberPages_Concorrrentes_AnaliseConc
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim oVem As New VendaEmpresaMes
        oVem.AtualizarEstatisticaPrograma(268, Page.User.Identity.Name)
    End Sub



    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Análise Concorrencial - PGR268"
    End Sub

End Class
