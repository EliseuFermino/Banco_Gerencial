
Partial Class MemberPages_Planejamento_Vendas_frmCadVendaSecao_Error
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim oVem As New VendaEmpresaMes
        oVem.AtualizarEstatisticaPrograma(29, User.Identity.Name)
    End Sub
End Class
