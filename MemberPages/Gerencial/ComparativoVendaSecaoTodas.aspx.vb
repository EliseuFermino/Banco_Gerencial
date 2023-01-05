
Partial Class MemberPages_Gerencial_ComparativoVendaSecaoTodas
    Inherits System.Web.UI.Page

    Protected Sub btnAtualizar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAtualizar.Click
        Dim oVem As New VendaEmpresaMes

        oVem.DeleteaMesUsuario(User.Identity.Name)
        oVem.AtualizaMesUsuario(Me.chkMes1.TabIndex, User.Identity.Name)
        oVem.AtualizaMesUsuario(Me.chkMes2.TabIndex, User.Identity.Name)
        oVem.AtualizaMesUsuario(Me.chkMes7.TabIndex, User.Identity.Name)


        oVem.SLV_AtualizaComparativoVendaSecao(Me.cboAno.CallAno, User.Identity.Name)
        Me.gridDados.DataBind()
        Me.lblDesc.Text = oVem.varDesc
    End Sub

    Protected Sub ImageButton1_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles ImageButton1.Click
        Me.ASPxGridViewExporter1.WriteXlsToResponse()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("sUSUARIO") = User.Identity.Name
    End Sub

    Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Comparativo de Vendas por Seção Acumulado"

    End Sub

    Protected Sub gridDados_HtmlDataCellPrepared(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxGridViewTableDataCellEventArgs) Handles gridDados.HtmlDataCellPrepared
        If e.DataColumn.FieldName = "Cresc" Then
            If Convert.ToDouble(e.CellValue) < 0 Then
                e.Cell.ForeColor = System.Drawing.Color.Red
            End If
        End If
    End Sub


End Class
