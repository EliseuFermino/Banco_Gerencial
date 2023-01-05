
Partial Class MemberPages_Quebras_Validade_ListaProdutosVencidosLojaTodos
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            oVem.AtualizarEstatisticaPrograma(244, User.Identity.Name)
            cboFilial.Visible_cboCorporacao = False
            cboFilial.AutoPostBack = True
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Relatório de Produtos Vencidos - PGR244"
        End If
    End Sub


    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then

            grid.DataBind()
        End If
    End Sub


    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged

        grid.DataBind()
    End Sub
End Class
