
Partial Class MemberPages_Quebras_Validade_ListaProdutosVencer
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes
    Dim oFun As New Funcoes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            oVem.AtualizarEstatisticaPrograma(241, User.Identity.Name)

            cboFilial.Visible_cboCorporacao = False
            cboFilial.AutoPostBack = True

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Lista de Produtos à Vencer por Dia - PGR241"
        End If
    End Sub


    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            Dim diaHoje, diaAmanha, dia5 As Date

            diaHoje = DateAndTime.Today
            diaAmanha = DateAndTime.DateAdd(DateInterval.Day, 1, diaHoje)
            dia5 = DateAndTime.DateAdd(DateInterval.Day, 5, diaHoje)

            oFun.Grid_Title(grid, "Lista de Produtos que Vencem Hoje - " & diaHoje & ".")
            oFun.Grid_Title(grid2, "Lista de Produtos que Vencem Amanhã - " & diaAmanha & ".")
            oFun.Grid_Title(grid3, "Lista de Produtos que Vencem daqui 5 dias - " & dia5 & ".")


            Session("sDIA") = diaHoje
            Session("sDIA2") = diaAmanha
            Session("sDIA5") = dia5

            grid.DataBind()
            grid2.DataBind()

        End If
    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged

        grid.DataBind()
        grid2.DataBind()
    End Sub
End Class
