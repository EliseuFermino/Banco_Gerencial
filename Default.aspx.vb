
Partial Class Default2
    Inherits System.Web.UI.Page

    Dim oProjeto As New Projeto

    Protected Sub Page_PreInit(sender As Object, e As EventArgs) Handles Me.PreInit
        If Not String.IsNullOrEmpty(Request.QueryString("content")) Then
            Response.Redirect("~/Account/LoginAjax.aspx")
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        RegisterHyperLink.NavigateUrl = "Register.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.QueryString("ReturnUrl"))

        'If Page.User.Identity.Name = "Eliseu" Then
        '    Server.Transfer("~/MemberPages/SLV/PrincipalSLV.aspx")
        'End If

    End Sub

    'Protected Sub Login1_Authenticate(sender As Object, e As AuthenticateEventArgs) Handles Login1.Authenticate
    '    'If Page.User.Identity.Name = "Eliseu" Then
    '    '    Response.Redirect("~/MemberPages/SLV/PrincipalSLV.aspx")
    '    'End If
    'End Sub

    Protected Sub Login1_LoggedIn(sender As Object, e As EventArgs) Handles Login1.LoggedIn
        'Dim userName As String
        'userName = LCase(Login1.UserName)

        'Select Case userName
        '    Case "eliseu", "eder", "joanir", "adailton", "presidência"
        '        Response.Redirect("~/MemberPages/Default_Direction.aspx")
        '    Case Else
        '        Response.Redirect("~/MemberPages/menuPrincipal.aspx")
        'End Select


        Dim userName As String = LCase(Login1.UserName)
        Dim vDepartamento As String = LCase(Trim(oProjeto.BuscarDepartamentoDoUsuario(userName)))

        If oProjeto.Ativo = 0 Then
            Response.Redirect("~/AcessoNegado.aspx")
        End If

        If oProjeto.Departamento <> "presidência" Then
            If oProjeto.ResetarSenha = True Then
                Response.Redirect("~/Account/ChangePassword.aspx")
            End If
        End If

        
        'userName = LCase(Login1.UserName)

        Select Case vDepartamento
            Case "loja"
                Response.Redirect("~/MemberPages/menuPrincipal_GerenciaLoja.aspx")
            Case "supervisor"
                Response.Redirect("~/MemberPages/menuPrincipal.aspx")
            Case "seguranca"
                Response.Redirect("~/MemberPages/menuPrincipal_Seguranca.aspx")
            Case "perdas", "suprimentos"
                Response.Redirect("~/MemberPages/menuPrincipal_Prevencao.aspx")
            Case "gestor_comercial", "gestor_assistente"
                Response.Redirect("~/MemberPages/menuPrincipal_Gestor.aspx")
            Case "comercial"
                Response.Redirect("~/MemberPages/menuPrincipal_Comercial.aspx")
            Case "fiscal"
                Response.Redirect("~/MemberPages/menuPrincipal_Fiscal.aspx")
            Case "perdas_supervisor"
                Response.Redirect("~/MemberPages/Checklist/Dashboard.aspx")
            Case "controladoria"
                'Response.Redirect("~/MemberPages/menuPrincipal_Controladoria.aspx")
                Response.Redirect("~/MemberPages/Default_Direction.aspx")
            Case "delivery"
                Response.Redirect("~/MemberPages/menuPrincipal_Prevencao.aspx")
            Case Else
                Select Case userName
                    Case "joanir", "presidência"
                        Response.Redirect("~/MemberPages/Gerencial/AnaliseHoraJoanir.aspx")
                    Case "joanir", "adailton", "presidência", "709330", "filipe", "andreia", "ricardo", "121169", "aliceu", "vladimir", "wanclei", "bendixen", "jesuli", "eliseu"
                        Response.Redirect("~/MemberPages/Default_Direction.aspx")
                    Case "gabrieli"
                        Response.Redirect("~/MemberPages/Checklist/DashboardHSA.aspx")
                    Case Else
                        Response.Redirect("~/MemberPages/menuPrincipal.aspx")
                End Select
        End Select


        'If Page.User.Identity.Name = "Eliseu" Then
        '    Response.Redirect("~/MemberPages/menuPrincipal.aspx")
        'Else
        '    Response.Redirect("~/MemberPages/menuPrincipal_2Bilhoes.aspx")
        'End If


        '    Case "Diretor", "Comercial", "Presidência", "controladoria", "Supervisor", "Loja"
        'Response.Redirect("~/MemberPages/menuPrincipal.aspx")
        '    Case Else

        'End Select
        '_2Bilhoes


    End Sub



    Protected Sub Button2_Click(sender As Object, e As EventArgs)
        Dim oDb As New clDataDb
        oDb.ExecuteStoredProcedure("uspUser_UnlockedUser", Conexao.gerCont_str)
    End Sub
End Class
