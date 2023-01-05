<%@ Page Language="VB" MasterPageFile="~/MemberPages/Resultado Financeiro/mpResultadoFinanceiro.master" AutoEventWireup="false" CodeFile="frmResumo.aspx.vb" Inherits="MemberPages_Resultado_Financeiro_frmResumo1" title="Untitled Page" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxpc" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxlp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style2
    {
        width: 94%;
        border-collapse: collapse;
    }
        .style3
        {
            color: #808080;
        }
.dxbButton_Aqua
{	
    color: #2C4D79;   
    font-size: 9pt;
    font-family: Tahoma;				    
	font-weight:normal;    
    vertical-align: middle;	 		
    border: solid 1px #A3C0E8;	
    background: #E2F0FF url('../../App_Themes/Aqua/Editors/edtButtonBack.gif') repeat-x 50% top;
    padding: 1px 1px 1px 1px;
	cursor: pointer;
	cursor: hand;
}
.dxlpLoadingPanel
{
	font: 9pt Tahoma;
	color: #303030;
	background-color: white;
	border: solid 1px #9F9F9F;
}
        .style4
        {
            color: #808080;
            width: 56px;
        }
        .style5
        {
            color: #FFFFFF;
        }
        .style7
        {
            color: #3366FF;
        }
        .style8
        {
            color: #0066FF;
        }
        .style9
        {
            width: 34px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
    <table cellpadding="0" class="style2">
        <tr>
            <td align="left">
                <asp:TextBox ID="lbl_Titulo" runat="server" BorderStyle="None" Font-Bold="True" 
                    ForeColor="#3333FF" ReadOnly="True" Width="135px"></asp:TextBox>
            </td>
            <td align="right" class="style9">
                <dxe:ASPxButton ID="Ano" runat="server" AutoPostBack="False" 
                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" Height="20px" 
                    Text="Filial">
                    <ClientSideEvents Click="function(s, e) {
	mpb.ShowAtPos(10, 75);
}" Init="function(s, e) {
		
}" />
                </dxe:ASPxButton>
            </td>
            <td style="border: 1px solid #999999; text-align: center;" bgcolor="#FF9933" 
                class="style5">
                Janeiro</td>
            <td style="border: 1px solid #999999; text-align: center;" bgcolor="#FF9933" 
                class="style5">
                Fevereiro</td>
            <td style="border: 1px solid #999999; text-align: center;" bgcolor="#FF9933" 
                class="style5">
                Março</td>
            <td style="border: 1px solid #999999; text-align: center;" bgcolor="#FF9933" 
                class="style5">
                Abril</td>
            <td style="border: 1px solid #999999; text-align: center;" bgcolor="#FF9933" 
                class="style5">
                Maio</td>
            <td style="border: 1px solid #999999; text-align: center;" bgcolor="#FF9933" 
                class="style5">
                Junho</td>
            <td style="border: 1px solid #999999; text-align: center;" bgcolor="#FF9933" 
                class="style5">
                Julho</td>
            <td style="border: 1px solid #999999; text-align: center;" bgcolor="#FF9933" 
                class="style5">
                Agosto</td>
            <td style="border: 1px solid #999999; text-align: center;" bgcolor="#FF9933" 
                class="style5">
                Setembro</td>
            <td style="border: 1px solid #999999; text-align: center;" bgcolor="#FF9933" 
                class="style5">
                Outubro</td>
            <td style="border: 1px solid #999999; text-align: center;" bgcolor="#FF9933" 
                class="style5">
                Novembro</td>
            <td style="border: 1px solid #999999; text-align: center;" bgcolor="#FF9933" 
                class="style5">
                Dezembro</td>
            <td style="border: 1px solid #999999; text-align: center;" bgcolor="#FF9933" 
                class="style5">
                <asp:Label ID="lbl_TituloAno" runat="server" style="font-weight: 700" 
                    Text="Label"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td bgcolor="#DDDDDD" colspan="2" style="border: 1px solid #999999">
                &nbsp;Saldo Anterior&nbsp;</td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; background-color: #DDDDDD; text-align: right; padding-right: 2px;">
                    <asp:Label ID="LSI_1" runat="server" Text="Label" style="font-size: medium"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; background-color: #DDDDDD; text-align: right; padding-right: 2px;">
                    <asp:Label ID="LSI_2" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; background-color: #DDDDDD; text-align: right; padding-right: 2px;">
                    <asp:Label ID="LSI_3" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; background-color: #DDDDDD; text-align: right; padding-right: 2px;">
                    <asp:Label ID="LSI_4" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; background-color: #DDDDDD; text-align: right; padding-right: 2px;">
                    <asp:Label ID="LSI_5" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; background-color: #DDDDDD; text-align: right; padding-right: 2px;">
                    <asp:Label ID="LSI_6" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; background-color: #DDDDDD; text-align: right; padding-right: 2px;">
                    <asp:Label ID="LSI_7" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; background-color: #DDDDDD; text-align: right; padding-right: 2px;">
                    <asp:Label ID="LSI_8" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; background-color: #DDDDDD; text-align: right; padding-right: 2px;">
                    <asp:Label ID="LSI_9" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; background-color: #DDDDDD; text-align: right; padding-right: 2px;">
                    <asp:Label ID="LSI_10" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; background-color: #DDDDDD; text-align: right; padding-right: 2px;">
                    <asp:Label ID="LSI_11" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; background-color: #DDDDDD; text-align: right; padding-right: 2px;">
                    <asp:Label ID="LSI_12" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; background-color: #DDDDDD; text-align: right; padding-right: 2px;">
                    <asp:Label ID="LSI_Total" runat="server" Text="Label" 
                    style="font-weight: 700"></asp:Label>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="border: 1px solid #999999">
                &nbsp;<span class="style7">01</span>-Depósitos&nbsp;</td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L01_1" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L01_2" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L01_3" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L01_4" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L01_5" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L01_6" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L01_7" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L01_8" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L01_9" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L01_10" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L01_11" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L01_12" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L01_Total" runat="server" Text="Label" 
                    style="font-weight: 700"></asp:Label>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td bgcolor="#F2F2F2" colspan="2" style="border: 1px solid #999999">
                &nbsp;<span class="style7">02</span>-Créd. Pré-Datados&nbsp;</td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L02_1" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L02_2" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L02_3" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L02_4" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L02_5" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L02_6" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L02_7" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L02_8" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L02_9" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L02_10" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L02_11" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L02_12" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L02_Total" runat="server" Text="Label" 
                    style="font-weight: 700"></asp:Label>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="border: 1px solid #999999">
                &nbsp;<span class="style7">03</span>-Créd. ticket&#39;s / Cartões&nbsp;</td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L03_1" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L03_2" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L03_3" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L03_4" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L03_5" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L03_6" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L03_7" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L03_8" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L03_9" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L03_10" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L03_11" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L03_12" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L03_Total" runat="server" Text="Label" 
                    style="font-weight: 700"></asp:Label>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td bgcolor="#F2F2F2" colspan="2" style="border: 1px solid #999999">
                &nbsp;<span class="style7">04</span>-ATN&#39;s Remetidos&nbsp;</td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L04_1" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L04_2" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L04_3" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L04_4" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L04_5" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L04_6" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L04_7" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L04_8" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L04_9" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L04_10" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L04_11" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L04_12" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L04_Total" runat="server" Text="Label" 
                    style="font-weight: 700"></asp:Label>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="border: 1px solid #999999">
                &nbsp;<span class="style8">05</span>-Transf. Merc. Saídas&nbsp;</td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L05_1" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L05_2" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L05_3" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L05_4" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L05_5" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L05_6" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L05_7" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L05_8" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L05_9" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L05_10" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L05_11" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L05_12" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L05_Total" runat="server" Text="Label" 
                    style="font-weight: 700"></asp:Label>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td bgcolor="#F2F2F2" colspan="2" style="border: 1px solid #999999">
                &nbsp;<span class="style7">06</span>-Créd. Cont. a Receber&nbsp;</td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L06_1" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L06_2" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L06_3" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L06_4" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L06_5" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L06_6" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L06_7" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L06_8" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L06_9" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L06_10" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L06_11" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L06_12" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L06_Total" runat="server" Text="Label" 
                    style="font-weight: 700"></asp:Label>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="border: 1px solid #999999">
                &nbsp;<span class="style7">07</span>-Créditos Caixa Matriz&nbsp;</td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L07_1" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L07_2" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L07_3" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L07_4" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L07_5" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L07_6" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L07_7" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L07_8" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L07_9" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L07_10" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L07_11" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L07_12" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L07_Total" runat="server" Text="Label" 
                    style="font-weight: 700"></asp:Label>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td bgcolor="#F2F2F2" colspan="2" style="border: 1px solid #999999">
                &nbsp;<span class="style8">08</span>-Outros Créditos&nbsp;</td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L08_1" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L08_2" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L08_3" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L08_4" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L08_5" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L08_6" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L08_7" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L08_8" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L08_9" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L08_10" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L08_11" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L08_12" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L08_Total" runat="server" Text="Label" 
                    style="font-weight: 700"></asp:Label>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" colspan="2">
                <b>Total de Entradas&nbsp; </b></td>
            <td style="border-style: solid; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LTE_1" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LTE_2" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LTE_3" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LTE_4" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LTE_5" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LTE_6" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LTE_7" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LTE_8" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LTE_9" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LTE_10" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LTE_11" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LTE_12" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LTE_Total" runat="server" Text="Label" 
                    style="font-weight: 700"></asp:Label>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="border: 1px solid #999999">
                &nbsp;<span class="style8">09</span>-Débitos Cont. à Pagar&nbsp;</td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L09_1" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L09_2" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L09_3" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L09_4" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L09_5" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L09_6" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L09_7" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L09_8" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L09_9" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L09_10" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L09_11" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L09_12" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L09_Total" runat="server" Text="Label" 
                    style="font-weight: 700"></asp:Label>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td bgcolor="#F2F2F2" colspan="2" style="border: 1px solid #999999">
                &nbsp;<span class="style8">10</span>-Débitos do C/C Caixa&nbsp;</td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L10_1" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L10_2" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L10_3" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L10_4" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L10_5" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L10_6" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L10_7" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L10_8" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L10_9" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L10_10" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L10_11" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L10_12" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L10_Total" runat="server" Text="Label" 
                    style="font-weight: 700"></asp:Label>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="border: 1px solid #999999">
                &nbsp;<span class="style7">11</span>-Débitos do C/C Matriz&nbsp;</td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L11_1" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L11_2" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L11_3" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L11_4" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L11_5" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L11_6" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L11_7" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L11_8" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L11_9" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L11_10" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L11_11" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L11_12" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L11_Total" runat="server" Text="Label" 
                    style="font-weight: 700"></asp:Label>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td bgcolor="#F2F2F2" colspan="2" style="border: 1px solid #999999">
                &nbsp;<span class="style8">12</span>-Transf. Merc. Entrada&nbsp;</td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L12_1" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L12_2" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L12_3" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L12_4" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L12_5" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L12_6" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L12_7" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L12_8" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L12_9" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L12_10" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L12_11" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L12_12" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L12_Total" runat="server" Text="Label" 
                    style="font-weight: 700"></asp:Label>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="border: 1px solid #999999">
                &nbsp;<span class="style8">13</span>-ATN&#39;s Recebidos&nbsp;</td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L13_1" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L13_2" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L13_3" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L13_4" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L13_5" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L13_6" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L13_7" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L13_8" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L13_9" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L13_10" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L13_11" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L13_12" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L13_Total" runat="server" Text="Label" 
                    style="font-weight: 700"></asp:Label>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td bgcolor="#F2F2F2" colspan="2" style="border: 1px solid #999999">
                &nbsp;<span class="style8">14</span>-Rateio Corporação&nbsp;</td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L14_1" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L14_2" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L14_3" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L14_4" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L14_5" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L14_6" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L14_7" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L14_8" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L14_9" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L14_10" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L14_11" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L14_12" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L14_Total" runat="server" Text="Label" 
                    style="font-weight: 700"></asp:Label>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="border: 1px solid #999999">
                &nbsp;<span class="style8">15</span>-Aluguél&nbsp;</td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L15_1" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L15_2" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L15_3" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L15_4" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L15_5" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L15_6" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L15_7" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L15_8" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L15_9" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L15_10" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L15_11" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L15_12" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L15_Total" runat="server" Text="Label" 
                    style="font-weight: 700"></asp:Label>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td bgcolor="#F2F2F2" colspan="2" style="border: 1px solid #999999">
                &nbsp;<span class="style8">16</span>-ICMS / PIS / COFIS&nbsp;</td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L16_1" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L16_2" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L16_3" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L16_4" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L16_5" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L16_6" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L16_7" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L16_8" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L16_9" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L16_10" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L16_11" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L16_12" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L16_Total" runat="server" Text="Label" 
                    style="font-weight: 700"></asp:Label>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="border: 1px solid #999999">
                &nbsp;<dxe:ASPxLabel ID="ASPxLabel2" runat="server" 
                    Font-Names="Times New Roman" Font-Size="Medium" ForeColor="#3399FF" Text="17" 
                    ToolTip="Composição: (+) Propaganda (-) Verbas Promocionais (+) Transportes de Valores. Essas informações vem da Despesa">
                </dxe:ASPxLabel>
                -Despesas Rateadas&nbsp;</td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L17_1" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L17_2" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L17_3" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L17_4" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L17_5" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L17_6" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L17_7" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L17_8" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L17_9" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L17_10" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L17_11" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L17_12" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L17_Total" runat="server" Text="Label" 
                    style="font-weight: 700"></asp:Label>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td bgcolor="#F2F2F2" colspan="2" style="border: 1px solid #999999">
                &nbsp;<span class="style8">18</span>-Serviços Públicos&nbsp;</td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L18_1" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L18_2" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L18_3" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L18_4" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L18_5" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L18_6" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L18_7" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L18_8" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L18_9" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L18_10" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L18_11" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L18_12" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L18_Total" runat="server" Text="Label" 
                    style="font-weight: 700"></asp:Label>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="border: 1px solid #999999">
                &nbsp;<span class="style8">19</span>-<dxe:ASPxLabel ID="ASPxLabel1" 
                    runat="server" Text="Outros" 
                    ToolTip="Composição: 91-Compras (CMV) pago pela Tesouraria.">
                </dxe:ASPxLabel>
                &nbsp;</td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L19_1" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L19_2" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L19_3" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L19_4" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L19_5" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L19_6" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L19_7" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L19_8" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L19_9" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L19_10" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L19_11" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L19_12" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="L19_Total" runat="server" Text="Label" 
                    style="font-weight: 700"></asp:Label>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td bgcolor="#F2F2F2" colspan="2" style="border: 1px solid #999999">
                &nbsp;<span class="style8">20</span>-Importação&nbsp;</td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L20_1" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L20_2" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L20_3" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L20_4" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L20_5" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L20_6" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L20_7" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L20_8" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L20_9" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L20_10" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L20_11" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L20_12" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="L20_Total" runat="server" Text="Label" 
                    style="font-weight: 700"></asp:Label>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" colspan="2">
                <b>Total de Saídas&nbsp; </b></td>
            <td style="border-style: solid; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LTS_1" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LTS_2" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LTS_3" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LTS_4" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LTS_5" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LTS_6" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LTS_7" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LTS_8" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LTS_9" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LTS_10" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LTS_11" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LTS_12" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LTS_Total" runat="server" Text="Label" 
                    style="font-weight: 700"></asp:Label>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td bgcolor="#F2F2F2" colspan="2" style="border: 1px solid #999999">
                &nbsp;Saldo do Dia&nbsp;</td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="LSD_1" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="LSD_2" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="LSD_3" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="LSD_4" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="LSD_5" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="LSD_6" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="LSD_7" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="LSD_8" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="LSD_9" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="LSD_10" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="LSD_11" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="LSD_12" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="LSD_Total" runat="server" Text="Label" 
                    style="font-weight: 700"></asp:Label>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2" style="border: 1px solid #999999">
                &nbsp;Taxa do Mês&nbsp;</td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="LTM_1" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="LTM_2" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="LTM_3" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="LTM_4" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="LTM_5" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="LTM_6" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="LTM_7" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="LTM_8" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="LTM_9" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="LTM_10" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="LTM_11" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="LTM_12" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px;">
                    <asp:Label ID="LTM_Total" runat="server" Text="Label" 
                    style="font-weight: 700"></asp:Label>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td bgcolor="#F2F2F2" colspan="2" style="border: 1px solid #999999">
                &nbsp;Rec. Desp. Financeira&nbsp;</td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="LRDF_1" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="LRDF_2" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="LRDF_3" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="LRDF_4" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="LRDF_5" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="LRDF_6" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="LRDF_7" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="LRDF_8" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="LRDF_9" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="LRDF_10" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="LRDF_11" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="LRDF_12" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #F2F2F2;">
                    <asp:Label ID="LRDF_Total" runat="server" Text="Label" 
                    style="font-weight: 700"></asp:Label>
                </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" colspan="2">
                <b>&nbsp;Saldo Financeiro</b>&nbsp; </td>
            <td style="border-style: solid; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LSF_1" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LSF_2" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LSF_3" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LSF_4" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LSF_5" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LSF_6" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LSF_7" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LSF_8" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LSF_9" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LSF_10" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LSF_11" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LSF_12" runat="server" Text="Label"></asp:Label>
                </td>
            <td style="border-style: solid; border-width: 1px; border-color: #999999; text-align: right; padding-right: 2px; background-color: #E8FFE8;">
                    <asp:Label ID="LSF_Total" runat="server" Text="Label" 
                    style="font-weight: 700"></asp:Label>
                </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</p>
    <p>
        <dxpc:ASPxPopupControl ID="caixaPeriodo" runat="server" AppearAfter="150" 
            ClientInstanceName="mpb" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" 
            CssPostfix="Aqua" HeaderText="Selecione o Ano e a Filial." Height="139px" 
            ImageFolder="~/App_Themes/Aqua/{0}/" Modal="True" ShowCloseButton="False" 
            Width="403px" CloseAction="CloseButton">
            <ContentStyle VerticalAlign="Top">
            </ContentStyle>
            <SizeGripImage Height="12px" Width="12px" />
            <ClientSideEvents Closing="function(s, e) {
	lp.Show();
}" />
            <ContentCollection>
