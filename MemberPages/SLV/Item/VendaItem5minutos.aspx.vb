
Partial Class MemberPages_SLV_Item_VendaItem5minutos
    Inherits System.Web.UI.Page


    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(310, User.Identity.Name)

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Venda por Item - de 10 em 10 minutos - PGR321"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            mySession()

            Atualizar()
        End If
    End Sub

#End Region

    Private Sub mySession()
        Session("sPRODUTO") = cboProduto.CallProduto

    End Sub


    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback

        Atualizar()
        Dim oDat As New clDataDb

        Dim varFilial As Byte = Session("sFILIAL")
        'Dim varDia As String = Session("sDIA")
        Dim varProduto As Integer = Session("sPRODUTO")

        If IsNothing(oDat.ExecuteStoredProcedure_Scalar("dbo.usp_tblVendaItemMinutos_Hoje_SEM_VENDA", Conexao.gerVendaItem_str, "idFilial", varFilial, "idProduto", varProduto)) Then

            graph.Visible = False
            lblFalta.Visible = True
            lblFalta.Text = "O produto " & varProduto & "-" & Session("sNOME_PRODUTO") & " não foi vendido ainda!!!"
            lblEstoque.Text = "Há " & oDat.ExecuteStoredProcedure_Scalar("dbo.usp_buscarEstoqueItem", Conexao.gerCadastros_str, "idFilial", varFilial, "Dia", Session("sDIA"), "idProduto", varProduto) & " unidades no estoque da loja"
        Else
            lblFalta.Visible = False
            graph.Visible = True
            graph.DataBind()
        End If

    End Sub

    Private Sub Atualizar()
        mySession()
    End Sub



    Protected Sub graph_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles graph.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY_SemPercentual(graph, sender, e)
    End Sub
End Class

