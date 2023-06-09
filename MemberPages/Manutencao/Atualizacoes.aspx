<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Atualizacoes.aspx.vb" Inherits="MemberPages_Manutencao_Atualizacoes" %>

<%@ Register Src="../../Controles/wuciAno.ascx" TagName="wuciAno" TagPrefix="uc1" %>
<%@ Register Src="../../Controles/wuciListaMes.ascx" TagName="wuciListaMes" TagPrefix="uc2" %>

<%@ Register Src="../../Controles/wucBotaoAtualizar.ascx" TagName="wucBotaoAtualizar" TagPrefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div class="container col-12 justify-content-center" style="padding: 15px 0 15px 0; max-width: 98%; font-size: 12px; font: bold" runat="server" id="divMenu">
        <div class="row col-md-12 justify-content-center text-center">
            <div class="col col-auto xs" style="width: 130px; padding-right: 2px">
                <div class="input-group input-group-sm">
                    <div class="input-group-prepend">
                        <div class="input-group-text xs-2">Ano</div>
                    </div>
                    <asp:DropDownList class="form-control" ID="selAno" runat="server" DataTextField="Desc" AutoPostBack="false"></asp:DropDownList>
                </div>
            </div>
            <div class="col col-auto xs" style="width: 180px; padding-right: 2px">
                <div class="input-group input-group-sm">
                    <div class="input-group-prepend">
                        <div class="input-group-text xs-2">Mês</div>
                    </div>
                    <asp:DropDownList class="form-control" ID="selMes" runat="server" DataTextField="Desc" AutoPostBack="false">
                        <asp:ListItem Text="Janeiro" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Fevereiro" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Março" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Abril" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Maio" Value="5"></asp:ListItem>
                        <asp:ListItem Text="Junho" Value="6"></asp:ListItem>
                        <asp:ListItem Text="Julho" Value="7"></asp:ListItem>
                        <asp:ListItem Text="Agosto" Value="8"></asp:ListItem>
                        <asp:ListItem Text="Setembro" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Outubro" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Novembro" Value="11"></asp:ListItem>
                        <asp:ListItem Text="Dezembro" Value="12"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
        </div>
    </div>

    <div class="container col-12 justify-content-center" style="padding: 15px 0 15px 0; max-width: 40%; font-size: 14px" runat="server" id="div1">
        <div class="row col-md-12 justify-content-between text-center" style="border: 1px solid; padding: 15px 0 10px 0">
            <div class="col col-auto xs" style="padding-right: 2px">
                <div class="input-group input-group-sm">
                    <uc3:wucBotaoAtualizar ID="btnAtualizarDespesasDoProgress" runat="server" btnSalvar_Text="Importar Despesas" />
                    <div class="input-group-prepend">
                        <div class="input-group-text xs-2"><strong>Importar as Despesas do Progress, selecione o Ano e o Mês.</strong></div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row col-md-12 justify-content-between text-center" style="border: 1px solid;padding: 15px 0 10px 0">
            <div class="col col-auto xs" style="padding-right: 2px">
                <div class="input-group input-group-sm">
                    <uc3:wucBotaoAtualizar ID="btnAtualizarDespesas" runat="server" btnSalvar_Text="Atualizar Despesas" />
                    <div class="input-group-prepend">
                        <div class="input-group-text xs-2"><strong>Atualizar as Despesas, selecione o Ano e o Mês e clique em Atualizar.</strong></div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row col-md-12 justify-content-between text-center" style="border: 1px solid; border-bottom: none;padding: 15px 0 10px 0;">
            <div class="col col-auto xs" style="padding-right: 2px">
                <div class="input-group input-group-sm">
                    <uc3:wucBotaoAtualizar ID="btnReatuVenda" runat="server" />
                    <div class="input-group-prepend">
                        <div class="input-group-text xs-2"><strong>Reatualiza as Vendas SLV por Dia do periodo especificado.</strong></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row col-md-12 justify-content-center text-center" style="border: 1px solid; border-top: none;">
            <div class="col col-auto xs" style="padding-right: 2px">
                <br />
                <strong>Recalcula o Depto, Seção, Grupo e Sub-grupo com base na tabela Filial.tblVendaItens(loja).</strong>
            </div>
        </div>
        <br />
        <div class="row col-md-12 justify-content-between text-center" style="border: 1px solid;padding: 15px 0 10px 0">
            <div class="col col-auto xs" style="padding-right: 2px">
                <div class="input-group input-group-sm">
                    <uc3:wucBotaoAtualizar ID="btnAtualizarTeorico" runat="server" />
                    <div class="input-group-prepend" style="width: 600px">
                        <div class="input-group-text xs-2"><strong>Atualizar teórico.</strong></div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row col-md-12 justify-content-between text-center" style="border: 1px solid; border-bottom: none; padding: 10px 5px 5px 5px">
            <div class="col col-auto xs" style="padding-right: 2px">
                <div class="input-group input-group-sm">
                    <uc3:wucBotaoAtualizar ID="btnAtualizarMetaDiaSecao" runat="server" btnSalvar_Text="Atualizar Meta Diária" />
                    <div class="input-group-prepend" style="width: 600px">
                        <div class="input-group-text xs-2"><strong>Atualiza a Meta Diaria, a Meta Diaria por Seção e a Sugestão de Venda.</strong></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row col-md-12 justify-content-center text-center" style="border: 1px solid; border-top: none;">
            <div class="col col-auto xs" style="padding-right: 2px">
                <strong>Selecione o Ano e Mês.</strong>
            </div>
        </div>
        <br />
        <div class="row col-md-12 justify-content-between text-center" style="border: 1px solid;padding: 15px 0 10px 0">
            <div class="col col-auto xs" style="padding-right: 2px">
                <div class="input-group input-group-sm">
                    <uc3:wucBotaoAtualizar ID="btnAtualizaMetaRevista" runat="server" btnSalvar_Text="Atualizar Meta Revista" />
                    <div class="input-group-prepend" style="width: 600px">
                        <div class="input-group-text xs-2"><strong>Atualiza as Metas Revista no Banco Quente.</strong></div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row col-md-12 justify-content-center text-center" style="background-color: #009933; color: #FFFFFF; font-style: normal; font-weight: bold;padding: 15px 0 10px 0">
            <div class="col col-auto xs" style="padding-right: 2px">
                <strong>SLV - Mercadológico</strong>
            </div>
        </div>
        <div class="row col-md-12 justify-content-between text-center" style="border: 1px solid;padding: 15px 0 10px 0">
            <div class="col col-auto xs" style="padding-right: 2px">
                <div class="input-group input-group-sm">
                    <uc3:wucBotaoAtualizar ID="btnAtualizaFlash" runat="server" btnSalvar_Text="Atualizar FLASH" />
                    <div class="input-group-prepend" style="width: 600px">
                        <div class="input-group-text xs-2"><strong>Atualiza o FLASH de Vendas</strong></div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row col-md-12 justify-content-between text-center" style="border: 1px solid;padding: 15px 0 10px 0">
            <div class="col col-auto xs" style="padding-right: 2px">
                <div class="input-group input-group-sm">
                    <uc3:wucBotaoAtualizar ID="btnAtualizaCadastroProduto" runat="server" btnSalvar_Text="Importar Cadastro de Produtos" />
                    <div class="input-group-prepend" style="width: 600px">
                        <div class="input-group-text xs-2"><strong>Importa o Cadastro de Produto, por Sub-grupo, Grupo, Secao e Depto.</strong></div>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="row col-md-12 justify-content-center text-center" style="border: 1px solid; border-bottom: none; padding: 10px 5px 5px 5px">
            <div class="col col-auto xs" style="padding-right: 2px">
                <div class="input-group input-group-sm">
                    <uc3:wucBotaoAtualizar ID="btnAtualizaVendasPorGrupo" runat="server" btnSalvar_Text="Importar Cadastro de Produtos" />
                    <div class="input-group-prepend">
                        <div class="input-group-text xs-2"><strong>Atualiza as Vendas por Grupo.</strong></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row col-md-12 justify-content-center text-center" style="border: 1px solid; border-top: none; border-bottom: none">
            <div class="col col-auto xs" style="width: 200px; padding-right: 2px">
                <br />
                <div class="input-group input-group-sm">
                    <div class="input-group-prepend">
                        <div class="input-group-text xs-2">Mês Inicial</div>
                    </div>
                    <asp:DropDownList class="form-control" ID="ddlMesInicial" runat="server" DataTextField="Desc" AutoPostBack="false">
                        <asp:ListItem Text="Janeiro" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Fevereiro" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Março" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Abril" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Maio" Value="5"></asp:ListItem>
                        <asp:ListItem Text="Junho" Value="6"></asp:ListItem>
                        <asp:ListItem Text="Julho" Value="7"></asp:ListItem>
                        <asp:ListItem Text="Agosto" Value="8"></asp:ListItem>
                        <asp:ListItem Text="Setembro" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Outubro" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Novembro" Value="11"></asp:ListItem>
                        <asp:ListItem Text="Dezembro" Value="12"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
            <div class="col col-auto xs" style="width: 200px; padding-right: 2px">
                <br />
                <div class="input-group input-group-sm">
                    <div class="input-group-prepend">
                        <div class="input-group-text xs-2">Mês Final</div>
                    </div>
                    <asp:DropDownList class="form-control" ID="ddlMesFinal" runat="server" DataTextField="Desc" AutoPostBack="false">
                        <asp:ListItem Text="Janeiro" Value="1"></asp:ListItem>
                        <asp:ListItem Text="Fevereiro" Value="2"></asp:ListItem>
                        <asp:ListItem Text="Março" Value="3"></asp:ListItem>
                        <asp:ListItem Text="Abril" Value="4"></asp:ListItem>
                        <asp:ListItem Text="Maio" Value="5"></asp:ListItem>
                        <asp:ListItem Text="Junho" Value="6"></asp:ListItem>
                        <asp:ListItem Text="Julho" Value="7"></asp:ListItem>
                        <asp:ListItem Text="Agosto" Value="8"></asp:ListItem>
                        <asp:ListItem Text="Setembro" Value="9"></asp:ListItem>
                        <asp:ListItem Text="Outubro" Value="10"></asp:ListItem>
                        <asp:ListItem Text="Novembro" Value="11"></asp:ListItem>
                        <asp:ListItem Text="Dezembro" Value="12"></asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>
        </div>
        <div class="row col-md-12 justify-content-center text-center" style="border: 1px solid; border-top: none;">
            <div class="col col-auto xs" style="padding-right: 2px">
                <br />
                <strong>Pega todas as Vendas de todas as seções e grupos e todas as lojas.<br />
                    Defina o Ano e Mês Inicial e Final. 
                    Depois de atualizar vá em gerManager.SLV.AnaliseAnoAnterior</strong>
                <br />
            </div>            
        </div>
    </div>

    <p><a href="../_BACK/Testando7.aspx"></a>Condor</p>
