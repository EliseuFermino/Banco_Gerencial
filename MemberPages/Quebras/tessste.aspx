<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="tessste.aspx.vb" Inherits="MemberPages_Quebras_tessste" %>

<%@ Register Src="~/Controles/wucMercadologicoNew.ascx" TagPrefix="uc1" TagName="wucMercadologicoNew" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <uc1:wucMercadologicoNew runat="server" id="cboMercadologico" />

</asp:Content>

