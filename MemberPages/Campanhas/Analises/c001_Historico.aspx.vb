Imports DevExpress.Web

Partial Class MemberPages_Campanhas_Analises_c001_Historico

    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes
    Dim oFun As New Funcoes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            oVem.AtualizarEstatisticaPrograma(144, User.Identity.Name)
            Me.cboAno.AnoInicial = 2015
            Me.cboAno.AnoFinal = Year(Now())
            Me.cboAno.CallAno = Year(Now())
            cboAno.AutoPostBack = False
            cboMes.AutoPostBack = False

            Call Atualizar()
            Call ExibirDados()
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Analise de Históricos de Campanhas"
    End Sub

    Private Sub Atualizar()

        'Session("sFILIAL") = Me.cboFilial.CallFilial
        Session("sANO") = Me.cboAno.CallAno
        Session("sMES") = Me.cboMes.CallMes

        'Me.gridTabelaTodosItens.DataBind()
        gridTabelaSintetica.DataBind()

    End Sub


    Private Sub OcultarDados()

        ' Me.gridTabelaTodosItens.Visible = False
        Me.divTituloTodosItens.Visible = False

    End Sub

    Private Sub ExibirDados()

        ' Me.gridTabelaTodosItens.Visible = True
        Me.divTituloTodosItens.Visible = True

    End Sub

#Region " Grid_TodosItens"

    'Protected Sub gridTabelaTodosItens_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridTabelaTodosItens.CustomSummaryCalculate
    '    oFun.Grid_Footer_Calculate(sender, e, gridTabelaTodosItens, "percMargem", "vlrLucro", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
    '    oFun.Grid_Footer_Calculate(sender, e, gridTabelaTodosItens, "percMargemSellOut", "vlrLucroSellOut", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
    '    oFun.Grid_Footer_Calculate(sender, e, gridTabelaTodosItens, "difMargemPerc", "percMargemSellOut", "percMargem", Funcoes.CalculateType.Sum)
    'End Sub

    'Protected Sub gridTabelaTodosItens_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridTabelaTodosItens.HtmlDataCellPrepared
    '    oFun.Grid_RedIsNegative(e, "percMargem")
    '    oFun.Grid_RedIsNegative(e, "vlrVenda")
    '    oFun.Grid_RedIsNegative(e, "difMargemVlr")
    '    oFun.Grid_RedIsNegative(e, "difMargemPerc")
    '    oFun.Grid_RedIsNegative(e, "vlrLucro")
    'End Sub

    'Protected Sub gridTabelaTodosItens_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gridTabelaTodosItens.HtmlFooterCellPrepared
    '    oFun.Grid_RedIsNegativeFooter(sender, e)
    'End Sub

#End Region

#Region " Grid_Sintetico"

    Protected Sub gridTabelaSintetica_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridTabelaSintetica.CustomSummaryCalculate

        oFun.Grid_Footer_Calculate(sender, e, gridTabelaSintetica, "percMargem", "vlrLucro", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gridTabelaSintetica, "percMargemSellOut", "vlrLucroSellOut", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gridTabelaSintetica, "difMargemPerc", "percMargemSellOut", "percMargem", Funcoes.CalculateType.Sum)
    End Sub

    Protected Sub gridTabelaSintetica_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridTabelaSintetica.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "vlrVenda")
        oFun.Grid_RedIsNegative(e, "difMargemVlr")
        oFun.Grid_RedIsNegative(e, "difMargemPerc")
        oFun.Grid_RedIsNegative(e, "vlrLucro")
    End Sub

    Protected Sub gridTabelaSintetica_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles gridTabelaSintetica.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

#End Region

    Protected Sub gridTabela1_BeforePerformDataSelect(sender As Object, e As EventArgs)
        Session("sCAMPANHA") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

    Protected Sub gridTabela1_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs)

        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "vlrVenda")
        oFun.Grid_RedIsNegative(e, "difMargemVlr")
        oFun.Grid_RedIsNegative(e, "difMargemPerc")
        oFun.Grid_RedIsNegative(e, "vlrLucro")

    End Sub

    Protected Sub gridTabela1_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs)

        oFun.Grid_Footer_Calculate(sender, e, gridTabelaSintetica, "percMargem", "vlrLucro", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gridTabelaSintetica, "percMargemSellOut", "vlrLucroSellOut", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
        oFun.Grid_Footer_Calculate(sender, e, gridTabelaSintetica, "difMargemPerc", "percMargemSellOut", "percMargem", Funcoes.CalculateType.Sum)

    End Sub

    Protected Sub gridTabela1_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs)
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback
        Call Atualizar()
        Call ExibirDados()
    End Sub
End Class
