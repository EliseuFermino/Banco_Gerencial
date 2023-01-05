
Partial Class MemberPages_Gerencial_AnaliseCrescimento
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
            Me.cboFilial.CallFilial = 3
            Atualizar()
        End If
    End Sub

#End Region

    Private Sub mySession()

        Session("sFILIAL") = Me.cboFilial.CallFilial
        Session("sSECAO") = Me.cboSecao.CallSecao
        Session("sTIPO") = Me.cboTipo.Value
    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
    End Sub

    Private Sub Atualizar()
        mySession()
    End Sub



End Class

