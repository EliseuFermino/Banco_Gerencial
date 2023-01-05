
Partial Class MemberPages_Patrimonio_grafico_Empresa
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes

    Private Sub mySession()

        Session("sANO") = cboAno.CallAno
        Session("sMES") = cboMes.CallMes

    End Sub

    Protected Sub cbPanel_Empresa_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel_Empresa.Callback
        mySession()
        Update()
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            oVem.AtualizarEstatisticaPrograma(325, User.Identity.Name)

            cboMes.AutoPostBack = False
            cboAno.AnoInicial = 2014
            cboAno.AnoFinal = myDateTimes.YearToday
            cboAno.CallAno = myDateTimes.YearToday

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Empresa - Valor Recuperado e Furto Degustação - PGR325"
        End If
    End Sub


    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            mySession()
            Update()
        End If
    End Sub

    Private Sub Update()
        graph_ValorRecuperado_Empresa_Periodo.DataBind()
        graph_Total_Furto_Degustacao_daEMPRESA.DataBind()
        graph_Total_Furto_Degustacao_daEMPRESA_13_Mes.DataBind()
    End Sub

End Class
