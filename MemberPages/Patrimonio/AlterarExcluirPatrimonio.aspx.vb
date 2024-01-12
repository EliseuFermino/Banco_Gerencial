Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_Patrimonio_CadPatrimonio
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            cboFilial.AutoPostBack = True
            oVem.AtualizarEstatisticaPrograma(243, User.Identity.Name)
            Session("sFILIAL") = 3
            gridPatrimonio.DataBind()
        End If
    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        Session("sFILIAL") = cboFilial.CallFilial
        gridPatrimonio.DataBind()
    End Sub

    Protected Sub btnAtualizar_Click(sender As Object, e As EventArgs) Handles btnAtualizar.Click
        Session("sFILIAL") = cboFilial.CallFilial
        gridPatrimonio.DataBind()
    End Sub
End Class

