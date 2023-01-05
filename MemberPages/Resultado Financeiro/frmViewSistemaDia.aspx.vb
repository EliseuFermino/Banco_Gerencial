
Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_Resultado_Financeiro_frmViewSistemaDia
    Inherits System.Web.UI.Page

    Dim strConn As String = Conexao.gerContSQL1_str
    Private vlrDia As Double = 0

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Dim oVem As New VendaEmpresaMes
        oVem.ListaDasFiliais(Me.cboFilial, "Filial", "Desc")

    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound

        'Calcula os Totais
        If e.Row.RowType = DataControlRowType.DataRow Then
            vlrDia += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "vlr"))
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(1).Text = (vlrDia).ToString("n2")
        End If
    End Sub

End Class
