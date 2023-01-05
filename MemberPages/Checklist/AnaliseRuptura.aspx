<%@ Page Title="Análise de Ruptura" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="AnaliseRuptura.aspx.vb" Inherits="MemberPages_Checklist_AnaliseRuptura" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucListaDepto.ascx" TagPrefix="uc1" TagName="wucListaDepto" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">



    <style type="text/css" >

        #divLojas {
            clear: both;
            float: left;
        }

        #divDepto {
            clear: both;
            float: left;
            margin-top:4px;
            margin-left: -12px;
        }

        #divDiasTitulo {
            clear: both;
            float: left;
            margin-top:4px;            
        }

        #divDias {            
            float: left;
            margin-top:4px;  
            margin-left: 4px;          
        }

        .Cabecalho {
            border: 1px solid gray;
            padding-left: 50px;
           padding-right: 50px;
           background-color:dimgray;
           color: white ;
           
        }

        .Situacao {
            clear: both ;
            float: left;
        }

        .Bordas {
            border:solid 1px gray;
            margin: 1px;
            padding: 4px;
            float: left;
            margin-left: 2px;
            margin-top: 4px;

        }

        .ClasseVenda {
            float:left; margin-left: 15px;
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
            margin-top: 3px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divDados1" class="Bordas" style="clear:both " >
    
        <div id="divLojas">
            <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
        </div>

        <div id="divDepto">
            <uc1:wucListaDepto runat="server" ID="cboDepto" />
        </div>

        <div id="divDiasTitulo">
            Dias: 
        </div>

        <div id="divDias">
            <dx:ASPxTextBox ID="txtDias" runat="server" Width="40px"></dx:ASPxTextBox>
        </div>

    </div>

   <div id="divDados2" class="Bordas" >
    
       <div id="divSituacao" class="Cabecalho">
           Situação
       </div>

       <div id="divAtivo" class ="Situacao">
           <dx:ASPxCheckBox ID="ASPxCheckBox1" runat="server" Checked="true" Text="Ativo" Theme="DevEx" ></dx:ASPxCheckBox>
       </div>

       <div id="divForaDeLinha" class ="Situacao">
           <dx:ASPxCheckBox ID="ASPxCheckBox2" runat="server" Checked="true" Text="Fora de Linha" Theme="DevEx" ></dx:ASPxCheckBox>
       </div>

       <div id="divDescontinuado" class ="Situacao">
           <dx:ASPxCheckBox ID="ASPxCheckBox3" runat="server" Checked="false" Text="Descontinuado" Theme="DevEx" ></dx:ASPxCheckBox>
       </div>

    </div>

   <div id="divDados3" class="Bordas" >
    
       <div id="div2" class="Cabecalho">
           Sistemática
       </div>

       <div id="divSistematica1" class ="Situacao">
           <dx:ASPxCheckBox ID="ASPxCheckBox4" runat="server" Checked="false" Text="Centralizada" Theme="DevEx" ></dx:ASPxCheckBox>
       </div>

       <div id="divSistematica2" class ="Situacao">
           <dx:ASPxCheckBox ID="ASPxCheckBox5" runat="server" Checked="false" Text="Compra Cent. Entrega Lojas" Theme="DevEx" ></dx:ASPxCheckBox>
       </div>

       <div id="divSistematica3" class ="Situacao">
           <dx:ASPxCheckBox ID="ASPxCheckBox6" runat="server" Checked="true" Text="Entrega Lojas" Theme="DevEx" ></dx:ASPxCheckBox>
       </div>

    </div>

   <div id="divDados4" class="Bordas" >
    
       <div id="div3" class="Cabecalho">
           Classe de Venda
       </div>

       <div id="div4" class ="Situacao">
           <dx:ASPxCheckBox ID="ASPxCheckBox7" runat="server" Checked="True" Text="A" Theme="DevEx" ></dx:ASPxCheckBox>
       </div>

       <div id="div5" class="ClasseVenda">
           <dx:ASPxCheckBox ID="ASPxCheckBox8" runat="server" Checked="false" Text="B" Theme="DevEx" ></dx:ASPxCheckBox>
       </div>

       <div id="div6" class="ClasseVenda">
           <dx:ASPxCheckBox ID="ASPxCheckBox9" runat="server" Checked="false" Text="CA" Theme="DevEx" ></dx:ASPxCheckBox>
       </div>

       <div id="div1" class="ClasseVenda">
           <dx:ASPxCheckBox ID="ASPxCheckBox10" runat="server" Checked="false" Text="CB" Theme="DevEx" ></dx:ASPxCheckBox>
       </div>

       <div id="div7" class="ClasseVenda">
           <dx:ASPxCheckBox ID="ASPxCheckBox11" runat="server" Checked="false" Text="CC" Theme="DevEx" ></dx:ASPxCheckBox>
       </div>

    </div>

    <div id="divDados">
        <dx:ASPxGridView ID="ASPxGridView1" runat="server"></dx:ASPxGridView>
    </div>



</asp:Content>

