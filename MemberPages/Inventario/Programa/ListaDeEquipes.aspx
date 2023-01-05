<%@ Page Title="Lista de Equipes" Language="VB" MasterPageFile="~/MemberPages/Inventario/Programa/SiteInventario.master" AutoEventWireup="false" CodeFile="ListaDeEquipes.aspx.vb" Inherits="MemberPages_Inventario_Programa_ListaDeEquipes" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>




<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="SqlDataSource1" KeyFieldName="CodEquipe" Width="110px">
        <Columns>
            <dx:GridViewDataTextColumn Caption="Equipe" FieldName="CodEquipe" 
                ReadOnly="True" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Nivel" FieldName="idNivel" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
        </Columns>
        <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="400" />
    </dx:ASPxGridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:gerInvConnectionString %>" 
        SelectCommand="SELECT [CodEquipe], [idNivel] FROM [Programa].[tblEquipe]">
    </asp:SqlDataSource>
</asp:Content>

