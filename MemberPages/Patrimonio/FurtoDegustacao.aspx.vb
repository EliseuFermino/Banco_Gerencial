
Partial Class MemberPages_Patrimonio_FurtoDegustacao
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes

    Protected Sub cbpPanel_FurtoDegustacao_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbpPanel_FurtoDegustacao.Callback
        mySession()
        Update()
    End Sub

    Private Sub mySession()

        Session("sFILIAL") = cboFilial.CallFilial
        Session("sANO") = cboAno.CallAno
        Session("sMES") = cboMes.CallMes

    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then

        End If
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            mySession()
            Update()
        End If
    End Sub

    Private Sub Update()
        graph_Total_Furto_Degustacao_daLOJA.DataBind()
        graph_Total_Furto_Degustacao_daLOJA_13_Mes.DataBind()
        graph_FurtoDegustao_porLoja.DataBind()
        graph_FurtoDegustao_Deposito.DataBind()
        graph_Total_Furto_Degustacao_Total.DataBind()
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Furto Degustação - PGR338"
        End If
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            oVem.AtualizarEstatisticaPrograma(338, User.Identity.Name)
            cboAno.AnoInicial = 2014
            cboAno.AnoFinal = Year(DateAndTime.Now())
            cboAno.CallAno = Year(DateAndTime.Now())
            cboMes.AutoPostBack = False
        End If
    End Sub

End Class
