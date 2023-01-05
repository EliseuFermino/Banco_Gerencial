Imports System.Data
Imports System.Data.SqlClient
Imports System.Math

Partial Class MemberPages_Replanejamento_frmAP0154
    Inherits System.Web.UI.Page
    Private connManager As String = clData_gerManager.dbConnect   '"Data Source=CONTROLADORIA1\SQLCONTRO;Initial Catalog=gerManager;Persist Security Info=True;User ID=sa;Password=rd700@1"
    Dim vlr, perc, varVendaRevista As Double
    Dim iFilial As String
    Dim oVem As New VendaEmpresaMes
    Dim oFun As New Funcoes

    Public Enum TipoDeMeta As Byte
        Valor = 1
        Percentual = 2
    End Enum

    Public Enum Totaliza_SubTotal As Byte
        ReceitaLiquida = 1
        CMV = 2
        OperacaoComercial = 3
        MargemOperacional = 4
        Despesas = 5
        ResultadoOperacional = 6
        ResultadoFinanceiro = 7
        ResultadoAntesIR = 8
        ResultadoFinal = 9
    End Enum

#Region " PAGE"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            cboAno.AutoPostBack = True
            cboMes.AutoPostBack = True
            cboFilial.AutoPostBack = False

            oVem.AtualizarEstatisticaPrograma(16, User.Identity.Name)
            cboAno.CallAno = Year(Now())
            cboMes.CallMes = Session("sMES")
            cboAno.AnoInicial = Year(Now()) - 1
            cboAno.AnoFinal = Year(Now()) + 1

        End If
        Call LiberarSalvar()

    End Sub

    Protected Sub Page_LoadComplete(sender As Object, e As EventArgs) Handles Me.LoadComplete
        If Not IsPostBack Then
            CType(Master.Master.FindControl("lblTitle"), Label).Text = "Replanejamento - Passo 1"
        End If
    End Sub

    Protected Sub Page_PreRender(sender As Object, e As EventArgs) Handles Me.PreRender
        If Not IsPostBack Then
            If cboFilial.IsLoja = True Then
                cboFilial.Visible_cboCorporacao = False
            Else
                cboFilial.Visible = True
            End If

            If LCase(User.Identity.Name) = "eliseu" Or LCase(User.Identity.Name) = "eder" Or LCase(User.Identity.Name) = "100043" Or LCase(User.Identity.Name) = "jesuli" Then
                txtRev_MargemTeóricaP.Enabled = True
                txtRev_MargemTeóricaP.ReadOnly = False
                txtRev_SellP.Enabled = True
                txtRev_SellP.ReadOnly = False
                txtRev_Sell.Enabled = True
                txtRev_Sell.ReadOnly = False
                txtRev_PapaFilaP.Enabled = True
                txtRev_PapaFila.ReadOnly = False
            End If

        End If
    End Sub

    Protected Sub Page_PreRenderComplete(sender As Object, e As EventArgs) Handles Me.PreRenderComplete
        If Not IsPostBack Then
            If cboFilial.IsLoja = True Then
                txtRev_Venda.Enabled = False
                btnAtualizar.Visible = True
            End If

            Call Atualizar()
            LiberarSalvar()

            If cboAno.CallAno = DateAndTime.Now().Year Then
                Select Case cboMes.CallMes
                    Case 11, 12
                        txtRev_Venda.Enabled = True
                    Case Else
                        txtRev_Venda.Enabled = False
                End Select
            End If
        End If
    End Sub

