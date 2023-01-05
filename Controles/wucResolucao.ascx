<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucResolucao.ascx.vb" Inherits="Controles_wucResolucao" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<dx:ASPxComboBox ID="cboResolucao" runat="server" EnableTheming="True" Theme="Default" Width="100px">
    <Items>
        <dx:ListEditItem Text="800 x 600" Value="1" />
        <dx:ListEditItem Text="1024 x 768" Value="2" />
        <dx:ListEditItem Text="1366 x 768" Value="3" />
        <dx:ListEditItem Text="1600 x 900" Value="4" />
    </Items>
</dx:ASPxComboBox>

