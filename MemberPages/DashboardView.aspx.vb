
Partial Class MemberPages_DashboardView
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Dim oVen As New VendaEmpresaMes
            oVen.AtualizarEstatisticaPrograma(396, User.Identity.Name)

        End If

    End Sub


End Class
