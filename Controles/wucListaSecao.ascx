<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucListaSecao.ascx.vb" Inherits="wucListaSecao" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<style type ="text/css">
   
    #divSecaoCbo {
        float: left;
        margin-left: 4px;
        margin-top: 3px;        
    }
</style>


<div id="divSecaoCbo">
    <dx:ASPxComboBox ID="cboSecao" runat="server" DataSourceID="SqlDataSource1" TextField="ListaReduzida" ValueField="idSecao" Width="200px" SelectedIndex="0" ValueType="System.Byte" Caption="Seção" Theme="Mulberry"></dx:ASPxComboBox>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>"                                       
        SelectCommand="Cadastros.uspCboSecao" SelectCommandType="StoredProcedure" >
        <SelectParameters>
            <asp:SessionParameter Name="idTipoLista" SessionField="sTIPO_LISTA" Type="Byte" DefaultValue="0" />
            <asp:SessionParameter Name="Matricula" SessionField="sMATRICULA" Type="String" DefaultValue="0" />
        </SelectParameters>
    </asp:SqlDataSource>
</div>

 <%--sTIPO_LIST  -   0 = Todos    1 = Comprador    2 = Gestor_Comercial--%>     