
Partial Class MemberPages_Inventario_Programa_CadastroColaborador
    Inherits System.Web.UI.Page

    Protected Sub btnSalvar_BotaoClick(sender As Object, e As EventArgs) Handles btnSalvar.BotaoClick
        Dim oVem As New VendaEmpresaMes
        clData_gerInv.usp2("Programa.uspSalvarColaboradores", "@matricula", "@nome", Me.txtMatricula.Text, Me.txtNome.Text)
        oVem.UserMsgBox(Me, "O colaborador foi salvo com sucesso!!!")
        Me.txtMatricula.Text = ""
        Me.txtNome.Text = ""
        Me.txtMatricula.Focus()
    End Sub

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Me.btnSalvar.btnSalvar_Text = "Salvar"
        End If
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        CType(Master.Master.FindControl("lblTitle"), Label).Text = "Cadastro de Colaborador"
    End Sub
End Class
