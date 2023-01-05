
Partial Class MemberPages_Resultado_OperacaoComercial_PontaDeGondola_Trade
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(350, User.Identity.Name)

            Dim varAno As Int32
            varAno = Year(Now())

            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = varAno + 1
            Me.cboAno.CallAno = varAno + 1

            Me.cboAno.AutoPostBack = False

            cboFilial.AutoPostBack = False
        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Ponta de Gondola por Vencimento - Trade Marketing - PGR350"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            cboSize.CallSize = 100
            mySession()

            Atualizar()
        End If
    End Sub

#End Region

    Private Sub mySession()
        Session("sANO") = Me.cboAno.CallAno
        Session("sFILIAL") = cboFilial.CallFilial
    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
    End Sub

    Private Sub Atualizar()
        mySession()

        Me.grid.DataBind()
    End Sub

    Protected Sub Exportar_Click(sender As Object, e As EventArgs) Handles Exportar.Click
        ASPxPivotGridExporter1.ExportXlsToResponse("Trade Marketing")
    End Sub
End Class


