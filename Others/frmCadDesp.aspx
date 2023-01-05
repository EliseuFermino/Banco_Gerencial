<%@ Page Title="Cadastro de Metas de Despesa" Language="VB" AutoEventWireup="false" CodeFile="frmCadDesp.aspx.vb" Inherits="MemberPages_Planejamento_frmCadDesp" MasterPageFile="~/MemberPages/Site.master" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<%@ Register src="../../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc4" %>
<%@ Register src="../../../Controles/wuciListaLojasComApoio.ascx" tagname="wuciListaLojasComApoio" tagprefix="uc5" %>

<%@ Register src="../../../Controles/wucListaPosicao.ascx" tagname="wucListaPosicao" tagprefix="uc6" %>

<%@ Register src="../../../Controles/wucBotaoAtualizar.ascx" tagname="wucBotaoAtualizar" tagprefix="uc1" %>

<%@ Register Src="~/Controles/wucListaLojas.ascx" TagPrefix="uc1" TagName="wucListaLojas" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">


        #moldura {
            width:1024px; 
            margin: 0 7px ;                      
        }

        .style1
        {
            width: 1000px;
        }
        .style2
        {
            width: 91px;
        }
        .style3
        {
            width: 53px;
            background-color:#0094ff;            
        }
        .style4
        {
            width: 87px;
        }
        .style6
        {
            width: 84px;
        }
        .style7
        {
            width: 51px;
        }
        .style8
        {
            width: 50px;
        }
        .style9
        {
            width: 81px;
        }
        .style10
        {
            width: 1px;
        }
        .style12
        {
            width: 44px;
        }
        .style13
        {
            color: #FFFFFF;
        }
        .style14
        {
            width: 53px;
            color: #FFFFFF;
        }
        .style15
        {
            width: 50px;
            color: #FFFFFF;
        }
        .style16
        {
            width: 51px;
            color: #FFFFFF;
        }
        .style17
        {
            width: 81px;
            color: #FFFFFF;
        }
        .style18
        {
            width: 44px;
            color: #FFFFFF;
        }
        .style20
        {
            width: 571px;
            height: 44px;
        }
        .style22
        {
            color: #0000FF;
            font-weight: bold;
        }
        .style23
        {
            color: #006600;
        }
        .style24
        {
            width: 51px;
            color: #006600;
        }
        .style25
        {
            width: 217px;
        }
        .style32
        {
            width: 89px;
            color: #FFFFFF;
        }
        .style33
        {
            width: 89px;
        }
        .style41
        {
            width: 100%;
            border-left: 1px solid #808080;
            border-right-style: solid;
            border-right-width: 1px;
            border-top: 1px solid #808080;
            border-bottom-style: solid;
            border-bottom-width: 1px;
            background-color: #FFFFCC;
        }
        .style42
        {
            font-size: small;
        }
        .style43
        {
            color: #FF0000;
        }
        .style44
        {
            font-size: small;
            font-weight: bold;
        }
        .style46
        {
            color: #FFFFFF;
            font-weight: bold;
            font-size: large;
        }
        .style47
        {
            font-size: small;
            font-family: Arial;
            color: #000000;
        }
        .style48
        {
            color: #000000;
        }
        .style49
        {
            width: 543px;
        }
        .style52
        {
            width: 78px;
        }
        .style54
        {
            width: 85px;
        }
        .style55
        {
            width: 217px;
            height: 37px;
        }
        .style56
        {
        }
    .style57
    {
        width: 100%;
    }
    .style58
    {
        color: #FFFFFF;
        font-weight: bold;
    }
        .style59
        {
            width: 220px;
        }
        .style62
        {
            height: 31px;
        }
        .style63
        {
            height: 41px;
        }
        .style64
        {
            height: 36px;
        }
        .style65
        {
            height: 28px;
        }
        .auto-style3 {
            width: 780px;
        }
        .auto-style5 {
            width: 65px;
            float: left;
        }
        .auto-style6 {
            width: 30px;
        }
        .auto-style7 {
            width: 52px;
        }
        .auto-style8 {
            width: 484px;
        }
        .auto-style9 {
            width: 148px;
        }
        .auto-style11 {
            width: 154px;
        }
        .auto-style12 {
            width: 163px;
        }
        .auto-style13 {
            width: 119px;
            color: #FFFFFF;
        }
        .auto-style14 {
            width: 119px;
        }
        .auto-style17 {
            width: 108px;
            color: #FFFFFF;
        }
        .auto-style18 {
            width: 115px;
            color: #FFFFFF;
        }
        .auto-style19 {
            width: 115px;
        }
        .auto-style20 {
            width: 180px;
            color: #FFFFFF;
        }
        .auto-style21 {
            width: 180px;
        }
        .auto-style22 {
            width: 151px;
        }
        .auto-style23 {
            width: 65px;
            color: #FFFFFF;
        }
        .auto-style24 {
            width: 107px;
            color: #FFFFFF;
        }
        .auto-style25 {
            width: 107px;
        }
        .auto-style26 {
            width: 108px;
        }
        .auto-style27 {
            width: 220px;
            height: 29px;
        }
        .auto-style28 {
            height: 29px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
 
    <div id="moldura">
    
    <div>
    
        <table class="style1">
            <tr>
                <td class="auto-style7">
                    <uc4:wucAno ID="cboAno" runat="server" />
                </td>
                <td class="auto-style6">
                    <uc1:wucListaLojas runat="server" ID="cboFilial" />
                </td>
                <td class="auto-style8">
                    &nbsp;&nbsp;<span class="style58">Grupo:</span>
                    <asp:DropDownList ID="cboGrupo" runat="server" AutoPostBack="True" 
                        BackColor="White" DataTextField="CatLinhaDesc" 
                        DataValueField="CatLinhaCod" Width="200px">
                    </asp:DropDownList>
&nbsp;&nbsp;<span class="style58">Sub:</span>
                    <asp:DropDownList ID="cboSubgrupo" runat="server" AutoPostBack="True" 
                        BackColor="White" DataSourceID="dsListaSubgrupo" 
                        DataTextField="CatLinhaDescDet" DataValueField="CatLinhaCodDet" 
                        Width="200px">
                    </asp:DropDownList>
                </td>
            </tr>
            </table>
    
    </div>
    <table cellpadding="0" cellspacing="0" class="style1">
        <tr>
            <td class="style2" style="border: 1px solid #808080" bgcolor="#6B696B">
                &nbsp;<span class="style13">Período</span>&nbsp;</td>
            <td class="auto-style9" 
                
                style="border-style: solid solid solid none; border-width: 1px; border-color: #808080" 
                align="center" bgcolor="#6B696B">
                <asp:Label ID="lbl_TituloAno4" runat="server" style="color: #FFFFFF" 
                    Text="Label"></asp:Label>
            </td>
            <td class="auto-style13" 
                
                style="border-style: solid solid solid none; border-width: 1px; border-color: #808080" 
                align="center" bgcolor="#6B696B">
                %</td>
            <td class="auto-style22" 
                
                style="border-style: solid solid solid none; border-width: 1px; border-color: #808080" 
                align="center" bgcolor="#6B696B">
                <asp:Label ID="lbl_TituloAno3" runat="server" style="color: #FFFFFF" 
                    Text="Label"></asp:Label>
            </td>
            <td class="auto-style24" 
                
                style="border-style: solid solid solid none; border-width: 1px; border-color: #808080" 
                align="center" bgcolor="#6B696B">
                %</td>
            <td class="auto-style11" 
                
                style="border-style: solid solid solid none; border-width: 1px; border-color: #808080" 
                align="center" bgcolor="#6B696B">
                <asp:Label ID="lbl_TituloAno2" runat="server" style="color: #FFFFFF" 
                    Text="Label"></asp:Label>
            </td>
            <td class="auto-style17" 
                
                style="border-style: solid solid solid none; border-width: 1px; border-color: #808080" 
                align="center" bgcolor="#6B696B">
                %</td>
            <td class="auto-style12" 
                
                style="border-style: solid solid solid none; border-width: 1px; border-color: #808080" 
                align="center" bgcolor="#6B696B">
                <asp:Label ID="lbl_TituloAno1" runat="server" style="color: #FFFFFF" 
                    Text="Label"></asp:Label>
            </td>
            <td class="auto-style18" 
                
                style="border-style: solid solid solid none; border-width: 1px; border-color: #808080" 
                align="center" bgcolor="#6B696B">
                %</td>
            <td class="style10">
                &nbsp;</td>
            <td class="auto-style20" 
                style="border-style: solid; border-width: 1px; border-color: #808080" 
                align="center" bgcolor="#006600">
                Venda</td>
            <td class="style10">
                &nbsp;</td>
            <td style="border-style: solid; border-width: 1px; border-color: #808080" 
                align="center" bgcolor="#006600" class="style17">
                Meta</td>
            <td style="border-style: solid solid solid none; border-width: 1px; border-color: #808080" 
                align="center" bgcolor="#006600" class="auto-style23">
                %</td>
            <td class="auto-style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; background-color: #FFFFFF;">
                &nbsp;<span class="style47">Janeiro</span>&nbsp;</td>
            <td align="right" class="auto-style9" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_vlrHist4_1" runat="server" Font-Names="Arial" 
                    style="font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style14" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_percHist4_1" runat="server" 
                    style="font-size: small; font-family: Arial" Text="Label" 
                    ForeColor="Black"></asp:Label>
            </td>
            <td align="right" class="auto-style22" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_vlrHist3_1" runat="server" Font-Names="Arial" 
                    style="font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style25" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_percHist3_1" runat="server" 
                    style="font-size: small; font-family: Arial" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style11" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_vlrHist2_1" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style26" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_percHist2_1" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style12" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_vlrHist1_1" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style19" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_percHist1_1" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td class="style10">
                &nbsp;</td>
            <td align="right" class="auto-style21" 
                
                
                
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="txt_vlrVenda_01" runat="server" 
                    style="font-family: Arial; font-size: small; color: #006600" Text="Label"></asp:Label>
            </td>
            <td align="right" class="style10">
                &nbsp;</td>
            <td align="right" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px;" 
                class="style9" bgcolor="White">
                <dxe:ASPxTextBox ID="txt_vlrMeta01" runat="server" AutoPostBack="True" ClientInstanceName="txt_vlrMeta02" HorizontalAlign="Right" Width="75px">
                    <ClientSideEvents ValueChanged="function(s, e) {
	txt_vlrMeta02.Focus();
}" />
                    <Border BorderStyle="None" />
                </dxe:ASPxTextBox>
            </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;" 
                align="right" class="auto-style5">
                <dxe:ASPxTextBox ID="txt_percMeta01" runat="server" AutoPostBack="True" ClientInstanceName="txt_vlrMeta02" DisplayFormatString="{0:n2}" HorizontalAlign="Right" Width="50px">
                    <Border BorderStyle="None" />
                </dxe:ASPxTextBox>
            </td>
            <td class="auto-style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td bgcolor="#DFEEFF" class="style2" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080">
                &nbsp;<span class="style47">Fevereiro&nbsp;</span></td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style9" 
                
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_vlrHist4_2" runat="server" 
                    style="font-size: small; font-family: Arial" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style14" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_percHist4_2" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label" 
                    ForeColor="Black"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style22" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_vlrHist3_2" runat="server" Font-Names="Arial" 
                    style="font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style25" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_percHist3_2" runat="server" 
                    style="font-size: small; font-family: Arial" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style11" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_vlrHist2_2" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style26" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_percHist2_2" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style12" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_vlrHist1_2" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style19" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_percHist1_2" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td class="style10">
                &nbsp;</td>
            <td align="right" bgcolor="#CCFFCC" class="auto-style21" 
                
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="txt_vlrVenda_02" runat="server" 
                    style="font-size: small; font-family: Arial; color: #006600" Text="Label"></asp:Label>
            </td>
            <td class="style10">
                &nbsp;</td>
            <td align="right" bgcolor="#CCFFCC" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px;" 
                class="style9">
                <dxe:ASPxTextBox ID="txt_vlrMeta02" runat="server" AutoPostBack="True" BackColor="#CCFFCC" ClientInstanceName="txt_vlrMeta02" HorizontalAlign="Right" Width="75px">
                    <Border BorderStyle="None" />
                </dxe:ASPxTextBox>
            </td>
            <td bgcolor="#CCFFCC" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;" 
                align="right" class="auto-style5">
                <dxe:ASPxTextBox ID="txt_percMeta02" runat="server" AutoPostBack="True" BackColor="#CCFFCC" ClientInstanceName="txt_vlrMeta02" DisplayFormatString="{0:n2}" HorizontalAlign="Right" Width="50px">
                    <Border BorderStyle="None" />
                </dxe:ASPxTextBox>
            </td>
            <td class="auto-style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; background-color: #FFFFFF;">
                &nbsp;<span class="style47">Março&nbsp;</span></td>
            <td align="right" class="auto-style9" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_vlrHist4_3" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style14" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_percHist4_3" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label" 
                    ForeColor="Black"></asp:Label>
            </td>
            <td align="right" class="auto-style22" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_vlrHist3_3" runat="server" Font-Names="Arial" 
                    style="font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style25" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_percHist3_3" runat="server" 
                    style="font-size: small; font-family: Arial" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style11" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_vlrHist2_3" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style26" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_percHist2_3" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style12" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_vlrHist1_3" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style19" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_percHist1_3" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td class="style10">
                &nbsp;</td>
            <td align="right" class="auto-style21" 
                
                
                
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="txt_vlrVenda_03" runat="server" 
                    style="font-family: Arial; font-size: small; color: #006600" Text="Label"></asp:Label>
            </td>
            <td class="style10">
                &nbsp;</td>
            <td align="right" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;" 
                class="style9">
                <dxe:ASPxTextBox ID="txt_vlrMeta03" runat="server" AutoPostBack="True" ClientInstanceName="txt_vlrMeta02" HorizontalAlign="Right" Width="75px">
                    <ClientSideEvents ValueChanged="function(s, e) {
	txt_vlrMeta02.Focus();
}" />
                    <Border BorderStyle="None" />
                </dxe:ASPxTextBox>
            </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;" 
                align="right" class="auto-style5">
                <dxe:ASPxTextBox ID="txt_percMeta03" runat="server" AutoPostBack="True" ClientInstanceName="txt_vlrMeta02" DisplayFormatString="{0:n2}" HorizontalAlign="Right" Width="50px">
                    <Border BorderStyle="None" />
                </dxe:ASPxTextBox>
            </td>
            <td class="auto-style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td bgcolor="#DFEEFF" class="style2" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080">
                &nbsp;<span class="style48">Abril&nbsp;</span></td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style9" 
                
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_vlrHist4_4" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style14" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_percHist4_4" runat="server" 
                    style="font-size: small; font-family: Arial" Text="Label" 
                    ForeColor="Black"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style22" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_vlrHist3_4" runat="server" Font-Names="Arial" 
                    style="font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style25" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_percHist3_4" runat="server" 
                    style="font-size: small; font-family: Arial" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style11" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_vlrHist2_4" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style26" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_percHist2_4" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style12" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_vlrHist1_4" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style19" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_percHist1_4" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td class="style10">
                &nbsp;</td>
            <td align="right" bgcolor="#CCFFCC" class="auto-style21" 
                
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="txt_vlrVenda_04" runat="server" 
                    style="font-size: small; font-family: Arial; color: #006600" Text="Label"></asp:Label>
            </td>
            <td class="style10">
                &nbsp;</td>
            <td align="right" bgcolor="#CCFFCC" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px;" 
                class="style9">
                <dxe:ASPxTextBox ID="txt_vlrMeta04" runat="server" AutoPostBack="True" BackColor="#CCFFCC" ClientInstanceName="txt_vlrMeta02" HorizontalAlign="Right" Width="75px">
                    <Border BorderStyle="None" />
                </dxe:ASPxTextBox>
            </td>
            <td bgcolor="#CCFFCC" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;" 
                align="right" class="auto-style5">
                <dxe:ASPxTextBox ID="txt_percMeta04" runat="server" AutoPostBack="True" BackColor="#CCFFCC" ClientInstanceName="txt_vlrMeta02" DisplayFormatString="{0:n2}" HorizontalAlign="Right" Width="50px">
                    <Border BorderStyle="None" />
                </dxe:ASPxTextBox>
            </td>
            <td class="auto-style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; background-color: #FFFFFF;">
                &nbsp;<span class="style47">Maio&nbsp;</span></td>
            <td align="right" class="auto-style9" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_vlrHist4_5" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style14" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_percHist4_5" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label" 
                    ForeColor="Black"></asp:Label>
            </td>
            <td align="right" class="auto-style22" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_vlrHist3_5" runat="server" Font-Names="Arial" 
                    style="font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style25" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_percHist3_5" runat="server" 
                    style="font-size: small; font-family: Arial" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style11" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_vlrHist2_5" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style26" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_percHist2_5" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style12" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_vlrHist1_5" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style19" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_percHist1_5" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td class="style10">
                &nbsp;</td>
            <td align="right" class="auto-style21" 
                
                
                
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="txt_vlrVenda_05" runat="server" 
                    style="font-size: small; font-family: Arial; color: #006600" Text="Label"></asp:Label>
            </td>
            <td class="style10">
                &nbsp;</td>
            <td align="right" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;" 
                class="style9">
                <dxe:ASPxTextBox ID="txt_vlrMeta05" runat="server" AutoPostBack="True" ClientInstanceName="txt_vlrMeta02" HorizontalAlign="Right" Width="75px">
                    <ClientSideEvents ValueChanged="function(s, e) {
	txt_vlrMeta02.Focus();
}" />
                    <Border BorderStyle="None" />
                </dxe:ASPxTextBox>
            </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;" 
                align="right" class="auto-style5">
                <dxe:ASPxTextBox ID="txt_percMeta05" runat="server" AutoPostBack="True" ClientInstanceName="txt_vlrMeta02" DisplayFormatString="{0:n2}" HorizontalAlign="Right" Width="50px">
                    <Border BorderStyle="None" />
                </dxe:ASPxTextBox>
            </td>
            <td class="auto-style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td bgcolor="#DFEEFF" class="style2" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080">
                &nbsp;<span class="style47">Junho</span>&nbsp;</td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style9" 
                
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_vlrHist4_6" runat="server" 
                    style="font-size: small; font-family: Arial" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style14" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_percHist4_6" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label" 
                    ForeColor="Black"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style22" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_vlrHist3_6" runat="server" Font-Names="Arial" 
                    style="font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style25" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_percHist3_6" runat="server" 
                    style="font-size: small; font-family: Arial" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style11" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_vlrHist2_6" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style26" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_percHist2_6" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style12" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_vlrHist1_6" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style19" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_percHist1_6" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td class="style10">
                &nbsp;</td>
            <td align="right" bgcolor="#CCFFCC" class="auto-style21" 
                
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="txt_vlrVenda_06" runat="server" 
                    style="font-size: small; font-family: Arial; color: #006600" Text="Label"></asp:Label>
            </td>
            <td class="style10">
                &nbsp;</td>
            <td align="right" bgcolor="#CCFFCC" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px;" 
                class="style9">
                <dxe:ASPxTextBox ID="txt_vlrMeta06" runat="server" AutoPostBack="True" BackColor="#CCFFCC" ClientInstanceName="txt_vlrMeta02" HorizontalAlign="Right" Width="75px">
                    <Border BorderStyle="None" />
                </dxe:ASPxTextBox>
            </td>
            <td bgcolor="#CCFFCC" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;" 
                align="right" class="auto-style5">
                <dxe:ASPxTextBox ID="txt_percMeta06" runat="server" AutoPostBack="True" BackColor="#CCFFCC" ClientInstanceName="txt_vlrMeta02" DisplayFormatString="{0:n2}" HorizontalAlign="Right" Width="50px">
                    <Border BorderStyle="None" />
                </dxe:ASPxTextBox>
            </td>
            <td class="auto-style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; background-color: #FFFFFF;">
                &nbsp;<span class="style47">Julho&nbsp;</span></td>
            <td align="right" class="auto-style9" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_vlrHist4_7" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style14" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_percHist4_7" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label" 
                    ForeColor="Black"></asp:Label>
            </td>
            <td align="right" class="auto-style22" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_vlrHist3_7" runat="server" Font-Names="Arial" 
                    style="font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style25" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_percHist3_7" runat="server" 
                    style="font-size: small; font-family: Arial" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style11" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_vlrHist2_7" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style26" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_percHist2_7" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style12" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_vlrHist1_7" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style19" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_percHist1_7" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td class="style10">
                &nbsp;</td>
            <td align="right" class="auto-style21" 
                
                
                
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="txt_vlrVenda_07" runat="server" 
                    style="font-size: small; font-family: Arial; color: #006600" Text="Label"></asp:Label>
            </td>
            <td class="style10">
                &nbsp;</td>
            <td align="right" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;" 
                class="style9">
                <dxe:ASPxTextBox ID="txt_vlrMeta07" runat="server" AutoPostBack="True" ClientInstanceName="txt_vlrMeta02" HorizontalAlign="Right" Width="75px">
                    <ClientSideEvents ValueChanged="function(s, e) {
	txt_vlrMeta02.Focus();
}" />
                    <Border BorderStyle="None" />
                </dxe:ASPxTextBox>
            </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;" 
                align="right" class="auto-style5">
                <dxe:ASPxTextBox ID="txt_percMeta07" runat="server" AutoPostBack="True" ClientInstanceName="txt_vlrMeta02" DisplayFormatString="{0:n2}" HorizontalAlign="Right" Width="50px">
                    <Border BorderStyle="None" />
                </dxe:ASPxTextBox>
            </td>
            <td class="auto-style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td bgcolor="#DFEEFF" class="style2" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080">
                &nbsp;<span class="style48">Agosto&nbsp;</span></td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style9" 
                
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_vlrHist4_8" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style14" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_percHist4_8" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label" 
                    ForeColor="Black"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style22" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_vlrHist3_8" runat="server" Font-Names="Arial" 
                    style="font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style25" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_percHist3_8" runat="server" 
                    style="font-size: small; font-family: Arial" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style11" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_vlrHist2_8" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style26" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_percHist2_8" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style12" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_vlrHist1_8" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style19" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_percHist1_8" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td class="style10">
                &nbsp;</td>
            <td align="right" bgcolor="#CCFFCC" class="auto-style21" 
                
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="txt_vlrVenda_08" runat="server" 
                    style="font-size: small; font-family: Arial; color: #006600" Text="Label"></asp:Label>
            </td>
            <td class="style10">
                &nbsp;</td>
            <td align="right" bgcolor="#CCFFCC" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px;" 
                class="style9">
                <dxe:ASPxTextBox ID="txt_vlrMeta08" runat="server" AutoPostBack="True" BackColor="#CCFFCC" ClientInstanceName="txt_vlrMeta02" HorizontalAlign="Right" Width="75px">
                    <Border BorderStyle="None" />
                </dxe:ASPxTextBox>
            </td>
            <td bgcolor="#CCFFCC" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;" 
                align="right" class="auto-style5">
                <dxe:ASPxTextBox ID="txt_percMeta08" runat="server" AutoPostBack="True" BackColor="#CCFFCC" ClientInstanceName="txt_vlrMeta02" DisplayFormatString="{0:n2}" HorizontalAlign="Right" Width="50px">
                    <Border BorderStyle="None" />
                </dxe:ASPxTextBox>
            </td>
            <td class="auto-style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; background-color: #FFFFFF;">
                &nbsp;<span class="style47">Setembro</span>&nbsp;</td>
            <td align="right" class="auto-style9" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_vlrHist4_9" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style14" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_percHist4_9" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label" 
                    ForeColor="Black"></asp:Label>
            </td>
            <td align="right" class="auto-style22" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_vlrHist3_9" runat="server" Font-Names="Arial" 
                    style="font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style25" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_percHist3_9" runat="server" 
                    style="font-size: small; font-family: Arial" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style11" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_vlrHist2_9" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style26" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_percHist2_9" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style12" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_vlrHist1_9" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style19" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_percHist1_9" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td class="style10">
                &nbsp;</td>
            <td align="right" class="auto-style21" 
                
                
                
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="txt_vlrVenda_09" runat="server" 
                    style="font-size: small; font-family: Arial; color: #006600" Text="Label"></asp:Label>
            </td>
            <td class="style10">
                &nbsp;</td>
            <td align="right" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;" 
                class="style9">
                <dxe:ASPxTextBox ID="txt_vlrMeta09" runat="server" AutoPostBack="True" ClientInstanceName="txt_vlrMeta02" HorizontalAlign="Right" Width="75px">
                    <ClientSideEvents ValueChanged="function(s, e) {
	txt_vlrMeta02.Focus();
}" />
                    <Border BorderStyle="None" />
                </dxe:ASPxTextBox>
            </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;" 
                align="right" class="auto-style5">
                <dxe:ASPxTextBox ID="txt_percMeta09" runat="server" AutoPostBack="True" ClientInstanceName="txt_vlrMeta02" DisplayFormatString="{0:n2}" HorizontalAlign="Right" Width="50px">
                    <Border BorderStyle="None" />
                </dxe:ASPxTextBox>
            </td>
            <td class="auto-style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td bgcolor="#DFEEFF" class="style2" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080">
                &nbsp;<span class="style47">Outubro</span>&nbsp;</td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style9" 
                
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_vlrHist4_10" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style14" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_percHist4_10" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label" 
                    ForeColor="Black"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style22" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_vlrHist3_10" runat="server" Font-Names="Arial" 
                    style="font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style25" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_percHist3_10" runat="server" 
                    style="font-size: small; font-family: Arial" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style11" 
                                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_vlrHist2_10" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style26" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_percHist2_10" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style12" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_vlrHist1_10" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style19" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_percHist1_10" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td class="style10">
                &nbsp;</td>
            <td align="right" bgcolor="#CCFFCC" class="auto-style21" 
                
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="txt_vlrVenda_10" runat="server" 
                    style="font-size: small; font-family: Arial; color: #006600" Text="Label"></asp:Label>
            </td>
            <td class="style10">
                &nbsp;</td>
            <td align="right" bgcolor="#CCFFCC" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px;" 
                class="style9">
                <dxe:ASPxTextBox ID="txt_vlrMeta10" runat="server" AutoPostBack="True" BackColor="#CCFFCC" ClientInstanceName="txt_vlrMeta02" HorizontalAlign="Right" Width="75px">
                    <Border BorderStyle="None" />
                </dxe:ASPxTextBox>
            </td>
            <td bgcolor="#CCFFCC" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;" 
                align="right" class="auto-style5">
                <dxe:ASPxTextBox ID="txt_percMeta10" runat="server" AutoPostBack="True" BackColor="#CCFFCC" ClientInstanceName="txt_vlrMeta02" DisplayFormatString="{0:n2}" HorizontalAlign="Right" Width="50px">
                    <Border BorderStyle="None" />
                </dxe:ASPxTextBox>
            </td>
            <td class="auto-style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; background-color: #FFFFFF;">
                &nbsp;<span class="style47">Novembro&nbsp;</span></td>
            <td align="right" class="auto-style9" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_vlrHist4_11" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style14" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_percHist4_11" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label" 
                    ForeColor="Black"></asp:Label>
            </td>
            <td align="right" class="auto-style22" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_vlrHist3_11" runat="server" Font-Names="Arial" 
                    style="font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style25" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_percHist3_11" runat="server" 
                    style="font-size: small; font-family: Arial" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style11" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_vlrHist2_11" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style26" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_percHist2_11" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style12" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_vlrHist1_11" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" class="auto-style19" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="lbl_percHist1_11" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td class="style10">
                &nbsp;</td>
            <td align="right" class="auto-style21" 
                
                
                
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;">
                <asp:Label ID="txt_vlrVenda_11" runat="server" 
                    style="font-size: small; font-family: Arial; color: #006600" Text="Label"></asp:Label>
            </td>
            <td class="style10">
                &nbsp;</td>
            <td align="right" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;" 
                class="style9">
                <dxe:ASPxTextBox ID="txt_vlrMeta11" runat="server" AutoPostBack="True" ClientInstanceName="txt_vlrMeta02" HorizontalAlign="Right" Width="75px">
                    <ClientSideEvents ValueChanged="function(s, e) {
	txt_vlrMeta02.Focus();
}" />
                    <Border BorderStyle="None" />
                </dxe:ASPxTextBox>
            </td>
            <td style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px; background-color: #FFFFFF;" 
                align="right" class="auto-style5">
                <dxe:ASPxTextBox ID="txt_percMeta11" runat="server" AutoPostBack="True" ClientInstanceName="txt_vlrMeta02" DisplayFormatString="{0:n2}" HorizontalAlign="Right" Width="50px">
                    <Border BorderStyle="None" />
                </dxe:ASPxTextBox>
            </td>
            <td class="auto-style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td bgcolor="#DFEEFF" class="style2" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080">
                &nbsp;<span class="style47">Dezembro</span>&nbsp;</td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style9" 
                
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_vlrHist4_12" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style14" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_percHist4_12" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label" 
                    ForeColor="Black"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style22" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_vlrHist3_12" runat="server" Font-Names="Arial" 
                    style="font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style25" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_percHist3_12" runat="server" 
                    style="font-size: small; font-family: Arial" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style11" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_vlrHist2_12" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style26" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_percHist2_12" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style12" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_vlrHist1_12" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#DFEEFF" class="auto-style19" 
                
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_percHist1_12" runat="server" 
                    style="font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td class="style10">
                &nbsp;</td>
            <td align="right" bgcolor="#CCFFCC" class="auto-style21" 
                
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="txt_vlrVenda_12" runat="server" 
                    style="font-size: small; font-family: Arial; color: #006600" Text="Label"></asp:Label>
            </td>
            <td class="style10">
                &nbsp;</td>
            <td align="right" bgcolor="#CCFFCC" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px;" 
                class="style9">
                <dxe:ASPxTextBox ID="txt_vlrMeta12" runat="server" AutoPostBack="True" BackColor="#CCFFCC" ClientInstanceName="txt_vlrMeta02" HorizontalAlign="Right" Width="75px">
                    <Border BorderStyle="None" />
                </dxe:ASPxTextBox>
            </td>
            <td bgcolor="#CCFFCC" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;" 
                align="right" class="auto-style5">
                <dxe:ASPxTextBox ID="txt_percMeta12" runat="server" AutoPostBack="True" BackColor="#CCFFCC" ClientInstanceName="txt_vlrMeta02" DisplayFormatString="{0:n2}" HorizontalAlign="Right" Width="50px">
                    <Border BorderStyle="None" />
                </dxe:ASPxTextBox>
            </td>
            <td class="auto-style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td align="right" bgcolor="#CCCCCC" class="auto-style9" 
                
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_vlrHist4_Total" runat="server" 
                    style="font-weight: 700; font-family: Arial; font-size: small" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#CCCCCC" class="auto-style14" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_percHist4_Total" runat="server" 
                    style="font-weight: 700; font-family: Arial; font-size: small; color: #000000;" 
                    Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#CCCCCC" class="auto-style22" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_vlrHist3_Total" runat="server" Font-Names="Arial" 
                    style="font-size: small; font-weight: 700" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#CCCCCC" class="auto-style25" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_percHist3_Total" runat="server" 
                    style="font-size: small; font-family: Arial; font-weight: 700" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#CCCCCC" class="auto-style11" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_vlrHist2_Total" runat="server" 
                    style="font-family: Arial; font-size: small; font-weight: 700" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#CCCCCC" class="auto-style26" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_percHist2_Total" runat="server" 
                    style="font-family: Arial; font-size: small; font-weight: 700" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#CCCCCC" class="auto-style12" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_vlrHist1_Total" runat="server" 
                    style="font-family: Arial; font-size: small; font-weight: 700" Text="Label"></asp:Label>
            </td>
            <td align="right" bgcolor="#CCCCCC" class="auto-style19" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_percHist1_Total" runat="server" 
                    style="font-family: Arial; font-size: small; font-weight: 700" Text="Label"></asp:Label>
            </td>
            <td class="style10">
                &nbsp;</td>
            <td align="right" bgcolor="#CCCCCC" class="auto-style21" 
                
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="txt_vlrVenda_Total" runat="server" 
                    style="font-family: Arial; font-size: small; font-weight: 700; color: #006600" 
                    Text="Label"></asp:Label>
            </td>
            <td class="style10">
                &nbsp;</td>
            <td align="right" bgcolor="#CCCCCC" 
                
                style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; padding-right: 2px;" 
                class="style9">
                <asp:Label ID="lbl_vlrMetaTotal" runat="server" 
                    style="font-family: Arial; font-size: small; font-weight: 700" 
                    Text="Label" ForeColor="Blue"></asp:Label>
            </td>
            <td align="right" bgcolor="#CCCCCC" class="auto-style5" 
                
                style="border-style: none solid solid none; border-width: 1px; border-color: #808080; padding-right: 2px;">
                <asp:Label ID="lbl_percMetaTotal" runat="server" 
                    style="font-family: Arial; font-size: small; font-weight: 700" 
                    Text="Label" ForeColor="Blue"></asp:Label>
            </td>
            <td class="auto-style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <div>
        <table class="style1">
            <tr>
                <td bgcolor="#F2F2F2" class="style20" 
                    style="padding: 7px 4px 7px 4px; border: 1px solid #808080;" rowspan="2" 
                    valign="top">
                    <asp:Panel ID="Panel3" runat="server" Height="200px">
                        <table cellspacing="1" class="style57">
                            <tr>
                                <td align="center" bgcolor="#3366CC" class="style13" colspan="3">
                                    <b style="color: #FFFFFF">Opções</b></td>
                            </tr>
                            <tr>
                                <td class="style65" colspan="3" valign="bottom">
                                    <b>Opção:</b>&nbsp;<asp:RadioButton ID="rnd_Grupo" runat="server" 
                                        AutoPostBack="True" Checked="True" GroupName="Grupos" Text="Grupo" />
                                    &nbsp;
                                    <asp:RadioButton ID="rnd_Subgrupo" runat="server" AutoPostBack="True" 
                                        GroupName="Grupos" Text="Sub-grupo" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style63" colspan="3" valign="bottom">
                                    &nbsp;<span class="style22">Digitar 12 meses:</span> &nbsp;<asp:RadioButton ID="rndValor" 
                                        runat="server" AutoPostBack="True" GroupName="OptionVlrPerc" Text="Valor" />
                                    <asp:RadioButton ID="rndPerc" runat="server" AutoPostBack="True" 
                                        GroupName="OptionVlrPerc" Text="Perc" />
