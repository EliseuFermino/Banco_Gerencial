
Imports System.Data

Partial Class MemberPages_Inventario_Programa_CadastroEquipe
    Inherits System.Web.UI.Page

    Protected Sub btnSalvar_BotaoClick(sender As Object, e As EventArgs) Handles btnSalvar.BotaoClick
        Dim oVem As New VendaEmpresaMes
        clData_gerInv.usp3("Programa.uspSalvarEquipe", "@codEquipe", "@idNivel", "@idSetor", Me.txtNumEquipe.Text, 1, 1)

        If Me.cboMembro1.Value <> 0 Then clData_gerInv.usp3("Programa.uspSalvarMembros", "@idMatricula", "@CodEquipe", "@numInv", Me.cboMembro1.Value, Me.txtNumEquipe.Text, 8)
        If Me.cboMembro2.Value <> 0 Then clData_gerInv.usp3("Programa.uspSalvarMembros", "@idMatricula", "@CodEquipe", "@numInv", Me.cboMembro2.Value, Me.txtNumEquipe.Text, 8)
        If Me.cboMembro3.Value <> 0 Then clData_gerInv.usp3("Programa.uspSalvarMembros", "@idMatricula", "@CodEquipe", "@numInv", Me.cboMembro3.Value, Me.txtNumEquipe.Text, 8)
        oVem.UserMsgBox(Me, "A equipe foi salva com sucesso!!!")
        Me.GridView1.DataBind()
        Me.ASPxGridView1.DataBind()
        Call Limpar()
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Me.btnSalvar.btnSalvar_Text = "Salvar"
            Call Limpar()
        End If
    End Sub

    Private Sub Limpar()
        Me.txtNumEquipe.Text = ""
        Me.cboMembro1.Value = ""
        Me.cboMembro2.Value = ""
        Me.cboMembro3.Value = ""
        Me.cboSetor.Value = ""
        Me.txtNumEquipe.Focus()
    End Sub


    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Cadastro de Equipe"
    End Sub
End Class
