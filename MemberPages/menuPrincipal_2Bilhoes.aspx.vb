
Partial Class MemberPages_menuPrincipal_2Bilhoes
    Inherits System.Web.UI.Page



    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Informações Gerenciais"
    End Sub

    Protected Sub Timer1_Tick(sender As Object, e As EventArgs) Handles Timer1.Tick
        Me.ASPxDataView1.DataBind()

        'Me.lblAtualizacao.Text = DateAndTime.Now()


    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(158, User.Identity.Name)
            'Me.lblAtualizacao.Text = DateAndTime.Now()
            Me.lblAtualizacao.Text = "03/10/2013 14:37:30"
        End If
    End Sub
End Class
