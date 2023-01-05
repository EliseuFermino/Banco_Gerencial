<%@ Page Title="" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Default4.aspx.vb" Inherits="MemberPages_Default4" %>

<%@ Register Src="~/Controles/wucLista_Filial_Empresa.ascx" TagPrefix="uc1" TagName="wucLista_Filial_Empresa" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="FeaturedContent" Runat="Server">
     <uc1:wucLista_Filial_Empresa runat="server" ID="wucLista_Filial_Empresa" />
</asp:Content>


