<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucBotaoExcel.ascx.vb" Inherits="Controles_wucBotaoAtualizar" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<dx:ASPxButton ID="btnExcel" runat="server" Text="Excel" Theme="Office2010Silver" 
    Width="60px" AllowFocus="False" Height="20px" ImageSpacing="2px" UseSubmitBehavior="False" >
    <Image Url="~/image/Excel-icon.png" Height="14px">
    </Image>
    <Paddings PaddingLeft="0px" />
</dx:ASPxButton>

<dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" >
</dx:ASPxGridViewExporter>



