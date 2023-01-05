
Imports DevExpress.Web

Partial Class MemberPages_Vendas_Delivery_VendaDelivery
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(400, User.Identity.Name)
            cboFilial.Visible_Empresa = True

            oFun.Grid_Column_BorderRight(grid, "FilialDesc", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "QtdVendas", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percPartVenda_Rappi", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "percMargemPDV_Rappi", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Column_BorderRight(grid, "vlrVendaTotal", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "percMargemPDV", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid, "percMargemTotal", Drawing.Color.Gray, BorderStyle.Dashed, 1)
        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Vendas por Canal - Delivery - PGR400"
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
        Session("sDIA_INICIAL") = cboPeriodo.CallDiaInicial
        Session("sDIA_FINAL") = cboPeriodo.CallDiaFinal
        Session("sFILIAL") = cboFilial.CallFilial
        If chkTodasLojas.Checked = True Then Session("sTODAS_LOJAS") = 1
        If chkDelivery.Checked = True Then Session("sTODAS_LOJAS") = 2
        If chkRappi.Checked = True Then Session("sTODAS_LOJAS") = 3



    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
        grid.DataBind()

    End Sub

    Private Sub Atualizar()
        mySession()
    End Sub

    Protected Sub cboPanel_2_Callback(sender As Object, e As CallbackEventArgsBase) Handles cboPanel_2.Callback
        mySession()
        grid_Filial_Dia.DataBind()
    End Sub

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, grid, "percPartVenda", "vlrVenda", "vlrVendaTotal", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percPartVenda_Rappi", "vlrVenda_Rappi", "vlrVendaTotal", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemPDV", "vlrLucroComercial", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemTotal", "vlrLucroTotal", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)

        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemPDV_Rappi", "vlrLucroComercial_Rappi", "vlrVenda_Rappi", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemTotal_Rappi", "vlrLucroTotal_Rappi", "vlrVenda_Rappi", Funcoes.CalculateType.ValueOverRevenue)
    End Sub

    Protected Sub grid_Filial_Dia_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid_Filial_Dia.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, grid_Filial_Dia, "percPartVenda", "vlrVenda", "vlrVendaTotal", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid_Filial_Dia, "percMargemPDV", "vlrLucroComercial", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemTotal", "vlrLucroTotal", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
    End Sub


    
End Class

