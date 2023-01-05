<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucListaDepto.ascx.vb" Inherits="wucListaDepto" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<style type="text/css">
    .auto-style1 {
        width: 56px;
    }
</style>

<table cellpadding="0" cellspacing="0" class="style1">
    <tr>
        <td class="auto-style1" align="right">
            <span class="style3">Depto:&nbsp; </span>
        </td>
        <td>
                                        <dx:ASPxComboBox ID="cboDepto" runat="server" DataSourceID="SqlDataSource1" 
                                            EnableTheming="True" TextField="ListaDepto" Theme="DevEx" 
                                            ValueField="idDepto" Width="150px" HorizontalAlign="Left" 
                                            DropDownRows="20" Native="True" SelectedIndex="0">
                                        </dx:ASPxComboBox>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                                            
                                            
                                            SelectCommand="SELECT [idProdutoDepto] AS idDepto, descProdutoDeptoLista AS ListaDepto FROM [Cadastros].[tblCadDepto] WHERE idProdutoDepto &lt; 6 ORDER BY [idProdutoDepto]">
                                        </asp:SqlDataSource>
                                    </td>
    </tr>
</table>
