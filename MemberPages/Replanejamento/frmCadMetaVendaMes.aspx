<%@ Page Title="Cadastro de Metas Vendas" Language="VB" MasterPageFile="~/MemberPages/SiteMetas.master" AutoEventWireup="false" CodeFile="frmCadMetaVendaMes.aspx.vb" Inherits="MemberPages_frmCadMetaVendaMes" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxp" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxrp" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
    .style4
    {
        width: 100%;
        border-collapse: collapse;
    }
    .style8
    {
        height: 17px;
        font-family: Arial, Helvetica, sans-serif;
        font-size: small;
        width: 175px;
    }
    .style10
    {
        height: 17px;
        width: 106px;
    }
    .style13
    {
        height: 17px;
        width: 102px;
    }
    .style5
    {
        height: 17px;
    }
    .style9
    {
        font-family: Arial, Helvetica, sans-serif;
        font-size: small;
        width: 175px;
    }
    .style11
    {
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
            width: 106px;
        }
    .style14
    {
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
            width: 102px;
        }
    .style6
    {
        font-family: Arial, Helvetica, sans-serif;
        font-size: small;
    }
    .style12
    {
            height: 17px;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
            width: 106px;
        }
    .style15
    {
            height: 17px;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
            width: 102px;
        }
    .style7
    {
        height: 17px;
        font-family: Arial, Helvetica, sans-serif;
        font-size: small;
    }
    .style16
    {
        height: 19px;
        font-family: Arial, Helvetica, sans-serif;
        font-size: small;
        width: 175px;
    }
    .style17
    {
        height: 19px;
        font-family: Arial, Helvetica, sans-serif;
        font-size: small;
        width: 106px;
    }
    .style18
    {
        height: 19px;
        font-family: Arial, Helvetica, sans-serif;
        font-size: small;
        width: 102px;
    }
    .style19
    {
        height: 19px;
        font-family: Arial, Helvetica, sans-serif;
        font-size: small;
    }

.dxeButtonEdit_Aqua
{
    background-color: White;
    border: Solid 1px #AECAF0;
    width: 170px;
}
.dxeEditArea_Aqua 
{
	font-family: Tahoma;
	font-size: 9pt;
	border: 1px solid #A0A0A0;
}
.dxeButtonEditButton_Aqua
{
	padding: 5px 2px 5px 2px;
}
.dxeButtonEditButton_Aqua,
.dxeSpinIncButton_Aqua, .dxeSpinDecButton_Aqua, .dxeSpinLargeIncButton_Aqua, .dxeSpinLargeDecButton_Aqua
{
    padding: 1px 2px 3px 2px;
	background-image: url('../App_Themes/Aqua/Editors/edtDropDownBack.gif');
    background-repeat: repeat-x;
    background-color: #DBEBFF;
}
.dxeButtonEditButton_Aqua, .dxeCalendarButton_Aqua,
.dxeSpinIncButton_Aqua, .dxeSpinDecButton_Aqua,
.dxeSpinLargeIncButton_Aqua, .dxeSpinLargeDecButton_Aqua
{	
	vertical-align: Middle;
	border: Solid 1px #A3C0E8;
	cursor: pointer;
	cursor: hand;
} 
        .style23
        {
            width: 37px;
        }
        .style24
        {
            width: 95px;
        }
        .style25
        {
            width: 33px;
        }
        .style26
        {
            color: #666666;
        }
        .style27
        {
            width: 170px;
        }
        .style28
        {
            width: 107px;
            color: #FFFFFF;
            font-weight: bold;
        }
        .style29
        {
            width: 100px;
        }
        .style31
        {
            width: 103px;
        }
        .style32
        {
            width: 161px;
            font-weight: bold;
            color: #FFFFFF;
        }
        .style33
        {
            width: 431px;
        }
        .style34
        {
            width: 268px;
        }
        .style36
        {
            width: 89px;
        }
        .style37
        {
            width: 104px;
        }
        .style38
        {
            width: 245px;
        }

        #divMeta_Loja {
            clear: both;
            float:left ;
        }

        #divMeta_Posto {            
            float:left ;
            margin-left: 20px;
        }

         #divMeta_Atacarejo {            
            float:left ;
            margin-left: 20px;
        }

        .auto-style1 {
            font-size: small;
        }

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <div id="divAno">
        <uc1:wucAno runat="server" ID="cboAno" />
    </div>

    <div id="divMes">
        <uc1:wuciListaMes runat="server" ID="cboMes" />
    </div>
    
    <div id="divMeta_Loja">

                        <dxrp:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" BackColor="White" 
                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" Height="1080px"  Font-Size="Larger"
                    Width="300px" HeaderText="Cadastro de Meta de Venda - Revista - Lojas">
                    
                    
                    <ContentPaddings Padding="2px" />
                    
                    
                    <Border BorderColor="#AECAF0" BorderStyle="Solid" BorderWidth="1px" />
                    
                    <HeaderStyle BackColor="#E0EDFF" HorizontalAlign="Center">
                    <BorderBottom BorderColor="#AECAF0" BorderStyle="Solid" BorderWidth="1px" />
                    </HeaderStyle>
                    
                    
                    <HeaderContent>
                        <BackgroundImage ImageUrl="~/App_Themes/Aqua/Web/rpHeaderBackground.gif" 
                            Repeat="RepeatX" VerticalPosition="Top" />
                    </HeaderContent>
                    
                    
                    <PanelCollection>
