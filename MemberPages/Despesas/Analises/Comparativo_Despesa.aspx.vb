
Partial Class MemberPages_Despesas_Analises_Comparativo_Despesa
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            cboFilial.AutoPostBack = True
            cboFilialOutra.AutoPostBack = True
            cboFilialOutra.Visible_cboCorporacao = False
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Analise de Despesas - PGR400"

        End If

    End Sub

    Protected Sub cboGrupo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboGrupo.SelectedIndexChanged
        grafico1.Visible = True
        chkSubgrupo.Enabled = True
        Atualizar()
    End Sub

    Protected Sub cboGrupo_ValueChanged(sender As Object, e As EventArgs) Handles cboGrupo.ValueChanged
        cboSubgrupo.SelectedIndex = 0
    End Sub

    Private Sub Atualizar()

        On Error Resume Next

        Session("sFILIAL") = cboFilial.CallFilial
        Session("sTIPO") = 1
        Session("sCONTA") = cboGrupo.Value
        Session("sMES") = cboMes.CallMes

        If rndValor.Checked = True Then Session("sVALOR_PERC") = 1
        If rndPerc.Checked = True Then Session("sVALOR_PERC") = 2

        grafico1.DataBind()

    End Sub


    Protected Sub rndPerc_CheckedChanged(sender As Object, e As EventArgs) Handles rndPerc.CheckedChanged
        Atualizar()
    End Sub

    Protected Sub rndValor_CheckedChanged(sender As Object, e As EventArgs) Handles rndValor.CheckedChanged
        Atualizar()
    End Sub


    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        Atualizar()
    End Sub



    Protected Sub cboMes_ListMesChanged(sender As Object, e As EventArgs) Handles cboMes.ListMesChanged
        Atualizar()
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            If cboGrupo.SelectedIndex = -1 Then
                cboGrupo.Text = "Selecione um Grupo"
            End If
        End If
    End Sub

    Protected Sub chkSubgrupo_CheckedChanged(sender As Object, e As EventArgs) Handles chkSubgrupo.CheckedChanged
        If chkSubgrupo.Checked = True Then
            cboSubgrupo.Visible = True
            cboSubgrupo.SelectedIndex = 0
        End If

        If chkSubgrupo.Checked = False Then
            cboSubgrupo.Visible = False
        End If

    End Sub

    Protected Sub cboComparativo_SelectedIndexChanged(sender As Object, e As EventArgs) Handles cboComparativo.SelectedIndexChanged
        If cboComparativo.Value = 2 Then
            cboFilialOutra.Visible = True
        Else
            cboFilialOutra.Visible = False
        End If
    End Sub
End Class
