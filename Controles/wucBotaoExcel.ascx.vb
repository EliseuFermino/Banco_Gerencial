
Imports Microsoft.VisualBasic
Imports System
Imports DevExpress.XtraExport
Imports DevExpress.XtraPrinting

Partial Class Controles_wucBotaoAtualizar
    Inherits System.Web.UI.UserControl

    Public Event BotaoClick(ByVal sender As Object, ByVal e As EventArgs)
    Public Event ExporterRenderBrick(ByVal sender As Object, ByVal e As EventArgs)

    Protected Sub ASPxButton1_Click(sender As Object, e As EventArgs) Handles btnExcel.Click
        On Error Resume Next
        RaiseEvent BotaoClick(sender, e)
        Me.ASPxGridViewExporter1.WriteXlsToResponse()

    End Sub

    Public Property CallGridViewID() As String
        Get
            Return ASPxGridViewExporter1.GridViewID
        End Get
        Set(ByVal value As String)
            ASPxGridViewExporter1.GridViewID = value
        End Set
    End Property

    Public Property ClientInstanceName() As String
        Get
            Return btnExcel.ClientInstanceName
        End Get
        Set(ByVal value As String)
            btnExcel.ClientInstanceName = value
        End Set
    End Property

    Public Property GuiaNome() As String
        Get
            Return ASPxGridViewExporter1.FileName
        End Get
        Set(ByVal value As String)
            ASPxGridViewExporter1.FileName = value
        End Set
    End Property

    Public Property Enabled() As Boolean
        Get
            Return btnExcel.Enabled
        End Get
        Set(ByVal value As Boolean)
            btnExcel.Enabled = value
        End Set
    End Property

    Public Property Visibled() As Boolean
        Get
            Return btnExcel.Visible
        End Get
        Set(ByVal value As Boolean)
            btnExcel.Visible = value
        End Set
    End Property


    Protected Sub ASPxGridViewExporter1_RenderBrick(sender As Object, e As DevExpress.Web.ASPxGridViewExportRenderingEventArgs) Handles ASPxGridViewExporter1.RenderBrick
        RaiseEvent ExporterRenderBrick(sender, e)
    End Sub
End Class
