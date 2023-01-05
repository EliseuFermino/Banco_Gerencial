Imports DevExpress.Web.ASPxGauges.Base
Imports System.Data
Imports System.Data.SqlClient
Imports DevExpress.XtraCharts
Imports System.Drawing
Imports System.Net



Partial Class MemberPages_menuPrincipal_Depto1
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

            Dim varFilial As Byte
            Dim Cookie As HttpCookie = Request.Cookies("Lojas")

            If Not Cookie Is Nothing Then
                varFilial = Cookie("numLoja")
            End If

            oVen.AtualizarEstatisticaPrograma(355, User.Identity.Name)


        End If
    End Sub




    Private Sub mySession()

        Session("sANO") = Year(DateAndTime.Today.AddDays(-1))
        Session("sMES") = Month(DateAndTime.Today.AddDays(-1))


    End Sub



    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        On Error Resume Next
        If Not IsPostBack Then

            Dim varFilial As Byte
            Dim Cookie As HttpCookie = Request.Cookies("Lojas")

        End If
    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged



        graph_Secao1.DataBind()
        graph_Secao2.DataBind()
        graph_Secao3.DataBind()
        graph_Secao4.DataBind()
        graph_Secao5.DataBind()
        graph_Secao6.DataBind()
        graph_Secao7.DataBind()
        graph_Secao8.DataBind()
       
    End Sub

 

End Class
