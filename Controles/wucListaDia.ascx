<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucListaDia.ascx.vb" Inherits="wucMes" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


    

<table >
    <tr>
        <td>
            Dia: 
        </td>
        <td>
            <dxe:ASPxButton ID="btnVolta" runat="server" Text="&lt;" Theme="Default" 
                Width="20px" Wrap="False" Font-Size="Smaller" Height="10px"  UseSubmitBehavior="False">
                <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Atualizando informações. Aguarde...');}" />
            </dxe:ASPxButton>
        </td>
        <td >
            <dxe:ASPxDateEdit ID="cboDia" runat="server" Theme="DevEx" Width="120px" 
                AutoPostBack="True">                
            </dxe:ASPxDateEdit>
        </td>
        <td >
            <dxe:ASPxButton ID="btnAvanca" runat="server" Text="&gt;" Theme="Default" 
                Width="20px" Wrap="False" Font-Size="Smaller" UseSubmitBehavior="False">
                <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Atualizando informações. Aguarde...');}" />
            </dxe:ASPxButton>
        </td>
        <td >
            <asp:Label ID="lblDiaDaSemana" runat="server" Text="Label"></asp:Label>
        </td>
    </tr>
</table>

<dx:ASPxCallback ID="ASPxCallback1" runat="server" ClientInstanceName="Callback">
     <ClientSideEvents CallbackComplete="function(s, e) { LoadingPanel.Hide(); }" />
</dx:ASPxCallback>

<dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" ClientInstanceName="LoadingPanel"  
    Modal="True"  Text ="Atualizando Informações. Aguarde...">
</dx:ASPxLoadingPanel>



