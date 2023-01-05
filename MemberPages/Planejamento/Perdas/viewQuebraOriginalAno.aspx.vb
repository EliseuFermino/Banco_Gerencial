Imports DevExpress.Web
Partial Class MemberPages_Planejamento_Quebras_viewQuebraOriginalMes
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes

    Protected Sub cboAno_ListAnoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.ListAnoChanged
        Call Atualizar()
    End Sub

    Protected Sub cboFilial_ListFilialChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboFilial.ListFilialChanged
        Call Atualizar()
    End Sub

    Protected Sub ASPxGridView1_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles ASPxGridView1.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, ASPxGridView1, "percQuebra", "vlrQuebra", "vlrVenda", Funcoes.CalculateType.ValueOverRevenue)
    End Sub

    Protected Sub ASPxGridView1_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles ASPxGridView1.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "vlrQuebra")
        oFun.Grid_RedIsNegative(e, "percQuebra")

    End Sub

    Protected Sub cboPosicao_ListPosicaoChanged(sender As Object, e As EventArgs) Handles cboPosicao.ListPosicaoChanged
        Call Atualizar()
    End Sub

    Private Sub Atualizar()
        Session("sFilial") = Me.cboFilial.CallFilial
        Session("sAno") = Me.cboAno.CallAno
        Session("sPOSICAO") = Me.cboPosicao.CallPosicao
        Me.ASPxGridView1.DataBind()
    End Sub

    Protected Sub ASPxGridView1_HtmlFooterCellPrepared(sender As Object, e As ASPxGridViewTableFooterCellEventArgs) Handles ASPxGridView1.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub ASPxGridView1_PreRender(sender As Object, e As EventArgs) Handles ASPxGridView1.PreRender
        If Not IsPostBack Then
            Call Atualizar()
        End If
    End Sub


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim idFilial As String = Request.QueryString("idFilial")

            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = Year(DateAndTime.Now()) + 1
            Me.cboAno.CallAno = Year(DateAndTime.Now())

            Me.cboAno.CallAno = Year(Now()) + 1

            Me.cboFilial.Visible_cboCorporacao = False
            Me.cboFilial.AutoPostBack = True

            Me.cboPosicao.CallPosicao = 3

        End If
    End Sub
End Class
