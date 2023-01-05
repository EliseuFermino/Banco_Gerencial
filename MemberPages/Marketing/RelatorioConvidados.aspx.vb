Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_Marketing_RelatorioConvidados
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes
    Dim oFun As New Funcoes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Dim oVem As New VendaEmpresaMes

            cboAno.AnoInicial = 2014
            cboAno.AnoFinal = Year(DateAndTime.Now)
            cboAno.CallAno = Year(DateAndTime.Now)
            Session("sANO") = Year(DateAndTime.Now)

            oVem.AtualizarEstatisticaPrograma(245, User.Identity.Name)
            dsLista.DataBind()
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Relatório Geral de Convidados - PGR245"
            cboTipo.Text = 1

        End If
    End Sub

#End Region

    Protected Sub cboTipo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboTipo.SelectedIndexChanged
        oFun.Grid_Title(grid, "Lista de Convidados - " & cboTipo.Text)
        dsLista.DataBind()
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            oFun.Grid_Title(grid, "Lista de Convidados - " & cboTipo.Text)
        End If

    End Sub

    Protected Sub cboAno_ListAnoChanged(sender As Object, e As EventArgs) Handles cboAno.ListAnoChanged
        Session("sANO") = cboAno.CallAno
        dsLista.DataBind()
    End Sub
End Class
