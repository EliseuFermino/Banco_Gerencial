
Partial Class MemberPages_Vendas_RankingVendaGestor
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim varAno As Int16
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(299, User.Identity.Name)
            varAno = Year(Now())
            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = varAno
            Me.cboAno.CallAno = varAno
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Ranking por Gestor - Base Venda - Empresa, Hiper, Super, Super E - PGR299"
        End If

    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            Call Atualizar()
        End If
    End Sub

#End Region

    Private Sub mySession()
        Session("sANO") = Me.cboAno.CallAno
        Session("sMES_INICIAL") = Me.cboMesInicial.CallMes
        Session("sMES_FINAL") = Me.cboMesFinal.CallMes

    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
    End Sub

    Private Sub Atualizar()
        mySession()

        ASPxGridView1.DataBind()
        grid_Super.DataBind()
        grid_SuperE.DataBind()
        grid_Hiper.DataBind()

    End Sub


End Class
