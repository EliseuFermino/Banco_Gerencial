<%@ Page Title="Menu Principal" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="menuPrincipal_2Bilhoes.aspx.vb" Inherits="MemberPages_menuPrincipal_2Bilhoes" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
     <style type ="text/css" >
           
        html {            
                overflow-x:hidden;            
            }

        #moldura {
                width:1024px; 
                margin: 0 auto ; 
                padding-top: 20px;                     
            }
         #Titulo {
            border: 3px solid gray;            
            border-radius: 10px;
            font-size: 30px;
            padding: 10px;
            text-align: center; 
            background-color:lightgray;           
         }

         #Dados {
            clear: both;
            float: left;
            text-align: center;  
            padding-top: 10px;          
         }


         #informacao {
            
            float: left;
            text-align: center; 
            font-size: 20px;           
         }

         #Atua {            
            float: left;
            text-align: center; 
            font-size: 15px;   
            padding-top:10px;
            color: red;        
         }

         
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
              <div id="moldura">

        <div id="Titulo">
            No dia de hoje (03/10/2013) nós atingiremos a venda de R$ 2 bilhões!!!
        </div>
        <div id="Dados">
           
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="Vendas.uspBuscarVendaAno_2bi" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
            <dx:ASPxDataView ID="ASPxDataView1" runat="server" AllowPaging="False" ColumnCount="1" DataSourceID="SqlDataSource1" Theme="Office2003Silver" Width="1000px">
                <ItemTemplate>
                    <b>Venda</b>:
                    <asp:Label ID="VendaLabel" runat="server" Text='<%# Eval("Venda") %>' />
                    <br/>

                </ItemTemplate>
                <ItemStyle Font-Size="50pt" HorizontalAlign="Center" ForeColor="Blue" >
                <Border BorderStyle="None" />
                </ItemStyle>
                <PagerStyle>
                <Border BorderStyle="None" />
                </PagerStyle>
                <Border BorderStyle="None" />
            </dx:ASPxDataView>

        </div>
        <div id="informacao">
            Esse valor de 2 Bilhões no ano passado foi atingindo no dia 26/11/2012. Atingiremos esse valor 54 dias antes!!!
            <br />            
        </div>

        <div id="Atua">
            Última atualização: <asp:Label ID="lblAtualizacao" runat="server" Text="Label"></asp:Label>
        </div>

    </div>
        </ContentTemplate>
    </asp:UpdatePanel>
             <asp:Timer ID="Timer1" runat="server" Interval="30000">
            </asp:Timer>
</asp:Content>

