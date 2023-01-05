
Partial Class Ranking_mpPlanejamento
    Inherits System.Web.UI.MasterPage

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        Session("sFILIAL") = cboFilial.CallFilial
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Session("sFILIAL") = cboFilial.CallFilial
            cboFilial.Visible_cboCorporacao = False
        End If

    End Sub
End Class

