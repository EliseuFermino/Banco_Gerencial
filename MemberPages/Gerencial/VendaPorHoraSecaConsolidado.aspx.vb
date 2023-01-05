
Partial Class MemberPages_Gerencial_VendaPorHoraSecaConsolidado
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(252, User.Identity.Name)

            cboDia.CallDiaInicial = Today
            cboDia.CallDiaFinal = Today

            Me.cboFilial.AutoPostBack = False

            Me.cboSecao.CallSecao = 1



        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Venda por Hora e por Seção Consolidado - PGR252"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            mySession()

            Me.cboSecao.CallSecao = 1
            Atualizar()
        End If
    End Sub

#End Region

    Private Sub mySession()
        Session("sDIAINICIAL") = cboDia.CallDiaInicial
        Session("sDIAFINAL") = cboDia.CallDiaFinal
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Session("sSECAO") = Me.cboSecao.CallSecao
    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
    End Sub

    Private Sub Atualizar()
        mySession()
    End Sub

End Class

