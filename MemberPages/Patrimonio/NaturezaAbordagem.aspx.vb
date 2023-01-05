
Partial Class MemberPages_Patrimonio_NaturezaAbordagem
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes

    Protected Sub cbPanel_NaturezaAbordagem_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel_NaturezaAbordagem.Callback
        mySession()
        Update()
    End Sub

    Private Sub mySession()

        Session("sFILIAL") = cboFilial.CallFilial
        Session("sANO") = cboAno.CallAno
        Session("sMES") = cboMes.CallMes

    End Sub

    Private Sub Update()
        Graph.DataBind()
        graph_12meses.DataBind()
        graph_Natureza_Abordagem_Empresa.DataBind()
    End Sub

   

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Natureza de Abordagem - PGR336"
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            oVem.AtualizarEstatisticaPrograma(336, User.Identity.Name)
            cboAno.AutoPostBack = False
            cboMes.AutoPostBack = False
            cboAno.AnoInicial = 2014
            cboAno.AnoFinal = myDateTimes.YearToday
            cboAno.CallAno = myDateTimes.YearToday
            mySession()
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then

            Update()
        End If
    End Sub
End Class
