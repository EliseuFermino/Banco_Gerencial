
Partial Class MemberPages_Projetos_Mandala_Objetivo_Estrategico_03
    Inherits System.Web.UI.Page

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Objetivo Estratégico 3: Marketing, CRM, Publicidade"
        End If
    End Sub

    'Protected Sub ImageMap1_Click(sender As Object, e As ImageMapEventArgs) Handles ImageMap1.Click
    '    lblX.Text = e.X.ToString()
    '    lblY.Text = e.Y.ToString()
    'End Sub
End Class