#End Region


    Sub AtualizarRevista()
        BuscarRevista(1, txtRev_Venda, txtRevP1)  'Venda Bruta 
        BuscarRevista(2, txtRev_Impostos, txtRev_ImpostosP)  'Impostos 
        BuscarRevista(5, txtRev_MargemTeórica, txtRev_MargemTeóricaP)  'Margem teórica
        BuscarRevista(6, txtRev_QuebraTotal, txtRev_QuebraTotalP)  'Quebra total
        BuscarRevista(8, txtRev_Bonificacao, txtRev_BonificacaoP)  'Bonificação
        BuscarRevista(51, txtRev_BonificacaoCD, txtRev_BonificacaoCDP)  'Bonificação - CD
        BuscarRevista(9, txtRev_Contratos, txtRev_ContratosP)  'Contratos
        BuscarRevista(10, txtRev_CondicaoEspecial, txtRev_CondicaoEspecialP)  'Condição Especial
        BuscarRevista(52, txtRev_CondicaoEspecialCD, txtRev_CondicaoEspecialCDP)  'Condição Especial - CD
        BuscarRevista(50, txtRev_PontaDeGondola, txtRev_PontaDeGondolaP)  'Ponta de Gondola
        BuscarRevista(55, txtRev_Marketing, txtRev_MarketingP)  'Marketing
        BuscarRevista(80, txtRev_Sell, txtRev_SellP)  'Sell-in / Sell-out
        BuscarRevista(53, txtRev_PapaFila, txtRev_PapaFilaP)  'CAI

        BuscarRevista(93, txtRev_CheckStand, txtRev_CheckStandP)  'Bonificação - CD
        BuscarRevista(94, txtRev_Ilhas, txtRev_IlhasP)  'Bonificação - CD
        BuscarRevista(95, txtRev_Display, txtRev_DisplayP)  'Bonificação - CD

        BuscarRevista(15, txtRev_Pessoal, txtRev_PessoalP)  'Pessoal
        BuscarRevista(16, txtRev_Honorarios, txtRev_HonorariosP)  'honorários profissionais
        BuscarRevista(17, txtRev_Informatica, txtRev_InformaticaP)  'Informática
        BuscarRevista(18, txtRev_Manutencao, txtRev_ManutencaoP)  'Manutenção
        BuscarRevista(19, txtRev_Frota, txtRev_FrotaP)  'Frota
        BuscarRevista(20, txtRev_RecContrLogistica, txtRev_RecContrLogisticaP)  '(-) Recuperação de Contratos de Logistica
        BuscarRevista(21, txtRev_EmbUsoConsumo, txtRev_EmbUsoConsumoP)  'Embalagens - Uso e Consumo
        BuscarRevista(22, txtRev_EmbProdutos, txtRev_EmbProdutosP)  'Embalagens - Produtos
        BuscarRevista(23, txtRev_UsoConsumo, txtRev_UsoConsumoP)  'Uso e Consumo
        BuscarRevista(24, txtRev_Propaganda, txtRev_PropagandaP)  'Propaganda
        BuscarRevista(25, txtRev_VerbasPromocionais, txtRev_VerbasPromocionaisP)  '(-) Verbas Promocionais
        BuscarRevista(26, txtRev_PropGastoLojas, txtRev_PropGastoLojasP)  'Propaganda Gasto pelas Lojas
        BuscarRevista(27, txtRev_ServicoPublicos, txtRev_ServicoPublicosP)  'Serviços Publicos
        BuscarRevista(28, txtRev_Aluguel, txtRev_AluguelP)  'Aluguél
        BuscarRevista(29, txtRev_Seguranca, txtRev_SegurancaP)  'Segurança
        BuscarRevista(30, txtRev_Tributos, txtRev_TributosP)  'Tributos e Multas
        BuscarRevista(31, txtRev_Inadimplentes, txtRev_InadimplentesP)  'Inadimplentes
        BuscarRevista(32, txtRev_DespBancarias, txtRev_DespBancariasP)  'Despesas Bancárias
        BuscarRevista(33, txtRev_Comissoes, txtRev_ComissoesP)  'Comissões s/ movimentação financeira
        BuscarRevista(34, txtRev_Diversas, txtRev_DiversasP)  'Diversas
        BuscarRevista(73, txtRev_Viagens, txtRev_ViagensP)  'Viagens e Transportes de Funcionários
        BuscarRevista(74, txtRev_DespJudiciais, txtRev_DespJudiciaisP)  'Despesas Judiciais e Acordos
        BuscarRevista(35, txtRev_Leasing, txtRev_LeasingP)  'Leasing
        BuscarRevista(36, txtRev_Depreciacao, txtRev_DepreciacaoP)  'Depreciação
        BuscarRevista(37, txtRev_Socios, txtRev_SociosP)  'Sócios
        BuscarRevista(38, txtRev_Rateio, txtRev_RateioP)  'Rateio de Despesas
        BuscarRevista(77, txtRev_PLR, txtRev_PLRP)  'PLR
        '**********************  OUTRAS CONTAS FINAIS  ***************************************
        BuscarRevista(39, txtRev_OutrasReceitas, txtRev_OutrasReceitasP)  'Outras Receitas
        BuscarRevista(41, txtRev_ProvisaoCredito, txtRev_ProvisaoCreditoP)  'Provisão de Créditos
        BuscarRevista(48, txtRev_ReceitaComercial, txtRev_ReceitaComercialP)  'Receita Comercial
        BuscarRevista(43, txtRev_ResFinLoja, txtRev_ResFinLojaP)  'Resultado Financeiro - Loja
        BuscarRevista(44, txtRev_ResFinCD, txtRev_ResFinCDP)  'Resultado Financeiro - CD's
    End Sub

    Sub AtualizarOriginal()
        BuscarOriginal(1, lblOri_Venda, lblOri_VendaP)  'Venda Bruta 
        BuscarOriginal(2, lblOri_Impostos, lblOri_ImpostosP)  'Impostos 
        BuscarOriginal(5, lblOri_MargemTeórica, lblOri_MargemTeóricaP)  'Margem teórica
        BuscarOriginal(6, lblOri_QuebraTotal, lblOri_QuebraTotalP)  'Quebra total
        BuscarOriginal(8, lblOri_Bonificacao, lblOri_BonificacaoP)  'Bonificação
        BuscarOriginal(51, lblOri_BonificacaoCD, lblOri_BonificacaoCDP)  'Bonificação - CD
        BuscarOriginal(9, lblOri_Contratos, lblOri_ContratosP)  'Contratos
        BuscarOriginal(10, lblOri_CondicaoEspecial, lblOri_CondicaoEspecialP)  'Condição Especial
        BuscarOriginal(52, lblOri_CondicaoEspecialCD, lblOri_CondicaoEspecialCDP)  'Condição Especial - CD
        BuscarOriginal(50, lblOri_PontaDeGondola, lblOri_PontaDeGondolaP)  'Ponta de Gondola
        BuscarOriginal(55, lblOri_Marketing, lblOri_MarketingP)  'Marketing
        BuscarOriginal(80, lblOri_Sell, lblOri_SellP)  'Sell-in / Sell-out
        BuscarOriginal(53, lblOri_PapaFila, lblOri_PapaFilaP)  'CAI

        BuscarOriginal(93, lblOri_CheckStand, lblOri_CheckStandP)  'Sell-in / Sell-out
        BuscarOriginal(94, lblOri_Ilhas, lblOri_IlhasP)  'Sell-in / Sell-out
        BuscarOriginal(95, lblOri_Display, lblOri_DisplayP)  'Sell-in / Sell-out

        '*************  DESPESAS  ***********************************************************

        BuscarOriginal(15, lblOri_Pessoal, lblOri_PessoalP)  'Pessoal
        BuscarOriginal(16, lblOri_Honorarios, lblOri_HonorariosP)  'honorários profissionais
        BuscarOriginal(17, lblOri_Informatica, lblOri_InformaticaP)  'Informática
        BuscarOriginal(18, lblOri_Manutencao, lblOri_ManutencaoP)  'Manutenção
        BuscarOriginal(19, lblOri_Frota, lblOri_FrotaP)  'Frota
        BuscarOriginal(20, lblOri_RecContrLogistica, lblOri_RecContrLogisticaP)  '(-) Recuperação de Contratos de Logistica
        BuscarOriginal(21, lblOri_EmbUsoConsumo, lblOri_EmbUsoConsumoP)  'Embalagens - Uso e Consumo
        BuscarOriginal(22, lblOri_EmbProdutos, lblOri_EmbProdutosP)  'Embalagens - Produtos
        BuscarOriginal(23, lblOri_UsoConsumo, lblOri_UsoConsumoP)  'Uso e Consumo
        BuscarOriginal(24, lblOri_Propaganda, lblOri_PropagandaP)  'Propaganda
        BuscarOriginal(25, lblOri_VerbasPromocionais, lblOri_VerbasPromocionaisP)  '(-) Verbas Promocionais
        BuscarOriginal(26, lblOri_PropGastoLojas, lblOri_PropGastoLojasP)  'Propaganda Gasto pelas Lojas
        BuscarOriginal(27, lblOri_ServicoPublicos, lblOri_ServicoPublicosP)  'Serviços Publicos
        BuscarOriginal(28, lblOri_Aluguel, lblOri_AluguelP)  'Aluguél
        BuscarOriginal(29, lblOri_Seguranca, lblOri_SegurancaP)  'Segurança
        BuscarOriginal(30, lblOri_Tributos, lblOri_TributosP)  'Tributos e Multas
        BuscarOriginal(31, lblOri_Inadimplentes, lblOri_InadimplentesP)  'Inadimplentes
        BuscarOriginal(32, lblOri_DespBancarias, lblOri_DespBancariasP)  'Despesas Bancárias
        BuscarOriginal(33, lblOri_Comissoes, lblOri_ComissoesP)  'Comissões s/ movimentação financeira
        BuscarOriginal(34, lblOri_Diversas, lblOri_DiversasP)  'Diversas
        BuscarOriginal(73, lblOri_Viagens, lblOri_ViagensP)  'Viagens e Transportes de Funcionários
        BuscarOriginal(74, lblOri_DespJudiciais, lblOri_DespJudiciaisP)  'Despesas Judiciais e Acordos
        BuscarOriginal(35, lblOri_Leasing, lblOri_LeasingP)  'Leasing
        BuscarOriginal(36, lblOri_Depreciacao, lblOri_DepreciacaoP)  'Depreciação
        BuscarOriginal(37, lblOri_Socios, lblOri_SociosP)  'Sócios
        BuscarOriginal(38, lblOri_Rateio, lblOri_RateioP)  'Rateio de Despesas
        BuscarOriginal(77, lblOri_PLR, lblOri_PLRP)  'PLR

        '**********************  OUTRAS CONTAS FINAIS  ***************************************
        BuscarOriginal(39, lblOri_OutrasReceitas, lblOri_OutrasReceitasP)  'Outras Receitas
        BuscarOriginal(41, lblOri_ProvisaoCredito, lblOri_ProvisaoCreditoP)  'Provisão de Créditos
        BuscarOriginal(48, lblOri_ReceitaComercial, lblOri_ReceitaComercialP)  'Receita Comercial
        BuscarOriginal(43, lblOri_ResFinLoja, lblOri_ResFinLojaP)  'Resultado Financeiro - Loja
        BuscarOriginal(44, lblOri_ResFinCD, lblOri_ResFinCDP)  'Resultado Financeiro - CD's

    End Sub

    Sub Atualizar()
        Call ZerarCamposParaInico()
        Call AtualizarOriginal()
        Call AtualizarRevista()
        Call CalcularInicio()
        Call FormatarNegativo()
    End Sub

    Sub CalcularInicio()
        On Error Resume Next

        ' -> REVISTA
        CalcularVendaLiquida_Revista(txtRev_Venda.Text, txtRev_Impostos.Text)   ' Venda Liquida
        CalcularCMV_Revista(txtRev_Venda.Text)  'CMV
        CalcularOperacaoComercial_Revista(txtRev_Venda.Text)    'Operações Comerciais
        CalcularDespesa_Revista(txtRev_Venda.Text)  'Despesas
        CalcularResultadoFinanceiro()   'ResultadoFinanceiro
        CalcularResultadoAntesIR_Revista(txtRev_Venda.Text)
        CalcularResultadoFinal_Revista(txtRev_Venda.Text)

        '-------------------------- Original -------------------------------------------------------------------------------
        'Venda Liquida
        Me.lblOri_VendaLiquida.Text = (CDbl(Me.lblOri_Venda.Text) - CDbl(Me.lblOri_Impostos.Text)).ToString("n0")
        Me.lblOri_VendaLiquidaP.Text = ((CDbl(lblOri_VendaLiquida.Text) / CDbl(Me.lblOri_Venda.Text)) * 100).ToString("n2")

        'QUEBRA
        Dim varVlr As Decimal
        varVlr = 0
        varVlr = CDbl(((Me.txtRev_Venda.Text * Me.txtRev_QuebraTotalP.Text) / 100))
        Me.txtRev_QuebraTotal.Text = varVlr.ToString("n0")



        'CMV
        Me.lblOri_CMV.Text = (CDbl(Me.lblOri_VendaLiquida.Text) + CDbl(Me.lblOri_QuebraTotal.Text) - CDbl(Me.lblOri_MargemTeórica.Text)).ToString("n0")
        Me.lblOri_CMVP.Text = ((CDbl(lblOri_CMV.Text) / CDbl(Me.lblOri_Venda.Text)) * 100).ToString("n2")

        'Operações Comerciais
        Me.lblOri_OperacoesComerciais.Text = (CDbl(Me.lblOri_Bonificacao.Text) + CDbl(Me.lblOri_BonificacaoCD.Text) _
                                               + CDbl(Me.lblOri_Contratos.Text) + CDbl(Me.lblOri_CondicaoEspecial.Text) _
                                               + CDbl(Me.lblOri_CondicaoEspecialCD.Text) _
                                               + CDbl(Me.lblOri_PontaDeGondola.Text) + CDbl(Me.lblOri_Marketing.Text) + CDbl(Me.lblOri_Sell.Text) _
                                               + CDbl(Me.lblOri_CheckStand.Text) + CDbl(Me.lblOri_Ilhas.Text) + CDbl(Me.lblOri_Display.Text)).ToString("n0")
        Me.lblOri_OperacoesComerciaisP.Text = ((CDbl(lblOri_OperacoesComerciais.Text) / CDbl(Me.lblOri_Venda.Text)) * 100).ToString("n2")

        'Margem Operacional
        Me.lblOri_MargemOperacional.Text = (CDbl(Me.lblOri_VendaLiquida.Text) - CDbl(Me.lblOri_CMV.Text) + CDbl(Me.lblOri_OperacoesComerciais.Text) + CDbl(Me.lblOri_PapaFila.Text)).ToString("n0")
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

        comando.Parameters.Add(New SqlParameter("@idCod", SqlDbType.SmallInt))
        comando.Parameters("@idCod").Value = idGrupo

        comando.Parameters.Add(New SqlParameter("@Ano", SqlDbType.SmallInt))
        comando.Parameters("@Ano").Value = Me.cboAno.CallAno

        comando.Parameters.Add(New SqlParameter("@Mes", SqlDbType.SmallInt))
        comando.Parameters("@Mes").Value = Me.cboMes.CallMes

        comando.Parameters.Add(New SqlParameter("@idFilial", SqlDbType.SmallInt))
        comando.Parameters("@idFilial").Value = Me.cboFilial.CallFilial

        comando.Parameters.Add(New SqlParameter("@vlr", SqlDbType.Money))
        comando.Parameters("@vlr").Value = vlr

        comando.Parameters.Add(New SqlParameter("@perc", SqlDbType.Money))
        comando.Parameters("@perc").Value = perc

        comando.Parameters.Add(New SqlParameter("@userName", SqlDbType.VarChar))
        comando.Parameters("@userName").Value = User.Identity.Name

        'Dim vMess As String = "Salvei idGrupo: " & idGrupo & " Valor: " & vlr & ""
        'oVem.UserMsgBox(Me, vMess)

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

    Sub Salvar_Meta_Revista()
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
        Call Salvar(94, Me.txtRev_Ilhas.Text, Me.txtRev_IlhasP.Text)
        Call Salvar(96, Me.txtRev_PapaFila.Text, Me.txtRev_PapaFilaP.Text)

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
        Me.lblOri_ResultaoOperacional.Text = 0
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

        lblOri_CheckStand.Text = 0
        lblOri_CheckStandP.Text = 0
        lblOri_Ilhas.Text = 0
        lblOri_IlhasP.Text = 0
        lblOri_Display.Text = 0
        lblOri_DisplayP.Text = 0
        lblOri_PapaFila.Text = 0
        lblOri_PapaFilaP.Text = 0

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

        txtRev_CheckStand.Text = 0
        txtRev_CheckStandP.Text = 0
        txtRev_Ilhas.Text = 0
        txtRev_IlhasP.Text = 0
        txtRev_Display.Text = 0
        txtRev_DisplayP.Text = 0
        txtRev_Ilhas.Text = 0
        txtRev_PapaFila.Text = 0

    End Sub

    Private Sub CalcularDadosFixoComBaseVenda()
        Dim varVlr As Double
        Dim varImpostos As Decimal
        Me.txtRev_Venda.Text = CDbl(Me.txtRev_Venda.Text * 1).ToString("n0")
        varVendaRevista = txtRev_Venda.Text
        varImpostos = CDec(txtRev_Impostos.Text)

        'PELO PERCENTUAL - Se mudar a venda, muda as seguintes contas
        CalcularVendaLiquida_Revista(varVendaRevista, varImpostos) 'Calcular Venda Liquida 
        CalcularDadosFixo(TipoDeMeta.Percentual, txtRev_Impostos, txtRev_ImpostosP) 'Impostos



        CalcularDadosFixo(TipoDeMeta.Percentual, txtRev_MargemTeórica, txtRev_MargemTeóricaP)   'Margem 
        CalcularDadosFixo(TipoDeMeta.Percentual, txtRev_Bonificacao, txtRev_BonificacaoP)   'Bonificação
        CalcularDadosFixo(TipoDeMeta.Percentual, txtRev_BonificacaoCD, txtRev_BonificacaoCDP)   'Bonificação CD   'Bonificação CD
        CalcularDadosFixo(TipoDeMeta.Percentual, txtRev_Contratos, txtRev_ContratosP)   'Contratos
        CalcularDadosFixo(TipoDeMeta.Percentual, txtRev_CondicaoEspecial, txtRev_CondicaoEspecialP)   'CondicaoEspecial  
        CalcularDadosFixo(TipoDeMeta.Percentual, txtRev_CondicaoEspecialCD, txtRev_CondicaoEspecialCDP)   'CondicaoEspecialCD 
        CalcularDadosFixo(TipoDeMeta.Percentual, txtRev_PontaDeGondola, txtRev_PontaDeGondolaP)   'PontaDeGondola  
        CalcularDadosFixo(TipoDeMeta.Percentual, txtRev_Marketing, txtRev_MarketingP)   'Marketing 

        CalcularOperacaoComercial_Revista(Me.txtRev_Venda.Text) 'Calcular Operação Comercial
        CalcularCMV_Revista(txtRev_Venda.Text)    'Calcular CMV 

        'PELO VALOR - Muda VALOR em função do Percentual Fixo -------------------------------------------------------------------------------
        'Quebra -> pelo Percentual e pode alterar desde que o % da quebra seja igual ou menor que o % original.
        varVlr = 0
        varVlr = CDbl(((varVendaRevista * Me.txtRev_QuebraTotalP.Text) / 100))
        Me.txtRev_QuebraTotal.Text = varVlr.ToString("n0")

        CalcularDadosFixo(TipoDeMeta.Percentual, txtRev_Frota, txtRev_FrotaP)   'Frota
        CalcularDadosFixo(TipoDeMeta.Percentual, txtRev_RecContrLogistica, txtRev_RecContrLogisticaP)   'Contrato de Logistica
        CalcularDadosFixo(TipoDeMeta.Percentual, txtRev_EmbUsoConsumo, txtRev_EmbUsoConsumoP)   'Embalagens - Uso e Consumo
        CalcularDadosFixo(TipoDeMeta.Percentual, txtRev_EmbProdutos, txtRev_EmbProdutosP)   'Embalagens - Produtos
        CalcularDadosFixo(TipoDeMeta.Percentual, txtRev_UsoConsumo, txtRev_UsoConsumoP)   'Uso e Consumo
        CalcularDadosFixo(TipoDeMeta.Percentual, txtRev_Propaganda, txtRev_PropagandaP)   'Propaganda 
        CalcularDadosFixo(TipoDeMeta.Percentual, txtRev_VerbasPromocionais, txtRev_VerbasPromocionaisP)   '(-) Verbas Promocionais
        CalcularDadosFixo(TipoDeMeta.Percentual, txtRev_Aluguel, txtRev_AluguelP)   'Aluguel
        CalcularDadosFixo(TipoDeMeta.Percentual, txtRev_Comissoes, txtRev_ComissoesP)   'Comissões Financeiras
        CalcularDadosFixo(TipoDeMeta.Percentual, txtRev_Leasing, txtRev_LeasingP)   'Leasing
        CalcularDadosFixo(TipoDeMeta.Percentual, txtRev_OutrasReceitas, txtRev_OutrasReceitasP)   'Outras Receitas
        CalcularDadosFixo(TipoDeMeta.Percentual, txtRev_Rateio, txtRev_RateioP)   'Rateio de Despesa
        CalcularDadosFixo(TipoDeMeta.Percentual, txtRev_Inadimplentes, txtRev_InadimplentesP)   'Inadimplência
        CalcularDadosFixo(TipoDeMeta.Percentual, txtRev_ReceitaComercial, txtRev_ReceitaComercialP)   'Receita Comercial

        '************************ Muda PERCENTUAL em função do valor Fixo ************************************       
        CalcularDadosFixo(TipoDeMeta.Valor, txtRev_Pessoal, txtRev_PessoalP)   'Pessoal
        CalcularDadosFixo(TipoDeMeta.Valor, txtRev_Honorarios, txtRev_HonorariosP)   'Honorários Profissionais
        CalcularDadosFixo(TipoDeMeta.Valor, txtRev_Informatica, txtRev_InformaticaP)   'Informática
        CalcularDadosFixo(TipoDeMeta.Valor, txtRev_Manutencao, txtRev_ManutencaoP)   'Manutenção
        CalcularDadosFixo(TipoDeMeta.Valor, txtRev_PropGastoLojas, txtRev_PropGastoLojasP)   'Propaganda Gasto pelas lojas
        CalcularDadosFixo(TipoDeMeta.Valor, txtRev_ServicoPublicos, txtRev_ServicoPublicosP)   'Serviços Públicos
        CalcularDadosFixo(TipoDeMeta.Valor, txtRev_Seguranca, txtRev_SegurancaP)   'Segurança
        CalcularDadosFixo(TipoDeMeta.Valor, txtRev_DespBancarias, txtRev_DespBancariasP)   'Despesas Bancarias
        CalcularDadosFixo(TipoDeMeta.Valor, txtRev_Diversas, txtRev_DiversasP)   'Diversas
        CalcularDadosFixo(TipoDeMeta.Valor, txtRev_Viagens, txtRev_ViagensP)   'Viagens e transportes de funcionários
        CalcularDadosFixo(TipoDeMeta.Valor, txtRev_Socios, txtRev_SociosP)   'Sócios
        CalcularDadosFixo(TipoDeMeta.Valor, txtRev_Depreciacao, txtRev_DepreciacaoP)   'Depreciação
        CalcularDadosFixo(TipoDeMeta.Valor, txtRev_ProvisaoCredito, txtRev_ProvisaoCreditoP)   'Provisão de Créditos
        CalcularDadosFixo(TipoDeMeta.Valor, txtRev_ResFinLoja, txtRev_ResFinLojaP)   'Financeiro da Loja
        CalcularDadosFixo(TipoDeMeta.Valor, txtRev_ResFinCD, txtRev_ResFinCDP)   'Financeiro da CD 
        CalcularDadosFixo(TipoDeMeta.Valor, txtRev_Tributos, txtRev_TributosP)   'Tributos e Multas
        CalcularDadosFixo(TipoDeMeta.Valor, txtRev_DespJudiciais, txtRev_DespJudiciaisP)   'Despesas Judicias e Acordos

        Call CalcularDespesa_Revista(varVendaRevista)
        Call CalcularResultadoOperacional_Revista(varVendaRevista)
        Call CalcularResultadoAntesIR_Revista(varVendaRevista)

    End Sub

