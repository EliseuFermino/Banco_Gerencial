<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Atualizacoes.aspx.vb" Inherits="MemberPages_Manutencao_Atualizacoes" %>

<%@ Register src="../../Controles/wuciAno.ascx" tagname="wuciAno" tagprefix="uc1" %>
<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc2" %>

<%@ Register src="../../Controles/wucBotaoAtualizar.ascx" tagname="wucBotaoAtualizar" tagprefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 1000px;
        }
        .auto-style3 {
            width: 170px;
        }
        .auto-style4 {
            width: 143px;
        }
        .auto-style6 {
            width: 578px;
        }
        .auto-style8 {
            height: 21px;
            width: 353px;
        }
        .auto-style10 {
            height: 21px;
            width: 97px;
        }
        .auto-style12 {
            width: 199px;
        }
        .auto-style14 {
            width: 97px;
        }
        .auto-style15 {
            width: 353px;
        }
        .auto-style16 {
            width: 139px;
        }
        .auto-style17 {
            width: 353px;
            font-size: small;
        }
        .auto-style18 {
            width: 126px;
            vertical-align: central;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="auto-style2">
        <tr>
            <td class="auto-style6">
                <table class="auto-style2">
                    <tr>
                        <td class="auto-style18">
                            <uc1:wuciAno ID="cboAno" runat="server" />
                        </td>
                        <td class="auto-style4">
                            <uc2:wuciListaMes ID="cboMes" runat="server" />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <table class="auto-style2">
                    <tr>
                        <td style="border: 2px solid #808080" class="auto-style14">
                            <uc3:wucBotaoAtualizar ID="btnAtualizarDespesasDoProgress" runat="server" btnSalvar_Text="Importar Despesas" />
                        </td>
                        <td style="border: 2px solid #808080; background-color: #C0C0C0; " class="auto-style17">
                            Importar as Despesas do Progress, selecione o Ano e o Mês.</td>
                        <td class="auto-style16">&nbsp;</td>
                        <td class="auto-style12">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="border: 2px solid #808080" class="auto-style14">
                            <uc3:wucBotaoAtualizar ID="btnAtualizarDespesas" runat="server" btnSalvar_Text="Atualizar Despesas" />
                        </td>
                        <td style="border: 2px solid #808080; background-color: #C0C0C0; " class="auto-style17">
                            Atualizar as Despesas, selecione o Ano e o Mês e clique em Atualizar.</td>
                        <td class="auto-style16">Banco: gerManager</td>
                        <td class="auto-style12">SP: Despesas.ImportarDespesas</td>
                    </tr>
                    <tr>
                        <td style="border: 2px solid #808080" class="auto-style14">
                            <br />
                            <uc3:wucBotaoAtualizar ID="btnReatuVenda" runat="server" />
                        </td>
                        <td style="border: 2px solid #808080" class="auto-style15">
                            Reatualiza as Vendas SLV por Dia do periodo especificado. Recalcula o Depto, 
                            Seção, Grupo e Sub-grupo com base na tabela Filial.tblVendaItens(loja).</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <uc3:wucBotaoAtualizar ID="btnAtualizarTeorico" runat="server" />
                        </td>
                    </tr>
                    <tr style="padding: 10px; margin: 10px; border: 1px solid #808080;">
                        <td style="padding: 10px; margin: 10px; border: 2px solid #808080;" 
                            class="auto-style14">
                            <uc3:wucBotaoAtualizar ID="btnAtualizarMetaDiaSecao" runat="server" 
                                btnSalvar_Text="Atualizar Meta Diária" />
                        </td>
                        <td class="auto-style15" style="border: 2px solid #808080">
                            Atualiza a Meta Diaria, a Meta Diaria por Seção e a Sugestão de Venda. <strong>
                            Selecione o Ano e Mês.</strong></td>
                    </tr>
                    <tr>
                        <td style="border: 2px solid #808080" class="auto-style14">
                            <uc3:wucBotaoAtualizar ID="btnAtualizaMetaRevista" runat="server" 
                                btnSalvar_Text="Atualizar Meta Revista" />
                        </td>
                        <td style="border: 2px solid #808080" class="auto-style15">
                            Atualiza as Metas Revista no Banco Quente.</td>
                    </tr>
                    <tr>
                        <td colspan="2" 
                            style="background-color: #009933; color: #FFFFFF; font-style: normal; font-weight: bold">
                            SLV - Mercadológico</td>
                    </tr>
                    <tr>
                        <td style="border: 2px solid #808080" class="auto-style14">
                            <uc3:wucBotaoAtualizar ID="btnAtualizaFlash" runat="server" 
                                btnSalvar_Text="Atualizar FLASH" />
                        </td>
                        <td style="border: 2px solid #808080" class="auto-style15">
                            Atualiza o FLASH de Vendas, </td>
                    </tr>
                    <tr>
                        <td style="border: 2px solid #808080" class="auto-style14">
                            <uc3:wucBotaoAtualizar ID="btnAtualizaCadastroProduto" runat="server" 
                                btnSalvar_Text="Importar Cadastro de Produtos" />
                        </td>
                        <td style="border: 2px solid #808080" class="auto-style15">
                            Importa o Cadastro de Produto, por Sub-grupo, Grupo, Secao e Depto.</td>
                    </tr>
                    <tr>
                        <td class="auto-style10">
                            <uc3:wucBotaoAtualizar ID="btnAtualizaVendasPorGrupo" runat="server" 
                                btnSalvar_Text="Importar Cadastro de Produtos" />
                        </td>
                        <td class="auto-style8">
                            Atualiza as Vendas por Grupo. Pega todas as Vendas de todas as seções e grupos e 
                            todas as lojas. <strong>Defina o Ano e Mês Inicial e Final. </strong>Depois de 
                            atualizar vá em gerManager.SLV.AnaliseAnoAnterior</td>
                        <td class="auto-style16">
                            <uc2:wuciListaMes ID="cboMesInicial" runat="server" 
                                LabelDescMes="Mês Inicial" />
                        </td>
                        <td class="auto-style12">
                            <uc2:wuciListaMes ID="cboMesFinal" runat="server" LabelDescMes="Mês Final" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style10">
                            &nbsp;</td>
                        <td class="auto-style8">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style14">
                            &nbsp;</td>
                        <td class="auto-style15">
                            &nbsp;</td>
                    </tr>
                </table>
                <br />
            </td>
        </tr>
    </table>

    <p><a href="../_BACK/Testando7.aspx"></a>Condor</p>

</asp:Content>

