
Imports DevExpress.Web

Partial Class MemberPages_Vendas_Analises_ForaDeLinha_Eletro
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVem As New VendaEmpresaMes

#Region " Page"


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVem.AtualizarEstatisticaPrograma(222, User.Identity.Name)
            oFun.Grid_Title(grid_Total, "Vendas Fora de Linha - Departamento 5 - Eletro")
            oFun.Grid_Title(grid_Secao50, "Vendas Fora de Linha - Seção 50 - Eletrodomésticos")
            oFun.Grid_Title(grid_Secao51, "Vendas Fora de Linha - Seção 51 - Eletroportateis")
            oFun.Grid_Title(grid_Secao52, "Vendas Fora de Linha - Seção 52 - Telefonia")
            oFun.Grid_Title(grid_Secao53, "Vendas Fora de Linha - Seção 53 - Informática")
            oFun.Grid_Title(grid_Secao54, "Vendas Fora de Linha - Seção 54 - Cine, Foto e Som")
            oFun.Grid_Title(grid_Secao55, "Vendas Fora de Linha - Seção 55 - Colchão e Box")

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Vendas Fora de Linha por Semana - PGR222"
        End If
    End Sub

#End Region

#Region " Grids"

    Protected Sub grid_Secao50_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid_Secao50.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "vlrLucroComercial")
        oFun.Grid_RedIsNegative(e, "vlrLucroComercialFL")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "percMargemFL")
    End Sub

    Protected Sub grid_Secao51_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid_Secao51.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "vlrLucroComercial")
        oFun.Grid_RedIsNegative(e, "vlrLucroComercialFL")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "percMargemFL")
    End Sub

    Protected Sub grid_Secao52_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid_Secao52.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "vlrLucroComercial")
        oFun.Grid_RedIsNegative(e, "vlrLucroComercialFL")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "percMargemFL")
    End Sub

    Protected Sub grid_Secao53_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid_Secao53.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "vlrLucroComercial")
        oFun.Grid_RedIsNegative(e, "vlrLucroComercialFL")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "percMargemFL")
    End Sub

    Protected Sub grid_Secao54_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid_Secao55.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "vlrLucroComercial")
        oFun.Grid_RedIsNegative(e, "vlrLucroComercialFL")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "percMargemFL")
    End Sub

    Protected Sub grid_Secao55_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid_Secao55.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "vlrLucroComercial")
        oFun.Grid_RedIsNegative(e, "vlrLucroComercialFL")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "percMargemFL")
    End Sub

    Protected Sub grid_Total_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid_Total.HtmlDataCellPrepared
        oFun.Grid_RedIsNegative(e, "vlrLucroComercial")
        oFun.Grid_RedIsNegative(e, "vlrLucroComercialFL")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "percMargemFL")
    End Sub


#End Region

#Region "BeforePerformDataSelect"

    Protected Sub detail_Secao50_BeforePerformDataSelect(sender As Object, e As EventArgs)
        Session("sSEMANA") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

    Protected Sub detail_Secao51_BeforePerformDataSelect(sender As Object, e As EventArgs)
        Session("sSEMANA") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

    Protected Sub detail_Secao52_BeforePerformDataSelect(sender As Object, e As EventArgs)
        Session("sSEMANA") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

    Protected Sub detail_Secao53_BeforePerformDataSelect(sender As Object, e As EventArgs)
        Session("sSEMANA") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

    Protected Sub detail_Secao54_BeforePerformDataSelect(sender As Object, e As EventArgs)
        Session("sSEMANA") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

    Protected Sub detail_Secao55_BeforePerformDataSelect(sender As Object, e As EventArgs)
        Session("sSEMANA") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

#End Region

#Region " Detail Grid"

    Protected Sub detail_Secao50_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs)
        oFun.Grid_RedIsNegative(e, "vlrLucroComercial")
        oFun.Grid_RedIsNegative(e, "vlrLucroComercialFL")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "percMargemFL")
    End Sub

    Protected Sub detail_Secao51_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs)
        oFun.Grid_RedIsNegative(e, "vlrLucroComercial")
        oFun.Grid_RedIsNegative(e, "vlrLucroComercialFL")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "percMargemFL")
    End Sub

    Protected Sub detail_Secao52_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs)
        oFun.Grid_RedIsNegative(e, "vlrLucroComercial")
        oFun.Grid_RedIsNegative(e, "vlrLucroComercialFL")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "percMargemFL")
    End Sub

    Protected Sub detail_Secao53_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs)
        oFun.Grid_RedIsNegative(e, "vlrLucroComercial")
        oFun.Grid_RedIsNegative(e, "vlrLucroComercialFL")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "percMargemFL")
    End Sub

    Protected Sub detail_Secao54_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs)
        oFun.Grid_RedIsNegative(e, "vlrLucroComercial")
        oFun.Grid_RedIsNegative(e, "vlrLucroComercialFL")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "percMargemFL")
    End Sub

    Protected Sub detail_Secao55_HtmlDataCellPrepared(sender As Object, e As ASPxGridViewTableDataCellEventArgs)
        oFun.Grid_RedIsNegative(e, "vlrLucroComercial")
        oFun.Grid_RedIsNegative(e, "vlrLucroComercialFL")
        oFun.Grid_RedIsNegative(e, "percMargem")
        oFun.Grid_RedIsNegative(e, "percMargemFL")
    End Sub

#End Region



End Class
