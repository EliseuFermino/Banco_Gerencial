
Partial Class MemberPages_Patrimonio_ValorRecuperado
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes

    Protected Sub cbpPanel_ValorRecuperado_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbpPanel_ValorRecuperado.Callback
        On Error Resume Next
        mySession()
        Update()
    End Sub

    Private Sub mySession()

        Session("sFILIAL") = cboFilial.CallFilial
        Session("sANO") = cboAno.CallAno
        Session("sMES") = cboMes.CallMes

    End Sub


    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            mySession()
            Update()
        End If
    End Sub

    Private Sub Update()
        On Error Resume Next
        graph_ValorRecuperado_porFilial.DataBind()
        graph_ValorRecuperado.DataBind()
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Valor Recuperado - PGR337"
        End If

    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            oVem.AtualizarEstatisticaPrograma(337, User.Identity.Name)

            cboAno.AnoInicial = 2014
            cboAno.AnoFinal = myDateTimes.YearToday
            cboAno.CallAno = myDateTimes.YearToday

            If cboFilial.IsLoja = True Then
                graph_ValorRecuperado.Visible = False
            End If
        End If
    End Sub

End Class
