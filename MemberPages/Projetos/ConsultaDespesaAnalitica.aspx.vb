
Partial Class MemberPages_ConsultaDespesaAnalitica
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Dim oVem As New VendaEmpresaMes
        If Not IsPostBack Then
            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = Year(Now())
            Me.cboAno.CallAno = Year(Now())
            Me.cboMes.CallMes = Month(Now())
            Session("@Ano") = Year(Now())
            Session("@Mes") = Month(Now())
            oVem.AtualizarEstatisticaPrograma(36, User.Identity.Name)
        End If
    End Sub

    Protected Sub ASPxButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles ASPxButton1.Click
        Me.ExporterExcel1.WriteXlsToResponse()
    End Sub

    Protected Sub cboMes_ListMesChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboMes.ListMesChanged
        Session("@Mes") = Month(Now())
        Me.ASPxGridView1.DataBind()
    End Sub

    Protected Sub cboAno_ListAnoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.ListAnoChanged
        Session("@Ano") = Year(Now())
        Me.ASPxGridView1.DataBind()
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Consulta de Despessas Analiticas"
    End Sub
End Class
