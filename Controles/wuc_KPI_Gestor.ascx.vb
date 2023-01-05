Imports System.Net
Imports System.Windows.Forms
Imports DevExpress.XtraCharts


Partial Class Controles_wuc_KPI_Gestor
    Inherits System.Web.UI.UserControl

    Dim oFun As New Funcoes
    Dim oProjeto As New Projeto
    Dim oProd As New Produtos

    Protected Sub graphCrescimentoVendas_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles graphCrescimentoVendas.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY(graphCrescimentoVendas, sender, e)
    End Sub



    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        Dim userName As String = oProjeto.NameUserReturn
        Dim vDepartamento As String = LCase(Trim(oProjeto.BuscarDepartamentoDoUsuario(userName)))

        If vDepartamento = "gestor_assistente" Then
            Session("sCOMPRADOR") = oProd.BuscarIdGestor_Pelo_GestorAssistente(userName)
            Session("sUSUARIO") = oProd.BuscarIdGestor_Pelo_GestorAssistente(userName)
        End If

        lblDesc.Text = Session("sUSUARIO")

    End Sub
End Class
