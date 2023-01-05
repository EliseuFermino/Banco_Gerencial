
#Region " Imports"

Imports System.Data
Imports System.Data.SqlClient
Imports System.Math

#End Region

Partial Class MemberPages_Replanejamento_frmAP0154
    Inherits System.Web.UI.Page

#Region " Variables"

    Private connManager As String = clData_gerManager.dbConnect   '"Data Source=CONTROLADORIA1\SQLCONTRO;Initial Catalog=gerManager;Persist Security Info=True;User ID=sa;Password=rd700@1"
    Private connMetas As String = Conexao.gerMetas

    Dim vlr, perc, varVendaRevista As Double
    Dim iFilial As String

    Dim oVem As New VendaEmpresaMes


#End Region

#Region " Buscar Dados"

    Sub AtualizarRevista()
        'Venda Bruta 
        oRev.BuscaRevGrupoMes(1, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        varVendaRevista = oRev.vlrRev
        Me.txtRev_Venda.Text = oRev.vlrRev

        'Impostos 
        oRev.BuscaRevGrupoMes(2, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_Impostos.Text = oRev.vlrRev
        Me.txtRev_ImpostosP.Text = oRev.percRev

        'Margem teórica
        oRev.BuscaRevGrupoMes(5, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_MargemTeórica.Text = oRev.vlrRev
        Me.txtRev_MargemTeóricaP.Text = oRev.percRev

        'Quebra total
        oRev.BuscaRevGrupoMes(6, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_QuebraTotal.Text = Abs(CDbl(oRev.vlrRev)).ToString("n0")
        Me.txtRev_QuebraTotalP.Text = Abs(CDbl(oRev.percRev))

        'Bonificação
        oRev.BuscaRevGrupoMes(8, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_Bonificacao.Text = oRev.vlrRev
        Me.txtRev_BonificacaoP.Text = oRev.percRev

        'Bonificação - CD
        oRev.BuscaRevGrupoMes(51, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_BonificacaoCD.Text = oRev.vlrRev
        Me.txtRev_BonificacaoCDP.Text = oRev.percRev

        'Contratos
        oRev.BuscaRevGrupoMes(9, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_Contratos.Text = oRev.vlrRev
        Me.txtRev_ContratosP.Text = oRev.percRev

        'Condição Especial
        oRev.BuscaRevGrupoMes(10, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_CondicaoEspecial.Text = oRev.vlrRev
        Me.txtRev_CondicaoEspecialP.Text = oRev.percRev

        'Condição Especial - CD
        oRev.BuscaRevGrupoMes(52, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_CondicaoEspecialCD.Text = oRev.vlrRev
        Me.txtRev_CondicaoEspecialCDP.Text = oRev.percRev

        'Ponta de Gondola
        oRev.BuscaRevGrupoMes(50, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_PontaDeGondola.Text = oRev.vlrRev
        Me.txtRev_PontaDeGondolaP.Text = oRev.percRev

        'Marketing
        oRev.BuscaRevGrupoMes(55, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_Marketing.Text = oRev.vlrRev
        Me.txtRev_MarketingP.Text = oRev.percRev

        'Sell-in / Sell-out
        oRev.BuscaRevGrupoMes(80, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_Sell.Text = oRev.vlrRev
        Me.txtRev_SellP.Text = oRev.percRev

        '*************  DESPESAS  ***********************************************************

        'Pessoal
        oRev.BuscaRevGrupoMes(15, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_Pessoal.Text = oRev.vlrRev
        Me.txtRev_PessoalP.Text = oRev.percRev

        'honorários profissionais
        oRev.BuscaRevGrupoMes(16, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_Honorarios.Text = oRev.vlrRev
        Me.txtRev_HonorariosP.Text = oRev.percRev

        'Informática
        oRev.BuscaRevGrupoMes(17, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_Informatica.Text = oRev.vlrRev
        Me.txtRev_InformaticaP.Text = oRev.percRev

        'Manutenção
        oRev.BuscaRevGrupoMes(18, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_Manutencao.Text = oRev.vlrRev
        Me.txtRev_ManutencaoP.Text = oRev.percRev

        'Frota
        oRev.BuscaRevGrupoMes(19, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_Frota.Text = oRev.vlrRev
        Me.txtRev_FrotaP.Text = oRev.percRev

        '(-) Recuperação de Contratos de Logistica
        oRev.BuscaRevGrupoMes(20, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_RecContrLogistica.Text = oRev.vlrRev
        Me.txtRev_RecContrLogisticaP.Text = oRev.percRev

        'Embalagens - Uso e Consumo
        oRev.BuscaRevGrupoMes(21, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_EmbUsoConsumo.Text = oRev.vlrRev
        Me.txtRev_EmbUsoConsumoP.Text = oRev.percRev

        'Embalagens - Produtos
        oRev.BuscaRevGrupoMes(22, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_EmbProdutos.Text = oRev.vlrRev
        Me.txtRev_EmbProdutosP.Text = oRev.percRev

        'Uso e Consumo
        oRev.BuscaRevGrupoMes(23, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_UsoConsumo.Text = oRev.vlrRev
        Me.txtRev_UsoConsumoP.Text = oRev.percRev

        'Propaganda
        oRev.BuscaRevGrupoMes(24, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_Propaganda.Text = oRev.vlrRev
        Me.txtRev_PropagandaP.Text = oRev.percRev

        '(-) Verbas Promocionais
        oRev.BuscaRevGrupoMes(25, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_VerbasPromocionais.Text = oRev.vlrRev
        Me.txtRev_VerbasPromocionaisP.Text = oRev.percRev

        'Propaganda Gasto pelas Lojas
        oRev.BuscaRevGrupoMes(26, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_PropGastoLojas.Text = oRev.vlrRev
        Me.txtRev_PropGastoLojasP.Text = oRev.percRev

        'Serviços Publicos
        oRev.BuscaRevGrupoMes(27, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_ServicoPublicos.Text = oRev.vlrRev
        Me.txtRev_ServicoPublicosP.Text = oRev.percRev

        'Aluguél
        oRev.BuscaRevGrupoMes(28, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_Aluguel.Text = oRev.vlrRev
        Me.txtRev_AluguelP.Text = oRev.percRev

        'Segurança
        oRev.BuscaRevGrupoMes(29, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_Seguranca.Text = oRev.vlrRev
        Me.txtRev_SegurancaP.Text = oRev.percRev

        'Tributos e Multas
        oRev.BuscaRevGrupoMes(30, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_Tributos.Text = oRev.vlrRev
        Me.txtRev_TributosP.Text = oRev.percRev

        'Inadimplentes
        oRev.BuscaRevGrupoMes(31, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_Inadimplentes.Text = oRev.vlrRev
        Me.txtRev_InadimplentesP.Text = oRev.percRev

        'Despesas Bancárias
        oRev.BuscaRevGrupoMes(32, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_DespBancarias.Text = oRev.vlrRev
        Me.txtRev_DespBancariasP.Text = oRev.percRev

        'Comissões s/ movimentação financeira
        oRev.BuscaRevGrupoMes(33, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_Comissoes.Text = oRev.vlrRev
        Me.txtRev_ComissoesP.Text = oRev.percRev

        'Diversas
        oRev.BuscaRevGrupoMes(34, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_Diversas.Text = oRev.vlrRev
        Me.txtRev_DiversasP.Text = oRev.percRev

        'Viagens e Transportes de Funcionários
        oRev.BuscaRevGrupoMes(73, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_Viagens.Text = oRev.vlrRev
        Me.txtRev_ViagensP.Text = oRev.percRev

        'Despesas Judiciais e Acordos
        oRev.BuscaRevGrupoMes(74, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_DespJudiciais.Text = oRev.vlrRev
        Me.txtRev_DespJudiciaisP.Text = oRev.percRev

        'Leasing
        oRev.BuscaRevGrupoMes(35, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_Leasing.Text = oRev.vlrRev
        Me.txtRev_LeasingP.Text = oRev.percRev

        'Depreciação
        oRev.BuscaRevGrupoMes(36, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_Depreciacao.Text = oRev.vlrRev
        Me.txtRev_DepreciacaoP.Text = oRev.percRev

        'Sócios
        oRev.BuscaRevGrupoMes(37, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_Socios.Text = oRev.vlrRev
        Me.txtRev_SociosP.Text = oRev.percRev

        'Rateio de Despesas
        oRev.BuscaRevGrupoMes(38, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_Rateio.Text = oRev.vlrRev
        Me.txtRev_RateioP.Text = oRev.percRev

        'PLR
        oRev.BuscaRevGrupoMes(77, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_PLR.Text = oRev.vlrRev
        Me.txtRev_PLRP.Text = oRev.percRev

        '**********************  OUTRAS CONTAS FINAIS  ***************************************

        'Outras Receitas
        oRev.BuscaRevGrupoMes(39, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_OutrasReceitas.Text = oRev.vlrRev
        Me.txtRev_OutrasReceitasP.Text = oRev.percRev

        'Provisão de Créditos
        oRev.BuscaRevGrupoMes(41, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_ProvisaoCredito.Text = oRev.vlrRev
        Me.txtRev_ProvisaoCreditoP.Text = oRev.percRev

        'Receita Comercial
        oRev.BuscaRevGrupoMes(48, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_ReceitaComercial.Text = oRev.vlrRev
        Me.txtRev_ReceitaComercialP.Text = oRev.percRev

        'Resultado Financeiro - Loja

        oRev.BuscaRevGrupoMes(43, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_ResFinLoja.Text = oRev.vlrRev
        Me.txtRev_ResFinLojaP.Text = oRev.percRev

        'Resultado Financeiro - CD's
        oRev.BuscaRevGrupoMes(44, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.txtRev_ResFinCD.Text = oRev.vlrRev
        Me.txtRev_ResFinCDP.Text = oRev.percRev

    End Sub

    Sub AtualizarOriginal()
        'Venda Bruta 
        oVem.BI_BuscaOri_GrupoMes(1, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_Venda.Text = oVem.vlrOri

        'Impostos 
        oVem.BI_BuscaOri_GrupoMes(2, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_Impostos.Text = oVem.vlrOri
        Me.lblOri_ImpostosP.Text = oVem.percOri

        'Margem teórica
        oVem.BI_BuscaOri_GrupoMes(5, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_MargemTeórica.Text = oVem.vlrOri
        Me.lblOri_MargemTeóricaP.Text = oVem.percOri


        'Quebra total
        oVem.BI_BuscaOri_GrupoMes(6, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_QuebraTotal.Text = Abs(CDbl(oVem.vlrOri)).ToString("n0")
        Me.lblOri_QuebraTotalP.Text = Abs(CDbl(oVem.percOri))

        'Bonificação
        oVem.BI_BuscaOri_GrupoMes(8, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_Bonificacao.Text = oVem.vlrOri
        Me.lblOri_BonificacaoP.Text = oVem.percOri

        'Bonificação - CD
        oVem.BI_BuscaOri_GrupoMes(51, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_BonificacaoCD.Text = oVem.vlrOri
        Me.lblOri_BonificacaoCDP.Text = oVem.percOri

        'Contratos
        oVem.BI_BuscaOri_GrupoMes(9, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_Contratos.Text = oVem.vlrOri
        Me.lblOri_ContratosP.Text = oVem.percOri

        'Condição Especial
        oVem.BI_BuscaOri_GrupoMes(10, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_CondicaoEspecial.Text = oVem.vlrOri
        Me.lblOri_CondicaoEspecialP.Text = oVem.percOri

        'Condição Especial - CD
        oVem.BI_BuscaOri_GrupoMes(52, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_CondicaoEspecialCD.Text = oVem.vlrOri
        Me.lblOri_CondicaoEspecialCDP.Text = oVem.percOri

        'Ponta de Gondola
        oVem.BI_BuscaOri_GrupoMes(50, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_PontaDeGondola.Text = oVem.vlrOri
        Me.lblOri_PontaDeGondolaP.Text = oVem.percOri

        'Marketing
        oVem.BI_BuscaOri_GrupoMes(55, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_Marketing.Text = oVem.vlrOri
        Me.lblOri_MarketingP.Text = oVem.percOri

        'Sell-in / Sell-out
        oVem.BI_BuscaOri_GrupoMes(80, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_Sell.Text = oVem.vlrOri
        Me.lblOri_SellP.Text = oVem.percOri

        '*************  DESPESAS  ***********************************************************

        'Pessoal
        oVem.BI_BuscaOri_GrupoMes(15, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_Pessoal.Text = oVem.vlrOri
        Me.lblOri_PessoalP.Text = oVem.percOri

        'honorários profissionais
        oVem.BI_BuscaOri_GrupoMes(16, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_Honorarios.Text = oVem.vlrOri
        Me.lblOri_HonorariosP.Text = oVem.percOri

        'Informática
        oVem.BI_BuscaOri_GrupoMes(17, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_Informatica.Text = oVem.vlrOri
        Me.lblOri_InformaticaP.Text = oVem.percOri

        'Manutenção
        oVem.BI_BuscaOri_GrupoMes(18, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_Manutencao.Text = oVem.vlrOri
        Me.lblOri_ManutencaoP.Text = oVem.percOri

        'Frota
        oVem.BI_BuscaOri_GrupoMes(19, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_Frota.Text = oVem.vlrOri
        Me.lblOri_FrotaP.Text = oVem.percOri

        '(-) Recuperação de Contratos de Logistica
        oVem.BI_BuscaOri_GrupoMes(20, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_RecContrLogistica.Text = oVem.vlrOri
        Me.lblOri_RecContrLogisticaP.Text = oVem.percOri

        'Embalagens - Uso e Consumo
        oVem.BI_BuscaOri_GrupoMes(21, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_EmbUsoConsumo.Text = oVem.vlrOri
        Me.lblOri_EmbUsoConsumoP.Text = oVem.percOri

        'Embalagens - Produtos
        oVem.BI_BuscaOri_GrupoMes(22, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_EmbProdutos.Text = oVem.vlrOri
        Me.lblOri_EmbProdutosP.Text = oVem.percOri

        'Uso e Consumo
        oVem.BI_BuscaOri_GrupoMes(23, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_UsoConsumo.Text = oVem.vlrOri
        Me.lblOri_UsoConsumoP.Text = oVem.percOri

        'Propaganda
        oVem.BI_BuscaOri_GrupoMes(24, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_Propaganda.Text = oVem.vlrOri
        Me.lblOri_PropagandaP.Text = oVem.percOri

        '(-) Verbas Promocionais
        oVem.BI_BuscaOri_GrupoMes(25, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_VerbasPromocionais.Text = oVem.vlrOri
        Me.lblOri_VerbasPromocionaisP.Text = oVem.percOri

        'Propaganda Gasto pelas Lojas
        oVem.BI_BuscaOri_GrupoMes(26, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_PropGastoLojas.Text = oVem.vlrOri
        Me.lblOri_PropGastoLojasP.Text = oVem.percOri

        'Serviços Publicos
        oVem.BI_BuscaOri_GrupoMes(27, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_ServicoPublicos.Text = oVem.vlrOri
        Me.lblOri_ServicoPublicosP.Text = oVem.percOri

        'Aluguél
        oVem.BI_BuscaOri_GrupoMes(28, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_Aluguel.Text = oVem.vlrOri
        Me.lblOri_AluguelP.Text = oVem.percOri

        'Segurança
        oVem.BI_BuscaOri_GrupoMes(29, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_Seguranca.Text = oVem.vlrOri
        Me.lblOri_SegurancaP.Text = oVem.percOri

        'Tributos e Multas
        oVem.BI_BuscaOri_GrupoMes(30, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_Tributos.Text = oVem.vlrOri
        Me.lblOri_TributosP.Text = oVem.percOri

        'Inadimplentes
        oVem.BI_BuscaOri_GrupoMes(31, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_Inadimplentes.Text = oVem.vlrOri
        Me.lblOri_InadimplentesP.Text = oVem.percOri

        'Despesas Bancárias
        oVem.BI_BuscaOri_GrupoMes(32, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_DespBancarias.Text = oVem.vlrOri
        Me.lblOri_DespBancariasP.Text = oVem.percOri

        'Comissões s/ movimentação financeira
        oVem.BI_BuscaOri_GrupoMes(33, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_Comissoes.Text = oVem.vlrOri
        Me.lblOri_ComissoesP.Text = oVem.percOri

        'Diversas
        oVem.BI_BuscaOri_GrupoMes(34, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_Diversas.Text = oVem.vlrOri
        Me.lblOri_DiversasP.Text = oVem.percOri

        'Viagens e Transportes de Funcionários
        oVem.BI_BuscaOri_GrupoMes(73, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_Viagens.Text = oVem.vlrOri
        Me.lblOri_ViagensP.Text = oVem.percOri

        'Despesas Judiciais e Acordos
        oVem.BI_BuscaOri_GrupoMes(74, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_DespJudiciais.Text = oVem.vlrOri
        Me.lblOri_DespJudiciaisP.Text = oVem.percOri

        'Leasing
        oVem.BI_BuscaOri_GrupoMes(35, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_Leasing.Text = oVem.vlrOri
        Me.lblOri_LeasingP.Text = oVem.percOri

        'Depreciação
        oVem.BI_BuscaOri_GrupoMes(36, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_Depreciacao.Text = oVem.vlrOri
        Me.lblOri_DepreciacaoP.Text = oVem.percOri

        'Sócios
        oVem.BI_BuscaOri_GrupoMes(37, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_Socios.Text = oVem.vlrOri
        Me.lblOri_SociosP.Text = oVem.percOri

        'Rateio de Despesas
        oVem.BI_BuscaOri_GrupoMes(38, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_Rateio.Text = oVem.vlrOri
        Me.lblOri_RateioP.Text = oVem.percOri

        'PLR
        oVem.BI_BuscaOri_GrupoMes(77, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_PLR.Text = oVem.vlrOri
        Me.lblOri_PLRP.Text = oVem.percOri

        '**********************  OUTRAS CONTAS FINAIS  ***************************************

        'Outras Receitas
        oVem.BI_BuscaOri_GrupoMes(39, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_OutrasReceitas.Text = oVem.vlrOri
        Me.lblOri_OutrasReceitasP.Text = oVem.percOri

        'Provisão de Créditos
        oVem.BI_BuscaOri_GrupoMes(41, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_ProvisaoCredito.Text = oVem.vlrOri
        Me.lblOri_ProvisaoCreditoP.Text = oVem.percOri

        'Receita Comercial
        oVem.BI_BuscaOri_GrupoMes(48, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_ReceitaComercial.Text = oVem.vlrOri
        Me.lblOri_ReceitaComercialP.Text = oVem.percOri

        'Resultado Financeiro - Loja
        oVem.BI_BuscaOri_GrupoMes(43, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_ResFinLoja.Text = oVem.vlrOri
        Me.lblOri_ResFinLojaP.Text = oVem.percOri

        'Resultado Financeiro - CD's
        oVem.BI_BuscaOri_GrupoMes(44, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        Me.lblOri_ResFinCD.Text = oVem.vlrOri
        Me.lblOri_ResFinCDP.Text = oVem.percOri

    End Sub

#End Region

#Region " Page"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then

            Me.cboAno.AutoPostBack = True
            Me.cboMes.AutoPostBack = True
            Me.cboFilial.AutoPostBack = True

            Me.btnSalvar.btnSalvar_Text = "Salvar"
            oVem.AtualizarEstatisticaPrograma(16, User.Identity.Name)

            Me.cboAno.CallAno = Year(Now())
            Me.cboMes.CallMes = Month(Now())
            Me.cboAno.AnoInicial = 2012
            Me.cboAno.AnoFinal = Year(Now()) + 1
        End If
        Call LiberarSalvar()
    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Replanejamento - Passo 1"
        End If
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            If Me.cboFilial.IsLoja = True Then
                Me.txtRev_Venda.Enabled = False
            End If
            Me.cboFilial.Visible_cboCorporacao = False
            Call Atualizar()
        End If
    End Sub

#End Region

#Region " Salvar"

    Private Sub LiberarSalvar()
        oVem.BuscaLiberaProgramaReplanejamento(Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        If LCase(User.Identity.Name) = "eliseu" Or LCase(User.Identity.Name) = "eder" Then
            Me.btnSalvar.btnSalvar_Enabled = True
        Else
            If oVem.LiberaReplanejamento = True Then
                Me.btnSalvar.btnSalvar_Enabled = True
            Else
                Me.btnSalvar.btnSalvar_Enabled = False
            End If
        End If
    End Sub

    Protected Sub btnSalvar_BotaoClick(sender As Object, e As EventArgs) Handles btnSalvar.BotaoClick
        If CDbl(Me.txtRev_QuebraTotalP.Text) > CDbl(Me.lblOri_QuebraTotalP.Text) Then
            oVem.UserMsgBox(Me, "O novo % de Quebra não pode ser maior que o % Original")
            Me.txtRev_QuebraTotalP.Focus()
        ElseIf CDbl(Me.txtRev_ResFinalP.Text) < CDbl(Me.lblOri_ResFinalP.Text) Then
            oVem.UserMsgBox(Me, "O percentual Revisto do Resultado Final tem que ser Igual ou Maior que o percentual Original.")
            Me.txtRev_QuebraTotalP.Focus()
        Else
            Call Salvar()
            Call SalvarEmpresa_Valor()
            oVem.CalcularMetaRevistaSecao(Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial, Me.User.Identity.Name)
            'Call SalvarEmpresa_Percentual()
            oVem.UserMsgBox(Me, "O Replanejamento foi salvo com sucesso!!!")
        End If
    End Sub


#End Region


    Sub Atualizar()
        Call ZerarCamposParaInico()
        '    Call AtualizarOriginal()
        Call AtualizarRevista()
        '        Call CalcularInicio()
        '        Call FormatarNegativo()
    End Sub

    Sub CalcularInicio()
        On Error Resume Next

        '-------------------------- Revista -------------------------------------------------------------------------------
        'Venda Liquida
        Me.txtRev_VendaLiquida.Text = CDbl(Me.txtRev_Venda.Text - Me.txtRev_Impostos.Text).ToString("n0")
        Me.txtRev_VendaLiquidaP.Text = ((CDbl(txtRev_VendaLiquida.Text) / CDbl(Me.txtRev_Venda.Text)) * 100).ToString("n2")

        'CMV
        Me.txtRev_CMV.Text = (CDbl(Me.txtRev_VendaLiquida.Text) + Abs(CDbl(Me.txtRev_QuebraTotal.Text)) - CDbl(Me.txtRev_MargemTeórica.Text)).ToString("n0")
        Me.txtRev_CMVP.Text = ((CDbl(txtRev_CMV.Text) / CDbl(Me.txtRev_Venda.Text)) * 100).ToString("n2")

        'Operações Comerciais
        Me.txtRev_OperacoesComerciais.Text = (CDbl(Me.txtRev_Bonificacao.Text) + CDbl(Me.txtRev_BonificacaoCD.Text) _
                                               + CDbl(Me.txtRev_Contratos.Text) + CDbl(Me.txtRev_CondicaoEspecial.Text) _
                                               + CDbl(Me.txtRev_CondicaoEspecialCD.Text) _
                                               + CDbl(Me.txtRev_PontaDeGondola.Text) + CDbl(Me.txtRev_Marketing.Text) + CDbl(Me.txtRev_Sell.Text)).ToString("n0")
        Me.txtRev_OperacoesComerciaisP.Text = ((CDbl(txtRev_OperacoesComerciais.Text) / CDbl(Me.txtRev_Venda.Text)) * 100).ToString("n2")

        'Margem Operacional
        Me.txtRev_MargemOperacional.Text = (CDbl(Me.txtRev_VendaLiquida.Text) - CDbl(Me.txtRev_CMV.Text) + CDbl(Me.txtRev_OperacoesComerciais.Text)).ToString("n0")
        Me.txtRev_MargemOperacionalP.Text = ((CDbl(txtRev_MargemOperacional.Text) / CDbl(Me.txtRev_Venda.Text)) * 100).ToString("n2")

        'Despesas Operacionais
        Me.txtRev_Despesas.Text = (CDbl(Me.txtRev_Pessoal.Text) + CDbl(Me.txtRev_Honorarios.Text) + CDbl(Me.txtRev_Informatica.Text) _
                                 + CDbl(Me.txtRev_Manutencao.Text) + CDbl(Me.txtRev_Frota.Text) + CDbl(Me.txtRev_RecContrLogistica.Text) _
                                 + CDbl(Me.txtRev_EmbUsoConsumo.Text) + CDbl(Me.txtRev_EmbProdutos.Text) + CDbl(Me.txtRev_UsoConsumo.Text) _
                                 + CDbl(Me.txtRev_Propaganda.Text) + CDbl(Me.txtRev_VerbasPromocionais.Text) + CDbl(Me.txtRev_PropGastoLojas.Text) _
                                 + CDbl(Me.txtRev_ServicoPublicos.Text) + CDbl(Me.txtRev_Aluguel.Text) + CDbl(Me.txtRev_Seguranca.Text) _
                                 + CDbl(Me.txtRev_Tributos.Text) + CDbl(Me.txtRev_Inadimplentes.Text) + CDbl(Me.txtRev_DespBancarias.Text) _
                                 + CDbl(Me.txtRev_Comissoes.Text) + CDbl(Me.txtRev_Diversas.Text) + CDbl(Me.txtRev_Viagens.Text) _
                                 + CDbl(Me.txtRev_DespJudiciais.Text) + CDbl(Me.txtRev_Leasing.Text) + CDbl(Me.txtRev_Depreciacao.Text) _
                                 + CDbl(Me.txtRev_Socios.Text) + CDbl(Me.txtRev_Rateio.Text) + CDbl(Me.txtRev_PLR.Text)).ToString("n0")
        Me.txtRev_DespesasP.Text = ((CDbl(txtRev_Despesas.Text) / CDbl(Me.txtRev_Venda.Text)) * 100).ToString("n2")

        'Resultado Operacional
        Me.txtRev_ResultaoOperacional.Text = (CDbl(Me.txtRev_MargemOperacional.Text) - CDbl(Me.txtRev_Despesas.Text) + CDbl(Me.txtRev_OutrasReceitas.Text)).ToString("n0")
        Me.txtRev_ResultaoOperacionalP.Text = ((CDbl(txtRev_ResultaoOperacional.Text) / CDbl(Me.txtRev_Venda.Text)) * 100).ToString("n2")

        'ResultadoFinanceiro
        Me.txtRev_ResFin.Text = (CDbl(Me.txtRev_ResFinLoja.Text) + CDbl(Me.txtRev_ResFinCD.Text)).ToString("n0")
        Me.txtRev_ResFinP.Text = ((CDbl(txtRev_ResFin.Text) / CDbl(Me.txtRev_Venda.Text)) * 100).ToString("n2")

        'Resultado Antes do IR
        Me.txtRev_ResAntesIR.Text = (CDbl(Me.txtRev_ResultaoOperacional.Text) + CDbl(Me.txtRev_ProvisaoCredito.Text) _
                                            + CDbl(Me.txtRev_ReceitaComercial.Text) + CDbl(Me.txtRev_ResFin.Text)).ToString("n0")
        Me.txtRev_ResAntesIRP.Text = ((CDbl(txtRev_ResAntesIR.Text) / CDbl(Me.txtRev_Venda.Text)) * 100).ToString("n2")

        'Provisão de I.R.
        If CDbl(Me.txtRev_ResAntesIR.Text) > 0 Then
            Me.txtRev_ProvIR.Text = (((CDbl(Me.txtRev_ResAntesIR.Text) * 34) / 100)).ToString("n0")
            Me.txtRev_ProvIRP.Text = ((CDbl(txtRev_ProvIR.Text) / CDbl(Me.txtRev_Venda.Text)) * 100).ToString("n2")
        Else
            Me.txtRev_ProvIR.Text = 0
            Me.txtRev_ProvIRP.Text = 0
        End If

        'Resultado Final
        Me.txtRev_ResFinal.Text = (CDbl(Me.txtRev_ResAntesIR.Text) - CDbl(Me.txtRev_ProvIR.Text)).ToString("n0")
        Me.txtRev_ResFinalP.Text = ((CDbl(txtRev_ResFinal.Text) / CDbl(Me.txtRev_Venda.Text)) * 100).ToString("n2")

        '-------------------------- Original -------------------------------------------------------------------------------
        'Venda Liquida
        Me.lblOri_VendaLiquida.Text = (CDbl(Me.lblOri_Venda.Text) - CDbl(Me.lblOri_Impostos.Text)).ToString("n0")
        Me.lblOri_VendaLiquidaP.Text = ((CDbl(lblOri_VendaLiquida.Text) / CDbl(Me.lblOri_Venda.Text)) * 100).ToString("n2")

        'CMV
        Me.lblOri_CMV.Text = (CDbl(Me.lblOri_VendaLiquida.Text) + CDbl(Me.lblOri_QuebraTotal.Text) - CDbl(Me.lblOri_MargemTeórica.Text)).ToString("n0")
        Me.lblOri_CMVP.Text = ((CDbl(lblOri_CMV.Text) / CDbl(Me.lblOri_Venda.Text)) * 100).ToString("n2")

        'Operações Comerciais
        Me.lblOri_OperacoesComerciais.Text = (CDbl(Me.lblOri_Bonificacao.Text) + CDbl(Me.lblOri_BonificacaoCD.Text) _
                                               + CDbl(Me.lblOri_Contratos.Text) + CDbl(Me.lblOri_CondicaoEspecial.Text) _
                                               + CDbl(Me.lblOri_CondicaoEspecialCD.Text) _
                                               + CDbl(Me.lblOri_PontaDeGondola.Text) + CDbl(Me.lblOri_Marketing.Text) + CDbl(Me.lblOri_Sell.Text)).ToString("n0")
        Me.lblOri_OperacoesComerciaisP.Text = ((CDbl(lblOri_OperacoesComerciais.Text) / CDbl(Me.lblOri_Venda.Text)) * 100).ToString("n2")

        'Margem Operacional
        Me.lblOri_MargemOperacional.Text = (CDbl(Me.lblOri_VendaLiquida.Text) - CDbl(Me.lblOri_CMV.Text) + CDbl(Me.lblOri_OperacoesComerciais.Text)).ToString("n0")
        Me.lblOri_MargemOperacionalP.Text = ((CDbl(lblOri_MargemOperacional.Text) / CDbl(Me.lblOri_Venda.Text)) * 100).ToString("n2")

        'Despesas Operacionais
        Me.lblOri_Despesas.Text = (CDbl(Me.lblOri_Pessoal.Text) + CDbl(Me.lblOri_Honorarios.Text) + CDbl(Me.lblOri_Informatica.Text) _
                                 + CDbl(Me.lblOri_Manutencao.Text) + CDbl(Me.lblOri_Frota.Text) + CDbl(Me.lblOri_RecContrLogistica.Text) _
                                 + CDbl(Me.lblOri_EmbUsoConsumo.Text) + CDbl(Me.lblOri_EmbProdutos.Text) + CDbl(Me.lblOri_UsoConsumo.Text) _
                                 + CDbl(Me.lblOri_Propaganda.Text) + CDbl(Me.lblOri_VerbasPromocionais.Text) + CDbl(Me.lblOri_PropGastoLojas.Text) _
                                 + CDbl(Me.lblOri_ServicoPublicos.Text) + CDbl(Me.lblOri_Aluguel.Text) + CDbl(Me.lblOri_Seguranca.Text) _
                                 + CDbl(Me.lblOri_Tributos.Text) + CDbl(Me.lblOri_Inadimplentes.Text) + CDbl(Me.lblOri_DespBancarias.Text) _
                                 + CDbl(Me.lblOri_Comissoes.Text) + CDbl(Me.lblOri_Diversas.Text) + CDbl(Me.lblOri_Viagens.Text) _
                                 + CDbl(Me.lblOri_DespJudiciais.Text) + CDbl(Me.lblOri_Leasing.Text) + CDbl(Me.lblOri_Depreciacao.Text) _
                                 + CDbl(Me.lblOri_Socios.Text) + CDbl(Me.lblOri_Rateio.Text) + CDbl(Me.lblOri_PLR.Text)).ToString("n0")
        Me.lblOri_DespesasP.Text = ((CDbl(lblOri_Despesas.Text) / CDbl(Me.lblOri_Venda.Text)) * 100).ToString("n2")

        'Resultado Operacional
        Me.lblOri_ResultaoOperacional.Text = (CDbl(Me.lblOri_MargemOperacional.Text) - CDbl(Me.lblOri_Despesas.Text) + CDbl(Me.lblOri_OutrasReceitas.Text)).ToString("n0")
        Me.lblOri_ResultaoOperacionalP.Text = ((CDbl(lblOri_ResultaoOperacional.Text) / CDbl(Me.lblOri_Venda.Text)) * 100).ToString("n2")

        'Resultado Financeiro
        Me.lblOri_ResFin.Text = (CDbl(Me.lblOri_ResFinLoja.Text) + CDbl(Me.lblOri_ResFinCD.Text)).ToString("n0")
        Me.lblOri_ResFinP.Text = ((CDbl(lblOri_ResFin.Text) / CDbl(Me.lblOri_Venda.Text)) * 100).ToString("n2")

        'Resultado Antes do IR
        Me.lblOri_ResAntesIR.Text = (CDbl(Me.lblOri_ResultaoOperacional.Text) + CDbl(Me.lblOri_ProvisaoCredito.Text) _
                                            + CDbl(Me.lblOri_ReceitaComercial.Text) + CDbl(Me.lblOri_ResFin.Text)).ToString("n0")
        Me.lblOri_ResAntesIRP.Text = ((CDbl(lblOri_ResAntesIR.Text) / CDbl(Me.lblOri_Venda.Text)) * 100).ToString("n2")

        'Provisão de I.R.
        If CDbl(Me.lblOri_ResAntesIR.Text) > 0 Then
            Me.lblOri_ProvIR.Text = (((CDbl(Me.lblOri_ResAntesIR.Text) * 34) / 100)).ToString("n0")
            Me.lblOri_ProvIRP.Text = ((CDbl(lblOri_ProvIR.Text) / CDbl(Me.lblOri_Venda.Text)) * 100).ToString("n2")
        Else
            Me.lblOri_ProvIR.Text = 0
            Me.lblOri_ProvIRP.Text = 0
        End If

        'Resultado Final
        Me.lblOri_ResFinal.Text = (CDbl(Me.lblOri_ResAntesIR.Text) - CDbl(Me.lblOri_ProvIR.Text)).ToString("n0")
        Me.lblOri_ResFinalP.Text = ((CDbl(lblOri_ResFinal.Text) / CDbl(Me.lblOri_Venda.Text)) * 100).ToString("n2")


    End Sub

    Public Function Salvar(ByVal idGrupo As String, ByVal vlr As String, ByVal perc As String) As Boolean

        Dim gravou As Boolean
        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("uspInsertRevMes", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@idCod", SqlDbType.TinyInt))
        comando.Parameters("@idCod").Value = idGrupo

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = Me.cboAno.CallAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.TinyInt))
        comando.Parameters("@Mes").Value = Me.cboMes.CallMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.TinyInt))
        comando.Parameters("@idFilial").Value = Me.cboFilial.CallFilial

        comando.Parameters.Add(New SqlParameter("@vlr", SqlDbType.Money))
        comando.Parameters("@vlr").Value = vlr

        comando.Parameters.Add(New SqlParameter("@perc", SqlDbType.SmallMoney))
        comando.Parameters("@perc").Value = perc

        comando.Parameters.Add(New SqlParameter("@userName", SqlDbType.VarChar))
        comando.Parameters("@userName").Value = User.Identity.Name

        Try
            con.Open()
            gravou = comando.ExecuteNonQuery    'Executa o comando, porém não retorna nenhum dado.
        Catch ex As Exception
            'oVEM.UserMsgBox(Me, ex.Message)

        Finally 'Tudo o que estiver entre o "Finally" e o "End Try" será executado mesmo após a mensagem de erro.
            con.Close() 'Fecha o banco de dados
        End Try

        Return gravou   'Toda função tem retornar alguma coisa
        'Neste caso o retorno será dados pela variavel "gavou"

    End Function


    Public Function SalvarEmpresa_Valor() As Boolean

        Dim gravou As Boolean
        Dim con As New SqlConnection(connManager)
        Dim comando As New SqlCommand("usp_CalcularRevista_Empresa", con)
        comando.CommandType = CommandType.StoredProcedure

        comando.Parameters.Add(New SqlParameter("@vAno", SqlDbType.SmallInt))
        comando.Parameters("@vAno").Value = Me.cboAno.CallAno

        comando.Parameters.Add(New SqlParameter("@vMes", SqlDbType.TinyInt))
        comando.Parameters("@vMes").Value = Me.cboMes.CallMes

        Try
            con.Open()
            gravou = comando.ExecuteNonQuery    'Executa o comando, porém não retorna nenhum dado.
        Catch ex As Exception
            oVem.UserMsgBox(Me, ex.Message)

        Finally 'Tudo o que estiver entre o "Finally" e o "End Try" será executado mesmo após a mensagem de erro.
            con.Close() 'Fecha o banco de dados
        End Try

        Return gravou   'Toda função tem retornar alguma coisa
        'Neste caso o retorno será dados pela variavel "gavou"

    End Function

    Sub Salvar()
        Call Salvar(1, Me.txtRev_Venda.Text, 0)
        Call Salvar(2, Me.txtRev_Impostos.Text, Me.txtRev_ImpostosP.Text)
        Call Salvar(3, Me.txtRev_VendaLiquida.Text, Me.txtRev_VendaLiquidaP.Text)

        Call Salvar(4, Me.txtRev_CMV.Text, Me.txtRev_CMVP.Text)
        Call Salvar(5, Me.txtRev_MargemTeórica.Text, Me.txtRev_MargemTeóricaP.Text)

        Call Salvar(6, Me.txtRev_QuebraTotal.Text, Me.txtRev_QuebraTotalP.Text)

        Call Salvar(7, Me.txtRev_OperacoesComerciais.Text, Me.txtRev_OperacoesComerciaisP.Text)
        Call Salvar(8, Me.txtRev_Bonificacao.Text, Me.txtRev_BonificacaoP.Text)
        Call Salvar(51, Me.txtRev_BonificacaoCD.Text, Me.txtRev_BonificacaoCDP.Text)
        Call Salvar(9, Me.txtRev_Contratos.Text, Me.txtRev_ContratosP.Text)
        Call Salvar(10, Me.txtRev_CondicaoEspecial.Text, Me.txtRev_CondicaoEspecialP.Text)
        Call Salvar(52, Me.txtRev_CondicaoEspecialCD.Text, Me.txtRev_CondicaoEspecialCDP.Text)
        Call Salvar(50, Me.txtRev_PontaDeGondola.Text, Me.txtRev_PontaDeGondolaP.Text)
        Call Salvar(55, Me.txtRev_Marketing.Text, Me.txtRev_MarketingP.Text)
        Call Salvar(80, Me.txtRev_Sell.Text, Me.txtRev_SellP.Text)

        Call Salvar(13, Me.txtRev_MargemOperacional.Text, Me.txtRev_MargemOperacionalP.Text)

        Call Salvar(14, Me.txtRev_Despesas.Text, Me.txtRev_DespesasP.Text)
        Call Salvar(15, Me.txtRev_Pessoal.Text, Me.txtRev_PessoalP.Text)
        Call Salvar(16, Me.txtRev_Honorarios.Text, Me.txtRev_HonorariosP.Text)
        Call Salvar(17, Me.txtRev_Informatica.Text, Me.txtRev_InformaticaP.Text)
        Call Salvar(18, Me.txtRev_Manutencao.Text, Me.txtRev_ManutencaoP.Text)
        Call Salvar(19, Me.txtRev_Frota.Text, Me.txtRev_FrotaP.Text)
        Call Salvar(20, Me.txtRev_RecContrLogistica.Text, Me.txtRev_RecContrLogisticaP.Text)
        Call Salvar(21, Me.txtRev_EmbUsoConsumo.Text, Me.txtRev_EmbUsoConsumoP.Text)
        Call Salvar(22, Me.txtRev_EmbProdutos.Text, Me.txtRev_EmbProdutosP.Text)
        Call Salvar(23, Me.txtRev_UsoConsumo.Text, Me.txtRev_UsoConsumoP.Text)
        Call Salvar(24, Me.txtRev_Propaganda.Text, Me.txtRev_PropagandaP.Text)
        Call Salvar(25, Me.txtRev_VerbasPromocionais.Text, Me.txtRev_VerbasPromocionaisP.Text)
        Call Salvar(26, Me.txtRev_PropGastoLojas.Text, Me.txtRev_PropGastoLojasP.Text)
        Call Salvar(27, Me.txtRev_ServicoPublicos.Text, Me.txtRev_ServicoPublicosP.Text)
        Call Salvar(28, Me.txtRev_Aluguel.Text, Me.txtRev_AluguelP.Text)
        Call Salvar(29, Me.txtRev_Seguranca.Text, Me.txtRev_SegurancaP.Text)
        Call Salvar(30, Me.txtRev_Tributos.Text, Me.txtRev_TributosP.Text)
        Call Salvar(31, Me.txtRev_Inadimplentes.Text, Me.txtRev_InadimplentesP.Text)
        Call Salvar(32, Me.txtRev_DespBancarias.Text, Me.txtRev_DespBancariasP.Text)
        Call Salvar(33, Me.txtRev_Comissoes.Text, Me.txtRev_ComissoesP.Text)
        Call Salvar(34, Me.txtRev_Diversas.Text, Me.txtRev_DiversasP.Text)
        Call Salvar(73, Me.txtRev_Viagens.Text, Me.txtRev_ViagensP.Text)
        Call Salvar(74, Me.txtRev_DespJudiciais.Text, Me.txtRev_DespJudiciaisP.Text)
        Call Salvar(35, Me.txtRev_Leasing.Text, Me.txtRev_LeasingP.Text)
        Call Salvar(36, Me.txtRev_Depreciacao.Text, Me.txtRev_DepreciacaoP.Text)
        Call Salvar(37, Me.txtRev_Socios.Text, Me.txtRev_SociosP.Text)
        Call Salvar(38, Me.txtRev_Rateio.Text, Me.txtRev_RateioP.Text)

        Call Salvar(39, Me.txtRev_OutrasReceitas.Text, Me.txtRev_OutrasReceitasP.Text)
        Call Salvar(40, Me.txtRev_ResultaoOperacional.Text, Me.txtRev_ResultaoOperacionalP.Text)
        Call Salvar(41, Me.txtRev_ProvisaoCredito.Text, Me.txtRev_ProvisaoCreditoP.Text)
        Call Salvar(48, Me.txtRev_ReceitaComercial.Text, Me.txtRev_ReceitaComercialP.Text)

        Call Salvar(42, Me.txtRev_ResFin.Text, Me.txtRev_ResFinP.Text)
        Call Salvar(43, Me.txtRev_ResFinLoja.Text, Me.txtRev_ResFinLojaP.Text)
        Call Salvar(44, Me.txtRev_ResFinCD.Text, Me.txtRev_ResFinCDP.Text)

        Call Salvar(79, Me.txtRev_ResAntesIR.Text, Me.txtRev_ResAntesIRP.Text)
        Call Salvar(45, Me.txtRev_ProvIR.Text, Me.txtRev_ProvIRP.Text)
        Call Salvar(47, Me.txtRev_ResFinal.Text, Me.txtRev_ResFinalP.Text)

    End Sub

    Sub ZerarCamposParaInico()
        'Meta Original
        Me.lblOri_Venda.Text = 0
        Me.lblOri_Impostos.Text = 0
        Me.lblOri_ImpostosP.Text = 0
        Me.lblOri_MargemTeórica.Text = 0
        Me.lblOri_MargemTeóricaP.Text = 0

        Me.lblOri_QuebraTotal.Text = 0
        Me.lblOri_QuebraTotalP.Text = 0
        Me.lblOri_Bonificacao.Text = 0
        Me.lblOri_BonificacaoP.Text = 0
        Me.lblOri_BonificacaoCD.Text = 0
        Me.lblOri_BonificacaoCDP.Text = 0
        Me.lblOri_Contratos.Text = 0
        Me.lblOri_ContratosP.Text = 0
        Me.lblOri_CondicaoEspecial.Text = 0
        Me.lblOri_CondicaoEspecialP.Text = 0
        Me.lblOri_CondicaoEspecialCD.Text = 0
        Me.lblOri_CondicaoEspecialCDP.Text = 0
        Me.lblOri_PontaDeGondola.Text = 0
        Me.lblOri_PontaDeGondolaP.Text = 0
        Me.lblOri_Marketing.Text = 0
        Me.lblOri_MarketingP.Text = 0
        Me.lblOri_Pessoal.Text = 0
        Me.lblOri_PessoalP.Text = 0
        Me.lblOri_Honorarios.Text = 0
        Me.lblOri_HonorariosP.Text = 0
        Me.lblOri_Informatica.Text = 0
        Me.lblOri_InformaticaP.Text = 0
        Me.lblOri_Manutencao.Text = 0
        Me.lblOri_ManutencaoP.Text = 0
        Me.lblOri_Frota.Text = 0
        Me.lblOri_FrotaP.Text = 0
        Me.lblOri_RecContrLogistica.Text = 0
        Me.lblOri_RecContrLogisticaP.Text = 0
        Me.lblOri_EmbUsoConsumo.Text = 0
        Me.lblOri_EmbUsoConsumoP.Text = 0
        Me.lblOri_EmbProdutos.Text = 0
        Me.lblOri_EmbProdutosP.Text = 0
        Me.lblOri_UsoConsumo.Text = 0
        Me.lblOri_UsoConsumoP.Text = 0
        Me.lblOri_Propaganda.Text = 0
        Me.lblOri_PropagandaP.Text = 0
        Me.lblOri_VerbasPromocionais.Text = 0
        Me.lblOri_VerbasPromocionaisP.Text = 0
        Me.lblOri_PropGastoLojas.Text = 0
        Me.lblOri_PropGastoLojasP.Text = 0
        Me.lblOri_ServicoPublicos.Text = 0
        Me.lblOri_ServicoPublicosP.Text = 0
        Me.lblOri_Aluguel.Text = 0
        Me.lblOri_AluguelP.Text = 0
        Me.lblOri_Seguranca.Text = 0
        Me.lblOri_SegurancaP.Text = 0
        Me.lblOri_Tributos.Text = 0
        Me.lblOri_TributosP.Text = 0
        Me.lblOri_Inadimplentes.Text = 0
        Me.lblOri_InadimplentesP.Text = 0
        Me.lblOri_DespBancarias.Text = 0
        Me.lblOri_DespBancariasP.Text = 0
        Me.lblOri_Comissoes.Text = 0
        Me.lblOri_ComissoesP.Text = 0
        Me.lblOri_Diversas.Text = 0
        Me.lblOri_DiversasP.Text = 0
        Me.lblOri_Viagens.Text = 0
        Me.lblOri_ViagensP.Text = 0
        Me.lblOri_DespJudiciais.Text = 0
        Me.lblOri_DespJudiciaisP.Text = 0
        Me.lblOri_Leasing.Text = 0
        Me.lblOri_LeasingP.Text = 0
        Me.lblOri_Depreciacao.Text = 0
        Me.lblOri_DepreciacaoP.Text = 0
        Me.lblOri_Socios.Text = 0
        Me.lblOri_SociosP.Text = 0
        Me.lblOri_Rateio.Text = 0
        Me.lblOri_RateioP.Text = 0
        Me.lblOri_PLR.Text = 0
        Me.lblOri_PLRP.Text = 0
        Me.lblOri_OutrasReceitas.Text = 0
        Me.lblOri_OutrasReceitasP.Text = 0
        Me.lblOri_ProvisaoCredito.Text = 0
        Me.lblOri_ProvisaoCreditoP.Text = 0
        Me.lblOri_ReceitaComercial.Text = 0
        Me.lblOri_ReceitaComercialP.Text = 0
        Me.lblOri_ResFinLoja.Text = 0
        Me.lblOri_ResFinLojaP.Text = 0
        Me.lblOri_ResFinCD.Text = 0
        Me.lblOri_ResFinCDP.Text = 0

        'Meta Revista
        Me.txtRev_Venda.Text = 0
        Me.txtRev_Impostos.Text = 0
        Me.txtRev_ImpostosP.Text = 0
        Me.txtRev_MargemTeórica.Text = 0
        Me.txtRev_MargemTeóricaP.Text = 0

        Me.txtRev_QuebraTotal.Text = 0
        Me.txtRev_QuebraTotalP.Text = 0
        Me.txtRev_Bonificacao.Text = 0
        Me.txtRev_BonificacaoP.Text = 0
        Me.txtRev_BonificacaoCD.Text = 0
        Me.txtRev_BonificacaoCDP.Text = 0
        Me.txtRev_Contratos.Text = 0
        Me.txtRev_ContratosP.Text = 0
        Me.txtRev_CondicaoEspecial.Text = 0
        Me.txtRev_CondicaoEspecialP.Text = 0
        Me.txtRev_CondicaoEspecialCD.Text = 0
        Me.txtRev_CondicaoEspecialCDP.Text = 0
        Me.txtRev_PontaDeGondola.Text = 0
        Me.txtRev_PontaDeGondolaP.Text = 0
        Me.txtRev_Marketing.Text = 0
        Me.txtRev_MarketingP.Text = 0
        Me.txtRev_Pessoal.Text = 0
        Me.txtRev_PessoalP.Text = 0
        Me.txtRev_Honorarios.Text = 0
        Me.txtRev_HonorariosP.Text = 0
        Me.txtRev_Informatica.Text = 0
        Me.txtRev_InformaticaP.Text = 0
        Me.txtRev_Manutencao.Text = 0
        Me.txtRev_ManutencaoP.Text = 0
        Me.txtRev_Frota.Text = 0
        Me.txtRev_FrotaP.Text = 0
        Me.txtRev_RecContrLogistica.Text = 0
        Me.txtRev_RecContrLogisticaP.Text = 0
        Me.txtRev_EmbUsoConsumo.Text = 0
        Me.txtRev_EmbUsoConsumoP.Text = 0
        Me.txtRev_EmbProdutos.Text = 0
        Me.txtRev_EmbProdutosP.Text = 0
        Me.txtRev_UsoConsumo.Text = 0
        Me.txtRev_UsoConsumoP.Text = 0
        Me.txtRev_Propaganda.Text = 0
        Me.txtRev_PropagandaP.Text = 0
        Me.txtRev_VerbasPromocionais.Text = 0
        Me.txtRev_VerbasPromocionaisP.Text = 0
        Me.txtRev_PropGastoLojas.Text = 0
        Me.txtRev_PropGastoLojasP.Text = 0
        Me.txtRev_ServicoPublicos.Text = 0
        Me.txtRev_ServicoPublicosP.Text = 0
        Me.txtRev_Aluguel.Text = 0
        Me.txtRev_AluguelP.Text = 0
        Me.txtRev_Seguranca.Text = 0
        Me.txtRev_SegurancaP.Text = 0
        Me.txtRev_Tributos.Text = 0
        Me.txtRev_TributosP.Text = 0
        Me.txtRev_Inadimplentes.Text = 0
        Me.txtRev_InadimplentesP.Text = 0
        Me.txtRev_DespBancarias.Text = 0
        Me.txtRev_DespBancariasP.Text = 0
        Me.txtRev_Comissoes.Text = 0
        Me.txtRev_ComissoesP.Text = 0
        Me.txtRev_Diversas.Text = 0
        Me.txtRev_DiversasP.Text = 0
        Me.txtRev_Viagens.Text = 0
        Me.txtRev_ViagensP.Text = 0
        Me.txtRev_DespJudiciais.Text = 0
        Me.txtRev_DespJudiciaisP.Text = 0
        Me.txtRev_Leasing.Text = 0
        Me.txtRev_LeasingP.Text = 0
        Me.txtRev_Depreciacao.Text = 0
        Me.txtRev_DepreciacaoP.Text = 0
        Me.txtRev_Socios.Text = 0
        Me.txtRev_SociosP.Text = 0
        Me.txtRev_Rateio.Text = 0
        Me.txtRev_RateioP.Text = 0
        Me.txtRev_PLR.Text = 0
        Me.txtRev_PLRP.Text = 0
        Me.txtRev_OutrasReceitas.Text = 0
        Me.txtRev_OutrasReceitasP.Text = 0
        Me.txtRev_ProvisaoCredito.Text = 0
        Me.txtRev_ProvisaoCreditoP.Text = 0
        Me.txtRev_ReceitaComercial.Text = 0
        Me.txtRev_ReceitaComercialP.Text = 0
        Me.txtRev_ResFinLoja.Text = 0
        Me.txtRev_ResFinLojaP.Text = 0
        Me.txtRev_ResFinCD.Text = 0
        Me.txtRev_ResFinCDP.Text = 0

    End Sub

    Private Sub CalcularDadosFixoComBaseVenda()
        Dim varVlr As Double
        varVendaRevista = Me.txtRev_Venda.Text
        Me.txtRev_Venda.Text = CDbl(Me.txtRev_Venda.Text * 1).ToString("n0")

        'Se mudar a venda, muda as seguintes contas
        'Impostos -> pelo Percentual
        varVlr = CDbl(((varVendaRevista * Me.txtRev_ImpostosP.Text) / 100))
        Me.txtRev_Impostos.Text = varVlr.ToString("n0")

        'Venda Liquida -> Altera Valor e Percentual
        Call CalcularVendaLiquida_Revista(varVendaRevista, vlr)

        varVlr = 0
        'Margem -> pelo Percentual
        varVlr = CDbl(((varVendaRevista * Me.txtRev_MargemTeóricaP.Text) / 100))
        Me.txtRev_MargemTeórica.Text = varVlr.ToString("n0")



        'Bonificação.  -> pelo Percentual
        varVlr = 0
        varVlr = CDbl(((varVendaRevista * Me.txtRev_BonificacaoP.Text) / 100))
        Me.txtRev_Bonificacao.Text = varVlr.ToString("n0")


        'Bonificação CD.  -> pelo Percentual
        varVlr = 0
        varVlr = CDbl(((varVendaRevista * Me.txtRev_BonificacaoCDP.Text) / 100))
        Me.txtRev_BonificacaoCD.Text = varVlr.ToString("n0")

        'Contratos.  -> pelo Percentual
        varVlr = 0
        varVlr = CDbl(((varVendaRevista * Me.txtRev_ContratosP.Text) / 100))
        Me.txtRev_Contratos.Text = varVlr.ToString("n0")

        'CondicaoEspecial  -> pelo Percentual
        varVlr = 0
        varVlr = CDbl(((varVendaRevista * Me.txtRev_CondicaoEspecialP.Text) / 100))
        Me.txtRev_CondicaoEspecial.Text = varVlr.ToString("n0")

        'CondicaoEspecialCD  -> pelo Percentual
        varVlr = 0
        varVlr = CDbl(((varVendaRevista * Me.txtRev_CondicaoEspecialCDP.Text) / 100))
        Me.txtRev_CondicaoEspecialCD.Text = varVlr.ToString("n0")

        'PontaDeGondola  -> pelo Percentual
        varVlr = 0
        varVlr = CDbl(((varVendaRevista * Me.txtRev_PontaDeGondolaP.Text) / 100))
        Me.txtRev_PontaDeGondola.Text = varVlr.ToString("n0")

        'Marketing  -> pelo Percentual
        varVlr = 0
        varVlr = CDbl(((varVendaRevista * Me.txtRev_MarketingP.Text) / 100))
        Me.txtRev_Marketing.Text = varVlr.ToString("n0")

        Call CalcularOperacaoComercial_Revista(Me.txtRev_Venda.Text)

        'CMV -> Altera Valor e Percentual
        Call CalcularCMV_Revista(varVendaRevista)

        '************************ Muda VALOR em função do Percentual Fixo ************************************

        'Quebra -> pelo Percentual e pode alterar desde que o % da quebra seja igual ou menor que o % original.
        varVlr = 0
        varVlr = CDbl(((varVendaRevista * Me.txtRev_QuebraTotalP.Text) / 100))
        Me.txtRev_QuebraTotal.Text = varVlr.ToString("n0")

        'Frota -> pelo Percentual
        varVlr = 0
        varVlr = CDbl(((varVendaRevista * Me.txtRev_FrotaP.Text) / 100))
        Me.txtRev_Frota.Text = varVlr.ToString("n0")

        'Contrato de Logistica -> pelo Percentual
        varVlr = 0
        varVlr = CDbl(((varVendaRevista * Me.txtRev_RecContrLogisticaP.Text) / 100))
        Me.txtRev_RecContrLogistica.Text = varVlr.ToString("n0")

        'Embalagens - Uso e Consumo -> pelo Percentual
        varVlr = 0
        varVlr = CDbl(((varVendaRevista * Me.txtRev_EmbUsoConsumoP.Text) / 100))
        Me.txtRev_EmbUsoConsumo.Text = varVlr.ToString("n0")

        'Embalagens - Produtos -> pelo Percentual
        varVlr = 0
        varVlr = CDbl(((varVendaRevista * Me.txtRev_EmbProdutosP.Text) / 100))
        Me.txtRev_EmbProdutos.Text = varVlr.ToString("n0")

        'Uso e Consumo -> pelo Percentual
        varVlr = 0
        varVlr = CDbl(((varVendaRevista * Me.txtRev_UsoConsumoP.Text) / 100))
        Me.txtRev_UsoConsumo.Text = varVlr.ToString("n0")

        'Propaganda -> pelo Percentual
        varVlr = 0
        varVlr = CDbl(((varVendaRevista * Me.txtRev_PropagandaP.Text) / 100))
        Me.txtRev_Propaganda.Text = varVlr.ToString("n0")

        '(-) Verbas Promocionais -> pelo Percentual
        varVlr = 0
        varVlr = CDbl(((varVendaRevista * Me.txtRev_VerbasPromocionaisP.Text) / 100))
        Me.txtRev_VerbasPromocionais.Text = varVlr.ToString("n0")

        'Aluguel -> pelo Percentual
        varVlr = 0
        varVlr = CDbl(((varVendaRevista * Me.txtRev_AluguelP.Text) / 100))
        Me.txtRev_Aluguel.Text = varVlr.ToString("n0")

        'Comissões Financeiras -> pelo Percentual
        varVlr = 0
        varVlr = CDbl(((varVendaRevista * Me.txtRev_ComissoesP.Text) / 100))
        Me.txtRev_Comissoes.Text = varVlr.ToString("n0")

        'Leasing
        varVlr = 0
        varVlr = CDbl(((varVendaRevista * Me.txtRev_LeasingP.Text) / 100))
        Me.txtRev_Leasing.Text = varVlr.ToString("n0")

        'Outras Receitas
        varVlr = 0
        varVlr = CDbl(((varVendaRevista * Me.txtRev_OutrasReceitasP.Text) / 100))
        Me.txtRev_OutrasReceitas.Text = varVlr.ToString("n0")

        'Rateio de Despesa
        varVlr = 0
        varVlr = CDbl(((varVendaRevista * Me.txtRev_RateioP.Text) / 100))
        Me.txtRev_Rateio.Text = varVlr.ToString("n0")

        'Inadimplência
        varVlr = 0
        varVlr = CDbl(((varVendaRevista * Me.txtRev_InadimplentesP.Text) / 100))
        Me.txtRev_Inadimplentes.Text = varVlr.ToString("n0")

        'Receita Comercial
        varVlr = 0
        varVlr = CDbl(((varVendaRevista * Me.txtRev_ReceitaComercialP.Text) / 100))
        Me.txtRev_ReceitaComercial.Text = varVlr.ToString("n0")

        '************************ Muda PERCENTUAL em função do valor Fixo ************************************
        'Pessoal
        varVlr = 0
        varVlr = CDbl(((Me.txtRev_Pessoal.Text / varVendaRevista) * 100))
        Me.txtRev_PessoalP.Text = varVlr.ToString("n2")

        'Honorários Profissionais
        varVlr = 0
        varVlr = CDbl(((Me.txtRev_Honorarios.Text / varVendaRevista) * 100))
        Me.txtRev_HonorariosP.Text = varVlr.ToString("n2")

        'Informática
        varVlr = 0
        varVlr = CDbl(((Me.txtRev_Informatica.Text / varVendaRevista) * 100))
        Me.txtRev_InformaticaP.Text = varVlr.ToString("n2")

        'Manutenção
        varVlr = 0
        varVlr = CDbl(((Me.txtRev_Manutencao.Text / varVendaRevista) * 100))
        Me.txtRev_ManutencaoP.Text = varVlr.ToString("n2")

        'Propaganda Gasto pelas lojas
        varVlr = 0
        varVlr = CDbl(((Me.txtRev_PropGastoLojas.Text / varVendaRevista) * 100))
        Me.txtRev_PropGastoLojasP.Text = varVlr.ToString("n2")

        'Serviços Públicos
        varVlr = 0
        varVlr = CDbl(((Me.txtRev_ServicoPublicos.Text / varVendaRevista) * 100))
        Me.txtRev_ServicoPublicosP.Text = varVlr.ToString("n2")

        'Segurança
        varVlr = 0
        varVlr = CDbl(((Me.txtRev_Seguranca.Text / varVendaRevista) * 100))
        Me.txtRev_SegurancaP.Text = varVlr.ToString("n2")

        'Despesas Bancarias
        varVlr = 0
        varVlr = CDbl(((Me.txtRev_DespBancarias.Text / varVendaRevista) * 100))
        Me.txtRev_DespBancariasP.Text = varVlr.ToString("n2")

        'Diversas
        varVlr = 0
        varVlr = CDbl(((Me.txtRev_Diversas.Text / varVendaRevista) * 100))
        Me.txtRev_DiversasP.Text = varVlr.ToString("n2")

        'Viagens e transportes de funcionários
        varVlr = 0
        varVlr = CDbl(((Me.txtRev_Viagens.Text / varVendaRevista) * 100))
        Me.txtRev_ViagensP.Text = varVlr.ToString("n2")

        'Sócios
        varVlr = 0
        varVlr = CDbl(((Me.txtRev_Socios.Text / varVendaRevista) * 100))
        Me.txtRev_SociosP.Text = varVlr.ToString("n2")

        'Depreciação -> pelo Valor
        varVlr = 0
        varVlr = CDbl(((Me.txtRev_Depreciacao.Text / varVendaRevista) * 100))
        Me.txtRev_DepreciacaoP.Text = varVlr.ToString("n2")

        'Provisão de Créditos -> pelo Valor
        varVlr = 0
        varVlr = CDbl(((Me.txtRev_ProvisaoCredito.Text / varVendaRevista) * 100))
        Me.txtRev_ProvisaoCreditoP.Text = varVlr.ToString("n2")

        'Financeiro da Loja -> pelo Valor
        varVlr = 0
        varVlr = CDbl(((Me.txtRev_ResFinLoja.Text / varVendaRevista) * 100))
        Me.txtRev_ResFinLojaP.Text = varVlr.ToString("n2")

        'Financeiro da CD -> pelo Valor
        varVlr = 0
        varVlr = CDbl(((Me.txtRev_ResFinCD.Text / varVendaRevista) * 100))
        Me.txtRev_ResFinCDP.Text = varVlr.ToString("n2")

        'Tributos e Multas -> pelo Valor
        varVlr = 0
        varVlr = CDbl(((Me.txtRev_Tributos.Text / varVendaRevista) * 100))
        Me.txtRev_TributosP.Text = varVlr.ToString("n2")

        'Despesas Judicias e Acordos -> pelo Valor
        varVlr = 0
        varVlr = CDbl(((Me.txtRev_DespJudiciais.Text / varVendaRevista) * 100))
        Me.txtRev_DespJudiciaisP.Text = varVlr.ToString("n2")

        Call CalcularDespesa_Revista(varVendaRevista)

        Call CalcularResultadoOperacional_Revista(varVendaRevista)

        Call CalcularResultadoAntesIR_Revista(varVendaRevista)

    End Sub

    Private Sub CalcularVendaLiquida_Revista(ByVal iVenda As Double, ByVal iImposto As Double)
        Me.txtRev_VendaLiquida.Text = CDbl((iVenda - iImposto)).ToString("n0")
        Me.txtRev_VendaLiquidaP.Text = CDbl(((Me.txtRev_VendaLiquida.Text / iVenda) * 100)).ToString("n2")
        Call CalcularMargemOperacional_Revista(iVenda)
    End Sub


    Private Sub CalcularCMV_Revista(ByVal iVenda As Double)

        Me.txtRev_CMV.Text = (CDbl(Me.txtRev_VendaLiquida.Text) - CDbl(Me.txtRev_MargemTeórica.Text) + CDbl(Me.txtRev_QuebraTotal.Text)).ToString("n0")
        Me.txtRev_CMVP.Text = CDbl(((Me.txtRev_CMV.Text / iVenda) * 100)).ToString("n2")
        Call CalcularMargemOperacional_Revista(iVenda)
    End Sub

    Private Sub CalcularOperacaoComercial_Revista(ByVal iVenda As Double)

        Me.txtRev_OperacoesComerciais.Text = (CDbl(Me.txtRev_Bonificacao.Text) + CDbl(Me.txtRev_BonificacaoCD.Text) + CDbl(Me.txtRev_Contratos.Text) _
                                + CDbl(Me.txtRev_CondicaoEspecial.Text) + CDbl(Me.txtRev_CondicaoEspecialCD.Text) _
                                + CDbl(Me.txtRev_PontaDeGondola.Text) + CDbl(Me.txtRev_Marketing.Text) + CDbl(Me.txtRev_Sell.Text)).ToString("n0")

        Me.txtRev_OperacoesComerciaisP.Text = CDbl(((Me.txtRev_OperacoesComerciais.Text / iVenda) * 100)).ToString("n2")
        Call CalcularMargemOperacional_Revista(iVenda)
    End Sub

    Private Sub CalcularMargemOperacional_Revista(ByVal iVenda As Double)

        Me.txtRev_MargemOperacional.Text = (CDbl(Me.txtRev_VendaLiquida.Text) - CDbl(txtRev_CMV.Text) + CDbl(txtRev_OperacoesComerciais.Text)).ToString("n0")
        Me.txtRev_MargemOperacionalP.Text = CDbl(((Me.txtRev_MargemOperacional.Text / iVenda) * 100)).ToString("n2")
        Call CalcularResultadoOperacional_Revista(iVenda)
    End Sub

    Private Sub CalcularDespesa_Revista(ByVal iVenda As Double)

        Me.txtRev_Despesas.Text = (CDbl(Me.txtRev_Pessoal.Text) + CDbl(Me.txtRev_Honorarios.Text) + CDbl(Me.txtRev_Informatica.Text) _
                                 + CDbl(Me.txtRev_Manutencao.Text) + CDbl(Me.txtRev_Frota.Text) + CDbl(Me.txtRev_RecContrLogistica.Text) _
                                 + CDbl(Me.txtRev_EmbUsoConsumo.Text) + CDbl(Me.txtRev_EmbProdutos.Text) + CDbl(Me.txtRev_UsoConsumo.Text) _
                                 + CDbl(Me.txtRev_Propaganda.Text) + CDbl(Me.txtRev_VerbasPromocionais.Text) + CDbl(Me.txtRev_PropGastoLojas.Text) _
                                 + CDbl(Me.txtRev_ServicoPublicos.Text) + CDbl(Me.txtRev_Aluguel.Text) + CDbl(Me.txtRev_Seguranca.Text) _
                                 + CDbl(Me.txtRev_Tributos.Text) + CDbl(Me.txtRev_Inadimplentes.Text) + CDbl(Me.txtRev_DespBancarias.Text) _
                                 + CDbl(Me.txtRev_Comissoes.Text) + CDbl(Me.txtRev_Diversas.Text) + CDbl(Me.txtRev_Viagens.Text) _
                                 + CDbl(Me.txtRev_DespJudiciais.Text) + CDbl(Me.txtRev_Leasing.Text) + CDbl(Me.txtRev_Depreciacao.Text) _
                                 + CDbl(Me.txtRev_Socios.Text) + CDbl(Me.txtRev_Rateio.Text) + CDbl(Me.txtRev_PLR.Text)).ToString("n0")
        Me.txtRev_DespesasP.Text = CDbl(((Me.txtRev_Despesas.Text / iVenda) * 100)).ToString("n2")

        Call CalcularResultadoOperacional_Revista(iVenda)

    End Sub

    Private Sub CalcularResultadoOperacional_Revista(ByVal iVenda As Double)

        Me.txtRev_ResultaoOperacional.Text = (CDbl(Me.txtRev_MargemOperacional.Text) - CDbl(Me.txtRev_Despesas.Text) + CDbl(Me.txtRev_OutrasReceitas.Text)).ToString("n0")
        Me.txtRev_ResultaoOperacionalP.Text = CDbl(((Me.txtRev_ResultaoOperacional.Text / iVenda) * 100)).ToString("n2")
        Call CalcularResultadoAntesIR_Revista(iVenda)
    End Sub

    Private Sub CalcularResultadoAntesIR_Revista(ByVal iVenda As Double)
        Me.txtRev_ResAntesIR.Text = (CDbl(Me.txtRev_ResultaoOperacional.Text) + CDbl(Me.txtRev_ProvisaoCredito.Text) + CDbl(Me.txtRev_ReceitaComercial.Text) + CDbl(Me.txtRev_ResFin.Text)).ToString("n0")
        Me.txtRev_ResAntesIRP.Text = CDbl(((Me.txtRev_ResAntesIR.Text / iVenda) * 100)).ToString("n2")
        Call CalcularResultadoFinal_Revista(iVenda)
    End Sub

    Private Sub CalcularResultadoFinal_Revista(ByVal iVenda As Double)

        If Me.txtRev_ResAntesIR.Text > 0 Then
            Me.txtRev_ProvIR.Text = ((CDbl(Me.txtRev_ResAntesIR.Text) * 34) / 100).ToString("n0")
            Me.txtRev_ResFinal.Text = (CDbl(Me.txtRev_ResAntesIR.Text) - CDbl(Me.txtRev_ProvIR.Text)).ToString("n0")
            Me.txtRev_ResFinalP.Text = CDbl(((Me.txtRev_ResFinal.Text / iVenda) * 100)).ToString("n2")
        Else
            Me.txtRev_ProvIR.Text = 0
            Me.txtRev_ResFinal.Text = Me.txtRev_ResAntesIR.Text
            Me.txtRev_ResFinalP.Text = Me.txtRev_ResAntesIRP.Text
        End If
        Call FormatarNegativo()
    End Sub

    Protected Sub txtRev_MargemTeóricaP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_MargemTeóricaP.TextChanged
        Me.txtRev_MargemTeórica.Text = CDbl(Me.txtRev_Venda.Text * CDbl(Me.txtRev_MargemTeóricaP.Text) / 100).ToString("n0")
        Me.txtRev_MargemTeóricaP.Text = CDbl(Me.txtRev_MargemTeóricaP.Text * 1).ToString("n2")
        Call CalcularCMV_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_BonificacaoP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_BonificacaoP.TextChanged
        Me.txtRev_Bonificacao.Text = CDbl(Me.txtRev_Venda.Text * CDbl(Me.txtRev_BonificacaoP.Text) / 100).ToString("n0")
        Me.txtRev_BonificacaoP.Text = CDbl(Me.txtRev_BonificacaoP.Text * 1).ToString("n2")
        Call CalcularOperacaoComercial_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_CondicaoEspecialP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_CondicaoEspecialP.TextChanged
        Me.txtRev_CondicaoEspecial.Text = CDbl(Me.txtRev_Venda.Text * CDbl(Me.txtRev_CondicaoEspecialP.Text) / 100).ToString("n0")
        Me.txtRev_CondicaoEspecialP.Text = CDbl(Me.txtRev_CondicaoEspecialP.Text * 1).ToString("n2")
        Call CalcularOperacaoComercial_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_PontaDeGondolaP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_PontaDeGondolaP.TextChanged
        Me.txtRev_PontaDeGondola.Text = CDbl(Me.txtRev_Venda.Text * CDbl(Me.txtRev_PontaDeGondolaP.Text) / 100).ToString("n0")
        Me.txtRev_PontaDeGondolaP.Text = CDbl(Me.txtRev_PontaDeGondolaP.Text * 1).ToString("n2")
        Call CalcularOperacaoComercial_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_Bonificacao_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_Bonificacao.TextChanged
        Me.txtRev_BonificacaoP.Text = CDbl(CDbl(Me.txtRev_Bonificacao.Text) / CDbl(Me.txtRev_Venda.Text) * 100).ToString("n2")
        Me.txtRev_Bonificacao.Text = CDbl(Me.txtRev_Bonificacao.Text * 1).ToString("n0")
        Me.txtRev_BonificacaoP.Text = CDbl(Me.txtRev_BonificacaoP.Text * 1).ToString("n2")
        Call CalcularOperacaoComercial_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_CondicaoEspecial_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_CondicaoEspecial.TextChanged
        Me.txtRev_CondicaoEspecialP.Text = CDbl(CDbl(Me.txtRev_CondicaoEspecial.Text) / CDbl(Me.txtRev_Venda.Text) * 100).ToString("n2")
        Me.txtRev_CondicaoEspecial.Text = CDbl(Me.txtRev_CondicaoEspecial.Text * 1).ToString("n0")
        Me.txtRev_CondicaoEspecialP.Text = CDbl(Me.txtRev_CondicaoEspecialP.Text * 1).ToString("n2")
        Call CalcularOperacaoComercial_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_PontaDeGondola_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_PontaDeGondola.TextChanged
        Me.txtRev_PontaDeGondolaP.Text = CDbl(((Me.txtRev_PontaDeGondola.Text / Me.txtRev_Venda.Text) * 100)).ToString("n2")
        Me.txtRev_PontaDeGondola.Text = CDbl(Me.txtRev_PontaDeGondola.Text * 1).ToString("n0")
        Me.txtRev_PontaDeGondolaP.Text = CDbl(Me.txtRev_PontaDeGondolaP.Text * 1).ToString("n2")
        Call CalcularOperacaoComercial_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_Pessoal_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_Pessoal.TextChanged
        Me.txtRev_PessoalP.Text = CDbl(CDbl(Me.txtRev_Pessoal.Text) / CDbl(Me.txtRev_Venda.Text) * 100).ToString("n2")
        Me.txtRev_Pessoal.Text = CDbl(Me.txtRev_Pessoal.Text * 1).ToString("n0")
        Me.txtRev_PessoalP.Text = CDbl(Me.txtRev_PessoalP.Text * 1).ToString("n2")
        Call CalcularDespesa_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_Honorarios_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_Honorarios.TextChanged
        Me.txtRev_HonorariosP.Text = CDbl(CDbl(Me.txtRev_Honorarios.Text) / CDbl(Me.txtRev_Venda.Text) * 100).ToString("n2")
        Me.txtRev_Honorarios.Text = CDbl(Me.txtRev_Honorarios.Text * 1).ToString("n0")
        Me.txtRev_HonorariosP.Text = CDbl(Me.txtRev_HonorariosP.Text * 1).ToString("n2")
        Call CalcularDespesa_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_Manutencao_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_Manutencao.TextChanged
        Me.txtRev_ManutencaoP.Text = CDbl(CDbl(Me.txtRev_Manutencao.Text) / CDbl(Me.txtRev_Venda.Text) * 100).ToString("n2")
        Me.txtRev_Manutencao.Text = CDbl(Me.txtRev_Manutencao.Text * 1).ToString("n0")
        Me.txtRev_ManutencaoP.Text = CDbl(Me.txtRev_ManutencaoP.Text * 1).ToString("n2")
        Call CalcularDespesa_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_Frota_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_Frota.TextChanged
        Me.txtRev_FrotaP.Text = CDbl(CDbl(Me.txtRev_Frota.Text) / CDbl(Me.txtRev_Venda.Text) * 100).ToString("n2")
        Me.txtRev_Frota.Text = CDbl(Me.txtRev_Frota.Text * 1).ToString("n0")
        Me.txtRev_FrotaP.Text = CDbl(Me.txtRev_FrotaP.Text * 1).ToString("n2")
        Call CalcularDespesa_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_EmbUsoConsumo_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_EmbUsoConsumo.TextChanged
        Me.txtRev_EmbUsoConsumoP.Text = CDbl(CDbl(Me.txtRev_EmbUsoConsumo.Text) / CDbl(Me.txtRev_Venda.Text) * 100).ToString("n2")
        Me.txtRev_EmbUsoConsumo.Text = CDbl(Me.txtRev_EmbUsoConsumo.Text * 1).ToString("n0")
        Me.txtRev_EmbUsoConsumoP.Text = CDbl(Me.txtRev_EmbUsoConsumoP.Text * 1).ToString("n2")
        Call CalcularDespesa_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_EmbProdutos_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_EmbProdutos.TextChanged
        Me.txtRev_EmbProdutosP.Text = CDbl(CDbl(Me.txtRev_EmbProdutos.Text) / CDbl(Me.txtRev_Venda.Text) * 100).ToString("n2")
        Me.txtRev_EmbProdutos.Text = CDbl(Me.txtRev_EmbProdutos.Text * 1).ToString("n0")
        Me.txtRev_EmbProdutosP.Text = CDbl(Me.txtRev_EmbProdutosP.Text * 1).ToString("n2")
        Call CalcularDespesa_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_UsoConsumo_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_UsoConsumo.TextChanged
        Me.txtRev_UsoConsumoP.Text = CDbl(CDbl(Me.txtRev_UsoConsumo.Text) / CDbl(Me.txtRev_Venda.Text) * 100).ToString("n2")
        Me.txtRev_UsoConsumo.Text = CDbl(Me.txtRev_UsoConsumo.Text * 1).ToString("n0")
        Me.txtRev_UsoConsumoP.Text = CDbl(Me.txtRev_UsoConsumoP.Text * 1).ToString("n2")
        Call CalcularDespesa_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_PropGastoLojas_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_PropGastoLojas.TextChanged
        Me.txtRev_PropGastoLojasP.Text = CDbl(CDbl(Me.txtRev_PropGastoLojas.Text) / CDbl(Me.txtRev_Venda.Text) * 100).ToString("n2")
        Me.txtRev_PropGastoLojas.Text = CDbl(Me.txtRev_PropGastoLojas.Text * 1).ToString("n0")
        Me.txtRev_PropGastoLojasP.Text = CDbl(Me.txtRev_PropGastoLojasP.Text * 1).ToString("n2")
        Call CalcularDespesa_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_ServicoPublicos_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_ServicoPublicos.TextChanged
        Me.txtRev_ServicoPublicosP.Text = CDbl(CDbl(Me.txtRev_ServicoPublicos.Text) / CDbl(Me.txtRev_Venda.Text) * 100).ToString("n2")
        Me.txtRev_ServicoPublicos.Text = CDbl(Me.txtRev_ServicoPublicos.Text * 1).ToString("n0")
        Me.txtRev_ServicoPublicosP.Text = CDbl(Me.txtRev_ServicoPublicosP.Text * 1).ToString("n2")
        Call CalcularDespesa_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_Seguranca_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_Seguranca.TextChanged
        Me.txtRev_SegurancaP.Text = CDbl(CDbl(Me.txtRev_Seguranca.Text) / CDbl(Me.txtRev_Venda.Text) * 100).ToString("n2")
        Me.txtRev_Seguranca.Text = CDbl(Me.txtRev_Seguranca.Text * 1).ToString("n0")
        Me.txtRev_SegurancaP.Text = CDbl(Me.txtRev_SegurancaP.Text * 1).ToString("n2")
        Call CalcularDespesa_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_Inadimplentes_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_Inadimplentes.TextChanged
        Me.txtRev_InadimplentesP.Text = CDbl(CDbl(Me.txtRev_Inadimplentes.Text) / CDbl(Me.txtRev_Venda.Text) * 100).ToString("n2")
        Me.txtRev_Inadimplentes.Text = CDbl(Me.txtRev_Inadimplentes.Text * 1).ToString("n0")
        Me.txtRev_InadimplentesP.Text = CDbl(Me.txtRev_InadimplentesP.Text * 1).ToString("n2")
        Call CalcularDespesa_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_DespBancarias_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_DespBancarias.TextChanged
        Me.txtRev_DespBancariasP.Text = CDbl(CDbl(Me.txtRev_DespBancarias.Text) / CDbl(Me.txtRev_Venda.Text) * 100).ToString("n2")
        Me.txtRev_DespBancarias.Text = CDbl(Me.txtRev_DespBancarias.Text * 1).ToString("n0")
        Me.txtRev_DespBancariasP.Text = CDbl(Me.txtRev_DespBancariasP.Text * 1).ToString("n2")
        Call CalcularDespesa_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_Diversas_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_Diversas.TextChanged
        Me.txtRev_DiversasP.Text = CDbl(CDbl(Me.txtRev_Diversas.Text) / CDbl(Me.txtRev_Venda.Text) * 100).ToString("n2")
        Me.txtRev_Diversas.Text = CDbl(Me.txtRev_Diversas.Text * 1).ToString("n0")
        Me.txtRev_DiversasP.Text = CDbl(Me.txtRev_DiversasP.Text * 1).ToString("n2")
        Call CalcularDespesa_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_Viagens_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_Viagens.TextChanged
        Me.txtRev_ViagensP.Text = CDbl(CDbl(Me.txtRev_Viagens.Text) / CDbl(Me.txtRev_Venda.Text) * 100).ToString("n2")
        Me.txtRev_Viagens.Text = CDbl(Me.txtRev_Viagens.Text * 1).ToString("n0")
        Me.txtRev_ViagensP.Text = CDbl(Me.txtRev_ViagensP.Text * 1).ToString("n2")
        Call CalcularDespesa_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_Leasing_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_Leasing.TextChanged
        Me.txtRev_LeasingP.Text = CDbl(CDbl(Me.txtRev_Leasing.Text) / CDbl(Me.txtRev_Venda.Text) * 100).ToString("n2")
        Me.txtRev_Leasing.Text = CDbl(Me.txtRev_Leasing.Text * 1).ToString("n0")
        Me.txtRev_LeasingP.Text = CDbl(Me.txtRev_LeasingP.Text * 1).ToString("n2")
        Call CalcularDespesa_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_Informatica_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_Informatica.TextChanged
        Me.txtRev_InformaticaP.Text = CDbl(CDbl(Me.txtRev_Informatica.Text) / CDbl(Me.txtRev_Venda.Text) * 100).ToString("n2")
        Me.txtRev_Informatica.Text = CDbl(Me.txtRev_Informatica.Text * 1).ToString("n0")
        Me.txtRev_InformaticaP.Text = CDbl(Me.txtRev_InformaticaP.Text * 1).ToString("n2")
        Call CalcularDespesa_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_PessoalP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_PessoalP.TextChanged
        Me.txtRev_Pessoal.Text = CDbl(Me.txtRev_Venda.Text * CDbl(Me.txtRev_PessoalP.Text) / 100).ToString("n0")
        Me.txtRev_PessoalP.Text = CDbl(Me.txtRev_PessoalP.Text * 1).ToString("n2")
        Call CalcularDespesa_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_HonorariosP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_HonorariosP.TextChanged
        Me.txtRev_Honorarios.Text = CDbl(Me.txtRev_Venda.Text * CDbl(Me.txtRev_HonorariosP.Text) / 100).ToString("n0")
        Me.txtRev_HonorariosP.Text = CDbl(Me.txtRev_HonorariosP.Text * 1).ToString("n2")
        Call CalcularDespesa_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_InformaticaP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_InformaticaP.TextChanged
        Me.txtRev_Informatica.Text = CDbl(Me.txtRev_Venda.Text * CDbl(Me.txtRev_InformaticaP.Text) / 100).ToString("n0")
        Me.txtRev_InformaticaP.Text = CDbl(Me.txtRev_InformaticaP.Text * 1).ToString("n2")
        Call CalcularDespesa_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_ManutencaoP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_ManutencaoP.TextChanged
        Me.txtRev_Manutencao.Text = CDbl(Me.txtRev_Venda.Text * CDbl(Me.txtRev_ManutencaoP.Text) / 100).ToString("n0")
        Me.txtRev_ManutencaoP.Text = CDbl(Me.txtRev_ManutencaoP.Text * 1).ToString("n2")
        Call CalcularDespesa_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_FrotaP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_FrotaP.TextChanged
        Me.txtRev_Frota.Text = CDbl(Me.txtRev_Venda.Text * CDbl(Me.txtRev_FrotaP.Text) / 100).ToString("n0")
        Me.txtRev_FrotaP.Text = CDbl(Me.txtRev_FrotaP.Text * 1).ToString("n2")
        Call CalcularDespesa_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_EmbUsoConsumoP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_EmbUsoConsumoP.TextChanged
        Me.txtRev_EmbUsoConsumo.Text = CDbl(Me.txtRev_Venda.Text * CDbl(Me.txtRev_EmbUsoConsumoP.Text) / 100).ToString("n0")
        Me.txtRev_EmbUsoConsumoP.Text = CDbl(Me.txtRev_EmbUsoConsumoP.Text * 1).ToString("n2")
        Call CalcularDespesa_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_EmbProdutosP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_EmbProdutosP.TextChanged
        Me.txtRev_EmbProdutos.Text = CDbl(Me.txtRev_Venda.Text * CDbl(Me.txtRev_EmbProdutosP.Text) / 100).ToString("n0")
        Me.txtRev_EmbProdutosP.Text = CDbl(Me.txtRev_EmbProdutosP.Text * 1).ToString("n2")
        Call CalcularDespesa_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_UsoConsumoP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_UsoConsumoP.TextChanged
        Me.txtRev_UsoConsumo.Text = CDbl(Me.txtRev_Venda.Text * CDbl(Me.txtRev_UsoConsumoP.Text) / 100).ToString("n0")
        Me.txtRev_UsoConsumoP.Text = CDbl(Me.txtRev_UsoConsumoP.Text * 1).ToString("n2")
        Call CalcularDespesa_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_PropGastoLojasP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_PropGastoLojasP.TextChanged
        Me.txtRev_PropGastoLojas.Text = CDbl(Me.txtRev_Venda.Text * CDbl(Me.txtRev_PropGastoLojasP.Text) / 100).ToString("n0")
        Me.txtRev_PropGastoLojasP.Text = CDbl(Me.txtRev_PropGastoLojasP.Text * 1).ToString("n2")
        Call CalcularDespesa_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_ServicoPublicosP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_ServicoPublicosP.TextChanged
        Me.txtRev_ServicoPublicos.Text = CDbl(Me.txtRev_Venda.Text * CDbl(Me.txtRev_ServicoPublicosP.Text) / 100).ToString("n0")
        Me.txtRev_ServicoPublicosP.Text = CDbl(Me.txtRev_ServicoPublicosP.Text * 1).ToString("n2")
        Call CalcularDespesa_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_SegurancaP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_SegurancaP.TextChanged
        Me.txtRev_Seguranca.Text = CDbl(Me.txtRev_Venda.Text * CDbl(Me.txtRev_SegurancaP.Text) / 100).ToString("n0")
        Me.txtRev_SegurancaP.Text = CDbl(Me.txtRev_SegurancaP.Text * 1).ToString("n2")
        Call CalcularDespesa_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_InadimplentesP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_InadimplentesP.TextChanged
        Me.txtRev_Inadimplentes.Text = CDbl(Me.txtRev_Venda.Text * CDbl(Me.txtRev_InadimplentesP.Text) / 100).ToString("n0")
        Me.txtRev_InadimplentesP.Text = CDbl(Me.txtRev_InadimplentesP.Text * 1).ToString("n2")
        Call CalcularDespesa_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_DespBancariasP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_DespBancariasP.TextChanged
        Me.txtRev_DespBancarias.Text = CDbl(Me.txtRev_Venda.Text * CDbl(Me.txtRev_DespBancariasP.Text) / 100).ToString("n0")
        Me.txtRev_DespBancariasP.Text = CDbl(Me.txtRev_DespBancariasP.Text * 1).ToString("n2")
        Call CalcularDespesa_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_DiversasP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_DiversasP.TextChanged
        Me.txtRev_Diversas.Text = CDbl(Me.txtRev_Venda.Text * CDbl(Me.txtRev_DiversasP.Text) / 100).ToString("n0")
        Me.txtRev_DiversasP.Text = CDbl(Me.txtRev_DiversasP.Text * 1).ToString("n2")
        Call CalcularDespesa_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_ViagensP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_ViagensP.TextChanged
        Me.txtRev_Viagens.Text = CDbl(Me.txtRev_Venda.Text * CDbl(Me.txtRev_ViagensP.Text) / 100).ToString("n0")
        Me.txtRev_ViagensP.Text = CDbl(Me.txtRev_ViagensP.Text * 1).ToString("n2")
        Call CalcularDespesa_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_LeasingP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_LeasingP.TextChanged
        Me.txtRev_Leasing.Text = CDbl(Me.txtRev_Venda.Text * CDbl(Me.txtRev_LeasingP.Text) / 100).ToString("n0")
        Me.txtRev_LeasingP.Text = CDbl(Me.txtRev_LeasingP.Text * 1).ToString("n2")
        Call CalcularDespesa_Revista(Me.txtRev_Venda.Text)
    End Sub

    Sub FormatarNegativo()
        ' ************************* ORIGINAL  ******************************************
        Call FormataNegativo_Label(Me.lblOri_ResultaoOperacional, Me.lblOri_ResultaoOperacionalP)   'Resultado Operacional  
        Call FormataNegativo_Label(Me.lblOri_ResFin, Me.lblOri_ResFinP) 'Resultado Financeiro - Total  
        Call FormataNegativo_Label(Me.lblOri_ResFinLoja, Me.lblOri_ResFinLojaP) 'Resultado Financeiro - Loja  
        Call FormataNegativo_Label(Me.lblOri_ResFinCD, Me.lblOri_ResFinCDP) 'Resultado Financeiro - CD
        Call FormataNegativo_Label(Me.lblOri_ResAntesIR, Me.lblOri_ResAntesIRP) ' 'Resultado Antes IR    
        Call FormataNegativo_Label(Me.lblOri_ResFinal, Me.lblOri_ResFinalP)  'Resultado Final
        Call FormataNegativo_Label(Me.lblOri_ResFinal, Me.lblOri_ResFinalP)
        Call FormataNegativo_Label(Me.lblOri_ProvisaoCredito, Me.lblOri_ProvisaoCreditoP)   'Provisão de Crédito
        Call FormataNegativo_Label(Me.lblOri_VerbasPromocionais, Me.lblOri_VerbasPromocionaisP)   'Provisão de Crédito
        Call FormataNegativo_Label(Me.lblOri_RecContrLogistica, Me.lblOri_RecContrLogisticaP)   'Recuperação de Contratos de Logistica

        ' ************************* REVISTA  ******************************************       
        Call FormataNegativo_Label(Me.txtRev_ResultaoOperacional, Me.txtRev_ResultaoOperacionalP)   'Resultado Operacional    
        Call FormataNegativo_Label(Me.txtRev_ResultaoOperacional, Me.txtRev_ResultaoOperacionalP)   'Resultado Operacional    
        Call FormataNegativo_Label(Me.txtRev_ResFin, Me.txtRev_ResFinP) 'Resultado Financeiro - Total     
        Call FormataNegativo_Text(Me.txtRev_ResFinLoja, Me.txtRev_ResFinLojaP)  'Resultado Financeiro - Loja
        Call FormataNegativo_Text(Me.txtRev_ResFinCD, Me.txtRev_ResFinCDP)  'Resultado Financeiro - CD
        Call FormataNegativo_Label(Me.txtRev_ResAntesIR, Me.txtRev_ResAntesIR)  'Resultado Antes IR
        Call FormataNegativo_Text(Me.txtRev_ResFinal, Me.txtRev_ResFinalP)  'Resultado Final  
        Call FormataNegativo_Text(Me.txtRev_VerbasPromocionais, Me.txtRev_VerbasPromocionaisP)  'Verbas Promocionais 
        Call FormataNegativo_Text(Me.txtRev_RecContrLogistica, Me.txtRev_RecContrLogisticaP)  'Recuperação de Contratos de Logistica 
        Call FormataNegativo_Text(Me.txtRev_ProvisaoCredito, txtRev_ProvisaoCreditoP)

    End Sub

    Private Sub FormataNegativo_Label(iVlr As Label, iPerc As Label)
        On Error Resume Next
        If CDbl(iVlr.Text) < 0 Then
            iVlr.ForeColor = Drawing.Color.Red
            iPerc.ForeColor = Drawing.Color.Red
        Else
            iVlr.ForeColor = Drawing.Color.Black
            iPerc.ForeColor = Drawing.Color.Black
        End If
    End Sub

    Private Sub FormataNegativo_Text(iVlr As TextBox, iPerc As TextBox)
        On Error Resume Next
        If CDbl(iVlr.Text) < 0 Then
            iVlr.ForeColor = Drawing.Color.Red
            iPerc.ForeColor = Drawing.Color.Red
        Else
            iVlr.ForeColor = Drawing.Color.Black
            iPerc.ForeColor = Drawing.Color.Black
        End If
    End Sub

    Protected Sub txtRev_OutrasReceitas_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_OutrasReceitas.TextChanged
        Me.txtRev_OutrasReceitasP.Text = CDbl(CDbl(Me.txtRev_OutrasReceitas.Text) / CDbl(Me.txtRev_Venda.Text) * 100).ToString("n2")
        Me.txtRev_OutrasReceitas.Text = CDbl(Me.txtRev_OutrasReceitas.Text * 1).ToString("n0")
        Me.txtRev_OutrasReceitasP.Text = CDbl(Me.txtRev_OutrasReceitasP.Text * 1).ToString("n2")
        Call CalcularResultadoOperacional_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_OutrasReceitasP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_OutrasReceitasP.TextChanged
        Me.txtRev_OutrasReceitas.Text = CDbl(Me.txtRev_Venda.Text * CDbl(Me.txtRev_OutrasReceitasP.Text) / 100).ToString("n0")
        Me.txtRev_OutrasReceitasP.Text = CDbl(Me.txtRev_OutrasReceitasP.Text * 1).ToString("n2")
        Call CalcularResultadoOperacional_Revista(Me.txtRev_Venda.Text)
    End Sub


    Protected Sub txtRev_Venda_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_Venda.TextChanged
        Call CalcularDadosFixoComBaseVenda()
    End Sub

    Protected Sub txtRev_Sell_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_Sell.TextChanged
        Me.txtRev_SellP.Text = CDbl(((Me.txtRev_Sell.Text / Me.txtRev_Venda.Text) * 100)).ToString("n2")
        Me.txtRev_Sell.Text = CDbl(Me.txtRev_Sell.Text * 1).ToString("n0")
        Me.txtRev_SellP.Text = CDbl(Me.txtRev_SellP.Text * 1).ToString("n2")
        Call CalcularOperacaoComercial_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_SellP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_SellP.TextChanged
        Me.txtRev_Sell.Text = CDbl(Me.txtRev_Venda.Text * CDbl(Me.txtRev_SellP.Text) / 100).ToString("n0")
        Me.txtRev_SellP.Text = CDbl(Me.txtRev_SellP.Text * 1).ToString("n2")
        Call CalcularOperacaoComercial_Revista(Me.txtRev_Venda.Text)
    End Sub





    Protected Sub txtRev_ProvisaoCreditoP_TextChanged(sender As Object, e As EventArgs) Handles txtRev_ProvisaoCreditoP.TextChanged
        Me.txtRev_ProvisaoCredito.Text = CDbl(Me.txtRev_Venda.Text * CDbl(Me.txtRev_ProvisaoCreditoP.Text) / 100).ToString("n0")
        Me.txtRev_ProvisaoCreditoP.Text = CDbl(Me.txtRev_ProvisaoCreditoP.Text * 1).ToString("n2")
        Call CalcularResultadoAntesIR_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_ResFinCDP_TextChanged(sender As Object, e As EventArgs) Handles txtRev_ResFinCDP.TextChanged
        Me.txtRev_ResFinCD.Text = CDbl(Me.txtRev_Venda.Text * CDbl(Me.txtRev_ResFinCDP.Text) / 100).ToString("n0")
        Me.txtRev_ResFinCDP.Text = CDbl(Me.txtRev_ResFinCDP.Text * 1).ToString("n2")
        Call CalcularResultadoFinanceiro()
        Call CalcularResultadoAntesIR_Revista(Me.txtRev_Venda.Text)
    End Sub

    Private Sub CalcularResultadoFinanceiro()
        'ResultadoFinanceiro
        Me.txtRev_ResFin.Text = (CDbl(Me.txtRev_ResFinLoja.Text) + CDbl(Me.txtRev_ResFinCD.Text)).ToString("n0")
        Me.txtRev_ResFinP.Text = ((CDbl(txtRev_ResFin.Text) / CDbl(Me.txtRev_Venda.Text)) * 100).ToString("n2")
    End Sub

    Protected Sub cboAno_ListAnoChanged(sender As Object, e As EventArgs) Handles cboAno.ListAnoChanged
        Call Atualizar()
    End Sub

    Protected Sub cboFilial_ListFilialChanged(sender As Object, e As EventArgs) Handles cboFilial.ListFilialChanged
        Call Atualizar()
    End Sub

    Protected Sub cboMes_ListMesChanged(sender As Object, e As EventArgs) Handles cboMes.ListMesChanged
        Call Atualizar()
    End Sub

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Call CalcularInicio()
    End Sub

    Protected Sub txtRev_QuebraTotalP_TextChanged(sender As Object, e As EventArgs) Handles txtRev_QuebraTotalP.TextChanged
        If CDbl(Me.txtRev_QuebraTotalP.Text) > CDbl(Me.lblOri_QuebraTotalP.Text) Then
            oVem.UserMsgBox(Me, "O novo % de Quebra não pode ser maior que o % Original")
            Me.txtRev_QuebraTotalP.Focus()
        Else
            Me.txtRev_QuebraTotal.Text = CDbl(Me.txtRev_Venda.Text * CDbl(Me.txtRev_QuebraTotalP.Text) / 100).ToString("n0")
            Call CalcularCMV_Revista(Me.txtRev_Venda.Text)
        End If

    End Sub

    Protected Sub txtRev_ProvisaoCredito_TextChanged(sender As Object, e As EventArgs) Handles txtRev_ProvisaoCredito.TextChanged
        Me.txtRev_ProvisaoCreditoP.Text = CDbl(CDbl(Me.txtRev_ProvisaoCredito.Text) / CDbl(Me.txtRev_Venda.Text) * 100).ToString("n2")
        Me.txtRev_ProvisaoCredito.Text = CDbl(Me.txtRev_ProvisaoCredito.Text * 1).ToString("n0")
        Me.txtRev_ProvisaoCreditoP.Text = CDbl(Me.txtRev_ProvisaoCreditoP.Text * 1).ToString("n2")
        Call CalcularResultadoAntesIR_Revista(Me.txtRev_Venda.Text)
    End Sub

    
    Protected Sub txtRev_ResFinLoja_TextChanged(sender As Object, e As EventArgs) Handles txtRev_ResFinLoja.TextChanged
        Me.txtRev_ResFinLojaP.Text = CDbl(CDbl(Me.txtRev_ResFinLoja.Text) / CDbl(Me.txtRev_Venda.Text) * 100).ToString("n2")
        Me.txtRev_ResFinLoja.Text = CDbl(Me.txtRev_ResFinLoja.Text * 1).ToString("n0")
        Me.txtRev_ResFinLojaP.Text = CDbl(Me.txtRev_ResFinLojaP.Text * 1).ToString("n2")
        Call CalcularResultadoFinanceiro()
        Call CalcularResultadoAntesIR_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_ResFinLojaP_TextChanged(sender As Object, e As EventArgs) Handles txtRev_ResFinLojaP.TextChanged
        Me.txtRev_ResFinLoja.Text = CDbl(Me.txtRev_Venda.Text * CDbl(Me.txtRev_ResFinLojaP.Text) / 100).ToString("n0")
        Me.txtRev_ResFinLojaP.Text = CDbl(Me.txtRev_ResFinLojaP.Text * 1).ToString("n2")
        Call CalcularResultadoFinanceiro()
        Call CalcularResultadoAntesIR_Revista(Me.txtRev_Venda.Text)
    End Sub

   
 
End Class

      