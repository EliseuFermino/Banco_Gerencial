
Partial Class MemberPages_Estoque_EstoqueContabilTotal
    Inherits System.Web.UI.Page


    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(284, User.Identity.Name)

            Dim varAno As Int32
            varAno = Year(Now())

            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = varAno
            Me.cboAno.CallAno = varAno

            Me.cboAno.AutoPostBack = False
            Me.cboMes.AutoPostBack = False
            Me.cboFilial.AutoPostBack = False

            oFun.Grid_Decimals(grid, "VolumeEstoque", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_Decimals(grid, "TotalEstoque", Funcoes.CasaDecimais.Nenhuma)
            oFun.Grid_ColumnTitle(grid, "descDia", "Descrição")

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Estoque Contábil por Filial - PGR284"
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
        Session("sANO") = Me.cboAno.CallAno
        Session("sMES") = Me.cboMes.CallMes
        Session("sFILIAL") = Me.cboFilial.CallFilial
    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
    End Sub

    Private Sub Atualizar()
        mySession()
        oFun.Grid_Title(grid, "Estoque Contábil por Dia")
        Me.grid.DataBind()
    End Sub

 


End Class
