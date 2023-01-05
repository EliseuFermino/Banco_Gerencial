
Partial Class MemberPages_Gerencial_GraficoCrescimentoVendaQtde_Depto5
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(363, User.Identity.Name)
            cboSecao.AutoPostBack = True
            cboFilial.AutoPostBack = True

            mySession()

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Crescimento Qtde x Crescimento Vendas x Margem PDV x Participação - PGR363"
            If cboFilial.IsLoja = False Then
                Me.cboFilial.CallFilial = 3
            End If

        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then

            Atualizar()

        End If
    End Sub

#End Region

    Private Sub mySession()

        Session("sFILIAL") = cboFilial.CallFilial

        Session("sSECAO") = cboSecao.CallSecao

    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
    End Sub

    Private Sub Atualizar()
        mySession()
        Graph.DataBind()

    End Sub

    Protected Sub Graph_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles Graph.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY(Graph, sender, e)
    End Sub

    Protected Sub cboSecao_ListSecaoChanged(sender As Object, e As EventArgs) Handles cboSecao.ListSecaoChanged
        Atualizar()
    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        Atualizar()
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        Atualizar()
    End Sub

    Protected Sub Graph_CustomDrawSeriesPoint(sender As Object, e As DevExpress.XtraCharts.CustomDrawSeriesPointEventArgs) Handles Graph.CustomDrawSeriesPoint

        '' If the value is less than 1, hide the point's label.
        'If e.SeriesPoint(0) < 1 Then
        '    e.SeriesDrawOptions.Color = Drawing.Color.Red

        'End If

    End Sub
End Class

