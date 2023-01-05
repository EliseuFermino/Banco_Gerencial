
Partial Class MemberPages_Vendas_ParticipacaoVendaGestor
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim varAno As Int32
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(167, User.Identity.Name)
            varAno = Year(Now())
            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = varAno
            Me.cboAno.CallAno = varAno
            Session("sANO") = varAno

            Me.cboFilial.AutoPostBack = False
            cboMes.AutoPostBack = False
            cboMes.AutoPostBack_MesFinal = False
            cboAno.AutoPostBack = False

        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Participação de Vendas por Gestor e Loja"
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then

            Call Atualizar()
        End If
    End Sub

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cboPanel.Callback
        Atualizar()
        'lblError.Text = "Session sMES " & Session("sMES") & " Session SMES_FINAL " & Session("sMES_FINAL") & " Session SFilial " & Session("sFILIAL") & " Session sANO " & Session("sANO")
    End Sub

    Private Sub Atualizar()
        Session("sANO") = cboAno.CallAno
        Me.ASPxGridView1.DataBind()
    End Sub


End Class
