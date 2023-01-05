

Partial Class MemberPages_Clientes_GraficoClientes
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(280, User.Identity.Name)
            cboFilial.Visible_cboCorporacao = False
            cboPeriodo.Visible_btnAtualizar = False

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Comparativo de Perdas de Clientes - PGR280"
            If cboFilial.IsLoja = False Then
                cboPeriodo.CallAno = DateAndTime.Year(Now)
                cboPeriodo.CallMes = DateAndTime.Month(Now)
            End If

        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            mySession()

            Atualizar()
            oFun.Grid_Title(gridTabela, "Acompanhamento de Número de Clientes - Mesmos Dias")
            oFun.Grid_ColumnTitle(gridTabela, "clientesAA", oVen.Year_Return_Last)
            oFun.Grid_ColumnTitle(gridTabela, "clientesAT", oVen.Year_Return_Actual)

        End If
    End Sub

#End Region

    Private Sub mySession()

        Dim myHoje As Date
        myHoje = DateAndTime.Today()

        Session("sANO") = cboPeriodo.CallAno

        Session("sMES") = cboPeriodo.CallMes

        Session("sMESMOS_DIAS") = 0

        Session("sPROJECAO") = 3


    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
    End Sub

    Private Sub Atualizar()
        mySession()
        dsDados.DataBind()
        gridMediaClientes.DataBind()
        gridTabela.DataBind()
    End Sub

    Protected Sub Graph_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles Graph.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY(Graph, sender, e)
    End Sub

    Protected Sub Graph1_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles Graph1.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY(Graph1, sender, e)
    End Sub

    Protected Sub Graph3_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles Graph3.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY(Graph3, sender, e)
    End Sub

    Protected Sub Graph4_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles Graph4.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY(Graph4, sender, e)
    End Sub

    Protected Sub Graph5_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles Graph5.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY(Graph5, sender, e)
    End Sub

    Protected Sub Graph7_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles Graph7.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY(Graph7, sender, e)
    End Sub

    Protected Sub gridTabela_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles gridTabela.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, gridTabela, "percCrescClientes", "clientesAT", "clientesAA", Funcoes.CalculateType.Growth)

    End Sub



    Protected Sub gridTabela_CustomUnboundColumnData(sender As Object, e As DevExpress.Web.ASPxGridViewColumnDataEventArgs) Handles gridTabela.CustomUnboundColumnData
        On Error Resume Next
        oFun.Grid_Calculate(e, "difClientes", "clientesAT", "clientesAA", Funcoes.CalculateType.Decrease)
        oFun.Grid_Calculate(e, "percCrescClientes", "clientesAT", "clientesAA", Funcoes.CalculateType.Growth)
    End Sub


    Protected Sub gridTabela_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridTabela.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percCrescClientes")
        oFun.Grid_RedIsNegative(e, "difClientes")
    End Sub

    Protected Sub gridTabela_HtmlFooterCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableFooterCellEventArgs) Handles gridTabela.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub

    Protected Sub gridMediaClientes_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridMediaClientes.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "vlrClientes")
        oFun.Grid_RedIsNegative(e, "vlrTickets")
    End Sub
End Class

