Imports DevExpress.Web

Partial Class MemberPages_ContasReceber_CondicaoEspecialTotalPorComprador
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(277, User.Identity.Name)

            Dim varAno As Int32

            Me.cboAno.AutoPostBack = False
            Me.cboMesInicial.AutoPostBack = False
            Me.cboMesFinal.AutoPostBack = False

            cboMesInicial.LabelDescMes = "Mês Inicial"
            cboMesFinal.LabelDescMes = "Mês Final"

            If Month(DateAndTime.Now()) = 1 Then
                varAno = Year(Now()) - 1
                cboMesInicial.CallMes = 12
                cboMesFinal.CallMes = 12
            Else
                varAno = Year(Now())
            End If

            Me.cboAno.AnoInicial = 2015
            Me.cboAno.AnoFinal = varAno + 1
            Me.cboAno.CallAno = varAno

            Titulo1()

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Rentabilidade do Fornecedor - PGR277"
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
        Session("sMES_INICIAL") = Me.cboMesInicial.CallMes
        Session("sMES_FINAL") = Me.cboMesFinal.CallMes

    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
    End Sub

    Private Sub Atualizar()
        mySession()
        Titulo1()

        grid.DataBind()
        grid1.DataBind()
        grid2.DataBind()
    End Sub


    Protected Sub grid_BeforePerformDataSelect(sender As Object, e As EventArgs)
        Session("sCOMPRADOR") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

    Private Sub Titulo1()

        If cboMesInicial.CallMes <> cboMesFinal.CallMes Then
            oFun.Grid_Title(grid1, "Histórico por Comprador - Período Acumulado")
            oFun.Grid_Title(grid, "por Comprador - Período Acumulado")
            oFun.Grid_Title(grid2, "por Condição Especial - Período Acumulado")
        Else
            oFun.Grid_Title(grid1, "Histórico por Comprador - Mês de " & cboMesInicial.CallMesDesc)
            oFun.Grid_Title(grid, "por Comprador - Mês de " & cboMesInicial.CallMesDesc)
            oFun.Grid_Title(grid2, "por Condição Especial - Mês de " & cboMesInicial.CallMesDesc)
        End If

    End Sub

End Class


