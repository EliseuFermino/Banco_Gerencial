Imports DevExpress.Web

Partial Class MemberPages_menuPrincipal_Comercial
    Inherits System.Web.UI.Page

    Dim oVen As New VendaEmpresaMes
    Dim oProd As New Produtos
    Dim oFun As New Funcoes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            oVen.AtualizarEstatisticaPrograma(362, User.Identity.Name)
            cboDate.Date = Today
            mySession()
        End If


    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        lblNomeComprador.Text = oProd.BuscarNomeComprador(CInt(Page.User.Identity.Name))
        lblComprador_GR1.Text = lblNomeComprador.Text
        lblComprador_GR2.Text = lblNomeComprador.Text
        lblComprador_GR3.Text = lblNomeComprador.Text
    End Sub

    Private Sub mySession()
        Session("sDIA") = cboDate.Date
        Session("sCOMPRADOR") = User.Identity.Name
    End Sub

    Protected Sub grid_Top30_Lucro_Negativo_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles grid_Top30_Lucro_Negativo.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "LucroComercial")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "vlrLucroFinal")
        oFun.Grid_RedIsNegative(e, "percMargemFinal")
    End Sub

    Protected Sub gridNegativo5_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs) Handles gridNegativo5.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "LucroComercial")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "vlrLucroFinal")
        oFun.Grid_RedIsNegative(e, "percMargemFinal")
    End Sub

    Protected Sub gridNegativo5_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles gridNegativo5.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "precoVenda", "Venda", "QtdVendas", Funcoes.CalculateType.Division)
    End Sub

    Protected Sub grid_Top30_Lucro_Negativo_CustomUnboundColumnData(sender As Object, e As ASPxGridViewColumnDataEventArgs) Handles grid_Top30_Lucro_Negativo.CustomUnboundColumnData
        oFun.Grid_Calculate(e, "precoVenda", "Venda", "QtdVendas", Funcoes.CalculateType.Division)
    End Sub

    Protected Sub cboPaneLucroItemNegativo_Callback(sender As Object, e As CallbackEventArgsBase) Handles cboPaneLucroItemNegativo.Callback
        Session("sDIA") = cboDate.Date
        grid_Top30_Lucro_Negativo.DataBind()
    End Sub
End Class