<dxp:PanelContent ID="PanelContent1" runat="server">
    <table cellspacing="1" class="style1">
        <tr>
            <td>
                <asp:Panel ID="Panel2" runat="server" BorderColor="#999999" BorderStyle="Solid" 
                    BorderWidth="1px" Width="375px">
                    <table cellpadding="0" class="style4">
                        <tr>
                            <td align="center" bgcolor="#99CCFF" class="style32" 
                                style="border-right-style: solid; border-right-width: 1px; border-right-color: #999999">
                                Filial</td>
                            <td align="center" bgcolor="#99CCFF" class="style28" 
                                style="border-right-style: solid; border-right-width: 1px; border-right-color: #999999">
                                Original</td>
                            <td align="center" bgcolor="#99CCFF" class="style2">
                                Revista</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <asp:Panel ID="Panel1" runat="server" Height="1400px" Width="400px" 
        ScrollBars="Vertical">
        <table cellpadding="0" class="style4">
            <tr>
                <td bgcolor="#F9F9F7" class="style8" style="border: 1px solid #C0C0C0">
                    &nbsp;03 - Santa Felicidade&nbsp;</td>
                <td align="right" bgcolor="#F9F9F7" class="style10" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja03" runat="server" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small" 
                        Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style13" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja03" runat="server" BackColor="#F9F9F7" 
                        BorderStyle="None" Width="90px" onfocus="this.select();" 
                        style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;04 - Lapa&nbsp;</td>
                <td class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja04" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja04" runat="server" BorderStyle="None" Width="90px" 
                        onfocus="this.select();" style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;05 - Wenceslau&nbsp;</td>
                <td class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja05" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtloja05" runat="server" BorderStyle="None" Width="90px" 
                        onfocus="this.select();" style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;06 - Pinheirinho&nbsp;</td>
                <td class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja06" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja06" runat="server" BorderStyle="None" Width="90px" 
                        onfocus="this.select();" style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;07 - Hauer&nbsp;</td>
                <td bgcolor="#F9F9F7" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja07" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja07" runat="server" BackColor="#F9F9F7" 
                        BorderStyle="None" Width="90px" onfocus="this.select();" 
                        style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;08 - Paranaguá&nbsp;</td>
                <td class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja08" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja08" runat="server" BorderStyle="None" Width="90px" 
                        onfocus="this.select();" style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;09 - Londrina&nbsp;</td>
                <td bgcolor="#F9F9F7" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja09" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja09" runat="server" BackColor="#F9F9F7" 
                        BorderStyle="None" Width="90px" onfocus="this.select();" 
                        style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">&nbsp;10 - Campo 
                    Comprido&nbsp;</td>
                <td bgcolor="#F9F9F7" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja10" runat="server" CssClass="style26" Text="Label"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja10" runat="server" AutoPostBack="True" 
                        BackColor="#F9F9F7" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="90px"></asp:TextBox>
                </td>
                <td class="style6">&nbsp;</td>
            </tr>
            <tr>
                <td class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;11 - São Bráz&nbsp;</td>
                <td class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja11" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja11" runat="server" BorderStyle="None" Width="90px" 
                        onfocus="this.select();" style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;13 - Guarapuava&nbsp;</td>
                <td bgcolor="#F9F9F7" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja13" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja13" runat="server" BackColor="#F9F9F7" 
                        BorderStyle="None" Width="90px" onfocus="this.select();" 
                        style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;14 - São José dos Pinhais&nbsp;</td>
                <td class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja14" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja14" runat="server" BorderStyle="None" Width="90px" 
                        onfocus="this.select();" style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;15 - Apucarana&nbsp;</td>
                <td bgcolor="#F9F9F7" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja15" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja15" runat="server" BackColor="#F9F9F7" 
                        BorderStyle="None" Width="90px" onfocus="this.select();" 
                        style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="White" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;17 - Ahú&nbsp;</td>
                <td bgcolor="White" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja17" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="White" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja17" runat="server" BorderStyle="None" Width="90px" 
                        onfocus="this.select();" style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;18 - Ponta Grossa Centro&nbsp;</td>
                <td bgcolor="#F9F9F7" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja18" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja18" runat="server" BackColor="#F9F9F7" 
                        BorderStyle="None" Width="90px" onfocus="this.select();" 
                        style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="White" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;19 - Ponta Grossa Nova&nbsp;</td>
                <td bgcolor="White" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja19" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="White" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja19" runat="server" BorderStyle="None" Width="90px" 
                        onfocus="this.select();" style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#F9F9F7" class="style16" style="border: 1px solid #C0C0C0">
                    &nbsp;20 - Maringá&nbsp;</td>
                <td bgcolor="#F9F9F7" class="style17" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja20" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style18" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja20" runat="server" BackColor="#F9F9F7" 
                        BorderStyle="None" Width="90px" onfocus="this.select();" 
                        style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style19">
                </td>
            </tr>
            <tr>
                <td bgcolor="White" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;21 - Nilo Peçanha&nbsp;</td>
                <td bgcolor="White" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja21" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="White" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja21" runat="server" BorderStyle="None" Width="90px" 
                        onfocus="this.select();" style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;22 - Champagnat&nbsp;</td>
                <td bgcolor="#F9F9F7" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja22" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja22" runat="server" BackColor="#F9F9F7" 
                        BorderStyle="None" Width="90px" onfocus="this.select();" 
                        style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="White" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;23 - Araucária Nova&nbsp;</td>
                <td bgcolor="White" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja23" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="White" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja23" runat="server" BorderStyle="None" Width="90px" 
                        onfocus="this.select();" style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;24 - Santa Cândida&nbsp;</td>
                <td bgcolor="#F9F9F7" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja24" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja24" runat="server" BackColor="#F9F9F7" 
                        BorderStyle="None" Width="90px" onfocus="this.select();" 
                        style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="White" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;25 - Raia&nbsp;</td>
                <td bgcolor="White" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja25" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="White" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja25" runat="server" BorderStyle="None" Width="90px" 
                        onfocus="this.select();" style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#F9F9F7" class="style8" style="border: 1px solid #C0C0C0">
                    &nbsp;26 - Torres</td>
                <td bgcolor="#F9F9F7" class="style12" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja26" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style15" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja26" runat="server" BackColor="#F9F9F7" 
                        BorderStyle="None" Width="90px" onfocus="this.select();" 
                        style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style7">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="White" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;27 - Novo Mundo&nbsp;</td>
                <td bgcolor="White" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja27" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="White" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja27" runat="server" BorderStyle="None" Width="90px" 
                        onfocus="this.select();" style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;28 - Cristo Rei&nbsp;</td>
                <td bgcolor="#F9F9F7" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja28" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja28" runat="server" BackColor="#F9F9F7" 
                        BorderStyle="None" Width="90px" onfocus="this.select();" 
                        style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="White" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;29 - Água Verde&nbsp;</td>
                <td bgcolor="White" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja29" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="White" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja29" runat="server" BorderStyle="None" Width="90px" 
                        onfocus="this.select();" style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#F9F9F7" class="style8" style="border: 1px solid #C0C0C0">
                    &nbsp;30 - Fazenda Rio Grande&nbsp;</td>
                <td bgcolor="#F9F9F7" class="style12" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja30" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style15" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja30" runat="server" BackColor="#F9F9F7" 
                        BorderStyle="None" Width="90px" onfocus="this.select();" 
                        style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style7">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="White" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;31 - Campo Largo&nbsp;</td>
                <td bgcolor="White" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja31" runat="server" Text="Label" CssClass="style26" ></asp:Label>
                </td>
                <td bgcolor="White" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja31" runat="server" BorderStyle="None" Width="90px" 
                        onfocus="this.select();" style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;32 - Uvaranas&nbsp;</td>
                <td bgcolor="#F9F9F7" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja32" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja32" runat="server" BackColor="#F9F9F7" 
                        BorderStyle="None" Width="90px" onfocus="this.select();" 
                        style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;33 - S.J.P. Braga&nbsp;</td>
                <td bgcolor="#F9F9F7" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja33" runat="server" CssClass="style26" Text="Label"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja33" runat="server" AutoPostBack="True" 
                        BackColor="#F9F9F7" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="90px"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="White" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;34 - Brasilia&nbsp;</td>
                <td bgcolor="White" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja34" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="White" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja34" runat="server" BorderStyle="None" Width="90px" 
                        onfocus="this.select();" style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;36 - Castro&nbsp;</td>
                <td bgcolor="#F9F9F7" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja36" runat="server" CssClass="style26" Text="Label"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja36" runat="server" AutoPostBack="True" 
                        BackColor="#F9F9F7" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="90px"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;37 - Cajuru&nbsp;</td>
                <td bgcolor="#F9F9F7" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja37" runat="server" CssClass="style26" Text="Label"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja37" runat="server" AutoPostBack="True" 
                        BackColor="#F9F9F7" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="90px"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;38 - Colombo&nbsp;</td>
                <td bgcolor="#F9F9F7" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja38" runat="server" CssClass="style26" Text="Label"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja38" runat="server" AutoPostBack="True" 
                        BackColor="#F9F9F7" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="90px"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">&nbsp;39 - 
                    Pinhais&nbsp;</td>
                <td bgcolor="#F9F9F7" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja39" runat="server" CssClass="style26" Text="Label"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja39" runat="server" AutoPostBack="True" 
                        BackColor="#F9F9F7" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="90px"></asp:TextBox>
                </td>
                <td class="style6">&nbsp;</td>
            </tr>

            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">&nbsp;40 - Maringa nova</td>
                <td bgcolor="#F9F9F7" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja40" runat="server" CssClass="style26" Text="Label"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja40" runat="server" AutoPostBack="True" 
                        BackColor="#F9F9F7" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="90px"></asp:TextBox>
                </td>
                <td class="style6">&nbsp;</td>
            </tr>

            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">&nbsp;41 - Campo Mourao&nbsp;</td>
                <td bgcolor="#F9F9F7" class="style11" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja41" runat="server" CssClass="style26" Text="Label"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja41" runat="server" AutoPostBack="True" BackColor="#F9F9F7" BorderStyle="None" onfocus="this.select();" style="text-align:right" Width="90px"></asp:TextBox>
                </td>
                <td class="style6">&nbsp;</td>
            </tr>

            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">&nbsp;42 - P.G. Jardim Carvalho&nbsp;</td>
                <td bgcolor="#F9F9F7" class="style11" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja42" runat="server" CssClass="style26" Text="Label"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja42" runat="server" AutoPostBack="True" BackColor="#F9F9F7" BorderStyle="None" onfocus="this.select();" style="text-align:right" Width="90px"></asp:TextBox>
                </td>
                <td class="style6">&nbsp;</td>
            </tr>

            <tr>
                <td bgcolor="#F9F9F7" class="style16" style="border: 1px solid #C0C0C0">&nbsp;43 - Almirante Tamand</td>
                <td bgcolor="#F9F9F7" class="style17" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja43" runat="server" CssClass="style26" Text="Label"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style18" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja43" runat="server" AutoPostBack="True" BackColor="#F9F9F7" BorderStyle="None" onfocus="this.select();" style="text-align:right" Width="90px"></asp:TextBox>
                </td>
                <td class="style19"></td>
            </tr>

            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">&nbsp;44 - P.G. Oficinas&nbsp;</td>
                <td bgcolor="#F9F9F7" class="style11" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja44" runat="server" CssClass="style26" Text="Label"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja44" runat="server" AutoPostBack="True" BackColor="#F9F9F7" BorderStyle="None" onfocus="this.select();" style="text-align:right" Width="90px"></asp:TextBox>
                </td>
                <td class="style6">&nbsp;</td>
            </tr>

            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">&nbsp;45 - Araucária Costeira&nbsp;</td>
                <td bgcolor="#F9F9F7" class="style11" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja45" runat="server" CssClass="style26" Text="Label"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja45" runat="server" AutoPostBack="True" BackColor="#F9F9F7" BorderStyle="None" onfocus="this.select();" style="text-align:right" Width="90px"></asp:TextBox>
                </td>
                <td class="style6">&nbsp;</td>
            </tr>

            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">&nbsp;46 - Campo Largo&nbsp;</td>
                <td bgcolor="#F9F9F7" class="style11" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja46" runat="server" CssClass="style26" Text="Label"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja46" runat="server" AutoPostBack="True" BackColor="#F9F9F7" BorderStyle="None" onfocus="this.select();" style="text-align:right" Width="90px"></asp:TextBox>
                </td>
                <td class="style6">&nbsp;</td>
            </tr>

            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">&nbsp;47 - Pinhais Av. Irai</td>
                <td bgcolor="#F9F9F7" class="style11" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja47" runat="server" CssClass="style26" Text="Label"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja47" runat="server" AutoPostBack="True" BackColor="#F9F9F7" BorderStyle="None" onfocus="this.select();" style="text-align:right" Width="90px"></asp:TextBox>
                </td>
                <td class="style6">&nbsp;</td>
            </tr>

            <tr>
                <td bgcolor="#F9F9F7" class="style16" style="border: 1px solid #C0C0C0">&nbsp;48 - Joinville</td>
                <td bgcolor="#F9F9F7" class="style17" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja48" runat="server" CssClass="style26" Text="Label"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style18" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja48" runat="server" AutoPostBack="True" BackColor="#F9F9F7" BorderStyle="None" onfocus="this.select();" style="text-align:right" Width="90px"></asp:TextBox>
                </td>
                <td class="style19"></td>
            </tr>

            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">&nbsp;49 - Boa Vista</td>
                <td bgcolor="#F9F9F7" class="style11" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja49" runat="server" CssClass="style26" Text="Label"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja49" runat="server" AutoPostBack="True" BackColor="#F9F9F7" BorderStyle="None" onfocus="this.select();" style="text-align:right" Width="90px"></asp:TextBox>
                </td>
                <td class="style6">&nbsp;</td>
            </tr>

            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">&nbsp;50 - Santa Quitéria</td>
                <td bgcolor="#F9F9F7" class="style11" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja50" runat="server" CssClass="style26" Text="Label"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja50" runat="server" AutoPostBack="True" BackColor="#F9F9F7" BorderStyle="None" onfocus="this.select();" style="text-align:right" Width="90px"></asp:TextBox>
                </td>
                <td class="style6">&nbsp;</td>
            </tr>

            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">&nbsp;51 - Joinvile America</td>
                <td bgcolor="#F9F9F7" class="style11" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja51" runat="server" CssClass="style26" Text="Label"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja51" runat="server" AutoPostBack="True" BackColor="#F9F9F7" BorderStyle="None" onfocus="this.select();" style="text-align:right" Width="90px"></asp:TextBox>
                </td>
                <td class="style6">&nbsp;</td>

                <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">&nbsp;52 - Mafra</td>
                <td bgcolor="#F9F9F7" class="style11" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja52" runat="server" CssClass="style26" Text="Label"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja52" runat="server" AutoPostBack="True" BackColor="#F9F9F7" BorderStyle="None" onfocus="this.select();" style="text-align:right" Width="90px"></asp:TextBox>
                </td>
                <td class="style6">&nbsp;</td>
            </tr>

            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">&nbsp;53 - João Bettega</td>
                <td bgcolor="#F9F9F7" class="style11" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja53" runat="server" CssClass="style26" Text="Label"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja53" runat="server" AutoPostBack="True" BackColor="#F9F9F7" BorderStyle="None" onfocus="this.select();" style="text-align:right" Width="90px"></asp:TextBox>
                </td>
                <td class="style6">&nbsp;</td>
            </tr>

            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">&nbsp;54 - Derosso</td>
                <td bgcolor="#F9F9F7" class="style11" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja54" runat="server" CssClass="style26" Text="Label"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja54" runat="server" AutoPostBack="True" BackColor="#F9F9F7" BorderStyle="None" onfocus="this.select();" style="text-align:right" Width="90px"></asp:TextBox>
                </td>
                <td class="style6">&nbsp;</td>
            </tr>

            </tr>
            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">&nbsp;55 - Jaragua</td>
                <td bgcolor="#F9F9F7" class="style11" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja55" runat="server" CssClass="style26" Text="Label"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja55" runat="server" AutoPostBack="True" BackColor="#F9F9F7" BorderStyle="None" onfocus="this.select();" style="text-align:right" Width="90px"></asp:TextBox>
                </td>
                <td class="style6">&nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">&nbsp;56 - Piraquara&nbsp;</td>
                <td bgcolor="#F9F9F7" class="style11" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja56" runat="server" CssClass="style26" Text="Label"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja56" runat="server" AutoPostBack="True" BackColor="#F9F9F7" BorderStyle="None" onfocus="this.select();" style="text-align:right" Width="90px"></asp:TextBox>
                </td>
                <td class="style6">&nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">&nbsp;57 - Joinville Boa Vista&nbsp;</td>
                <td bgcolor="#F9F9F7" class="style11" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja57" runat="server" CssClass="style26" Text="Label"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja57" runat="server" AutoPostBack="True" BackColor="#F9F9F7" BorderStyle="None" onfocus="this.select();" style="text-align:right" Width="90px"></asp:TextBox>
                </td>
                <td class="style6">&nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">&nbsp;58 - Pilarzinho</td>
                <td bgcolor="#F9F9F7" class="style11" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja58" runat="server" CssClass="style26" Text="Label"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja58" runat="server" AutoPostBack="True" BackColor="#F9F9F7" BorderStyle="None" onfocus="this.select();" style="text-align:right" Width="90px"></asp:TextBox>
                </td>
                <td class="style6">&nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">&nbsp; 59 - Express&nbsp;</td>
                <td bgcolor="#F9F9F7" class="style11" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja59" runat="server" CssClass="style26" Text="Label"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja59" runat="server" AutoPostBack="True" BackColor="#F9F9F7" BorderStyle="None" onfocus="this.select();" style="text-align:right" Width="90px"></asp:TextBox>
                </td>
                <td class="style6">&nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">&nbsp; 60 - Maringa Colombo&nbsp;&nbsp;</td>
                <td bgcolor="#F9F9F7" class="style11" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja60" runat="server" CssClass="style26" Text="Label"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja60" runat="server" AutoPostBack="True" BackColor="#F9F9F7" BorderStyle="None" onfocus="this.select();" style="text-align:right" Width="90px"></asp:TextBox>
                </td>
                <td class="style6">&nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
    <table cellspacing="1" class="style4">
        <tr>
            <td class="style27" style="border: 1px solid #999999; padding-right: 4px" 
                bgcolor="Honeydew">
                <b>&nbsp;Total das Lojas =&gt;</b>&nbsp;</td>
            <td align="right" class="style31" 
                style="border: 1px solid #999999; padding-right: 4px" bgcolor="Honeydew">
                <asp:Label ID="lblEmpresa" runat="server" CssClass="style26" 
                    style="font-weight: 700; font-family: Arial, Helvetica, sans-serif; font-size: small;" 
                    Text="Label"></asp:Label>
            </td>
            <td align="right" class="style29" 
                style="border: 1px solid #999999; padding-right: 4px" bgcolor="Honeydew">
                <asp:TextBox ID="txtLojaTotal" runat="server" BackColor="Honeydew" 
                    BorderStyle="None" Font-Bold="True" onfocus="this.select();" 
                    style="text-align:right; font-family: Arial, Helvetica, sans-serif; font-size: small;" 
                    Width="90px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnSalvar" runat="server" Text="Salvar" Width="100px"  />
            </td>
            
        </tr>
    </table>
    <br />
    <br />
                        </dxp:PanelContent>
