
Partial Class MemberPages_Cadastros_Cadastro_Gerenciamento_Categoria
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Dim oVen As New VendaEmpresaMes
            oVen.AtualizarEstatisticaPrograma(403, Page.User.Identity.Name)
        End If

    End Sub


    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Cadastro de Gerenciamento de Categorias - PGR403"
        End If

    End Sub

End Class
