
Partial Class MemberPages_Inventario_Programa_InsercaoLotes
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Me.rndNumerico.Checked = True
            Me.txtLoteInicial.Focus()
        End If
    End Sub

    Protected Sub rndSequencial_CheckedChanged(sender As Object, e As System.EventArgs) Handles rndSequencial.CheckedChanged
        If Me.rndSequencial.Checked = True Then Me.txtLoteFinal.Enabled = True
        Me.txtLoteInicial.Focus()
    End Sub

    Protected Sub rndNumerico_CheckedChanged(sender As Object, e As System.EventArgs) Handles rndNumerico.CheckedChanged
        If Me.rndNumerico.Checked = True Then Me.txtLoteFinal.Enabled = False
        Me.txtLoteInicial.Focus()
    End Sub

    Protected Sub txtLoteInicial_TextChanged(sender As Object, e As System.EventArgs) Handles txtLoteInicial.TextChanged

        Me.txtLoteFinal.Focus()
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As System.EventArgs) Handles Me.PreRenderComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Exclusão de Lotes"
    End Sub

   
End Class
