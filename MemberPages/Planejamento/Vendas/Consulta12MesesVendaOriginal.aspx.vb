
Partial Class MemberPages_Consulta12Meses
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(41, User.Identity.Name)
            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = Year(Now()) + 1
            Me.cboAno.CallAno = Year(Now()) + 1
            Session("sAno") = Me.cboAno.CallAno

            Me.ASPxGridView1.Caption = "Meta Original das Vendas do Ano de " & Me.cboAno.CallAno & "."
        End If
    End Sub

    Private Sub AtualizarTitulo()
        Me.ASPxGridView1.Caption = "Meta Original das Vendas do Ano de " & Me.cboAno.CallAno & "."
    End Sub

    Protected Sub cboAno_ListAnoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.ListAnoChanged
        Session("sAno") = Me.cboAno.CallAno
        Call AtualizarTitulo()
    End Sub

    Protected Sub btnExcel_BotaoClick(sender As Object, e As EventArgs) Handles btnExcel.BotaoClick
        Me.btnExcel.CallGridViewID = "ASPxGridView1"
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Relatórios - Orçamento - Meta de Venda por Filial - 12 meses - PGR41"
        End If

    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            Me.cboSize.CallSize = 100
        End If
    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        Dim oFun As New Funcoes
        oFun.Grid_Size(ASPxGridView1, cboSize.CallSize)
    End Sub
End Class
