<%@ Page Title="Resultaso Teórico - Ajustes" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Sheet_Acertos.aspx.vb" Inherits="MemberPages_Resultado_Sheet_Acertos" %>

<%@ Register Assembly="DevExpress.Web.ASPxSpreadsheet.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpreadsheet" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

  
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


    <div >

        <dx:ASPxSpreadsheet ID="ASPxSpreadsheet1" runat="server" WorkDirectory="~/App_Data/WorkDirectory" Theme="Mulberry" FullscreenMode="True" ></dx:ASPxSpreadsheet>

    </div>

</asp:Content>

