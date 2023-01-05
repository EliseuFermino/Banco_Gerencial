
Partial Class MemberPages_Despesas_graphAlimTransp
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
            Me.cboFilial.AutoPostBack = False
            cboMes.AutoPostBack = False
            cboFilial.Visible_cboCorporacao = False

            oFun.Grid_Title(grid_Cozinha_Analitica, "Total de Despesa da Cozinha do Periodo Selecionado")
            oFun.Grid_Title(grid_Cozinha_Agenda245, "Total de Alimentação - Agenda 245")
        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Ánalise Despesa de Alimentação x Vale Transporte - PGR335"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            cboMes.CallMes = Month(DateAndTime.Now.AddMonths(-1))
            mySession()
            Atualizar()

        End If
    End Sub

#End Region

    Private Sub mySession()
        Session("sANO") = Me.cboAno.CallAno
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Session("sMES") = Me.cboMes.CallMes
    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
    End Sub

    Private Sub Atualizar()
        mySession()
        grid_Cozinha_Analitica.DataBind()
        grid_Cozinha_Agenda245.DataBind()
    End Sub



    Protected Sub grid_Cozinha_Analitica_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid_Cozinha_Analitica.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "VALOR")
    End Sub

    Protected Sub grid_Cozinha_Agenda245_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid_Cozinha_Agenda245.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "VALOR")
    End Sub
End Class

