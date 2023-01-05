
Partial Class MemberPages_Checklist_ConsultaInformatica
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(289, User.Identity.Name)
            cboPeriodo.Visible_btnAvanca = False
            cboPeriodo.Visible_btnVolta = False
            cboPeriodo.AutoPostBack = False

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Consulta Check List da informática - PGR289"
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
        Session("sDIA_INICIAL") = cboPeriodo.CallDia
        If cboFez.SelectedValue = 1 Then
            Session("sFEZ") = 1
        Else
            Session("sFEZ") = 2
        End If

    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
    End Sub

    Private Sub Atualizar()
        mySession()
        grid.DataBind()
    End Sub



End Class

