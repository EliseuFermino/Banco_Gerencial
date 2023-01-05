<%@ Page Title="Participação - Replanejamento" Language="VB" MasterPageFile="~/MemberPages/SiteMetas.master" AutoEventWireup="false" CodeFile="webReplanPartic_Old.aspx.vb" Inherits="MemberPages_Replanejamento_webReplanPartic_Old" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>
<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc2" %>
<%@ Register src="../../Controles/wucListaLojasComCorporacao.ascx" tagname="wucListaLojasComCorporacao" tagprefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 707px;
            border-collapse: collapse;
            float: left;
        }
        .style3
        {
            width: 165px;
        }
        .style4
        {
            height: 21px;
            width: 165px;
        }
        .style14
        {
            width: 79px;
        }
        .style15
        {
            width: 300px;
        }
        .style16
        {
            width: 262px;
        }
        .style18
        {
            width: 100%;
            border-collapse: collapse;                
            float: left; 
            margin-left: 10px;       
        }
        .style13
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
        }
        .style19
        {
            height: 21px;
        }
        .style20
        {
            width: 161px;
        }
        .style21
        {
            height: 21px;
            width: 161px;
        }
        .style23
        {
            height: 21px;
            width: 100px;
        }
        .style24
        {
        }
        .style25
        {
            width: 51px;
        }
        .style26
        {
            height: 21px;
            width: 51px;
        }
        .style27
        {
            width: 161px;
            height: 22px;
        }
        .style28
        {
            width: 100px;
            height: 22px;
        }
        .style29
        {
            width: 51px;
            height: 22px;
        }
        .style30
        {
            height: 22px;
        }
        .style17
        {
            font-size: small;
        }
        .auto-style4 {
        }
        .auto-style5 {
            height: 21px;
            width: 80px;
        }
        .auto-style6 {
            width: 80px;
            height: 22px;
        }
        .auto-style8 {
            height: 21px;
            width: 70px;
        }
        .auto-style10 {
            width: 49px;
        }
        .auto-style11 {
            height: 21px;
            width: 49px;
        }
        .auto-style12 {
            width: 49px;
            height: 22px;
        }
        .auto-style13 {
            width: 50px;
        }
        .auto-style14 {
            height: 21px;
            width: 50px;
        }
        .auto-style15 {
            width: 50px;
            height: 22px;
        }
        .auto-style17 {
        }
        .auto-style18 {
            height: 21px;
            width: 57px;
        }
        .auto-style19 {
            width: 57px;
            height: 22px;
        }
        .auto-style20 {
            width: 161px;
            height: 24px;
        }
        .auto-style21 {
            height: 24px;
        }
        .auto-style22 {
            width: 49px;
            height: 24px;
        }
        .auto-style23 {
            width: 50px;
            height: 24px;
        }
        .auto-style24 {
            width: 70px;
            height: 24px;
        }
        .auto-style26 {
            width: 57px;
            height: 24px;
        }
        .auto-style29 {
            width: 70px;
        }
        .auto-style30 {
            width: 70px;
            height: 22px;
        }
        .auto-style31 {
            width: 212px;
        }
        .auto-style32 {
            color: #FFFFFF;
        }
        .auto-style34 {
            width: 48px;
            height: 24px;
        }
        .auto-style36 {
            height: 21px;
            width: 48px;
        }
        .auto-style38 {
            width: 77px;
            height: 24px;
        }
        .auto-style40 {
            height: 21px;
            width: 77px;
        }
        .auto-style42 {
            width: 68px;
            height: 24px;
        }
        .auto-style43 {
            width: 68px;
        }
        .auto-style44 {
            height: 21px;
            width: 68px;
        }
        .auto-style45 {
            width: 68px;
            height: 22px;
        }
        .auto-style46 {
            width: 77px;
        }
        .auto-style47 {
            width: 77px;
            height: 22px;
        }
        .auto-style48 {
            width: 161px;
            height: 23px;
        }
        .auto-style49 {
            height: 23px;
        }
        .auto-style50 {
            width: 49px;
            height: 23px;
        }
        .auto-style51 {
            width: 50px;
            height: 23px;
        }
        .auto-style52 {
            width: 70px;
            height: 23px;
        }
        .auto-style54 {
            width: 77px;
            height: 23px;
        }
        .auto-style55 {
            width: 48px;
            height: 23px;
        }
        .auto-style56 {
            width: 68px;
            height: 23px;
        }
        .auto-style59 {
            width: 48px;
        }
        .auto-style60 {
            width: 48px;
            height: 22px;
        }
        .auto-style66 {
            width: 93px;
            height: 24px;
        }
        .auto-style67 {
            width: 93px;
        }
        .auto-style68 {
            width: 93px;
            height: 23px;
        }
        .auto-style69 {
            height: 21px;
            width: 93px;
        }
        .auto-style70 {
            width: 93px;
            height: 22px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID ="btnSalvar" />
            <asp:PostBackTrigger ControlID ="btnRecalcular" />
        </Triggers>
        <ContentTemplate>  
    <p>
        <table align="left" class="style1" style="padding-bottom: 10px">
            <tr>
                <td class="style15" style="padding-bottom: 10px">
                    <uc1:wucAno ID="cboAno" runat="server" />
                </td>
                <td class="style15" style="padding-bottom: 10px">
                    <uc2:wuciListaMes ID="cboMes" runat="server" />
                </td>
                <td class="style15" style="padding-bottom: 10px">
                    <uc3:wucListaLojasComCorporacao ID="cboFilial" runat="server" />
                </td>
                <td class="auto-style31" style="padding-bottom: 10px">
                    &nbsp;</td>
                <td>
                    <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                        <ProgressTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl="~/image/UpdateProgress.gif" />
                        </ProgressTemplate>
                    </asp:UpdateProgress>
                </td>
                <td align="left" valign="middle">
                    <asp:Button ID="btnSalvar" runat="server" Text="Salvar" />
                </td>

                <td align="left" valign="middle">
                    <asp:Button ID="btnRecalcular" runat="server" Text="Recalcular Vendas" />
                </td>
            </tr>
        </table>
        <table align="left" cellpadding="2" class="style18">
            <tr>
                <td class="style20" 
                    style="background-color: #EFEEEF; font-family: 'Times New Roman', Times, serif; font-size: medium; color: #FFFFFF; text-align: center; font-weight: bold; border-bottom-style: solid; border-bottom-width: 1px; border-bottom-color: #CCCCCC; border-right-style: solid; border-right-width: 1px; border-right-color: #CCCCCC;">
                    &nbsp;</td>
                <td class="auto-style4" 
                    style="border: 1px solid #CCCCCC; background-color: #FF0000; font-family: 'Times New Roman', Times, serif; font-size: medium; color: #FFFFFF; text-align: center; font-weight: bold;" colspan="2">
                    Ano Anterior</td>
                <td class="auto-style4" colspan="6" style="border: 1px solid #CCCCCC; background-color: #546E96; font-family: 'Times New Roman', Times, serif; font-size: medium; color: #FFFFFF; text-align: center; font-weight: bold;">Histórico dos Últimos 3 Meses Anteriores</td>
                <td class="style24" style="border: 1px solid #CCCCCC; background-color:darkgreen; font-family: 'Times New Roman', Times, serif; font-size: medium; color: #FFFFFF; text-align: center; font-weight: 700;" colspan="2">
                    <asp:Label ID="lblTitulo_MetaGrupo" runat="server" Font-Bold="False" style="font-weight: 700" Text="Jan/2014"></asp:Label>
                </td>
                <td class="auto-style32" colspan="2" style="border: 1px solid #CCCCCC; text-align: center; background-color: #993300; font-family: Arial, Helvetica, sans-serif;">
                    Sugestão</td>
                <td class="auto-style32" colspan="2" style="border: 1px solid #CCCCCC; text-align: center; background-color: #996600">Dif. Sugestão - Meta</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style20" style="border: 1px solid #CCCCCC; background-color: #546E96; font-family: 'Times New Roman', Times, serif; font-size: medium; color: #FFFFFF; text-align: center; font-weight: bold;">Descrição da Seção</td>
                <td class="auto-style21" style="border: 1px solid #CCCCCC; background-color: #FF0000; font-family: 'Times New Roman', Times, serif; font-size: medium; color: #FFFFFF; text-align: center; font-weight: bold;">
                    <asp:Label ID="lblTitulo_AA" runat="server" Font-Bold="False" Text="Jan/2014"></asp:Label>
                </td>
                <td class="auto-style23" style="border: 1px solid #CCCCCC; background-color: #FF0000; font-family: 'Times New Roman', Times, serif; font-size: medium; color: #FFFFFF; text-align: center; ">% Part</td>
                <td class="auto-style21" style="border: 1px solid #CCCCCC; background-color: #546E96; font-family: 'Times New Roman', Times, serif; font-size: medium; color: #FFFFFF; text-align: center; font-weight: bold;">
                    <asp:Label ID="lblTitulo_M3" runat="server" Font-Bold="False" Text="Jan/2014"></asp:Label>
                </td>
                <td class="auto-style22" style="border: 1px solid #CCCCCC; background-color: #546E96; font-family: 'Times New Roman', Times, serif; font-size: medium; color: #FFFFFF; text-align: center; ">% Part</td>
                <td class="auto-style21" style="border: 1px solid #CCCCCC; background-color: #546E96; font-family: 'Times New Roman', Times, serif; font-size: medium; color: #FFFFFF; text-align: center; font-weight: bold;">
                    <asp:Label ID="lblTitulo_M2" runat="server" Font-Bold="False" Text="Fev/2014"></asp:Label>
                </td>
                <td class="auto-style22" style="border: 1px solid #CCCCCC; background-color: #546E96; font-family: 'Times New Roman', Times, serif; font-size: medium; color: #FFFFFF; text-align: center; ">% Part</td>
                <td class="auto-style21" style="border: 1px solid #CCCCCC; background-color: #546E96; font-family: 'Times New Roman', Times, serif; font-size: medium; color: #FFFFFF; text-align: center; font-weight: bold;">
                    <asp:Label ID="lblTitulo_M1" runat="server" Font-Bold="False" Text="Mar/2014"></asp:Label>
                </td>
                <td class="auto-style23" style="border: 1px solid #CCCCCC; background-color: #546E96; font-family: 'Times New Roman', Times, serif; font-size: medium; color: #FFFFFF; text-align: center; ">% Part</td>
                <td class="auto-style66" style="border: 1px solid #CCCCCC; background-color:darkgreen; font-family: 'Times New Roman', Times, serif; font-size: medium; color: #FFFFFF; text-align: center; ">
                    R$</td>
                <td class="auto-style24" style="border: 1px solid #CCCCCC; background-color:darkgreen; font-family: 'Times New Roman', Times, serif; font-size: medium; color: #FFFFFF; text-align: center; ">% Part</td>
                <td class="auto-style38" style="border: 1px solid #CCCCCC; background-color: #993300; font-family: 'Times New Roman', Times, serif; font-size: medium; color: #FFFFFF; text-align: center;">R$</td>
                <td class="auto-style34" style="border: 1px solid #CCCCCC; background-color: #993300; font-family: 'Times New Roman', Times, serif; font-size: medium; color: #FFFFFF; ">% Part</td>
                <td class="auto-style42" style="border: 1px solid #CCCCCC; background-color: #996600; font-family: 'Times New Roman', Times, serif; font-size: medium; color: #FFFFFF; text-align: center;">R$</td>
                <td class="auto-style26" style="border: 1px solid #CCCCCC; background-color: #996600; font-family: 'Times New Roman', Times, serif; font-size: medium; color: #FFFFFF; text-align: center;">% Part</td>
                <td class="auto-style21"></td>
                <td class="auto-style21"></td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC" bgcolor="Honeydew">
                    &nbsp;<span class="style13">1 - Seca Pesada</span>&nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:Label ID="lblReal_AA_1" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_1" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_1" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_1" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_01" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_1" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_1" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_1" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_01" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:TextBox ID="txtSecao_01" runat="server" AutoPostBack="True" 
                        BorderStyle="None" Width="50px" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" BackColor="Honeydew" ForeColor="DarkGreen" Font-Size="Small"></asp:TextBox>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_1" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_1" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_1" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_1" runat="server" ForeColor="#993300" Text="0"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC">
                    <span class="style13">&nbsp;2 - Seca Salgada </span>
                </td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_AA_2" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_2" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_2" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_2" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_02" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_2" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_2" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_2" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_02" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_02" runat="server" AutoPostBack="True" 
                        BackColor="#EFEEEF" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" Width="50px" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td align="right" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_2" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_2" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_2" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_2" runat="server" ForeColor="#993300" Text="0"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC" bgcolor="Honeydew">
                    &nbsp;<span class="style13">3 - Seca Doce</span>&nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:Label ID="lblReal_AA_3" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_3" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_3" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_3" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_03" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_3" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_3" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_3" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_03" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:TextBox ID="txtSecao_03" runat="server" AutoPostBack="True" 
                        BorderStyle="None" Width="50px" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" BackColor="Honeydew" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_3" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_3" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_3" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_3" runat="server" ForeColor="#993300" Text="0"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style48" style="border: 1px solid #CCCCCC">
                    <span class="style13">&nbsp;4 - Seca Leve &nbsp;</span></td>
                <td align="right" class="auto-style49" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_AA_4" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style51" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_4" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style49" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_4" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style50" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_4" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style49" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_04" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style50" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_4" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style49" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_4" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style51" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_4" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style68" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_04" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style52" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_04" runat="server" AutoPostBack="True" 
                        BackColor="#EFEEEF" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" Width="50px" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td align="right" class="auto-style54" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_4" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style55" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_4" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style56" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_4" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style49" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_4" runat="server" ForeColor="#993300" Text="0"></asp:Label>
                </td>
                <td class="auto-style49"></td>
                <td class="auto-style49"></td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC" bgcolor="Honeydew">
                    &nbsp;<span class="style13">5 - Limpeza </span>&nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:Label ID="lblReal_AA_5" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_5" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_5" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_5" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_05" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_5" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_5" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_5" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_05" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:TextBox ID="txtSecao_05" runat="server" AutoPostBack="True" 
                        BorderStyle="None" Width="50px" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" BackColor="Honeydew" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_5" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_5" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_5" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_5" runat="server" ForeColor="#993300"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style21" style="border: 1px solid #CCCCCC">
                    <span class="style13">&nbsp;6 - Perfumaria &nbsp;</span></td>
                <td align="right" class="auto-style5" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_AA_6" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style14" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_6" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style5" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_6" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style11" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_6" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style5" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_06" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style11" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_6" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style5" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_6" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style14" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_6" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style69" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_06" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style8" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_06" runat="server" AutoPostBack="True" 
                        BackColor="#EFEEEF" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" Width="50px" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td class="auto-style40" align="right" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_6" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style36" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_6" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style44" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_6" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style18" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_6" runat="server" ForeColor="#993300"></asp:Label>
                </td>
                <td></td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC" bgcolor="Honeydew">
                    &nbsp;<span class="style13">7 - Bebidas Quentes</span>&nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:Label ID="lblReal_AA_7" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_7" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_7" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_7" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_07" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_7" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_7" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_7" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_07" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:TextBox ID="txtSecao_07" runat="server" AutoPostBack="True" 
                        BorderStyle="None" Width="50px" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" BackColor="Honeydew" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_7" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_7" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_7" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_7" runat="server" ForeColor="#993300"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC">
                    <span class="style13">&nbsp;8 - Bebidas Frias </span>
                </td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_AA_8" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_8" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_8" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_8" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_08" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_8" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_8" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_8" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_08" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_08" runat="server" AutoPostBack="True" 
                        BackColor="#EFEEEF" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" Width="50px" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td align="right" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_8" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_8" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_8" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_8" runat="server" ForeColor="#993300"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC" bgcolor="Honeydew">
                    &nbsp;<span class="style13">9 - Saudáveis</span>&nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:Label ID="lblReal_AA_9" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_9" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_9" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_9" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_09" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_9" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_9" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_9" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_09" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:TextBox ID="txtSecao_09" runat="server" AutoPostBack="True" 
                        BorderStyle="None" Width="50px" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" BackColor="Honeydew" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_9" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_9" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_9" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_9" runat="server" ForeColor="#993300"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC" bgcolor="#FFFFCE">
                    &nbsp;<b><span class="style17">Total da 
                    Mercearia =&gt;</span></b>&nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#FFFFCE">
                    <asp:Label ID="lblReal_AA_Depto1" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_Depto1" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_Depto1" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_Depto1" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_Depto1" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_Depto1" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_Depto1" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_Depto1" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Depto_1" runat="server" CssClass="style13" Font-Bold="True" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#FFFFCE">
                    <asp:Label ID="txtDepto_1" runat="server" CssClass="style13" Font-Bold="True" 
                        Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_Depto1" runat="server" ForeColor="#993300" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_Depto1" runat="server" ForeColor="#993300" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_Depto1" runat="server" ForeColor="#993300" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_Depto6" runat="server" ForeColor="#993300" style="font-weight: 700" Text="0"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC" bgcolor="#F8F8F3">
                    &nbsp;11 - Leite &nbsp;&nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="lblReal_AA_11" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_11" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_11" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_11" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_11" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_11" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_11" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_11" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_11" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:TextBox ID="txtSecao_11" runat="server" AutoPostBack="True" 
                        BackColor="#F8F8F3" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" Width="50px" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_11" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_11" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_11" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_11" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC">
                    &nbsp;12 - Fiambreria &nbsp;&nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_AA_12" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_12" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_12" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_12" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_12" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_12" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_12" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_12" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_12" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_12" runat="server" AutoPostBack="True" 
                        BackColor="#EFEEEF" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" Width="50px" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td align="right" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_12" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_12" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_12" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_12" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC" bgcolor="#F8F8F3">
                    &nbsp;13 - Rotisseria &nbsp;&nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="lblReal_AA_13" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_13" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_13" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_13" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_13" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_13" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_13" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_13" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_13" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:TextBox ID="txtSecao_13" runat="server" AutoPostBack="True" 
                        BackColor="#F8F8F3" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" Width="50px" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_13" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_13" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_13" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_13" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC">
                    &nbsp;14 - Frios &amp; Massas &nbsp;&nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_AA_14" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_14" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_14" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_14" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_14" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_14" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_14" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_14" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_14" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_14" runat="server" AutoPostBack="True" 
                        BackColor="#EFEEEF" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" Width="50px" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td align="right" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_14" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_14" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_14" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_14" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC" bgcolor="#F8F8F3">
                    &nbsp;15 - Latícinios &nbsp;&nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="lblReal_AA_15" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_15" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_15" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_15" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_15" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_15" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_15" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_15" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_15" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:TextBox ID="txtSecao_15" runat="server" AutoPostBack="True" 
                        BackColor="#F8F8F3" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" Width="50px" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_15" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_15" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_15" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_15" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC">
                    &nbsp;16 - Congelados &nbsp;&nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_AA_16" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_16" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_16" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_16" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_16" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_16" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_16" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_16" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_16" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_16" runat="server" AutoPostBack="True" 
                        BackColor="#EFEEEF" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" Width="50px" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td align="right" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_16" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_16" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_16" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_16" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC" bgcolor="#F8F8F3">
                    &nbsp;17 - Padaria &nbsp;&nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="lblReal_AA_17" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_17" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_17" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_17" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_17" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_17" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_17" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_17" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_17" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:TextBox ID="txtSecao_17" runat="server" AutoPostBack="True" 
                        BackColor="#F8F8F3" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" Width="50px" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_17" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_17" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_17" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_17" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC">
                    &nbsp;18 - Confeitaria &nbsp;&nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_AA_18" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_18" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_18" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_18" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_18" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_18" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_18" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_18" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_18" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_18" runat="server" AutoPostBack="True" 
                        BackColor="#EFEEEF" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" Width="50px" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td align="right" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_18" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_18" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_18" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_18" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC" bgcolor="#F8F8F3">
                    &nbsp;19 - Pães Industrializados</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="lblReal_AA_19" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_19" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_19" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_19" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_19" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_19" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_19" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_19" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_19" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:TextBox ID="txtSecao_19" runat="server" AutoPostBack="True" 
                        BackColor="#F8F8F3" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" Width="50px" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_19" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_19" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_19" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_19" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC">
                    &nbsp;21 - Açougue &nbsp;&nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_AA_21" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_21" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_21" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_21" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_21" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_21" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_21" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_21" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_21" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_21" runat="server" AutoPostBack="True" 
                        BackColor="#EFEEEF" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" Width="50px" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td align="right" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_21" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_21" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_21" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_21" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC" bgcolor="#F8F8F3">
                    &nbsp;22 - Granjeiros&nbsp;&nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="lblReal_AA_22" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_22" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_22" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_22" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_22" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_22" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_22" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_22" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_22" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:TextBox ID="txtSecao_22" runat="server" AutoPostBack="True" 
                        BackColor="#F8F8F3" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" Width="50px" Height="18px" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_22" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_22" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_22" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_22" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC">
                    &nbsp;23 - Hortifruti &nbsp;&nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_AA_23" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_23" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_23" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_23" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_23" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_23" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_23" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_23" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_23" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_23" runat="server" AutoPostBack="True" 
                        BackColor="#EFEEEF" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" Width="50px" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td align="right" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_23" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_23" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_23" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_23" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC">&nbsp;25 - Saudaveis</td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_AA_25" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_25" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_25" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_25" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_25" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_25" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_25" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_25" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_25" runat="server" CssClass="style13" ForeColor="Blue" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style29" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_25" runat="server" AutoPostBack="True" BackColor="#F8F8F3" BorderStyle="None" ForeColor="DarkGreen" Height="18px" onfocus="this.select();" style="text-align:right; font-weight: 700;" Width="50px"></asp:TextBox>
                </td>

                <td align="right" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_25" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_25" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>

                <td align="right" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_25" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_25" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">&nbsp;</td>
                <td align="right" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">&nbsp;</td>
                <td align="right" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">&nbsp;</td>
                <td align="right" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style27" style="border: 1px solid #CCCCCC" bgcolor="#FFFFCE">
                    &nbsp;<b><span class="style17">Total 
                    dos Perecíveis =&gt;</span></b><span class="style17">&nbsp;</span>&nbsp;</td>
                <td align="right" class="style30" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#FFFFCE">
                    <asp:Label ID="lblReal_AA_Depto2" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style15" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_Depto2" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="style30" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_Depto2" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style12" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_Depto2" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="style30" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_Depto2" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style12" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_Depto2" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="style30" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_Depto2" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style15" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_Depto2" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style70" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Depto_2" runat="server" CssClass="style13" Font-Bold="True" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style30" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#FFFFCE">
                    <asp:Label ID="txtDepto_2" runat="server" CssClass="style13" Font-Bold="True" 
                        Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style47" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_Depto2" runat="server" ForeColor="#993300" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style60" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_Depto2" runat="server" ForeColor="#993300" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style45" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_Depto2" runat="server" ForeColor="#993300" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style19" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_Depto7" runat="server" ForeColor="#993300" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td></td>
                <td class="style30"></td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC" bgcolor="#ECF5FF">
                    &nbsp;30 - Ferragens &nbsp;&nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#ECF5FF">
                    <asp:Label ID="lblReal_AA_30" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_30" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_30" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_30" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_30" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_30" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_30" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_30" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_30" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#ECF5FF">
                    <asp:TextBox ID="txtSecao_30" runat="server" AutoPostBack="True" 
                        BackColor="#ECF5FF" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" Width="50px" Height="18px" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_30" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_30" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_30" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_30" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC">
                    &nbsp;31 - Papelaria &nbsp;&nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_AA_31" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_31" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_31" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_31" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_31" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_31" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_31" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_31" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_31" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_31" runat="server" AutoPostBack="True" 
                        BackColor="#EFEEEF" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" Width="50px" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td align="right" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_31" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_31" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_31" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_31" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC" bgcolor="#ECF5FF">
                    &nbsp;32 - Casa e Utilidades</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#ECF5FF">
                    <asp:Label ID="lblReal_AA_32" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_32" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_32" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_32" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_32" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_32" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_32" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_32" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_32" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#ECF5FF">
                    <asp:TextBox ID="txtSecao_32" runat="server" AutoPostBack="True" 
                        BackColor="#ECF5FF" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" Width="50px" Height="18px" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_32" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_32" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_32" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_32" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC">
                    &nbsp;33 - Brinquedos &nbsp;&nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_AA_33" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_33" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_33" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_33" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_33" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_33" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_33" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_33" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_33" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_33" runat="server" AutoPostBack="True" 
                        BackColor="#EFEEEF" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" Width="50px" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td align="right" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_33" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_33" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_33" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_33" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC" bgcolor="#ECF5FF">
                    &nbsp;34 - Jardins &nbsp;&nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#ECF5FF">
                    <asp:Label ID="lblReal_AA_34" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_34" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_34" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_34" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_34" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_34" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_34" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_34" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_34" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#ECF5FF">
                    <asp:TextBox ID="txtSecao_34" runat="server" AutoPostBack="True" 
                        BackColor="#ECF5FF" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" Width="50px" Height="18px" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_34" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_34" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_34" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_34" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC">
                    &nbsp;35 - Animais &nbsp;&nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_AA_35" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_35" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_35" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_35" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_35" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_35" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_35" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_35" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_35" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_35" runat="server" AutoPostBack="True" 
                        BackColor="#EFEEEF" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" Width="50px" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td align="right" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_35" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_35" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_35" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_35" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC" bgcolor="#ECF5FF">
                    &nbsp;36 - Musica &nbsp;&nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#ECF5FF">
                    <asp:Label ID="lblReal_AA_36" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_36" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_36" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_36" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_36" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_36" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_36" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_36" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_36" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#ECF5FF">
                    <asp:TextBox ID="txtSecao_36" runat="server" AutoPostBack="True" 
                        BackColor="#ECF5FF" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" Width="50px" Height="18px" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_36" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_36" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_36" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#ECF5FF" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_36" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC" bgcolor="#FFFFCE">
                    &nbsp;<b><span class="style17">Total do 
                    Bazar =&gt;</span></b><span class="style17">&nbsp;</span>&nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#FFFFCE">
                    <asp:Label ID="lblReal_AA_Depto3" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_Depto3" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_Depto3" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_Depto3" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_Depto3" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_Depto3" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_Depto3" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_Depto3" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Depto_3" runat="server" CssClass="style13" Font-Bold="True" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#FFFFCE">
                    <asp:Label ID="txtDepto_3" runat="server" CssClass="style13" Font-Bold="True" 
                        Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_Depto3" runat="server" ForeColor="#993300" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_Depto3" runat="server" ForeColor="#993300" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_Depto3" runat="server" ForeColor="#993300" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_Depto8" runat="server" ForeColor="#993300" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC" bgcolor="Honeydew">
                    &nbsp;40 - Calçados &nbsp;&nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:Label ID="lblReal_AA_40" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_40" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_40" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_40" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_40" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_40" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_40" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_40" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_40" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:TextBox ID="txtSecao_40" runat="server" AutoPostBack="True" 
                        BackColor="Honeydew" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" Width="50px" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_40" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_40" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_40" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_40" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC">
                    &nbsp;41 - Confecções &nbsp;&nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_AA_41" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_41" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_41" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_41" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_41" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_41" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_41" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_41" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_41" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_41" runat="server" AutoPostBack="True" 
                        BackColor="#EFEEEF" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" Width="50px" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td align="right" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_41" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_41" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_41" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_41" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style27" style="border: 1px solid #CCCCCC" bgcolor="Honeydew">
                    &nbsp;42 - Cama, Mesa &nbsp;&nbsp;</td>
                <td align="right" class="auto-style6" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:Label ID="lblReal_AA_42" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style15" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_42" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style6" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_42" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style12" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_42" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style6" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_42" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style12" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_42" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style6" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_42" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style15" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_42" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style70" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_42" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style30" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:TextBox ID="txtSecao_42" runat="server" AutoPostBack="True" 
                        BackColor="Honeydew" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" Width="50px" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td class="auto-style47" align="right" bgcolor="Honeydew" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_42" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style60" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_42" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style45" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_42" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="Honeydew" class="auto-style19" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_42" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td></td>
                <td class="style30"></td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC">
                    &nbsp;49 - Puericultura &nbsp;&nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_AA_49" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_49" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_49" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_49" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_49" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_49" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_49" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_49" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_49" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_49" runat="server" AutoPostBack="True" 
                        BackColor="#EFEEEF" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" Width="50px" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td align="right" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_49" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_49" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_49" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_49" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC" bgcolor="#FFFFCE">
                    &nbsp;<b><span class="style17">Total de 
                    Textil =&gt;</span></b><span class="style17">&nbsp;</span>&nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#FFFFCE">
                    <asp:Label ID="lblReal_AA_Depto4" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_Depto4" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_Depto4" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_Depto4" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_Depto4" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_Depto4" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_Depto4" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_Depto4" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Depto_4" runat="server" CssClass="style13" Font-Bold="True" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#FFFFCE">
                    <asp:Label ID="txtDepto_4" runat="server" CssClass="style13" Font-Bold="True" 
                        Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_Depto4" runat="server" ForeColor="#993300" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_Depto4" runat="server" ForeColor="#993300" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_Depto4" runat="server" ForeColor="#993300" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_Depto9" runat="server" ForeColor="#993300" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC" bgcolor="#F8F8F3">
                    &nbsp;50 - Eletrodomésticos&nbsp;&nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="lblReal_AA_50" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_50" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_50" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_50" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_50" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_50" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_50" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_50" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_50" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:TextBox ID="txtSecao_50" runat="server" AutoPostBack="True" 
                        BackColor="#F8F8F3" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" Width="50px" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_50" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_50" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_50" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_50" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC">
                    &nbsp;51 - Eletroportáteis &nbsp;&nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_AA_51" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_51" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_51" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_51" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_51" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_51" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_51" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_51" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_51" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_51" runat="server" AutoPostBack="True" 
                        BackColor="#EFEEEF" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" Width="50px" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td align="right" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_51" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_51" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_51" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_51" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style27" style="border: 1px solid #CCCCCC" bgcolor="#F8F8F3">
                    &nbsp;52 - Telefonia &nbsp;&nbsp;</td>
                <td align="right" class="auto-style6" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="lblReal_AA_52" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style15" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_52" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style6" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_52" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style12" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_52" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style6" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_52" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style12" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_52" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style6" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_52" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style15" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_52" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style70" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_52" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style30" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:TextBox ID="txtSecao_52" runat="server" AutoPostBack="True" 
                        BackColor="#F8F8F3" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" Width="50px" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td class="auto-style47" align="right" bgcolor="#F8F8F3" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_52" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style60" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_52" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style45" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_52" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style19" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_52" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td class="style30"></td>
                <td class="style30"></td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC">
                    &nbsp;53 - Informática &nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_AA_53" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_53" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_53" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_53" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_53" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_53" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_53" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_53" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_53" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_53" runat="server" AutoPostBack="True" 
                        BackColor="#EFEEEF" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" Width="50px" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td align="right" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_53" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_53" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_53" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_53" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC" bgcolor="#F8F8F3">
                    &nbsp;54 - Cine/Foto/Som &nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="lblReal_AA_54" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_54" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_54" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_54" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_54" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_54" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_54" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_54" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_54" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:TextBox ID="txtSecao_54" runat="server" AutoPostBack="True" 
                        BackColor="#F8F8F3" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" Width="50px" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_54" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_54" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_54" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F8F8F3" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_54" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC">
                    &nbsp;55 - Colchões e Boxes &nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_AA_55" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_55" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_55" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_55" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_55" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_55" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_55" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_55" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_55" runat="server" CssClass="style13" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_55" runat="server" AutoPostBack="True" 
                        BackColor="#EFEEEF" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right; font-weight: 700;" Width="50px" ForeColor="DarkGreen"></asp:TextBox>
                </td>
                <td align="right" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_55" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_55" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_55" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_55" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC">99 - Carretos</td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_AA_99" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_99" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_99" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_99" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_99" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_99" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_99" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_99" runat="server" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_99" runat="server" CssClass="style13" ForeColor="Blue" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style29" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_99" runat="server" AutoPostBack="True" BackColor="#EFEEEF" BorderStyle="None" ForeColor="DarkGreen" onfocus="this.select();" style="text-align:right; font-weight: 700;" Width="50px"></asp:TextBox>
                </td>
                <td align="right" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_99" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_99" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_99" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDifVlr_99" runat="server" ForeColor="#993300" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC" bgcolor="#FFFFCE">
                    &nbsp;<b><span class="style17">Total de 
                    Eletro =&gt;</span></b><span class="style17">&nbsp;</span>&nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#FFFFCE">
                    <asp:Label ID="lblReal_AA_Depto5" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_Depto5" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_Depto5" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_Depto5" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_Depto5" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_Depto5" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_Depto5" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_Depto5" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Depto_5" runat="server" CssClass="style13" Font-Bold="True" Text="Label" ForeColor="Blue"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#FFFFCE">
                    <asp:Label ID="txtDepto_5" runat="server" CssClass="style13" Font-Bold="True" 
                        Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_Depto5" runat="server" ForeColor="#993300" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_Depto5" runat="server" ForeColor="#993300" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_Depto5" runat="server" ForeColor="#993300" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#FFFFCE" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_Depto10" runat="server" ForeColor="#993300" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20" style="border: 1px solid #CCCCCC" bgcolor="#F4F4F4">
                    &nbsp;<strong>Total Geral da Loja =&gt;</strong>&nbsp;</td>
                <td align="right" class="auto-style4" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F4F4F4">
                    <asp:Label ID="lblReal_AA_Total" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F4F4F4" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_AA_Total" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F4F4F4" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M2_Total" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F4F4F4" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M2_Total" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F4F4F4" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M1_Total" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F4F4F4" class="auto-style10" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M1_Total" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F4F4F4" class="auto-style4" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblReal_M0_Total" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F4F4F4" class="auto-style13" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblRealPart_M0_Total" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F4F4F4" class="auto-style67" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Total_Venda" runat="server" CssClass="style13" Font-Bold="True" ForeColor="Blue" Text="Label"></asp:Label>
                </td>
                <td align="right" class="auto-style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F4F4F4">
                    <asp:Label ID="txtTotalVenda" runat="server" CssClass="style13" 
                        Font-Bold="True" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F4F4F4" class="auto-style46" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestaoVlr_Total" runat="server" ForeColor="#993300" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F4F4F4" class="auto-style59" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblSugestao_Total" runat="server" ForeColor="#993300" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F4F4F4" class="auto-style43" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_Total" runat="server" ForeColor="#993300" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F4F4F4" class="auto-style17" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="lblDif_Total0" runat="server" ForeColor="#993300" style="font-weight: 700" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="style20">
                    <asp:TextBox ID="VendaRevista" runat="server" BorderStyle="None" 
                        ForeColor="White" Visible="False"></asp:TextBox>
                </td>
                <td class="auto-style4">
                    &nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td class="auto-style67">&nbsp;</td>
                <td class="auto-style29">
                    &nbsp;</td>
                <td class="auto-style46">
                    &nbsp;</td>
                <td class="auto-style59">&nbsp;</td>
                <td class="auto-style43">&nbsp;</td>
                <td class="auto-style17">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
    </p>
    </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>

