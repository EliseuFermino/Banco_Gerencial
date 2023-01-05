
Partial Class MemberPages_Estoque_Secao_porLoja
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(424, User.Identity.Name)
            cboPeriodo.Visible_MesmosDias = False
            cboPeriodo.Enabled_cboDiaFinal = False
            cboPeriodo.Visible_divDescPerioodo_a = False
            cboPeriodo.Visible_cboDiaFinal = False
            cboPeriodo.AutoPostBack_cboDiaInicial = False

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete

        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Estoque por Loja - Todas Seções - PGR424"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender

        If Not IsPostBack Then
            cboSize.CallSize = 100
        End If
    End Sub

#End Region


    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback

        Session("sDIA_INICIAL") = cboPeriodo.CallDiaInicial
        Session("sFILIAL") = cboFilial.CallFilial

        grid.Visible = True
        grid.DataBind()

        'lblInfo.Text = "Session(sPRODUTO) " & Session("sPRODUTO") & " <br> Session(sDIA_INICIAL) " & Session("sDIA_INICIAL") & " <br> Session(sDIA_FINAL) " & Session("sDIA_FINAL")

        'If Session("sDIA_FINAL") = DateAndTime.Today Then
        '    oFun.Grid_Column_Visible(grid, "Estoque_Qtde", True)
        '    oFun.Grid_ColumnTitle(grid, "Estoque_Qtde", "Estoque Qtde em <br> " & DateAndTime.Today.Date & " <br> as 06:00 horas")
        'Else
        '    oFun.Grid_Column_Visible(grid, "Estoque_Qtde", False)
        'End If



    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared

        oFun.Grid_RedIsNegative(e, "QtdeEstoque")
        oFun.Grid_RedIsNegative(e, "vlrEstoque")

    End Sub

    Protected Sub grid_HtmlRowPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableRowEventArgs) Handles grid.HtmlRowPrepared

        oFun.grid_RowSelectedWhole(grid, e, "descSecao", "Depto 1-Mercearia", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descSecao", "Depto 2-Pereciveis", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descSecao", "Depto 3-Bazar", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descSecao", "Depto 4-Textil", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descSecao", "Depto 5-Eletrodomésticos", Drawing.Color.LightGray, True)
        oFun.grid_RowSelectedWhole(grid, e, "descSecao", "Total Geral", Drawing.Color.LightGreen, True)

    End Sub

   

End Class

