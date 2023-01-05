<%@ Page Title="Cadastro de Metas de Venda - Orçamento" Language="VB" MasterPageFile="~/MemberPages/SiteOrcamento.master" AutoEventWireup="false" CodeFile="frmCadVendaSecao.aspx.vb" Inherits="MemberPages_Planejamento_Vendas_frmCadVendaSecao" Culture="pt-BR" uiCulture="pt-BR" %>



<%@ Register src="../../../Controles/wucListaSecao.ascx" tagname="wucListaSecao" tagprefix="uc3" %>

<%@ Register src="../../../Controles/wucListaPosicao.ascx" tagname="wucListaPosicao" tagprefix="uc4" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<%@ Register src="../../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>
<%@ Register src="../../../Controles/wuciListaLojasComApoio.ascx" tagname="wuciListaLojasComApoio" tagprefix="uc2" %>
<%@ Register src="../../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc5" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    

    <style type="text/css">               
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
        .auto-style3 {
            color: #FFFFFF;
            text-align: center;
            background-color: #000099;
            border: 1px solid #808080;
            width: 69px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
        <table class="style1" style="width: 94%">
            <tr>
                <td width: 177px;>
                    <uc1:wucAno ID="cboAno" runat="server" />
                </td>
                <td><uc2:wuciListaLojasComApoio ID="cboFilial" runat="server" /></td>
                <td width: 325px;><uc3:wucListaSecao ID="cboSecao" runat="server" /></td>
                <td></td>
            </tr>
        </table>
        <table class="style9">
            <tr>
                <td>
    <table class="style9">
        <tr>
            <td class="Cabecalho_Vlr">Mês</td>
            <td class="Cabecalho_Vlr"><asp:Label ID="txt_Titulo_Hist3" Text="?" runat="server" BorderStyle="None" Width="65px" ></asp:Label></td>
            <td class="Cabecalho_Vlr">Partic.</td>
            <td class="auto-style3"><asp:Label ID="txt_Titulo_Hist2" Text="?" runat="server" BorderStyle="None" Width="65px" ></asp:Label></td>
            <td class="Cabecalho_Vlr">Partic.</td>
            <td class="Cabecalho_Vlr"><asp:Label ID="txt_Titulo_Hist1" Text="?" runat="server" BorderStyle="None" Width="65px" ></asp:Label></td>
            <td class="Cabecalho_Vlr">Partic.</td>           
               <%--Espaçamento--%><td class="Divisoria"></td>  
            <td class="Cabecalho_V">Meta</td>               
            <td class="Cabecalho_V"><asp:Label ID="lblCrescLegenda_M1" Text="?" runat="server" 
                    BorderStyle="None" Width="35px" ></asp:Label></td>
            <td class="Cabecalho_V">Partic.</td> 
               <%--Espaçamento--%><td class="Divisoria"></td>              
            <td class="auto-style3">Venda 2012</td>    
            <td class="Cabecalho_Vlr" bgcolor="#009900">Meta 2013</td>    
            <td class="Cabecalho_Vlr">% Cresc.</td>                      
            <td class="Cabecalho_Vlr">% Part.</td>                      
               <%--Espaçamento--%><td class="style40"></td>                      
            <td class="Cabecalho_Vlr"><asp:Label ID="lblCrescLegenda_M3" Text="?" runat="server" BorderStyle="None" Width="45px" ></asp:Label></td>
            <td class="Cabecalho_Vlr"><asp:Label ID="lblCrescLegenda_M2" Text="?" runat="server" BorderStyle="None" Width="45px" ></asp:Label></td>
            <td class="Cabecalho_V"><asp:Label ID="lblCrescLegenda_M4" Text="?" runat="server" BorderStyle="None" Width="45px" ></asp:Label></td>
        </tr> <%--Cabeçalho--%><%--******************** J A N E I R O *************************************************************************--%>
        <tr>
            <td class="DescMes_B">Janeiro</td>
            <td class="style37" ><asp:Label ID="txt_vlrHist3_01" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_percHist3_01" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_vlrHist2_01" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_percHist2_01" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_vlrHist1_01" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_percHist1_01" runat="server" Text="?"></asp:Label></td>                            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="style37"><asp:TextBox ID="txt_vlrMeta01" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" CssClass="TB_Vlr_B"></asp:TextBox></td>
            <td class="style37"><asp:TextBox ID="txt_percCresc01" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" CssClass="TB_Perc_B"></asp:TextBox></td>               
            <td class="style37"><asp:Label ID="txt_percMeta01" Text="?" runat="server"></asp:Label></td>            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="style37"><asp:Label ID="txt_vlrHistVendaCheia_01" Text="?" 
                    runat="server" CssClass="PartVendaAno_B"></asp:Label></td>
            <td class="style37"><asp:Label ID="txt_vlrVenda_01" Text="?" runat="server" CssClass="VendaAno_B"></asp:Label></td>
            <td class="style37">
                <asp:Label ID="txt_percCrescMes_01" Text="?" 
                    runat="server" CssClass="PartVendaAno_B"></asp:Label></td>
            <td class="style37"><asp:Label ID="txt_percPart_01" Text="?" runat="server" CssClass="PartVendaAno_B"></asp:Label></td>
               <%--Espaçamento--%><td class="style40"></td>
            <td class="style37"><asp:Label ID="lblCresc01_M3" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="style37"><asp:Label ID="lblCresc01_M2" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="style37"><asp:Label ID="lblCresc01_M1" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>                    
        </tr> <%--Mes 01--%><%--******************** F E V E R E I R O *************************************************************************--%>
        <tr>
            <td class="DescMes_V">Fevereiro</td>
            <td class="Padrao_V" ><asp:Label ID="txt_vlrHist3_02" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist3_02" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_vlrHist2_02" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist2_02" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_vlrHist1_02" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist1_02" runat="server" Text="?"></asp:Label></td>                            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="Padrao_V"><asp:TextBox ID="txt_vlrMeta02" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" CssClass="TB_Vlr_V"></asp:TextBox></td>
            <td class="Padrao_V"><asp:TextBox ID="txt_percCresc02" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" CssClass="TB_Perc_V"></asp:TextBox></td>               
            <td class="Padrao_V"><asp:Label ID="txt_percMeta02" Text="?" runat="server"></asp:Label></td>            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="Padrao_V"><asp:Label ID="txt_vlrHistVendaCheia_02" Text="?" 
                    runat="server" CssClass="PartVendaAno_V"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="txt_vlrVenda_02" Text="?" runat="server" CssClass="VendaAno_V"></asp:Label></td>
            <td class="Padrao_V">
                <asp:Label ID="txt_percCrescMes_02" Text="?" 
                    runat="server" CssClass="PartVendaAno_B"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="txt_percPart_02" Text="?" runat="server" CssClass="PartVendaAno_V"></asp:Label></td>
               <%--Espaçamento--%><td class="style40"></td>
            <td class="Padrao_V"><asp:Label ID="lblCresc02_M3" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="lblCresc02_M2" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="lblCresc02_M1" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
        </tr> <%--Mes 02--%><%--******************** M A R Ç O *************************************************************************--%>        
        <tr>
             <td class="DescMes_B">Março</td>
            <td class="style37" ><asp:Label ID="txt_vlrHist3_03" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_percHist3_03" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_vlrHist2_03" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_percHist2_03" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_vlrHist1_03" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_percHist1_03" runat="server" Text="?"></asp:Label></td>                            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="style37"><asp:TextBox ID="txt_vlrMeta03" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" CssClass="TB_Vlr_B"></asp:TextBox></td>
            <td class="style37"><asp:TextBox ID="txt_percCresc03" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" CssClass="TB_Perc_B"></asp:TextBox></td>               
            <td class="style37"><asp:Label ID="txt_percMeta03" Text="?" runat="server"></asp:Label></td>            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="style37"><asp:Label ID="txt_vlrHistVendaCheia_03" Text="?" 
                    runat="server" CssClass="PartVendaAno_B"></asp:Label></td>
            <td class="style37"><asp:Label ID="txt_vlrVenda_03" Text="?" runat="server" CssClass="VendaAno_B"></asp:Label></td>
            <td class="style37">
                <asp:Label ID="txt_percCrescMes_03" Text="?" 
                    runat="server" CssClass="PartVendaAno_B"></asp:Label></td>
            <td class="style37"><asp:Label ID="txt_percPart_03" Text="?" runat="server" CssClass="PartVendaAno_B"></asp:Label></td>
               <%--Espaçamento--%><td class="style40"></td>
            <td class="style37"><asp:Label ID="lblCresc03_M3" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="style37"><asp:Label ID="lblCresc03_M2" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="style37"><asp:Label ID="lblCresc03_M1" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
        </tr> <%--Mes 03--%><%--******************** A B R I L *************************************************************************--%>        
        <tr>
            <td class="DescMes_V">Abril</td>
            <td class="Padrao_V" ><asp:Label ID="txt_vlrHist3_04" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist3_04" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_vlrHist2_04" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist2_04" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_vlrHist1_04" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist1_04" runat="server" Text="?"></asp:Label></td>                            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="Padrao_V"><asp:TextBox ID="txt_vlrMeta04" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" CssClass="TB_Vlr_V"></asp:TextBox></td>
            <td class="Padrao_V"><asp:TextBox ID="txt_percCresc04" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" CssClass="TB_Perc_V"></asp:TextBox></td>               
            <td class="Padrao_V"><asp:Label ID="txt_percMeta04" Text="?" runat="server"></asp:Label></td>            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="Padrao_V"><asp:Label ID="txt_vlrHistVendaCheia_04" Text="?" 
                    runat="server" CssClass="PartVendaAno_V"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="txt_vlrVenda_04" Text="?" runat="server" CssClass="VendaAno_V"></asp:Label></td>
            <td class="Padrao_V">
                <asp:Label ID="txt_percCrescMes_04" Text="?" 
                    runat="server" CssClass="PartVendaAno_B"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="txt_percPart_04" Text="?" runat="server" CssClass="PartVendaAno_V"></asp:Label></td>
               <%--Espaçamento--%><td class="style40"></td>
            <td class="Padrao_V"><asp:Label ID="lblCresc04_M3" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="lblCresc04_M2" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="lblCresc04_M1" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
        </tr> <%--Mes 04--%><%--******************** M A I O *************************************************************************--%>  
        <tr>
            <td class="DescMes_B">Maio</td>
            <td class="style37" ><asp:Label ID="txt_vlrHist3_05" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_percHist3_05" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_vlrHist2_05" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_percHist2_05" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_vlrHist1_05" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_percHist1_05" runat="server" Text="?"></asp:Label></td>                            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="style37"><asp:TextBox ID="txt_vlrMeta05" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" CssClass="TB_Vlr_B"></asp:TextBox></td>
            <td class="style37"><asp:TextBox ID="txt_percCresc05" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" CssClass="TB_Perc_B"></asp:TextBox></td>               
            <td class="style37"><asp:Label ID="txt_percMeta05" Text="?" runat="server"></asp:Label></td>            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="style37"><asp:Label ID="txt_vlrHistVendaCheia_05" Text="?" 
                    runat="server" CssClass="PartVendaAno_B"></asp:Label></td>
            <td class="style37"><asp:Label ID="txt_vlrVenda_05" Text="?" runat="server" CssClass="VendaAno_B"></asp:Label></td>
            <td class="style37">
                <asp:Label ID="txt_percCrescMes_05" Text="?" 
                    runat="server" CssClass="PartVendaAno_B"></asp:Label></td>
            <td class="style37"><asp:Label ID="txt_percPart_05" Text="?" runat="server" CssClass="PartVendaAno_B"></asp:Label></td>
               <%--Espaçamento--%><td class="style40"></td>
            <td class="style37"><asp:Label ID="lblCresc05_M3" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="style37"><asp:Label ID="lblCresc05_M2" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="style37"><asp:Label ID="lblCresc05_M1" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
        </tr> <%--Mes 05--%><%--******************** J U N H O *************************************************************************--%>  
        <tr>
            <td class="DescMes_V">Junho</td>
            <td class="Padrao_V" ><asp:Label ID="txt_vlrHist3_06" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist3_06" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_vlrHist2_06" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist2_06" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_vlrHist1_06" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist1_06" runat="server" Text="?"></asp:Label></td>                            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="Padrao_V"><asp:TextBox ID="txt_vlrMeta06" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" CssClass="TB_Vlr_V"></asp:TextBox></td>
            <td class="Padrao_V"><asp:TextBox ID="txt_percCresc06" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" CssClass="TB_Perc_V"></asp:TextBox></td>               
            <td class="Padrao_V"><asp:Label ID="txt_percMeta06" Text="?" runat="server"></asp:Label></td>            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="Padrao_V"><asp:Label ID="txt_vlrHistVendaCheia_06" Text="?" 
                    runat="server" CssClass="PartVendaAno_V"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="txt_vlrVenda_06" Text="?" runat="server" CssClass="VendaAno_V"></asp:Label></td>
            <td class="Padrao_V">
                <asp:Label ID="txt_percCrescMes_06" Text="?" 
                    runat="server" CssClass="PartVendaAno_B"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="txt_percPart_06" Text="?" runat="server" CssClass="PartVendaAno_V"></asp:Label></td>
               <%--Espaçamento--%><td class="style40"></td>
            <td class="Padrao_V"><asp:Label ID="lblCresc06_M3" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="lblCresc06_M2" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="lblCresc06_M1" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
        </tr> <%--Mes 06--%><%--******************** J U L H O *************************************************************************--%>  
        <tr>
            <td class="DescMes_B">Julho</td>
            <td class="style37" ><asp:Label ID="txt_vlrHist3_07" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_percHist3_07" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_vlrHist2_07" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_percHist2_07" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_vlrHist1_07" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_percHist1_07" runat="server" Text="?"></asp:Label></td>                            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="style37"><asp:TextBox ID="txt_vlrMeta07" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" CssClass="TB_Vlr_B"></asp:TextBox></td>
            <td class="style37"><asp:TextBox ID="txt_percCresc07" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" CssClass="TB_Perc_B"></asp:TextBox></td>               
            <td class="style37"><asp:Label ID="txt_percMeta07" Text="?" runat="server"></asp:Label></td>            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="style37"><asp:Label ID="txt_vlrHistVendaCheia_07" Text="?" 
                    runat="server" CssClass="PartVendaAno_B"></asp:Label></td>
            <td class="style37"><asp:Label ID="txt_vlrVenda_07" Text="?" runat="server" CssClass="VendaAno_B"></asp:Label></td>
            <td class="style37">
                <asp:Label ID="txt_percCrescMes_07" Text="?" 
                    runat="server" CssClass="PartVendaAno_B"></asp:Label></td>
            <td class="style37"><asp:Label ID="txt_percPart_07" Text="?" runat="server" CssClass="PartVendaAno_B"></asp:Label></td>
               <%--Espaçamento--%><td class="style40"></td>
            <td class="style37"><asp:Label ID="lblCresc07_M3" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="style37"><asp:Label ID="lblCresc07_M2" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="style37"><asp:Label ID="lblCresc07_M1" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
        </tr> <%--Mes 07--%><%--******************** A G O S T O *************************************************************************--%>  
        <tr>
            <td class="DescMes_V">Agosto</td>
            <td class="Padrao_V" ><asp:Label ID="txt_vlrHist3_08" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist3_08" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_vlrHist2_08" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist2_08" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_vlrHist1_08" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist1_08" runat="server" Text="?"></asp:Label></td>                            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="Padrao_V"><asp:TextBox ID="txt_vlrMeta08" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" CssClass="TB_Vlr_V"></asp:TextBox></td>
            <td class="Padrao_V"><asp:TextBox ID="txt_percCresc08" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" CssClass="TB_Perc_V"></asp:TextBox></td>               
            <td class="Padrao_V"><asp:Label ID="txt_percMeta08" Text="?" runat="server"></asp:Label></td>            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="Padrao_V"><asp:Label ID="txt_vlrHistVendaCheia_08" Text="?" 
                    runat="server" CssClass="PartVendaAno_V"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="txt_vlrVenda_08" Text="?" runat="server" CssClass="VendaAno_V"></asp:Label></td>
            <td class="Padrao_V">
                <asp:Label ID="txt_percCrescMes_08" Text="?" 
                    runat="server" CssClass="PartVendaAno_B"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="txt_percPart_08" Text="?" runat="server" CssClass="PartVendaAno_V"></asp:Label></td>
               <%--Espaçamento--%><td class="style40"></td>
            <td class="Padrao_V"><asp:Label ID="lblCresc08_M3" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="lblCresc08_M2" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="lblCresc08_M1" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>            
        </tr> <%--Mes 08--%><%--******************** S E T E M B R O *************************************************************************--%>  
        <tr>
            <td class="DescMes_B">Setembro</td>
            <td class="style37" ><asp:Label ID="txt_vlrHist3_09" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_percHist3_09" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_vlrHist2_09" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_percHist2_09" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_vlrHist1_09" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_percHist1_09" runat="server" Text="?"></asp:Label></td>                            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="style37"><asp:TextBox ID="txt_vlrMeta09" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" CssClass="TB_Vlr_B"></asp:TextBox></td>
            <td class="style37"><asp:TextBox ID="txt_percCresc09" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" CssClass="TB_Perc_B"></asp:TextBox></td>               
            <td class="style37"><asp:Label ID="txt_percMeta09" Text="?" runat="server"></asp:Label></td>            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="style37"><asp:Label ID="txt_vlrHistVendaCheia_09" Text="?" 
                    runat="server" CssClass="PartVendaAno_B"></asp:Label></td>
            <td class="style37"><asp:Label ID="txt_vlrVenda_09" Text="?" runat="server" CssClass="VendaAno_B"></asp:Label></td>
            <td class="style37">
                <asp:Label ID="txt_percCrescMes_09" Text="?" 
                    runat="server" CssClass="PartVendaAno_B"></asp:Label></td>
            <td class="style37"><asp:Label ID="txt_percPart_09" Text="?" runat="server" CssClass="PartVendaAno_B"></asp:Label></td>
               <%--Espaçamento--%><td class="style40"></td>
            <td class="style37"><asp:Label ID="lblCresc09_M3" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="style37"><asp:Label ID="lblCresc09_M2" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="style37"><asp:Label ID="lblCresc09_M1" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
        </tr> <%--Mes 09--%><%--******************** O U T U B R O *************************************************************************--%>  
        <tr>
            <td class="DescMes_V">Outubro</td>
            <td class="Padrao_V" ><asp:Label ID="txt_vlrHist3_10" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist3_10" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_vlrHist2_10" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist2_10" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_vlrHist1_10" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist1_10" runat="server" Text="?"></asp:Label></td>                            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="Padrao_V"><asp:TextBox ID="txt_vlrMeta10" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" CssClass="TB_Vlr_V"></asp:TextBox></td>
            <td class="Padrao_V"><asp:TextBox ID="txt_percCresc10" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" CssClass="TB_Perc_V"></asp:TextBox></td>               
            <td class="Padrao_V"><asp:Label ID="txt_percMeta10" Text="?" runat="server"></asp:Label></td>            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="Padrao_V"><asp:Label ID="txt_vlrHistVendaCheia_10" Text="?" 
                    runat="server" CssClass="PartVendaAno_V"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="txt_vlrVenda_10" Text="?" runat="server" CssClass="VendaAno_V"></asp:Label></td>
            <td class="Padrao_V">
                <asp:Label ID="txt_percCrescMes_10" Text="?" 
                    runat="server" CssClass="PartVendaAno_B"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="txt_percPart_10" Text="?" runat="server" CssClass="PartVendaAno_V"></asp:Label></td>
               <%--Espaçamento--%><td class="style40"></td>
            <td class="Padrao_V"><asp:Label ID="lblCresc10_M3" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="lblCresc10_M2" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="lblCresc10_M1" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>            
        </tr> <%--Mes 10--%><%--******************** N O V E M B R O *************************************************************************--%>  
        <tr>
            <td class="DescMes_B">Novembro</td>
            <td class="style37" ><asp:Label ID="txt_vlrHist3_11" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_percHist3_11" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_vlrHist2_11" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_percHist2_11" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_vlrHist1_11" runat="server" Text="?"></asp:Label></td>
            <td class="style37" ><asp:Label ID="txt_percHist1_11" runat="server" Text="?"></asp:Label></td>                            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="style37"><asp:TextBox ID="txt_vlrMeta11" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" CssClass="TB_Vlr_B"></asp:TextBox></td>
            <td class="style37"><asp:TextBox ID="txt_percCresc11" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" CssClass="TB_Perc_B"></asp:TextBox></td>               
            <td class="style37"><asp:Label ID="txt_percMeta11" Text="?" runat="server"></asp:Label></td>            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="style37"><asp:Label ID="txt_vlrHistVendaCheia_11" Text="?" 
                    runat="server" CssClass="PartVendaAno_B"></asp:Label></td>
            <td class="style37"><asp:Label ID="txt_vlrVenda_11" Text="?" runat="server" CssClass="VendaAno_B"></asp:Label></td>
            <td class="style37">
                <asp:Label ID="txt_percCrescMes_11" Text="?" 
                    runat="server" CssClass="PartVendaAno_B"></asp:Label></td>
            <td class="style37"><asp:Label ID="txt_percPart_11" Text="?" runat="server" CssClass="PartVendaAno_B"></asp:Label></td>
               <%--Espaçamento--%><td class="style40"></td>
            <td class="style37"><asp:Label ID="lblCresc11_M3" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="style37"><asp:Label ID="lblCresc11_M2" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="style37"><asp:Label ID="lblCresc11_M1" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
        </tr> <%--Mes 11--%><%--******************** D E Z E M B R O *************************************************************************--%>  
        <tr> 
            <td class="DescMes_V">Dezembro</td>
            <td class="Padrao_V" ><asp:Label ID="txt_vlrHist3_12" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist3_12" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_vlrHist2_12" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist2_12" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_vlrHist1_12" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_V" ><asp:Label ID="txt_percHist1_12" runat="server" Text="?"></asp:Label></td>                            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="Padrao_V"><asp:TextBox ID="txt_vlrMeta12" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" CssClass="TB_Vlr_V"></asp:TextBox></td>
            <td class="Padrao_V"><asp:TextBox ID="txt_percCresc12" Text="?" runat="server" AutoPostBack="True" BorderStyle="None" CssClass="TB_Perc_V"></asp:TextBox></td>               
            <td class="Padrao_V"><asp:Label ID="txt_percMeta12" Text="?" runat="server"></asp:Label></td>            
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="Padrao_V"><asp:Label ID="txt_vlrHistVendaCheia_12" Text="?" 
                    runat="server" CssClass="PartVendaAno_V"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="txt_vlrVenda_12" Text="?" runat="server" CssClass="VendaAno_V"></asp:Label></td>
            <td class="Padrao_V">
                <asp:Label ID="txt_percCrescMes_12" Text="?" 
                    runat="server" CssClass="PartVendaAno_B"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="txt_percPart_12" Text="?" runat="server" CssClass="PartVendaAno_V"></asp:Label></td>
               <%--Espaçamento--%><td class="style40"></td>
            <td class="Padrao_V"><asp:Label ID="lblCresc12_M3" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="lblCresc12_M2" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
            <td class="Padrao_V"><asp:Label ID="lblCresc12_M1" Text="?" runat="server" CssClass="TB_Perc_B"></asp:Label></td>
        </tr> <%--Mes 12--%>

        <tr>
            <td class="style3">&nbsp;</td>
            <td class="Padrao_C"><asp:Label ID="txt_vlrHist3_Total" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_C"><asp:Label ID="txt_percHist3_Total" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_C"><asp:Label ID="txt_vlrHist2_Total" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_C"><asp:Label ID="txt_percHist2_Total" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_C"><asp:Label ID="txt_vlrHist1_Total" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_C"><asp:Label ID="txt_percHist1_Total" runat="server" Text="?"></asp:Label></td>
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="Padrao_C"><asp:Label ID="txt_vlrMetaTotal" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_C"><asp:Label ID="lblCrescAno" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_C"><asp:Label ID="txt_percMetaTotal" runat="server" Text="?"></asp:Label></td>
               <%--Espaçamento--%><td class="Divisoria"></td>
            <td class="Padrao_C"><asp:Label ID="txt_vlrHistVendaCheia_Total" runat="server" 
                    Text="?"></asp:Label></td>
            <td class="Padrao_C"><asp:Label ID="txt_vlrVenda_Total" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_C">
                <asp:Label ID="txt_percCrescMes_Total" Text="?" 
                    runat="server" CssClass="PartVendaAno_B"></asp:Label></td>
            <td class="Padrao_C"><asp:Label ID="txt_percPart_Ano" runat="server" Text="?"></asp:Label></td>
               <%--Espaçamento--%><td class="style40"></td>
            <td class="Padrao_C"><asp:Label ID="lblCrescAno_M3" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_C"><asp:Label ID="lblCrescAno_M2" runat="server" Text="?"></asp:Label></td>
            <td class="Padrao_C"><asp:Label ID="lblCrescAno_M1" runat="server" Text="?"></asp:Label></td> 
        </tr> <%--Totais--%>
    </table>
   </td>
 </tr>
        </table>
        <table class="style54">
            <tr>
                <td style="width:251px"><uc4:wucListaPosicao ID="cboPosicao" runat="server" /></td>
                <td></td>
                <td><dxe:ASPxButton ID="btnSalvar" runat="server" Text="Salvar" Theme="DevEx" 
                        Enabled="False"></dxe:ASPxButton></td>
                <td><asp:Label ID="lblDepto" runat="server" Text="?" BackColor="#FFFF99" ForeColor="#0066FF" Visible="False"></asp:Label></td>
            </tr>
        </table>
        <table class="style54">
            <tr>
                <td class="style56">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <table class="style58">
                                <tr>
                                    <td style="background-color: #3399FF; color: #FFFFFF; text-align: center">
                                        Calendário</td>
                                </tr>
                                <tr>
                                    <td>
                                        <uc5:wuciListaMes ID="cboMes" runat="server" />
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
                <td class="style60">
                            <table class="style58">
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
            </tr>
        </table>
        <table class="style54">
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
            </tr>
        </table>
        <br />
 
</asp:Content>

