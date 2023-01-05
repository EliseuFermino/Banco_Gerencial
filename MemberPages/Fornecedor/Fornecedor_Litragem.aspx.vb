
Partial Class MemberPages_Fornecedor_Fornecedor_Litragem
    Inherits System.Web.UI.Page


    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(344, User.Identity.Name)

            oFun.Grid_Column_BorderRight(grid, "NomeFornecedorPrincipal", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percCresc_Qtde", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percCresc_Qtde_MA", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percCresc_Qtde_MA1", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percCresc_Qtde_MA2", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(grid, "percCresc_Volume", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "percCresc_Volume_MA", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "percCresc_Volume_MA1", Drawing.Color.Gray, BorderStyle.Solid, 1)
            oFun.Grid_Column_BorderRight(grid, "percCresc_Volume_MA2", Drawing.Color.Gray, BorderStyle.Solid, 1)

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Consultar por Fornecedor - Volume, Litro e Peso - PGR344"
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
        Session("sDIA_INICIAL") = cboPeriodo.CallDiaInicial
        Session("sDIA_FINAL") = cboPeriodo.CallDiaFinal
        Session("sSECAO") = cboSecao.CallSecao

        Session("sFILIAL") = 99
        Session("sUSERNAME") = Page.User.Identity.Name

    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
        grid.DataBind()
    End Sub

    Private Sub Atualizar()
        mySession()
    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)

    End Sub


    Protected Sub btnAtualizar_Click(sender As Object, e As EventArgs) Handles btnAtualizar.Click
        Dim oDb As New clDataDb
        oDb.ExecuteStoredProcedure("dbo.usp_AtualizarLitragemDados", Conexao.gerVendaFornecedores_str,
                                  "@SDiaInicial", Session("sDIA_INICIAL"),
                                  "@SDiaFinal", Session("sDIA_FINAL"),
                                  "@idSecao", Session("sSECAO"),
                                  "@Usuario", Session("sUSERNAME"))
        lblError.Text = oDb.varDesc
        Me.grid.Visible = True
        grid.DataBind()
    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percCresc_Qtde")
        oFun.Grid_RedIsNegative(e, "percCresc_Qtde_MA")
        oFun.Grid_RedIsNegative(e, "percCresc_Qtde_MA1")
        oFun.Grid_RedIsNegative(e, "percCresc_Qtde_MA2")
        oFun.Grid_RedIsNegative(e, "percCresc_Volume")
        oFun.Grid_RedIsNegative(e, "percCresc_Volume_MA")
        oFun.Grid_RedIsNegative(e, "percCresc_Volume_MA1")
        oFun.Grid_RedIsNegative(e, "percCresc_Volume_MA2")

     

    End Sub
End Class