&nbsp;
                                    <asp:TextBox ID="txt_Preencher12meses" runat="server" AutoPostBack="True" 
                                        onfocus="this.select();" style="text-align:right;" Width="107px"></asp:TextBox>
                                    <asp:Button ID="btnPreencher" runat="server" Enabled="False" Text="Preencher" />
                                </td>
                            </tr>
                            <tr>
                                <td class="style64" colspan="3" valign="bottom">
                                    <b><span class="style23">Dividir </span><span class="style24">valor</span><span 
                                        class="style23"> em 12 meses:</span></b>&nbsp;&nbsp;
                                    <asp:TextBox ID="txt_Dividir12meses" runat="server" AutoPostBack="True" 
                                        onfocus="this.select();" style="text-align:right;" Width="107px"></asp:TextBox>
                                    <asp:Button ID="btnDividir" runat="server" Text="Dividir" Width="66px" />
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <table class="style41" style="border: 1px solid #808080">
                                        <tr>
                                            <td align="center" bgcolor="#FFFF99" class="style42" 
                                                style="border: 1px solid #808080">
                                                Preenche a meta com base no Histórico do Ano Anterior + Indicador Econômico
                                                <span class="style43">(%)</span> + Acréscimo <span class="style43">(%)</span></td>
                                        </tr>
                                        <tr>
                                            <td class="style62" valign="middle">
                                                &nbsp; <span class="style44">Indicador:</span>
                                                <asp:TextBox ID="txt_Indicador" runat="server" AutoPostBack="True" 
                                                    onfocus="this.select();" style="text-align:right;" Width="77px"></asp:TextBox>
                                                &nbsp; <span class="style44">+ Acréscimo ou - Decréscimo:</span>
                                                <asp:TextBox ID="txt_Acrescimo" runat="server" AutoPostBack="True" 
                                                    onfocus="this.select();" style="text-align:right;" Width="77px"></asp:TextBox>
                                                &nbsp;
                                                <asp:Button ID="btnCalcular" runat="server" Text="Calcular" Width="75px" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="style65" colspan="3" valign="bottom">
                                    <uc6:wucListaPosicao ID="cboPosicao" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblOBS" runat="server" Text="Label" ForeColor="Red" Font-Size="Medium"></asp:Label>
                                </td>
                                <td>
                                    <asp:SqlDataSource ID="dsListaSubgrupo" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                                        SelectCommand="SELECT idSubgrupo AS CatLinhaCodDet, SubGrupoDesc AS CatLinhaDescDet, idGrupo AS CatLinhaCod FROM Cadastros.tblCategoriaLinhaDet WHERE (idGrupo = @CatLinhaCod) ORDER BY Ordem">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="cboGrupo" Name="CatLinhaCod" 
                                                PropertyName="SelectedValue" Type="Byte" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                                <td>
                                    <asp:HiddenField ID="hfCodCat" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
                <td class="style55" align="center" bgcolor="#666666" 
                    style="border: 1px solid #808080" valign="middle">
                    <span class="style46">Consultas</span><br />
                    </td>
                <td class="style56" align="left" rowspan="2" valign="top">
                    <asp:Panel ID="Panel2" runat="server" 
                        Width="230px" Height="197px" BorderColor="#3366CC" BorderStyle="Solid" 
                        BorderWidth="1px">
                        <table cellspacing="1" class="style57">
                            <tr>
                                <td class="auto-style27">
                                    <asp:Button ID="btnSalvar1" runat="server" Text="Salvar" />
                                </td>
                                <td class="auto-style28">
                                    </td>
                            </tr>
                            <tr>
                                <td bgcolor="#3366CC" class="style59" style="color: #FFFFFF">
                                    &nbsp;<span class="style13"><b style="color: #FFFFFF">Opções para Salvar&nbsp;</b></span></td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td bgcolor="#99CCFF" class="style59">
                                    <asp:RadioButton ID="optLojaSelecionada" runat="server" GroupName="Opcoes" 
                                        Text="Loja selecionada" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td bgcolor="#99CCFF" class="style59">
                                    <asp:RadioButton ID="optTodasLojas" runat="server" GroupName="Opcoes" 
                                        Text="Todas as lojas" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td bgcolor="#99CCFF" class="style59">
                                    <asp:RadioButton ID="optTodasLojaApoio" runat="server" GroupName="Opcoes" 
                                        Text="Todas as lojas e apoio" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td bgcolor="#D5EAFF" class="style59">
                                    <asp:RadioButton ID="optTodaLojasIndicadores" runat="server" GroupName="Opcoes" 
                                        Text="Todas as lojas - Indicadores" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td bgcolor="#D5EAFF" class="style59">
                                    <asp:RadioButton ID="optTodaLojasIndicadoresApoio" runat="server" 
                                        GroupName="Opcoes" Text="Todas as lojas e apoio - Indicadores" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style59">
                                    <asp:Label ID="lblCatCod" runat="server" Text="Label" Visible="False"></asp:Label>
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style59">
                                    &nbsp;</td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                    </asp:Panel>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;<br />
