
Partial Class MemberPages_Vendas_Reports_BomDiaEconomia
    Inherits System.Web.UI.Page



    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then
            Dim oFun As New Funcoes
            grid.DataBind()
            oFun.Grid_Title(grid, "Vendas do Programa Bom-Dia")
        End If

    End Sub
End Class
