<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="404error.aspx.vb" Inherits="MemberPages_404error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        .centralizar {
            padding: 70px 70px 70px 70px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


    <div id="text" class ="centralizar">
            <asp:Label ID="Label1" runat="server" Font-Size="40px" Text="Estamos em Matutenção."></asp:Label>
    </div>
    



</asp:Content>

