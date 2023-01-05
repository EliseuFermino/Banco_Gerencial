<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wuciAno.ascx.vb" Inherits="Controles_wuciAno" %>
<p>
    Ano:
    <asp:DropDownList ID="cboAno" runat="server" DataSourceID="dsListaAno" 
        DataTextField="Ano" DataValueField="Ano">
    </asp:DropDownList>
    <asp:SqlDataSource ID="dsListaAno" runat="server" 
        ConnectionString="<%$ ConnectionStrings:gerCadastrosConnectionString %>" 
        SelectCommand="SELECT [Ano] FROM [tblCadAno] ORDER BY [Ano]">
    </asp:SqlDataSource>
</p>
