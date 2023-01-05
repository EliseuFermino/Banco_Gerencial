
Partial Class MemberPages_SiteVendas
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init

        Dim oProjeto As New Projeto
        Dim Depto As String
        Depto = Trim(oProjeto.BuscarDepartamentoDoUsuario(Page.User.Identity.Name))
        Select Case Depto
            Case "Agenda"
                Me.navGerencial.Groups.Item(0).Visible = False 'Ranking por Seção
                Me.navGerencial.Groups.Item(1).Visible = True 'Venda por Fornecedor

        End Select

    End Sub
End Class

