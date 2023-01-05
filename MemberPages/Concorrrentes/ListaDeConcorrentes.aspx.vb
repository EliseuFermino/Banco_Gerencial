
Partial Class MemberPages_Concorrrentes_ListaDeConcorrentes
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(376, User.Identity.Name)
            Call Atualizar()
        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Lista de Concorrentes por Total de Loja - PGR376"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
           
        End If
    End Sub

#End Region

    Private Sub Atualizar()
        oFun.Grid_Title(grid, "Lista de Concorrentes por Ordem de Maior Venda")
        Me.grid.DataBind()
    End Sub



End Class
