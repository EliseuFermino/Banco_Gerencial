
Partial Class MemberPages_Vendas_Analises_CrescimentoVendasLojaPorLoja
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(238, User.Identity.Name)

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Mapa de Crescimento  - PGR238"
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
        Session("sDIA_INICIAL") = Me.cboDia.CallDiaInicial
        Session("sDIA_FINAL") = Me.cboDia.CallDiaFinal
        Session("sPERC") = txtCaixaPercentual.Text

        If chkMesmosDias.Checked = True Then Session("sMESMOS") = 2
        If chkMesmosDias.Checked = False Then Session("sMESMOS") = 1
    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
    End Sub

    Private Sub Atualizar()
        mySession()
        oFun.Grid_Title(grid, "Mapa de Crescimento - Filtro: menos de " & txtCaixaPercentual.Text & "%")
        Me.grid.DataBind()
    End Sub

    Protected Sub cboSize_SelectedIndexChanged_cboSize(sender As Object, e As EventArgs) Handles cboSize.SelectedIndexChanged_cboSize
        oFun.Grid_Size(grid, cboSize.CallSize)
    End Sub

    Protected Sub grid_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "3")
        oFun.Grid_RedIsNegative(e, "4")
        oFun.Grid_RedIsNegative(e, "5")
        oFun.Grid_RedIsNegative(e, "6")
        oFun.Grid_RedIsNegative(e, "7")
        oFun.Grid_RedIsNegative(e, "8")
        oFun.Grid_RedIsNegative(e, "9")

        oFun.Grid_RedIsNegative(e, "10")
        oFun.Grid_RedIsNegative(e, "11")
        oFun.Grid_RedIsNegative(e, "13")
        oFun.Grid_RedIsNegative(e, "14")
        oFun.Grid_RedIsNegative(e, "15")
        oFun.Grid_RedIsNegative(e, "17")
        oFun.Grid_RedIsNegative(e, "18")
        oFun.Grid_RedIsNegative(e, "19")

        oFun.Grid_RedIsNegative(e, "20")
        oFun.Grid_RedIsNegative(e, "21")
        oFun.Grid_RedIsNegative(e, "22")
        oFun.Grid_RedIsNegative(e, "23")
        oFun.Grid_RedIsNegative(e, "24")
        oFun.Grid_RedIsNegative(e, "25")
        oFun.Grid_RedIsNegative(e, "26")
        oFun.Grid_RedIsNegative(e, "27")
        oFun.Grid_RedIsNegative(e, "28")
        oFun.Grid_RedIsNegative(e, "29")

        oFun.Grid_RedIsNegative(e, "30")
        oFun.Grid_RedIsNegative(e, "31")
        oFun.Grid_RedIsNegative(e, "32")
        oFun.Grid_RedIsNegative(e, "33")
        oFun.Grid_RedIsNegative(e, "34")
        oFun.Grid_RedIsNegative(e, "36")
        oFun.Grid_RedIsNegative(e, "37")
        oFun.Grid_RedIsNegative(e, "38")
        oFun.Grid_RedIsNegative(e, "39")

        oFun.Grid_RedIsNegative(e, "40")
        oFun.Grid_RedIsNegative(e, "41")
        oFun.Grid_RedIsNegative(e, "42")
        oFun.Grid_RedIsNegative(e, "43")
        oFun.Grid_RedIsNegative(e, "44")
        oFun.Grid_RedIsNegative(e, "45")
        oFun.Grid_RedIsNegative(e, "46")
        oFun.Grid_RedIsNegative(e, "47")
        oFun.Grid_RedIsNegative(e, "48")
        oFun.Grid_RedIsNegative(e, "49")

        oFun.Grid_RedIsNegative(e, "50")
        oFun.Grid_RedIsNegative(e, "51")
        oFun.Grid_RedIsNegative(e, "52")
        oFun.Grid_RedIsNegative(e, "53")
        oFun.Grid_RedIsNegative(e, "54")
        oFun.Grid_RedIsNegative(e, "55")
        oFun.Grid_RedIsNegative(e, "56")
        oFun.Grid_RedIsNegative(e, "57")

    End Sub
End Class
