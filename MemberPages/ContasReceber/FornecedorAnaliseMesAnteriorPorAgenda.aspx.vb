
Partial Class MemberPages_ContasReceber_FornecedorAnaliseMesAnteriorPorAgenda
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(0, User.Identity.Name)

            Dim varAno As Int32
            varAno = Year(Now())

            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = varAno
            Me.cboAno.CallAno = varAno

            Me.cboAno.AutoPostBack = False
            Me.cboMes.AutoPostBack = False

            cboMes.CallMes = Month(DateAndTime.Now().AddDays(-20))

            oFun.Grid_Column_Wrap(grid, "descForn", DevExpress.Utils.DefaultBoolean.False)



        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then

            CType(Master.FindControl("lblTitle"), Label).Text = "Análise das Agendas de Contas à Receber por Fornecedor - PGR279"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then

            mySession()
            Titulos()
            Atualizar()
        End If
    End Sub

#End Region

    Private Sub mySession()
        Session("sANO") = Me.cboAno.CallAno
        Session("sMES_INICIAL") = Me.cboMes.CallMes
        Session("sMES_FINAL") = Me.cboMes.CallMes
        Session("sFILIAL") = 99 'Empresa
        Session("sAGENDA") = cboAgendas.CallAgenda

        If checkCGC.Checked = True Then
            Session("sCGC_PRINCIPAL") = 1
            oFun.Grid_ColumnTitle(grid, "idForn", "CGC Principal")
        Else
            Session("sCGC_PRINCIPAL") = 2
            oFun.Grid_ColumnTitle(grid, "idForn", "idFornecedor")
        End If


    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
        Titulos()


    End Sub

    Private Sub Atualizar()
        mySession()

        Me.grid.DataBind()
    End Sub

    Protected Sub grid_AfterPerformCallback(sender As Object, e As DevExpress.Web.ASPxGridViewAfterPerformCallbackEventArgs) Handles grid.AfterPerformCallback
        Titulos()
    End Sub

    Protected Sub grid_CustomSummaryCalculate(sender As Object, e As DevExpress.Data.CustomSummaryEventArgs) Handles grid.CustomSummaryCalculate
        oFun.Grid_Footer_Calculate(sender, e, grid, "percCresc", "vlrMesAT", "vlrMesAA", Funcoes.CalculateType.Growth)
    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "vlrDif")
        oFun.Grid_RedIsNegative(e, "percCresc")
    End Sub

    Private Sub Titulos()
        Dim myDate As Date
        myDate = CDate("01/" + "8" + "/" + "2020")
        oFun.Grid_ColumnTitle(grid, "vlrMesAA", MonthName(Month(DateAdd(DateInterval.Month, -1, myDate)), False) + "/" + Right(Year(myDate), 2))
        oFun.Grid_ColumnTitle(grid, "vlrMesAT", MonthName(Month(myDate), False) + "/" + Right(cboAno.CallAno, 2))
    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub
End Class
