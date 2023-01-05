
Partial Class MemberPages_Cadastros_PrecoVendaPorFilial
    Inherits System.Web.UI.Page


    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(307, User.Identity.Name)

            Dim varAno As Int32
            varAno = Year(Now())

            cboFilial.AutoPostBack = False
            cboFilial.Visible_cboCorporacao = False

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Listagem de Preços de Venda de Hoje - PGR307"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            mySession()
            cboSize.CallSize = 100
            Atualizar()
        End If
    End Sub

#End Region

    Private Sub mySession()
        Session("sFILIAL") = cboFilial.CallFilial
    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
    End Sub

    Private Sub Atualizar()
        mySession()
        oFun.Grid_Title(grid, "Preço de Venda Praticado Hoje -" & DateAndTime.Today)
        grid.DataBind()
    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "QtdeEstoque")
    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)

    End Sub

End Class
