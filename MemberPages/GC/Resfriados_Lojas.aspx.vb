
Imports DevExpress.Web

Partial Class MemberPages_GC_Resfriados_Lojas
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(411, User.Identity.Name)
            cboFilial.Visible_cboCorporacao = False

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Gerenciamento de Categoria - Resfriado - por Filial"
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
        On Error Resume Next
        Session("sDIA_INICIAL") = cboPeriodo.CallDiaInicial
        Session("sDIA_FINAL") = cboPeriodo.CallDiaFinal
        Session("sFILIAL") = cboFilial.CallFilial

    End Sub


    Protected Sub cboPanel_Callback(sender As Object, e As CallbackEventArgsBase) Handles cboPanel.Callback
        
        Atualizar()

        grid.Visible = True

        ' lblError.Text = Session("sCATEGORIA") & " - " & Session("sCATEGORIA_GC")
        grid.DataBind()

    End Sub

    Private Sub Atualizar()
        mySession()
    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "Diferenca_Venda")
        oFun.Grid_RedIsNegative(e, "Diferenca_Metro_Linear")
        oFun.Grid_RedIsNegative(e, "Red_50_Perc")

        oFun.Grid_RedIsNegative(e, "vlrDivergencia")
        oFun.Grid_RedIsNegative(e, "vlrAgenda23")
        oFun.Grid_RedIsNegative(e, "vlrPerdaTotal")
        oFun.Grid_RedIsNegative(e, "percDivergencia")
        oFun.Grid_RedIsNegative(e, "percAgenda23")
        oFun.Grid_RedIsNegative(e, "percPerdaTotal")

    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared

        oFun.Grid_RedIsNegativeFooter(sender, e)

    End Sub

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate
        On Error Resume Next
        oFun.Grid_Footer_Calculate(sender, e, grid, "percMargemFinal", "vlrLucroTotal", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)

        oFun.Grid_Footer_Calculate(sender, e, grid, "percDivergencia", "vlrDivergencia", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percAgenda23", "vlrAgenda23", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, grid, "percPerdaTotal", "vlrPerdaTotal", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)


    End Sub

 



End Class

