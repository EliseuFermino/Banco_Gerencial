<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/mpDashboard.master" AutoEventWireup="false" CodeFile="Dashboard_Designer.aspx.vb" Inherits="MemberPages_Dashboard_Designer" %>

<%@ Register Assembly="DevExpress.Dashboard.v18.2.Web.WebForms, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <dx:ASPxDashboard ID="ASPxDashboard1" runat="server" DashboardStorageFolder="~/App_Data/Dashboard">
    </dx:ASPxDashboard>
</asp:Content>

