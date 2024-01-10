
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

    End Sub

    Protected Sub Login1_LoggedIn(sender As Object, e As EventArgs) Handles Login1.LoggedIn
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

        Select Case vDepartamento
            Case "cipla"
                Response.Redirect("~/MemberPages/Cipla/LancamentoVendas.aspx")
            Case "loja"
                Response.Redirect("~/MemberPages/menuPrincipal_GerenciaLoja.aspx")
            Case "supervisor"
                If IsMobile() = True Then
                    Response.Redirect("~/MemberPages/Visao_Mobile/VisaoSimplificada.aspx")
                Else
                    Response.Redirect("~/MemberPages/menuPrincipal.aspx")
                End If

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
                If IsMobile() = True Then
                    Response.Redirect("~/MemberPages/Visao_Mobile/VisaoSimplificada.aspx")
                Else
                    Response.Redirect("~/MemberPages/menuPrincipal_Controladoria.aspx")
                End If
            Case "delivery"
                Response.Redirect("~/MemberPages/menuPrincipal_Prevencao.aspx")
            Case "presidência"
                If IsMobile() = True Then
                    Response.Redirect("~/MemberPages/Visao_Mobile/VisaoSimplificada.aspx")
                Else
                    Select Case userName
                        Case "ricardo", "ricardo_pre" '
                            Response.Redirect("~/MemberPages/menuPrincipal_Ricardo.aspx")
                        Case "joanir"
                            Response.Redirect("~/MemberPages/Gerencial/AnaliseHoraJoanir.aspx")
                        Case Else
                            Response.Redirect("~/MemberPages/menuPrincipal_Ricardo.aspx")
                    End Select
                End If
            Case "processos", "controle_caminhao_ceasa"
                Response.Redirect("~/MemberPages/menuPrincipal_Basic.aspx")
            Case Else
                Select Case userName
                    Case "adailton", "709330", "121169", "aliceu", "vladimir", "wanclei", "bendixen"
                        Response.Redirect("~/MemberPages/Default_Direction.aspx")
                    Case "gabrieli"
                        Response.Redirect("~/MemberPages/Checklist/DashboardHSA.aspx")
                    Case Else
                        Response.Redirect("~/MemberPages/menuPrincipal.aspx")
                End Select
        End Select

    End Sub

    Protected Sub Button2_Click(sender As Object, e As EventArgs)
        Dim oDb As New clDataDb
        oDb.ExecuteStoredProcedure("uspUser_UnlockedUser", Conexao.gerCont_str)
    End Sub

    Public Function IsMobile() As Boolean
        Dim request As HttpRequest = HttpContext.Current.Request
        Dim userAgent As String = request.UserAgent.ToLower()
        Dim mobileKeywords() As String = {"mobile", "android", "iphone", "ipod", "blackberry", "windows phone"}

        For Each keyword As String In mobileKeywords
            If userAgent.Contains(keyword) Then
                Return True
            End If
        Next

        Return False
    End Function

End Class
