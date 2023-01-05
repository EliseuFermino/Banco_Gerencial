
Partial Class MemberPages_SLV_Item_AnaliseVendaUnicoItemDiaSemana
    Inherits System.Web.UI.Page


    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(293, User.Identity.Name)

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Análise por Dia da Semana - Últimos 12 Meses - PGR293"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            mySession()

        End If
    End Sub

#End Region

    Private Sub mySession()
        Session("sDIA") = DateAndTime.DateAdd(DateInterval.Day, -1, Now())
        Session("sPRODUTO") = cboProduto.CallProduto
        Session("sDIA_SEMANA") = cboSemana.CallSemana

    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        If Not IsNothing(cboProduto.CallProduto) Then
            Atualizar()
        End If

    End Sub

    Private Sub Atualizar()
        mySession()
        If graph.Visible = False Then graph.Visible = True
    End Sub


End Class
