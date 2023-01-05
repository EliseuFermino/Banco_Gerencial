<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucCheckBoxWithPanel.ascx.vb" Inherits="Controles_wucCheckBoxSLV" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<style type ="text/css" >

       #divExibir_AnoAnterior { 
            clear:both; 
            float: left;          
            margin-left: 2px;           
            padding-top: 2px;                                          
        }

        #divExibir_AnoAtual {  
            float: left;          
            margin-left: 10px;            
            padding-top: 2px;                                          
        }

        #divExibir_SellOut {
            float: left;          
            margin-left: 2px;           
            padding-top: 2px;          
        }

       #divExibir_CAI {  
            float: left;          
            margin-left: 2px;            
            padding-top: 2px;                                        
        }

        #divFixarCabecalho {
            float: left;          
            margin-left: 2px;            
            padding-top: 2px;                
        }

        #divExibirMesmosDias {
            float: left;
            margin-left: 10px;
            margin-top: 2px; 
        }

        #divMeta {
            float: left;
            margin-left: 10px;
            margin-top: 2px; 
        }

</style>

       <div id="divExibir_AnoAnterior">
            <dx:ASPxCheckBox ID="chkMostrar_AA" runat="server" Text="Ver Ano Anterior" Theme="DevEx" CheckState="Unchecked" Width="130px" ClientInstanceName="chkMostrar_AA" Visible="false" >
                <ClientSideEvents CheckedChanged="function(s, e) {	cbPanel.PerformCallback();}" />
            </dx:ASPxCheckBox> 
        </div>

        <div id="divExibir_AnoAtual">
            <dx:ASPxCheckBox ID="chkMostrar_AT" runat="server" Text="Ver Ano Atual" Theme="DevEx" CheckState="Unchecked" Width="120px" ClientInstanceName="chkMostrar_AT" Visible="false" >
                <ClientSideEvents CheckedChanged="function(s, e) {	cbPanel.PerformCallback();}" />
            </dx:ASPxCheckBox> 
        </div>

        <div id="divMeta">
            <dx:ASPxCheckBox ID="chkMostrar_Meta" runat="server" Text="Ver Meta" Theme="DevEx" CheckState="Unchecked" Width="115px" ClientInstanceName="chkMostrar_Meta" ForeColor="#009900" Visible="false"  >
                <ClientSideEvents CheckedChanged="function(s, e) {	cbPanel.PerformCallback();}" />
            </dx:ASPxCheckBox> 
         </div>

        <div id="divExibir_SellOut">
            <dx:ASPxCheckBox ID="chkMostrar_SellOut" runat="server" Text="Ver Sell-Out" Theme="DevEx" CheckState="Unchecked" Width="110px" ClientInstanceName="chkMostrar_SellOut" Visible="false" >
                <ClientSideEvents CheckedChanged="function(s, e) {	cbPanel.PerformCallback();}" />
            </dx:ASPxCheckBox> 
        </div> 

        <div id="divExibir_CAI">
            <dx:ASPxCheckBox ID="chkMostrar_CAI" runat="server" Text="Ver CAI" Theme="DevEx" CheckState="Unchecked" Width="90px" ClientInstanceName="chkMostrar_CAI" Visible="false" >
                <ClientSideEvents CheckedChanged="function(s, e) {	cbPanel.PerformCallback();}" />
            </dx:ASPxCheckBox> 
        </div>  

        <div id="divExibirMesmosDias">
            <dx:ASPxCheckBox ID="chkMostrar_MesmosDias" runat="server" Text="Mesmos Dias" Theme="DevEx" CheckState="Unchecked" Width="115px" ClientInstanceName="chkMostrar_MesmosDias" ForeColor ="blue" Visible="false"  >
                <ClientSideEvents CheckedChanged="function(s, e) {	cbPanel.PerformCallback();}" />
            </dx:ASPxCheckBox> 
         </div> 

        <div id="divFixarCabecalho" >
            <dx:ASPxCheckBox ID="chkFixarCabecalho" runat="server" Text="Fixar Cabeçalho" Checked="true" Theme="DevEx" Width="130px" Visible="false">
                 <ClientSideEvents CheckedChanged="function(s, e) {	cbPanel.PerformCallback();}" />
            </dx:ASPxCheckBox>
        </div> 
            




        
