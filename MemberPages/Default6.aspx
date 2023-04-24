<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Default6.aspx.vb" Inherits="MemberPages_Default6" %>

<%@ Register Assembly="DevExpress.XtraReports.v18.2.Web.WebForms, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraReports.Web" TagPrefix="dx" %>
<%@ Register Src="~/Controles/wucLista_Filial_Empresa.ascx" TagPrefix="uc1" TagName="wucLista_Filial_Empresa" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <uc1:wucLista_Filial_Empresa runat="server" ID="wucLista_Filial_Empresa" />

    <asp:Button ID="Button1" runat="server" Text="Twilio" />
    <asp:Label ID="lblMessage" runat="server" Text="Label" Font-Size="50px" ForeColor ="#009900"></asp:Label>

</asp:Content>