</PanelCollection>
                    
                    
                </dxrp:ASPxRoundPanel>


    </div>

    <div id="divMeta_Posto">

                        <dxrp:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" BackColor="White" 
                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" Height="450px"   Font-Size="Larger"
                    Width="300px" HeaderText="Cadastro de Meta de Venda - Revista - Postos">
                    
                    
                    <ContentPaddings Padding="2px" />
                    
                    
                    <Border BorderColor="#AECAF0" BorderStyle="Solid" BorderWidth="1px" />
                    
                    <HeaderStyle BackColor="#E0EDFF" HorizontalAlign="Center">
                    <BorderBottom BorderColor="#AECAF0" BorderStyle="Solid" BorderWidth="1px" />
                    </HeaderStyle>
                    
                    
                    <HeaderContent>
                        <BackgroundImage ImageUrl="~/App_Themes/Aqua/Web/rpHeaderBackground.gif" 
                            Repeat="RepeatX" VerticalPosition="Top" />
                    </HeaderContent>
                    
                    
                    <PanelCollection>
<dxp:PanelContent ID="PanelContent2" runat="server">
    <table cellspacing="1" class="style1">
        <tr>
            <td>
                <asp:Panel ID="Panel3" runat="server" BorderColor="#999999" BorderStyle="Solid" 
                    BorderWidth="1px" Width="375px">
                    <table cellpadding="0" class="style4">
                        <tr>
                            <td align="center" bgcolor="#99CCFF" class="style32" 
                                style="border-right-style: solid; border-right-width: 1px; border-right-color: #999999">
                                Filial</td>
                            <td align="center" bgcolor="#99CCFF" class="style28" 
                                style="border-right-style: solid; border-right-width: 1px; border-right-color: #999999">
                                Original</td>
                            <td align="center" bgcolor="#99CCFF" class="style2">
                                Revista</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <asp:Panel ID="Panel4" runat="server" Height="400px" Width="400px" 
        ScrollBars="Vertical">
        <table cellpadding="0" class="style4">
            <tr>
                <td bgcolor="#F9F9F7" class="style8" style="border: 1px solid #C0C0C0">
                    &nbsp;203 - Marechal&nbsp;</td>
                <td align="right" bgcolor="#F9F9F7" class="style10" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja203" runat="server" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small" 
                        Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style13" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja203" runat="server" BackColor="#F9F9F7" 
                        BorderStyle="None" Width="90px" onfocus="this.select();" 
                        style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;204 - Sitio Cercado</td>
                <td class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja204" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja204" runat="server" BorderStyle="None" Width="90px" 
                        onfocus="this.select();" style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;205 - Pinheirinho&nbsp;</td>
                <td class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja205" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja205" runat="server" BorderStyle="None" Width="90px" 
                        onfocus="this.select();" style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;206 - Campo Mourão&nbsp;</td>
                <td class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja206" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja206" runat="server" BorderStyle="None" Width="90px" 
                        onfocus="this.select();" style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;211 - São José&nbsp;</td>
                <td bgcolor="#F9F9F7" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja211" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja211" runat="server" BackColor="#F9F9F7" 
                        BorderStyle="None" Width="90px" onfocus="this.select();" 
                        style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;212 - Tarumã&nbsp;</td>
                <td class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja212" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja212" runat="server" BorderStyle="None" Width="90px" 
                        onfocus="this.select();" style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;213 - Doha&nbsp;</td>
                <td bgcolor="#F9F9F7" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja213" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja213" runat="server" BackColor="#F9F9F7" 
                        BorderStyle="None" Width="90px" onfocus="this.select();" 
                        style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">&nbsp;214 - Atuba&nbsp;</td>
                <td bgcolor="#F9F9F7" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja214" runat="server" CssClass="style26" Text="Label"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja214" runat="server" AutoPostBack="True" 
                        BackColor="#F9F9F7" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="90px"></asp:TextBox>
                </td>
                <td class="style6">&nbsp;</td>
            </tr>
            <tr>
                <td class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;215 - TS - Gás GNV&nbsp;</td>
                <td class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja215" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja215" runat="server" BorderStyle="None" Width="90px" 
                        onfocus="this.select();" style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;216 - Hauer&nbsp;</td>
                <td bgcolor="#F9F9F7" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja216" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja216" runat="server" BackColor="#F9F9F7" 
                        BorderStyle="None" Width="90px" onfocus="this.select();" 
                        style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;217 - Laguna&nbsp;</td>
                <td class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja217" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja217" runat="server" BorderStyle="None" Width="90px" 
                        onfocus="this.select();" style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;218 - Pedrazzoli</td>
                <td bgcolor="#F9F9F7" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja218" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja218" runat="server" BackColor="#F9F9F7" 
                        BorderStyle="None" Width="90px" onfocus="this.select();" 
                        style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="White" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;219 - Via Sul Brasil&nbsp;</td>
                <td bgcolor="White" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja219" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="White" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja219" runat="server" BorderStyle="None" Width="90px" 
                        onfocus="this.select();" style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;220 - SAFF&nbsp;</td>
                <td bgcolor="#F9F9F7" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja220" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja220" runat="server" BackColor="#F9F9F7" 
                        BorderStyle="None" Width="90px" onfocus="this.select();" 
                        style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="White" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;221 - PG&nbsp;</td>
                <td bgcolor="White" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja221" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="White" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja221" runat="server" BorderStyle="None" Width="90px" 
                        onfocus="this.select();" style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#F9F9F7" class="style16" style="border: 1px solid #C0C0C0">
                    &nbsp;222 - Sachi</td>
                <td bgcolor="#F9F9F7" class="style17" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja222" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style18" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja222" runat="server" BackColor="#F9F9F7" 
                        BorderStyle="None" Width="90px" onfocus="this.select();" 
                        style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style19">
                </td>
            </tr>
            <tr>
                <td bgcolor="White" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;223 - Campeiro&nbsp;</td>
                <td bgcolor="White" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja223" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="White" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja223" runat="server" BorderStyle="None" Width="90px" 
                        onfocus="this.select();" style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;224 - Perola&nbsp;</td>
                <td bgcolor="#F9F9F7" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja224" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja224" runat="server" BackColor="#F9F9F7" 
                        BorderStyle="None" Width="90px" onfocus="this.select();" 
                        style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="White" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;225 - Arthur Bernardes&nbsp;</td>
                <td bgcolor="White" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja225" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="White" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja225" runat="server" BorderStyle="None" Width="90px" 
                        onfocus="this.select();" style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;226 - Anita Garibaldi</td>
                <td bgcolor="#F9F9F7" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja226" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja226" runat="server" BackColor="#F9F9F7" 
                        BorderStyle="None" Width="90px" onfocus="this.select();" 
                        style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="White" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;227 - Das Araucárias&nbsp;</td>
                <td bgcolor="White" class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja227" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="White" class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja227" runat="server" BorderStyle="None" Width="90px" 
                        onfocus="this.select();" style="text-align:right" AutoPostBack="True"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#F9F9F7" class="style8" style="border: 1px solid #C0C0C0">
                    &nbsp;228 - Pilarzinho</td>
                <td bgcolor="#F9F9F7" class="style12" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja228" runat="server" Text="0" CssClass="style26"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style15" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja228" runat="server" AutoPostBack="True" BorderStyle="None" onfocus="this.select();" style="text-align:right" Width="90px"></asp:TextBox>
                </td>
                <td class="style7">
                    &nbsp;</td>
            </tr>
            
        </table>
    </asp:Panel>
    <br />
    <table cellspacing="1" class="style4">
        <tr>
            <td class="style27" style="border: 1px solid #999999; padding-right: 4px" 
                bgcolor="Honeydew">
                <b>&nbsp;<span class="auto-style1">Total dos Postos =&gt;</span></b>&nbsp;</td>
            <td align="right" class="style31" 
                style="border: 1px solid #999999; padding-right: 4px" bgcolor="Honeydew">
                <asp:Label ID="lblEmpresaPostos" runat="server" CssClass="style26" 
                    style="font-weight: 700; font-family: Arial, Helvetica, sans-serif; font-size: small;" 
                    Text="Label"></asp:Label>
            </td>
            <td align="right" class="style29" 
                style="border: 1px solid #999999; padding-right: 4px" bgcolor="Honeydew">
                <asp:TextBox ID="txtPostosTotal" runat="server" AutoPostBack="True" BackColor="#F9F9F7" BorderStyle="None" onfocus="this.select();" style="text-align:right" Width="90px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btnSalvar_Postos" runat="server" Text="Salvar" Width="100px"  />
            </td>
            
        </tr>
    </table>
    <br />
                        </dxp:PanelContent>
