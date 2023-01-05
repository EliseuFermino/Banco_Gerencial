<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="MemberPages_Dashboards_Default" %>

<%@ Register Assembly="DevExpress.Dashboard.v18.2.Web.WebForms, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <dx:ASPxDashboard ID="ASPxDashboard1" runat="server" ColorScheme="dark" DashboardStorageFolder="~/App_Data" UseDashboardConfigurator="True"></dx:ASPxDashboard>

</asp:Content>

