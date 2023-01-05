
Partial Class MemberPages_SiteVendas
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        Dim oProjeto As New Projeto
        Dim Depto As String
        Depto = Trim(oProjeto.BuscarDepartamentoDoUsuario(Page.User.Identity.Name))
        Select Case Depto
            Case "Loja"
                Me.navVendas.Groups.Item(0).Visible = False
                Me.navVendas.Groups.Item(1).Visible = False
                Me.navVendas.Groups.Item(2).Visible = True
                Me.navVendas.Groups.Item(3).Items(0).Visible = False

                Me.navVendas.Groups.Item(3).Visible = True 'Ranking por Seção
                Me.navVendas.Groups.Item(4).Visible = False 'Venda por Fornecedor
                Me.navVendas.Groups.Item(5).Visible = False 'Venda por Campanha
                Me.navVendas.Groups.Item(6).Visible = False 'Venda por Campanha


        End Select
   
    End Sub
End Class

