
Partial Class MemberPages_Planejamento_Vendas_viewVendasCorrigidas_TodasLojas
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init

        If Not IsPostBack Then

            Dim varAno As Int32
            varAno = Year(Now())
            Me.cboAno.AnoInicial = 1997
            Me.cboAno.AnoFinal = varAno
            Me.cboAno.CallAno = varAno


            Me.cboMes.CallMes = Month(Now()) - 1

            Session("sMES") = Me.cboMes.CallMes
            Session("sANO") = Me.cboAno.CallAno
        End If

    End Sub


    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        'Deixa a cor em vermelho se o valor for negativo
        On Error Resume Next
        If e.Row.RowType = DataControlRowType.DataRow Then
            If CDbl(e.Row.Cells(7).Text) < 0 Then
                e.Row.Cells(7).ForeColor = Drawing.Color.Red 'Vermelho
            Else
                e.Row.Cells(7).ForeColor = Drawing.Color.Black 'Vermelho
            End If
        End If

    End Sub

    Protected Sub cboMes_ListMesChanged(sender As Object, e As EventArgs) Handles cboMes.ListMesChanged
        Session("sMES") = Me.cboMes.CallMes
    End Sub

    Protected Sub cboAno_ListAnoChanged(sender As Object, e As EventArgs) Handles cboAno.ListAnoChanged
        Session("sANO") = Me.cboAno.CallAno
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Vendas Corrigidas pelo IPCA (IBGE) - Todas as Lojas"

    End Sub
End Class
