<%@ Page Title="Ranking Total Abras 2011" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="RankingTotal.aspx.vb" Inherits="MemberPages_Abras_RankingTotal" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

<%--    <br />

    <dx:ASPxHyperLink ID="ASPxHyperLink1" runat="server" Text="Ver Todos Supermercadistas" Visible="true"  Font-Size="Large" NavigateUrl="~/MemberPages/Arquivos/Ranking_Nacional.pdf" Target="_blank">
    </dx:ASPxHyperLink>
        
    <br />--%>

    <asp:Image ID="Image1" runat="server" BorderColor="#99CCFF" BorderStyle="Solid" 
        BorderWidth="2px" ImageUrl="~/image/Ranking_Total.png" />
</asp:Content>

