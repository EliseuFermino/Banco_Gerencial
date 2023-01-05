
Partial Class MemberPages_Patrimonio_FurtoDegustacaoProduto
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes

    Protected Sub cbpPanel_Produto_Furto_Degustacao_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbpPanel_Produto_Furto_Degustacao.Callback
        mySession()
        Update()

    End Sub

    Private Sub mySession()

        Session("sDIA_INICIAL") = cboDia_Produto.CallDiaInicial
        Session("sDIA_FINAL") = cboDia_Produto.CallDiaFinal

    End Sub


    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            mySession()
            Update()
        End If
    End Sub

    Private Sub Update()
        grid_Produto_AreaVenda.DataBind()
        grid_Produto_Deposito.DataBind()
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Furto Degustação por Produto - PGR339"
        End If

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            oVem.AtualizarEstatisticaPrograma(339, User.Identity.Name)
        End If
    End Sub

End Class
