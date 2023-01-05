Imports DevExpress.Web

Partial Class MemberPages_Vendas_Perfil
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(164, User.Identity.Name)
            Me.cboAno.AnoInicial = 2010
            Me.cboAno.AnoFinal = Year(DateAndTime.Now())
            Me.cboAno.CallAno = Year(DateAndTime.Now())
            Me.cboMes.AutoPostBack = False
            Me.cboSize.CallSize = 100

            oFun.Grid_Column_BorderLeft(grid1, "numCheckOut", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid1, "NFPDV", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid1, "numCaixaEletro", Drawing.Color.Gray, BorderStyle.Dashed, 1)
            oFun.Grid_Column_BorderRight(grid1, "VendaPDVsemEletro", Drawing.Color.Gray, BorderStyle.Solid, 1)

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Perfil - PGR164"
        End If

    End Sub

    Private Sub Atualizar()
        Session("sANO") = Me.cboAno.CallAno
        Session("sMES") = cboMes.CallMes
        Me.grid1.DataBind()
    End Sub

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback
        Call Atualizar()
    End Sub

    Protected Sub grid1_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles grid1.CustomUnboundColumnData
        On Error Resume Next

        oFun.Grid_Calculate(e, "difQL", "numFunc_TotalSemAprendiz", "QL", Funcoes.CalculateType.Decrease)
    End Sub

    Protected Sub grid1_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid1.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "percMxR")
        oFun.Grid_RedIsNegative(e, "percCrescMA")
        oFun.Grid_RedIsNegative(e, "percCrescAA")
        oFun.Grid_RedIsNegative(e, "difQL")
    End Sub

    Protected Sub grid1_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles grid1.HtmlRowPrepared

        oFun.grid_RowSelectedWhole(grid1, e, "Descricao", "Empresa Total", Drawing.Color.Yellow, True)
        oFun.grid_RowSelectedWhole(grid1, e, "Descricao", "Total Lojas Super", Drawing.Color.GreenYellow, True)
        oFun.grid_RowSelectedWhole(grid1, e, "Descricao", "Total Lojas Hiper", Drawing.Color.GreenYellow, True)
        oFun.grid_RowSelectedWhole(grid1, e, "Descricao", "Total Lojas Super E", Drawing.Color.GreenYellow, True)
       
    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid1, cboSize.CallSize)
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            Call Atualizar()
        End If
    End Sub
End Class
