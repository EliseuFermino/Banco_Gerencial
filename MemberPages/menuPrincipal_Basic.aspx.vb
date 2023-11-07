Imports DevExpress.Web.ASPxGauges.Base
Imports System.Data
Imports System.Data.SqlClient
Imports DevExpress.XtraCharts
Imports System.Drawing
Imports System.Net



Partial Class MemberPages_menuPrincipal_Basic
    Inherits System.Web.UI.Page

    Dim nota As String
    Dim descFilial As String
    Dim Periodo As String
    Dim varDesc As String

    Dim oPro As New Projeto
    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes
    Dim oProjeto As New Projeto

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

        End If
    End Sub


End Class
