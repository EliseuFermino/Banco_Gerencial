
Partial Class MemberPages_RPM_CadastroRPM
    Inherits System.Web.UI.Page

    Protected Sub cboPanel_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel.Callback

        Dim oData As New clDataDb


        oData.ExecuteStoredProcedure("usp_Dia_Insert", Conexao.gerRPM,
                                     "@descTarefa", txtDesc.Text,
                                     "@diaAte", cboDia.Date,
                                     "@idStatus", cboStatus.Value,
                                     "@duracao", txtDuracao.Text,
                                     "@idCategoria", cboCategoria.Value,
                                     "@solicitante", txtSolicitante.Text)

        lblError.Text = oData.varDesc
        Call LimparCapos()

    End Sub


    Private Sub LimparCapos()
        txtDesc.Text = ""
        txtDuracao.Text = ""
        cboStatus.Text = "Não iniciada"
        cboCategoria.Text = "Condor"
        txtSolicitante.Text = ""
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Cadastro de Tarefas"
        End If
    End Sub


End Class
