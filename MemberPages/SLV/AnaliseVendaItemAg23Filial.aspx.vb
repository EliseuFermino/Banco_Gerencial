Imports DevExpress.Web

Partial Class MemberPages_SLV_AnaliseVendaItemAg23Filial
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(75, User.Identity.Name)
            cboSize.CallSize = 100
            cboPeriodo.AutoPostBack_cboDiaInicial = False
            cboPeriodo.AutoPostBack_cboDiaFinal = False
        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete

        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Análise de Vendas e Agenda 23 por Seção - PGR75"
        End If

    End Sub

    Protected Sub btnExcel_BotaoClick(sender As Object, e As EventArgs) Handles btnExcel.BotaoClick
        Me.btnExcel.CallGridViewID = "grid"
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then

            Me.cboFilial.AutoPostBack = False

            If cboFilial.IsLoja Then
                cboFilial.Visible = True
                cboFilial.Visible_cboCorporacao = False
            Else
                cboFilial.Visible = True
                Me.cboFilial.Visible_cboCorporacao = True
            End If

        End If
    End Sub

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback

        Session("sDIA_INICIAL") = cboPeriodo.CallDiaInicial
        Session("sDIA_FINAL") = cboPeriodo.CallDiaFinal
        Session("sFILIAL") = cboFilial.CallFilial

        Me.grid.DataBind()

    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)
    End Sub

End Class
