Imports System.Data

Partial Class MemberPages_SiteCipla
    Inherits System.Web.UI.MasterPage

    '    Dim oProjeto As New Projeto

    '    Protected Sub BuildMenu(ByVal menu As DevExpress.Web.ASPxMenu, ByVal dataSource As SqlDataSource)
    '        ' Get DataView
    '        Dim arg As DataSourceSelectArguments = New DataSourceSelectArguments()
    '        Dim dataView As DataView = TryCast(dataSource.Select(arg), DataView)
    '        dataView.Sort = "ParentID"

    '        ' Build Menu Items
    '        Dim menuItems As Dictionary(Of String, DevExpress.Web.MenuItem) = New Dictionary(Of String, DevExpress.Web.MenuItem)()

    '        For i As Integer = 0 To dataView.Count - 1
    '            Dim row As DataRow = dataView(i).Row
    '            Dim item As DevExpress.Web.MenuItem = CreateMenuItem(row)
    '            Dim itemID As String = row("ID").ToString()
    '            Dim parentID As String = row("ParentID").ToString()

    '            If menuItems.ContainsKey(parentID) Then
    '                menuItems(parentID).Items.Add(item)
    '            Else
    '                If parentID = "0" Then ' It's Root Item
    '                    menu.Items.Add(item)
    '                End If
    '            End If
    '            menuItems.Add(itemID, item)

    '        Next i
    '    End Sub

    '    Private Function CreateMenuItem(ByVal row As DataRow) As DevExpress.Web.MenuItem
    '        Dim ret As DevExpress.Web.MenuItem = New DevExpress.Web.MenuItem()
    '        ret.Text = row("Text").ToString()
    '        ret.NavigateUrl = row("NavigateUrl").ToString()
    '        ret.Image.Url = row("Icone").ToString()
    '        ret.ToolTip = row("ToolTip").ToString()
    '        Return ret
    '    End Function

    '    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
    '        If Not IsPostBack Then
    '            Session("sUSUARIO") = Page.User.Identity.Name
    '            Session("sMATRICULA") = Page.User.Identity.Name
    '            BuildMenu(ASPxMenu1, AccessDataSource1)

    '            Dim userName As String
    '            userName = LCase(Page.User.Identity.Name)

    '        End If

    '    End Sub

    '    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
    '        If Not IsPostBack Then
    '            Dim oPro As New Projeto
    '            If Page.User.Identity.IsAuthenticated Then
    '                If LTrim(RTrim(oPro.BuscarDepartamentoDoUsuario(Page.User.Identity.Name))) = "Perdas" Then
    '                    Dim x2 As HyperLink = TryCast(LoginView1.FindControl("A2"), HyperLink)
    '                    x2.Visible = False
    '                End If
    '            End If

    '        End If
    '    End Sub

    '    'Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles btnMenu.Click
    '    '    Dim userName As String
    '    '    userName = LCase(Page.User.Identity.Name)

    '    '    Select Case userName
    '    '        Case "eliseu", "eder", "joanir", "adailton"
    '    '            Response.Redirect("~/MemberPages/Default_Direction.aspx")
    '    '        Case Else
    '    '            Response.Redirect("~/MemberPages/menuPrincipal.aspx")
    '    '    End Select
    '    'End Sub


    '    Protected Sub ASPxMenu1_Load(sender As Object, e As EventArgs) Handles ASPxMenu1.Load

    '        If Not IsPostBack Then

    '            Dim userName As String = Page.User.Identity.Name
    '            Dim vDepartamento As String = LCase(Trim(oProjeto.BuscarDepartamentoDoUsuario(userName)))

    '            'userName = LCase(Login1.UserName)

    '            Select Case vDepartamento
    '                Case "supervisor"
    '                    ASPxMenu1.Items(0).NavigateUrl = "~/MemberPages/menuPrincipal.aspx"
    '                Case "seguranca"
    '                    ASPxMenu1.Items(0).NavigateUrl = "~/MemberPages/menuPrincipal_Seguranca.aspx"
    '                Case "perdas"
    '                    ASPxMenu1.Items(0).NavigateUrl = "~/MemberPages/menuPrincipal_Prevencao.aspx"
    '                Case "comercial"
    '                    ASPxMenu1.Items(0).NavigateUrl = "~/MemberPages/menuPrincipal_Comercial.aspx"
    '                Case "gestor_comercial"
    '                    ASPxMenu1.Items(0).NavigateUrl = "~/MemberPages/menuPrincipal_Gestor.aspx"
    '                Case Else
    '                    Select Case userName
    '                        Case "joanir", "presidência"
    '                            ASPxMenu1.Items(0).NavigateUrl = "~/MemberPages/Gerencial/AnaliseHoraJoanir.aspx"
    '                        Case "gabrieli"
    '                            ASPxMenu1.Items(0).NavigateUrl = "~/MemberPages/Checklist/DashboardHSA.aspx"
    '                        Case "668340"
    '                            ASPxMenu1.Items(0).NavigateUrl = "~/MemberPages/Checklist/Dashboard.aspx"
    '                        Case "1078700"
    '                            ASPxMenu1.Items(0).NavigateUrl = "~/MemberPages/Checklist/Dashboard.aspx"
    '                        Case "1103170"
    '                            ASPxMenu1.Items(0).NavigateUrl = "~/MemberPages/Checklist/Dashboard.aspx"
    '                        Case Else
    '                            ASPxMenu1.Items(0).NavigateUrl = "~/MemberPages/menuPrincipal.aspx"
    '                    End Select
    '            End Select

    '        End If

    '    End Sub
End Class

''Protected Sub Page_Load(sender As Object, e As EventArgs)
''    If Page.User.Identity.IsAuthenticated Then
''        Dim x2 As Label = TryCast(LoginView1.FindControl("Label2"), Label)
''        x2.Text = "login success"
''    Else
''        Dim x As Label = TryCast(LoginView1.FindControl("Label1"), Label)
''        x.Text = "please login"
''    End If


''End Sub
''Protected Sub login1_Authenticate(sender As Object, e As AuthenticateEventArgs)
''    Dim lin As Login = TryCast(LoginView1.FindControl("login1"), Login)
''    If lin.UserName = "TestUser" Then
''        e.Authenticated = True
''    Else
''        e.Authenticated = False
''    End If
'''End Sub