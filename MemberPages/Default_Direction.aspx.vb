
Partial Class Default_Direction
    Inherits System.Web.UI.Page


    Protected Sub btn_BancoGerencial_Click(sender As Object, e As EventArgs) Handles btn_BancoGerencial.Click
        Dim userName As String
        Dim oProj As New Projeto

        userName = LCase(Page.User.Identity.Name)
        Select Case userName
            Case "eliseu", "eder", "filipe", "121169"
                Response.Redirect("~/MemberPages/SLV/PrincipalSLV.aspx")
            Case "joanir", "presidência"
                Response.Redirect("~/MemberPages/Gerencial/AnaliseHoraJoanir.aspx")
            Case Else
                If oProj.BuscarDepartamentoDoUsuario(userName) = "Loja" Then
                    Response.Redirect("~/MemberPages/Vendas/VendaLoja.aspx")
                Else
                    Response.Redirect("~/MemberPages/menuPrincipal.aspx")
                End If

        End Select
    End Sub

    Protected Sub btn_Posto_Click(sender As Object, e As EventArgs) Handles btn_Posto.Click
        Dim userName As String
        userName = LCase(Page.User.Identity.Name)
        Select Case userName
            Case "eliseu", "eder", "joanir", "adailton", "presidência", "709330", "filipe", "andreia", "ricardo", "121169", "aliceu", "vladimir", "wanclei", "bendixen", "jesuli"
                '    Response.Redirect("http://10.1.1.14:82/MemberPages/PostoEmpresa.aspx")
                'Case Else
                Response.Redirect("~/MemberPages/DashboardView.aspx")

        End Select
    End Sub
End Class
