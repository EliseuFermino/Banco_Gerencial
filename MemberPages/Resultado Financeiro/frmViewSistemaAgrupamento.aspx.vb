
Imports System.Data
Imports System.Data.SqlClient

Partial Class MemberPages_Resultado_Financeiro_frmViewSistemaDia
    Inherits System.Web.UI.Page

    Dim strConn As String = Conexao.gerContSQL1_str
    Private vlrDia As Double = 0

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        Dim oVem As New VendaEmpresaMes
        oVem.ListaDasFiliais(Me.cboFilial, "Filial", "Desc")
        Me.lblTipo.Text = 1
        Me.optEmpresa.Checked = True
        Me.cboFilial.Enabled = False
    End Sub

    Protected Sub gridAgrupamento_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gridAgrupamento.RowDataBound
        'Calcula os Totais
        If e.Row.RowType = DataControlRowType.DataRow Then
            vlrDia += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "vlr"))
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(2).Text = (vlrDia).ToString("n2")
        End If
    End Sub

   
    Protected Sub optLojas_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles optLojas.CheckedChanged
        Me.lblTipo.Text = 3
        Me.cboFilial.Enabled = True
    End Sub

    Protected Sub optApoio_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles optApoio.CheckedChanged
        Me.lblTipo.Text = 2
        Me.cboFilial.Enabled = False
    End Sub

    Protected Sub optEmpresa_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles optEmpresa.CheckedChanged
        Me.lblTipo.Text = 1
        Me.cboFilial.Enabled = False
    End Sub

End Class
