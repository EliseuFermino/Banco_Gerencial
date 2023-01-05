
Partial Class MemberPages_Checklist_Manutencao_EliminarDiasCalculoChecklist
    Inherits System.Web.UI.Page

    Dim oData As New clDataDb
    Dim oVem As New VendaEmpresaMes

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            cboFilial.Visible_Empresa = False
            oVem.AtualizarEstatisticaPrograma(349, User.Identity.Name)

        End If

    End Sub


    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Manutenção de Datas da Pontuação do Checklist - PGR349"

        End If
    End Sub


    Protected Sub btn_Cadastrar_Dia_Click(sender As Object, e As EventArgs) Handles btn_Cadastrar_Dia.Click

        Dim myDia As Date = cboDia.Date

        oData.ExecuteStoredProcedure_Scalar("dbo.usp_Atualiza_Cadastro_Feriado", Conexao.gerCadastros_str, "@Dia", myDia)
        Beep()
        oVem.UserMsgBox(Me, "A Data foi incluida para todas as Filiais!!! Recalcule a Pontuação do Checklist")
        grid.DataBind()
    End Sub

    Protected Sub btn_Recalcular_Click(sender As Object, e As EventArgs) Handles btn_Recalcular.Click
        oData.ExecuteStoredProcedure_Scalar("dbo.usp_Recalcular_Pontuacao_Checklist", Conexao.gerCadastros_str)
        Beep()
        oVem.UserMsgBox(Me, "Pontuação do Checklist recalculada com Sucesso!!!")
    End Sub

    Protected Sub btn_Excluir_Click(sender As Object, e As EventArgs) Handles btn_Excluir.Click
        Dim myDia As Date = cboDia.Date

        oData.ExecuteStoredProcedure_Scalar("dbo.usp_Excluir_Data_Cadastro_Feriado", Conexao.gerCadastros_str, "@Dia", myDia)
        Beep()
        oVem.UserMsgBox(Me, "A Data foi Excluida!!! Recalcule a Pontuação do Checklist")
        grid.DataBind()

    End Sub

    Protected Sub cboDia_DateChanged(sender As Object, e As EventArgs) Handles cboDia.DateChanged
        Session("sDIA") = cboDia.Date

    End Sub


    Protected Sub btnExcluirFilial_Click(sender As Object, e As EventArgs) Handles btnExcluirFilial.Click
        oData.ExecuteStoredProcedure_Scalar("dbo.usp_DeleteFeriados", Conexao.gerCadastros_str, "Dia", cboDia.Date, "idFilial", CStr(cboFilial.CallFilial))
        grid.DataBind()
    End Sub
End Class
