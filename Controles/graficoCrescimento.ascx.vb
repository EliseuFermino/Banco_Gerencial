
Partial Class Controles_graficoCrescimento
    Inherits System.Web.UI.UserControl

    Dim oFun As New Funcoes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Me.cboFilial.AutoPostBack = False



        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            If Me.cboFilial.IsLoja = True Then
                Session("sFILIAL") = Me.cboFilial.CallFilial
            Else
                Me.cboFilial.CallFilial = 3
                Session("sFILIAL") = 3
            End If
            Me.cboSecao.CallSecao = 1
            Session("sSECAO") = 1
            Me.grfSecao.DataBind()
        End If
    End Sub

    Protected Sub cbPanelSecao_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanelSecao.Callback
        Session("sSECAO") = Me.cboSecao.CallSecao
        Me.grfSecao.DataBind()
    End Sub

    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback

        Session("sFILIAL") = Me.cboFilial.CallFilial

    End Sub

    Protected Sub graficoCrescimento_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles graficoCrescimento.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY(graficoCrescimento, sender, e)
    End Sub



    Protected Sub grfDepto1_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles grfDepto1.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY(grfDepto1, sender, e)
    End Sub

    Protected Sub grfDepto2_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles grfDepto2.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY(grfDepto2, sender, e)
    End Sub

    Protected Sub grfDepto3_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles grfDepto3.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY(grfDepto3, sender, e)
    End Sub

    Protected Sub grfDepto4_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles grfDepto4.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY(grfDepto4, sender, e)
    End Sub

    Protected Sub grfDepto5_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles grfDepto5.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY(grfDepto5, sender, e)
    End Sub

    Protected Sub grfSecao_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles grfSecao.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY(grfSecao, sender, e)
    End Sub

    Protected Sub cboPanelCrescimentoSecao_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanelCrescimentoSecao.Callback
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Session("sSECAO") = Me.cboSecao36Meses.CallSecao
        Session("sTIPO") = Me.cboTipo.Value
    End Sub
End Class
