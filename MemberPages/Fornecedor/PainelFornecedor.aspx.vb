
Partial Class MemberPages_Fornecedor_PainelFornecedor
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes

#Region " Page"

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            'oVen.AtualizarEstatisticaPrograma(0, User.Identity.Name)
            cboFornecedor.CNPJ_Principal_Checked = True

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Painel Fornecedor - PGR000"
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

        Session("sFORNECEDOR") = Me.cboFornecedor.CallFornecedor
        Session("sANO") = Year(DateAndTime.Now)
        Session("sCNPJ") = cboFornecedor.CNPJ_Principal_Checked

        'If chkBaseCNPJ.Checked = True Then
        '    Session("sCNPJ") = 1
        'Else
        '    Session("sCNPJ") = 0
        'End If

    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
    End Sub

    Private Sub Atualizar()
        mySession()
        grid_RankingCategoriaAno.DataBind()
    End Sub

    Protected Sub chart_Lucro_Fornecedor_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles chart_Lucro_Fornecedor.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY(chart_Lucro_Fornecedor, sender, e)
    End Sub

    Protected Sub chart_Crescimento_Venda_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles chart_Crescimento_Venda.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY(chart_Crescimento_Venda, sender, e)
    End Sub

    Protected Sub chart_MargemFrenteDeCaixa_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles chart_MargemFrenteDeCaixa.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY(chart_MargemFrenteDeCaixa, sender, e)
    End Sub

    Protected Sub chart_Crescimento_Volume_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles chart_Volume_Fornecedor.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY(chart_Volume_Fornecedor, sender, e)
    End Sub


    Protected Sub chart_Crescimento_Clientes_Fornecedor_CustomDrawAxisLabel(sender As Object, e As DevExpress.XtraCharts.CustomDrawAxisLabelEventArgs) Handles chart_Crescimento_Clientes_Fornecedor.CustomDrawAxisLabel
        oFun.Graph_InsertSignalPlus_AxisY(chart_Crescimento_Clientes_Fornecedor, sender, e)
    End Sub


End Class

