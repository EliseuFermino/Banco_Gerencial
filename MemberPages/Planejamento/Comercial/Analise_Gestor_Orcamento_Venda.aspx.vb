Imports DevExpress.Web

Partial Class MemberPages_Planejamento_Comercial_Analise_Gestor_Orcamento_Venda
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(427, User.Identity.Name)

            Dim varAno As Int32
            varAno = Year(Now()) + 1

            Me.cboAno.AnoInicial = 2022
            Me.cboAno.AnoFinal = varAno
            Me.cboAno.CallAno = varAno

            Me.cboAno.AutoPostBack = False

            oFun.Grid_Column_BorderRight(grid, "desSecao", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percPartAA3", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(grid, "percPartMeta", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "percPartAA1", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "percPartAA2", Drawing.Color.Gray, BorderStyle.Dashed, 1)

            'por Comprador
            oFun.Grid_Column_BorderRight(gridComprador, "descMes", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(gridComprador, "percPartAA3", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(gridComprador, "percPartMeta", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(gridComprador, "percPartAA1", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(gridComprador, "percPartAA2", Drawing.Color.Gray, BorderStyle.Dashed, 1)

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Análise do Orçamento de Vendas por Comprador - PGR427"
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
        Dim oPro As New Projeto
        Dim vDepartamento As String

        vDepartamento = LCase(oPro.Buscar_Departamento_Usuario(Page.User.Identity.Name))

        'lblOBS.Text = vDepartamento

        Session("sANO") = cboAno.CallAno

        Select Case vDepartamento
            Case "gerente_comercial", "gestor_comercial"
                Session("sGESTOR") = Page.User.Identity.Name
            Case Else
                Session("sGESTOR") = 286860
        End Select

    End Sub

    Private Sub Atualizar()
        mySession()
        Me.grid.DataBind()
    End Sub


    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
    End Sub

   

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percCrescMeta_AA1")
        oFun.Grid_RedIsNegative(e, "percCrescMeta_AA2")
        oFun.Grid_RedIsNegative(e, "percCrescMeta_AA3")

    End Sub

    Protected Sub grid_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles grid.HtmlRowPrepared
        oFun.grid_RowSelectedWhole(grid, e, "desSecao", "", Drawing.Color.LightGray, True)
    End Sub

    Protected Sub gridComprador_CustomCallback(sender As Object, e As ASPxGridViewCustomCallbackEventArgs) Handles gridComprador.CustomCallback

        Dim categoryId As String = grid.GetRowValues(grid.FocusedRowIndex, "idProdutoSecao").ToString()
        Dim descSecao As String = grid.GetRowValues(grid.FocusedRowIndex, "desSecao").ToString()

        oFun.Grid_Title(gridComprador, "Comercial - Orçamento de Vendas Mês a Mês da Seção: " & descSecao)

        Session("sSECAO") = categoryId
        gridComprador.DataBind()

    End Sub

    Protected Sub gridComprador_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridComprador.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percCrescMeta_AA1")
        oFun.Grid_RedIsNegative(e, "percCrescMeta_AA2")
        oFun.Grid_RedIsNegative(e, "percCrescMeta_AA3")
    End Sub

    Protected Sub gridComprador_HtmlRowPrepared(sender As Object, e As ASPxGridViewTableRowEventArgs) Handles gridComprador.HtmlRowPrepared
        oFun.grid_RowSelectedWhole(grid, e, "descMes", "Ano", Drawing.Color.LightGray, True)
    End Sub

    Protected Sub gridAnalise_CustomCallback(sender As Object, e As ASPxGridViewCustomCallbackEventArgs) Handles gridAnalise.CustomCallback

        Dim categoryId As String = grid.GetRowValues(grid.FocusedRowIndex, "idProdutoSecao").ToString()
        Dim descSecao As String = grid.GetRowValues(grid.FocusedRowIndex, "desSecao").ToString()

        oFun.Grid_Title(gridAnalise, "Seção: " & descSecao & ".  Verde: Digitado  Vermelho: Falta Digitar")

        Session("sSECAO") = categoryId
        gridAnalise.DataBind()
    End Sub

End Class


