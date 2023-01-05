<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wuciListaMes_LiberaTeorico.ascx.vb" Inherits="wucMes_LiberaTeorico" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<style type="text/css">
    

</style>
<table align="left" cellspacing="1" class="style3">
    <tr>
        <td >
            <asp:Label ID="lblDesc" runat="server" Text="Mês"></asp:Label>
        </td>
        <td>
                                                <dx:ASPxComboBox ID="cboMes" runat="server" EnableTheming="True" 
                                                    Theme="DevEx" Width="100px" DropDownRows="12" Native="True" 
                                                    AutoPostBack="True" DataSourceID="SqlDataSource1" TextField="descMesCompleto" ValueField="mes">
                                                    <Items>
                                                        <dx:ListEditItem Text="Janeiro" Value="1" />
                                                        <dx:ListEditItem Text="Fevereiro" Value="2" />
                                                        <dx:ListEditItem Text="Março" Value="3" />
                                                        <dx:ListEditItem Text="Abril" Value="4" />
                                                        <dx:ListEditItem Text="Maio" Value="5" />
                                                        <dx:ListEditItem Text="Junho" Value="6" />
                                                        <dx:ListEditItem Text="Julho" Value="7" />
                                                        <dx:ListEditItem Text="Agosto" Value="8" />
                                                        <dx:ListEditItem Text="Setembro" Value="9" />
                                                        <dx:ListEditItem Text="Outubro" Value="10" />
                                                        <dx:ListEditItem Text="Novembro" Value="11" />
                                                        <dx:ListEditItem Text="Dezembro" Value="12" />
                                                    </Items>
                                                </dx:ASPxComboBox>
                                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerCadastrosConnectionString %>" SelectCommand="Cadastros.listMes_LiberaTeorico" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
        </td>
    </tr>
</table>

