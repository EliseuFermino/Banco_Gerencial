﻿
Partial Class Account_Login
    Inherits Page

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
        Dim userName As String = LCase(Login1.UserName)
        Dim vDepartamento As String = LCase(Trim(oProjeto.BuscarDepartamentoDoUsuario(Page.User.Identity.Name)))

        'userName = LCase(Login1.UserName)

        Select Case vDepartamento
            Case "supervisor"
                Response.Redirect("~/MemberPages/Checklist/DashboardUnit.aspx")
            Case Else
                Select Case LTrim(RTrim(userName))
                    Case "eliseu", "eder", "joanir"
                        Response.Redirect("~/MemberPages/SLV/PrincipalSLV.aspx")
                    Case "Gabrieli"
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

   
    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim oDb As New clDataDb
        oDb.ExecuteStoredProcedure("uspUser_UnlockedUser", Conexao.gerCont_str)
    End Sub


End Class