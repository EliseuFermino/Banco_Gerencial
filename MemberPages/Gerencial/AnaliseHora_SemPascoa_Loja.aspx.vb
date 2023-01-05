Imports DevExpress.Web

Partial Class MemberPages_Gerencial_AnaliseHora_SemPascoa_Loja
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes

#Region " PAGE"

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(281, User.Identity.Name)

            Me.cboMes.AutoPostBack = True
            Me.cboAno.AutoPostBack = True

            Me.cboAno.AnoInicial = 2009
            Me.cboAno.AnoFinal = Year(Now())

            Call RotinaInicio()
            Call MudarTitualo()

        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            If cboFilial.IsLoja = True Then cboFilial.Visible_cboCorporacao = False

            Session("sANO") = cboAno.CallAno
            Session("sMES") = cboMes.CallMes
            Session("sFILIAL") = cboFilial.CallFilial

            ASPxGridView1.DataBind()
            gridLojaLoja.DataBind()

            cboFilial.Visible_cboCorporacao = False

        End If
    End Sub

#End Region

    Private Sub RotinaInicio()
        Session("sUSUARIO") = User.Identity.Name
        Session("sMES") = Month(Now())
        Session("sANO") = cboAno.CallAno
        Session("sFILIAL") = cboFilial.CallFilial

        Me.cboMes.CallMes = Month(Now())
        Me.cboAno.CallAno = Year(Now())
    End Sub

    Protected Sub cboMes_ListMesChanged(sender As Object, e As EventArgs) Handles cboMes.ListMesChanged
        Session("sMES") = Me.cboMes.CallMes
        Call Atualizar()
    End Sub

    Private Sub Atualizar()

        Session("sANO") = cboAno.CallAno
        Session("sMES") = cboMes.CallMes
        Session("sFILIAL") = cboFilial.CallFilial

        Me.ASPxGridView1.DataBind()
        Me.gridLojaLoja.DataBind()
    End Sub

    Protected Sub cboAno_ListAnoChanged(sender As Object, e As EventArgs) Handles cboAno.ListAnoChanged
        Call Atualizar()
        Call MudarTitualo()
    End Sub

    Protected Sub ASPxGridView1_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles ASPxGridView1.CustomSummaryCalculate

        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "vlr4", "vlr2", "vlr1", Funcoes.CalculateType.Growth)

    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "vlr3")
        oFun.Grid_RedIsNegative(e, "vlr4")

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Call RotinaInicio()
            Call Atualizar()
            Me.ASPxGridView1.DataBind()
            Me.gridLojaLoja.DataBind()
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Análise Vendas por Hora Sem Páscoa por Filial - PGR281"
    End Sub

    Protected Sub btnAtualizar_BotaoClick(sender As Object, e As EventArgs) Handles btnAtualizar.BotaoClick
        Call RotinaInicio()
        Call Atualizar()
        Me.ASPxGridView1.DataBind()

    End Sub

    Private Sub MudarTitualo()
        Me.ASPxGridView1.Columns("vlr1").Caption = Me.cboAno.CallAno - 1
        Me.ASPxGridView1.Columns("vlr2").Caption = Me.cboAno.CallAno

        Me.gridLojaLoja.Columns("vlr1").Caption = Me.cboAno.CallAno - 1
        Me.gridLojaLoja.Columns("vlr2").Caption = Me.cboAno.CallAno
    End Sub

    Protected Sub gridLojaLoja_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridLojaLoja.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, gridLojaLoja, "vlr4", "vlr2", "vlr1", Funcoes.CalculateType.Growth)
    End Sub

    Protected Sub gridLojaLoja_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridLojaLoja.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "vlr3")
        oFun.Grid_RedIsNegative(e, "vlr4")
    End Sub

    Protected Sub gridLojaLoja_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gridLojaLoja.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub ASPxGridView1_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles ASPxGridView1.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub gridLojaLoja_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles gridLojaLoja.HtmlRowPrepared

        oFun.grid_RowSelectedWhole(gridLojaLoja, e, "Descricao", "Depto. Mercearia", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gridLojaLoja, e, "Descricao", "Depto. Pereciveis", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gridLojaLoja, e, "Descricao", "Depto. Bazar", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gridLojaLoja, e, "Descricao", "Depto. Textil", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gridLojaLoja, e, "Descricao", "Depto. Eletro", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(gridLojaLoja, e, "Descricao", "Total", Drawing.Color.LightGreen, True)

    End Sub

End Class
