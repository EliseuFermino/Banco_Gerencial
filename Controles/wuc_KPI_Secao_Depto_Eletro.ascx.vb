Imports System.Net
Imports System.Windows.Forms
Imports DevExpress.XtraCharts

Partial Class Controles_wuc_KPI_Secao_Depto_Eletro
    Inherits System.Web.UI.UserControl

    Dim oFun As New Funcoes

    Protected Sub graphCrescimentoVendas_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles graphCrescimentoVendas.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY(graphCrescimentoVendas, sender, e)
    End Sub



End Class
