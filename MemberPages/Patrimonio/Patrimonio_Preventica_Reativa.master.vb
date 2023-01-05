
Partial Class MemberPages_Patrimonio_Patrimonio_Preventica_Reativa
    Inherits System.Web.UI.MasterPage

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim oProjeto As New Projeto

            If oProjeto.BuscarDepartamentoDoUsuario(oProjeto.NameUserReturn) = "Loja" Then
                ASPxTabControl1.Tabs.Item(0).Visible = False
                ASPxTabControl1.ActiveTabIndex = 1

            End If
        End If
    End Sub
End Class

