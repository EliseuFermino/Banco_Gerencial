Imports DevExpress.Web

Partial Class MemberPages_Gerencial_Validade
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim oVem As New VendaEmpresaMes
            oVem.AtualizarEstatisticaPrograma(181, User.Identity.Name)
        End If
    End Sub


    Protected Sub cbPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback
        Session("sDIA_INICIAL") = Me.cboPeriodo.CallDiaInicial
        Session("sDIA_FINAL") = Me.cboPeriodo.CallDiaFinal
        Me.ASPxGridView1.DataBind()
        cbPanel.SettingsLoadingPanel.Delay = 0
    End Sub

    Protected Sub ASPxGridView2_BeforePerformDataSelect(sender As Object, e As EventArgs)
        Session("sFILIAL") = (TryCast(sender, ASPxGridView)).GetMasterRowKeyValue()
    End Sub

   
    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "De Olho na Validade - PGR181"
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            Me.ASPxGridView1.DataBind()
        End If
    End Sub
End Class
