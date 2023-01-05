<%@ Page Title="Cadastro de Metas por Comprador" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Coml_frmCadVendaSecao.aspx.vb" Inherits="MemberPages_Planejamento_Vendas_Coml_frmCadVendaSecao" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<%@ Register src="../../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc7" %>
<%@ Register src="../../../Controles/wuciListaLojasComApoio.ascx" tagname="wuciListaLojasComApoio" tagprefix="uc8" %>
<%@ Register src="../../../Controles/wucListaCompradorSecao.ascx" tagname="wucListaCompradorSecao" tagprefix="uc9" %>

<%@ Register src="../../../Controles/wucListaPosicao.ascx" tagname="wucListaPosicao" tagprefix="uc6" %>
<%@ Register src="../../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc10" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
       

    <style type="text/css"> 
        
      #moldura {
            width:1000px; 
            margin: 0 auto ;                      
        }

        #divAno {
            float: left;
            margin-left: 2px;
        }

        #divFilial {
            float: left;
            margin-left: 2px;
        }

        #divSecao {
            float: left;
            margin-left: 2px;
            width: 200px;
        }

        #divBotaoAtualizar {
            float: left;
            padding-left: 10px;
            margin-left: 10px;
        }        
            
        #divAnalise {
            clear: both;
            Float: left;
            padding-left: -20px;  
            margin-top: 10px;
            width: 810px;          
        }

        #divRelatorios {            
            Float: left;              
            margin-top: 10px;
            width: 180px;          
        }

        #divDados {
            clear: both;
            Float: left;
            margin-left: 2px;  
            width: 900px;                      
        }

        #divCalendario {
            clear: both;
            Float: left;
            margin-left: 2px;            
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
        .style40    /*Exclua-me depois*/
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
            width: 5px;     /*Exclua-me depois*/
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
        .style49    /*Exclua-me depois*/
        {
            width: 8px;
        }
        .style34
        {
            width: 198px;
        }
        
        
        /***** LEGENDAS ********
         TB = TextBox         
         B = Branco
         V = Verde
         C = Cinza
         ***********************/  
        .style37    /*Formatação para os TextBox - Fundo BRANCO*/
        {
            width: 69px;
            text-align:right;
            padding-right: 2px;
            border: 1px solid #808080;
            background-color: #FFFFFF;
            font-family: Arial, Helvetica, sans-serif; font-size: small;
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
        .Divisoria {
            width: 1px;            
        }            
        .TB_Vlr_B {
            width: 65px;
            text-align:right;
            color: #0000FF;                 
        }
         .TB_Perc_B {
            width: 50px;
            text-align:right;
            color: #0000FF;                 
        }
       .TB_Vlr_V {
            width: 65px;
            text-align:right;
            color: #0000FF;
            background-color: #CCFFCC;                  
        } 
         .TB_Perc_V {
            width: 50px;
            text-align:right;
            color: #0000FF;  
            background-color: #CCFFCC;                           
        }                       
        .VendaAno_B {
            color:#006600; 
            width: 70px;                       
        }
        .PartVendaAno_B {
            color:#006600; 
            width: 50px;                       
        } 
       .DescMes_B
        {
            color: #000000;
            background-color:#FFFFFF;
            border: 1px solid #808080;
            padding-left: 4px; 
        }
        .DescMes_V
        {
            color: #000000;
            background-color:#CCFFCC;
            border: 1px solid #808080;
            padding-left: 4px; 
        }    
        .Cabecalho_Vlr
        {            
            color: #FFFFFF;
            text-align: center;
            background-color: #000099;
            border: 1px solid #808080;              
        }           
        .Cabecalho_V
        {            
            color: #FFFFFF;
            text-align: center;
            background-color: #009900;
            border: 1px solid #808080;            
        }           
         
        .style19    /*Excluir Depois*/
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
        }
        .style53    /*Excluir Depois*/
        {
            color: #000000;
            border: 1px solid #808080;
        }
 
        .style54
        {
            width: 100%;
        }      
        .style56
        {
            width: 280px;
        }
        .style58
        {            
            border: 1px solid gray;
        }
        .style59
        {
            width: 490px;
            height: 36px;
            font-size: 20px;
            padding-left: -10px;
        }
        .style60
        {
            width: 452px;
        }
        .style61
        {
            width: 10px;
        }
        .auto-style11 {
            color: #FFFFFF;
            text-align: center;
            background-color: #009900;
            border: 1px solid #808080;
            width: 47px;
        }
        .auto-style12 {
            width: 47px;
            text-align: right;
            padding-right: 2px;
            border: 1px solid #808080;
            background-color: #FFFFFF;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
        }
        .auto-style13 {
            width: 94px;
            text-align: right;
            padding-right: 2px;
            border: 1px solid #808080;
            background-color: #CCFFCC;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
        }
        .auto-style14 {
            width: 47px;
            text-align: right;
            padding-right: 2px;
            border: 1px solid #808080;
            background-color: #CCCCCC;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
        }
        .auto-style15 {
            width: 47px;
            text-align: right;
            padding-right: 2px;
            border: 1px solid #808080;
            background-color: #CCFFCC;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
        }
        .auto-style16 {
            color: #FFFFFF;
            text-align: center;
            background-color: #009900;
            border: 1px solid #808080;
            width: 94px;
        }
        .auto-style17 {
            width: 94px;
            text-align: right;
            padding-right: 2px;
            border: 1px solid #808080;
            background-color: #FFFFFF;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
        }
        .auto-style18 {
            width: 94px;
            text-align: right;
            padding-right: 2px;
            border: 1px solid #808080;
            background-color: #CCCCCC;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
        }
        .auto-style19 {
            color: #000000;
            background-color: #FFFFFF;
            border: 1px solid #808080;
            padding-left: 4px;
            height: 18px;
            width: 114px;
        }
        .auto-style20 {
            width: 69px;
            text-align: right;
            padding-right: 2px;
            border: 1px solid #808080;
            background-color: #FFFFFF;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
            height: 18px;
        }
        .auto-style21 {
            width: 1px;
            height: 18px;
        }
        .auto-style22 {
            width: 94px;
            text-align: right;
            padding-right: 2px;
            border: 1px solid #808080;
            background-color: #FFFFFF;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
            height: 18px;
        }
        .auto-style23 {
            width: 47px;
            text-align: right;
            padding-right: 2px;
            border: 1px solid #808080;
            background-color: #FFFFFF;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
            height: 18px;
        }
        .auto-style26 {
            color: #FFFFFF;
            text-align: center;
            background-color: #000099;
            border: 1px solid #808080;
            width: 114px;
        }
        .auto-style27 {
            color: #000000;
            background-color: #FFFFFF;
            border: 1px solid #808080;
            padding-left: 4px;
            width: 114px;
        }
        .auto-style28 {
            color: #000000;
            background-color: #CCFFCC;
            border: 1px solid #808080;
            padding-left: 4px;
            width: 114px;
        }
        .auto-style29 {
            width: 114px;
        }
        .auto-style30 {
            color: #FFFFFF;
            text-align: center;
            background-color: #000099;
            border: 1px solid #808080;
            width: 80px;
        }
        .auto-style31 {
            width: 80px;
            text-align: right;
            padding-right: 2px;
            border: 1px solid #808080;
            background-color: #FFFFFF;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
        }
        .auto-style32 {
            width: 80px;
            text-align: right;
            padding-right: 2px;
            border: 1px solid #808080;
            background-color: #CCFFCC;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
        }
        .auto-style33 {
            width: 80px;
            text-align: right;
            padding-right: 2px;
            border: 1px solid #808080;
            background-color: #FFFFFF;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
            height: 18px;
        }
        .auto-style34 {
            width: 80px;
            text-align: right;
            padding-right: 2px;
            border: 1px solid #808080;
            background-color: #CCCCCC;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
        }
        .auto-style35 {
            color: #FFFFFF;
            text-align: center;
            background-color: #000099;
            border: 1px solid #808080;
            width: 77px;
        }
        .auto-style36 {
            width: 77px;
            text-align: right;
            padding-right: 2px;
            border: 1px solid #808080;
            background-color: #FFFFFF;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
        }
        .auto-style37 {
            width: 77px;
            text-align: right;
            padding-right: 2px;
            border: 1px solid #808080;
            background-color: #CCFFCC;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
        }
        .auto-style38 {
            width: 77px;
            text-align: right;
            padding-right: 2px;
            border: 1px solid #808080;
            background-color: #FFFFFF;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
            height: 18px;
        }
        .auto-style39 {
            width: 77px;
            text-align: right;
            padding-right: 2px;
            border: 1px solid #808080;
            background-color: #CCCCCC;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
        }
        .auto-style40 {
            color: #FFFFFF;
            text-align: center;
            background-color: #000099;
            border: 1px solid #808080;
            width: 84px;
        }
        .auto-style41 {
            width: 84px;
            text-align: right;
            padding-right: 2px;
            border: 1px solid #808080;
            background-color: #FFFFFF;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
        }
        .auto-style42 {
            width: 84px;
            text-align: right;
            padding-right: 2px;
            border: 1px solid #808080;
            background-color: #CCFFCC;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
        }
        .auto-style43 {
            width: 84px;
            text-align: right;
            padding-right: 2px;
            border: 1px solid #808080;
            background-color: #FFFFFF;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
            height: 18px;
        }
        .auto-style44 {
            width: 84px;
            text-align: right;
            padding-right: 2px;
            border: 1px solid #808080;
            background-color: #CCCCCC;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="moldura">
        <table cellspacing="1" class="style1" style="width: 94%">
            <tr>
                <td class="style6">
                    <uc7:wucAno ID="cboAno" runat="server" />
                </td>
                <td class="style65">
                    <uc8:wuciListaLojasComApoio ID="cboFilial" runat="server" />
                </td>
                <td class="style7">
                    <uc9:wucListaCompradorSecao ID="cboComprador" runat="server" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>

        <div id="divDados">
    <table class="style9">

        <tr>
            <td class="auto-style26">Mês</td>
            <td class="auto-style30"><asp:Label ID="txt_Titulo_Hist3" Text="?" runat="server" BorderStyle="None" Width="65px" ></asp:Label></td>
            <td class="Cabecalho_Vlr">Partic.</td>
            <td class="auto-style35"><asp:Label ID="txt_Titulo_Hist2" Text="?" runat="server" BorderStyle="None" Width="65px" ></asp:Label></td>
            <td class="Cabecalho_Vlr">Partic.</td>
            <td class="auto-style40"><asp:Label ID="txt_Titulo_Hist1" Text="?" runat="server" BorderStyle="None" Width="65px" ></asp:Label></td>
            <td class="Cabecalho_Vlr">Partic.</td>           
               <%--Espaçamento--%><td class="Divisoria"></td>  
            <td class="auto-style16">Meta</td>               
            <td class="auto-style11"><asp:Label ID="lblCrescLegenda_M1" Text="?" runat="server" BorderStyle="None" Width="65px" ></asp:Label></td>
            <td class="Cabecalho_V">Partic.</td> 
               <%--Espaçamento--%><td class="Divisoria"></td>              
               <%--Espaçamento--%>                      
            <td class="Cabecalho_Vlr"><asp:Label ID="lblCrescLegenda_M3" Text="?" runat="server" BorderStyle="None" Width="45px" ></asp:Label></td>
            <td class="Cabecalho_Vlr"><asp:Label ID="lblCrescLegenda_M2" Text="?" runat="server" BorderStyle="None" Width="45px" ></asp:Label></td>
            <td class="Cabecalho_V"><asp:Label ID="lblCrescLegenda_M4" Text="?" runat="server" BorderStyle="None" Width="45px" ></asp:Label></td>
        </tr> <%--Cabeçalho--%><%--******************** J A N E I R O *************************************************************************--%>
        <tr>
            <td class="auto-style27">Janeiro</td>
            <td class="auto-style31" ><asp:Label ID="txt_vlrHist3_01" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_percHist3_01" runat="server" Text="?"></asp:Label></td>
            <td class="auto-style36" ><asp:Label ID="txt_vlrHist2_01" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_percHist2_01" runat="server" Text="?"></asp:Label></td>
            <td class="auto-style41" ><asp:Label ID="txt_vlrHist1_01" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_percHist1_01" runat="server" Text="?"></asp:Label></td>                            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="auto-style17"><asp:TextBox ID="txt_vlrMeta01" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" onfocus="this.select();" CssClass="TB_Vlr_B"></asp:TextBox></td>
            <td class="auto-style12"><asp:TextBox ID="txt_percCresc01" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" onfocus="this.select();" CssClass="TB_Perc_B"></asp:TextBox></td>               
            <td class="style37"><asp:Label ID="txt_percMeta01" Text="?" runat="server"></asp:Label></td>            
               <%--Espaçamento--%><td class="Divisoria"></td>
               <%--Espaçamento--%>
            <td class="style37"><asp:Label ID="lblCresc01_M3" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="style37"><asp:Label ID="lblCresc01_M2" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="style37"><asp:Label ID="lblCresc01_M1" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>                    
        </tr> <%--Mes 01--%><%--******************** F E V E R E I R O *************************************************************************--%>
        <tr>
            <td class="auto-style28">Fevereiro</td>
            <td class="auto-style32" ><asp:Label ID="txt_vlrHist3_02" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist3_02" runat="server" Text="?"></asp:Label></td>
            <td class="auto-style37" ><asp:Label ID="txt_vlrHist2_02" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist2_02" runat="server" Text="?"></asp:Label></td>
            <td class="auto-style42" ><asp:Label ID="txt_vlrHist1_02" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist1_02" runat="server" Text="?"></asp:Label></td>                            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="auto-style13"><asp:TextBox ID="txt_vlrMeta02" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" onfocus="this.select();" CssClass="TB_Vlr_V"></asp:TextBox></td>
            <td class="auto-style15"><asp:TextBox ID="txt_percCresc02" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" onfocus="this.select();" CssClass="TB_Perc_V"></asp:TextBox></td>               
            <td class="Padrao_V"><asp:Label ID="txt_percMeta02" Text="?" runat="server"></asp:Label></td>            
               <%--Espaçamento--%><td class="Divisoria"></td>
               <%--Espaçamento--%>
            <td class="Padrao_V"><asp:Label ID="lblCresc02_M3" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="lblCresc02_M2" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="lblCresc02_M1" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
        </tr> <%--Mes 02--%><%--******************** M A R Ç O *************************************************************************--%>        
        <tr>
             <td class="auto-style19">Março</td>
            <td class="auto-style33" ><asp:Label ID="txt_vlrHist3_03" runat="server" Text="?"></asp:Label></td>
            <td class="auto-style20" ><asp:Label ID="txt_percHist3_03" runat="server" Text="?"></asp:Label></td>
            <td class="auto-style38" ><asp:Label ID="txt_vlrHist2_03" runat="server" Text="?"></asp:Label></td>
            <td class="auto-style20" ><asp:Label ID="txt_percHist2_03" runat="server" Text="?"></asp:Label></td>
            <td class="auto-style43" ><asp:Label ID="txt_vlrHist1_03" runat="server" Text="?"></asp:Label></td>
            <td class="auto-style20" ><asp:Label ID="txt_percHist1_03" runat="server" Text="?"></asp:Label></td>                            
               <%--Espaçamento--%><td class="auto-style21"></td>
            <td class="auto-style22"><asp:TextBox ID="txt_vlrMeta03" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" onfocus="this.select();" CssClass="TB_Vlr_B"></asp:TextBox></td>
            <td class="auto-style23"><asp:TextBox ID="txt_percCresc03" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" onfocus="this.select();" CssClass="TB_Perc_B"></asp:TextBox></td>               
            <td class="auto-style20"><asp:Label ID="txt_percMeta03" Text="?" runat="server"></asp:Label></td>            
               <%--Espaçamento--%><td class="auto-style21"></td>
               <%--Espaçamento--%>
            <td class="auto-style20"><asp:Label ID="lblCresc03_M3" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="auto-style20"><asp:Label ID="lblCresc03_M2" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="auto-style20"><asp:Label ID="lblCresc03_M1" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
        </tr> <%--Mes 03--%><%--******************** A B R I L *************************************************************************--%>        
        <tr>
            <td class="auto-style28">Abril</td>
            <td class="auto-style32" ><asp:Label ID="txt_vlrHist3_04" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist3_04" runat="server" Text="?"></asp:Label></td>
            <td class="auto-style37" ><asp:Label ID="txt_vlrHist2_04" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist2_04" runat="server" Text="?"></asp:Label></td>
            <td class="auto-style42" ><asp:Label ID="txt_vlrHist1_04" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist1_04" runat="server" Text="?"></asp:Label></td>                            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="auto-style13"><asp:TextBox ID="txt_vlrMeta04" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" onfocus="this.select();" CssClass="TB_Vlr_V"></asp:TextBox></td>
            <td class="auto-style15"><asp:TextBox ID="txt_percCresc04" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" onfocus="this.select();" CssClass="TB_Perc_V"></asp:TextBox></td>               
            <td class="Padrao_V"><asp:Label ID="txt_percMeta04" Text="?" runat="server"></asp:Label></td>            
               <%--Espaçamento--%><td class="Divisoria"></td>
               <%--Espaçamento--%>
            <td class="Padrao_V"><asp:Label ID="lblCresc04_M3" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="lblCresc04_M2" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="lblCresc04_M1" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
        </tr> <%--Mes 04--%><%--******************** M A I O *************************************************************************--%>  
        <tr>
            <td class="auto-style27">Maio</td>
            <td class="auto-style31" ><asp:Label ID="txt_vlrHist3_05" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_percHist3_05" runat="server" Text="?"></asp:Label></td>
            <td class="auto-style36" ><asp:Label ID="txt_vlrHist2_05" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_percHist2_05" runat="server" Text="?"></asp:Label></td>
            <td class="auto-style41" ><asp:Label ID="txt_vlrHist1_05" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_percHist1_05" runat="server" Text="?"></asp:Label></td>                            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="auto-style17"><asp:TextBox ID="txt_vlrMeta05" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" onfocus="this.select();" CssClass="TB_Vlr_B"></asp:TextBox></td>
            <td class="auto-style12"><asp:TextBox ID="txt_percCresc05" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" onfocus="this.select();" CssClass="TB_Perc_B"></asp:TextBox></td>               
            <td class="style37"><asp:Label ID="txt_percMeta05" Text="?" runat="server"></asp:Label></td>            
               <%--Espaçamento--%><td class="Divisoria"></td>
               <%--Espaçamento--%>
            <td class="style37"><asp:Label ID="lblCresc05_M3" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="style37"><asp:Label ID="lblCresc05_M2" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="style37"><asp:Label ID="lblCresc05_M1" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
        </tr> <%--Mes 05--%><%--******************** J U N H O *************************************************************************--%>  
        <tr>
            <td class="auto-style28">Junho</td>
            <td class="auto-style32" ><asp:Label ID="txt_vlrHist3_06" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist3_06" runat="server" Text="?"></asp:Label></td>
            <td class="auto-style37" ><asp:Label ID="txt_vlrHist2_06" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist2_06" runat="server" Text="?"></asp:Label></td>
            <td class="auto-style42" ><asp:Label ID="txt_vlrHist1_06" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist1_06" runat="server" Text="?"></asp:Label></td>                            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="auto-style13"><asp:TextBox ID="txt_vlrMeta06" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" onfocus="this.select();" CssClass="TB_Vlr_V"></asp:TextBox></td>
            <td class="auto-style15"><asp:TextBox ID="txt_percCresc06" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" onfocus="this.select();" CssClass="TB_Perc_V"></asp:TextBox></td>               
            <td class="Padrao_V"><asp:Label ID="txt_percMeta06" Text="?" runat="server"></asp:Label></td>            
               <%--Espaçamento--%><td class="Divisoria"></td>
               <%--Espaçamento--%>
            <td class="Padrao_V"><asp:Label ID="lblCresc06_M3" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="lblCresc06_M2" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="lblCresc06_M1" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
        </tr> <%--Mes 06--%><%--******************** J U L H O *************************************************************************--%>  
        <tr>
            <td class="auto-style27">Julho</td>
            <td class="auto-style31" ><asp:Label ID="txt_vlrHist3_07" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_percHist3_07" runat="server" Text="?"></asp:Label></td>
            <td class="auto-style36" ><asp:Label ID="txt_vlrHist2_07" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_percHist2_07" runat="server" Text="?"></asp:Label></td>
            <td class="auto-style41" ><asp:Label ID="txt_vlrHist1_07" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_percHist1_07" runat="server" Text="?"></asp:Label></td>                            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="auto-style17"><asp:TextBox ID="txt_vlrMeta07" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" onfocus="this.select();" CssClass="TB_Vlr_B"></asp:TextBox></td>
            <td class="auto-style12"><asp:TextBox ID="txt_percCresc07" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" onfocus="this.select();" CssClass="TB_Perc_B"></asp:TextBox></td>               
            <td class="style37"><asp:Label ID="txt_percMeta07" Text="?" runat="server"></asp:Label></td>            
               <%--Espaçamento--%><td class="Divisoria"></td>
               <%--Espaçamento--%>
            <td class="style37"><asp:Label ID="lblCresc07_M3" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="style37"><asp:Label ID="lblCresc07_M2" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="style37"><asp:Label ID="lblCresc07_M1" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
        </tr> <%--Mes 07--%><%--******************** A G O S T O *************************************************************************--%>  
        <tr>
            <td class="auto-style28">Agosto</td>
            <td class="auto-style32" ><asp:Label ID="txt_vlrHist3_08" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist3_08" runat="server" Text="?"></asp:Label></td>
            <td class="auto-style37" ><asp:Label ID="txt_vlrHist2_08" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist2_08" runat="server" Text="?"></asp:Label></td>
            <td class="auto-style42" ><asp:Label ID="txt_vlrHist1_08" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist1_08" runat="server" Text="?"></asp:Label></td>                            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="auto-style13"><asp:TextBox ID="txt_vlrMeta08" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" onfocus="this.select();" CssClass="TB_Vlr_V"></asp:TextBox></td>
            <td class="auto-style15"><asp:TextBox ID="txt_percCresc08" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" onfocus="this.select();" CssClass="TB_Perc_V"></asp:TextBox></td>               
            <td class="Padrao_V"><asp:Label ID="txt_percMeta08" Text="?" runat="server"></asp:Label></td>            
               <%--Espaçamento--%><td class="Divisoria"></td>
               <%--Espaçamento--%>
            <td class="Padrao_V"><asp:Label ID="lblCresc08_M3" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="lblCresc08_M2" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="lblCresc08_M1" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>            
        </tr> <%--Mes 08--%><%--******************** S E T E M B R O *************************************************************************--%>  
        <tr>
            <td class="auto-style27">Setembro</td>
            <td class="auto-style31" ><asp:Label ID="txt_vlrHist3_09" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_percHist3_09" runat="server" Text="?"></asp:Label></td>
            <td class="auto-style36" ><asp:Label ID="txt_vlrHist2_09" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_percHist2_09" runat="server" Text="?"></asp:Label></td>
            <td class="auto-style41" ><asp:Label ID="txt_vlrHist1_09" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_percHist1_09" runat="server" Text="?"></asp:Label></td>                            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="auto-style17"><asp:TextBox ID="txt_vlrMeta09" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" onfocus="this.select();" CssClass="TB_Vlr_B"></asp:TextBox></td>
            <td class="auto-style12"><asp:TextBox ID="txt_percCresc09" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" onfocus="this.select();" CssClass="TB_Perc_B"></asp:TextBox></td>               
            <td class="style37"><asp:Label ID="txt_percMeta09" Text="?" runat="server"></asp:Label></td>            
               <%--Espaçamento--%><td class="Divisoria"></td>
               <%--Espaçamento--%>
            <td class="style37"><asp:Label ID="lblCresc09_M3" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="style37"><asp:Label ID="lblCresc09_M2" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="style37"><asp:Label ID="lblCresc09_M1" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
        </tr> <%--Mes 09--%><%--******************** O U T U B R O *************************************************************************--%>  
        <tr>
            <td class="auto-style28">Outubro</td>
            <td class="auto-style32" ><asp:Label ID="txt_vlrHist3_10" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist3_10" runat="server" Text="?"></asp:Label></td>
            <td class="auto-style37" ><asp:Label ID="txt_vlrHist2_10" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist2_10" runat="server" Text="?"></asp:Label></td>
            <td class="auto-style42" ><asp:Label ID="txt_vlrHist1_10" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist1_10" runat="server" Text="?"></asp:Label></td>                            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="auto-style13"><asp:TextBox ID="txt_vlrMeta10" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" onfocus="this.select();" CssClass="TB_Vlr_V"></asp:TextBox></td>
            <td class="auto-style15"><asp:TextBox ID="txt_percCresc10" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" onfocus="this.select();" CssClass="TB_Perc_V"></asp:TextBox></td>               
            <td class="Padrao_V"><asp:Label ID="txt_percMeta10" Text="?" runat="server"></asp:Label></td>            
               <%--Espaçamento--%><td class="Divisoria"></td>
               <%--Espaçamento--%>
            <td class="Padrao_V"><asp:Label ID="lblCresc10_M3" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="lblCresc10_M2" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="lblCresc10_M1" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>            
        </tr> <%--Mes 10--%><%--******************** N O V E M B R O *************************************************************************--%>  
        <tr>
            <td class="auto-style27">Novembro</td>
            <td class="auto-style31" ><asp:Label ID="txt_vlrHist3_11" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_percHist3_11" runat="server" Text="?"></asp:Label></td>
            <td class="auto-style36" ><asp:Label ID="txt_vlrHist2_11" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_percHist2_11" runat="server" Text="?"></asp:Label></td>
            <td class="auto-style41" ><asp:Label ID="txt_vlrHist1_11" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_percHist1_11" runat="server" Text="?"></asp:Label></td>                            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="auto-style17"><asp:TextBox ID="txt_vlrMeta11" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" onfocus="this.select();" CssClass="TB_Vlr_B"></asp:TextBox></td>
            <td class="auto-style12"><asp:TextBox ID="txt_percCresc11" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" onfocus="this.select();" CssClass="TB_Perc_B"></asp:TextBox></td>               
            <td class="style37"><asp:Label ID="txt_percMeta11" Text="?" runat="server"></asp:Label></td>            
               <%--Espaçamento--%><td class="Divisoria"></td>
               <%--Espaçamento--%>
            <td class="style37"><asp:Label ID="lblCresc11_M3" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="style37"><asp:Label ID="lblCresc11_M2" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="style37"><asp:Label ID="lblCresc11_M1" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
        </tr> <%--Mes 11--%><%--******************** D E Z E M B R O *************************************************************************--%>  
        <tr> 
            <td class="auto-style28">Dezembro</td>
            <td class="auto-style32" ><asp:Label ID="txt_vlrHist3_12" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist3_12" runat="server" Text="?"></asp:Label></td>
            <td class="auto-style37" ><asp:Label ID="txt_vlrHist2_12" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist2_12" runat="server" Text="?"></asp:Label></td>
            <td class="auto-style42" ><asp:Label ID="txt_vlrHist1_12" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist1_12" runat="server" Text="?"></asp:Label></td>                            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="auto-style13"><asp:TextBox ID="txt_vlrMeta12" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" onfocus="this.select();" CssClass="TB_Vlr_V"></asp:TextBox></td>
            <td class="auto-style15"><asp:TextBox ID="txt_percCresc12" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" onfocus="this.select();" CssClass="TB_Perc_V"></asp:TextBox></td>               
            <td class="Padrao_V"><asp:Label ID="txt_percMeta12" Text="?" runat="server"></asp:Label></td>            
               <%--Espaçamento--%><td class="Divisoria"></td>
               <%--Espaçamento--%>
            <td class="Padrao_V"><asp:Label ID="lblCresc12_M3" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="lblCresc12_M2" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="lblCresc12_M1" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
        </tr> <%--Mes 12--%>

        <tr>
            <td class="auto-style29">&nbsp;</td>
            <td class="auto-style34"><asp:Label ID="txt_vlrHist3_Total" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_C"><asp:Label ID="txt_percHist3_Total" runat="server" Text="?"></asp:Label></td>
            <td class="auto-style39"><asp:Label ID="txt_vlrHist2_Total" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_C"><asp:Label ID="txt_percHist2_Total" runat="server" Text="?"></asp:Label></td>
            <td class="auto-style44"><asp:Label ID="txt_vlrHist1_Total" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_C"><asp:Label ID="txt_percHist1_Total" runat="server" Text="?"></asp:Label></td>
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="auto-style18"><asp:Label ID="txt_vlrMetaTotal" runat="server" Text="?"></asp:Label></td>
            <td class="auto-style14"><asp:Label ID="lblCrescAno" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_C"><asp:Label ID="txt_percMetaTotal" runat="server" Text="?"></asp:Label></td>
               <%--Espaçamento--%><td class="Divisoria"></td>
               <%--Espaçamento--%>
            <td class="Padrao_C"><asp:Label ID="lblCrescAno_M3" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_C"><asp:Label ID="lblCrescAno_M2" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_C"><asp:Label ID="lblCrescAno_M1" runat="server" Text="?"></asp:Label></td> 
        </tr> <%--Totais--%>
    </table>

        <table cellspacing="1" class="style54">
            <tr>
                <td class="style55">
                    <uc6:wucListaPosicao ID="cboPosicao" runat="server" />
                </td>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Button ID="btnSalvar1" runat="server" Text="Salvar" />
                </td>
                <td>
                <asp:Label ID="lblDepto" runat="server" Text="Label" BackColor="#FFFF99" 
                        ForeColor="#0066FF" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>

    </div>

        <div id="divAnalise">
                                    <dx:ASPxGridView ID="gridAnalise" runat="server" DataSourceID="dsAnaliseMeta" AutoGenerateColumns="False">
                                        <TotalSummary>
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAA2" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAA1" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescAA2_AA1" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescAA1_Real" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescMeta" SummaryType="Custom" />
                                        </TotalSummary>
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="Mes" VisibleIndex="0" SortIndex="0" SortOrder="Ascending">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="vlrVendaAA2" VisibleIndex="1" Width="90px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="vlrVendaAA1" VisibleIndex="2" Width="90px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="vlrVenda" ReadOnly="True" VisibleIndex="4" Width="90px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <CellStyle ForeColor="Blue">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="Blue">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="vlrMeta" ReadOnly="True" VisibleIndex="6" Width="90px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#336600" ForeColor="White" />
                                                <CellStyle ForeColor="#336600">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="#336600">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percCrescAA2_AA1" ReadOnly="True" VisibleIndex="3" Caption="% Cresc">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percCrescAA1_Real" ReadOnly="True" VisibleIndex="5">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="percCrescMeta" ReadOnly="True" VisibleIndex="7">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <SettingsPager Mode="ShowAllRecords">
                                        </SettingsPager>
                                        <Settings ShowFooter="True" ShowTitlePanel="True" />
                                        <SettingsText Title="Análise de Venda Mensal da Loja" />
                                        <Styles>
                                            <Header HorizontalAlign="Center">
                                            </Header>
                                            <AlternatingRow BackColor="#EAEAEA">
                                            </AlternatingRow>
                                            <Footer Font-Bold="True">
                                            </Footer>
                                            <TitlePanel Font-Size="X-Large">
                                            </TitlePanel>
                                        </Styles>
                                    </dx:ASPxGridView>
                                    <asp:SqlDataSource ID="dsAnaliseMeta" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="Metas.uspPlanejamento_AnaliseMetaVendaMesComercial" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
        </div>

        <div id="divRelatorios">
            <table cellspacing="1" class="style58">
                                <tr>
                                    <td class="style59" 
                                        style="background-color:#808080; color: #FFFFFF; text-align: center" >
                                        Relatórios</td>
                                </tr>
                                <tr>
                                    <td align="left" >
                                                        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/MemberPages/Planejamento/Vendas/viewOrcamentoVendasSecao.aspx" Target="_blank">01 - Vendas por Mês</asp:HyperLink>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" >
                                                        <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/MemberPages/Planejamento/Vendas/viewOrcamentoVendasSecaoAno.aspx" Target="_blank">02 - Venda por Ano</asp:HyperLink>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" >
                                        <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/MemberPages/Planejamento/Consulta12Meses.aspx" Target="_blank">03 - Relatório 12 meses</asp:HyperLink>
                                    </td>
                                </tr>
                            </table>
        </div>
                
        <div id="divCalendario">

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
                                        <uc10:wuciListaMes ID="cboMes" runat="server" />
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
                <td valign="top" class="style60" style="vertical-align: top">
                           
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
                <asp:Label ID="lblVenda01" runat="server" Text="Label" Visible="False"></asp:Label>
                    <br />
                <asp:Label ID="lblVenda02" runat="server" Text="Label" Visible="False"></asp:Label>
                    <br />
                <asp:Label ID="lblVenda03" runat="server" Text="Label" Visible="False"></asp:Label>
                    <br />
                <asp:Label ID="lblVenda04" runat="server" Text="Label" Visible="False"></asp:Label>
                    <br />
                <asp:Label ID="lblVenda05" runat="server" Text="Label" Visible="False"></asp:Label>
                    <br />
                <asp:Label ID="lblVenda06" runat="server" Text="Label" Visible="False"></asp:Label>
                    <br />
                <asp:Label ID="lblVenda07" runat="server" Text="Label" Visible="False"></asp:Label>
                    <br />
                <asp:Label ID="lblVenda08" runat="server" Text="Label" Visible="False"></asp:Label>
                    <br />
                <asp:Label ID="lblVenda09" runat="server" Text="Label" Visible="False"></asp:Label>
                    <br />
                <asp:Label ID="lblVenda10" runat="server" Text="Label" Visible="False"></asp:Label>
                    <br />
                <asp:Label ID="lblVenda11" runat="server" Text="Label" Visible="False"></asp:Label>
                    <br />
                <asp:Label ID="lblVenda12" runat="server" Text="Label" Visible="False"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lblError" runat="server" Text="Label"></asp:Label>
                    <br />
                    <asp:Label ID="lblInfo" runat="server" Text="lblInfo"></asp:Label>
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
    </div>
       
    </div>

</asp:Content>

