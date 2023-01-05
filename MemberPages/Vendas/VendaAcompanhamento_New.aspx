<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="VendaAcompanhamento_New.aspx.vb" Inherits="MemberPages_Vendas_VendaAcompanhamento_New" %>

<%@ Register Src="~/Controles/wuc_KPI_Secao_Depto.ascx" TagPrefix="uc1" TagName="wuc_KPI_Secao_Depto" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <link href="../../css/bootstrap.css" rel="stylesheet" />
    <uc1:wuc_KPI_Secao_Depto runat="server" ID="wuc_KPI_Secao_Depto" />
</asp:Content>

