
Partial Class MemberPages_Quebras_Acompanhamento245Refeitorio
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(339, User.Identity.Name)

            Dim varAno As Int32
            varAno = Year(Now())

            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = varAno
            Me.cboAno.CallAno = varAno

            Me.cboAno.AutoPostBack = False
            Me.cboMes.AutoPostBack = False
            Me.cboFilial.AutoPostBack = False

            Call Titulo()

            oFun.Grid_Column_BorderRight(grid, "vlrMA", Drawing.Color.Gray, BorderStyle.Solid, 1)

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Acompanhamento Agenda 245 - Cozinha - PGR339"
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
        Me.graph_13meses.DataBind()
        Me.dsGraficoSecao.DataBind()
        Titulo()
    End Sub

    Private Sub Titulo()
        oFun.Grid_ColumnTitle(grid, "vlrAT", Left(cboMes.CallMesDesc, 3) & "/" & cboAno.CallAno)
        oFun.Grid_ColumnTitle(grid, "vlrAA", Left(cboMes.CallMesDesc, 3) & "/" & cboAno.CallAno - 1)

        If cboMes.CallMes = 1 Then
            oFun.Grid_ColumnTitle(grid, "vlrMA", "Dez/" & cboAno.CallAno - 1)
        Else
            oFun.Grid_ColumnTitle(grid, "vlrMA", cboMes.CallMes - 1 & "/" & cboAno.CallAno)
        End If

    End Sub


End Class
