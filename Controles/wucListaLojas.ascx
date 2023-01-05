<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucListaLojas.ascx.vb" Inherits="Controles_wucListaLojas" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<style type ="text/css" >
    #divDescFilial {
        padding-right: 2px;
        float: left ;
    }
    #divDescCorporacao {
        float: left ; 
        padding-left: 2px;
               
    }
    #divWucFilial {        
        float: left ;
    }
    #divWucCorporacao {
        float: left ;
    }
</style>



<div id="divDescFilial">
    Filial
</div>

<div id="divWucFilial">
    <dxe:ASPxComboBox ID="cboFilial" runat="server" ValueType="System.String" Native="True" TextField="Desc" ValueField="Filial" Theme ="Default"></dxe:ASPxComboBox>
</div>

<div id="divDescCorporacao">
    <asp:Label ID="lblDescTipo" runat="server" Text="Tipo"></asp:Label>
</div>

<div id="divWucCorporacao">
    <dxe:ASPxComboBox ID="cboCorporacao" runat="server" Native="True" TextField="Desc" ValueField="Filial" Theme ="Default" AutoPostBack="True" Width="80px">
        <Items>
            <dxe:ListEditItem Text="Lojas" Value="3" />
            <dxe:ListEditItem Text="Empresa" Value="199" />
        </Items>
    </dxe:ASPxComboBox>
</div>