#Region " CALCULAR SUB-TOTAIS"

    Private Sub CalcularVendaLiquida_Revista(ByVal iVenda As Double, ByVal iImposto As Double)
        Me.txtRev_VendaLiquida.Text = oFun.Calculate(iVenda, iImposto, Funcoes.CalculateType.Decrease).ToString("n0")
        Me.txtRev_VendaLiquidaP.Text = oFun.Calculate(txtRev_VendaLiquida.Text, iVenda, Funcoes.CalculateType.ValueOverRevenue).ToString("n2")
        Call CalcularMargemOperacional_Revista(iVenda)
    End Sub

    Private Sub CalcularResultadoOperacional_Revista(ByVal iVenda As Double)
        Me.txtRev_ResultaoOperacional.Text = oFun.Calculate(oFun.Calculate(txtRev_MargemOperacional.Text, txtRev_Despesas.Text, Funcoes.CalculateType.Decrease), txtRev_OutrasReceitas.Text, Funcoes.CalculateType.Sum).ToString("n0")
        Me.txtRev_ResultaoOperacionalP.Text = oFun.Calculate(txtRev_ResultaoOperacional.Text, iVenda, Funcoes.CalculateType.ValueOverRevenue).ToString("n2")
        Call CalcularResultadoAntesIR_Revista(iVenda)
    End Sub

    Private Sub CalcularResultadoAntesIR_Revista(ByVal iVenda As Double)
        Me.txtRev_ResAntesIR.Text = oFun.Calculate(oFun.Calculate(oFun.Calculate(txtRev_ResultaoOperacional.Text, txtRev_ProvisaoCredito.Text, Funcoes.CalculateType.Sum), txtRev_ReceitaComercial.Text, Funcoes.CalculateType.Sum), txtRev_ResFin.Text, Funcoes.CalculateType.Sum).ToString("n0")
        Me.txtRev_ResAntesIRP.Text = oFun.Calculate(txtRev_ResAntesIR.Text, iVenda, Funcoes.CalculateType.ValueOverRevenue).ToString("n2")
        Call CalcularResultadoFinal_Revista(iVenda)
    End Sub

    Private Sub CalcularResultadoFinal_Revista(ByVal iVenda As Double)
        If Me.txtRev_ResAntesIR.Text > 0 Then
            Me.txtRev_ProvIR.Text = oFun.Calculate(txtRev_ResAntesIR.Text, 34, Funcoes.CalculateType.MultiplicationOverRevenue).ToString("n0")
            Me.txtRev_ProvIRP.Text = oFun.Calculate(txtRev_ProvIR.Text, iVenda, Funcoes.CalculateType.ValueOverRevenue).ToString("n2")
            Me.txtRev_ResFinal.Text = oFun.Calculate(txtRev_ResAntesIR.Text, txtRev_ProvIR.Text, Funcoes.CalculateType.Decrease).ToString("n0")
            Me.txtRev_ResFinalP.Text = oFun.Calculate(txtRev_ResFinal.Text, iVenda, Funcoes.CalculateType.ValueOverRevenue).ToString("n2")
        Else
            Me.txtRev_ProvIR.Text = 0
            Me.txtRev_ProvIRP.Text = 0
            Me.txtRev_ResFinal.Text = Me.txtRev_ResAntesIR.Text
            Me.txtRev_ResFinalP.Text = Me.txtRev_ResAntesIRP.Text
        End If
        Call FormatarNegativo()
    End Sub

    Private Sub CalcularResultadoFinanceiro()
        Me.txtRev_ResFin.Text = oFun.Calculate(txtRev_ResFinLoja.Text, txtRev_ResFinCD.Text, Funcoes.CalculateType.Sum).ToString("n0")
        Me.txtRev_ResFinP.Text = oFun.Calculate(txtRev_ResFin.Text, txtRev_Venda.Text, Funcoes.CalculateType.ValueOverRevenue).ToString("n2")
    End Sub

    Private Sub CalcularMargemOperacional_Revista(ByVal iVenda As Decimal)
        On Error Resume Next
        Me.txtRev_MargemOperacional.Text = oFun.Calculate(oFun.Calculate(txtRev_VendaLiquida.Text, txtRev_CMV.Text, Funcoes.CalculateType.Decrease), oFun.Calculate(txtRev_OperacoesComerciais.Text, txtRev_PapaFila.Text, Funcoes.CalculateType.Sum), Funcoes.CalculateType.Sum).ToString("n0")
        Me.txtRev_MargemOperacionalP.Text = oFun.Calculate(txtRev_MargemOperacional.Text, iVenda, Funcoes.CalculateType.ValueOverRevenue).ToString("n2")
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
        Me.txtRev_DespesasP.Text = oFun.Calculate(txtRev_Despesas.Text, iVenda, Funcoes.CalculateType.ValueOverRevenue).ToString("n2")
        Call CalcularResultadoOperacional_Revista(iVenda)
    End Sub

    Private Sub CalcularOperacaoComercial_Revista(ByVal iVenda As Double)
        Me.txtRev_OperacoesComerciais.Text = (CDbl(Me.txtRev_Bonificacao.Text) + CDbl(Me.txtRev_BonificacaoCD.Text) + CDbl(Me.txtRev_Contratos.Text) _
                                + CDbl(Me.txtRev_CondicaoEspecial.Text) + CDbl(Me.txtRev_CondicaoEspecialCD.Text) _
                                + CDbl(Me.txtRev_PontaDeGondola.Text) + CDbl(Me.txtRev_Marketing.Text) + CDbl(Me.txtRev_Sell.Text) _
                                + CDbl(Me.txtRev_CheckStand.Text) + CDbl(Me.txtRev_Ilhas.Text) + CDbl(Me.txtRev_Display.Text)).ToString("n0")

        Me.txtRev_OperacoesComerciaisP.Text = oFun.Calculate(txtRev_OperacoesComerciais.Text, iVenda, Funcoes.CalculateType.ValueOverRevenue).ToString("n2")
        Call CalcularMargemOperacional_Revista(iVenda)
    End Sub

    Private Sub CalcularCMV_Revista(ByVal iVenda As Double)
        Me.txtRev_CMV.Text = oFun.Calculate(oFun.Calculate(txtRev_VendaLiquida.Text, txtRev_MargemTeórica.Text, Funcoes.CalculateType.Decrease), txtRev_QuebraTotal.Text, Funcoes.CalculateType.Sum).ToString("n0")
        Me.txtRev_CMVP.Text = oFun.Calculate(txtRev_CMV.Text, iVenda, Funcoes.CalculateType.ValueOverRevenue).ToString("n2")
        Call CalcularMargemOperacional_Revista(iVenda)
    End Sub

