
Partial Class MemberPages_Planejamento_Vendas_viewVendaCorrigidasAno
    Inherits System.Web.UI.Page

    Private Venda01 As Double = 0
    Private Venda02 As Double = 0
    Private Venda03 As Double = 0
    Private Venda04 As Double = 0

    Protected Sub GridView2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView2.SelectedIndexChanged
        On Error Resume Next
        Me.lblAno.Text = GridView2.SelectedRow.Cells(1).Text
    End Sub

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Me.cboFilial.cboFilial_AutoPostBack = True
            Session("sFILIAL") = Me.cboFilial.CallFilial
            Me.lblAno.Text = 2012
        End If
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        On Error Resume Next
        'Calcula os Totais
        If e.Row.RowType = DataControlRowType.DataRow Then
            Venda01 += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "venda_Nominal"))
            Venda02 += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "venda_Real"))
            Venda03 += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "valor_Correção"))
            Venda04 += Convert.ToDouble(DataBinder.Eval(e.Row.DataItem, "venda_Corrigida"))

        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            e.Row.Cells(2).Text = Venda01.ToString("n0")
            e.Row.Cells(4).Text = Venda02.ToString("n0")
            e.Row.Cells(6).Text = Venda03.ToString("n0")
            e.Row.Cells(7).Text = Venda04.ToString("n0")
        End If
    End Sub


    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        Session("sFILIAL") = Me.cboFilial.CallFilial
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Vendas Corrigidas pelo IPCA (IBGE) - Ano e 12 meses"
    End Sub
End Class