</PanelCollection>
                    
                    
                </dxrp:ASPxRoundPanel>


    </div>

    <div id="divMeta_Atacarejo">

                        <dxrp:ASPxRoundPanel ID="ASPxRoundPanel3" runat="server" BackColor="White" 
                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" Height="65px"   Font-Size="Larger"
                    Width="300px" HeaderText="Cadastro de Meta de Venda - Revista - Atacarejos">
                    
                    
                    <ContentPaddings Padding="2px" />
                    
                    
                    <Border BorderColor="#AECAF0" BorderStyle="Solid" BorderWidth="1px" />
                    
                    <HeaderStyle BackColor="#E0EDFF" HorizontalAlign="Center">
                    <BorderBottom BorderColor="#AECAF0" BorderStyle="Solid" BorderWidth="1px" />
                    </HeaderStyle>
                    
                    
                    <HeaderContent>
                        <BackgroundImage ImageUrl="~/App_Themes/Aqua/Web/rpHeaderBackground.gif" 
                            Repeat="RepeatX" VerticalPosition="Top" />
                    </HeaderContent>
                    
                    
                    <PanelCollection>
<dxp:PanelContent ID="PanelContent3" runat="server">
    <table cellspacing="1" class="style1">
        <tr>
            <td>
                <asp:Panel ID="Panel5" runat="server" BorderColor="#999999" BorderStyle="Solid" 
                    BorderWidth="1px" Width="375px">
                    <table cellpadding="0" class="style4">
                        <tr>
                            <td align="center" bgcolor="#99CCFF" class="style32" 
                                style="border-right-style: solid; border-right-width: 1px; border-right-color: #999999">
                                Filial</td>
                            <td align="center" bgcolor="#99CCFF" class="style28" 
                                style="border-right-style: solid; border-right-width: 1px; border-right-color: #999999">
                                Original</td>
                            <td align="center" bgcolor="#99CCFF" class="style2">
                                Revista</td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
        </tr>
    </table>
    <asp:Panel ID="Panel6" runat="server" Height="60px" Width="400px" 
        ScrollBars="Vertical">
        <table cellpadding="0" class="style4">
            <tr>
                <td bgcolor="#F9F9F7" class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;603 - JK;</td>
                <td align="right" bgcolor="#F9F9F7" class="style10" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja603" runat="server" CssClass="style26" Text="Label"></asp:Label>
                </td>
                <td bgcolor="#F9F9F7" class="style13" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja603" runat="server" AutoPostBack="True" BackColor="#F9F9F7" BorderStyle="None" onfocus="this.select();" style="text-align:right" Width="90px"></asp:TextBox>
                </td>
                <td class="style5">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style9" style="border: 1px solid #C0C0C0">
                    &nbsp;604 - Colombo;</td>
                <td class="style11" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja604" runat="server" Text="Label" CssClass="style26"></asp:Label>
                </td>
                <td class="style14" 
                    style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja604" runat="server" BorderStyle="None" Width="90px" 
                        onfocus="this.select();" style="text-align:right" AutoPostBack="True" BackColor="#F9F9F7"></asp:TextBox>
                </td>
                <td class="style6">
                    &nbsp;</td>
            </tr>          
            <tr>
                <td class="style9" style="border: 1px solid #C0C0C0">&nbsp;606 - Pinhais</td>
                <td class="style11" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right">
                    <asp:Label ID="lblLoja606" runat="server" CssClass="style26" Text="Label"></asp:Label>
                </td>
                <td class="style14" style="border: 1px solid #C0C0C0; padding-right: 4px; text-align: right;">
                    <asp:TextBox ID="txtLoja606" runat="server" AutoPostBack="True" BackColor="#F9F9F7" BorderStyle="None" onfocus="this.select();" style="text-align:right" Width="90px"></asp:TextBox>
                </td>
                <td class="style6">&nbsp;</td>
            </tr>
        </table>
    </asp:Panel>
    <table cellspacing="1" class="style4">
        <tr>
            <td class="style27" style="border: 1px solid #999999; padding-right: 4px" 
                bgcolor="Honeydew">
                <b>&nbsp;Total Atacarejos =&gt;</b>&nbsp;</td>
            <td align="right" class="style31" 
                style="border: 1px solid #999999; padding-right: 4px" bgcolor="Honeydew">
                <asp:Label ID="lblEmpresaAtacarejos" runat="server" CssClass="style26" 
                    style="font-weight: 700; font-family: Arial, Helvetica, sans-serif; font-size: small;" 
                    Text="Label"></asp:Label>
            </td>
            <td align="right" class="style29" 
                style="border: 1px solid #999999; padding-right: 4px" bgcolor="Honeydew">
                <asp:TextBox ID="txtAtacarejosTotal" runat="server" BackColor="Honeydew" 
                    BorderStyle="None" Font-Bold="True" onfocus="this.select();" 
                    style="text-align:right; font-family: Arial, Helvetica, sans-serif; font-size: small;" 
                    Width="90px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:Button ID="btn_Salvar_Atacarejos" runat="server" Text="Salvar" Width="100px"  />
            </td>
            
        </tr>
    </table>
    <br />
    <br />
                        </dxp:PanelContent>
