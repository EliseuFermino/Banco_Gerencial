<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucListaLojasComCorporacao.ascx.vb" Inherits="Controles_wucListaLojasComCorporacao" %>
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

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <Triggers>
        <asp:PostBackTrigger ControlID="cboFilial" />
        <asp:PostBackTrigger ControlID="cboCorporacao" />
    </Triggers>
    <ContentTemplate>


<div id="divDescFilial" >
    Filial
</div>


<div id="divWucFilial">
    <dxe:ASPxComboBox ID="cboFilial" runat="server" ValueType="System.String" Native="True" TextField="Desc" ValueField="Filial" Theme ="Default" DropDownRows="15"></dxe:ASPxComboBox>
</div>


<div id="divDescCorporacao">
    <asp:Label ID="lblDescTipo" runat="server" Text="Tipo"></asp:Label>
</div>


<div id="divWucCorporacao">
    <dxe:ASPxComboBox ID="cboCorporacao" runat="server" Native="True" TextField="descUnidade" ValueField="idUnidade" Theme ="Default" DropDownRows="15" AutoPostBack="True" Width="80px" DataSourceID="SqlDataSource1">
        
    </dxe:ASPxComboBox>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerCadastrosConnectionString %>" SelectCommand="SELECT [idUnidade], [descUnidade] FROM Cad.tblUnidade"></asp:SqlDataSource>
</div>

            </ContentTemplate>
</asp:UpdatePanel>