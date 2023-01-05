<%@ Page Title="" Language="VB" MasterPageFile="~/mobile.master" AutoEventWireup="false" CodeFile="DesignerPage.aspx.vb" Inherits="DesignerPage" %>

<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" ></asp:ScriptManager>

    <uc1:wuciListaMes runat="server" ID="wuciListaMes" AutoPostBack="true" />

    <asp:Label ID="lblText" runat="server" Text="Label"></asp:Label>

</asp:Content>

