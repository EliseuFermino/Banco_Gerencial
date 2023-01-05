
Partial Class MemberPages_Inventario_Programa_Baixas
    Inherits System.Web.UI.Page

    Protected Sub Page_Init(sender As Object, e As System.EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Me.rndSequencial.Checked = True
            Me.txtLoteInicial.Focus()
        End If
    End Sub

    Protected Sub rndSequencial_CheckedChanged(sender As Object, e As System.EventArgs) Handles rndSequencial.CheckedChanged
        If Me.rndSequencial.Checked = True Then
            Me.txtLoteFinal.Visible = True
            Me.lblAO.Visible = True
            Me.reqValLoteFinal.Visible = True
        End If

        Me.txtLoteInicial.Focus()
    End Sub

    Protected Sub rndNumerico_CheckedChanged(sender As Object, e As System.EventArgs) Handles rndNumerico.CheckedChanged
        If Me.rndNumerico.Checked = True Then
            Me.txtLoteFinal.Visible = False
            Me.lblAO.Visible = False
            Me.reqValLoteFinal.Visible = False
        End If
        Me.txtLoteInicial.Focus()
    End Sub

    Protected Sub txtLoteInicial_TextChanged(sender As Object, e As System.EventArgs) Handles txtLoteInicial.TextChanged

        Me.txtLoteFinal.Focus()
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As System.EventArgs) Handles Me.PreRenderComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Baixa de Lotes"
    End Sub

    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs) Handles btnSalvar.Click
        Dim oVem As New VendaEmpresaMes
        If Me.rndNumerico.Checked = True Then Me.txtLoteFinal.Text = Me.txtLoteInicial.Text

        If CDbl(Me.txtLoteFinal.Text) < CDbl(Me.txtLoteInicial.Text) Then
            oVem.UserMsgBox(Me, "O nº do Lote Final é menor que o nº do Lote Inicial.")
            Me.txtLoteInicial.Focus()
            Exit Sub
        End If

        clData_gerInv.usp3("Programa.uspBaixarLote", "@numInv", "@loteInicial", "@loteFinal", 8, Me.txtLoteInicial.Text, Me.txtLoteFinal.Text)
        oVem.UserMsgBox(Me, "Lotes baixados com sucesso!!!")
        Me.txtLoteInicial.Text = ""
        Me.txtLoteFinal.Text = ""
        Me.txtLoteInicial.Focus()
    End Sub

End Class
