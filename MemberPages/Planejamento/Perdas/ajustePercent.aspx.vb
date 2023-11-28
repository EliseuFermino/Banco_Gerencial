
Partial Class MemberPages_Planejamento_Perdas_AjustePercent
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            carregaSelects()

            Session("sAno") = selAno.SelectedValue
            Session("sTipo") = selTipo.SelectedValue

            gridPerc.SettingsDataSecurity.AllowEdit = True
            gridPerc.DataBind()
        End If
    End Sub

    Private Sub carregaSelects()

        selAno.Items.Clear()
        selAno.Items.Insert(0, New ListItem(Now.Year().ToString(), Now.Year().ToString()))
        selAno.Items.Insert(1, New ListItem(Now.Year() - 1.ToString(), Now.Year() - 1.ToString()))
        selAno.Items.Insert(2, New ListItem(Now.Year() - 2.ToString(), Now.Year() - 2.ToString()))
        selAno.Items.Insert(3, New ListItem(Now.Year() - 3.ToString(), Now.Year() - 3.ToString()))
        selAno.Items.Insert(4, New ListItem(Now.Year() - 4.ToString(), Now.Year() - 4.ToString()))
        selAno.SelectedIndex = 0

    End Sub

    Protected Sub selTipo_SelectedIndexChanged(sender As Object, e As EventArgs)

        Session("sANO") = selAno.SelectedValue
        Session("sTIPO") = selTipo.SelectedValue
        gridPerc.DataBind()
    End Sub
End Class
