<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wuc_Exibir_Lojas_Atacarejos_Todos.ascx.vb" Inherits="Controles_wuc_Exibir_Lojas_Atacarejos_Todos" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<style type="text/css">

    #divTipo {
        margin-left: 5px;
        float: left ;
        margin-top: 2px;
    }

</style>

<div id="divTipo">
    
    <dx:ASPxComboBox ID="cboUnidade" runat="server" ValueType="System.Int32"  TextField="descUnidade_Mini" ValueField="idUnidade" ImageUrlField="icone" Caption="Unidade" Theme="Mulberry" DropDownRows="15" Width="125px" ShowImageInEditBox="true">
        <ItemImage Height="24px" Width="92px"></ItemImage>       
    </dx:ASPxComboBox>

</div>
