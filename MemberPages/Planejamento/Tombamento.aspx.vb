
Partial Class MemberPages_Planejamento_Tombamento
    Inherits System.Web.UI.Page

    Dim cOrcamento As New Orcamento
    Dim oVem As New VendaEmpresaMes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            oVem.AtualizarEstatisticaPrograma(172, Me.User.Identity.Name)
            Me.cboAno.Value = Year(DateAndTime.Now) + 1

            Me.chkHabilitarPrimeiroPasso.Checked = False
            Me.btnTombar_PrimeiroPasso.Enabled = False
        End If
    End Sub

#Region " Base Loja"

    Protected Sub chkHabilitarPrimeiroPasso_CheckedChanged(sender As Object, e As EventArgs) Handles chkHabilitarPrimeiroPasso.CheckedChanged
        If Me.chkHabilitarPrimeiroPasso.Checked = True Then
            Me.btnTombar_PrimeiroPasso.Enabled = True
        Else
            Me.btnTombar_PrimeiroPasso.Enabled = False
        End If
    End Sub

    Protected Sub btnTombar_PrimeiroPasso_Click(sender As Object, e As EventArgs) Handles btnTombar_PrimeiroPasso.Click
        cOrcamento.AtualizarStoredProcedure_Parameter_Ano("Tombamento.uspLoja_para_Definitivo_TodasContas", Me.cboAno.Value)
        oVem.UserMsgBox(Me, "Atualização completada com sucesso!!! - P1")
    End Sub

    Protected Sub chkP2_CheckedChanged(sender As Object, e As EventArgs) Handles chkP2.CheckedChanged
        If Me.chkP2.Checked = True Then
            Me.btnP2.Enabled = True
        Else
            Me.btnP2.Enabled = False
        End If
    End Sub

    Protected Sub btnP2_Click(sender As Object, e As EventArgs) Handles btnP2.Click
        cOrcamento.AtualizarStoredProcedure_Parameter_AnoCod("Tombamento.uspLoja_para_Definitivo_porUnicoGrupo_TodasLojas", Me.cboAno.Value, Me.cboGrupoP2.CallGrupo)
        oVem.UserMsgBox(Me, "Atualização completada com sucesso!!! - P2")
    End Sub

    Protected Sub chkP3_CheckedChanged(sender As Object, e As EventArgs) Handles chkP3.CheckedChanged
        If Me.chkP3.Checked = True Then
            Me.btnP3.Enabled = True
        Else
            Me.btnP3.Enabled = False
        End If
    End Sub


    Protected Sub btnP3_Click(sender As Object, e As EventArgs) Handles btnP3.Click
        cOrcamento.AtualizarStoredProcedure_Parameter_AnoCodFilial("Tombamento.uspLoja_para_Definitivo_porUnicoGrupo_UnicaLoja", Me.cboAno.Value, Me.cboGrupoP3.CallGrupo, Me.cboFilialP3.CallFilial)
        oVem.UserMsgBox(Me, "Atualização completada com sucesso!!! - P3")
    End Sub

#End Region

#Region " Base Administração"

    Protected Sub chkP5_CheckedChanged(sender As Object, e As EventArgs) Handles chkP5.CheckedChanged
        If Me.chkP5.Checked = True Then
            Me.btnP5.Enabled = True
        Else
            Me.btnP5.Enabled = False
        End If
    End Sub

    Protected Sub btnP5_Click(sender As Object, e As EventArgs) Handles btnP5.Click
        cOrcamento.AtualizarStoredProcedure_Parameter_AnoCod("Tombamento.uspAdm_para_Definitivo_porUnicoGrupo_TodasLojas", Me.cboAno.Value, Me.cboGrupoP5.CallGrupo)
        oVem.UserMsgBox(Me, "Atualização completada com sucesso!!! - P5")
    End Sub

    Protected Sub chkP6_CheckedChanged(sender As Object, e As EventArgs) Handles chkP6.CheckedChanged
        If Me.chkP6.Checked = True Then
            Me.btnP6.Enabled = True
        Else
            Me.btnP6.Enabled = False
        End If
    End Sub


    Protected Sub btnP6_Click(sender As Object, e As EventArgs) Handles btnP6.Click
        cOrcamento.AtualizarStoredProcedure_Parameter_AnoCodFilial("Tombamento.uspAdm_para_Definitivo_porUnicoGrupo_UnicaLoja", Me.cboAno.Value, Me.cboGrupoP6.CallGrupo, Me.cboFilialP6.CallFilial)
        oVem.UserMsgBox(Me, "Atualização completada com sucesso!!! - P6")
    End Sub


    Protected Sub chkP9_CheckedChanged(sender As Object, e As EventArgs) Handles chkP9.CheckedChanged
        If Me.chkP9.Checked = True Then
            Me.btnP9.Enabled = True
        Else
            Me.btnP9.Enabled = False
        End If
    End Sub


    Protected Sub btnP9_Click(sender As Object, e As EventArgs) Handles btnP9.Click
        cOrcamento.AtualizarStoredProcedure_Parameter_AnoCod("Tombamento.uspAdm_para_Definitivo_porUnicoSubgrupo_TodasLojas", Me.cboAno.Value, Me.cboGrupoP9.CallSubgrupo)
        oVem.UserMsgBox(Me, "Atualização completada com sucesso!!! - P9")
    End Sub

#End Region

#Region " Base Apoio"

    Protected Sub chkP7_CheckedChanged(sender As Object, e As EventArgs) Handles chkP7.CheckedChanged
        If Me.chkP7.Checked = True Then
            Me.btnP7.Enabled = True
        Else
            Me.btnP7.Enabled = False
        End If
    End Sub

    Protected Sub btnP7_Click(sender As Object, e As EventArgs) Handles btnP7.Click
        cOrcamento.AtualizarStoredProcedure_Parameter_AnoCod("Tombamento.uspApoio_para_Definitivo_porUnicoGrupo", Me.cboAno.Value, Me.cboGrupoP7.CallGrupo)
        oVem.UserMsgBox(Me, "Atualização completada com sucesso!!! - P7")
    End Sub

    Protected Sub chkP8_CheckedChanged(sender As Object, e As EventArgs) Handles chkP8.CheckedChanged
        If Me.chkP8.Checked = True Then
            Me.btnP8.Enabled = True
        Else
            Me.btnP8.Enabled = False
        End If
    End Sub

    Protected Sub btnP8_Click(sender As Object, e As EventArgs) Handles btnP8.Click
        cOrcamento.AtualizarStoredProcedure_Parameter_Ano("Tombamento.uspApoio_para_Definitivo_TodasContas", Me.cboAno.Value)
        oVem.UserMsgBox(Me, "Atualização completada com sucesso!!! - P8")
    End Sub

#End Region

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.FindControl("lblTitle"), Label).Text = "Orçamento - Tombamento - PGR172"
    End Sub

   
End Class
