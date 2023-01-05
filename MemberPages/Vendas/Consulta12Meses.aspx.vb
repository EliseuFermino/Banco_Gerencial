
Partial Class MemberPages_Consulta12Meses
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(166, User.Identity.Name)
            Me.cboAno.AnoInicial = 1996
            Me.cboAno.AnoFinal = Year(Now())
            Me.cboAno.CallAno = Year(Now())
            Session("sAno") = Me.cboAno.CallAno

            Me.ASPxGridView1.Caption = "Meta Original das Vendas do Ano de " & Me.cboAno.CallAno & "."
        End If
    End Sub

    Private Sub AtualizarTitulo()
        Me.ASPxGridView1.Caption = "BDT - Realizado das Vendas do Ano de " & Me.cboAno.CallAno & "."
    End Sub

    

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Consulta - Realizado de Venda por Filial - 12 meses"
    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Session("sAno") = Me.cboAno.CallAno
        ASPxGridView1.DataBind()
    End Sub
End Class
