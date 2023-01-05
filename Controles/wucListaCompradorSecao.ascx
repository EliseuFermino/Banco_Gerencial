<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucListaCompradorSecao.ascx.vb" Inherits="wucListaComprador" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>
<%@ Register assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089" namespace="System.Web.UI.WebControls" tagprefix="asp" %>


<table cellpadding="0" cellspacing="0" class="style1">
    <tr>
        <td align="left" valign="top" width="80px">
            Comprador: 
        </td>

        <td align="left" valign="top" width="115px">
            <dxe:ASPxComboBox ID="cboComprador" runat="server" DataSourceID="dsComprador" 
                TextField="DescCompradorAbrev" Theme="DevEx" ValueField="idComprador" 
                AutoPostBack="True" Width="100px" Native="True">
            </dxe:ASPxComboBox>
            <asp:SqlDataSource ID="dsComprador" runat="server" 
                ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                                            
                SelectCommand="Cadastros.usp_Lista_Comprador" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="Comercial" Name="Categoria" SessionField="sCATEGORIA" Type="String" />
                    <asp:SessionParameter DefaultValue="0" Name="Matricula" SessionField="sMATRICULA" Type="String" />
                    <asp:SessionParameter DefaultValue="Todos" Name="Departamento" SessionField="sDEPARTAMENTO" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>

        <td align="left" valign="top" width="45px">             
            Seção:             
        </td>

        <td align="left" valign="top" width="205px" >             
            <dxe:ASPxComboBox ID="cboSecao" runat="server" Theme="DevEx" AutoPostBack="True" TextField="descSecao" 
                ValueField="idSecao" Width="200px" HorizontalAlign="Left" Native="True">
            </dxe:ASPxComboBox>             
        </td>
    </tr>
</table>
