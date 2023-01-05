﻿<%@ Page Title="Cadastro de Metas - Margens por Seção" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Coml_frmCadMargemSecao.aspx.vb" Inherits="MemberPages_Planejamento_Margem_Coml_frmCadMargemSecao" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<%@ Register src="../../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc8" %>
<%@ Register src="../../../Controles/wuciListaLojasComApoio.ascx" tagname="wuciListaLojasComApoio" tagprefix="uc9" %>
<%@ Register src="../../../Controles/wucListaPosicao.ascx" tagname="wucListaPosicao" tagprefix="uc10" %>
<%@ Register src="../../../Controles/wucLink_DRE.ascx" tagname="wucLink_DRE" tagprefix="uc11" %>
<%@ Register src="../../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc12" %>

<%@ Register src="../../../Controles/wucListaCompradorSecao.ascx" tagname="wucListaCompradorSecao" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    

    <style type="text/css">

        #moldura {
            width:1000px; 
            margin: 0 auto ;                      
        }

        .style6
        {
            width: 177px;
        }
        .style8
        {
            width: 282px;
        }
        .style9
        {
            width: 100%;
            border-collapse: collapse;
        }
        .style43
        {
            color: #FFFFFF;
        }
        .style24
        {
            width: 69px;
            color: #FFFFFF;
            text-align: center;
        }
        .style38
        {
            width: 54px;
            text-align: center;
            color: #FFFFFF;
        }
        .style31
        {
            width: 68px;
            color: #FFFFFF;
        }
        .style16
        {
            width: 53px;
            text-align: center;
            color: #FFFFFF;
        }
        .style26
        {
            width: 70px;
            text-align: center;
            color: #FFFFFF;
        }
        .style27
        {
            width: 54px;
            color: #FFFFFF;
        }
        .style40
        {
            width: 1px;
        }
        .style41
        {
            width: 69px;
            color: #FFFFFF;
        }
        .style50
        {
            width: 51px;
            color: #FFFFFF;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
        }
        .style46
        {
            width: 5px;
        }
        .style13
        {
            width: 75px;
            color: #FFFFFF;
            background-color: #3399FF;
        }
        .style28
        {
            width: 53px;
            color: #FFFFFF;
            background-color: #3399FF;
        }
        .style49
        {
            width: 8px;
        }
        .style37
        {
            width: 69px;
        }
        .style19
        {
            width: 54px;
        }
        .style32
        {
            width: 68px;
        }
        .style36
        {
            width: 53px;
        }
        .style39
        {
            width: 70px;
        }
        .style51
        {
            width: 51px;
        }
        .style33
        {
            width: 75px;
        }
        .style52
        {
            color: #000000;
            width: 122px;
        }
        .style53
        {
            color: #000000;
            border: 1px solid #808080;
            width: 122px;
        }
        .style54
        {
            width: 100%;
        }
        .style55
        {
            width: 251px;
        }
        .style56
        {
            width: 280px;
        }
        .style58
        {
            width: 100%;
            border: 1px solid #C7DFFF;
        }
        .style59
        {
            width: 490px;
        }
        .style60
        {
            width: 452px;
        }
        .style61
        {
            width: 10px;
        }
        .style62
        {
            color: #FFFFFF;
            font-weight: bold;
            width: 374px;
        }
        .style63
        {
            width: 374px;
        }
    .style64
    {
        font-family: "Times New Roman", Times, serif;
        color: #FFFFFF;
        font-weight: bold;
    }
    .style65
    {
        width: 234px;
    }
        .style66
        {
            color: #FFFFFF;
            width: 122px;
        }
        .auto-style3 {
            color: #FFFFFF;
            text-align: center;
            background-color: #000099;
            border: 1px solid #808080;
            width: 69px;
        }
        .PartVendaAno_B {
            color:#006600; 
            width: 50px;                       
        } 
       .Padrao_V {
            width: 69px;
            text-align:right;
            padding-right: 2px;
            border: 1px solid #808080;
            background-color: #CCFFCC;
            font-family: Arial, Helvetica, sans-serif; font-size: small;
        }     
       .Padrao_C {
            width: 69px;
            text-align:right;
            padding-right: 2px;
            border: 1px solid #808080;
            background-color: #CCCCCC;
            font-family: Arial, Helvetica, sans-serif; font-size: small;
        }          
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="moldura">
        <table cellspacing="1" class="style1" style="width: 1000px">
            <tr>
                <td class="style6">
                    <uc8:wucAno ID="cboAno" runat="server" />
                </td>
                <td class="style65">
                    <uc9:wuciListaLojasComApoio ID="cboFilial" runat="server" />
                </td>
                <td>
                    <uc1:wucListaCompradorSecao ID="cboSecao" runat="server" />
                </td>
                <td class="style8">
                    &nbsp;</td>
            </tr>
        </table>
        <table cellpadding="0" class="style9">
            <tr>
                <td>
    <table cellpadding="0" class="style9">
        <tr>
            <td class="style66" 
                style="border: 1px solid #808080; background-color: #000099;">
                &nbsp;<span class="style43">Mês</span>&nbsp;</td>
            <td class="style24" 
                style="border: 1px solid #808080; background-color: #000099;">
                    <asp:TextBox ID="txt_Titulo_Hist3" runat="server" BorderStyle="None" 
                        Width="65px" style="text-align:right;" ReadOnly="True" 
                    BackColor="#000099" ForeColor="White" Wrap="False"></asp:TextBox>
                </td>
            <td class="style38" 
                style="border: 1px solid #808080; background-color: #000099;">
                %</td>
            <td align="center" class="style31" 
                style="border: 1px solid #808080; background-color: #000099;">
                    <asp:TextBox ID="txt_Titulo_Hist2" runat="server" BorderStyle="None" 
                        Width="65px" style="text-align:right;" ReadOnly="True" 
                    BackColor="#000099" ForeColor="White" Wrap="False"></asp:TextBox>
                </td>
            <td class="style16" 
                style="border: 1px solid #808080; background-color: #000099;">
                %</td>
            <td class="style26" 
                style="border: 1px solid #808080; background-color: #000099;">
                    <asp:TextBox ID="txt_Titulo_Hist1" runat="server" BorderStyle="None" 
                        Width="65px" style="text-align:right;" ReadOnly="True" 
                    BackColor="#000099" ForeColor="White" Wrap="False"></asp:TextBox>
                </td>
            <td class="style27" 
                style="border: 1px solid #808080; text-align: center; background-color: #000099;">
                %</td>
            <td class="style40">
                &nbsp;</td>
            <td class="style41" 
                style="border: 1px solid #808080; text-align: center; background-color: #009900;">
                                Meta</td>
            <td class="style50" 
                
                
                style="border: 1px solid #808080; text-align: center; background-color: #009900;">
                    <asp:Label ID="lblCrescLegenda_M1" runat="server" Text="Label" 
                    style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style46">
                &nbsp;</td>
            <td class="style13" 
                style="border: 1px solid #808080; text-align: center; ">
                Venda</td>
            <td class="style28" 
                
                style="border: 1px solid #808080; text-align: center;">
                % Part</td>
            <td class="style49">
                &nbsp;</td>
            <td class="style27" 
                style="border: 1px solid #808080; text-align: center; background-color: #000099;">
                    <asp:Label ID="lblCrescLegenda_M3" runat="server" Text="Label" 
                    style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style27" 
                style="border: 1px solid #808080; text-align: center; background-color: #000099;">
                    <asp:Label ID="lblCrescLegenda_M2" runat="server" Text="Label" 
                    style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style27" 
                
                style="border: 1px solid #808080; text-align: center; background-color: #009900;">
                    <asp:Label ID="lblCrescLegenda_M4" runat="server" Text="Label" 
                    style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style33">
                &nbsp;</td>
            <td class="style62">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style53" bgcolor="White">
                &nbsp;Janeiro&nbsp;</td>
            <td class="style37" style="border: 1px solid #808080; padding-right: 2px;" 
                bgcolor="White" align="right">
                    <asp:Label ID="txt_vlrHist3_01" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                style="border: 1px solid #808080; padding-right: 2px; text-align: right; background-color: #FFFFFF;" 
                bgcolor="White">
                    <asp:Label ID="txt_percHist3_01" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style37" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist2_01" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                style="border: 1px solid #808080; padding-right: 2px; text-align: right; background-color: #FFFFFF;" 
                bgcolor="White">
                    <asp:Label ID="txt_percHist2_01" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style37" 
                style="border: 1px solid #808080; padding-right: 2px; text-align: right; background-color: #FFFFFF;" 
                bgcolor="White">
                    <asp:Label ID="txt_vlrHist1_01" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                style="border: 1px solid #808080; padding-right: 2px; text-align: right; background-color: #FFFFFF;" 
                bgcolor="White">
                    <asp:Label ID="txt_percHist1_01" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style40">
                &nbsp;</td>
            <td class="style37" 
                style="border: 1px solid #808080; background-color: #FFFFFF;">
                    <asp:TextBox ID="txt_vlrMeta01" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; color: #0000FF;" AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style51" style="border: 1px solid #808080; padding-right: 2px; background-color: #FFFFFF;" 
                align="right">
                    <asp:TextBox ID="txt_percCresc01" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right;" AutoPostBack="True" 
                        Height="18px" ForeColor="Blue"></asp:TextBox>
                </td>
            <td class="style46">
                &nbsp;</td>
            <td class="style33" 
                style="border: 1px solid #808080; background-color: #FFFFFF;">
                    <asp:TextBox ID="txt_vlrVenda_01" runat="server" BorderStyle="None" 
                        Width="70px" style="text-align:right; color: #006600;" ReadOnly="True"></asp:TextBox>
                </td>
            <td class="style36" 
                style="border: 1px solid #808080; background-color: #FFFFFF;">
                    <asp:TextBox ID="txt_percPart_01" runat="server" BorderStyle="None" 
                        Width="50px" style="text-align:right; color: #006600; margin-left: 0px;" 
                        ReadOnly="True"></asp:TextBox>
                </td>
            <td class="style49">
                &nbsp;</td>
            <td class="style19" style="border: 1px solid #808080; padding-right: 2px; background-color: #FFFFFF;" 
                align="right">
                    <asp:Label ID="lblCresc01_M3" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" style="border: 1px solid #808080; padding-right: 2px; background-color: #FFFFFF;" 
                align="right">
                    <asp:Label ID="lblCresc01_M2" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" style="border: 1px solid #808080; padding-right: 2px; background-color: #FFFFFF;" 
                align="right">
                    <asp:Label ID="lblCresc01_M1" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style33">
                &nbsp;</td>
            <td class="style63">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style52" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                &nbsp;Fevereiro&nbsp;</td>
            <td class="style37" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="txt_vlrHist3_02" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist3_02" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style32" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist2_02" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style36" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist2_02" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist1_02" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist1_02" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style40">
                &nbsp;</td>
            <td class="style37" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                    <asp:TextBox ID="txt_vlrMeta02" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; background-color: #CCFFCC; color: #0000FF;" 
                    AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style51" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px;" 
                align="right">
                    <asp:TextBox ID="txt_percCresc02" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right; background-color: #CCFFCC;" 
                    AutoPostBack="True" ForeColor="Blue" Height="18px"></asp:TextBox>
                </td>
            <td class="style46">
                &nbsp;</td>
            <td class="style33" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                    <asp:TextBox ID="txt_vlrVenda_02" runat="server" BorderStyle="None" 
                        Width="70px" style="text-align:right; background-color: #CCFFCC; color: #006600;" 
                    ReadOnly="True"></asp:TextBox>
                </td>
            <td class="style36" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                    <asp:TextBox ID="txt_percPart_02" runat="server" BorderStyle="None" 
                        Width="50px" style="text-align:right; background-color: #CCFFCC; color: #006600;" 
                    ReadOnly="True"></asp:TextBox>
                </td>
            <td class="style49">
                &nbsp;</td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #F4F4F0; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="lblCresc02_M3" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #F4F4F0; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="lblCresc02_M2" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #F4F4F0; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="lblCresc02_M1" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style33">
                &nbsp;</td>
            <td class="style63">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style52" style="border: 1px solid #808080" bgcolor="White">
                &nbsp;Março&nbsp;</td>
            <td class="style37" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="txt_vlrHist3_03" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist3_03" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style32" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist2_03" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style36" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist2_03" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist1_03" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist1_03" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style40">
                &nbsp;</td>
            <td class="style37" 
                style="border: 1px solid #808080; background-color: #FFFFFF;">
                    <asp:TextBox ID="txt_vlrMeta03" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; color: #0000FF;" AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style51" style="border: 1px solid #808080; padding-right: 2px; background-color: #FFFFFF;" 
                align="right">
                    <asp:TextBox ID="txt_percCresc03" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right;" AutoPostBack="True" ForeColor="Blue"></asp:TextBox>
                </td>
            <td class="style46">
                &nbsp;</td>
            <td class="style33" 
                style="border: 1px solid #808080; background-color: #FFFFFF;">
                    <asp:TextBox ID="txt_vlrVenda_03" runat="server" BorderStyle="None" 
                        Width="70px" style="text-align:right; color: #006600;" ReadOnly="True"></asp:TextBox>
                </td>
            <td class="style36" 
                style="border: 1px solid #808080; background-color: #FFFFFF;">
                    <asp:TextBox ID="txt_percPart_03" runat="server" BorderStyle="None" 
                        Width="50px" style="text-align:right; color: #006600;" ReadOnly="True"></asp:TextBox>
                </td>
            <td class="style49">
                &nbsp;</td>
            <td class="style19" style="border: 1px solid #808080; padding-right: 2px; background-color: #FFFFFF;" 
                align="right">
                    <asp:Label ID="lblCresc03_M3" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" style="border: 1px solid #808080; padding-right: 2px; background-color: #FFFFFF;" 
                align="right">
                    <asp:Label ID="lblCresc03_M2" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" style="border: 1px solid #808080; padding-right: 2px; background-color: #FFFFFF;" 
                align="right">
                    <asp:Label ID="lblCresc03_M1" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style33">
                &nbsp;</td>
            <td class="style63">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style52" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                &nbsp;Abril&nbsp;</td>
            <td class="style37" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="txt_vlrHist3_04" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist3_04" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style32" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist2_04" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style36" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist2_04" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist1_04" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist1_04" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style40">
                &nbsp;</td>
            <td class="style37" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                    <asp:TextBox ID="txt_vlrMeta04" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; background-color: #CCFFCC; color: #0000FF;" 
                    AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style51" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px;" 
                align="right">
                    <asp:TextBox ID="txt_percCresc04" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right; background-color: #CCFFCC;" 
                    AutoPostBack="True" ForeColor="Blue"></asp:TextBox>
                </td>
            <td class="style46">
                &nbsp;</td>
            <td class="style33" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                    <asp:TextBox ID="txt_vlrVenda_04" runat="server" BorderStyle="None" 
                        Width="70px" style="text-align:right; background-color: #CCFFCC; color: #006600;" 
                    ReadOnly="True"></asp:TextBox>
                </td>
            <td class="style36" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                    <asp:TextBox ID="txt_percPart_04" runat="server" BorderStyle="None" 
                        Width="50px" style="text-align:right; background-color: #CCFFCC; color: #006600;" 
                    ReadOnly="True"></asp:TextBox>
                </td>
            <td class="style49">
                &nbsp;</td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #F4F4F0; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="lblCresc04_M3" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #F4F4F0; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="lblCresc04_M2" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #F4F4F0; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="lblCresc04_M1" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style33">
                &nbsp;</td>
            <td class="style63">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style52" style="border: 1px solid #808080" bgcolor="White">
                &nbsp;Maio&nbsp;</td>
            <td class="style37" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="txt_vlrHist3_05" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist3_05" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style32" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist2_05" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style36" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist2_05" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist1_05" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist1_05" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style40">
                &nbsp;</td>
            <td class="style37" 
                style="border: 1px solid #808080; background-color: #FFFFFF;">
                    <asp:TextBox ID="txt_vlrMeta05" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; color: #0000FF;" AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style51" style="border: 1px solid #808080; padding-right: 2px; background-color: #FFFFFF;" 
                align="right">
                    <asp:TextBox ID="txt_percCresc05" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right;" AutoPostBack="True" ForeColor="Blue"></asp:TextBox>
                </td>
            <td class="style46">
                &nbsp;</td>
            <td class="style33" 
                style="border: 1px solid #808080; background-color: #FFFFFF;">
                    <asp:TextBox ID="txt_vlrVenda_05" runat="server" BorderStyle="None" 
                        Width="70px" style="text-align:right; color: #006600;" ReadOnly="True"></asp:TextBox>
                </td>
            <td class="style36" 
                style="border: 1px solid #808080; background-color: #FFFFFF;">
                    <asp:TextBox ID="txt_percPart_05" runat="server" BorderStyle="None" 
                        Width="50px" style="text-align:right; color: #006600;" ReadOnly="True"></asp:TextBox>
                </td>
            <td class="style49">
                &nbsp;</td>
            <td class="style19" style="border: 1px solid #808080; padding-right: 2px; background-color: #FFFFFF;" 
                align="right">
                    <asp:Label ID="lblCresc05_M3" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" style="border: 1px solid #808080; padding-right: 2px; background-color: #FFFFFF;" 
                align="right">
                    <asp:Label ID="lblCresc05_M2" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" style="border: 1px solid #808080; padding-right: 2px; background-color: #FFFFFF;" 
                align="right">
                    <asp:Label ID="lblCresc05_M1" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style33">
                &nbsp;</td>
            <td class="style63">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style52" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                &nbsp;Junho&nbsp;</td>
            <td class="style37" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="txt_vlrHist3_06" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist3_06" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style32" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist2_06" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style36" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist2_06" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist1_06" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist1_06" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style40">
                &nbsp;</td>
            <td class="style37" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                    <asp:TextBox ID="txt_vlrMeta06" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; background-color: #CCFFCC; color: #0000FF;" 
                    AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style51" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px;" 
                align="right">
                    <asp:TextBox ID="txt_percCresc06" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right; background-color: #CCFFCC;" 
                    AutoPostBack="True" ForeColor="Blue"></asp:TextBox>
                </td>
            <td class="style46">
                &nbsp;</td>
            <td class="style33" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                    <asp:TextBox ID="txt_vlrVenda_06" runat="server" BorderStyle="None" 
                        Width="70px" style="text-align:right; background-color: #CCFFCC; color: #006600;" 
                    ReadOnly="True" Height="18px"></asp:TextBox>
                </td>
            <td class="style36" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                    <asp:TextBox ID="txt_percPart_06" runat="server" BorderStyle="None" 
                        Width="50px" style="text-align:right; background-color: #CCFFCC; color: #006600;" 
                    ReadOnly="True"></asp:TextBox>
                </td>
            <td class="style49">
                &nbsp;</td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #F4F4F0; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="lblCresc06_M3" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #F4F4F0; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="lblCresc06_M2" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #F4F4F0; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="lblCresc06_M1" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style33">
                &nbsp;</td>
            <td class="style63">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style52" style="border: 1px solid #808080" bgcolor="White">
                &nbsp;Julho&nbsp;</td>
            <td class="style37" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="txt_vlrHist3_07" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist3_07" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style32" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist2_07" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style36" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist2_07" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist1_07" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist1_07" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style40">
                &nbsp;</td>
            <td class="style37" 
                style="border: 1px solid #808080; background-color: #FFFFFF;">
                    <asp:TextBox ID="txt_vlrMeta07" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; color: #0000FF;" AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style51" style="border: 1px solid #808080; padding-right: 2px; background-color: #FFFFFF;" 
                align="right">
                    <asp:TextBox ID="txt_percCresc07" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right;" AutoPostBack="True" ForeColor="Blue"></asp:TextBox>
                </td>
            <td class="style46">
                &nbsp;</td>
            <td class="style33" 
                style="border: 1px solid #808080; background-color: #FFFFFF;">
                    <asp:TextBox ID="txt_vlrVenda_07" runat="server" BorderStyle="None" 
                        Width="70px" style="text-align:right; color: #006600;" ReadOnly="True"></asp:TextBox>
                </td>
            <td class="style36" 
                style="border: 1px solid #808080; background-color: #FFFFFF;">
                    <asp:TextBox ID="txt_percPart_07" runat="server" BorderStyle="None" 
                        Width="50px" style="text-align:right; color: #006600;" ReadOnly="True"></asp:TextBox>
                </td>
            <td class="style49">
                &nbsp;</td>
            <td class="style19" style="border: 1px solid #808080; padding-right: 2px; background-color: #FFFFFF;" 
                align="right">
                    <asp:Label ID="lblCresc07_M3" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" style="border: 1px solid #808080; padding-right: 2px; background-color: #FFFFFF;" 
                align="right">
                    <asp:Label ID="lblCresc07_M2" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" style="border: 1px solid #808080; padding-right: 2px; background-color: #FFFFFF;" 
                align="right">
                    <asp:Label ID="lblCresc07_M1" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style33">
                &nbsp;</td>
            <td class="style63">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style52" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                &nbsp;Agosto&nbsp;</td>
            <td class="style37" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="txt_vlrHist3_08" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist3_08" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style32" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist2_08" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style36" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist2_08" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist1_08" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist1_08" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style40">
                &nbsp;</td>
            <td class="style37" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                    <asp:TextBox ID="txt_vlrMeta08" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; background-color: #CCFFCC; color: #0000FF;" 
                    AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style51" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px;" 
                align="right">
                    <asp:TextBox ID="txt_percCresc08" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right; background-color: #CCFFCC;" 
                    AutoPostBack="True" ForeColor="Blue"></asp:TextBox>
                </td>
            <td class="style46">
                &nbsp;</td>
            <td class="style33" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                    <asp:TextBox ID="txt_vlrVenda_08" runat="server" BorderStyle="None" 
                        Width="70px" style="text-align:right; background-color: #CCFFCC; color: #006600;" 
                    ReadOnly="True"></asp:TextBox>
                </td>
            <td class="style36" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                    <asp:TextBox ID="txt_percPart_08" runat="server" BorderStyle="None" 
                        Width="50px" style="text-align:right; background-color: #CCFFCC; color: #006600;" 
                    ReadOnly="True"></asp:TextBox>
                </td>
            <td class="style49">
                &nbsp;</td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #F4F4F0; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="lblCresc08_M3" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #F4F4F0; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="lblCresc08_M2" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #F4F4F0; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="lblCresc08_M1" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style33">
                &nbsp;</td>
            <td class="style63">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style52" style="border: 1px solid #808080" bgcolor="White">
                &nbsp;Setembro&nbsp;</td>
            <td class="style37" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="txt_vlrHist3_09" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist3_09" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style32" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist2_09" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style36" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist2_09" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist1_09" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist1_09" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style40">
                &nbsp;</td>
            <td class="style37" 
                style="border: 1px solid #808080; background-color: #FFFFFF;">
                    <asp:TextBox ID="txt_vlrMeta09" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; color: #0000FF;" AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style51" style="border: 1px solid #808080; padding-right: 2px; background-color: #FFFFFF;" 
                align="right">
                    <asp:TextBox ID="txt_percCresc09" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right;" AutoPostBack="True" ForeColor="Blue"></asp:TextBox>
                </td>
            <td class="style46">
                &nbsp;</td>
            <td class="style33" 
                style="border: 1px solid #808080; background-color: #FFFFFF;">
                    <asp:TextBox ID="txt_vlrVenda_09" runat="server" BorderStyle="None" 
                        Width="70px" style="text-align:right; color: #006600;" ReadOnly="True"></asp:TextBox>
                </td>
            <td class="style36" 
                style="border: 1px solid #808080; background-color: #FFFFFF;">
                    <asp:TextBox ID="txt_percPart_09" runat="server" BorderStyle="None" 
                        Width="50px" style="text-align:right; color: #006600;" ReadOnly="True"></asp:TextBox>
                </td>
            <td class="style49">
                &nbsp;</td>
            <td class="style19" style="border: 1px solid #808080; padding-right: 2px; background-color: #FFFFFF;" 
                align="right">
                    <asp:Label ID="lblCresc09_M3" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" style="border: 1px solid #808080; padding-right: 2px; background-color: #FFFFFF;" 
                align="right">
                    <asp:Label ID="lblCresc09_M2" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" style="border: 1px solid #808080; padding-right: 2px; background-color: #FFFFFF;" 
                align="right">
                    <asp:Label ID="lblCresc09_M1" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style33">
                &nbsp;</td>
            <td class="style63">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style52" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                &nbsp;Outubro&nbsp;</td>
            <td class="style37" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="txt_vlrHist3_10" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist3_10" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style32" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist2_10" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style36" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist2_10" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist1_10" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist1_10" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style40">
                &nbsp;</td>
            <td class="style37" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                    <asp:TextBox ID="txt_vlrMeta10" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; background-color: #CCFFCC; color: #0000FF;" 
                    AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style51" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px;" 
                align="right">
                    <asp:TextBox ID="txt_percCresc10" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right; background-color: #CCFFCC;" 
                    AutoPostBack="True" ForeColor="Blue"></asp:TextBox>
                </td>
            <td class="style46">
                &nbsp;</td>
            <td class="style33" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                    <asp:TextBox ID="txt_vlrVenda_10" runat="server" BorderStyle="None" 
                        Width="70px" style="text-align:right; background-color: #CCFFCC; color: #006600;" 
                    ReadOnly="True"></asp:TextBox>
                </td>
            <td class="style36" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                    <asp:TextBox ID="txt_percPart_10" runat="server" BorderStyle="None" 
                        Width="50px" style="text-align:right; background-color: #CCFFCC; color: #006600;" 
                    ReadOnly="True"></asp:TextBox>
                </td>
            <td class="style49">
                &nbsp;</td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #F4F4F0; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="lblCresc10_M3" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #F4F4F0; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="lblCresc10_M2" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #F4F4F0; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="lblCresc10_M1" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style33">
                &nbsp;</td>
            <td class="style63">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style52" style="border: 1px solid #808080" bgcolor="White">
                &nbsp;Novembro&nbsp;</td>
            <td class="style37" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="txt_vlrHist3_11" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist3_11" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style32" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist2_11" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style36" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist2_11" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist1_11" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist1_11" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style40">
                &nbsp;</td>
            <td class="style37" 
                style="border: 1px solid #808080; background-color: #FFFFFF;">
                    <asp:TextBox ID="txt_vlrMeta11" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; color: #0000FF;" AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style51" style="border: 1px solid #808080; padding-right: 2px; background-color: #FFFFFF;" 
                align="right">
                    <asp:TextBox ID="txt_percCresc11" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right;" AutoPostBack="True" ForeColor="Blue"></asp:TextBox>
                </td>
            <td class="style46">
                &nbsp;</td>
            <td class="style33" 
                style="border: 1px solid #808080; background-color: #FFFFFF;">
                    <asp:TextBox ID="txt_vlrVenda_11" runat="server" BorderStyle="None" 
                        Width="70px" style="text-align:right; color: #006600;" ReadOnly="True"></asp:TextBox>
                </td>
            <td class="style36" 
                style="border: 1px solid #808080; background-color: #FFFFFF;">
                    <asp:TextBox ID="txt_percPart_11" runat="server" BorderStyle="None" 
                        Width="50px" style="text-align:right; color: #006600;" ReadOnly="True"></asp:TextBox>
                </td>
            <td class="style49">
                &nbsp;</td>
            <td class="style19" style="border: 1px solid #808080; padding-right: 2px; background-color: #FFFFFF;" 
                align="right">
                    <asp:Label ID="lblCresc11_M3" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" style="border: 1px solid #808080; padding-right: 2px; background-color: #FFFFFF;" 
                align="right">
                    <asp:Label ID="lblCresc11_M2" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" style="border: 1px solid #808080; padding-right: 2px; background-color: #FFFFFF;" 
                align="right">
                    <asp:Label ID="lblCresc11_M1" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style33">
                &nbsp;</td>
            <td class="style63">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style52" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                &nbsp;Dezembro&nbsp;</td>
            <td class="style37" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="txt_vlrHist3_12" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist3_12" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style32" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist2_12" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style36" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist2_12" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist1_12" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist1_12" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style40">
                &nbsp;</td>
            <td class="style37" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                    <asp:TextBox ID="txt_vlrMeta12" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; background-color: #CCFFCC; color: #0000FF;" 
                    AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style51" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px;" 
                align="right">
                    <asp:TextBox ID="txt_percCresc12" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right; background-color: #CCFFCC;" 
                    AutoPostBack="True" ForeColor="Blue"></asp:TextBox>
                </td>
            <td class="style46">
                &nbsp;</td>
            <td class="style33" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                    <asp:TextBox ID="txt_vlrVenda_12" runat="server" BorderStyle="None" 
                        Width="70px" style="text-align:right; background-color: #CCFFCC; color: #006600;" 
                    ReadOnly="True"></asp:TextBox>
                </td>
            <td class="style36" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                    <asp:TextBox ID="txt_percPart_12" runat="server" BorderStyle="None" 
                        Width="50px" style="text-align:right; background-color: #CCFFCC; color: #006600;" 
                    ReadOnly="True"></asp:TextBox>
                </td>
            <td class="style49">
                &nbsp;</td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #F4F4F0; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="lblCresc12_M3" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #F4F4F0; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="lblCresc12_M2" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #F4F4F0; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="lblCresc12_M1" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style33">
                &nbsp;</td>
            <td class="style63">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style66">
                &nbsp;</td>
            <td class="style37" 
                
                style="border: 1px solid #808080; background-color: #CCCCCC; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="txt_vlrHist3_Total" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCCCCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist3_Total" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style32" 
                
                style="border: 1px solid #808080; background-color: #CCCCCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist2_Total" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style36" 
                
                style="border: 1px solid #808080; background-color: #CCCCCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist2_Total" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #CCCCCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist1_Total" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCCCCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist1_Total" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style40">
                &nbsp;</td>
            <td class="style37" 
                style="border: 1px solid #808080; background-color: #CCCCCC;">
                    <asp:TextBox ID="txt_vlrMetaTotal" runat="server" BackColor="#CCCCCC" 
                        BorderStyle="None" style="text-align:right; color: #0000FF;" Width="65px" 
                    ReadOnly="True" ></asp:TextBox>
                </td>
            <td class="style51" 
                
                style="border: 1px solid #808080; background-color: #CCCCCC; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="lblCrescAno" runat="server" Text="Label" 
                        
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small; " 
                        ForeColor="Blue"></asp:Label>
                </td>
            <td class="style46">
                &nbsp;</td>
            <td class="style33" 
                style="border: 1px solid #808080; background-color: #CCCCCC;">
                    <asp:TextBox ID="txt_vlrVenda_Total" runat="server" BackColor="#CCCCCC" 
                        BorderStyle="None" style="text-align:right; color: #006600;" Width="70px" 
                    ReadOnly="True" ></asp:TextBox>
                </td>
            <td class="style36" 
                style="border: 1px solid #808080; background-color: #CCCCCC;">
                    <asp:TextBox ID="txt_percPart_Ano" runat="server" BorderStyle="None" 
                        Width="50px" style="text-align:right; background-color: #CCCCCC; color: #006600;" 
                    ReadOnly="True">100</asp:TextBox>
                </td>
            <td class="style49">
                &nbsp;</td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCCCCC; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="lblCrescAno_M3" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small; "></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCCCCC; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="lblCrescAno_M2" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small; "></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCCCCC; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="lblCrescAno_M1" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small; "></asp:Label>
                </td>
            <td class="style33">
                &nbsp;</td>
            <td class="style63">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
                </td>
            </tr>
        </table>
        <table cellspacing="1" class="style54">
            <tr>
                <td class="style55">
                    <uc10:wucListaPosicao ID="cboPosicao" runat="server" />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnSalvar1" runat="server" Text="Salvar" />
                </td>
                <td>
                    <uc11:wucLink_DRE ID="wucLink_DRE1" runat="server" />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                <asp:Label ID="lblDepto" runat="server" Text="Label" BackColor="#FFFF99" 
                        ForeColor="#0066FF" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
        <table cellspacing="1" class="style54">
            <tr>
                <td valign="top" class="style56">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <table cellspacing="1" class="style58">
                                <tr>
                                    <td style="background-color: #3399FF; color: #FFFFFF; text-align: center">
                                        Calendário</td>
                                </tr>
                                <tr>
                                    <td>
                                        <uc12:wuciListaMes ID="cboMes" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center">
                                        <asp:GridView ID="grdCalendario" runat="server" AutoGenerateColumns="False" 
                                            BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" 
                                            CellPadding="1" DataSourceID="dsCalendario" GridLines="Horizontal">
                                            <RowStyle BackColor="#E7E7FF" BorderColor="Gray" BorderStyle="Solid" 
                                                BorderWidth="1px" Font-Size="Small" ForeColor="#4A3C8C" />
                                            <Columns>
                                                <asp:BoundField DataField="idCalendarioDesc" HeaderText="Descrição" 
                                                    SortExpression="idCalendarioDesc">
                                                    <HeaderStyle BackColor="#CC6600" BorderColor="Gray" BorderStyle="Solid" 
                                                        BorderWidth="1px" />
                                                    <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                                                        Width="180px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="idCalendarioDias" HeaderText="Dias" 
                                                    SortExpression="idCalendarioDias">
                                                    <HeaderStyle BackColor="#CC6600" BorderColor="Gray" BorderStyle="Solid" 
                                                        BorderWidth="1px" />
                                                    <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                                                        HorizontalAlign="Center" Width="60px" />
                                                </asp:BoundField>
                                            </Columns>
                                            <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                                            <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                                            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                                            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                                            <AlternatingRowStyle BackColor="#F7F7F7" />
                                        </asp:GridView>
                                    </td>
                                </tr>
                            </table>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </td>
                <td class="style61">
                    &nbsp;</td>
                <td valign="top" class="style60">
                            <table cellspacing="1" class="style58">
                                <tr>
                                    <td class="style59" 
                                        style="background-color: #3399FF; color: #FFFFFF; text-align: center">
                    Observação sobre a Seção</td>
                                </tr>
                                <tr>
                                    <td align="center" class="style59">
                            <asp:TextBox ID="txtMemo" runat="server" BackColor="#FFFFEA" Height="200px" 
                                TextMode="MultiLine" 
                                ToolTip="Digite informações aqui que sejam importantes para serem reelembradas ou informadas." 
                                Width="400px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <table cellspacing="1" class="style54">
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <table cellspacing="1" class="style54">
            <tr>
                <td>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </td>
                <td>
                    <asp:Label ID="lblError" runat="server" Text="Label" Visible="False"></asp:Label>
                    <br />
                    <asp:Label ID="lblInfo" runat="server" Text="Label" Visible="False"></asp:Label>
                    <br />
                <asp:SqlDataSource ID="dsCalendario" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                    SelectCommand="uspCompradorCalendario" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cboAno" Name="Ano" 
                            PropertyName="CallAno" Type="Int16" />
                        <asp:ControlParameter ControlID="cboMes" Name="Mes" 
                            PropertyName="CallMes" Type="Byte" />
                    </SelectParameters>
                </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br />
    </div>
</asp:Content>

