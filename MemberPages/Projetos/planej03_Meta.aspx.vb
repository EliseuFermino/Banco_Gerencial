Imports System.Data
Imports DevExpress.Web

Partial Class Ranking_planej03_Meta
    Inherits System.Web.UI.Page
    Private Shared isSiteMode_Renamed As Object
    Public Const ReadOnlyErrorMessage As String = "<b>Data modifications are not allowed in the online demo.</><br>" & "If you need to test data editing functionality, please instal the " & "ASPxGridView on your machine and run the demo locally."

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Dim oVem As New VendaEmpresaMes

        If Not IsPostBack() Then oVem.AtualizarEstatisticaPrograma(25, User.Identity.Name)

        Me.cboProjeto.Text = Session("idProjeto")
        Select Case LCase(Trim(User.Identity.Name))
            Case "eliseu", "eder", "aurea", "felipe", "vladimir", "sandra girardi"
                Me.cboProjeto.Enabled = True
            Case Else
                Me.cboProjeto.Enabled = False
        End Select

        'Define a Seção da Tela (Session 2)
        Session("idTela") = 2
    End Sub

    Protected Sub cboProjeto_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboProjeto.SelectedIndexChanged
        Session("idProjeto") = Me.cboProjeto.Value
    End Sub

    Protected Sub grid_FocusedRowChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles grid.FocusedRowChanged
        'Session("idEtapa") = Me.txtEtapaID.Value
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Projeto - Etapas"
    End Sub
End Class
