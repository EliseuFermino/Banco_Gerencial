
Partial Class MemberPages_CentroCusto_Cadastro_ConsultaAlteraCentroDeCusto
    Inherits System.Web.UI.Page

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Consulta / Altera Centro de Custo - PGR243"
        End If
    End Sub

End Class
