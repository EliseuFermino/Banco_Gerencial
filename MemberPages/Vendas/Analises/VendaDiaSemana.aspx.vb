
Partial Class MemberPages_Vendas_Analises_VendaDiaSemana
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(130, User.Identity.Name)
            Me.cboAno.AnoInicial = 2009
            Me.cboAno.AnoFinal = Year(DateAndTime.Now)
            Me.cboAno.CallAno = Year(DateAndTime.Now)

            Me.cboAno.AutoPostBack = False
            Me.cboMes.AutoPostBack = False



        End If
    End Sub

    Private Sub Atualizar()
        Session("sNUM_DIA_SEMANA") = Me.cboSemana.CallSemana
        Session("sANO") = Me.cboAno.CallAno
        Session("sMES") = Me.cboMes.CallMes
        Session("sFILIAL") = Me.cboFilial.CallFilial
        Me.grid.DataBind()
        Me.grafDados.DataBind()
        Me.grafDados1.DataBind()
    End Sub

    Protected Sub myPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles myPanel.Callback
        Call Atualizar()
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Análise de Vendas, Margens e Número de Clientes por Dia da Semana - PGR130"
        End If

    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            If Me.cboFilial.IsLoja = False Then Me.cboFilial.CallFilial = 3
            Call Atualizar()
        End If
    End Sub
End Class