</PanelCollection>
                    
                    
                </dxrp:ASPxRoundPanel>


    </div>

   
    <table cellspacing="1" class="style4">
        <tr>
            <td align="left" style="padding-left: 4px" valign="top" class="style33">


            </td>
            <td align="left" style="padding-left: 4px" valign="top" class="style34">
                <table cellpadding="0" class="style4">
                    <tr>
                        <td align="center" bgcolor="#0066FF" class="style2" colspan="3" 
                            style="border: 1px solid #99CCFF; padding-right: 2px;">
                            Informações do Apoio</td>
                    </tr>
                    <tr>
                        <td bgcolor="#3399FF" class="style2" 
                            style="border: 1px solid #99CCFF; padding-right: 2px;">
&nbsp;Loja</td>
                        <td align="center" bgcolor="#3399FF" class="style2" 
                            style="border: 1px solid #99CCFF; padding-right: 2px;">
                            Valor</td>
                        <td align="center" bgcolor="#3399FF" class="style2" 
                            style="border: 1px solid #99CCFF; padding-right: 2px;">
                            %</td>
                    </tr>
                    <tr>
                        <td bgcolor="White" style="border: 1px solid #99CCFF; padding-right: 2px;">
&nbsp;Apoio Original</td>
                        <td align="right" bgcolor="White" 
                            style="border: 1px solid #99CCFF; padding-right: 2px;">
                            <asp:Label ID="lblVlrApoioOri" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td align="right" bgcolor="White" 
                            style="border: 1px solid #99CCFF; padding-right: 2px;">
                            <asp:Label ID="lblPercApoioOri" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="White" style="border: 1px solid #99CCFF; padding-right: 2px;">
