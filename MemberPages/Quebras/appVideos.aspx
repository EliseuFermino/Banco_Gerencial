<%@ Page Title="Videos" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="appVideos.aspx.vb" Inherits="MemberPages_Quebras_appVideos" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h4>Reunião de Estoque</h4>

    <video width="320" height="240" controls="controls" >
        <source src="Videos/AmostraReuniaoEstoques.webm" type="video/webm" />
        <source src="Videos/AmostraReuniaoEstoques.ogv" type="video/ogg" />
    </video>
</asp:Content>

