<%@ Page Title="Margem - Replanejamento" Language="VB" MasterPageFile="~/MemberPages/SiteMetas.master" AutoEventWireup="false" CodeFile="webReplanMargem.aspx.vb" Inherits="MemberPages_Replanejamento_webReplanPartic" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc4" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc4" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc4" TagName="wucListaLojasComCorporacao" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">

        .divDados {
            clear: both;
        }
        

        .style1
        {
            width: 600px;
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
            width: 114px;
        }
        .style16
        {
            width: 262px;
        }
        .TableDados
        {
            width: 800px;
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
            width: 100px;
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
        .style31
    {
        width: 76px;
    }
    .style32
    {
        height: 21px;
        width: 76px;
    }
    .style33
    {
        width: 76px;
        height: 22px;
    }
        .style34
        {
            width: 161px;
            height: 19px;
        }
        .style35
        {
            width: 100px;
            height: 19px;
        }
        .style36
        {
            width: 51px;
            height: 19px;
        }
        .style37
        {
            width: 76px;
            height: 19px;
        }
        .style38
        {
            height: 19px;
        }
        .auto-style7 {
            width: 249px;
        }
        .auto-style8 {
            height: 21px;
            width: 249px;
        }
        .auto-style9 {
            width: 249px;
            height: 19px;
        }
        .auto-style10 {
            width: 249px;
            height: 22px;
        }

        divAno {
            clear:both ;
            float: left;
        }

        divMes {
            float: left ;
            margin-left: 15px;
        }

        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <Triggers>
        <asp:PostBackTrigger ControlID="btnSalvar" />
    </Triggers>

    <ContentTemplate> 
        
    <div id="divAno">
        <uc4:wucAno runat="server" ID="cboAno" />
    </div>   

    <div id="divMes">
        <uc4:wuciListaMes runat="server" ID="cboMes" />
    </div>

    <div id="divFilial">
        <uc4:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
    </div>

    <div id="divBotaoSalvar">
         <asp:Button ID="btnSalvar" runat="server" Text="Salvar" />
    </div>
   
    

        <div id="divDados">        

    <asp:Panel ID="Panel2" runat="server" CssClass ="divDados ">
        <table class="TableDados">
            <tr>
                <td class="auto-style7" 
                    
                    
                    style="border: 1px solid #CCCCCC; background-color: #546E96; font-family: 'Times New Roman', Times, serif; font-size: medium; color: #FFFFFF; text-align: center; font-weight: bold;">
                    Descrição da Seção</td>
                <td class="style24" 
                    
                    
                    style="border: 1px solid #CCCCCC; background-color: #546E96; font-family: 'Times New Roman', Times, serif; font-size: medium; color: #FFFFFF; text-align: center; font-weight: bold;">
                    Venda</td>
                <td class="style25" 
                    
                    
                    style="border: 1px solid #CCCCCC; background-color: #546E96; font-family: 'Times New Roman', Times, serif; font-size: medium; color: #FFFFFF; text-align: center; font-weight: bold;">
                    %</td>
                <td class="style31" 
                    
                    
                    
                    style="border: 1px solid #CCCCCC; background-color: #546E96; font-family: 'Times New Roman', Times, serif; font-size: medium; color: #FFFFFF; text-align: center; font-weight: bold;">
                    Margem</td>
                <td class="style25" 
                    
                    
                    style="border: 1px solid #CCCCCC; background-color: #546E96; font-family: 'Times New Roman', Times, serif; font-size: medium; color: #FFFFFF; text-align: center; font-weight: bold;">
                    %</td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC" bgcolor="Honeydew">
                    &nbsp;<span class="style13">1 - Seca Pesada</span>&nbsp;</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:Label ID="Secao_01" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:Label ID="SecaoP_01" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:Label ID="SecaoM_01" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:TextBox ID="txtSecao_01" runat="server" AutoPostBack="True" 
                        BorderStyle="None" Width="50px" onfocus="this.select();" 
                        style="text-align:right" BackColor="Honeydew"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Secao01" runat="server" ControlToValidate="txtSecao_01" ErrorMessage="Informe um Valor ou 0 na Seção 1" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9" style="border: 1px solid #CCCCCC">
                    <span class="style13">&nbsp;2 - Seca Salgada </span>
                </td>
                <td align="right" class="style35" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_02" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style36" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoP_02" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style37" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoM_02" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style36" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_02" runat="server" AutoPostBack="True" 
                        BackColor="White" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td class="style38">
                    <asp:RequiredFieldValidator ID="rfv_Secao2" runat="server" ControlToValidate="txtSecao_02" ErrorMessage="Informe um Valor ou 0 na Seção 2" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td class="style38"></td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC" bgcolor="Honeydew">
                    &nbsp;<span class="style13">3 - Seca Doce</span>&nbsp;</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:Label ID="Secao_03" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:Label ID="SecaoP_03" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:Label ID="SecaoM_03" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:TextBox ID="txtSecao_03" runat="server" AutoPostBack="True" 
                        BackColor="Honeydew" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Secao3" runat="server" ControlToValidate="txtSecao_03" ErrorMessage="Informe um Valor ou 0 na Seção 3" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC">
                    <span class="style13">&nbsp;4 - Seca Leve &nbsp;</span></td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_04" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoP_04" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoM_04" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_04" runat="server" AutoPostBack="True" 
                        BackColor="White" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Secao4" runat="server" ControlToValidate="txtSecao_04" ErrorMessage="Informe um Valor ou 0 na Seção 4" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC" bgcolor="Honeydew">
                    &nbsp;<span class="style13">5 - Limpeza </span>&nbsp;</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:Label ID="Secao_05" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:Label ID="SecaoP_05" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:Label ID="SecaoM_05" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:TextBox ID="txtSecao_05" runat="server" AutoPostBack="True" 
                        BackColor="Honeydew" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Secao5" runat="server" ControlToValidate="txtSecao_05" ErrorMessage="Informe um Valor ou 0 na Seção 5" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style8" style="border: 1px solid #CCCCCC">
                    <span class="style13">&nbsp;6 - Perfumaria &nbsp;</span></td>
                <td align="right" class="style23" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_06" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style26" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoP_06" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style32" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoM_06" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style26" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_06" runat="server" AutoPostBack="True" 
                        BackColor="White" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td class="style19">
                    <asp:RequiredFieldValidator ID="rfv_Secao6" runat="server" ControlToValidate="txtSecao_06" ErrorMessage="Informe um Valor ou 0 na Seção 6" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td class="style19"></td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC" bgcolor="Honeydew">
                    &nbsp;<span class="style13">7 - Bebidas Quentes</span>&nbsp;</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:Label ID="Secao_07" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:Label ID="SecaoP_07" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:Label ID="SecaoM_07" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:TextBox ID="txtSecao_07" runat="server" AutoPostBack="True" 
                        BackColor="Honeydew" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Secao7" runat="server" ControlToValidate="txtSecao_07" ErrorMessage="Informe um Valor ou 0 na Seção 7" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9" style="border: 1px solid #CCCCCC">
                    <span class="style13">&nbsp;8 - Bebidas Frias </span>
                </td>
                <td align="right" class="style35" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_08" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style36" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoP_08" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style37" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoM_08" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style36" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_08" runat="server" AutoPostBack="True" 
                        BackColor="White" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td class="style38">
                    <asp:RequiredFieldValidator ID="rfv_Secao8" runat="server" ControlToValidate="txtSecao_08" ErrorMessage="Informe um Valor ou 0 na Seção 8" ForeColor="Red" Width="300px"></asp:RequiredFieldValidator>
                    </td>
                <td class="style38">
                    </td>
            </tr>
            <tr>
                <td class="auto-style9" style="border: 1px solid #CCCCCC">&nbsp;9 - Saudaveis&nbsp;</td>
                <td align="right" class="style35" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_09" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style36" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoP_09" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style37" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoM_09" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style36" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_09" runat="server" AutoPostBack="True" BackColor="White" BorderStyle="None" onfocus="this.select();" style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td class="style38">&nbsp;</td>
                <td class="style38">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC" bgcolor="#FFFFCE">
                    &nbsp;<b><span class="style17">Total da 
                    Mercearia =&gt;</span></b>&nbsp;</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#FFFFCE">
                    <asp:Label ID="Depto_1" runat="server" CssClass="style13" Font-Bold="True" 
                        Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#FFFFCE">
                    <asp:Label ID="DeptoP_1" runat="server" CssClass="style64" Font-Bold="True" 
                        Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#FFFFCE">
                    <asp:Label ID="DeptoM_1" runat="server" CssClass="style13" Font-Bold="True" 
                        Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#FFFFCE">
                    <asp:Label ID="txtDepto_1" runat="server" CssClass="style13" Font-Bold="True" 
                        Text="Label"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC" bgcolor="#F8F8F3">
                    &nbsp;11 - Leite &nbsp;&nbsp;</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="Secao_11" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="SecaoP_11" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="SecaoM_11" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:TextBox ID="txtSecao_11" runat="server" AutoPostBack="True" 
                        BackColor="#F8F8F3" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Secao11" runat="server" ControlToValidate="txtSecao_11" ErrorMessage="Informe um Valor ou 0 na Seção 11" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC">
                    &nbsp;12 - Fiambreria &nbsp;&nbsp;</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_12" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoP_12" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoM_12" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_12" runat="server" AutoPostBack="True" 
                        BackColor="White" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Secao12" runat="server" ControlToValidate="txtSecao_12" ErrorMessage="Informe um Valor ou 0 na Seção 12" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC" bgcolor="#F8F8F3">
                    &nbsp;13 - Rotisseria &nbsp;&nbsp;</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="Secao_13" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="SecaoP_13" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="SecaoM_13" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:TextBox ID="txtSecao_13" runat="server" AutoPostBack="True" 
                        BackColor="#F8F8F3" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Secao13" runat="server" ControlToValidate="txtSecao_13" ErrorMessage="Informe um Valor ou 0 na Seção 13" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC">
                    &nbsp;14 - Frios &amp; Massas &nbsp;&nbsp;</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_14" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoP_14" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoM_14" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_14" runat="server" AutoPostBack="True" 
                        BackColor="White" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Secao14" runat="server" ControlToValidate="txtSecao_14" ErrorMessage="Informe um Valor ou 0 na Seção 14" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC" bgcolor="#F8F8F3">
                    &nbsp;15 - Latícinios &nbsp;&nbsp;</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="Secao_15" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="SecaoP_15" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="SecaoM_15" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:TextBox ID="txtSecao_15" runat="server" AutoPostBack="True" 
                        BackColor="#F8F8F3" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Secao15" runat="server" ControlToValidate="txtSecao_15" ErrorMessage="Informe um Valor ou 0 na Seção 15" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC">
                    &nbsp;16 - Congelados &nbsp;&nbsp;</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_16" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoP_16" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoM_16" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_16" runat="server" AutoPostBack="True" 
                        BackColor="White" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Secao16" runat="server" ControlToValidate="txtSecao_16" ErrorMessage="Informe um Valor ou 0 na Seção 16" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC" bgcolor="#F8F8F3">
                    &nbsp;17 - Padaria &nbsp;&nbsp;</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="Secao_17" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="SecaoP_17" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="SecaoM_17" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:TextBox ID="txtSecao_17" runat="server" AutoPostBack="True" 
                        BackColor="#F8F8F3" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Secao17" runat="server" ControlToValidate="txtSecao_17" ErrorMessage="Informe um Valor ou 0 na Seção 17" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC">
                    &nbsp;18 - Confeitaria &nbsp;&nbsp;</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_18" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoP_18" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoM_18" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_18" runat="server" AutoPostBack="True" 
                        BackColor="White" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Secao18" runat="server" ControlToValidate="txtSecao_18" ErrorMessage="Informe um Valor ou 0 na Seção 18" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC" bgcolor="#F8F8F3">
                    &nbsp;19 - Pães Industrializados</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="Secao_19" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="SecaoP_19" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="SecaoM_19" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:TextBox ID="txtSecao_19" runat="server" AutoPostBack="True" 
                        BackColor="#F8F8F3" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Secao19" runat="server" ControlToValidate="txtSecao_19" ErrorMessage="Informe um Valor ou 0 na Seção 19" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC">
                    &nbsp;21 - Açougue &nbsp;&nbsp;</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_21" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoP_21" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoM_21" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_21" runat="server" AutoPostBack="True" 
                        BackColor="White" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Secao21" runat="server" ControlToValidate="txtSecao_21" ErrorMessage="Informe um Valor ou 0 na Seção 21" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC" bgcolor="#F8F8F3">
                    &nbsp;22 - Granjeiros&nbsp;&nbsp;</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="Secao_22" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="SecaoP_22" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="SecaoM_22" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:TextBox ID="txtSecao_22" runat="server" AutoPostBack="True" 
                        BackColor="#F8F8F3" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Secao22" runat="server" ControlToValidate="txtSecao_22" ErrorMessage="Informe um Valor ou 0 na Seção 22" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC">&nbsp;23 - Hortifruti &nbsp;&nbsp;</td>
                <td align="right" class="style24" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_23" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoP_23" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoM_23" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_23" runat="server" AutoPostBack="True" BackColor="White" BorderStyle="None" onfocus="this.select();" style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Secao23" runat="server" ControlToValidate="txtSecao_23" ErrorMessage="Informe um Valor ou 0 na Seção 23" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC; background-color: #FFFFFF;">&nbsp;25 - Saudáveis</td>
                <td align="right" class="style24" style="border: 1px solid #CCCCCC; padding-right: 3px; background-color: #FFFFFF;">
                    <asp:Label ID="Secao_25" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" style="border: 1px solid #CCCCCC; padding-right: 3px; background-color: #FFFFFF;">
                    <asp:Label ID="SecaoP_25" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" style="border: 1px solid #CCCCCC; padding-right: 3px; background-color: #FFFFFF;">
                    <asp:Label ID="SecaoM_25" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" style="border: 1px solid #CCCCCC; padding-right: 3px; background-color: #FFFFFF;">
                    <asp:TextBox ID="txtSecao_25" runat="server" AutoPostBack="True" BackColor="White" BorderStyle="None" onfocus="this.select();" style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC" bgcolor="#FFFFCE">
                    &nbsp;<b><span class="style17">Total 
                    dos Perecíveis =&gt;</span></b><span class="style17">&nbsp;</span>&nbsp;</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#FFFFCE">
                    <asp:Label ID="Depto_2" runat="server" CssClass="style13" Font-Bold="True" 
                        Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#FFFFCE">
                    <asp:Label ID="DeptoP_2" runat="server" CssClass="style64" Font-Bold="True" 
                        Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#FFFFCE">
                    <asp:Label ID="DeptoM_2" runat="server" CssClass="style13" Font-Bold="True" 
                        Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#FFFFCE">
                    <asp:Label ID="txtDepto_2" runat="server" CssClass="style13" Font-Bold="True" 
                        Text="Label"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC" bgcolor="#ECF5FF">
                    &nbsp;30 - Ferragens &nbsp;&nbsp;</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#ECF5FF">
                    <asp:Label ID="Secao_30" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#ECF5FF">
                    <asp:Label ID="SecaoP_30" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#ECF5FF">
                    <asp:Label ID="SecaoM_30" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#ECF5FF">
                    <asp:TextBox ID="txtSecao_30" runat="server" AutoPostBack="True" 
                        BackColor="#ECF5FF" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Secao30" runat="server" ControlToValidate="txtSecao_30" ErrorMessage="Informe um Valor ou 0 na Seção 30" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style9" style="border: 1px solid #CCCCCC">
                    &nbsp;31 - Papelaria &nbsp;&nbsp;</td>
                <td align="right" class="style35" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_31" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style36" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoP_31" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style37" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoM_31" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style36" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_31" runat="server" AutoPostBack="True" 
                        BackColor="White" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td class="style38">
                    <asp:RequiredFieldValidator ID="rfv_Secao31" runat="server" ControlToValidate="txtSecao_31" ErrorMessage="Informe um Valor ou 0 na Seção 31" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                    </td>
                <td class="style38"></td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC" bgcolor="#ECF5FF">
                    &nbsp;32 - Casa e Utilidades</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#ECF5FF">
                    <asp:Label ID="Secao_32" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#ECF5FF">
                    <asp:Label ID="SecaoP_32" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#ECF5FF">
                    <asp:Label ID="SecaoM_32" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#ECF5FF">
                    <asp:TextBox ID="txtSecao_32" runat="server" AutoPostBack="True" 
                        BackColor="#ECF5FF" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Secao32" runat="server" ControlToValidate="txtSecao_32" ErrorMessage="Informe um Valor ou 0 na Seção 32" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC">
                    &nbsp;33 - Brinquedos &nbsp;&nbsp;</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_33" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoP_33" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoM_33" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_33" runat="server" AutoPostBack="True" 
                        BackColor="White" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Secao33" runat="server" ControlToValidate="txtSecao_33" ErrorMessage="Informe um Valor ou 0 na Seção 33" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC" bgcolor="#ECF5FF">
                    &nbsp;34 - Jardins &nbsp;&nbsp;</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#ECF5FF">
                    <asp:Label ID="Secao_34" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#ECF5FF">
                    <asp:Label ID="SecaoP_34" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#ECF5FF">
                    <asp:Label ID="SecaoM_34" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#ECF5FF">
                    <asp:TextBox ID="txtSecao_34" runat="server" AutoPostBack="True" 
                        BackColor="#ECF5FF" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Secao34" runat="server" ControlToValidate="txtSecao_34" ErrorMessage="Informe um Valor ou 0 na Seção 34" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC">
                    &nbsp;35 - Animais &nbsp;&nbsp;</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_35" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoP_35" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoM_35" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_35" runat="server" AutoPostBack="True" 
                        BackColor="White" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Secao35" runat="server" ControlToValidate="txtSecao_35" ErrorMessage="Informe um Valor ou 0 na Seção 35" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC" bgcolor="#ECF5FF">
                    &nbsp;36 - Musica &nbsp;&nbsp;</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#ECF5FF">
                    <asp:Label ID="Secao_36" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#ECF5FF">
                    <asp:Label ID="SecaoP_36" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#ECF5FF">
                    <asp:Label ID="SecaoM_36" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#ECF5FF">
                    <asp:TextBox ID="txtSecao_36" runat="server" AutoPostBack="True" 
                        BackColor="#ECF5FF" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Secao36" runat="server" ControlToValidate="txtSecao_36" ErrorMessage="Informe um Valor ou 0 na Seção 36" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC" bgcolor="#FFFFCE">
                    &nbsp;<b><span class="style17">Total do 
                    Bazar =&gt;</span></b><span class="style17">&nbsp;</span>&nbsp;</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#FFFFCE">
                    <asp:Label ID="Depto_3" runat="server" CssClass="style13" Font-Bold="True" 
                        Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#FFFFCE">
                    <asp:Label ID="DeptoP_3" runat="server" CssClass="style64" Font-Bold="True" 
                        Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#FFFFCE">
                    <asp:Label ID="DeptoM_3" runat="server" CssClass="style13" Font-Bold="True" 
                        Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#FFFFCE">
                    <asp:Label ID="txtDepto_3" runat="server" CssClass="style13" Font-Bold="True" 
                        Text="Label"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC" bgcolor="Honeydew">
                    &nbsp;40 - Calçados &nbsp;&nbsp;</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:Label ID="Secao_40" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:Label ID="SecaoP_40" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:Label ID="SecaoM_40" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:TextBox ID="txtSecao_40" runat="server" AutoPostBack="True" 
                        BackColor="Honeydew" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Secao40" runat="server" ControlToValidate="txtSecao_40" ErrorMessage="Informe um Valor ou 0 na Seção 40" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC">
                    &nbsp;41 - Confecções &nbsp;&nbsp;</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_41" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoP_41" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoM_41" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_41" runat="server" AutoPostBack="True" 
                        BackColor="White" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Secao41" runat="server" ControlToValidate="txtSecao_41" ErrorMessage="Informe um Valor ou 0 na Seção 41" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10" style="border: 1px solid #CCCCCC" bgcolor="Honeydew">
                    &nbsp;42 - Cama, Mesa &nbsp;&nbsp;</td>
                <td align="right" class="style28" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:Label ID="Secao_42" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:Label ID="SecaoP_42" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style33" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:Label ID="SecaoM_42" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style29" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="Honeydew">
                    <asp:TextBox ID="txtSecao_42" runat="server" AutoPostBack="True" 
                        BackColor="Honeydew" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td class="style30">
                    <asp:RequiredFieldValidator ID="rfv_Secao42" runat="server" ControlToValidate="txtSecao_42" ErrorMessage="Informe um Valor ou 0 na Seção 42" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td class="style30"></td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC">
                    &nbsp;49 - Puericultura &nbsp;&nbsp;</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_49" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoP_49" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoM_49" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_49" runat="server" AutoPostBack="True" 
                        BackColor="White" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Secao49" runat="server" ControlToValidate="txtSecao_49" ErrorMessage="Informe um Valor ou 0 na Seção 49" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC" bgcolor="#FFFFCE">
                    &nbsp;<b><span class="style17">Total de 
                    Textil =&gt;</span></b><span class="style17">&nbsp;</span>&nbsp;</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#FFFFCE">
                    <asp:Label ID="Depto_4" runat="server" CssClass="style13" Font-Bold="True" 
                        Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#FFFFCE">
                    <asp:Label ID="DeptoP_4" runat="server" CssClass="style64" Font-Bold="True" 
                        Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#FFFFCE">
                    <asp:Label ID="DeptoM_4" runat="server" CssClass="style13" Font-Bold="True" 
                        Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#FFFFCE">
                    <asp:Label ID="txtDepto_4" runat="server" CssClass="style13" Font-Bold="True" 
                        Text="Label"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC" bgcolor="#F8F8F3">
                    &nbsp;50 - Eletrodomésticos&nbsp;&nbsp;</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="Secao_50" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="SecaoP_50" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="SecaoM_50" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:TextBox ID="txtSecao_50" runat="server" AutoPostBack="True" 
                        BackColor="#F8F8F3" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Secao50" runat="server" ControlToValidate="txtSecao_50" ErrorMessage="Informe um Valor ou 0 na Seção 50" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC">
                    &nbsp;51 - Eletroportáteis &nbsp;&nbsp;</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_51" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoP_51" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoM_51" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_51" runat="server" AutoPostBack="True" 
                        BackColor="White" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Secao51" runat="server" ControlToValidate="txtSecao_51" ErrorMessage="Informe um Valor ou 0 na Seção 51" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC" bgcolor="#F8F8F3">
                    &nbsp;52 - Telefonia &nbsp;&nbsp;</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="Secao_52" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="SecaoP_52" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="SecaoM_52" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:TextBox ID="txtSecao_52" runat="server" AutoPostBack="True" 
                        BackColor="#F8F8F3" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Secao52" runat="server" ControlToValidate="txtSecao_52" ErrorMessage="Informe um Valor ou 0 na Seção 52" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC">
                    &nbsp;53 - Informática &nbsp;</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_53" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoP_53" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoM_53" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_53" runat="server" AutoPostBack="True" 
                        BackColor="White" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Secao53" runat="server" ControlToValidate="txtSecao_53" ErrorMessage="Informe um Valor ou 0 na Seção 53" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC" bgcolor="#F8F8F3">
                    &nbsp;54 - Cine/Foto/Som &nbsp;</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="Secao_54" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="SecaoP_54" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:Label ID="SecaoM_54" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F8F8F3">
                    <asp:TextBox ID="txtSecao_54" runat="server" AutoPostBack="True" 
                        BackColor="#F8F8F3" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Secao54" runat="server" ControlToValidate="txtSecao_54" ErrorMessage="Informe um Valor ou 0 na Seção 54" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC">
                    &nbsp;55 - Colchões e Boxes &nbsp;</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Secao_55" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoP_55" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="SecaoM_55" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:TextBox ID="txtSecao_55" runat="server" AutoPostBack="True" 
                        BackColor="White" BorderStyle="None" onfocus="this.select();" 
                        style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Secao55" runat="server" ControlToValidate="txtSecao_55" ErrorMessage="Informe um Valor ou 0 na Seção 55" ForeColor="Red" SetFocusOnError="True" Width="300px"></asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC" bgcolor="#FFFFCE">
                    &nbsp;<b><span class="style17">Total de 
                    Eletro =&gt;</span></b><span class="style17">&nbsp;</span>&nbsp;</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#FFFFCE">
                    <asp:Label ID="Depto_5" runat="server" CssClass="style13" Font-Bold="True" 
                        Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px; font-weight: 700;" 
                    bgcolor="#FFFFCE">
                    <asp:Label ID="DeptoP_5" runat="server" CssClass="style64" Font-Bold="True" 
                        Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#FFFFCE">
                    <asp:Label ID="DeptoM_5" runat="server" CssClass="style13" Font-Bold="True" 
                        Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#FFFFCE">
                    <asp:Label ID="txtDepto_5" runat="server" CssClass="style13" Font-Bold="True" 
                        Text="Label"></asp:Label>
                </td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7" style="border: 1px solid #CCCCCC" bgcolor="#F4F4F4">
                    &nbsp; 99 - Carretos</td>
                <td align="right" class="style24" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F4F4F4">
                    <asp:Label ID="Secao_99" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F4F4F4">
                    <asp:Label ID="SecaoP_99" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style31" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F4F4F4">
                    <asp:Label ID="SecaoM_99" runat="server" CssClass="style13" Text="Label"></asp:Label>
                </td>
                <td align="right" class="style25" 
                    style="border: 1px solid #CCCCCC; padding-right: 3px;" bgcolor="#F4F4F4">
                    <asp:TextBox ID="txtSecao_99" runat="server" AutoPostBack="True" BackColor="White" BorderStyle="None" onfocus="this.select();" style="text-align:right" Width="50px"></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td bgcolor="#F4F4F4" class="auto-style7" style="border: 1px solid #CCCCCC">&nbsp;<strong>Total Geral da Loja =&gt;</strong>&nbsp;</td>
                <td align="right" bgcolor="#F4F4F4" class="style24" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Total_Venda" runat="server" CssClass="style13" Font-Bold="True" ForeColor="Blue" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F4F4F4" class="style25" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Total_VendaP" runat="server" CssClass="style64" Font-Bold="True" ForeColor="Gray" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F4F4F4" class="style31" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="Total_VendaM" runat="server" CssClass="style13" Font-Bold="True" ForeColor="Black" Text="Label"></asp:Label>
                </td>
                <td align="right" bgcolor="#F4F4F4" class="style25" style="border: 1px solid #CCCCCC; padding-right: 3px;">
                    <asp:Label ID="txtTotalVenda" runat="server" CssClass="style13" Font-Bold="True" Text="Label"></asp:Label>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:TextBox ID="VendaRevista" runat="server" BorderStyle="None" 
                        ForeColor="White" Visible="False"></asp:TextBox>
                </td>
                <td class="style24">
                    &nbsp;</td>
                <td class="style25">
                    &nbsp;</td>
                <td class="style31">
                    &nbsp;</td>
                <td class="style25">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </asp:Panel>

        </div>

    <asp:Panel ID="Panel1" runat="server">
    </asp:Panel>
    <p>
        Margem no Replanejamento:
        <asp:Label ID="lblMargemReplanejamento" runat="server" 
            style="font-size: large; font-weight: 700" Text="Label"></asp:Label>
        <br />
    </p>
        </ContentTemplate>
 </asp:UpdatePanel>
</asp:Content>

