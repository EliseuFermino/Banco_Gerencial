
Partial Class MemberPages_Gerencial_numClientesEmpresaSemana
    Inherits System.Web.UI.Page

    Protected Sub cboAno_ListAnoChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboAno.ListAnoChanged
        Session("sANO") = Me.cboAno.CallAno
    End Sub

    Protected Sub cboSemana_ListSemanaChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles cboSemana.ListSemanaChanged
        Session("sSEMANA") = Me.cboSemana.CallSemana
    End Sub

    Protected Sub btnAtualizar_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAtualizar.Click
        Session("sANO") = Me.cboAno.CallAno
        Session("sSEMANA") = Me.cboSemana.CallSemana
        Me.gridNumCliente.DataBind()
    End Sub

    Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Nº de Clientes da Empresa por Semana e Dia"
    End Sub

    Protected Sub btnExportar_Click(ByVal sender As Object, ByVal e As System.Web.UI.ImageClickEventArgs) Handles btnExportar.Click
        Me.ASPxGridViewExporter1.WriteXlsToResponse()
    End Sub
End Class
