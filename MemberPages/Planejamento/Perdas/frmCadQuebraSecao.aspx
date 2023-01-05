<%@ Page Title="Cadastro de Metas - Quebras por Seção" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="frmCadQuebraSecao.aspx.vb" Inherits="MemberPages_Planejamento_Vendas_frmCadVendaSecao" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<%@ Register src="../../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc8" %>
<%@ Register src="../../../Controles/wuciListaLojasComApoio.ascx" tagname="wuciListaLojasComApoio" tagprefix="uc9" %>
<%@ Register src="../../../Controles/wucListaSecao.ascx" tagname="wucListaSecao" tagprefix="uc10" %>
<%@ Register src="../../../Controles/wucListaPosicao.ascx" tagname="wucListaPosicao" tagprefix="uc11" %>
<%@ Register src="../../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc12" %>

<%@ Register src="../../../Controles/wucListaLojasComCorporacao.ascx" tagname="wucListaLojasComCorporacao" tagprefix="uc1" %>
<%@ Register Src="~/Controles/wucListaLojas.ascx" TagPrefix="uc1" TagName="wucListaLojas" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    

    <style type="text/css">

       #moldura {
            width:1024px; 
            margin-left: 2px;                   
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
            color: #000000;
        }
        .style24
        {
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
            color: #FFFFFF;
        }
        .style16
        {
            width: 53px;
            text-align: center;
            color: #000000;
        }
        .style26
        {
            text-align: center;
            color: #FFFFFF;
        }
        .style40
        {
            width: 1px;
        }
        .style41
        {
            color: #FFFFFF;
        }
        .style50
        {
            width: 51px;
            color: #000000;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
        }
        .style13
        {
            width: 75px;
            color: #FFFFFF;
            background-color: #3399FF;
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
            width: 169px;
        }
        .style60
        {
            width: 232px;
        }
        .style61
        {
            width: 10px;
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
    .style67
    {
        width: 107px;
    }
    .style68
    {
        width: 178px;
    }
    .style69
    {
        text-align: center;
        color: #0000FF;
    }
    .style70
    {
        color: #000000;
        text-align: center;
    }
    .style71
    {
        width: 54px;
        text-align: center;
        color: #000000;
    }
    .style72
    {
        width: 75px;
        color: #000000;
        background-color: #3399FF;
    }
    .style73
    {
        width: 54px;
        color: #000000;
    }
        .style74
        {
            width: 169px;
            height: 22px;
        }
        .style75
        {
            width: 169px;
            font-weight: bold;
        }
    .auto-style3 {
        width: 6px;
    }
    .auto-style4 {
        width: 494px;
    }
    .auto-style5 {
        width: 119px;
    }
    .auto-style6 {
        width: 94px;
    }
        .auto-style7 {
            color: #000000;
            width: 109px;
        }
        .auto-style8 {
            width: 109px;
        }
        .auto-style9 {
            color: #000000;
            width: 99px;
        }
        .auto-style10 {
            width: 99px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="moldura">
  
        <table cellspacing="1" class="style1" style="width: 94%">
            <tr>
                <td class="style6">
                    <uc8:wucAno ID="cboAno" runat="server" />
                </td>
                <td class="style65">
                    <uc1:wucListaLojas runat="server" ID="cboFilial" />
                </td>
                <td>
                    <uc10:wucListaSecao ID="cboSecao" runat="server" />
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
            <td class="style66">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td class="style24" colspan="4" style="border: 1px solid #808080; background-color: #FF9900">
                    AGENDA 23&nbsp; (
                                A )</td>
            <td class="style40">
                &nbsp;</td>
            <td align="center" class="style31" 
                style="border: 1px solid #808080; background-color: #FF9900;" colspan="4">
                    DIVERGÊNCIA (
                    B )</td>
            <td class="style26" 
                style="border: 1px solid #808080; background-color: #FF9900;" colspan="2">
                    A + B = C</td>
            <td class="style26" 
                style="border: 1px solid #808080; background-color: #663300;" colspan="2">
                    D</td>
            <td class="style69" 
                style="border: 1px solid #808080; background-color: #99CCFF;" colspan="2">
                    C + D</td>
            <td class="style40">
                &nbsp;</td>
            <td class="style68">
                &nbsp;</td>
            <td class="style67">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style66">
                &nbsp;</td>
            <td class="style13" 
                
                style="border: 1px solid #808080; text-align: center; background-color: #3366FF;">
                Vendas</td>
            <td class="style24" 
                style="border: 1px solid #808080; background-color: #000099;" colspan="2">
                <asp:Label ID="lblTituloHistAg23" runat="server" Text="Label"></asp:Label>
            </td>
            <td class="style41" 
                
                style="border: 1px solid #808080; text-align: center; background-color: #009900;" 
                colspan="2">
                                Meta</td>
            <td class="style40">
                &nbsp;</td>
            <td align="center" class="style31" 
                style="border: 1px solid #808080; background-color: #000099;" colspan="2">
                    Histórico 2014</td>
            <td align="center" class="style31" 
                style="border: 1px solid #808080; background-color: #009900;" colspan="2">
                    Meta</td>
            <td class="style26" 
                style="border: 1px solid #808080; background-color: #000099;" colspan="2">
                    Quebra Fisica</td>
            <td class="style26" 
                style="border: 1px solid #808080; background-color: #000099;" colspan="2">
                    Quebra Margem</td>
            <td class="style26" 
                style="border: 1px solid #808080; background-color: #000099;" colspan="2">
                    Quebra Seção</td>
            <td class="style40">
                &nbsp;</td>
            <td class="style68">
                &nbsp;</td>
            <td class="style67">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style66" 
                style="border: 1px solid #808080; background-color: #CCCCCC;">
                &nbsp;<span class="style43">Mês</span>&nbsp;</td>
            <td class="style72" 
                
                style="border: 1px solid #808080; text-align: center; background-color: #CCCCCC;">
                Meta </td>
            <td class="style70" 
                style="border: 1px solid #808080; background-color: #CCCCCC;">
                    Valor</td>
            <td class="style71" 
                style="border: 1px solid #808080; background-color: #CCCCCC;">
                %</td>
            <td class="style43" 
                
                style="border: 1px solid #808080; text-align: center; background-color: #CCCCCC;">
                                Valor</td>
            <td class="style50" 
                
                
                
                style="border: 1px solid #808080; text-align: center; background-color: #CCCCCC;">
                    %</td>
            <td class="style40">
                &nbsp;</td>
            <td align="center" class="auto-style7" 
                style="border: 1px solid #808080; background-color: #CCCCCC;">
                    Valor</td>
            <td align="center" class="auto-style9" 
                style="border: 1px solid #808080; background-color: #CCCCCC;">
                    %</td>
            <td align="center" class="style43" 
                style="border: 1px solid #808080; background-color: #CCCCCC;">
                    Valor</td>
            <td class="style16" 
                style="border: 1px solid #808080; background-color: #CCCCCC;">
                %</td>
            <td class="style70" 
                style="border: 1px solid #808080; background-color: #CCCCCC;">
                    Valor</td>
            <td class="style73" 
                
                style="border: 1px solid #808080; text-align: center; background-color: #CCCCCC;">
                %</td>
            <td class="style70" 
                style="border: 1px solid #808080; background-color: #CCCCCC;">
                    Valor</td>
            <td class="style73" 
                
                style="border: 1px solid #808080; text-align: center; background-color: #CCCCCC;">
                %</td>
            <td class="style70" 
                style="border: 1px solid #808080; background-color: #CCCCCC;">
                    Valor</td>
            <td class="style73" 
                
                style="border: 1px solid #808080; text-align: center; background-color: #CCCCCC;">
                %</td>
            <td class="style40">
                &nbsp;</td>
            <td class="style68">
                &nbsp;</td>
            <td class="style67">
                &nbsp;</td>
            <td class="style2">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style53" bgcolor="White">
                &nbsp;Janeiro&nbsp;</td>
            <td class="style33" 
                style="border: 1px solid #808080; background-color: #FFFFFF;">
                    <asp:TextBox ID="txt_vlrVenda_01" runat="server" BorderStyle="None" 
                        Width="70px" style="text-align:right; color: #006600;" ReadOnly="True"></asp:TextBox>
                </td>
            <td class="style37" style="border: 1px solid #808080; padding-right: 2px;" 
                bgcolor="White" align="right">
                    <asp:Label ID="txt_vlrHist_01" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                style="border: 1px solid #808080; padding-right: 2px; text-align: right; background-color: #FFFFFF;" 
                bgcolor="White">
                    <asp:Label ID="txt_percHist_01" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
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
            <td class="style40">
                &nbsp;</td>
            <td class="auto-style8" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="vlrHist_Divergencia_01" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="auto-style10" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="percHist_Divergencia_01" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style37" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:TextBox ID="txt_vlrHist2_01" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; color: #0000FF;" AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style19" 
                style="border: 1px solid #808080; padding-right: 2px; text-align: right; background-color: #FFFFFF;" 
                bgcolor="White">
                    <asp:TextBox ID="txt_percHist2_01" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right;" AutoPostBack="True" 
                        Height="18px" ForeColor="Blue"></asp:TextBox>
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
            <td class="style37" 
                style="border: 1px solid #808080; padding-right: 2px; text-align: right; background-color: #FFFFFF;" 
                bgcolor="White">
                    <asp:Label ID="txt_vlrHist_QM_01" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                style="border: 1px solid #808080; padding-right: 2px; text-align: right; background-color: #FFFFFF;" 
                bgcolor="White">
                    <asp:Label ID="txt_percHist_QM_01" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style37" 
                style="border: 1px solid #808080; padding-right: 2px; text-align: right; background-color: #FFFFFF;" 
                bgcolor="White">
                    <asp:Label ID="txt_vlrHist_QS_01" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                style="border: 1px solid #808080; padding-right: 2px; text-align: right; background-color: #FFFFFF;" 
                bgcolor="White">
                    <asp:Label ID="txt_percHist_QS_01" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style40">
                &nbsp;</td>
            <td class="style68">
                &nbsp;</td>
            <td class="style67">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style52" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                &nbsp;Fevereiro&nbsp;</td>
            <td class="style33" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                    <asp:TextBox ID="txt_vlrVenda_02" runat="server" BorderStyle="None" 
                        Width="70px" style="text-align:right; background-color: #CCFFCC; color: #006600;" 
                    ReadOnly="True"></asp:TextBox>
                </td>
            <td class="style37" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="txt_vlrHist_02" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_02" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
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
            <td class="style40">
                &nbsp;</td>
            <td class="auto-style8" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="vlrHist_Divergencia_02" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="auto-style10" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="percHist_Divergencia_02" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style32" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:TextBox ID="txt_vlrHist2_02" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; background-color: #CCFFCC; color: #0000FF;" 
                    AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style36" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:TextBox ID="txt_percHist2_02" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right; background-color: #CCFFCC;" 
                    AutoPostBack="True" ForeColor="Blue" Height="18px"></asp:TextBox>
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
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist_QM_02" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_QM_02" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist_QS_02" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_QS_02" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style40">
                &nbsp;</td>
            <td class="style68">
                &nbsp;</td>
            <td class="style67">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style52" style="border: 1px solid #808080" bgcolor="White">
                &nbsp;Março&nbsp;</td>
            <td class="style33" 
                style="border: 1px solid #808080; background-color: #FFFFFF;">
                    <asp:TextBox ID="txt_vlrVenda_03" runat="server" BorderStyle="None" 
                        Width="70px" style="text-align:right; color: #006600;" ReadOnly="True"></asp:TextBox>
                </td>
            <td class="style37" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="txt_vlrHist_03" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_03" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
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
            <td class="style40">
                &nbsp;</td>
            <td class="auto-style8" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="vlrHist_Divergencia_03" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="auto-style10" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="percHist_Divergencia_03" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style32" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:TextBox ID="txt_vlrHist2_03" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; color: #0000FF;" AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style36" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:TextBox ID="txt_percHist2_03" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right;" AutoPostBack="True" 
                        Height="18px" ForeColor="Blue"></asp:TextBox>
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
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist_QM_03" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_QM_03" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist_QS_03" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_QS_03" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style40">
                &nbsp;</td>
            <td class="style68">
                &nbsp;</td>
            <td class="style67">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style52" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                &nbsp;Abril&nbsp;</td>
            <td class="style33" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                    <asp:TextBox ID="txt_vlrVenda_04" runat="server" BorderStyle="None" 
                        Width="70px" style="text-align:right; background-color: #CCFFCC; color: #006600;" 
                    ReadOnly="True"></asp:TextBox>
                </td>
            <td class="style37" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="txt_vlrHist_04" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_04" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
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
            <td class="style40">
                &nbsp;</td>
            <td class="auto-style8" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="vlrHist_Divergencia_04" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="auto-style10" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="percHist_Divergencia_04" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style32" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:TextBox ID="txt_vlrHist2_04" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; background-color: #CCFFCC; color: #0000FF;" 
                    AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style36" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:TextBox ID="txt_percHist2_04" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right; background-color: #CCFFCC;" 
                    AutoPostBack="True" ForeColor="Blue" Height="18px"></asp:TextBox>
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
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist_QM_04" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_QM_04" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist_QS_04" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_QS_04" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style40">
                &nbsp;</td>
            <td class="style68">
                &nbsp;</td>
            <td class="style67">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style52" style="border: 1px solid #808080" bgcolor="White">
                &nbsp;Maio&nbsp;</td>
            <td class="style33" 
                style="border: 1px solid #808080; background-color: #FFFFFF;">
                    <asp:TextBox ID="txt_vlrVenda_05" runat="server" BorderStyle="None" 
                        Width="70px" style="text-align:right; color: #006600;" ReadOnly="True"></asp:TextBox>
                </td>
            <td class="style37" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="txt_vlrHist_05" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_05" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
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
            <td class="style40">
                &nbsp;</td>
            <td class="auto-style8" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="vlrHist_Divergencia_05" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="auto-style10" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="percHist_Divergencia_05" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style32" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:TextBox ID="txt_vlrHist2_05" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; color: #0000FF;" AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style36" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:TextBox ID="txt_percHist2_05" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right;" AutoPostBack="True" 
                        Height="18px" ForeColor="Blue"></asp:TextBox>
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
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist_QM_05" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_QM_05" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist_QS_05" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_QS_05" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style40">
                &nbsp;</td>
            <td class="style68">
                &nbsp;</td>
            <td class="style67">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style52" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                &nbsp;Junho&nbsp;</td>
            <td class="style33" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                    <asp:TextBox ID="txt_vlrVenda_06" runat="server" BorderStyle="None" 
                        Width="70px" style="text-align:right; background-color: #CCFFCC; color: #006600;" 
                    ReadOnly="True" Height="18px"></asp:TextBox>
                </td>
            <td class="style37" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="txt_vlrHist_06" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_06" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
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
            <td class="style40">
                &nbsp;</td>
            <td class="auto-style8" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="vlrHist_Divergencia_06" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="auto-style10" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="percHist_Divergencia_06" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style32" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:TextBox ID="txt_vlrHist2_06" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; background-color: #CCFFCC; color: #0000FF;" 
                    AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style36" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:TextBox ID="txt_percHist2_06" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right; background-color: #CCFFCC;" 
                    AutoPostBack="True" ForeColor="Blue" Height="18px"></asp:TextBox>
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
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist_QM_06" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_QM_06" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist_QS_06" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_QS_06" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style40">
                &nbsp;</td>
            <td class="style68">
                &nbsp;</td>
            <td class="style67">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style52" style="border: 1px solid #808080" bgcolor="White">
                &nbsp;Julho&nbsp;</td>
            <td class="style33" 
                style="border: 1px solid #808080; background-color: #FFFFFF;">
                    <asp:TextBox ID="txt_vlrVenda_07" runat="server" BorderStyle="None" 
                        Width="70px" style="text-align:right; color: #006600;" ReadOnly="True"></asp:TextBox>
                </td>
            <td class="style37" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="txt_vlrHist_07" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_07" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
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
            <td class="style40">
                &nbsp;</td>
            <td class="auto-style8" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="vlrHist_Divergencia_07" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="auto-style10" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="percHist_Divergencia_07" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style32" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:TextBox ID="txt_vlrHist2_07" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; color: #0000FF;" AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style36" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:TextBox ID="txt_percHist2_07" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right;" AutoPostBack="True" 
                        Height="18px" ForeColor="Blue"></asp:TextBox>
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
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist_QM_07" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_QM_07" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist_QS_07" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_QS_07" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style40">
                &nbsp;</td>
            <td class="style68">
                &nbsp;</td>
            <td class="style67">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style52" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                &nbsp;Agosto&nbsp;</td>
            <td class="style33" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                    <asp:TextBox ID="txt_vlrVenda_08" runat="server" BorderStyle="None" 
                        Width="70px" style="text-align:right; background-color: #CCFFCC; color: #006600;" 
                    ReadOnly="True"></asp:TextBox>
                </td>
            <td class="style37" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="txt_vlrHist_08" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_08" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
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
            <td class="style40">
                &nbsp;</td>
            <td class="auto-style8" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="vlrHist_Divergencia_08" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="auto-style10" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="percHist_Divergencia_08" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style32" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:TextBox ID="txt_vlrHist2_08" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; background-color: #CCFFCC; color: #0000FF;" 
                    AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style36" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:TextBox ID="txt_percHist2_08" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right; background-color: #CCFFCC;" 
                    AutoPostBack="True" ForeColor="Blue" Height="18px"></asp:TextBox>
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
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist_QM_08" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_QM_08" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist_QS_08" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_QS_08" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style40">
                &nbsp;</td>
            <td class="style68">
                &nbsp;</td>
            <td class="style67">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style52" style="border: 1px solid #808080" bgcolor="White">
                &nbsp;Setembro&nbsp;</td>
            <td class="style33" 
                style="border: 1px solid #808080; background-color: #FFFFFF;">
                    <asp:TextBox ID="txt_vlrVenda_09" runat="server" BorderStyle="None" 
                        Width="70px" style="text-align:right; color: #006600;" ReadOnly="True"></asp:TextBox>
                </td>
            <td class="style37" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="txt_vlrHist_09" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_09" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
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
            <td class="style40">
                &nbsp;</td>
            <td class="auto-style8" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="vlrHist_Divergencia_09" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="auto-style10" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="percHist_Divergencia_09" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style32" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:TextBox ID="txt_vlrHist2_09" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; color: #0000FF;" AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style36" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:TextBox ID="txt_percHist2_09" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right;" AutoPostBack="True" 
                        Height="18px" ForeColor="Blue"></asp:TextBox>
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
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist_QM_09" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_QM_09" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist_QS_09" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_QS_09" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style40">
                &nbsp;</td>
            <td class="style68">
                &nbsp;</td>
            <td class="style67">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style52" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                &nbsp;Outubro&nbsp;</td>
            <td class="style33" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                    <asp:TextBox ID="txt_vlrVenda_10" runat="server" BorderStyle="None" 
                        Width="70px" style="text-align:right; background-color: #CCFFCC; color: #006600;" 
                    ReadOnly="True"></asp:TextBox>
                </td>
            <td class="style37" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="txt_vlrHist_10" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_10" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
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
            <td class="style40">
                &nbsp;</td>
            <td class="auto-style8" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="vlrHist_Divergencia_10" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="auto-style10" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="percHist_Divergencia_10" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style32" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:TextBox ID="txt_vlrHist2_10" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; background-color: #CCFFCC; color: #0000FF;" 
                    AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style36" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:TextBox ID="txt_percHist2_10" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right; background-color: #CCFFCC;" 
                    AutoPostBack="True" ForeColor="Blue" Height="18px"></asp:TextBox>
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
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist_QM_10" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_QM_10" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist_QS_10" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_QS_10" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style40">
                &nbsp;</td>
            <td class="style68">
                &nbsp;</td>
            <td class="style67">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style52" style="border: 1px solid #808080" bgcolor="White">
                &nbsp;Novembro&nbsp;</td>
            <td class="style33" 
                style="border: 1px solid #808080; background-color: #FFFFFF;">
                    <asp:TextBox ID="txt_vlrVenda_11" runat="server" BorderStyle="None" 
                        Width="70px" style="text-align:right; color: #006600;" ReadOnly="True"></asp:TextBox>
                </td>
            <td class="style37" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="txt_vlrHist_11" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_11" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
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
            <td class="style40">
                &nbsp;</td>
            <td class="auto-style8" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="vlrHist_Divergencia_11" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="auto-style10" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="percHist_Divergencia_11" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style32" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:TextBox ID="txt_vlrHist2_11" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; color: #0000FF;" AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style36" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:TextBox ID="txt_percHist2_11" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right;" AutoPostBack="True" 
                        Height="18px" ForeColor="Blue"></asp:TextBox>
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
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist_QM_11" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_QM_11" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist_QS_11" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #FFFFFF; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_QS_11" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style40">
                &nbsp;</td>
            <td class="style68">
                &nbsp;</td>
            <td class="style67">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style52" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                &nbsp;Dezembro&nbsp;</td>
            <td class="style33" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                    <asp:TextBox ID="txt_vlrVenda_12" runat="server" BorderStyle="None" 
                        Width="70px" style="text-align:right; background-color: #CCFFCC; color: #006600;" 
                    ReadOnly="True"></asp:TextBox>
                </td>
            <td class="style37" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="txt_vlrHist_12" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_12" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
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
            <td class="style40">
                &nbsp;</td>
            <td class="auto-style8" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="vlrHist_Divergencia_12" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="auto-style10" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="percHist_Divergencia_12" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style32" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:TextBox ID="txt_vlrHist2_12" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; background-color: #CCFFCC; color: #0000FF;" 
                    AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style36" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:TextBox ID="txt_percHist2_12" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right; background-color: #CCFFCC;" 
                    AutoPostBack="True" ForeColor="Blue" Height="18px"></asp:TextBox>
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
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist_QM_12" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_QM_12" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist_QS_12" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_QS_12" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style40">
                &nbsp;</td>
            <td class="style68">
                &nbsp;</td>
            <td class="style67">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style66">
                &nbsp;</td>
            <td class="style33" 
                style="border: 1px solid #808080; background-color: #CCCCCC;">
                    <asp:TextBox ID="txt_vlrVenda_Total" runat="server" BackColor="#CCCCCC" 
                        BorderStyle="None" style="text-align:right; color: #006600;" Width="70px" 
                    ReadOnly="True" ></asp:TextBox>
                </td>
            <td class="style37" 
                
                style="border: 1px solid #808080; background-color: #CCCCCC; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="txt_vlrHist_Total" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCCCCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_Total" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style37" 
                style="border: 1px solid #808080; background-color: #CCCCCC; text-align: right;">
                    <asp:TextBox ID="lbl_vlrMetaTotal" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; color: #0000FF;" AutoPostBack="True" BackColor="#CCCCCC" ForeColor="Blue"></asp:TextBox>
                </td>
            <td class="style51" 
                
                style="border: 1px solid #808080; background-color: #CCCCCC; padding-right: 2px;" 
                align="right">
                    <asp:TextBox ID="lblCrescAno" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right; color: #0000FF;" AutoPostBack="True" BackColor="#CCCCCC" ForeColor="Blue"></asp:TextBox>
                </td>
            <td class="style40">
                &nbsp;</td>
            <td class="auto-style8" 
                
                style="border: 1px solid #808080; background-color: #CCCCCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="vlrHist_Divergencia_Total" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="auto-style10" 
                
                style="border: 1px solid #808080; background-color: #CCCCCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="percHist_Divergencia_Total" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style32" 
                
                style="border: 1px solid #808080; background-color: #CCCCCC; padding-right: 2px; text-align: right;">
                    <asp:TextBox ID="txt_vlrHist2_Total" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; color: #0000FF;" AutoPostBack="True" BackColor="#CCCCCC" ForeColor="Blue"></asp:TextBox>
                </td>
            <td class="style36" 
                
                style="border: 1px solid #808080; background-color: #CCCCCC; padding-right: 2px; text-align: right;">
                    <asp:TextBox ID="txt_percHist2_Total" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right; color: #0000FF;" AutoPostBack="True" BackColor="#CCCCCC"></asp:TextBox>
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
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #CCCCCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist_QM_Total" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCCCCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_QM_Total" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style39" 
                
                style="border: 1px solid #808080; background-color: #CCCCCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_vlrHist_QS_Total" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style19" 
                
                style="border: 1px solid #808080; background-color: #CCCCCC; padding-right: 2px; text-align: right;">
                    <asp:Label ID="txt_percHist_QS_Total" runat="server" Text="Label" 
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
            <td class="style40">
                &nbsp;</td>
            <td class="style68">
                &nbsp;</td>
            <td class="style67">
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
                <td class="auto-style5">
                    <uc11:wucListaPosicao ID="cboPosicao" runat="server" />
                </td>
                <td class="auto-style6">
                    <asp:Button ID="btnSalvar1" runat="server" Text="Salvar" />
                </td>
                <td bgcolor="Red" style="color: #FFFFFF" class="auto-style4">
                    A meta da Agenda 23 deverá ser digitada negativo com o sinal de - na frente.</td>
                <td>
                    &nbsp;</td>
                <td class="auto-style3">
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
                                        <b>Calendário</b></td>
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
                                    <td class="style75" 
                                        style="background-color: #3399FF; color: #FFFFFF; text-align: center">
                                        Relatórios</td>
                                </tr>
                                <tr>
                                    <td align="left" class="style59">
                    <dxe:ASPxButton ID="btnConsultarMes" runat="server" 
                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                        Text="01 - Relatório Mês" HorizontalAlign="Left" Width="195px">
                    </dxe:ASPxButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" class="style74">
                    <dxe:ASPxButton ID="btnConsultarAno" runat="server" 
                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                        Text="02 - Relatório Ano" HorizontalAlign="Left" Width="195px">
                    </dxe:ASPxButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" class="style59">
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="left" class="style59">
                                        <br />
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
                    <asp:Label ID="lblVenda" runat="server" Text="Label" Visible ="false"></asp:Label>
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

