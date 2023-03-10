
Partial Class MemberPages_Manutencao_Atualizacoes
    Inherits System.Web.UI.Page

    Dim oVem As New VendaEmpresaMes

    Protected Sub btnReatuVenda_BotaoClick(sender As Object, e As EventArgs) Handles btnReatuVenda.BotaoClick
        clData_gerManager.uspAnoMesWithTimeOut("Manutencao.uspEXEC_ReatualizarVendaSLV_Dia", "@Ano", "@Mes", Me.cboAno.CallAno, Me.cboMes.CallMes, 2400)
        oVem.UserMsgBox(Me, "O teórico foi salvo com sucesso!!!")
    End Sub

    Protected Sub btnAtualizarTeorico_BotaoClick(sender As Object, e As EventArgs) Handles btnAtualizarTeorico.BotaoClick
        clData_gerManager.uspAnoMes("Manutencao.uspAtualizarTeorico", Me.cboAno.CallAno, Me.cboMes.CallMes, 2400)
        oVem.UserMsgBox(Me, "O teórico foi salvo com sucesso!!!")
    End Sub

    Protected Sub Page_Init(sender As Object, e As EventArgs) Handles Me.Init
        If Not IsPostBack Then
            Me.btnAtualizarTeorico.btnSalvar_Text = "Atualizar Teórico"
            Me.btnReatuVenda.btnSalvar_Text = "Reatualizar Vendas SLV por Dia"
        End If
    End Sub

#Region " Meta Dia Seção"
    Protected Sub btnAtualizarMetaDiaSecao_BotaoClick(sender As Object, e As EventArgs) Handles btnAtualizarMetaDiaSecao.BotaoClick
        clData_gerManager.uspAnoMes("uspAtualizaMetaVendaDiariaPorSecao", Me.cboAno.CallAno, Me.cboMes.CallMes, 2400)
        oVem.UserMsgBox(Me, "Atualização concluida com sucesso!!!")
    End Sub
#End Region

#Region " Meta Revista"
    Protected Sub btnAtualizaMetaRevista_BotaoClick(sender As Object, e As EventArgs) Handles btnAtualizaMetaRevista.BotaoClick
        clData_gerManager.uspAnoMes("Manutencao.AtualizarMetaRevista", Me.cboAno.CallAno, Me.cboMes.CallMes, 2400)
        oVem.UserMsgBox(Me, "Atualização concluida com sucesso!!!")
    End Sub
#End Region

#Region " Flash de Vendas"
    Protected Sub btnAtualizaFlash_BotaoClick(sender As Object, e As EventArgs) Handles btnAtualizaFlash.BotaoClick
        clData_gerManager.usp("Manutencao.uspAtualizaFLASH")
        oVem.UserMsgBox(Me, "Atualização concluida com sucesso!!!")
    End Sub
#End Region

#Region " Cadastro de Produtos"
    Protected Sub btnAtualizaCadastroProduto_BotaoClick(sender As Object, e As EventArgs) Handles btnAtualizaCadastroProduto.BotaoClick
        clData_gerManager.usp("Manutencao.uspImportarCadastroDeProdutos")
        oVem.UserMsgBox(Me, "Atualização concluida com sucesso!!!")
    End Sub
#End Region

#Region " Venda por Grupo"
    Protected Sub btnAtualizaVendasPorGrupo_BotaoClick(sender As Object, e As EventArgs) Handles btnAtualizaVendasPorGrupo.BotaoClick
        clData_gerManager.uspAnoMesWithTimeOut("SLV.uspAtualizarVendaPorGrupo", "@iAno", "@iMesInicial", "@iMesFinal", "@usuario", Me.cboAno.CallAno, Me.cboMesInicial.CallMes, Me.cboMesFinal.CallMes, User.Identity.Name, 2400)
        oVem.UserMsgBox(Me, "As vendas foram geradas com sucesso com sucesso!!!")
        Me.btnAtualizaVendasPorGrupo.btnSalvar_Text = "Venda por Grupo"
    End Sub
#End Region

#Region " Despesas"

    Protected Sub btnAtualizarDespesas_BotaoClick(sender As Object, e As EventArgs) Handles btnAtualizarDespesas.BotaoClick
        clData_gerManager.uspAnoMes("Despesas.ImportarDespesas", Me.cboAno.CallAno, Me.cboMes.CallMes, 2400)
        oVem.UserMsgBox(Me, "As Despesas foram importadas com sucesso!!!")
    End Sub

    Protected Sub btnAtualizarDespesasDoProgress_BotaoClick(sender As Object, e As EventArgs) Handles btnAtualizarDespesasDoProgress.BotaoClick
        clData_gerManager.uspAnoMes("Despesas.ImportarDespesasProgress", Me.cboAno.CallAno, Me.cboMes.CallMes, 2400)
        oVem.UserMsgBox(Me, "As Despesas do Progress foram importadas e atualizadas com sucesso!!!")
    End Sub

#End Region



End Class
