
Partial Class MemberPages_Patrimonio_RelatorioPatrimonio
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(322, User.Identity.Name)

            Dim varAno As Int32
            varAno = Year(Now())

            Me.cboAno.AnoInicial = 2016
            Me.cboAno.AnoFinal = varAno
            Me.cboAno.CallAno = varAno

            Me.cboAno.AutoPostBack = False
            Me.cboMes.AutoPostBack = False

            cboFilial.AutoPostBack = False


        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then

            CType(Master.FindControl("lblTitle"), Label).Text = "Relatório dos Seguranças - PGR322"
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
        Session("sMES") = Me.cboMes.CallMes
        Session("sFILIAL") = Me.cboFilial.CallFilial
    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
    End Sub

    Private Sub Atualizar()
        mySession()
        Me.grid.DataBind()
    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)
    End Sub


    Protected Sub wucBotaoExcel_BotaoClick(sender As Object, e As EventArgs) Handles wucBotaoExcel.BotaoClick
        wucBotaoExcel.CallGridViewID = "grid"
    End Sub
End Class

