
Partial Class MemberPages_viewOri_MetaVendaEmpresaAno
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        If Not IsPostBack Then

            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(174, Me.User.Identity.Name)

            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = Year(Now()) + 1
            If Month(Now()) >= 10 Then
                Me.cboAno.CallAno = Year(Now()) + 1
            Else
                Me.cboAno.CallAno = Year(Now())
            End If

            Session("sANO") = Me.cboAno.CallAno
        End If

    End Sub

    Protected Sub cboAno_ListAnoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.ListAnoChanged
        Session("sANO") = Me.cboAno.CallAno
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Relatórios - Orçamento - Meta de Venda por Filial - Ano - PGR174"
    End Sub

    Protected Sub btnExcel_BotaoClick(sender As Object, e As EventArgs) Handles btnExcel.BotaoClick
        Me.btnExcel.CallGridViewID = "ASPxGridView1"
    End Sub
End Class
