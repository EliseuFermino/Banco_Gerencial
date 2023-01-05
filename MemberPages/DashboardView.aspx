<%@ Page Title="" Language="VB" MasterPageFile="~/mobile.master" AutoEventWireup="false" CodeFile="DashboardView.aspx.vb" Inherits="MemberPages_DashboardView" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Dashboard.v18.2.Web.WebForms, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.DashboardWeb" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript">
        function onBeforeRender(sender) {
            var control = sender.GetDashboardControl();
            control.registerExtension(new DevExpress.Dashboard.DashboardPanelExtension(control, { dashboardThumbnail: "../Content/DashboardThumbnail/{0}.png" }));
        }
    </script>
   
    

     
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <style>
        .dx-pivotgrid .dx-pivotgrid-area td {
            white-space: nowrap !important;
        }
        .dx-pivotgrid .dx-word-wrap .dx-pivotgrid-collapsed > span, .dx-pivotgrid .dx-word-wrap .dx-pivotgrid-expanded > span, .dx-pivotgrid .dx-word-wrap .dx-pivotgrid-sorted > span{
            white-space: nowrap !important;
        }
    </style>
  

    <dx:ASPxTimer ID="ASPxTimer1" runat="server" Interval="50000">
        <ClientSideEvents Tick="function(s, e) {  
dashboardViewer.ReloadData();  
}" />  
    </dx:ASPxTimer>

    <dx:ASPxDashboard ID="ASPxDashboard1" ClientInstanceName="dashboardViewer" runat="server" Width="100%" Height="100%" DashboardStorageFolder="~/App_Data/Dashboard" WorkingMode="Viewer">
         <ClientSideEvents BeforeRender="onBeforeRender" />
    </dx:ASPxDashboard>

   
    


</asp:Content>

