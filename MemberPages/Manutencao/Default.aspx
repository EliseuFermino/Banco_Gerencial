<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="MemberPages_Manutencao_Default" %>

<%@ Register Src="~/Controles/wucListaDia.ascx" TagPrefix="uc1" TagName="wucListaDia" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <link href="../../css/bootstrap.min.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <uc1:wucListaDia runat="server" ID="cboDia" />
            </div>

            <div class="col-md-4 ">
                <asp:Button ID="btnAtualizar" runat="server" Text="Atualizar Clientes" />
                <br />
                <h2><asp:Label ID="lblPronto" runat="server" Text="" ></asp:Label></h2>
            </div>

        </div>

    </div>

</asp:Content>

