
Partial Class MemberPages_Vendas_Analises_GraficoDepto
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(320, User.Identity.Name)

            Me.cboFilial.AutoPostBack = False


        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Gráfico de Crescimento por Departamento / Seção  - PGR320"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            mySession()

            Atualizar()
        End If
    End Sub

#End Region

    Private Sub mySession()
        Session("sDIA_INICIAL") = cboDia.CallDiaInicial
        Session("sDIA_FINAL") = cboDia.CallDiaFinal
        Session("sFILIAL") = Me.cboFilial.CallFilial
    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
    End Sub

    Private Sub Atualizar()
        mySession()
    End Sub

    Protected Sub gridDepto_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles gridDepto.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY(gridDepto, sender, e)

    End Sub



    Protected Sub gDepto1_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles gDepto1.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY(gDepto1, sender, e)

    End Sub

    Protected Sub gDepto2_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles gDepto2.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY(gDepto2, sender, e)

    End Sub

    Protected Sub gDepto3_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles gDepto3.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY(gDepto3, sender, e)

    End Sub

    Protected Sub gDepto4_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles gDepto4.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY(gDepto4, sender, e)

    End Sub

    Protected Sub gDepto5_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles gDepto5.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY(gDepto5, sender, e)
    End Sub
End Class

