
Imports DevExpress.Web

Partial Class MemberPages_Tarefas_Check_Vendas
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
            CType(Master.FindControl("lblTitle"), Label).Text = "Check Diferença de Vendas"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            mySession()
            cboSize.CallSize = 100
            Atualizar()
        End If
    End Sub

#End Region

    Private Sub mySession()
        Session("sDIA_INICIAL") = cboPeriodo.CallDiaInicial
        Session("sDIA_FINAL") = cboPeriodo.CallDiaFinal

    End Sub

    Protected Sub cboPanel_Callback1(sender As Object, e As CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
        grid.DataBind()
    End Sub

    Private Sub Atualizar()
        mySession()
    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)

    End Sub


    Protected Sub grid_HtmlRowPrepared(sender As Object, e As ASPxGridViewTableRowEventArgs) Handles grid.HtmlRowPrepared
        oFun.grid_RowSelectedWhole(grid, e, "Filial", "Empresa", Drawing.Color.MistyRose, True)
    End Sub
End Class

