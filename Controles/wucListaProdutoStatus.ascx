<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucListaProdutoStatus.ascx.vb" Inherits="wucListaProdutoStatus" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>



<asp:Label ID="lblProdutoStatus" runat="server" Text="Status: " AssociatedControlID=""></asp:Label>

<dxe:ASPxComboBox ID="cboStatus" runat="server" AutoPostBack="False" SettingsLoadingPanel-Text="" ShowShadow="False" 
Width="121px" Theme="DevEx" Native="True" ToolTip="Filtra os produtos do mercadológico em 'TODOS', 'ATIVO', 'DESCONTINUADO' e 'FORA DE LINHA',">
    <Items>
        <dxe:ListEditItem Text="Todos" Value="1" Selected="true" />
        <dxe:ListEditItem Text="Ativo" Value="2" />
        <dxe:ListEditItem Text="Descontinuado" Value="3" />
        <dxe:ListEditItem Text="Fora de Linha" Value="4" />                                                      
    </Items>
                                    
</dxe:ASPxComboBox>
    
 

