<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/SiteVendas.master" AutoEventWireup="false" CodeFile="BomDiaEconomia.aspx.vb" Inherits="MemberPages_Vendas_Reports_BomDiaEconomia" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

   <div id="divDados">
       <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%" EnableTheming="True" KeyFieldName="Dia" Theme="SoftOrange">
           <SettingsPager PageSize="25">
           </SettingsPager>
           <Settings HorizontalScrollBarMode="Auto" ShowFilterRow="True" />
           <SettingsBehavior AllowFocusedRow="True" />
           <Columns>
               <dx:GridViewDataDateColumn FieldName="Dia" VisibleIndex="1" Caption="Dia" SortIndex="0" SortOrder="Descending">
                   <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
               </dx:GridViewDataDateColumn>
               <dx:GridViewDataTextColumn FieldName="nomeDiaSemana" VisibleIndex="2" Caption="Nome do Dia">
                   <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
               </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn FieldName="Qtde" VisibleIndex="3">
                   <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                   </PropertiesTextEdit>
                   <Settings AllowAutoFilter="False" />
               </dx:GridViewDataTextColumn>
               
               <dx:GridViewDataTextColumn FieldName="vlrVenda" VisibleIndex="4" Caption="Venda">
                   <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                   </PropertiesTextEdit>
                   <Settings AllowAutoFilter="False" />
               </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn FieldName="vlrLucroComercial" VisibleIndex="5" Caption="Lucro PDV">
                   <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                   </PropertiesTextEdit>
                   <Settings AllowAutoFilter="False" />
               </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn FieldName="LucroSellOut" VisibleIndex="6" Caption="Lucro SellOut">
                   <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                   </PropertiesTextEdit>
                   <Settings AllowAutoFilter="False" />
               </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn FieldName="vlrFinal" ReadOnly="True" VisibleIndex="7" Caption="Lucro Final">
                   <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                   </PropertiesTextEdit>
                   <Settings AllowAutoFilter="False" />
               </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn FieldName="percMargemPDV" ReadOnly="True" VisibleIndex="9" Caption="% Marg PDV">
                   <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                   </PropertiesTextEdit>
                   <Settings AllowAutoFilter="False" />
               </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn FieldName="numCliente" VisibleIndex="8">
                   <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                   </PropertiesTextEdit>
                   <Settings AllowAutoFilter="False" />
               </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn FieldName="percMargemFinal" ReadOnly="True" VisibleIndex="11" Caption="% Marg Final">
                   <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                   </PropertiesTextEdit>
                   <Settings AllowAutoFilter="False" />
               </dx:GridViewDataTextColumn>
               <dx:GridViewDataTextColumn FieldName="percSellOut" ReadOnly="True" VisibleIndex="10" Caption="% SellOut">
                   <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                   </PropertiesTextEdit>
                   <Settings AllowAutoFilter="False" />
               </dx:GridViewDataTextColumn>
           </Columns>
           <Styles>
               <AlternatingRow BackColor="#E6E6E6">
               </AlternatingRow>
               <FocusedRow BackColor="Yellow" ForeColor="Blue">
               </FocusedRow>
           </Styles>
       </dx:ASPxGridView>
   </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:VendasConnectionString %>" SelectCommand="SELECT [Dia], [Qtde], [nomeDiaSemana], [vlrVenda], [vlrLucroComercial], [LucroSellOut], [vlrFinal], [percMargemPDV], [numCliente], [percMargemFinal], [percSellOut] FROM [vw_Vendas_BomDiaEconomia] ORDER BY Dia DESC"></asp:SqlDataSource>

</asp:Content>

