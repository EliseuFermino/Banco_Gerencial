
Partial Class MemberPages_Estoque_Ruptura_RupturaControladoriaComl
    Inherits System.Web.UI.Page


    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes
    Dim oDat As New clDataDb

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(334, User.Identity.Name)
            oFun.Grid_Title(grid, oDat.ExecuteStoredProcedure_Scalar("dbo.usp_BuscarRupturasUltimaAtualizacao", Conexao.gerPerdas))

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Pedidos Pendentes Comercial - PGR334"
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

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "Dias Atraso")
    End Sub
End Class