</asp:Content>


<%--    <table class="auto-style2">
        <tr>
            <td class="auto-style6">
                <table class="auto-style2">
                    <tr>
                        <td style="border: 2px solid #808080" class="auto-style14"></td>
                        <td style="border: 2px solid #808080; background-color: #C0C0C0;" class="auto-style17">Importar as Despesas do Progress, selecione o Ano e o Mês.</td>
                        <td class="auto-style16">&nbsp;</td>
                        <td class="auto-style12">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="border: 2px solid #808080" class="auto-style14"></td>
                        <td style="border: 2px solid #808080; background-color: #C0C0C0;" class="auto-style17">Atualizar as Despesas, selecione o Ano e o Mês e clique em Atualizar.</td>
                        <td class="auto-style16">Banco: gerManager</td>
                        <td class="auto-style12">SP: Despesas.ImportarDespesas</td>
                    </tr>
                    <tr>
                        <td style="border: 2px solid #808080" class="auto-style14">
                            <br />

                        </td>
                        <td style="border: 2px solid #808080" class="auto-style15"></td>
                    </tr>
                    <tr style="padding: 10px; margin: 10px; border: 1px solid #808080;">
                        <td style="padding: 10px; margin: 10px; border: 2px solid #808080;"
                            class="auto-style14"></td>
                        <td class="auto-style15" style="border: 2px solid #808080"></td>
                    </tr>
                    <tr>
                        <td style="border: 2px solid #808080" class="auto-style14"></td>
                        <td style="border: 2px solid #808080" class="auto-style15"></td>
                    </tr>
                    <tr>
                        <td colspan="2"></td>
                    </tr>
                    <tr>
                        <td style="border: 2px solid #808080" class="auto-style14"></td>
                        <td style="border: 2px solid #808080" class="auto-style15">, </td>
                    </tr>
                    <tr>
                        <td style="border: 2px solid #808080" class="auto-style14"></td>
                        <td style="border: 2px solid #808080" class="auto-style15"></td>
                    </tr>
                    <tr>
                        <td class="auto-style10"></td>
                        <td class="auto-style8"></td>
                        <td class="auto-style16">
                            <uc2:wuciListaMes ID="cboMesInicial" runat="server"
                                LabelDescMes="Mês Inicial" />
                        </td>
                        <td class="auto-style12">
                            <uc2:wuciListaMes ID="cboMesFinal" runat="server" LabelDescMes="Mês Final" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style10">&nbsp;</td>
                        <td class="auto-style8">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style14">&nbsp;</td>
                        <td class="auto-style15">&nbsp;</td>
                    </tr>
                </table>
                <br />
            </td>
        </tr>
    </table>--%>