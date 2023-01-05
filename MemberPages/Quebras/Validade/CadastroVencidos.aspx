<%@ Page Title="Cadastro de Produtos Vencidos" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="CadastroVencidos.aspx.vb" Inherits="MemberPages_Quebras_Validade_CadastroVencidos" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Src="~/Controles/wucListaSecao.ascx" TagPrefix="uc1" TagName="wucListaSecao" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divFilial {
            clear: both ;
            float : left;
            padding-top: 5px;
            margin-left: 5px;
        }


        #divDiaLegenda {   
            clear: both;         
            float : left;
            padding-top: 5px;
            margin-left: 2px;
            color : red ;
            font-size: 24px;
        }

        #divDia {            
            float : left;
            padding-top: 10px;
            margin-left: 5px;
            height: 31px;
        }

        #divBorda {
            clear: both ;
            float : left;
            margin-top: 8px;           
            border : 2px solid gray;
            height: 260px;
            width:450px;
            margin-left: 5px;
            background-color: lightgray
        }

        #divSecao {
            clear: both ;
            float : left;
            padding-top: 5px;
            margin-left: 2px;
        }

        #divRuaLegenda {
            clear: both ;
            float : left;
                padding-top: 9px;
                margin-left: 2px;
        }

        #divRua {           
            float : left;
            margin-left : 5px;
            padding-top: 5px;
        }

        #divEANLegenda {
            clear: both ;
            float : left;
            padding-top: 9px;
            margin-left: 2px;
        }

        #divEAN {           
            float : left;
            margin-left : 5px;
            padding-top: 5px;
        }

        #divDescProduto {
                       float : left;
            margin-left : 5px;
            padding-top: 5px;
            color : blue ;
        }


        #divQtdeLegenda {
            clear: both ;
            float : left;
            padding-top : 16px;
            margin-left: 2px;
        }

        #divQtde {           
            float : left;
            margin-left : 5px;
            padding-top: 10px;
        }



        #divPrecoLegenda {
            clear: both ;
            float : left;
            padding-top : 11px;
            margin-left: 2px;

        }

        #divPreco {           
            float : left;
            margin-left : 5px;
            padding-top: 5px;
        }

        #divTotalLegenda {
            clear: both ;
            float : left;
            padding-top : 11px;
            margin-left: 2px;

        }

        #divTotal {           
            float : left;
            margin-left : 5px;
            padding-top: 5px;
        }


        #divSalvar {
            clear: both ;
            float : left;
            padding-top : 7px;
             padding-left : 70px;

        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers >
            <asp:PostBackTrigger ControlID ="btnSalvar" />
            <asp:PostBackTrigger ControlID ="cboDia" />
        </Triggers>
        <ContentTemplate>

            

    <div id="divFilial">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
    </div>
   
    
    <div id="divBorda">

    <div id="divSecao">
        <uc1:wucListaSecao runat="server" ID="cboSecao" />
    </div>

    <div id="divRuaLegenda">
        
    </div>
    <div id="divRua">
        <asp:TextBox ID="txtRua" runat="server" MaxLength="99" Width="50" AutoPostBack="True" Visible="False"></asp:TextBox>
    </div>


    <div id="divEANLegenda">
        EAN:
    </div>
    <div id="divEAN">
        <%--<asp:TextBox ID="txtEAN1" runat="server" MaxLength="99" Width="140px" AutoPostBack="True" TabIndex="1"></asp:TextBox>--%>
        <dx:ASPxTextBox ID="txtEAN" runat="server" MaxLength="99" Width="140px" AutoPostBack="True" TabIndex="1" ClientInstanceName="txtEAN">
            <ClientSideEvents LostFocus="function(s, e) {
	cboDia.Focus();
}" TextChanged="function(s, e) {
	cboDia.Focus();
}" ValueChanged="function(s, e) {
	cboDia.Focus();
}" />
        </dx:ASPxTextBox>
    </div>

    <div id="divDescProduto">
        <asp:Label ID="lblDescProduto" runat="server" Font-Size="Medium"></asp:Label>
    </div>


    <div id="divDiaLegenda">
        Vencido em:
    </div>

    <div id="divDia">
        <dx:ASPxTextBox ID="cboDia" runat="server" Width="170px" TabIndex="2"  ClientInstanceName="cboDia" AutoPostBack="true" onfocus="this.select();"  >
            <MaskSettings AllowMouseWheel="False" Mask="dd/mm/yyyy" />
        </dx:ASPxTextBox>   
        
    </div>


    <div id="divQtdeLegenda">
        Quantidade:
    </div>
    <div id="divQtde">
        <dx:ASPxTextBox ID="txtQtde" runat="server" Width="100px" DisplayFormatString="{0:n3}" Font-Size="X-Large" Height="30px" Native="True" AutoPostBack="True" Text="0" HorizontalAlign="Right" TabIndex="3"></dx:ASPxTextBox>
    </div>



    <div id="divPrecoLegenda">
        Preço:
    </div>
    <div id="divPreco">
        <dx:ASPxTextBox ID="txtPreco" runat="server" Width="100px" DisplayFormatString="{0:n2}" Font-Size="X-Large" Height="30px" Native="True" AutoPostBack="True" Text="0" HorizontalAlign="Right" TabIndex="4"></dx:ASPxTextBox>
    </div>


    <div id="divTotalLegenda">
        <asp:Label ID="lblTotalLegenda" runat="server" Text="Total: " ></asp:Label>
    </div>
    <div id="divTotal">
        <asp:Label ID="lblTotal" runat="server" Font-Size="X-Large"></asp:Label>
    </div>



    </div>

    <div id="divSalvar">
        <asp:Button ID="btnSalvar" runat="server" Text="Salvar" Font-Size="Medium" ForeColor="Blue" UseSubmitBehavior="False" TabIndex="5" />
    </div>


        </ContentTemplate>
    </asp:UpdatePanel>

</asp:Content>

