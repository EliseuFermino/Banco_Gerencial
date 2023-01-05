<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wuciListaLojasComApoio.ascx.vb" Inherits="wucListaLojasComApoio" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<table align="left" cellpadding="0">
    <tr>
        <td>
            <asp:Label ID="lblFilial" runat="server" Text="Filial:"></asp:Label>
        </td>
        <td>
            <dx:ASPxComboBox ID="cboFilial" runat="server" DataSourceID="dsLojas" 
                TextField="Desc" ValueField="Filial" DropDownRows="20" 
                Native="True" Width="150px" AutoPostBack="True">
            </dx:ASPxComboBox>
                            <asp:SqlDataSource ID="dsLojas" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>"                                      
                                            SelectCommand="SELECT Filial, RTRIM(FilialLista) AS [Desc] FROM Cadastros.tblCadFiliais WHERE (Tipo = 1) AND (Filial &lt;&gt; 2) AND (Filial &lt;&gt; 91) ORDER BY [Desc]">
                            </asp:SqlDataSource>
                                    </td>
    </tr>
</table>

