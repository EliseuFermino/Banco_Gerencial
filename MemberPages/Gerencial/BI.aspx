<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="BI.aspx.vb" Inherits="MemberPages_Gerencial_BI" %>

<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" OLAPConnectionString="provider=MSOLAP;data source=WIN-DJITT2B93NO;cube name=&quot;Condor DW View&quot;" OLAPDataProvider="OleDb">
    </dx:ASPxPivotGrid>
</asp:Content>

