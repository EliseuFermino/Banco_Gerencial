Imports DevExpress.Web

Partial Class MemberPages_Gerencial_MargemChave
    Inherits System.Web.UI.Page


    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(305, User.Identity.Name)

            oFun.Grid_ColumnFormat(grid, "hFilial_1", "33-Pinhais", "Percentual de Margem da Loja 33-Pinhais", Funcoes.CasaDecimais.Duas, 60)
            oFun.Grid_ColumnFormat(grid, "hFilial_2", "23-Araucária", "Percentual de Margem da Loja 23-Araucária Nova", Funcoes.CasaDecimais.Duas, 60)
            oFun.Grid_ColumnFormat(grid, "hFilial_3", "27-Novo Mundo", "Percentual de Margem da Loja 27-Novo Mundo", Funcoes.CasaDecimais.Duas, 60)
            oFun.Grid_ColumnFormat(grid, "hFilial_4", "29-Água Verde", "Percentual de Margem da Loja 29-Água Verde", Funcoes.CasaDecimais.Duas, 60)
            oFun.Grid_ColumnFormat(grid, "hFilial_5", "22-Champagnat", "Percentual de Margem da Loja 22-Champagnat", Funcoes.CasaDecimais.Duas, 60)
            oFun.Grid_ColumnFormat(grid, "hFilial_99", "Hiper", "Percentual de Margem das Lojas Hiper", Funcoes.CasaDecimais.Duas, 60)

            oFun.Grid_ColumnFormat(grid, "sFilial_1", "28-Cristo Rei", "Percentual de Margem da Loja 28-Cristo Rei", Funcoes.CasaDecimais.Duas, 60)
            oFun.Grid_ColumnFormat(grid, "sFilial_2", "07-Hauer", "Percentual de Margem da Loja 07-Hauer", Funcoes.CasaDecimais.Duas, 60)
            oFun.Grid_ColumnFormat(grid, "sFilial_3", "17-Ahú", "Percentual de Margem da Loja 17-Ahú", Funcoes.CasaDecimais.Duas, 60)
            oFun.Grid_ColumnFormat(grid, "sFilial_4", "03-Santa Felicidade", "Percentual de Margem da Loja 03-Santa Felicidade", Funcoes.CasaDecimais.Duas, 60)
            oFun.Grid_ColumnFormat(grid, "sFilial_5", "37-Cajuru", "Percentual de Margem da Loja 37-Cajuru", Funcoes.CasaDecimais.Duas, 60)
            oFun.Grid_ColumnFormat(grid, "sFilial_99", "Super", "Percentual de Margem das Lojas Super", Funcoes.CasaDecimais.Duas, 60)

            oFun.Grid_ColumnFormat(grid, "sFilial", "Melhor <br /> Margem", "Percentual de Margem Ideal da Empresa", Funcoes.CasaDecimais.Duas, 70)

            oFun.Grid_Column_BorderRight(grid, "descSecao", System.Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "hFilial_99", System.Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "sFilial_99", System.Drawing.Color.Gray, BorderStyle.Solid, 2)

            Dim gridView As ASPxGridView = TryCast(sender, ASPxGridView)


        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Margem Chave - PGR305"
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
        Session("sTIPO") = tipoMargem.SelectedItem.Value
        Session("sDIA_INICIAL") = cboPeriodo.CallDiaInicial
        Session("sDIA_FINAL") = cboPeriodo.CallDiaFinal

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

    Protected Sub grid_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles grid.HtmlRowPrepared

        oFun.grid_RowSelectedWhole(grid, e, "descSecao", "Depto 1", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descSecao", "Depto 2", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descSecao", "Depto 3", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descSecao", "Depto 4", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descSecao", "Depto 5", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descSecao", "Total Geral", Drawing.Color.LightGreen, True)

    End Sub


 
    Protected Sub detail_BeforePerformDataSelect(sender As Object, e As EventArgs)
        Session("sMERCADOLOGICO") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

    Protected Sub detail_Load(sender As Object, e As EventArgs)
        Dim gridView As ASPxGridView = TryCast(sender, ASPxGridView)
        oFun.Grid_ColumnFormat(gridView, "hFilial_1", "33-Pinhais", "Percentual de Margem da Loja 33-Pinhais", Funcoes.CasaDecimais.Duas, 60)
        oFun.Grid_ColumnFormat(gridView, "hFilial_2", "23-Araucária", "Percentual de Margem da Loja 23-Araucária Nova", Funcoes.CasaDecimais.Duas, 60)
        oFun.Grid_ColumnFormat(gridView, "hFilial_3", "27-Novo Mundo", "Percentual de Margem da Loja 27-Novo Mundo", Funcoes.CasaDecimais.Duas, 60)
        oFun.Grid_ColumnFormat(gridView, "hFilial_4", "29-Água Verde", "Percentual de Margem da Loja 29-Água Verde", Funcoes.CasaDecimais.Duas, 60)
        oFun.Grid_ColumnFormat(gridView, "hFilial_5", "22-Champagnat", "Percentual de Margem da Loja 22-Champagnat", Funcoes.CasaDecimais.Duas, 60)
        oFun.Grid_ColumnFormat(gridView, "hFilial_99", "Hiper", "Percentual de Margem das Lojas Hiper", Funcoes.CasaDecimais.Duas, 60)

        oFun.Grid_ColumnFormat(gridView, "sFilial_1", "28-Cristo Rei", "Percentual de Margem da Loja 28-Cristo Rei", Funcoes.CasaDecimais.Duas, 60)
        oFun.Grid_ColumnFormat(gridView, "sFilial_2", "07-Hauer", "Percentual de Margem da Loja 07-Hauer", Funcoes.CasaDecimais.Duas, 60)
        oFun.Grid_ColumnFormat(gridView, "sFilial_3", "17-Ahú", "Percentual de Margem da Loja 17-Ahú", Funcoes.CasaDecimais.Duas, 60)
        oFun.Grid_ColumnFormat(gridView, "sFilial_4", "03-Santa Felicidade", "Percentual de Margem da Loja 03-Santa Felicidade", Funcoes.CasaDecimais.Duas, 60)
        oFun.Grid_ColumnFormat(gridView, "sFilial_5", "37-Cajuru", "Percentual de Margem da Loja 37-Cajuru", Funcoes.CasaDecimais.Duas, 60)
        oFun.Grid_ColumnFormat(gridView, "sFilial_99", "Super", "Percentual de Margem das Lojas Super", Funcoes.CasaDecimais.Duas, 60)

        oFun.Grid_ColumnFormat(gridView, "sFilial", "Melhor <br /> Margem", "Percentual de Margem Ideal da Empresa", Funcoes.CasaDecimais.Duas, 70)

        oFun.Grid_Column_BorderRight(gridView, "descGrupo", System.Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(gridView, "hFilial_99", System.Drawing.Color.Gray, BorderStyle.Solid, 2)
        oFun.Grid_Column_BorderRight(gridView, "sFilial_99", System.Drawing.Color.Gray, BorderStyle.Solid, 2)


    End Sub
End Class

