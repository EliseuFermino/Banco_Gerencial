
Partial Class MemberPages_CentroCusto_BI_OperComl
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            oVem.AtualizarEstatisticaPrograma(250, User.Identity.Name)
        End If
    End Sub


    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "BI - Operação Comercial por Seção - PGR 250"
        End If
    End Sub

End Class
