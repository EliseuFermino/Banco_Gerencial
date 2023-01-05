
Partial Class MemberPages_Manutencao_Diferencas_Vendas
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(391, User.Identity.Name)

            Dim varAno As Int32
            varAno = Year(Now())

            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = varAno
            Me.cboAno.CallAno = varAno

            Me.cboAno.AutoPostBack = False
            Me.cboMes.AutoPostBack = False

            oFun.Grid_Column_BorderRight(grid, "FilialDesc", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "difItem", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "v7_Dif_v4_v6", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "v11_Dif_v10_v6", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "v15_Dif_v14_v10", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "v19_Dif_v18_v14", Drawing.Color.Gray, BorderStyle.Solid, 2)
            oFun.Grid_Column_BorderRight(grid, "v23_Dif_v22_v18", Drawing.Color.Gray, BorderStyle.Solid, 2)

            oFun.Grid_Title(grid, "Verificar Diferenças de Vendas")
        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Checar Diferenças de Vendas - PGR391"
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
        If chkStatusAtualiza.Checked = True Then
            Session("sID_ATUALIZAR") = 1
        Else
            Session("sID_ATUALIZAR") = 0
        End If

    End Sub



    Private Sub Atualizar()
        mySession()

        Me.grid.DataBind()
    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)
    End Sub


    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback

        Atualizar()

    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "difItem")

        oFun.Grid_RedIsNegative(e, "v5_Dif_v1_v4")
        oFun.Grid_RedIsNegative(e, "v7_Dif_v4_v6")
        oFun.Grid_RedIsNegative(e, "v9_Dif_v4_v8")
        oFun.Grid_RedIsNegative(e, "v11_Dif_v10_v6")
        oFun.Grid_RedIsNegative(e, "v13_Dif_v12_v8")
        oFun.Grid_RedIsNegative(e, "v15_Dif_v14_v10")
        oFun.Grid_RedIsNegative(e, "v17_Dif_v16_v12")
        oFun.Grid_RedIsNegative(e, "v19_Dif_v18_v14")
        oFun.Grid_RedIsNegative(e, "v21_Dif_v20_v16")
        oFun.Grid_RedIsNegative(e, "v23_Dif_v22_v18")

    End Sub

    Protected Sub grid_HtmlFooterCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableFooterCellEventArgs) Handles grid.HtmlFooterCellPrepared
        oFun.Grid_RedIsNegativeFooter(sender, e)
    End Sub
End Class

