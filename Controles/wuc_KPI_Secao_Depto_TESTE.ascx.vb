Imports System.Net
Imports System.Windows.Forms
Imports DevExpress.XtraCharts

Partial Class Controles_wuc_KPI_Secao_Depto_TESTE
    Inherits System.Web.UI.UserControl

    Dim oFun As New Funcoes

    Protected Sub graphCrescimentoVendas_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles graphCrescimentoVendas.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY(graphCrescimentoVendas, sender, e)
    End Sub

    Private Sub btnMY_Click(sender As Object, e As EventArgs) Handles btnMY.Click
        'Label1.Text = Request.Form(hfWidth.UniqueID)

        ScriptManager.RegisterStartupScript(Page, Page.GetType(), "text", "SetName()", True)

        Call teste(Label1.Text)
        'If Label1.Text = "1920" Then graphCrescimentoVendas.Width = 1760
    End Sub

    Private Sub teste(ByVal myValor As String)
        If Label1.Text = myValor Then graphCrescimentoVendas.Width = 1760
    End Sub


    Private Sub Controles_wuc_KPI_Secao_Depto_Load(sender As Object, e As EventArgs) Handles Me.Load

        btnMY_Click(btnMY, EventArgs.Empty)

        ' Label1.Text = Request.Form(hfWidth.UniqueID)

        graphCrescimentoVendas.DataBind()

    End Sub

    Private Sub Controles_wuc_KPI_Secao_Depto_TESTE_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        'btnVai_Click(btnVai, EventArgs.Empty)
        'If hfWidth.Value = 1920 Then
        '    graphCrescimentoVendas.Width = 1760
        'End If
    End Sub

    'Private Sub graphCrescimentoVendas_CustomDrawSeriesPoint(sender As Object, e As CustomDrawSeriesPointEventArgs) Handles graphCrescimentoVendas.CustomDrawSeriesPoint
    '    If e.SeriesPoint.Values(0) < 0 Then

    '        e.SeriesDrawOptions.Color = Drawing.Color.Red
    '    End If
    'End Sub
End Class
