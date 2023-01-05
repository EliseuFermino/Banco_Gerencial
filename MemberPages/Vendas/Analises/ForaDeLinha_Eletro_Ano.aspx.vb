
Imports DevExpress.Web

Partial Class MemberPages_Vendas_Analises_ForaDeLinha_Eletro_Ano
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVem As New VendaEmpresaMes

#Region " Page"


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVem.AtualizarEstatisticaPrograma(227, User.Identity.Name)
            oFun.Grid_Title(grid_Total, "Vendas Fora de Linha - Departamento 5 - Eletro")
            oFun.Grid_Title(grid_Secao50, "Vendas Fora de Linha - Seção 50 - Eletrodomésticos")
            oFun.Grid_Title(grid_Secao51, "Vendas Fora de Linha - Seção 51 - Eletroportateis")
            oFun.Grid_Title(grid_Secao52, "Vendas Fora de Linha - Seção 52 - Telefonia")
            oFun.Grid_Title(grid_Secao53, "Vendas Fora de Linha - Seção 53 - Informática")
            oFun.Grid_Title(grid_Secao54, "Vendas Fora de Linha - Seção 54 - Cine, Foto e Som")
            oFun.Grid_Title(grid_Secao55, "Vendas Fora de Linha - Seção 55 - Colchão e Box")

            Session("sANO") = 2014

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Vendas Fora de Linha por Ano - PGR227"
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

    Protected Sub grid_Secao54_HtmlDataCellPrepared(sender As Object, e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles grid_Secao54.HtmlDataCellPrepared
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

End Class
