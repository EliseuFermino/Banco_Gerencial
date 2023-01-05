<%@ Page Title="Replanejamento" Language="VB" MasterPageFile="~/MemberPages/SiteMetas.master" AutoEventWireup="false" CodeFile="webAP0154.aspx.vb" Inherits="MemberPages_Replanejamento_frmAP0154" %>

<%@ Register src="../../Controles/wucBotaoAtualizar.ascx" tagname="wucBotaoAtualizar" tagprefix="uc2" %>

<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc3" %>
<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc6" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register src="../../Controles/wucListaLojasComCorporacao.ascx" tagname="wucListaLojasComCorporacao" tagprefix="uc7" %>
<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc2" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciAno.ascx" TagPrefix="uc2" TagName="wuciAno" %>


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
                                <uc2:wucAno runat="server" id="cboAno" />
                            </td>
                            <td align="left" valign="top">
                                <uc6:wuciListaMes ID="cboMes" runat="server" AutoPostBack="true" />
                            </td>
                            <td align="left" valign="top">
                                <uc7:wucListaLojasComCorporacao ID="cboFilial" runat="server" />
                            </td>
                            <td align="left" >
                                <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="true"></dx:ASPxButton>
                            </td>
                            <td align="left" >
                                <dx:ASPxButton ID="btnSalvar" runat="server" Text="Salvar" Theme="MetropolisBlue"></dx:ASPxButton>
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
            <td align="center" bgcolor="#FF9900" style="border: 1px solid #999999; width: 177px;">Descrição</td>
            <td align="center" bgcolor="#FF9900" style="border: 1px solid #999999">Original</td>
            <td align="center" bgcolor="#FF9900" style="border: 1px solid #999999">%</td>
            <td class="style11">&nbsp;</td>
            <td align="center" bgcolor="#CAEEFF" style="border: 1px solid #999999;">Revista</td>
            <td align="center" bgcolor="#CAEEFF" style="border: 1px solid #999999; width: 21px;">%</td>
        </tr> <%-- Resultado Final - Verde--%><%-- Resultado Final - Verde--%>

        <tr>
            <td class="DescConta_V" style="font-weight: 700; width: 177px;">Venda Bruta</td>
            <td class="cssVlrOriginal_V" style="font-weight: 700"><asp:Label ID="lblOri_Venda" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_V" style="font-weight: 700"><asp:Label ID="lblOri_VendaP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_V" style="font-weight: 700"><asp:TextBox ID="txtRev_Venda" runat="server"  BorderStyle="None" Width="90px" ForeColor="Black" CssClass="styVlrRev" AutoPostBack="true"></asp:TextBox></td>
            <td class="cssPercRevista_V" style="font-weight: 700; width: 21px;"><asp:TextBox ID="txtRevP1" runat="server"  BorderStyle="None" Width="45px" ForeColor="Black" CssClass="styVlrRev" Enabled="False"></asp:TextBox></td>
        </tr>   <%-- CD - Branco--%> 

        <tr>
            <td class="DescConta_B" style="width: 177px">Impostos</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_Impostos" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_ImpostosP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:Label ID="txtRev_Impostos" runat="server"  BorderStyle="None" Width="90px" ForeColor="Black" CssClass="styVlrRev_B"></asp:Label></td>
            <td class="cssPercRevista_B" style="width: 21px"><asp:Label ID="txtRev_ImpostosP" runat="server" BorderStyle="None" Width="45px" ForeColor="Black" CssClass="styVlrRev_B">?</asp:Label></td>
        </tr>   <%--***************************** RESULTADO  FINAIS  *********************************************************************************--%> 

        <tr>
            <td class="DescConta_B" style="font-weight: 700; width: 177px;">Venda Liquida</td>
            <td class="cssVlrOriginal_B" style="font-weight: 700"><asp:Label ID="lblOri_VendaLiquida" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B" style="font-weight: 700"><asp:Label ID="lblOri_VendaLiquidaP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B" style="font-weight: 700"><asp:Label ID="txtRev_VendaLiquida" runat="server"  BorderStyle="None" Width="90px" ForeColor="Black" CssClass="styVlrRev_B"></asp:Label></td>
            <td class="cssPercRevista_B" style="font-weight: 700; width: 21px;"><asp:Label ID="txtRev_VendaLiquidaP" runat="server" BorderStyle="None" Width="45px" ForeColor="Black" CssClass="styVlrRev_B">?</asp:Label></td>
        </tr>   <%-- Resultado Antes do I.R. - Branco--%><%-- Provisão I.R. - Branco--%>
        <tr>
            <td class="DescConta_V" style="font-weight: 700; width: 177px;">CMV</td>
            <td class="cssVlrOriginal_V" style="font-weight: 700"><asp:Label ID="lblOri_CMV" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_V" style="font-weight: 700"><asp:Label ID="lblOri_CMVP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_V" style="font-weight: 700"><asp:Label ID="txtRev_CMV" runat="server"  BorderStyle="None" Width="90px" ForeColor="Black" CssClass="styVlrRev"></asp:Label></td>
            <td class="cssPercRevista_V" style="font-weight: 700; width: 21px;"><asp:Label ID="txtRev_CMVP" runat="server" BorderStyle="None" Width="45px" ForeColor="Black" CssClass="styVlrRev">?</asp:Label></td>
        </tr>   <%-- Resultado Final - Verde--%> 

        <tr>
            <td class="DescConta_B" style="width: 177px">Margem Teórica</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_MargemTeórica" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_MargemTeóricaP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_MargemTeórica" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" onfocus="this.select();"  ForeColor="Black" CssClass="styVlrRev_B" Enabled="False" ReadOnly="True"></asp:TextBox></td>
            <td class="cssPercRevista_B" style="width: 21px"><asp:TextBox ID="txtRev_MargemTeóricaP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" onfocus="this.select();" ForeColor="Black" CssClass="styVlrRev_B" Enabled="False" ReadOnly="True">?</asp:TextBox></td>
        </tr>   <%-- Resultado Final - Verde--%>

        <tr>
            <td class="DescConta_R" style="font-weight: 700; width: 177px;">Quebra Total</td>
            <td class="cssVlrOriginal_R" style="font-weight: 700"><asp:Label ID="lblOri_QuebraTotal" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_R" style="font-weight: 700"><asp:Label ID="lblOri_QuebraTotalP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_R" style="font-weight: 700"><asp:TextBox ID="txtRev_QuebraTotal" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" onfocus="this.select();"  ForeColor="Blue" CssClass="styVlrRev_R" Enabled="False"></asp:TextBox></td>
            <td class="cssPercRevista_R" style="width: 21px"><asp:TextBox ID="txtRev_QuebraTotalP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" onfocus="this.select();"  ForeColor="Blue" CssClass="styVlrRev_L" BackColor="#FFE8E8">?</asp:TextBox></td>

        </tr>   <%-- CD - Branco--%><%--***************************** RESULTADO  FINAIS  *********************************************************************************--%>

        <tr>
            <td class="DescConta_B" style="font-weight: 700; width: 177px;">Operações Comerciais</td>
            <td class="cssVlrOriginal_B" style="font-weight: 700"><asp:Label ID="lblOri_OperacoesComerciais" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B" style="font-weight: 700"><asp:Label ID="lblOri_OperacoesComerciaisP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B" style="font-weight: 700"><asp:Label ID="txtRev_OperacoesComerciais" runat="server"  BorderStyle="None" Width="90px" CssClass="styVlrRev_B"></asp:Label></td>
            <td class="cssPercRevista_B" style="font-weight: 700; width: 21px;"><asp:Label ID="txtRev_OperacoesComerciaisP" runat="server" BorderStyle="None" Width="45px" ForeColor="Black" CssClass="styVlrRev_B">?</asp:Label></td>
        </tr>   <%-- Resultado Antes do I.R. - Branco--%> 

        <tr>
            <td class="DescConta_B" style="width: 177px">Bonificação</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_Bonificacao" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_BonificacaoP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_Bonificacao" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" onfocus="this.select();" CssClass="styVlrRev_B" Enabled="False" ReadOnly="True"></asp:TextBox></td>
            <td class="cssPercRevista_B" style="width: 21px"><asp:TextBox ID="txtRev_BonificacaoP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B" Enabled="False" ReadOnly="True">?</asp:TextBox></td>
        </tr>   <%-- Provisão I.R. - Branco--%>

        <tr>
            <td class="DescConta_L" style="width: 177px">Bonificação - CD</td>
            <td class="cssVlrOriginal_L"><asp:Label ID="lblOri_BonificacaoCD" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_L"><asp:Label ID="lblOri_BonificacaoCDP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_L"><asp:TextBox ID="txtRev_BonificacaoCD" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" onfocus="this.select();" CssClass="styVlrRev_L"></asp:TextBox></td>
            <td class="cssPercRevista_L" style="width: 21px"><asp:TextBox ID="txtRev_BonificacaoCDP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_L">?</asp:TextBox></td>
        </tr>   <%-- Resultado Final - Verde--%> 

        <tr>
            <td class="DescConta_B" style="width: 177px">Contratos</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_Contratos" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_ContratosP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:Label ID="txtRev_Contratos" runat="server"  BorderStyle="None" Width="90px" CssClass="styVlrRev_B"></asp:Label></td>
            <td class="cssPercRevista_B" style="width: 21px"><asp:Label ID="txtRev_ContratosP" runat="server" BorderStyle="None" Width="45px" ForeColor="Black" CssClass="styVlrRev_B">?</asp:Label></td>
        </tr>   <%-- Resultado Final - Verde--%> 

        <tr>
            <td class="DescConta_L" style="height: 7px; width: 177px;">Condição Especial</td>
            <td class="cssVlrOriginal_L" style="height: 7px"><asp:Label ID="lblOri_CondicaoEspecial" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_L" style="height: 7px"><asp:Label ID="lblOri_CondicaoEspecialP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco" style="height: 7px"></td>
            <td class="cssVlrRevista_L" style="height: 7px"><asp:TextBox ID="txtRev_CondicaoEspecial" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" onfocus="this.select();" CssClass="styVlrRev_L"></asp:TextBox></td>
            <td class="cssPercRevista_L" style="height: 7px; width: 21px;"><asp:TextBox ID="txtRev_CondicaoEspecialP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_L">?</asp:TextBox></td>
        </tr>   <%-- Resultado Final - Verde--%> 

        <tr>
            <td class="DescConta_B" style="height: 16px; width: 177px;">Condição Especial - CD</td>
            <td class="cssVlrOriginal_B" style="height: 16px"><asp:Label ID="lblOri_CondicaoEspecialCD" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B" style="height: 16px"><asp:Label ID="lblOri_CondicaoEspecialCDP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco" style="height: 16px"></td>
            <td class="cssVlrRevista_B" style="height: 16px"><asp:Label ID="txtRev_CondicaoEspecialCD" runat="server"  BorderStyle="None" Width="90px" CssClass="styVlrRev_B"></asp:Label></td>
            <td class="cssPercRevista_B" style="height: 16px; width: 21px;"><asp:Label ID="txtRev_CondicaoEspecialCDP" runat="server" BorderStyle="None" Width="45px" ForeColor="Black" CssClass="styVlrRev_B">?</asp:Label></td>
        </tr>   <%-- CD - Branco--%> 

        <tr>
            <td class="DescConta_L" style="width: 177px">Ponta de Gôndola</td>
            <td class="cssVlrOriginal_L"><asp:Label ID="lblOri_PontaDeGondola" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_L"><asp:Label ID="lblOri_PontaDeGondolaP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_L"><asp:TextBox ID="txtRev_PontaDeGondola" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" onfocus="this.select();" CssClass="styVlrRev_L"></asp:TextBox></td>
            <td class="cssPercRevista_L" style="width: 21px"><asp:TextBox ID="txtRev_PontaDeGondolaP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_L">?</asp:TextBox></td>
        </tr>   <%--***************************** RESULTADO  FINAIS  *********************************************************************************--%> 

        <tr>
            <td class="DescConta_B" style="width: 177px">Marketing</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_Marketing" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_MarketingP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:Label ID="txtRev_Marketing" runat="server"  BorderStyle="None" Width="90px" CssClass="styVlrRev_B"></asp:Label></td>
            <td class="cssPercRevista_B" style="width: 21px"><asp:Label ID="txtRev_MarketingP" runat="server" BorderStyle="None" Width="45px" ForeColor="Black" CssClass="styVlrRev_B">?</asp:Label></td>
        </tr>   <%-- Resultado Antes do I.R. - Branco--%> 

        <tr>
            <td class="DescConta_L" style="width: 177px">Sell-out</td>
            <td class="cssVlrOriginal_L"><asp:Label ID="lblOri_Sell" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_L"><asp:Label ID="lblOri_SellP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_L"><asp:TextBox ID="txtRev_Sell" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" onfocus="this.select();" CssClass="styVlrRev_L" Enabled="False" ForeColor="Black" ReadOnly="True"></asp:TextBox></td>
            <td class="cssPercRevista_L" style="width: 21px"><asp:TextBox ID="txtRev_SellP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev_L" Enabled="False" ReadOnly="True">?</asp:TextBox></td>
        </tr>   <%-- Provisão I.R. - Branco--%> 

        <tr>
            <td class="DescConta_B" style="width: 177px;">CheckStand</td>
            <td class="cssVlrOriginal_B" style="font-weight: 700"><asp:Label ID="lblOri_CheckStand" runat="server" Text="?" Font-Bold="False"></asp:Label></td>
            <td class="cssPercOriginal_B" style="font-weight: 700"><asp:Label ID="lblOri_CheckStandP" runat="server" Text="?" Font-Bold="False"></asp:Label></td>
            <td class="cssEspaco">&nbsp;</td>
            <td class="cssVlrRevista_B" ><asp:Label ID="txtRev_CheckStand" runat="server"  BorderStyle="None" Width="90px" CssClass="styVlrRev_B" ForeColor="Black"></asp:Label></td>
            <td class="cssPercRevista_B" style="font-weight: 700; width: 21px;"><asp:Label ID="txtRev_CheckStandP" runat="server" BorderStyle="None" Width="45px" ForeColor="Black" CssClass="styVlrRev_B" Font-Bold="False">?</asp:Label></td>
        </tr>    

        <tr>
            <td class="DescConta_L" style="width: 177px;">Ilhas</td>
            <td class="cssVlrOriginal_L" style="font-weight: 700"><asp:Label ID="lblOri_Ilhas" runat="server" Text="?" Font-Bold="False"></asp:Label></td>
            <td class="cssPercOriginal_L" style="font-weight: 700"><asp:Label ID="lblOri_IlhasP" runat="server" Text="?" Font-Bold="False"></asp:Label></td>
            <td class="cssEspaco">&nbsp;</td>
            <td class="cssVlrRevista_L" style="font-weight: 700"><asp:Label ID="txtRev_Ilhas" runat="server"  BorderStyle="None" Width="90px" CssClass="styVlrRev_L" Font-Bold="False" ForeColor="Black"></asp:Label></td>
            <td class="cssPercRevista_L" style="font-weight: 700; width: 21px;"><asp:Label ID="txtRev_IlhasP" runat="server" BorderStyle="None" Width="45px" ForeColor="Black" CssClass="styVlrRev_L" Font-Bold="False">?</asp:Label></td>
        </tr>    

        <tr>
            <td class="DescConta_B" style="width: 177px;">Display</td>
            <td class="cssVlrOriginal_B" style="font-weight: 700"><asp:Label ID="lblOri_Display" runat="server" Text="?" Font-Bold="False"></asp:Label></td>
            <td class="cssPercOriginal_B" style="font-weight: 700"><asp:Label ID="lblOri_DisplayP" runat="server" Text="?" Font-Bold="False"></asp:Label></td>
            <td class="cssEspaco">&nbsp;</td>
            <td class="cssVlrRevista_B" style="font-weight: 700"><asp:Label ID="txtRev_Display" runat="server"  BorderStyle="None" Width="90px" CssClass="styVlrRev_B" Font-Bold="False"></asp:Label></td>
            <td class="cssPercRevista_B" style="font-weight: 700; width: 21px;"><asp:Label ID="txtRev_DisplayP" runat="server" BorderStyle="None" Width="45px" ForeColor="Black" CssClass="styVlrRev_B" Font-Bold="False">?</asp:Label></td>
        </tr>    

        <tr>
            <td class="DescConta_L" style="width: 177px;">CAI</td>
            <td class="cssVlrOriginal_L" style="font-weight: 700"><asp:Label ID="lblOri_PapaFila" runat="server" Text="?" Font-Bold="False"></asp:Label></td>
            <td class="cssPercOriginal_L" style="font-weight: 700"><asp:Label ID="lblOri_PapaFilaP" runat="server" Text="?" Font-Bold="False"></asp:Label></td>
            <td class="cssEspaco">&nbsp;</td>
            <td class="cssVlrRevista_L" style="font-weight: 700"><asp:TextBox ID="txtRev_PapaFila" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" onfocus="this.select();" CssClass="styVlrRev_L" Enabled="False" ForeColor="Black" ReadOnly="True"></asp:TextBox></td>
            <td class="cssPercRevista_L" style="font-weight: 700; width: 21px;"><asp:TextBox ID="txtRev_PapaFilaP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev_L" Enabled="False" ReadOnly="True">?</asp:TextBox></td>
        </tr>    

        <tr>
            <td class="DescConta_B" style="font-weight: 700; width: 177px;">Margem Operacional</td>
            <td class="cssVlrOriginal_B" style="font-weight: 700"><asp:Label ID="lblOri_MargemOperacional" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B" style="font-weight: 700"><asp:Label ID="lblOri_MargemOperacionalP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B" style="font-weight: 700"><asp:Label ID="txtRev_MargemOperacional" runat="server"  BorderStyle="None" Width="90px" CssClass="styVlrRev_B" Font-Bold="False"></asp:Label></td>
            <td class="cssPercRevista_B" style="font-weight: 700; width: 21px;"><asp:Label ID="txtRev_MargemOperacionalP" runat="server" BorderStyle="None" Width="45px" ForeColor="Black" CssClass="styVlrRev_B">?</asp:Label></td>
        </tr>   <%-- Resultado Final - Verde--%><%-- Resultado Final - Verde--%>
        <tr>
            <td class="DescConta_A" style="font-weight: 700; width: 177px;">Despesas Operacionais</td>
            <td class="cssVlrOriginal_A" style="font-weight: 700"><asp:Label ID="lblOri_Despesas" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_A" style="font-weight: 700"><asp:Label ID="lblOri_DespesasP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_A" style="font-weight: 700"><asp:Label ID="txtRev_Despesas" runat="server"  BorderStyle="None" Width="90px" CssClass="styVlrRev_A"></asp:Label></td>
            <td class="cssPercRevista_A" style="font-weight: 700; width: 21px;"><asp:Label ID="txtRev_DespesasP" runat="server" BorderStyle="None" Width="45px" ForeColor="Black" CssClass="styVlrRev_A">?</asp:Label></td>
        </tr>   <%-- Resultado Final - Verde--%> 

        <tr>
            <td class="DescConta_B" style="width: 177px">Pessoal</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_Pessoal" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_PessoalP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_Pessoal" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
            <td class="cssPercRevista_B" style="width: 21px"><asp:TextBox ID="txtRev_PessoalP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B">?</asp:TextBox></td>
        </tr>   <%-- CD - Branco--%>

        <tr>
            <td class="DescConta_V" style="width: 177px">Honorários Profissionais</td>
            <td class="cssVlrOriginal_V"><asp:Label ID="lblOri_Honorarios" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_V"><asp:Label ID="lblOri_HonorariosP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_V"><asp:TextBox ID="txtRev_Honorarios" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" BackColor="#E8FFE8" onfocus="this.select();" CssClass="styVlrRev"></asp:TextBox></td>
            <td class="cssPercRevista_V" style="width: 21px"><asp:TextBox ID="txtRev_HonorariosP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" BackColor="#E8FFE8" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev"></asp:TextBox></td>
        </tr>   <%--***************************** RESULTADO  FINAIS  *********************************************************************************--%>

        <tr>
            <td class="DescConta_B" style="width: 177px">Informática</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_Informatica" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_InformaticaP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_Informatica" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
            <td class="cssPercRevista_B" style="width: 21px"><asp:TextBox ID="txtRev_InformaticaP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
        </tr>   <%-- Resultado Antes do I.R. - Branco--%>

        <tr>
            <td class="DescConta_V" style="width: 177px">Manutenção</td>
            <td class="cssVlrOriginal_V"><asp:Label ID="lblOri_Manutencao" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_V"><asp:Label ID="lblOri_ManutencaoP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_V"><asp:TextBox ID="txtRev_Manutencao" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" BackColor="#E8FFE8" onfocus="this.select();" CssClass="styVlrRev"></asp:TextBox></td>
            <td class="cssPercRevista_V" style="width: 21px"><asp:TextBox ID="txtRev_ManutencaoP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" BackColor="#E8FFE8" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev"></asp:TextBox></td>
        </tr>   <%-- Provisão I.R. - Branco--%>

        <tr>
            <td class="DescConta_B" style="width: 177px">Frota</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_Frota" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_FrotaP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_Frota" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
            <td class="cssPercRevista_B" style="width: 21px"><asp:TextBox ID="txtRev_FrotaP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
        </tr>   <%-- Resultado Final - Verde--%>

        <tr>
            <td class="DescConta_V" style="width: 177px">(-) Rec. Contratos de Logistica</td>
            <td class="cssVlrOriginal_V"><asp:Label ID="lblOri_RecContrLogistica" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_V"><asp:Label ID="lblOri_RecContrLogisticaP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_V"><asp:TextBox ID="txtRev_RecContrLogistica" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" BackColor="#E8FFE8" onfocus="this.select();" CssClass="styVlrRev"></asp:TextBox></td>
            <td class="cssPercRevista_V" style="width: 21px"><asp:TextBox ID="txtRev_RecContrLogisticaP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" BackColor="#E8FFE8" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev"></asp:TextBox></td>
        </tr>   <%-- Resultado Final - Verde--%>    

        <tr>
            <td class="DescConta_B" style="width: 177px">Embalagens - Uso e Consumo</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_EmbUsoConsumo" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_EmbUsoConsumoP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_EmbUsoConsumo" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
            <td class="cssPercRevista_B" style="width: 21px"><asp:TextBox ID="txtRev_EmbUsoConsumoP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
        </tr>   <%-- Resultado Final - Verde--%>

        <tr>
            <td class="DescConta_V" style="width: 177px">Embalagens - Produtos</td>
            <td class="cssVlrOriginal_V"><asp:Label ID="lblOri_EmbProdutos" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_V"><asp:Label ID="lblOri_EmbProdutosP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_V"><asp:TextBox ID="txtRev_EmbProdutos" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" BackColor="#E8FFE8" onfocus="this.select();" CssClass="styVlrRev"></asp:TextBox></td>
            <td class="cssPercRevista_V" style="width: 21px"><asp:TextBox ID="txtRev_EmbProdutosP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" BackColor="#E8FFE8" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev"></asp:TextBox></td>
        </tr>   <%-- CD - Branco--%>    

        <tr>
            <td class="DescConta_B" style="width: 177px">Uso e Consumo</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_UsoConsumo" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_UsoConsumoP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_UsoConsumo" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
            <td class="cssPercRevista_B" style="width: 21px"><asp:TextBox ID="txtRev_UsoConsumoP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
        </tr>   <%--***************************** RESULTADO  FINAIS  *********************************************************************************--%>

        <tr>
            <td class="DescConta_V" style="width: 177px">Propaganda</td>
            <td class="cssVlrOriginal_V"><asp:Label ID="lblOri_Propaganda" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_V"><asp:Label ID="lblOri_PropagandaP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_V"><asp:TextBox ID="txtRev_Propaganda" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px"  ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev"  ReadOnly="True"></asp:TextBox></td>
            <td class="cssPercRevista_V" style="width: 21px"><asp:TextBox ID="txtRev_PropagandaP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev" ReadOnly="True"></asp:TextBox></td>
        </tr>   <%-- Resultado Antes do I.R. - Branco--%>    

        <tr>
            <td class="DescConta_B" style="width: 177px">(-) Verbas Promocionais</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_VerbasPromocionais" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_VerbasPromocionaisP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_VerbasPromocionais" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" onfocus="this.select();" CssClass="styVlrRev_B"  ReadOnly="True"></asp:TextBox></td>
            <td class="cssPercRevista_B" style="width: 21px"><asp:TextBox ID="txtRev_VerbasPromocionaisP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev_B" ReadOnly="True"></asp:TextBox></td>
        </tr>   <%-- Provisão I.R. - Branco--%>

        <tr>
            <td class="DescConta_V" style="width: 177px">Propaganda Gasto pelas Lojas</td>
            <td class="cssVlrOriginal_V"><asp:Label ID="lblOri_PropGastoLojas" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_V"><asp:Label ID="lblOri_PropGastoLojasP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_V"><asp:TextBox ID="txtRev_PropGastoLojas" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" BackColor="#E8FFE8" onfocus="this.select();" CssClass="styVlrRev"></asp:TextBox></td>
            <td class="cssPercRevista_V" style="width: 21px"><asp:TextBox ID="txtRev_PropGastoLojasP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" BackColor="#E8FFE8" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev"></asp:TextBox></td>
        </tr>   <%-- Resultado Final - Verde--%>  
 
        <tr>
            <td class="DescConta_B" style="width: 177px">Serviços Públicos</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_ServicoPublicos" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_ServicoPublicosP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_ServicoPublicos" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" onfocus="this.select();" CssClass="styVlrRev_B"  ReadOnly="True"></asp:TextBox></td>
            <td class="cssPercRevista_B" style="width: 21px"><asp:TextBox ID="txtRev_ServicoPublicosP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev_B" ReadOnly="True"></asp:TextBox></td>
        </tr>   <%-- Resultado Final - Verde--%>
 
        <tr>
            <td class="DescConta_V" style="width: 177px">Aluguél</td>
            <td class="cssVlrOriginal_V"><asp:Label ID="lblOri_Aluguel" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_V"><asp:Label ID="lblOri_AluguelP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_V"><asp:TextBox ID="txtRev_Aluguel" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px"  ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev" ReadOnly="True"></asp:TextBox></td>
            <td class="cssPercRevista_V" style="width: 21px"><asp:TextBox ID="txtRev_AluguelP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px"  ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev" ReadOnly="True"></asp:TextBox></td>
        </tr>   <%-- Resultado Final - Verde--%>  

        <tr>
            <td class="DescConta_B" style="width: 177px">Segurança</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_Seguranca" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_SegurancaP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_Seguranca" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
            <td class="cssPercRevista_B" style="width: 21px"><asp:TextBox ID="txtRev_SegurancaP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
        </tr>   <%-- CD - Branco--%>
 
        <tr>
            <td class="DescConta_V" style="width: 177px">Tributos e Multas</td>
            <td class="cssVlrOriginal_V"><asp:Label ID="lblOri_Tributos" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_V"><asp:Label ID="lblOri_TributosP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_V"><asp:TextBox ID="txtRev_Tributos" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev" ReadOnly="True"></asp:TextBox></td>
            <td class="cssPercRevista_V" style="width: 21px"><asp:TextBox ID="txtRev_TributosP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev" ReadOnly="True"></asp:TextBox></td>
        </tr>   <%--***************************** RESULTADO  FINAIS  *********************************************************************************--%>    

        <tr>
            <td class="DescConta_B" style="width: 177px">Inadimplentes</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_Inadimplentes" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_InadimplentesP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_Inadimplentes" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
            <td class="cssPercRevista_B" style="width: 21px"><asp:TextBox ID="txtRev_InadimplentesP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
        </tr>   <%-- Resultado Antes do I.R. - Branco--%>

        <tr>
            <td class="DescConta_V" style="width: 177px">Despesas Bancárias</td>
            <td class="cssVlrOriginal_V"><asp:Label ID="lblOri_DespBancarias" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_V"><asp:Label ID="lblOri_DespBancariasP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_V"><asp:TextBox ID="txtRev_DespBancarias" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" BackColor="#E8FFE8" onfocus="this.select();" CssClass="styVlrRev"></asp:TextBox></td>
            <td class="cssPercRevista_V" style="width: 21px"><asp:TextBox ID="txtRev_DespBancariasP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" BackColor="#E8FFE8" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev"></asp:TextBox></td>
        </tr>   <%-- Provisão I.R. - Branco--%>    

        <tr>
            <td class="DescConta_B" style="width: 177px">Comissões s/ Mov. Financeira</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_Comissoes" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_ComissoesP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_Comissoes" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" onfocus="this.select();" CssClass="styVlrRev_B" ReadOnly="True"></asp:TextBox></td>
            <td class="cssPercRevista_B" style="width: 21px"><asp:TextBox ID="txtRev_ComissoesP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" onfocus="this.select();" CssClass="styVlrRev_B" ReadOnly="True"></asp:TextBox></td>
        </tr>   <%-- Resultado Final - Verde--%>

        <tr>
            <td class="DescConta_V" style="width: 177px">Diversas</td>
            <td class="cssVlrOriginal_V"><asp:Label ID="lblOri_Diversas" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_V"><asp:Label ID="lblOri_DiversasP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_V"><asp:TextBox ID="txtRev_Diversas" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px"  ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev"></asp:TextBox></td>
            <td class="cssPercRevista_V" style="width: 21px"><asp:TextBox ID="txtRev_DiversasP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px"  ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev"></asp:TextBox></td>
        </tr>   <%-- Resultado Final - Verde--%> 
        
        <tr>
            <td class="DescConta_B" style="width: 177px">Viagens e Transp. Funcionários</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_Viagens" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_ViagensP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_Viagens" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
            <td class="cssPercRevista_B" style="width: 21px"><asp:TextBox ID="txtRev_ViagensP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
        </tr>   <%-- Resultado Final - Verde--%>    
        
        <tr>
            <td class="DescConta_V" style="width: 177px">Despesas Judiciais e Acordos</td>
            <td class="cssVlrOriginal_V"><asp:Label ID="lblOri_DespJudiciais" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_V"><asp:Label ID="lblOri_DespJudiciaisP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_V"><asp:TextBox ID="txtRev_DespJudiciais" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px"  ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev" ReadOnly="True"></asp:TextBox></td>
            <td class="cssPercRevista_V" style="width: 21px"><asp:TextBox ID="txtRev_DespJudiciaisP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px"  ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev" ReadOnly="True"></asp:TextBox></td>
        </tr>   <%-- CD - Branco--%>    
        
        <tr>
            <td class="DescConta_B" style="width: 177px">Leasing</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_Leasing" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_LeasingP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_Leasing" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev_B" ReadOnly="True"></asp:TextBox></td>
            <td class="cssPercRevista_B" style="width: 21px"><asp:TextBox ID="txtRev_LeasingP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev_B" ReadOnly="True"></asp:TextBox></td>
        </tr>   <%--***************************** RESULTADO  FINAIS  *********************************************************************************--%>  
        
        <tr>
            <td class="DescConta_V" style="width: 177px">Depreciação</td>
            <td class="cssVlrOriginal_V"><asp:Label ID="lblOri_Depreciacao" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_V"><asp:Label ID="lblOri_DepreciacaoP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_V"><asp:TextBox ID="txtRev_Depreciacao" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev" ReadOnly="True"></asp:TextBox></td>
            <td class="cssPercRevista_V" style="width: 21px"><asp:TextBox ID="txtRev_DepreciacaoP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev" ReadOnly="True"></asp:TextBox></td>
        </tr>   <%-- Resultado Antes do I.R. - Branco--%>     
        
        <tr>
            <td class="DescConta_B" style="width: 177px">Sócios</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_Socios" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_SociosP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_Socios" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
            <td class="cssPercRevista_B" style="width: 21px"><asp:TextBox ID="txtRev_SociosP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
        </tr>   <%-- Provisão I.R. - Branco--%>    
        
        <tr>
            <td class="DescConta_V" style="width: 177px">Rateio de Despesas</td>
            <td class="cssVlrOriginal_V"><asp:Label ID="lblOri_Rateio" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_V"><asp:Label ID="lblOri_RateioP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_V"><asp:TextBox ID="txtRev_Rateio" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev"  ReadOnly="True"></asp:TextBox></td>
            <td class="cssPercRevista_V" style="width: 21px"><asp:TextBox ID="txtRev_RateioP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev" ReadOnly="True"></asp:TextBox></td>
        </tr>   <%-- Resultado Final - Verde--%>   
        
        <tr>
            <td class="DescConta_B" style="width: 177px">PLR</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_PLR" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_PLRP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_PLR" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
            <td class="cssPercRevista_B" style="width: 21px"><asp:TextBox ID="txtRev_PLRP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev_B"></asp:TextBox></td>
        </tr>   <%-- Resultado Final - Verde--%><%-- Resultado Final - Verde--%>                                             

        <tr>
            <td class="DescConta_L" style="width: 177px">Outras Receitas</td>
            <td class="cssVlrOriginal_L"><asp:Label ID="lblOri_OutrasReceitas" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_L"><asp:Label ID="lblOri_OutrasReceitasP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_L"><asp:TextBox ID="txtRev_OutrasReceitas" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px"  onfocus="this.select();" CssClass="styVlrRev_L"></asp:TextBox></td>
            <td class="cssPercRevista_L" style="width: 21px"><asp:TextBox ID="txtRev_OutrasReceitasP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px"  ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_L"></asp:TextBox></td>
        </tr>   <%-- CD - Branco--%>

        <tr>
            <td class="DescConta_B" style="font-weight: 700; width: 177px;">Resultado Operacional</td>
            <td class="cssVlrOriginal_B" style="font-weight: 700"><asp:Label ID="lblOri_ResultaoOperacional" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B" style="font-weight: 700"><asp:Label ID="lblOri_ResultaoOperacionalP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B" style="font-weight: 700"><asp:Label ID="txtRev_ResultaoOperacional" runat="server"  BorderStyle="None" Width="90px" CssClass="styVlrRev_B"></asp:Label></td>
            <td class="cssPercRevista_B" style="font-weight: 700; width: 21px;"><asp:Label ID="txtRev_ResultaoOperacionalP" runat="server" BorderStyle="None" Width="45px" ForeColor="Black" CssClass="styVlrRev_B">?</asp:Label></td>
        </tr>   <%--***************************** RESULTADO  FINAIS  *********************************************************************************--%>    

        <tr>
            <td class="DescConta_B" style="width: 177px">Provisão de Créditos</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_ProvisaoCredito" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_ProvisaoCreditoP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_ProvisaoCredito" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" onfocus="this.select();" CssClass="styVlrRev_B" Enabled="False"></asp:TextBox></td>
            <td class="cssPercRevista_B" style="width: 21px"><asp:TextBox ID="txtRev_ProvisaoCreditoP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev_B" Enabled="False"></asp:TextBox></td>
        </tr>   <%-- Resultado Antes do I.R. - Branco--%>    

        <tr>
            <td class="DescConta_B" style="width: 177px">Receita Comercial</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_ReceitaComercial" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_ReceitaComercialP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:Label ID="txtRev_ReceitaComercial" runat="server"  BorderStyle="None" Width="90px" CssClass="styVlrRev_B"></asp:Label></td>
            <td class="cssPercRevista_B" style="width: 21px"><asp:Label ID="txtRev_ReceitaComercialP" runat="server" BorderStyle="None" Width="45px" ForeColor="Black" CssClass="styVlrRev_B">?</asp:Label></td>
        </tr>   <%-- Provisão I.R. - Branco--%><%-- Resultado Final - Verde--%>
        
        <tr>
            <td class="DescConta_B" style="font-weight: 700; width: 177px;">Resultado Financeiro</td>
            <td class="cssVlrOriginal_B" style="font-weight: 700"><asp:Label ID="lblOri_ResFin" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B" style="font-weight: 700"><asp:Label ID="lblOri_ResFinP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B" style="font-weight: 700"><asp:Label ID="txtRev_ResFin" runat="server"  BorderStyle="None" Width="90px" CssClass="styVlrRev_B"></asp:Label></td>
            <td class="cssPercRevista_B" style="font-weight: 700; width: 21px;"><asp:Label ID="txtRev_ResFinP" runat="server" BorderStyle="None" Width="45px" ForeColor="Black" CssClass="styVlrRev_B">?</asp:Label></td>
        </tr>   <%-- Resultado Final - Verde--%>     
        
        <tr>
            <td class="DescConta_B" style="width: 177px">Loja</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_ResFinLoja" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_ResFinLojaP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_ResFinLoja" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" onfocus="this.select();" CssClass="styVlrRev_B" Enabled="False"></asp:TextBox></td>
            <td class="cssPercRevista_B" style="width: 21px"><asp:TextBox ID="txtRev_ResFinLojaP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B" Enabled="False"></asp:TextBox></td>
        </tr>   <%-- Resultado Final - Verde--%>       
        
        <tr>
            <td class="DescConta_B" style="width: 177px">CD</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_ResFinCD" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_ResFinCDP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:TextBox ID="txtRev_ResFinCD" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" onfocus="this.select();" CssClass="styVlrRev_B" Enabled="False"></asp:TextBox></td>
            <td class="cssPercRevista_B" style="width: 21px"><asp:TextBox ID="txtRev_ResFinCDP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Blue" onfocus="this.select();" CssClass="styVlrRev_B" Enabled="False"></asp:TextBox></td>
        </tr>   <%-- CD - Branco--%><%--***************************** RESULTADO  FINAIS  *********************************************************************************--%>
                    
        <tr>
            <td class="DescConta_B" style="font-weight: 700; width: 177px;">Resultado Antes do I.R.</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_ResAntesIR" runat="server" Text="?" style="font-weight: 700"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_ResAntesIRP" runat="server" Text="?" style="font-weight: 700"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:Label ID="txtRev_ResAntesIR" runat="server"  BorderStyle="None" Width="90px" CssClass="styVlrRev_B" style="font-weight: 700"></asp:Label></td>
            <td class="cssPercRevista_B" style="width: 21px"><asp:Label ID="txtRev_ResAntesIRP" runat="server" BorderStyle="None" Width="45px" ForeColor="Black" CssClass="styVlrRev_B" style="font-weight: 700" ToolTip="?">?</asp:Label></td>
        </tr>   <%-- Resultado Antes do I.R. - Branco--%> 

        <tr>
            <td class="DescConta_B" style="width: 177px">Provisão I.R.</td>
            <td class="cssVlrOriginal_B"><asp:Label ID="lblOri_ProvIR" runat="server" Text="?"></asp:Label></td>
            <td class="cssPercOriginal_B"><asp:Label ID="lblOri_ProvIRP" runat="server" Text="?"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_B"><asp:Label ID="txtRev_ProvIR" runat="server"  BorderStyle="None" Width="90px" CssClass="styVlrRev_B"></asp:Label></td>
            <td class="cssPercRevista_B" style="width: 21px"><asp:Label ID="txtRev_ProvIRP" runat="server" BorderStyle="None" Width="45px" ForeColor="Black" CssClass="styVlrRev_B" ToolTip="?">?</asp:Label></td>
        </tr>   <%-- Provisão I.R. - Branco--%> 

        <tr>
            <td class="DescConta_V" style="font-weight: 700; width: 177px;">Resultado Final</td>
            <td class="cssVlrOriginal_V"><asp:Label ID="lblOri_ResFinal" runat="server" Text="?" style="font-weight: 700"></asp:Label></td>
            <td class="cssPercOriginal_V"><asp:Label ID="lblOri_ResFinalP" runat="server" Text="?" style="font-weight: 700"></asp:Label></td>
            <td class="cssEspaco"></td>
            <td class="cssVlrRevista_V"><asp:TextBox ID="txtRev_ResFinal" runat="server" AutoPostBack="True" BorderStyle="None" Width="90px" onfocus="this.select();" CssClass="styVlrRev" style="font-weight: 700"></asp:TextBox></td>
            <td class="cssPercRevista_V" style="width: 21px"><asp:TextBox ID="txtRev_ResFinalP" runat="server" AutoPostBack="True" BorderStyle="None" Width="45px" ForeColor="Black" onfocus="this.select();" CssClass="styVlrRev" style="font-weight: 700"></asp:TextBox></td>
        </tr>   <%-- Resultado Final - Verde--%>   
 
        </table>

    
   
</asp:Content>