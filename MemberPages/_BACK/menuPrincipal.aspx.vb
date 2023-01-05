Imports DevExpress.Web.ASPxGauges.Base

Partial Class MemberPages_menuPrincipal_OLD
    Inherits System.Web.UI.Page
    Dim oPro As New Projeto
    Dim oFun As New Funcoes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = ""
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then

            If oPro.Isloja = True Then

                Session("sFILIAL") = CByte(Right(User.Identity.Name, 2))
                Graph.DataBind()
                Chart_TicketMedio.DataBind()
                divGerentes.Visible = True
            End If
            'Else
            '    divGerentes.Visible = False
            'End If

        End If


    End Sub


    Protected Sub Graph_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles Graph.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY(Graph, sender, e)
    End Sub


    Protected Sub Chart_TicketMedio_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles Chart_TicketMedio.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY(Chart_TicketMedio, sender, e)
    End Sub

End Class
