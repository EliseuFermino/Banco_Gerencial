
Partial Class MemberPages_Replanejamento_checarFiliais
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(88, User.Identity.Name)

            Me.cboAno.AutoPostBack = True
            Me.cboMes.AutoPostBack = True

            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = Year(Now())

            Me.cboAno.CallAno = Year(Now())
            Me.cboMes.CallMes = Month(Now()) + 1

            Session("sANO") = Me.cboAno.CallAno
            Session("sMES") = Me.cboMes.CallMes
        End If
    End Sub

    Protected Sub cboAno_ListAnoChanged(sender As Object, e As EventArgs) Handles cboAno.ListAnoChanged
        Session("sANO") = Me.cboAno.CallAno
        Call Atualizar()
    End Sub

    Protected Sub cboMes_ListMesChanged(sender As Object, e As EventArgs) Handles cboMes.ListMesChanged
        Session("sMES") = Me.cboMes.CallMes
        Call Atualizar()
    End Sub

    Private Sub Atualizar()
        Me.ASPxGridView1.DataBind()
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Replanejamento - Checar Partcipação"
    End Sub

End Class
