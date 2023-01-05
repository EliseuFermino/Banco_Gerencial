<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucListaSecao_Depto5.ascx.vb" Inherits="wucListaSecao_Depto5" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<style type ="text/css">
    #divSecaoDesc {
        float: left;
        width:45px
    }
    #divSecaoCbo {
        float: left;
        width:150px
    }
</style>

<div id="divSecaoDesc">
    <asp:Label ID="lblSecao" runat="server" Text="Seção" Visible="false"></asp:Label>Seção:
</div>
<div id="divSecaoCbo">
    <dx:ASPxComboBox ID="cboSecao" runat="server" DataSourceID="SqlDataSource1" Native="True" TextField="ListaReduzida" ValueField="idSecao" Width="150px" SelectedIndex="0" ValueType="System.Byte"></dx:ASPxComboBox>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>"                                       
        SelectCommand="Cadastros.uspCboSecao_Depto5" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
</div>