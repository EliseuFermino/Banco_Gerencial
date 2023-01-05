
Partial Class MemberPages_Clientes_Clientes_Clube
    Inherits System.Web.UI.Page

    Dim oVen As New VendaEmpresaMes
    Dim oFun As New Funcoes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        oVen.AtualizarEstatisticaPrograma(0, User.Identity.Name)

        Session("sFILIAL") = cboFilial.CallFilial
        graf_Clientes_12_Meses.DataBind()
    End Sub

    Protected Sub graf_Clientes_12_Meses_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles graf_Clientes_12_Meses.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY(graf_Clientes_12_Meses, sender, e)
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Numero de Clientes e Crescimento de Clientes do CLUBE - PGR000"

        End If
    End Sub


End Class