<dxpc:PopupControlContentControl runat="server">
    <table cellpadding="0" class="style2">
        <tr>
            <td align="right" class="style3">
                <b>Ano:&nbsp;&nbsp; </b>
            </td>
            <td>
                <dxe:ASPxComboBox ID="cbo_Ano" runat="server" Height="16px" 
                    ValueType="System.String" Width="60px">
                    <Items>
                        <dxe:ListEditItem Text="2010" Value="2010" />
                        <dxe:ListEditItem Text="2011" Value="2011" />
                        <dxe:ListEditItem Text="2012" Value="2012" />
                        <dxe:ListEditItem Text="2013" Value="2013" />
                        <dxe:ListEditItem Text="2014" Value="2014" />
                    </Items>
                </dxe:ASPxComboBox>
            </td>
            <td align="right" class="style4">
                <b>Filial:&nbsp; </b>
            </td>
            <td>
                <dxe:ASPxComboBox ID="cbo_Filial" runat="server" TextField="Desc" 
                    ValueField="Filial" ValueType="System.Int32">
                </dxe:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td align="right" class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td align="right" class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td align="center">
                <dxe:ASPxButton ID="ASPxButton2" runat="server" 
                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                    Text="Atualizar">
                    <ClientSideEvents Click="function(s, e) {
	mpb.Hide();
	lp.Show();
}" />
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
                </dxpc:PopupControlContentControl>
</ContentCollection>
            <CloseButtonImage Height="16px" Width="17px" />
        </dxpc:ASPxPopupControl>
</p>
</asp:Content>