&nbsp;Apoio Revisto</td>
                        <td align="right" bgcolor="White" 
                            style="border: 1px solid #99CCFF; padding-right: 2px;">
                            <asp:Label ID="lblVlrApoioRev" runat="server" Text="Label"></asp:Label>
                        </td>
                        <td align="right" bgcolor="White" 
                            style="border: 1px solid #99CCFF; padding-right: 2px;">
                            <asp:Label ID="lblPercApoioRev" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td>
                
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
            <td align="left" style="padding-left: 4px" valign="top">
                &nbsp;</td>
            <td align="left" style="padding-left: 4px" valign="top">
                <table cellspacing="1" class="style1">
                    <tr>
                        <td class="style37">
                            <asp:RadioButton ID="rndUltimaLinha" runat="server" AutoPostBack="True" 
                                ForeColor="White" GroupName="modOpt" Text="Ultima Linha" />
                        </td>
                        <td class="style29">
                            <asp:RadioButton ID="rndPart" runat="server" AutoPostBack="True" 
                                ForeColor="White" GroupName="modOpt" Text="Participação" />
                        </td>
                        <td class="style36">
                            <asp:RadioButton ID="rndMargem" runat="server" AutoPostBack="True" 
                                ForeColor="White" GroupName="modOpt" Text="Margem" />
                        </td>
                        <td>
                            <asp:RadioButton ID="rndAgenda23" runat="server" AutoPostBack="True" 
                                ForeColor="White" GroupName="modOpt" Text="Agenda 23" />
                        </td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
                <dxwgv:ASPxGridView ID="GridRF" runat="server" AutoGenerateColumns="False" 
                    CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                    CssPostfix="Office2003_Blue" DataSourceID="dsRF" KeyFieldName="idCod" 
                    Width="400px">
                    <SettingsBehavior AllowFocusedRow="True" />
                    <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                        CssPostfix="Office2003_Blue">
                        <Header ImageSpacing="5px" SortingImageSpacing="5px">
                        </Header>
                        <AlternatingRow BackColor="#EAF4FF">
                        </AlternatingRow>
                        <LoadingPanel ImageSpacing="10px">
                        </LoadingPanel>
                    </Styles>
                    <SettingsLoadingPanel Text="Aguarde. Atualizando...&amp;hellip;" />
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                    <GroupSummary>
                        <dxwgv:ASPxSummaryItem DisplayFormat="Lojas {0:n0}" FieldName="idCod" 
                            SummaryType="Count" />
                    </GroupSummary>
                    <Images ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                        <CollapsedButton Height="12px" 
                            Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                            Width="11px" />
                        <ExpandedButton Height="12px" 
                            Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" Width="11px" />
                        <DetailCollapsedButton Height="12px" 
                            Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                            Width="11px" />
                        <DetailExpandedButton Height="12px" 
                            Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" Width="11px" />
                        <FilterRowButton Height="13px" Width="13px" />
                    </Images>
                    <SettingsText EmptyDataRow="Não nenhuma informação disponivel" 
                        GroupPanel="Arraste uma coluna abaixo para agrupar." />
                    <Columns>
                        <dxwgv:GridViewDataTextColumn FieldName="Descricao" VisibleIndex="0" 
                            Width="150px">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Original" FieldName="percOri" 
                            VisibleIndex="1" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Revista" FieldName="percRev" 
                            VisibleIndex="2" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Status" FieldName="Check" GroupIndex="0" 
                            SortIndex="0" SortOrder="Ascending" VisibleIndex="3" Width="50px">
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <Settings ShowGroupPanel="True" ShowVerticalScrollBar="True" 
                        VerticalScrollableHeight="400" />
                    <StylesEditors>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                </dxwgv:ASPxGridView>
                    <asp:SqlDataSource ID="dsRF" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                        
                        
                    
                    SelectCommand="SELECT a.idCod, a.Ano, a.Mes, a.idFilial, b.Descricao, c.perc AS percOri, a.perc AS percRev, CASE WHEN CAST(c.perc AS FLOAT) &lt;= CAST(a.perc AS FLOAT) THEN 'OK' ELSE '?' END AS [Check] FROM Metas.tblRev AS a INNER JOIN Cadastros.tblCadFiliais  AS b ON a.idFilial = b.Filial LEFT OUTER JOIN gerBI.Metas.tblOri AS c ON a.idCod = c.idCod AND a.Ano = c.Ano AND a.Mes = c.Mes AND a.idFilial = c.idFilial WHERE (a.idCod = 47) AND (a.Ano = @Ano) AND (a.Mes = @Mes) ORDER BY a.idFilial">
                         <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />                              
                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />                               
                            </SelectParameters>

                    </asp:SqlDataSource>
                <dxwgv:ASPxGridView ID="GridMargem" runat="server" AutoGenerateColumns="False" 
                    CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                    CssPostfix="Office2003_Blue" DataSourceID="dsMargem" KeyFieldName="idCod" 
                    Width="400px" Visible="False">
                    <SettingsBehavior AllowFocusedRow="True" />
                    <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                        CssPostfix="Office2003_Blue">
                        <Header ImageSpacing="5px" SortingImageSpacing="5px">
                        </Header>
                        <AlternatingRow BackColor="#EAF4FF">
                        </AlternatingRow>
                        <LoadingPanel ImageSpacing="10px">
                        </LoadingPanel>
                    </Styles>
                    <SettingsLoadingPanel Text="Aguarde. Atualizando...&amp;hellip;" />
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                    <GroupSummary>
                        <dxwgv:ASPxSummaryItem DisplayFormat="Lojas {0:n0}" FieldName="idCod" 
                            SummaryType="Count" />
                    </GroupSummary>
                    <Images ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                        <CollapsedButton Height="12px" 
                            Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                            Width="11px" />
                        <ExpandedButton Height="12px" 
                            Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" Width="11px" />
                        <DetailCollapsedButton Height="12px" 
                            Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                            Width="11px" />
                        <DetailExpandedButton Height="12px" 
                            Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" Width="11px" />
                        <FilterRowButton Height="13px" Width="13px" />
                    </Images>
                    <SettingsText EmptyDataRow="Não nenhuma informação disponivel" 
                        GroupPanel="Arraste uma coluna abaixo para agrupar." />
                    <Columns>
                        <dxwgv:GridViewDataTextColumn FieldName="Descricao" VisibleIndex="0" 
                            Width="150px">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Replan." FieldName="percRev" 
                            VisibleIndex="1" Width="60px" ToolTip="Margem que esta no Replanejamento">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Seção" FieldName="percOri" 
                            VisibleIndex="2" Width="60px" ToolTip="Total da Margem da Seção">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Status" FieldName="Check" GroupIndex="0" 
                            SortIndex="0" SortOrder="Ascending" VisibleIndex="3" Width="50px">
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <Settings ShowGroupPanel="True" ShowVerticalScrollBar="True" 
                        VerticalScrollableHeight="400" />
                    <StylesEditors>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                </dxwgv:ASPxGridView>
                    <asp:SqlDataSource ID="dsMargem" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                        
                        
                    
                    
                    
                    SelectCommand="SELECT a.idCod, a.Ano, a.Mes, a.idFilial, b.Descricao, c.perc AS percOri, a.perc AS percRev, CASE WHEN CAST(c.perc AS FLOAT) = CAST(a.perc AS FLOAT) THEN 'OK' ELSE '?' END AS [Check] FROM Metas.tblRev AS a INNER JOIN Cadastros.tblCadFiliais AS b ON a.idFilial = b.Filial LEFT OUTER JOIN Metas.tblRevSecao AS c ON a.Ano = c.Ano AND a.Mes = c.Mes AND a.idFilial = c.idFilial WHERE (a.idCod = 5) AND (a.Ano = @Ano) AND (a.Mes = @Mes) AND (c.idSecao = 255) AND (c.idTipoSecao = 2) ORDER BY a.idFilial">
                       <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />                              
                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />                               
                            </SelectParameters>
                    </asp:SqlDataSource>
                <dxwgv:ASPxGridView ID="GridAgenda23" runat="server" AutoGenerateColumns="False" 
                    CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                    CssPostfix="Office2003_Blue" DataSourceID="dsAgenda23" KeyFieldName="idCod" 
                    Width="400px" Visible="False">
                    <SettingsBehavior AllowFocusedRow="True" />
                    <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                        CssPostfix="Office2003_Blue">
                        <Header ImageSpacing="5px" SortingImageSpacing="5px">
                        </Header>
                        <AlternatingRow BackColor="#EAF4FF">
                        </AlternatingRow>
                        <LoadingPanel ImageSpacing="10px">
                        </LoadingPanel>
                    </Styles>
                    <SettingsLoadingPanel Text="Aguarde. Atualizando...&amp;hellip;" />
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                    <GroupSummary>
                        <dxwgv:ASPxSummaryItem DisplayFormat="Lojas {0:n0}" FieldName="idCod" 
                            SummaryType="Count" />
                    </GroupSummary>
                    <Images ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                        <CollapsedButton Height="12px" 
                            Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                            Width="11px" />
                        <ExpandedButton Height="12px" 
                            Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" Width="11px" />
                        <DetailCollapsedButton Height="12px" 
                            Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                            Width="11px" />
                        <DetailExpandedButton Height="12px" 
                            Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" Width="11px" />
                        <FilterRowButton Height="13px" Width="13px" />
                    </Images>
                    <SettingsText EmptyDataRow="Não nenhuma informação disponivel" 
                        GroupPanel="Arraste uma coluna abaixo para agrupar." />
                    <Columns>
                        <dxwgv:GridViewDataTextColumn FieldName="Descricao" VisibleIndex="0" 
                            Width="150px">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Replan." FieldName="percRev" 
                            VisibleIndex="1" Width="60px" 
                            ToolTip="Agenda 23 que esta no Replanejamento">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Seção" FieldName="percOri" 
                            VisibleIndex="2" Width="60px" ToolTip="Total da Agenda 23 por Seção">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Status" FieldName="Check" GroupIndex="0" 
                            SortIndex="0" SortOrder="Ascending" VisibleIndex="3" Width="50px">
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <Settings ShowGroupPanel="True" ShowVerticalScrollBar="True" 
                        VerticalScrollableHeight="400" />
                    <StylesEditors>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                </dxwgv:ASPxGridView>
                    <asp:SqlDataSource ID="dsAgenda23" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                        
                        
                    
                    
                    
                    SelectCommand="SELECT a.idCod, a.Ano, a.Mes, a.idFilial, b.Descricao, c.perc AS percOri, a.perc AS percRev, CASE WHEN CAST(c.perc AS FLOAT) = CAST(a.perc AS FLOAT) THEN 'OK' ELSE '?' END AS [Check] FROM Metas.tblRev AS a INNER JOIN Cadastros.tblCadFiliais AS b ON a.idFilial = b.Filial LEFT OUTER JOIN Metas.tblRevSecao AS c ON a.Ano = c.Ano AND a.Mes = c.Mes AND a.idFilial = c.idFilial WHERE (a.idCod = 70) AND (a.Ano = @Ano) AND (a.Mes = @Mes) AND (c.idSecao = 255) AND (c.idTipoSecao = 4) ORDER BY a.idFilial">
                       <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />                              
                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />                               
                            </SelectParameters>
                    </asp:SqlDataSource>
                <dxwgv:ASPxGridView ID="GridPart" runat="server" AutoGenerateColumns="False" 
                    CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                    CssPostfix="Office2003_Blue" DataSourceID="dsPart" KeyFieldName="idCod" 
                    Width="400px" Visible="False">
                    <SettingsBehavior AllowFocusedRow="True" />
                    <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                        CssPostfix="Office2003_Blue">
                        <Header ImageSpacing="5px" SortingImageSpacing="5px">
                        </Header>
                        <AlternatingRow BackColor="#EAF4FF">
                        </AlternatingRow>
                        <LoadingPanel ImageSpacing="10px">
                        </LoadingPanel>
                    </Styles>
                    <SettingsLoadingPanel Text="Aguarde. Atualizando...&amp;hellip;" />
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                    <GroupSummary>
                        <dxwgv:ASPxSummaryItem DisplayFormat="Lojas {0:n0}" FieldName="idCod" 
                            SummaryType="Count" />
                    </GroupSummary>
                    <Images ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                        <CollapsedButton Height="12px" 
                            Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                            Width="11px" />
                        <ExpandedButton Height="12px" 
                            Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" Width="11px" />
                        <DetailCollapsedButton Height="12px" 
                            Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                            Width="11px" />
                        <DetailExpandedButton Height="12px" 
                            Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" Width="11px" />
                        <FilterRowButton Height="13px" Width="13px" />
                    </Images>
                    <SettingsText EmptyDataRow="Não nenhuma informação disponivel" 
                        GroupPanel="Arraste uma coluna abaixo para agrupar." />
                    <Columns>
                        <dxwgv:GridViewDataTextColumn FieldName="Descricao" VisibleIndex="0" 
                            Width="150px">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Replan." FieldName="percRev" 
                            VisibleIndex="1" Width="60px" 
                            ToolTip="Venda Revista que esta no Replanejamento">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Seção" FieldName="percOri" 
                            VisibleIndex="2" Width="60px" ToolTip="Total da Venda por da Seção">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Status" FieldName="Check" GroupIndex="0" 
                            SortIndex="0" SortOrder="Ascending" VisibleIndex="3" Width="50px">
                            <CellStyle HorizontalAlign="Center">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <Settings ShowGroupPanel="True" ShowVerticalScrollBar="True" 
                        VerticalScrollableHeight="400" />
                    <StylesEditors>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                </dxwgv:ASPxGridView>
                    <asp:SqlDataSource ID="dsPart" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                        
                        
                    
                    
                    
                    
                    
                    SelectCommand="SELECT a.idCod, a.Ano, a.Mes, a.idFilial, b.Descricao, c.vlr AS percOri, a.vlr AS percRev, CASE WHEN CAST(c.vlr AS FLOAT) = CAST(a.vlr AS FLOAT) THEN 'OK' ELSE '?' END AS [Check] FROM Metas.tblRev AS a INNER JOIN Cadastros.tblCadFiliais AS b ON a.idFilial = b.Filial LEFT OUTER JOIN Metas.tblRevSecao AS c ON a.Ano = c.Ano AND a.Mes = c.Mes AND a.idFilial = c.idFilial WHERE (a.idCod = 1) AND (a.Ano = @Ano) AND (A.Mes = @Mes) AND (c.idSecao = 255) AND (c.idTipoSecao = 1) ORDER BY a.idFilial">
                        <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />                              
                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />                               
                            </SelectParameters>
                    </asp:SqlDataSource>
                <br />
                <br />
                </td>
            <td align="left" style="padding-left: 4px" valign="top">
                &nbsp;</td>
        </tr>
       
    </table>

    <table cellspacing="1" class="style4">
        <tr>
            <td>
                &nbsp;</td>
            <td class="style38">
&nbsp;
                <asp:Label ID="Label1" runat="server" Visible="False"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <br />
</p>
</asp:Content>

