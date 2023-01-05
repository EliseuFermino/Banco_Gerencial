<%@ Page Title="CheckList Controladoria Dev" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="CheckList_Controladoria.aspx.vb" Inherits="MemberPages_Manutencao_CheckList_Controladoria" %>

<%@ Register Assembly="DevExpress.Web.ASPxSpreadsheet.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxSpreadsheet" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type="text/css" >

        #divDados{
            width:100%;
            height: 100%;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <div id="divDados"> 
    
        <dx:ASPxSpreadsheet ID="ASPxSpreadsheet1" runat="server" WorkDirectory="~/App_Data/WorkDirectory" AutoSaveTimeout="00:15:00" FullscreenMode="False" Height="600px"  Width="100%">
            <Settings>
                <Behavior Copy="Enabled" Paste="Enabled">
                </Behavior>
            </Settings>
        </dx:ASPxSpreadsheet>

    </div>

</asp:Content>

