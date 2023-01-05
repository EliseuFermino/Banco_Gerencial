Imports DevExpress.Web.ASPxGauges.Base
Imports System.Data
Imports System.Data.SqlClient
Imports DevExpress.XtraCharts
Imports System.Drawing


Partial Class MemberPages_menuPrincipal_Depto2
    Inherits System.Web.UI.Page

    Dim nota As String
    Dim descFilial As String
    Dim Periodo As String
    Dim varDesc As String

    Dim oPro As New Projeto
    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(356, User.Identity.Name)

        End If
    End Sub




    Private Sub mySession()

        Session("sANO") = Year(DateAndTime.Today.AddDays(-1))
        Session("sMES") = Month(DateAndTime.Today.AddDays(-1))


    End Sub



    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        On Error Resume Next
        If Not IsPostBack Then

        End If
    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged


        graph_Secao11.DataBind()
        graph_Secao12.DataBind()
        graph_Secao13.DataBind()
        graph_Secao14.DataBind()
        graph_Secao15.DataBind()
        graph_Secao16.DataBind()
        graph_Secao17.DataBind()
        graph_Secao18.DataBind()
        graph_Secao19.DataBind()
        graph_Secao21.DataBind()
        graph_Secao22.DataBind()
        graph_Secao23.DataBind()

    End Sub

End Class
