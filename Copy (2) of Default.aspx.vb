
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

        'userName = LCase(Login1.UserName)

        Select Case vDepartamento
            Case "supervisor"
                Response.Redirect("~/MemberPages/Checklist/DashboardUnit.aspx")
            Case Else
                Select Case userName
                    Case "eliseu", "eder", "joanir", "adailton", "presidência"
                        Response.Redirect("~/MemberPages/Default_Direction.aspx")
                    Case "gabrieli"
                        Response.Redirect("~/MemberPages/Checklist/DashboardHSA.aspx")
                    Case "ederson"
                        Response.Redirect("~/MemberPages/Checklist/Dashboard.aspx")
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
