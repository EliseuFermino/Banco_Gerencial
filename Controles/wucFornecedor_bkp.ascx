<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucFornecedor_bkp.ascx.vb" Inherits="Controles_wucFornecedor" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>







<style type="text/css">
   
    .auto-style6 {
        width: 76px;
    }
</style>

<table align="left" >

    <tr>
        <td style="width:60px">
            Fornecedor:
        </td>
        <td>
            <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" ClientInstanceName="cbPanelForn" SettingsLoadingPanel-Text="Aguarde. Buscando informações...&amp;hellip;" Theme="Metropolis" SettingsLoadingPanel-Delay="0" SettingsLoadingPanel-Enabled="False">
                <PanelCollection>
                    <dx:PanelContent runat="server" ID="cbContent1"  SupportsDisabledAttributes="both">
                        <table>
                            <tr>                                
                                <td class="auto-style6">
                                    <dx:ASPxTextBox ID="txtProduto" runat="server" Width="70px" HorizontalAlign="Center" HelpText="Informe o código do fornecedor e pressione TAB" Text="0">
                                        <ClientSideEvents LostFocus="function(s, e) {
	cbPanelForn.PerformCallback();
}" ValueChanged="function(s, e) {
	cbPanelForn.PerformCallback();
}" />
                                        <HelpTextSettings DisplayMode="Popup" Position="Bottom">
                                        </HelpTextSettings>
                                    </dx:ASPxTextBox>
                                </td>
                                <td style="width:auto">
                                    <dx:ASPxLabel ID="lblDados" runat="server" Text="" AssociatedControlID="txtProduto"></dx:ASPxLabel> 

                                </td>
                            </tr>
                        </table>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </td>
        <td>
            
        </td>
    </tr>
</table>









