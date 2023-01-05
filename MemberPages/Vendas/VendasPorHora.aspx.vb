Imports DevExpress.Web

Partial Class MemberPages_Vendas_VendasPorHora
    Inherits System.Web.UI.Page


    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        With GridView1
            .Columns(0).ItemStyle.Width = 90
            .Columns(1).ItemStyle.Width = 80
            .Columns(2).ItemStyle.Width = 40
            .Columns(3).ItemStyle.Width = 70
        End With

        'Calcula os Totais
        If e.Row.RowType = DataControlRowType.DataRow Then
            'Deixa a cor em vermelho se o valor for negativo
            Try
                If CDbl(e.Row.Cells(2).Text) < 0 Then e.Row.Cells(2).ForeColor = Drawing.Color.Red 'Vermelho
            Catch ex As Exception

            Finally

            End Try
        End If
    End Sub

    Sub AtualizarGrid_VendaHoraria()
        Session("sDIA") = Me.ASPxCalendario.CallDia
        Me.GridView1.DataBind()
    End Sub

    Protected Sub ASPxCalendario_DiaVaiClick(sender As Object, e As EventArgs) Handles ASPxCalendario.DiaVaiClick
        Call AtualizarGrid_VendaHoraria()
    End Sub

    Protected Sub ASPxCalendario_DiaVoltaClick(sender As Object, e As EventArgs) Handles ASPxCalendario.DiaVoltaClick
        Call AtualizarGrid_VendaHoraria()
    End Sub

    Protected Sub ASPxCalendario_ListDiaChanged(sender As Object, e As System.EventArgs) Handles ASPxCalendario.ListDiaChanged
        Call AtualizarGrid_VendaHoraria()
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes

            Dim time As DateTime = DateTime.Now
            Dim format As String = "HH:mm"

            If Not IsPostBack Then
                oVem.AtualizarEstatisticaPrograma(5, User.Identity.Name)
                If time < "09:15" Then
                    Me.lblText.Visible = True
                    Me.lblText.Text = time.ToString(format)
                Else
                    Me.lblText.Visible = False
                    Call AtualizarGrid_VendaHoraria()
                End If
            End If

        End If
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As System.EventArgs) Handles Me.PreRenderComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Venda por Hora"
    End Sub

End Class
