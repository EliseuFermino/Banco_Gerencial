<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Testando7.aspx.vb" Inherits="MemberPages__BACK_Testando7" %>

<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <uc1:wucListaLojasComCorporacao runat="server" ID="wucListaLojasComCorporacao" />

    <asp:Button ID="Button1" runat="server" Text="Button" />

</asp:Content>

