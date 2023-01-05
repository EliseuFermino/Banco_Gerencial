<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucListaAgendasContasReceber.ascx.vb" Inherits="wucListaAgendasContasReceber" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<style type ="text/css">
    #divSecaoDesc {
        float: left;
        width:55px
    }
    #divSecaoCbo {
        float: left;
        width:250px
    }
</style>

<div id="divSecaoDesc">
    Agenda:
</div>
<div id="divSecaoCbo">
    <dx:ASPxComboBox ID="cboAgenda" runat="server" DataSourceID="SqlDataSource1" Native="True" TextField="descAgenda" ValueField="idAgenda" Width="250px" SelectedIndex="0" ValueType="System.Int32"></dx:ASPxComboBox>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:gerKnowledgeConnectionString %>"                                       
        SelectCommand="Listas.AgendasDoContasReceber" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
</div>