#End Region

#Region " Controls"

    Private Sub CalcularMetas(ByVal iTipoDeMeta As TipoDeMeta, ByVal vlrMeta As TextBox, ByVal percMeta As TextBox, ByVal vlrMetaVenda As TextBox, ByVal Calcula_SubTotal As Totaliza_SubTotal)

        Select Case iTipoDeMeta
            Case TipoDeMeta.Valor ' Calcula o Percentual da meta com base no Valor sobre a Venda
                percMeta.Text = oFun.Calculate(vlrMeta.Text, vlrMetaVenda.Text, Funcoes.CalculateType.ValueOverRevenue).ToString("n2")
                vlrMeta.Text = CDbl(vlrMeta.Text * 1).ToString("n0")
                percMeta.Text = CDbl(percMeta.Text * 1).ToString("n2")
            Case TipoDeMeta.Percentual  ' Calcula o Valor da meta com base no Percentual sobre a Venda
                vlrMeta.Text = oFun.Calculate(vlrMetaVenda.Text, percMeta.Text, Funcoes.CalculateType.MultiplicationOverRevenue).ToString("n0")
                percMeta.Text = CDbl(percMeta.Text * 1).ToString("n2")
        End Select

        Select Case Calcula_SubTotal
            Case Totaliza_SubTotal.CMV
                CalcularCMV_Revista(vlrMetaVenda.Text)
            Case Totaliza_SubTotal.OperacaoComercial
                CalcularOperacaoComercial_Revista(vlrMetaVenda.Text)
            Case Totaliza_SubTotal.Despesas
                CalcularDespesa_Revista(vlrMetaVenda.Text)
            Case Totaliza_SubTotal.ResultadoFinanceiro
                CalcularResultadoFinanceiro()
            Case Totaliza_SubTotal.ResultadoAntesIR
        End Select

    End Sub

    Private Sub FormataNegativo_Label(iVlr As Label, iPerc As Label)

        If CDbl(iVlr.Text) < 0 Then
            iVlr.ForeColor = Drawing.Color.Red
            iPerc.ForeColor = Drawing.Color.Red
        Else
            iVlr.ForeColor = Drawing.Color.Black
            iPerc.ForeColor = Drawing.Color.Black
        End If
    End Sub

    Private Sub FormataNegativo_Text(iVlr As TextBox, iPerc As TextBox)
        If CDbl(iVlr.Text) < 0 Then
            iVlr.ForeColor = Drawing.Color.Red
            iPerc.ForeColor = Drawing.Color.Red
        Else
            iVlr.ForeColor = Drawing.Color.Black
            iPerc.ForeColor = Drawing.Color.Black
        End If
    End Sub

    Private Sub CalcularDadosFixo(ByVal iTipoDeMeta As TipoDeMeta, ByVal vlrMeta As Label, ByVal percMeta As Label)
        Dim varVlr As Decimal
        varVlr = 0
        Select Case iTipoDeMeta
            Case TipoDeMeta.Percentual  'Se mudar a venda, muda as seguintes contas pelo PERCENTUAL
                varVlr = oFun.Calculate(txtRev_Venda.Text, percMeta.Text, Funcoes.CalculateType.MultiplicationOverRevenue)
                vlrMeta.Text = varVlr.ToString("n0")
            Case TipoDeMeta.Valor
                varVlr = oFun.Calculate(vlrMeta.Text, txtRev_Venda.Text, Funcoes.CalculateType.ValueOverRevenue)
                percMeta.Text = varVlr.ToString("n2")
        End Select
    End Sub

    Private Sub CalcularDadosFixo(ByVal iTipoDeMeta As TipoDeMeta, ByVal vlrMeta As TextBox, ByVal percMeta As TextBox)
        Dim varVlr As Decimal
        varVlr = 0
        Select Case iTipoDeMeta
            Case TipoDeMeta.Percentual  'Se mudar a venda, muda as seguintes contas pelo PERCENTUAL
                varVlr = oFun.Calculate(txtRev_Venda.Text, percMeta.Text, Funcoes.CalculateType.MultiplicationOverRevenue)
                vlrMeta.Text = varVlr.ToString("n0")
            Case TipoDeMeta.Valor
                varVlr = oFun.Calculate(vlrMeta.Text, txtRev_Venda.Text, Funcoes.CalculateType.ValueOverRevenue)
                percMeta.Text = varVlr.ToString("n2")
        End Select
    End Sub

    Private Sub BuscarOriginal(ByVal idCod As Byte, ByVal vlrMeta As Label, percMeta As Label)
        oVem.BI_BuscaOri_GrupoMes(idCod, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        'Select Case idCod
        '    Case 6  'Quebra Total
        '        vlrMeta.Text = oVem.vlrOri * -1
        '        percMeta.Text = oVem.percOri * -1
        '    Case Else
        '        vlrMeta.Text = oVem.vlrOri
        '        percMeta.Text = oVem.percOri
        'End Select

        vlrMeta.Text = oVem.vlrOri
        percMeta.Text = oVem.percOri

    End Sub

    Private Sub BuscarRevista(ByVal idCod As Byte, ByVal vlrMeta As TextBox, percMeta As TextBox)
        oVem.BuscaRevGrupoMes(idCod, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        vlrMeta.Text = oVem.vlrRev.ToString("n0")
        percMeta.Text = oVem.percRev.ToString("n2")
    End Sub

    Private Sub BuscarRevista(ByVal idCod As Byte, ByVal vlrMeta As Label, percMeta As Label)
        oVem.BuscaRevGrupoMes(idCod, Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        vlrMeta.Text = oVem.vlrRev.ToString("n0")
        percMeta.Text = oVem.percRev.ToString("n2")
    End Sub

#End Region

    Protected Sub txtRev_MargemTeóricaP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_MargemTeóricaP.TextChanged
        CalcularMetas(TipoDeMeta.Percentual, txtRev_MargemTeórica, txtRev_MargemTeóricaP, txtRev_Venda, Totaliza_SubTotal.CMV)
    End Sub

    Protected Sub txtRev_BonificacaoP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_BonificacaoP.TextChanged
        CalcularMetas(TipoDeMeta.Percentual, txtRev_Bonificacao, txtRev_BonificacaoP, txtRev_Venda, Totaliza_SubTotal.OperacaoComercial)
    End Sub

    Protected Sub txtRev_CondicaoEspecialP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_CondicaoEspecialP.TextChanged
        CalcularMetas(TipoDeMeta.Percentual, txtRev_CondicaoEspecial, txtRev_CondicaoEspecialP, txtRev_Venda, Totaliza_SubTotal.OperacaoComercial)
    End Sub

    Protected Sub txtRev_PontaDeGondolaP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_PontaDeGondolaP.TextChanged
        CalcularMetas(TipoDeMeta.Percentual, txtRev_PontaDeGondola, txtRev_PontaDeGondolaP, txtRev_Venda, Totaliza_SubTotal.OperacaoComercial)
    End Sub

    Protected Sub txtRev_Bonificacao_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_Bonificacao.TextChanged
        CalcularMetas(TipoDeMeta.Valor, txtRev_Bonificacao, txtRev_BonificacaoP, txtRev_Venda, Totaliza_SubTotal.OperacaoComercial)
    End Sub

    Protected Sub txtRev_CondicaoEspecial_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_CondicaoEspecial.TextChanged
        CalcularMetas(TipoDeMeta.Valor, txtRev_CondicaoEspecial, txtRev_CondicaoEspecialP, txtRev_Venda, Totaliza_SubTotal.OperacaoComercial)
    End Sub

    Protected Sub txtRev_PontaDeGondola_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_PontaDeGondola.TextChanged
        CalcularMetas(TipoDeMeta.Valor, txtRev_PontaDeGondola, txtRev_PontaDeGondolaP, txtRev_Venda, Totaliza_SubTotal.OperacaoComercial)
    End Sub

    Protected Sub txtRev_Pessoal_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_Pessoal.TextChanged
        CalcularMetas(TipoDeMeta.Valor, txtRev_Pessoal, txtRev_PessoalP, txtRev_Venda, Totaliza_SubTotal.Despesas)
    End Sub

    Protected Sub txtRev_Honorarios_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_Honorarios.TextChanged
        CalcularMetas(TipoDeMeta.Valor, txtRev_Honorarios, txtRev_HonorariosP, txtRev_Venda, Totaliza_SubTotal.Despesas)
    End Sub

    Protected Sub txtRev_Manutencao_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_Manutencao.TextChanged
        CalcularMetas(TipoDeMeta.Valor, txtRev_Manutencao, txtRev_ManutencaoP, txtRev_Venda, Totaliza_SubTotal.Despesas)
    End Sub

    Protected Sub txtRev_Frota_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_Frota.TextChanged
        CalcularMetas(TipoDeMeta.Valor, txtRev_Frota, txtRev_FrotaP, txtRev_Venda, Totaliza_SubTotal.Despesas)
    End Sub

    Protected Sub txtRev_EmbUsoConsumo_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_EmbUsoConsumo.TextChanged
        CalcularMetas(TipoDeMeta.Valor, txtRev_EmbUsoConsumo, txtRev_EmbUsoConsumoP, txtRev_Venda, Totaliza_SubTotal.Despesas)
    End Sub

    Protected Sub txtRev_EmbProdutos_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_EmbProdutos.TextChanged
        CalcularMetas(TipoDeMeta.Valor, txtRev_EmbProdutos, txtRev_EmbProdutosP, txtRev_Venda, Totaliza_SubTotal.Despesas)
    End Sub

    Protected Sub txtRev_UsoConsumo_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_UsoConsumo.TextChanged
        CalcularMetas(TipoDeMeta.Valor, txtRev_UsoConsumo, txtRev_UsoConsumoP, txtRev_Venda, Totaliza_SubTotal.Despesas)
    End Sub

    Protected Sub txtRev_PropGastoLojas_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_PropGastoLojas.TextChanged
        CalcularMetas(TipoDeMeta.Valor, txtRev_PropGastoLojas, txtRev_PropGastoLojasP, txtRev_Venda, Totaliza_SubTotal.Despesas)
    End Sub

    Protected Sub txtRev_ServicoPublicos_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_ServicoPublicos.TextChanged
        CalcularMetas(TipoDeMeta.Valor, txtRev_ServicoPublicos, txtRev_ServicoPublicosP, txtRev_Venda, Totaliza_SubTotal.Despesas)
    End Sub

    Protected Sub txtRev_Seguranca_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_Seguranca.TextChanged
        CalcularMetas(TipoDeMeta.Valor, txtRev_Seguranca, txtRev_SegurancaP, txtRev_Venda, Totaliza_SubTotal.Despesas)
    End Sub

    Protected Sub txtRev_Inadimplentes_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_Inadimplentes.TextChanged
        CalcularMetas(TipoDeMeta.Valor, txtRev_Inadimplentes, txtRev_InadimplentesP, txtRev_Venda, Totaliza_SubTotal.Despesas)
    End Sub

    Protected Sub txtRev_DespBancarias_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_DespBancarias.TextChanged
        CalcularMetas(TipoDeMeta.Valor, txtRev_DespBancarias, txtRev_DespBancariasP, txtRev_Venda, Totaliza_SubTotal.Despesas)
    End Sub

    Protected Sub txtRev_Diversas_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_Diversas.TextChanged
        CalcularMetas(TipoDeMeta.Valor, txtRev_Diversas, txtRev_DiversasP, txtRev_Venda, Totaliza_SubTotal.Despesas)
    End Sub

    Protected Sub txtRev_Viagens_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_Viagens.TextChanged
        CalcularMetas(TipoDeMeta.Valor, txtRev_Viagens, txtRev_ViagensP, txtRev_Venda, Totaliza_SubTotal.Despesas)
    End Sub

    Protected Sub txtRev_Leasing_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_Leasing.TextChanged
        CalcularMetas(TipoDeMeta.Valor, txtRev_Leasing, txtRev_LeasingP, txtRev_Venda, Totaliza_SubTotal.Despesas)
    End Sub

    Protected Sub txtRev_Informatica_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_Informatica.TextChanged
        CalcularMetas(TipoDeMeta.Valor, txtRev_Informatica, txtRev_InformaticaP, txtRev_Venda, Totaliza_SubTotal.Despesas)
    End Sub

    Protected Sub txtRev_PessoalP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_PessoalP.TextChanged
        CalcularMetas(TipoDeMeta.Percentual, txtRev_Pessoal, txtRev_PessoalP, txtRev_Venda, Totaliza_SubTotal.Despesas)
    End Sub

    Protected Sub txtRev_HonorariosP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_HonorariosP.TextChanged
        CalcularMetas(TipoDeMeta.Percentual, txtRev_Honorarios, txtRev_HonorariosP, txtRev_Venda, Totaliza_SubTotal.Despesas)
    End Sub

    Protected Sub txtRev_InformaticaP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_InformaticaP.TextChanged
        CalcularMetas(TipoDeMeta.Percentual, txtRev_Informatica, txtRev_InformaticaP, txtRev_Venda, Totaliza_SubTotal.Despesas)
    End Sub

    Protected Sub txtRev_ManutencaoP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_ManutencaoP.TextChanged
        CalcularMetas(TipoDeMeta.Percentual, txtRev_Manutencao, txtRev_ManutencaoP, txtRev_Venda, Totaliza_SubTotal.Despesas)
    End Sub

    Protected Sub txtRev_FrotaP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_FrotaP.TextChanged
        CalcularMetas(TipoDeMeta.Percentual, txtRev_Frota, txtRev_FrotaP, txtRev_Venda, Totaliza_SubTotal.Despesas)
    End Sub

    Protected Sub txtRev_EmbUsoConsumoP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_EmbUsoConsumoP.TextChanged
        CalcularMetas(TipoDeMeta.Percentual, txtRev_EmbUsoConsumo, txtRev_EmbUsoConsumoP, txtRev_Venda, Totaliza_SubTotal.Despesas)
    End Sub

    Protected Sub txtRev_EmbProdutosP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_EmbProdutosP.TextChanged
        CalcularMetas(TipoDeMeta.Percentual, txtRev_EmbProdutos, txtRev_EmbProdutosP, txtRev_Venda, Totaliza_SubTotal.Despesas)
    End Sub

    Protected Sub txtRev_UsoConsumoP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_UsoConsumoP.TextChanged
        CalcularMetas(TipoDeMeta.Percentual, txtRev_EmbUsoConsumo, txtRev_EmbUsoConsumoP, txtRev_Venda, Totaliza_SubTotal.Despesas)
    End Sub

    Protected Sub txtRev_PropGastoLojasP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_PropGastoLojasP.TextChanged
        CalcularMetas(TipoDeMeta.Percentual, txtRev_PropGastoLojas, txtRev_PropGastoLojasP, txtRev_Venda, Totaliza_SubTotal.Despesas)
    End Sub

    Protected Sub txtRev_ServicoPublicosP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_ServicoPublicosP.TextChanged
        CalcularMetas(TipoDeMeta.Percentual, txtRev_ServicoPublicos, txtRev_ServicoPublicosP, txtRev_Venda, Totaliza_SubTotal.Despesas)
    End Sub

    Protected Sub txtRev_SegurancaP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_SegurancaP.TextChanged
        CalcularMetas(TipoDeMeta.Percentual, txtRev_Seguranca, txtRev_SegurancaP, txtRev_Venda, Totaliza_SubTotal.Despesas)
    End Sub

    Protected Sub txtRev_InadimplentesP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_InadimplentesP.TextChanged
        CalcularMetas(TipoDeMeta.Percentual, txtRev_Inadimplentes, txtRev_InadimplentesP, txtRev_Venda, Totaliza_SubTotal.Despesas)
    End Sub

    Protected Sub txtRev_DespBancariasP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_DespBancariasP.TextChanged
        CalcularMetas(TipoDeMeta.Percentual, txtRev_DespBancarias, txtRev_DespBancariasP, txtRev_Venda, Totaliza_SubTotal.Despesas)
    End Sub

    Protected Sub txtRev_DiversasP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_DiversasP.TextChanged
        CalcularMetas(TipoDeMeta.Percentual, txtRev_Diversas, txtRev_DiversasP, txtRev_Venda, Totaliza_SubTotal.Despesas)
    End Sub

    Protected Sub txtRev_ViagensP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_ViagensP.TextChanged
        CalcularMetas(TipoDeMeta.Percentual, txtRev_Viagens, txtRev_ViagensP, txtRev_Venda, Totaliza_SubTotal.Despesas)
    End Sub

    Protected Sub txtRev_LeasingP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_LeasingP.TextChanged
        CalcularMetas(TipoDeMeta.Percentual, txtRev_Leasing, txtRev_LeasingP, txtRev_Venda, Totaliza_SubTotal.Despesas)
    End Sub

    Protected Sub txtRev_Sell_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_Sell.TextChanged
        CalcularMetas(TipoDeMeta.Valor, txtRev_Sell, txtRev_SellP, txtRev_Venda, Totaliza_SubTotal.OperacaoComercial)
    End Sub

    Protected Sub txtRev_SellP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_SellP.TextChanged
        CalcularMetas(TipoDeMeta.Percentual, txtRev_Sell, txtRev_SellP, txtRev_Venda, Totaliza_SubTotal.OperacaoComercial)
    End Sub

    Protected Sub txtRev_OutrasReceitas_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_OutrasReceitas.TextChanged
        CalcularMetas(TipoDeMeta.Valor, txtRev_OutrasReceitas, txtRev_OutrasReceitasP, txtRev_Venda, Totaliza_SubTotal.ResultadoOperacional)
    End Sub

    Protected Sub txtRev_OutrasReceitasP_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_OutrasReceitasP.TextChanged
        CalcularMetas(TipoDeMeta.Percentual, txtRev_OutrasReceitas, txtRev_OutrasReceitasP, txtRev_Venda, Totaliza_SubTotal.ResultadoOperacional)
    End Sub

    Protected Sub txtRev_ProvisaoCreditoP_TextChanged(sender As Object, e As EventArgs) Handles txtRev_ProvisaoCreditoP.TextChanged
        CalcularMetas(TipoDeMeta.Percentual, txtRev_ProvisaoCredito, txtRev_ProvisaoCreditoP, txtRev_Venda, Totaliza_SubTotal.ResultadoAntesIR)
    End Sub

    Protected Sub txtRev_ResFinCDP_TextChanged(sender As Object, e As EventArgs) Handles txtRev_ResFinCDP.TextChanged
        CalcularMetas(TipoDeMeta.Valor, txtRev_ResFinCD, txtRev_ResFinCDP, txtRev_Venda, Totaliza_SubTotal.ResultadoFinanceiro)
        Call CalcularResultadoAntesIR_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_ResFinLoja_TextChanged(sender As Object, e As EventArgs) Handles txtRev_ResFinLoja.TextChanged
        CalcularMetas(TipoDeMeta.Valor, txtRev_ResFinLoja, txtRev_ResFinLojaP, txtRev_Venda, Totaliza_SubTotal.ResultadoFinanceiro)
        Call CalcularResultadoAntesIR_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_ResFinLojaP_TextChanged(sender As Object, e As EventArgs) Handles txtRev_ResFinLojaP.TextChanged
        CalcularMetas(TipoDeMeta.Percentual, txtRev_ResFinLoja, txtRev_ResFinLojaP, txtRev_Venda, Totaliza_SubTotal.ResultadoFinanceiro)
        Call CalcularResultadoAntesIR_Revista(Me.txtRev_Venda.Text)
    End Sub

    Protected Sub txtRev_ProvisaoCredito_TextChanged(sender As Object, e As EventArgs) Handles txtRev_ProvisaoCredito.TextChanged
        CalcularMetas(TipoDeMeta.Valor, txtRev_ProvisaoCredito, txtRev_ProvisaoCreditoP, txtRev_Venda, Totaliza_SubTotal.ResultadoAntesIR)
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
        Call FormataNegativo_Label(Me.lblOri_Bonificacao, Me.lblOri_BonificacaoP)   'Recuperação de Contratos de Logistica

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
        Call FormataNegativo_Text(Me.txtRev_Bonificacao, txtRev_BonificacaoP)
    End Sub

    Private Sub LiberarSalvar()
        oVem.BuscaLiberaProgramaReplanejamento(Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial)
        If LCase(User.Identity.Name) = "eliseu" Or LCase(User.Identity.Name) = "eder" Or LCase(User.Identity.Name) = "jesuli" Then
            Me.btnSalvar.Enabled = True
        Else
            If oVem.LiberaReplanejamento = True Then
                Me.btnSalvar.Enabled = True
            Else
                Me.btnSalvar.Enabled = False
            End If
        End If
    End Sub

    Protected Sub txtRev_Venda_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles txtRev_Venda.TextChanged
        Call CalcularDadosFixoComBaseVenda()

    End Sub

   

    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        Call CalcularInicio()
    End Sub

    Protected Sub txtRev_QuebraTotalP_TextChanged(sender As Object, e As EventArgs) Handles txtRev_QuebraTotalP.TextChanged

        'If CDbl(txtRevP1.Text) > 0.0 Then
        '    If CDbl(Me.txtRev_QuebraTotalP.Text) > CDbl(Me.lblOri_QuebraTotalP.Text) Then
        '        oVem.UserMsgBox(Me, "O novo % de Quebra não pode ser maior que o % Original")
        '        Me.txtRev_QuebraTotalP.Focus()
        '    Else
        Me.txtRev_QuebraTotal.Text = CDbl(Me.txtRev_Venda.Text * CDbl(Me.txtRev_QuebraTotalP.Text) / 100).ToString("n0")
        Call CalcularCMV_Revista(Me.txtRev_Venda.Text)
        '    End If
        'End If

    End Sub

    Protected Sub cboAno_ListAnoChanged(sender As Object, e As EventArgs) Handles cboAno.ListAnoChanged
        Atualizar()
    End Sub

    Protected Sub cboMes_ListMesChanged(sender As Object, e As EventArgs) Handles cboMes.ListMesChanged
        Atualizar()
        If cboAno.CallAno = DateAndTime.Now().Year Then
            Select Case cboMes.CallMes
                Case 11, 12
                    txtRev_Venda.Enabled = True
                Case Else
                    txtRev_Venda.Enabled = False
            End Select
        End If
    End Sub

    Protected Sub txtRev_BonificacaoCD_TextChanged(sender As Object, e As EventArgs) Handles txtRev_BonificacaoCD.TextChanged
        CalcularMetas(TipoDeMeta.Valor, txtRev_BonificacaoCD, txtRev_BonificacaoCDP, txtRev_Venda, Totaliza_SubTotal.OperacaoComercial)
    End Sub

    'Protected Sub txtRev_PapaFila_TextChanged(sender As Object, e As EventArgs) Handles txtRev_PapaFila.TextChanged
    '    CalcularMetas(TipoDeMeta.Valor, txtRev_PapaFila, txtRev_PapaFilaP, txtRev_Venda, Totaliza_SubTotal.OperacaoComercial)
    'End Sub

    Protected Sub btnSalvar_Click(sender As Object, e As EventArgs) Handles btnSalvar.Click
        Dim vMess As String
        'vMess = "O Replanejamento foi salvo com sucesso - Controladoria!!! " & CStr(Me.cboAno.CallAno) & " Mes: " & CStr(Me.cboMes.CallMes) & " Filial: " & Me.cboFilial.CallFilial & " "
        vMess = "O Replanejamento foi salvo com sucesso - Controladoria!!! "
        If LCase(User.Identity.Name) = "eliseu" Or LCase(User.Identity.Name) = "eder" Or LCase(User.Identity.Name) = "jesuli" Then
            Call Salvar_Meta_Revista()
            Call SalvarEmpresa_Valor()
            oVem.CalcularMetaRevistaSecao(Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial, Me.User.Identity.Name)
            oVem.UserMsgBox(Me, vMess)
        Else

            If CDbl(Me.txtRev_ResFinalP.Text) < CDbl(Me.lblOri_ResFinalP.Text) Then
                oVem.UserMsgBox(Me, "O percentual Revisto do Resultado Final tem que ser Igual ou Maior que o percentual Original.")
                Me.txtRev_QuebraTotalP.Focus()
            Else
                Call Salvar_Meta_Revista()
                Call SalvarEmpresa_Valor()
                oVem.CalcularMetaRevistaSecao(Me.cboAno.CallAno, Me.cboMes.CallMes, Me.cboFilial.CallFilial, Me.User.Identity.Name)
                oVem.UserMsgBox(Me, "O Replanejamento foi salvo com sucesso!!!")
            End If

        End If
    End Sub

    Protected Sub btnAtualizar_Click(sender As Object, e As EventArgs) Handles btnAtualizar.Click
        Atualizar()
        'Me.txtRev_QuebraTotal.Text = "77"
        oVem.UserMsgBox(Me, "Atualizado")
    End Sub

End Class

      