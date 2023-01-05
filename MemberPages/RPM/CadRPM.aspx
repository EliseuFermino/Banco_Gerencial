<%@ Page Title="RPM" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="CadRPM.aspx.vb" Inherits="MemberPages_RPM_CadRPM" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Src="~/Controles/wucListaDia.ascx" TagPrefix="uc1" TagName="wucListaDia" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divDiaTitulo {
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divCadastro">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <div id="divDiaTitulo">
                    Dia
                </div>

                <div id="divDiaCadastro">
                    <dx:ASPxDateEdit ID="cboDia" runat="server" Width="100px"></dx:ASPxDateEdit>
                </div>

                <div id="divDescricaoTitulo">
                    Descrição da Tarefa
                </div>

                <div id="divDescricao">
                    <dx:ASPxMemo ID="txtDescricao" runat="server" Height="100px" Width="400px"></dx:ASPxMemo>                   
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>


    </div>

</asp:Content>