&nbsp;<br />
                </td>
            </tr>
            <tr>
                <td class="style25" align="left" 
                    style="border: 1px solid #808080; background-color: #FFFFFF;" valign="top">
                    <asp:Panel ID="Panel1" runat="server" Height="200px" ScrollBars="Vertical">
                        <dxe:ASPxButton ID="link_Mes" runat="server" 
                            CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                            Text="01 - por Mês" Width="195px" HorizontalAlign="Left">
                        </dxe:ASPxButton>
                        <dxe:ASPxButton ID="link_Ano" runat="server" 
                            CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                            Text="02 - por Ano" Width="195px" HorizontalAlign="Left">
                        </dxe:ASPxButton>
                        <dxe:ASPxButton ID="link_EmpresaMes" runat="server" 
                            CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                            HorizontalAlign="Left" Text="03 - Empresa - por Mês" Width="195px">
                        </dxe:ASPxButton>
                        <dxe:ASPxButton ID="link_EmpresaAno" runat="server" 
                            CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                            HorizontalAlign="Left" Text="04 - Empresa - por Ano" Width="195px">
                        </dxe:ASPxButton>
                        <dxe:ASPxButton ID="link_ApoioMes" runat="server" 
                            CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                            HorizontalAlign="Left" Text="05 - Apoio - por Mês" Width="195px">
                        </dxe:ASPxButton>
                        <dxe:ASPxButton ID="link_ApoioAno" runat="server" 
                            CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                            HorizontalAlign="Left" Text="06 - Apoio - por Ano" Width="195px">
                        </dxe:ASPxButton>
                        <dxe:ASPxButton ID="link_GrupoMes" runat="server" 
                            CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                            HorizontalAlign="Left" Text="07 - Grupo - por Mês" Width="195px">
                        </dxe:ASPxButton>
                        <dxe:ASPxButton ID="link_GrupoAno" runat="server" 
                            CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                            HorizontalAlign="Left" Text="08 - Grupo - por Ano" Width="195px">
                        </dxe:ASPxButton>
                        <dxe:ASPxButton ID="link_SubgrupoMes" runat="server" 
                            CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                            HorizontalAlign="Left" Text="09 - Subgrupo - por Mês" Width="195px">
                        </dxe:ASPxButton>
                        <dxe:ASPxButton ID="link_SubgrupoAno" runat="server" 
                            CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                            HorizontalAlign="Left" Text="10 - Subgrupo - por Ano" Width="195px">
                        </dxe:ASPxButton>
                        <dxe:ASPxButton ID="link_12Meses_Grupo" runat="server" 
                            CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                            HorizontalAlign="Left" Text="11 - Ver 12 meses - Grupo" Width="195px">
                        </dxe:ASPxButton>
                        <dxe:ASPxButton ID="link_12Meses_GrupoAno" runat="server" 
                            CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                            HorizontalAlign="Left" Text="12 - Ver 12 meses - Subgrupo" Width="195px">
                        </dxe:ASPxButton>
                    </asp:Panel>
                    </td>
            </tr>
            </table>
    </div>
    </div>
</asp:Content>
