
Partial Class MemberPages_Projetos_Mandala_CapaMandala
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        'Dim url As String = HttpContext.Current.Request.Url.AbsoluteUri
        'Dim path As String = HttpContext.Current.Request.Url.AbsolutePath
        'Dim host As String = HttpContext.Current.Request.Url.Host

        'Label1.Text = "url: " & url & " - path: " & path & " - host: " & host & "."

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Mandala Mestra - Os 8 Objetivos Estratégicos do Condor para 2021"
        End If
    End Sub


    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            Select Case User.Identity.Name
                Case "Eder", "Eliseu", "Joel", "joel", "eder", "Felipe", "felipe"
                    divCentro.Visible = True
                Case Else
                    divCentro.Visible = False
            End Select
        End If
    End Sub
End Class
