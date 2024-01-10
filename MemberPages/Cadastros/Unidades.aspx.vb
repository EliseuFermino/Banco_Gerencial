
Partial Class MemberPages_Planejamento_Perdas_AjustePercent
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            gridUnidades.SettingsDataSecurity.AllowEdit = True
            gridUnidades.SettingsDataSecurity.AllowInsert = True
            gridUnidades.SettingsDataSecurity.AllowDelete = True

            gridUnidades.DataBind()
        End If
    End Sub

End Class
