
Partial Class MemberPages_Clientes_Cli_TicMed_Cresc
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(290, User.Identity.Name)


        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Crescimento Clientes x Ticket Médio x Vendas - PGR290"
            If cboFilial.IsLoja = False Then
                cboFilial.CallCorporacao = 199

            End If

        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then

            Atualizar()

            Session("sDEPTO") = 1
            Session("sSECAO") = 1
            dsDados_Depto1.DataBind()
            dsDados_Secao.DataBind()

        End If
    End Sub

#End Region


    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
    End Sub

    Private Sub Atualizar()

        dsDados.DataBind()

    End Sub

    Protected Sub Graph_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles Graph.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY(Graph, sender, e)
    End Sub

    Protected Sub cbPanel_Depto_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel_Depto.Callback

        Session("sDEPTO") = cboDepto.Value
        dsDados_Depto1.DataBind()
    End Sub

    Protected Sub cbPanel_Secao_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel_Secao.Callback

        Session("sSECAO") = cboSecao.Value
        dsDados_Secao.DataBind()
    End Sub
End Class

