<%@ Page Title="Replanejamento" Language="VB" MasterPageFile="~/MemberPages/SiteMetas.master" AutoEventWireup="false" CodeFile="webAP0154.aspx.vb" Inherits="MemberPages_Replanejamento_frmAP0154" %>

<%@ Register src="../../Controles/wucAnoMes.ascx" tagname="wucAnoMes" tagprefix="uc4" %>
<%@ Register src="../../Controles/wuciListaLojasComApoio.ascx" tagname="wuciListaLojasComApoio" tagprefix="uc5" %>

<%@ Register src="../../Controles/wucAnoMesFilial.ascx" tagname="wucAnoMesFilial" tagprefix="uc1" %>

<%@ Register src="../../Controles/wucBotaoAtualizar.ascx" tagname="wucBotaoAtualizar" tagprefix="uc2" %>

<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc3" %>
<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc6" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register src="../../Controles/wucListaLojasComCorporacao.ascx" tagname="wucListaLojasComCorporacao" tagprefix="uc7" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <link href="../../App_Themes/Replanejamento.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
  
    <table >
        <tr>
            <td>
                <asp:Panel ID="Panel1" runat="server">
                    <table >
                        <tr>
                            <td align="left" valign="top">
                                <uc3:wucAno ID="cboAno" runat="server" />
                            </td>
                            <td align="left" valign="top">
                                <uc6:wuciListaMes ID="cboMes" runat="server" />
                            </td>
                            <td align="left" valign="top">
                                <uc7:wucListaLojasComCorporacao ID="cboFilial" runat="server" />
                            </td>
                            <td align="left" >
                                <uc2:wucBotaoAtualizar ID="btnSalvar" runat="server" 
                                    Loading_Text="Salvando Replanejamento. Aguarde..." />
                            </td>
                            <td align="left">
                                <asp:Button ID="Button3" runat="server" Text="Original" Visible="False" />
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <table class="TabelaBorda">        
        <tr>
            <td align="center" bgcolor="#FF9900" style="border: 1px solid #999999">Descrição</td>
            <td align="center" bgcolor="#FF9900" style="border: 1px solid #999999">Original</td>
            <td align="center" bgcolor="#FF9900" style="border: 1px solid #999999">%</td>
            <td class="style11">&nbsp;</td>
            <td align="center" bgcolor="#CAEEFF" style="border: 1px solid #999999;">Revista</td>
            <td align="center" bgcolor="#CAEEFF" style="border: 1px solid #999999">%</td>
        </tr> <%--************************ C M V  ****************************************************************************************************************--%><%-- CMV - Verde--%>

        <tr>
            <td class="DescConta_V" style="font-weight: 700">Venda Bruta</td>
            <td class="cssVlrOriginal_V" style="font-weight: 700"><asp:Label ID="lblOri_Venda" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_V" style="font-weight: 700"><asp:Label ID="lblOri_VendaP" runat="server" Text="100,00"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_V" style="font-weight: 700"><asp:TextBox ID="txtRev_Venda" runat="server"  BorderStyle="None" Width="90px" ForeColor="Black" CssClass="styVlrRev"></asp:TextBox></td>
            <td class="cssPercRevista_V" style="font-weight: 700"><asp:Label ID="txtRevP1" runat="server" BorderStyle="None" Width="45px" ForeColor="Black" CssClass="styVlrRev"></asp:Label></td>
        </tr>   <%--Margem Teórica - Branco --%> 

        <tr>
            <td class="DescConta_B">Impostos</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_Impostos" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_ImpostosP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:Label ID="txtRev_Impostos" runat="server"  BorderStyle="None" Width="90px" ForeColor="Black" CssClass="styVlrRev_B"></asp:Label></td>
            <td class="cssPercRevista_B"><asp:Label ID="txtRev_ImpostosP" runat="server" BorderStyle="None" Width="45px" ForeColor="Black" CssClass="styVlrRev_B"></asp:Label></td>
        </tr>   <%-- Quebra Total - Rosa--%> 

        <tr>
            <td class="DescConta_B" style="font-weight: 700">Venda Liquida</td>
            <td class="cssVlrOriginal_B" style="font-weight: 700"><asp:Label ID="lblOri_VendaLiquida" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B" style="font-weight: 700"><asp:Label ID="lblOri_VendaLiquidaP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B" style="font-weight: 700"><asp:Label ID="txtRev_VendaLiquida" runat="server"  BorderStyle="None" Width="90px" ForeColor="Black" CssClass="styVlrRev_B"></asp:Label></td>
            <td class="cssPercRevista_B" style="font-weight: 700"><asp:Label ID="txtRev_VendaLiquidaP" runat="server" BorderStyle="None" Width="45px" ForeColor="Black" CssClass="styVlrRev_B"></asp:Label></td>
        </tr>   <%--************************ OPERAÇÃO  COMERCIAL ****************************************************************************************--%><%-- Operações Comerciais - Branco--%>
        <tr>
            <td class="DescConta_V" style="font-weight: 700">CMV</td>
            <td class="cssVlrOriginal_V" style="font-weight: 700"><asp:Label ID="lblOri_CMV" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_V" style="font-weight: 700"><asp:Label ID="lblOri_CMVP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_V" style="font-weight: 700"><asp:Label ID="txtRev_CMV" runat="server"  BorderStyle="None" Width="90px" ForeColor="Black" CssClass="styVlrRev"></asp:Label></td>
            <td class="cssPercRevista_V" style="font-weight: 700"><asp:Label ID="txtRev_CMVP" runat="server" BorderStyle="None" Width="45px" ForeColor="Black" CssClass="styVlrRev"></asp:Label></td>
        </tr>   <%--Bonificação - Branco --%> 

        <tr>
            <td class="DescConta_B">Margem Teórica</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_MargemTeórica" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_MargemTeóricaP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_MargemTeórica" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" onfocus="this.select();"  ForeColor="Blue" CssClass="styVlrRev_B"></asp:TextBox></td>
            <td class="cssPercRevista_B"><asp:TextBox ID="txtRev_MargemTeóricaP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" onfocus="this.select();" ForeColor="Blue" CssClass="styVlrRev_B"></asp:TextBox></td>
        </tr>   <%-- Bonificação - CD - Laranja--%>

        <tr>
            <td class="DescConta_R" style="font-weight: 700">Quebra Total</td>
            <td class="cssVlrOriginal_R" style="font-weight: 700"><asp:Label ID="lblOri_QuebraTotal" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_R" style="font-weight: 700"><asp:Label ID="lblOri_QuebraTotalP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_R" style="font-weight: 700"><asp:Label ID="txtRev_QuebraTotal" runat="server"  BorderStyle="None" Width="90px" CssClass="styVlrRev_R"></asp:Label></td>
            <td class="cssPercRevista_R"><dx:ASPxTextBox ID="txtRev_QuebraTotalP" runat="server" AutoPostBack="True" CssClass="styVlrRev_L" DisplayFormatString="{0:n2}" onfocus="this.select();" ForeColor="Blue" Width="45px" BackColor="#FFE8E8" Height="18px"><Border BorderStyle="None" /></dx:ASPxTextBox></td>

        </tr>   <%-- Contratos - Branco--%><%-- Condição Especial - Laranja--%>

        <tr>
            <td class="DescConta_B" style="font-weight: 700">Operações Comerciais</td>
            <td class="cssVlrOriginal_B" style="font-weight: 700"><asp:Label ID="lblOri_OperacoesComerciais" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B" style="font-weight: 700"><asp:Label ID="lblOri_OperacoesComerciaisP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B" style="font-weight: 700"><asp:Label ID="txtRev_OperacoesComerciais" runat="server"  BorderStyle="None" Width="90px" CssClass="styVlrRev_B"></asp:Label></td>
            <td class="cssPercRevista_B" style="font-weight: 700"><asp:Label ID="txtRev_OperacoesComerciaisP" runat="server" BorderStyle="None" Width="45px" ForeColor="Black" CssClass="styVlrRev_B"></asp:Label></td>
        </tr>   <%-- Condição Especial - CD - Branco--%> 

        <tr>
            <td class="DescConta_B">Bonificação</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_Bonificacao" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_BonificacaoP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_Bonificacao" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
            <td class="cssPercRevista_B"><asp:TextBox ID="txtRev_BonificacaoP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
        </tr>   <%-- Ponta de Gôndola - Laranja--%>

        <tr>
            <td class="DescConta_L">Bonificação - CD</td>
            <td class="cssVlrOriginal_L"><asp:Label ID="lblOri_BonificacaoCD" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_L"><asp:Label ID="lblOri_BonificacaoCDP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_L"><asp:Label ID="txtRev_BonificacaoCD" runat="server"  BorderStyle="None" Width="90px" ForeColor="Black" CssClass="styVlrRev_L"></asp:Label></td>
            <td class="cssPercRevista_L"><asp:Label ID="txtRev_BonificacaoCDP" runat="server" BorderStyle="None" Width="45px" ForeColor="Black" CssClass="styVlrRev_L"></asp:Label></td>
        </tr>   <%-- Marketing - Branco--%> 

        <tr>
            <td class="DescConta_B">Contratos</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_Contratos" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_ContratosP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:Label ID="txtRev_Contratos" runat="server"  BorderStyle="None" Width="90px" CssClass="styVlrRev_B"></asp:Label></td>
            <td class="cssPercRevista_B"><asp:Label ID="txtRev_ContratosP" runat="server" BorderStyle="None" Width="45px" ForeColor="Black" CssClass="styVlrRev_B"></asp:Label></td>
        </tr>   <%-- Sell-out - Laranja--%> 

        <tr>
            <td class="DescConta_L" style="height: 7px">Condição Especial</td>
            <td class="cssVlrOriginal_L" style="height: 7px"><asp:Label ID="lblOri_CondicaoEspecial" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_L" style="height: 7px"><asp:Label ID="lblOri_CondicaoEspecialP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco" style="height: 7px"></td>
            <td class="cssVlrRevista_L" style="height: 7px"><asp:TextBox ID="txtRev_CondicaoEspecial" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" onfocus="this.select();" CssClass="styVlrRev_L"></asp:TextBox></td>
            <td class="cssPercRevista_L" style="height: 7px"><asp:TextBox ID="txtRev_CondicaoEspecialP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_L"></asp:TextBox></td>
        </tr>   <%-- Margem Operacional - Branco--%> 

        <tr>
            <td class="DescConta_B" style="height: 25px">Condição Especial - CD</td>
            <td class="cssVlrOriginal_B" style="height: 25px"><asp:Label ID="lblOri_CondicaoEspecialCD" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B" style="height: 25px"><asp:Label ID="lblOri_CondicaoEspecialCDP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco" style="height: 25px"></td>
            <td class="cssVlrRevista_B" style="height: 25px"><asp:Label ID="txtRev_CondicaoEspecialCD" runat="server"  BorderStyle="None" Width="90px" CssClass="styVlrRev_B"></asp:Label></td>
            <td class="cssPercRevista_B" style="height: 25px"><asp:Label ID="txtRev_CondicaoEspecialCDP" runat="server" BorderStyle="None" Width="45px" ForeColor="Black" CssClass="styVlrRev_B"></asp:Label></td>
        </tr>   <%--************************ D E S P E S A S ***************************************************************--%> 

        <tr>
            <td class="DescConta_L">Ponta de Gôndola</td>
            <td class="cssVlrOriginal_L"><asp:Label ID="lblOri_PontaDeGondola" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_L"><asp:Label ID="lblOri_PontaDeGondolaP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_L"><asp:TextBox ID="txtRev_PontaDeGondola" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" onfocus="this.select();" CssClass="styVlrRev_L"></asp:TextBox></td>
            <td class="cssPercRevista_L"><asp:TextBox ID="txtRev_PontaDeGondolaP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_L"></asp:TextBox></td>
        </tr>   <%-- Despesas Operacionais - Amarelo--%> 

        <tr>
            <td class="DescConta_B">Marketing</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_Marketing" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_MarketingP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:Label ID="txtRev_Marketing" runat="server"  BorderStyle="None" Width="90px" CssClass="styVlrRev_B"></asp:Label></td>
            <td class="cssPercRevista_B"><asp:Label ID="txtRev_MarketingP" runat="server" BorderStyle="None" Width="45px" ForeColor="Black" CssClass="styVlrRev_B"></asp:Label></td>
        </tr>   <%--Pessoal - Branco --%> 

        <tr>
            <td class="DescConta_L">Sell-out</td>
            <td class="cssVlrOriginal_L"><asp:Label ID="lblOri_Sell" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_L"><asp:Label ID="lblOri_SellP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_L"><asp:TextBox ID="txtRev_Sell" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" onfocus="this.select();" CssClass="styVlrRev_L"></asp:TextBox></td>
            <td class="cssPercRevista_L"><asp:TextBox ID="txtRev_SellP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_L"></asp:TextBox></td>
        </tr>   <%--Honorários Profissionais - Verde --%> 

        <tr>
            <td class="DescConta_B" style="font-weight: 700">Margem Operacional</td>
            <td class="cssVlrOriginal_B" style="font-weight: 700"><asp:Label ID="lblOri_MargemOperacional" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B" style="font-weight: 700"><asp:Label ID="lblOri_MargemOperacionalP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B" style="font-weight: 700"><asp:Label ID="txtRev_MargemOperacional" runat="server"  BorderStyle="None" Width="90px" CssClass="styVlrRev_B"></asp:Label></td>
            <td class="cssPercRevista_B" style="font-weight: 700"><asp:Label ID="txtRev_MargemOperacionalP" runat="server" BorderStyle="None" Width="45px" ForeColor="Black" CssClass="styVlrRev_B"></asp:Label></td>
        </tr>   <%--Informática - Branco --%> <%--Manutenção--%>
        <tr>
            <td class="DescConta_A" style="font-weight: 700">Despesas Operacionais</td>
            <td class="cssVlrOriginal_A" style="font-weight: 700"><asp:Label ID="lblOri_Despesas" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_A" style="font-weight: 700"><asp:Label ID="lblOri_DespesasP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_A" style="font-weight: 700"><asp:Label ID="txtRev_Despesas" runat="server"  BorderStyle="None" Width="90px" CssClass="styVlrRev_A"></asp:Label></td>
            <td class="cssPercRevista_A" style="font-weight: 700"><asp:Label ID="txtRev_DespesasP" runat="server" BorderStyle="None" Width="45px" ForeColor="Black" CssClass="styVlrRev_A"></asp:Label></td>
        </tr>   <%--Frota - Branco--%> 

        <tr>
            <td class="DescConta_B">Pessoal</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_Pessoal" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_PessoalP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_Pessoal" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
            <td class="cssPercRevista_B"><asp:TextBox ID="txtRev_PessoalP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
        </tr>   <%--(-) Rec. Contratos de Logisticao - Verde--%>

        <tr>
            <td class="DescConta_V">Honorários Profissionais</td>
            <td class="cssVlrOriginal_V"><asp:Label ID="lblOri_Honorarios" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_V"><asp:Label ID="lblOri_HonorariosP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_V"><asp:TextBox ID="txtRev_Honorarios" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" BackColor="#E8FFE8" onfocus="this.select();" CssClass="styVlrRev"></asp:TextBox></td>
            <td class="cssPercRevista_V"><asp:TextBox ID="txtRev_HonorariosP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" BackColor="#E8FFE8" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev"></asp:TextBox></td>
        </tr>   <%--Embalagens - Uso e Consumo - Branco--%>

        <tr>
            <td class="DescConta_B">Informática</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_Informatica" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_InformaticaP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_Informatica" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
            <td class="cssPercRevista_B"><asp:TextBox ID="txtRev_InformaticaP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
        </tr>   <%-- Embalagens - Produtos - Verde--%>

        <tr>
            <td class="DescConta_V">Manutenção</td>
            <td class="cssVlrOriginal_V"><asp:Label ID="lblOri_Manutencao" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_V"><asp:Label ID="lblOri_ManutencaoP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_V"><asp:TextBox ID="txtRev_Manutencao" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" BackColor="#E8FFE8" onfocus="this.select();" CssClass="styVlrRev"></asp:TextBox></td>
            <td class="cssPercRevista_V"><asp:TextBox ID="txtRev_ManutencaoP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" BackColor="#E8FFE8" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev"></asp:TextBox></td>
        </tr>   <%-- Uso e Consumo - Branco--%>

        <tr>
            <td class="DescConta_B">Frota</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_Frota" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_FrotaP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_Frota" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
            <td class="cssPercRevista_B"><asp:TextBox ID="txtRev_FrotaP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
        </tr>   <%-- Propaganda - Verde--%>

        <tr>
            <td class="DescConta_V">(-) Rec. Contratos de Logistica</td>
            <td class="cssVlrOriginal_V"><asp:Label ID="lblOri_RecContrLogistica" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_V"><asp:Label ID="lblOri_RecContrLogisticaP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_V"><asp:TextBox ID="txtRev_RecContrLogistica" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" BackColor="#E8FFE8" onfocus="this.select();" CssClass="styVlrRev"></asp:TextBox></td>
            <td class="cssPercRevista_V"><asp:TextBox ID="txtRev_RecContrLogisticaP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" BackColor="#E8FFE8" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev"></asp:TextBox></td>
        </tr>   <%-- (-) Verbas Promocionais - Branco--%>    

        <tr>
            <td class="DescConta_B">Embalagens - Uso e Consumo</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_EmbUsoConsumo" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_EmbUsoConsumoP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_EmbUsoConsumo" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
            <td class="cssPercRevista_B"><asp:TextBox ID="txtRev_EmbUsoConsumoP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
        </tr>   <%-- Propaganda Gasto pelas Lojas - Verde--%>

        <tr>
            <td class="DescConta_V">Embalagens - Produtos</td>
            <td class="cssVlrOriginal_V"><asp:Label ID="lblOri_EmbProdutos" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_V"><asp:Label ID="lblOri_EmbProdutosP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_V"><asp:TextBox ID="txtRev_EmbProdutos" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" BackColor="#E8FFE8" onfocus="this.select();" CssClass="styVlrRev"></asp:TextBox></td>
            <td class="cssPercRevista_V"><asp:TextBox ID="txtRev_EmbProdutosP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" BackColor="#E8FFE8" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev"></asp:TextBox></td>
        </tr>   <%-- Serviços Públicos - Branco--%>    

        <tr>
            <td class="DescConta_B">Uso e Consumo</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_UsoConsumo" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_UsoConsumoP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_UsoConsumo" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
            <td class="cssPercRevista_B"><asp:TextBox ID="txtRev_UsoConsumoP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
        </tr>   <%-- Aluguél - Verde--%>

        <tr>
            <td class="DescConta_V">Propaganda</td>
            <td class="cssVlrOriginal_V"><asp:Label ID="lblOri_Propaganda" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_V"><asp:Label ID="lblOri_PropagandaP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_V"><asp:TextBox ID="txtRev_Propaganda" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px"  ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev"  ReadOnly="True"></asp:TextBox></td>
            <td class="cssPercRevista_V"><asp:TextBox ID="txtRev_PropagandaP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev" ReadOnly="True"></asp:TextBox></td>
        </tr>   <%-- Segurança - Branco--%>    

        <tr>
            <td class="DescConta_B">(-) Verbas Promocionais</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_VerbasPromocionais" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_VerbasPromocionaisP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_VerbasPromocionais" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" onfocus="this.select();" CssClass="styVlrRev_B"  ReadOnly="True"></asp:TextBox></td>
            <td class="cssPercRevista_B"><asp:TextBox ID="txtRev_VerbasPromocionaisP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev_B" ReadOnly="True"></asp:TextBox></td>
        </tr>   <%-- Tributos e Multas - Verde--%>

        <tr>
            <td class="DescConta_V">Propaganda Gasto pelas Lojas</td>
            <td class="cssVlrOriginal_V"><asp:Label ID="lblOri_PropGastoLojas" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_V"><asp:Label ID="lblOri_PropGastoLojasP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_V"><asp:TextBox ID="txtRev_PropGastoLojas" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" BackColor="#E8FFE8" onfocus="this.select();" CssClass="styVlrRev"></asp:TextBox></td>
            <td class="cssPercRevista_V"><asp:TextBox ID="txtRev_PropGastoLojasP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" BackColor="#E8FFE8" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev"></asp:TextBox></td>
        </tr>   <%-- Inadimplentes - Branco--%>  
 
        <tr>
            <td class="DescConta_B">Serviços Públicos</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_ServicoPublicos" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_ServicoPublicosP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_ServicoPublicos" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" onfocus="this.select();" CssClass="styVlrRev_B"  ReadOnly="True"></asp:TextBox></td>
            <td class="cssPercRevista_B"><asp:TextBox ID="txtRev_ServicoPublicosP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev_B" ReadOnly="True"></asp:TextBox></td>
        </tr>   <%-- Despesas Bancárias - Verde--%>
 
        <tr>
            <td class="DescConta_V">Aluguél</td>
            <td class="cssVlrOriginal_V"><asp:Label ID="lblOri_Aluguel" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_V"><asp:Label ID="lblOri_AluguelP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_V"><asp:TextBox ID="txtRev_Aluguel" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px"  ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev" ReadOnly="True"></asp:TextBox></td>
            <td class="cssPercRevista_V"><asp:TextBox ID="txtRev_AluguelP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px"  ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev" ReadOnly="True"></asp:TextBox></td>
        </tr>   <%-- Comissões s/ Mov. Financeira - Branco--%>  

        <tr>
            <td class="DescConta_B">Segurança</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_Seguranca" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_SegurancaP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_Seguranca" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
            <td class="cssPercRevista_B"><asp:TextBox ID="txtRev_SegurancaP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
        </tr>   <%-- Diversas - Verde--%>
 
        <tr>
            <td class="DescConta_V">Tributos e Multas</td>
            <td class="cssVlrOriginal_V"><asp:Label ID="lblOri_Tributos" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_V"><asp:Label ID="lblOri_TributosP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_V"><asp:TextBox ID="txtRev_Tributos" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev" ReadOnly="True"></asp:TextBox></td>
            <td class="cssPercRevista_V"><asp:TextBox ID="txtRev_TributosP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev" ReadOnly="True"></asp:TextBox></td>
        </tr>   <%-- Viagens e Transp. Funcionários - Branco--%>    

        <tr>
            <td class="DescConta_B">Inadimplentes</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_Inadimplentes" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_InadimplentesP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_Inadimplentes" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
            <td class="cssPercRevista_B"><asp:TextBox ID="txtRev_InadimplentesP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
        </tr>   <%-- Despesas Judiciais e Acordos - Verde--%>

        <tr>
            <td class="DescConta_V">Despesas Bancárias</td>
            <td class="cssVlrOriginal_V"><asp:Label ID="lblOri_DespBancarias" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_V"><asp:Label ID="lblOri_DespBancariasP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_V"><asp:TextBox ID="txtRev_DespBancarias" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" BackColor="#E8FFE8" onfocus="this.select();" CssClass="styVlrRev"></asp:TextBox></td>
            <td class="cssPercRevista_V"><asp:TextBox ID="txtRev_DespBancariasP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" BackColor="#E8FFE8" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev"></asp:TextBox></td>
        </tr>   <%-- Leasing - Branco--%>    

        <tr>
            <td class="DescConta_B">Comissões s/ Mov. Financeira</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_Comissoes" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_ComissoesP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_Comissoes" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" onfocus="this.select();" CssClass="styVlrRev_B" ReadOnly="True"></asp:TextBox></td>
            <td class="cssPercRevista_B"><asp:TextBox ID="txtRev_ComissoesP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" onfocus="this.select();" CssClass="styVlrRev_B" ReadOnly="True"></asp:TextBox></td>
        </tr>   <%-- Depreciação - Verde--%>

        <tr>
            <td class="DescConta_V">Diversas</td>
            <td class="cssVlrOriginal_V"><asp:Label ID="lblOri_Diversas" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_V"><asp:Label ID="lblOri_DiversasP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_V"><asp:TextBox ID="txtRev_Diversas" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px"  ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev"></asp:TextBox></td>
            <td class="cssPercRevista_V"><asp:TextBox ID="txtRev_DiversasP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px"  ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev"></asp:TextBox></td>
        </tr>   <%-- Sócios - Branco--%> 
        
        <tr>
            <td class="DescConta_B">Viagens e Transp. Funcionários</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_Viagens" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_ViagensP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_Viagens" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
            <td class="cssPercRevista_B"><asp:TextBox ID="txtRev_ViagensP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
        </tr>   <%-- Rateio de Despesas - Verde--%>    
        
        <tr>
            <td class="DescConta_V">Despesas Judiciais e Acordos</td>
            <td class="cssVlrOriginal_V"><asp:Label ID="lblOri_DespJudiciais" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_V"><asp:Label ID="lblOri_DespJudiciaisP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_V"><asp:TextBox ID="txtRev_DespJudiciais" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px"  ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev" ReadOnly="True"></asp:TextBox></td>
            <td class="cssPercRevista_V"><asp:TextBox ID="txtRev_DespJudiciaisP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px"  ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev" ReadOnly="True"></asp:TextBox></td>
        </tr>   <%-- PLR - Branco--%>    
        
        <tr>
            <td class="DescConta_B">Leasing</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_Leasing" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_LeasingP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_Leasing" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev_B" ReadOnly="True"></asp:TextBox></td>
            <td class="cssPercRevista_B"><asp:TextBox ID="txtRev_LeasingP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev_B" ReadOnly="True"></asp:TextBox></td>
        </tr>   <%--***************************** OUTRAS RECEITAS   e   OUTRAS CONTAS ********************************************************************--%>  
        
        <tr>
            <td class="DescConta_V">Depreciação</td>
            <td class="cssVlrOriginal_V"><asp:Label ID="lblOri_Depreciacao" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_V"><asp:Label ID="lblOri_DepreciacaoP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_V"><asp:TextBox ID="txtRev_Depreciacao" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev" ReadOnly="True"></asp:TextBox></td>
            <td class="cssPercRevista_V"><asp:TextBox ID="txtRev_DepreciacaoP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev" ReadOnly="True"></asp:TextBox></td>
        </tr>   <%-- Outras Receitas - Laranja--%>     
        
        <tr>
            <td class="DescConta_B">Sócios</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_Socios" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_SociosP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_Socios" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
            <td class="cssPercRevista_B"><asp:TextBox ID="txtRev_SociosP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
        </tr>   <%-- Resultado Operacional - Branco--%>    
        
        <tr>
            <td class="DescConta_V">Rateio de Despesas</td>
            <td class="cssVlrOriginal_V"><asp:Label ID="lblOri_Rateio" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_V"><asp:Label ID="lblOri_RateioP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_V"><asp:TextBox ID="txtRev_Rateio" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev"  ReadOnly="True"></asp:TextBox></td>
            <td class="cssPercRevista_V"><asp:TextBox ID="txtRev_RateioP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev" ReadOnly="True"></asp:TextBox></td>
        </tr>   <%-- Provisão de Créditos - Branco--%>   
        
        <tr>
            <td class="DescConta_B">PLR</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_PLR" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_PLRP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_PLR" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
            <td class="cssPercRevista_B"><asp:TextBox ID="txtRev_PLRP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
        </tr>   <%-- Receita Comercial - Branco--%><%--***************************** RESULTADO  FINANCEIRO  *********************************************************************************--%>                                             

        <tr>
            <td class="DescConta_L">Outras Receitas</td>
            <td class="cssVlrOriginal_L"><asp:Label ID="lblOri_OutrasReceitas" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_L"><asp:Label ID="lblOri_OutrasReceitasP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_L"><asp:TextBox ID="txtRev_OutrasReceitas" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px"  onfocus="this.select();" CssClass="styVlrRev_L"></asp:TextBox></td>
            <td class="cssPercRevista_L"><asp:TextBox ID="txtRev_OutrasReceitasP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px"  ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_L"></asp:TextBox></td>
        </tr>   <%-- Resultado Financeiro - Branco--%>

        <tr>
            <td class="DescConta_B" style="font-weight: 700">Resultado Operacional</td>
            <td class="cssVlrOriginal_B" style="font-weight: 700"><asp:Label ID="lblOri_ResultaoOperacional" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B" style="font-weight: 700"><asp:Label ID="lblOri_ResultaoOperacionalP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B" style="font-weight: 700"><asp:Label ID="txtRev_ResultaoOperacional" runat="server"  BorderStyle="None" Width="90px" CssClass="styVlrRev_B"></asp:Label></td>
            <td class="cssPercRevista_B" style="font-weight: 700"><asp:Label ID="txtRev_ResultaoOperacionalP" runat="server" BorderStyle="None" Width="45px" ForeColor="Black" CssClass="styVlrRev_B"></asp:Label></td>
        </tr>   <%-- Loja - Branco--%>    

        <tr>
            <td class="DescConta_B">Provisão de Créditos</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_ProvisaoCredito" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_ProvisaoCreditoP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_ProvisaoCredito" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
            <td class="cssPercRevista_B"><asp:TextBox ID="txtRev_ProvisaoCreditoP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
        </tr>   <%-- CD - Branco--%>    

        <tr>
            <td class="DescConta_B">Receita Comercial</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_ReceitaComercial" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_ReceitaComercialP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:Label ID="txtRev_ReceitaComercial" runat="server"  BorderStyle="None" Width="90px" CssClass="styVlrRev_B"></asp:Label></td>
            <td class="cssPercRevista_B"><asp:Label ID="txtRev_ReceitaComercialP" runat="server" BorderStyle="None" Width="45px" ForeColor="Black" CssClass="styVlrRev_B"></asp:Label></td>
        </tr>   <%--***************************** RESULTADO  FINAIS  *********************************************************************************--%><%-- Resultado Antes do I.R. - Branco--%>
        
        <tr>
            <td class="DescConta_B" style="font-weight: 700">Resultado Financeiro</td>
            <td class="cssVlrOriginal_B" style="font-weight: 700"><asp:Label ID="lblOri_ResFin" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B" style="font-weight: 700"><asp:Label ID="lblOri_ResFinP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B" style="font-weight: 700"><asp:Label ID="txtRev_ResFin" runat="server"  BorderStyle="None" Width="90px" CssClass="styVlrRev_B"></asp:Label></td>
            <td class="cssPercRevista_B" style="font-weight: 700"><asp:Label ID="txtRev_ResFinP" runat="server" BorderStyle="None" Width="45px" ForeColor="Black" CssClass="styVlrRev_B"></asp:Label></td>
        </tr>   <%-- Provisão I.R. - Branco--%>     
        
        <tr>
            <td class="DescConta_B">Loja</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_ResFinLoja" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_ResFinLojaP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_ResFinLoja" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
            <td class="cssPercRevista_B"><asp:TextBox ID="txtRev_ResFinLojaP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
        </tr>   <%-- Resultado Final - Verde--%>       
        
        <tr>
            <td class="DescConta_B">CD</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_ResFinCD" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_ResFinCDP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_ResFinCD" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" onfocus="this.select();" CssClass="styVlrRev_B" Enabled="False"></asp:TextBox></td>
            <td class="cssPercRevista_B"><asp:TextBox ID="txtRev_ResFinCDP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B" Enabled="False"></asp:TextBox></td>
        </tr>   <%-- CD - Branco--%><%--***************************** RESULTADO  FINAIS  *********************************************************************************--%>
                    
        <tr>
            <td class="DescConta_B" style="font-weight: 700">Resultado Antes do I.R.</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_ResAntesIR" runat="server" Text="?" style="font-weight: 700"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_ResAntesIRP" runat="server" Text="?" style="font-weight: 700"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:Label ID="txtRev_ResAntesIR" runat="server"  BorderStyle="None" Width="90px" CssClass="styVlrRev_B" style="font-weight: 700"></asp:Label></td>
            <td class="cssPercRevista_B"><asp:Label ID="txtRev_ResAntesIRP" runat="server" BorderStyle="None" Width="45px" ForeColor="Black" CssClass="styVlrRev_B" style="font-weight: 700"></asp:Label></td>
        </tr>   <%-- Resultado Antes do I.R. - Branco--%> 

        <tr>
            <td class="DescConta_B">Provisão I.R.</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_ProvIR" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_ProvIRP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:Label ID="txtRev_ProvIR" runat="server"  BorderStyle="None" Width="90px" CssClass="styVlrRev_B"></asp:Label></td>
            <td class="cssPercRevista_B"><asp:Label ID="txtRev_ProvIRP" runat="server" BorderStyle="None" Width="45px" ForeColor="Black" CssClass="styVlrRev_B"></asp:Label></td>
        </tr>   <%-- Provisão I.R. - Branco--%> 

        <tr>
            <td class="DescConta_V" style="font-weight: 700">Resultado Final</td>
            <td class="cssVlrOriginal_V"><asp:Label ID="lblOri_ResFinal" runat="server" Text="?" style="font-weight: 700"></asp:Label></td>
            <td class="cssPercOriginal_V"><asp:Label ID="lblOri_ResFinalP" runat="server" Text="?" style="font-weight: 700"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_V"><asp:TextBox ID="txtRev_ResFinal" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" onfocus="this.select();" CssClass="styVlrRev" style="font-weight: 700"></asp:TextBox></td>
            <td class="cssPercRevista_V"><asp:TextBox ID="txtRev_ResFinalP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev" style="font-weight: 700"></asp:TextBox></td>
        </tr>   <%-- Resultado Final - Verde--%>   
 
        </table>
   
</asp:Content>