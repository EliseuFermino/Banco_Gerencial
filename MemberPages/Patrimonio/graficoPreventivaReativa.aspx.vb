
Partial Class MemberPages_Patrimonio_graficoPreventivaReativa
    Inherits System.Web.UI.Page

    Dim oFun As New Funcoes
    Dim oVen As New VendaEmpresaMes
    Dim oCl As New clDataDb

    '#Region " Page"


    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

        If Not IsPostBack Then

            oVen.AtualizarEstatisticaPrograma(325, User.Identity.Name)
            cboFilial.Visible_cboCorporacao = True

        End If

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As System.EventArgs) Handles Me.LoadComplete

        If Not IsPostBack Then
            CType(Master.FindControl("lblTitle"), Label).Text = "Análise Patrimonio - PGR325"
            If cboFilial.IsLoja = False Then
                Me.cboFilial.CallFilial = 3
                cboFilial.Visible_cboCorporacao = True
            Else
                graph_ValorRecuperado.Visible = False
                graph_FurtoDegustao_porLoja.Visible = False
                graph_FurtoDegustao_Deposito.Visible = False
                graph_Total_Furto_Degustacao_Total.Visible = False
                graph_Total_Furto_Degustacao_daEMPRESA.Visible = False
                graph_Total_Furto_Degustacao_daEMPRESA_13_Mes.Visible = False
                lblTotalRecuperadoEmpresa.Visible = False
            End If

            cboPeriodo.CallAno = Year(DateAndTime.Now)
            cboPeriodo.CallMes = Month(DateAndTime.Now) - 1
            cboPeriodo.Visible_btnAtualizar = False

            cboPeriodoEmpresa.CallAno = Year(DateAndTime.Now)
            cboPeriodoEmpresa.CallMes = Month(DateAndTime.Now) - 1
            cboPeriodoEmpresa.Visible_btnAtualizar = False

            cboPeriodo_ValorRecuperado.CallAno = cboPeriodo.CallAno
            cboPeriodo_ValorRecuperado.CallMes = cboPeriodo.CallMes
            cboPeriodo_ValorRecuperado.Visible_btnAtualizar = False

            cboPeriodo_FurtoDegustacao.CallAno = cboPeriodo.CallAno
            cboPeriodo_FurtoDegustacao.CallMes = cboPeriodo.CallMes
            cboPeriodo_FurtoDegustacao.Visible_btnAtualizar = False

            cboFilial.Visible_cboCorporacao = False
            cboFilial_ValorRecuperado.Visible_cboCorporacao = False
            cboFilial_FurtoDegustacao.Visible_cboCorporacao = False


        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender

        If Not IsPostBack Then

            mySession()
            Atualizar()
            lblTotalRecuperadoEmpresa.Text = "Total Recuperado na Empresa = " & CDec(oCl.ExecuteStoredProcedure_Scalar("Patrimonio.usp_TotalValorRecuperado_Empresa", Conexao.gerProjetos_str, "Ano", cboPeriodo_ValorRecuperado.CallAno, "Mes", cboPeriodo_ValorRecuperado.CallMes)).ToString("C2")

        End If
    End Sub

    '#End Region

    Private Sub mySession()

        Session("sFILIAL") = cboFilial.CallFilial

        Session("sANO") = cboPeriodo.CallAno

        Session("sMES") = cboPeriodo.CallMes

        Session("sDIA_INICIAL") = cboDia_Produto.CallDiaInicial
        Session("sDIA_FINAL") = cboDia_Produto.CallDiaFinal

    End Sub


    Private Sub Atualizar()

        mySession()
        dsDados.DataBind()
        grid_Produto_AreaVenda.DataBind()
        grid_Produto_Deposito.DataBind()

    End Sub


    Protected Sub cbpPanel_Produto_Furto_Degustacao_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbpPanel_Produto_Furto_Degustacao.Callback

        Session("sDIA_INICIAL") = cboDia_Produto.CallDiaInicial
        Session("sDIA_FINAL") = cboDia_Produto.CallDiaFinal
        grid_Produto_AreaVenda.DataBind()
        grid_Produto_Deposito.DataBind()
    End Sub

    Protected Sub cbPanel_Empresa_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel_Empresa.Callback

        Session("sANO") = cboPeriodoEmpresa.CallAno
        Session("sMES") = cboPeriodoEmpresa.CallMes

        graph_ValorRecuperado_Empresa_Periodo.DataBind()
        graph_Total_Furto_Degustacao_daEMPRESA.DataBind()
        graph_Total_Furto_Degustacao_daEMPRESA_13_Mes.DataBind()
    End Sub

    Protected Sub cbPanel_NaturezaAbordagem_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbPanel_NaturezaAbordagem.Callback

        Session("sFILIAL") = cboFilial.CallFilial
        Session("sANO") = cboPeriodo.CallAno
        Session("sMES") = cboPeriodo.CallMes

        Graph.DataBind()
        graph_12meses.DataBind()
    End Sub

    Protected Sub cbpPanel_ValorRecuperado_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbpPanel_ValorRecuperado.Callback

        Session("sFILIAL") = cboFilial_ValorRecuperado.CallFilial
        Session("sANO") = cboPeriodo_ValorRecuperado.CallAno
        Session("sMES") = cboPeriodo_ValorRecuperado.CallMes

        graph_ValorRecuperado.DataBind()
        graph_ValorRecuperado_porFilial.DataBind()

        lblTotalRecuperadoEmpresa.Text = "Total Recuperado na Empresa = " & CDec(oCl.ExecuteStoredProcedure_Scalar("Patrimonio.usp_TotalValorRecuperado_Empresa", Conexao.gerProjetos_str, "Ano", cboPeriodo_ValorRecuperado.CallAno, "Mes", cboPeriodo_ValorRecuperado.CallMes)).ToString("C2")

    End Sub

    Protected Sub cbpPanel_FurtoDegustacao_Callback(sender As Object, e As DevExpress.Web.CallbackEventArgsBase) Handles cbpPanel_FurtoDegustacao.Callback

        Session("sFILIAL") = cboFilial_FurtoDegustacao.CallFilial
        Session("sANO") = cboPeriodo_FurtoDegustacao.CallAno
        Session("sMES") = cboPeriodo_FurtoDegustacao.CallMes

        graph_FurtoDegustao_porLoja.DataBind()
        graph_FurtoDegustao_Deposito.DataBind()
        graph_Total_Furto_Degustacao_Total.DataBind()
        graph_Total_Furto_Degustacao_daLOJA.DataBind()
        graph_Total_Furto_Degustacao_daLOJA_13_Mes.DataBind()

    End Sub



End Class

