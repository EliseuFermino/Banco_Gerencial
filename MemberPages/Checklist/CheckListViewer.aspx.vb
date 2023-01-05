Imports System.Data.SqlClient
Imports System.Data

Partial Class MemberPages_Checklist_CheckListViewer
    Inherits System.Web.UI.Page


    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(340, User.Identity.Name)
            cboFilial.Visible_cboCorporacao = False

            cboDia.Visible_btnAvanca = False
            cboDia.Visible_btnVolta = False
            cboDia.Visible_lblDiaDaSemana = False
            cboDia.AutoPostBack = False
            cboDia.CallDia = DateAndTime.Today.AddDays(-1)

            mySession()
        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Checklist - Fotos por Dia - PGR340"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            mySession()
            grid.DataBind()
        End If
    End Sub

#End Region

    Private Sub mySession()
        Session("sDIA") = cboDia.CallDia
        Session("sFILIAL") = cboFilial.CallFilial

    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        mySession()
        grid.DataBind()
    End Sub




End Class

