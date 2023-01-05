﻿
Partial Class MemberPages_Seguranca_DadosGenericos
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(0, User.Identity.Name)
            'cboFilial.Visible_cboCorporacao = False

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Estatistica por Idade e Tipo de Furtante - PGR348"
            'If cboFilial.IsLoja = False Then
            '    Me.cboFilial.CallFilial = 3
            'End If

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

        'Dim myHoje As Date
        'myHoje = DateAndTime.Today()

        'Session("sFILIAL") = Me.cboFilial.CallFilial

        'Session("sANO") = Year(myHoje)

        'Session("sMES") = Month(myHoje)

        'Session("sMESMOS_DIAS") = 0

        'Session("sPROJECAO") = 3


    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
    End Sub

    Private Sub Atualizar()
        mySession()
        dsDados.DataBind()

    End Sub


End Class

