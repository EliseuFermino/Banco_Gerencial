
Partial Class MemberPages_Gerencial_ComparativoVendaGrupoTodas
    Inherits System.Web.UI.Page

    Protected Sub btnAtualizar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAtualizar.Click
        Dim oVem As New VendaEmpresaMes
        oVem.SLV_AtualizaComparativoVendaGrupo(Me.cboAno.CallAno, User.Identity.Name)
        Me.gridDados.DataBind()
        Call MudarLegenda()
    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        Me.ASPxGridViewExporter1.WriteXlsToResponse()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("sUSUARIO") = User.Identity.Name
    End Sub

    Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Comparativo de Vendas por Grupo Acumulado"

    End Sub

    Protected Sub gridDados_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridDados.HtmlDataCellPrepared
        If e.DataColumn.FieldName = "Cresc" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If
    End Sub

    Private Sub MudarLegenda()
        On Error Resume Next
        Me.gridDados.Columns("QtdeAA").Caption = "Qtde " & Me.cboAno.CallAno - 1
        Me.gridDados.Columns("VendaAA").Caption = "Venda " & Me.cboAno.CallAno - 1

        Me.gridDados.Columns("QtdeAT").Caption = "Qtde " & Me.cboAno.CallAno
        Me.gridDados.Columns("VendaAT").Caption = "Venda " & Me.cboAno.CallAno
    End Sub

End Class
