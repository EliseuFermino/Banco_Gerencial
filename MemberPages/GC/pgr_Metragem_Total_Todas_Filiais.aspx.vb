Imports DevExpress.Web

Partial Class MemberPages_pgr_Metragem_Total_Todas_Filiais
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(0, User.Identity.Name)

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Titulo - PGR000"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            mySession()

            Atualizar()
        End If
    End Sub

#End Region

    Private Sub mySession()
        Session("sCATEGORIA") = cboCategoria.SelectedItem.Value
    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As CallbackEventArgsBase) Handles cboPanel.Callback
        Session("sCATEGORIA") = cboCategoria.SelectedItem.Value

        Atualizar()
    End Sub

    Private Sub Atualizar()
        mySession()
        grid.DataBind()
    End Sub



End Class

