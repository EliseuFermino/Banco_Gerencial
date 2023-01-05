<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucAnoMes.ascx.vb" Inherits="Controles_wuciAno" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register src="wucBotaoAtualizar.ascx" tagname="wucBotaoAtualizar" tagprefix="uc1" %>
<style type="text/css">
    .auto-style1 {
        width: 168px;
    }
    .auto-style3 {
        width: 168px;
    }
    .auto-style4 {
        width: 33px;
    }
    .auto-style5 {
        width: 44px;
    }
    .auto-style6 {
        width: 120px;
    }
</style>
<table align="left" class="auto-style1">
    <tr>
        <td class="auto-style4" align="left" valign="top">Ano:</td>
        <td align="left" class="auto-style3" valign="top">
            <dx:ASPxComboBox ID="cboAno" runat="server" DataSourceID="dsListaAno" 
                EnableTheming="True" TextField="Ano" Theme="SoftOrange" ValueField="Ano" 
                Width="70px" Native="True">
            </dx:ASPxComboBox>
    <asp:SqlDataSource ID="dsListaAno" runat="server" 
        ConnectionString="<%$ ConnectionStrings:gerCadastrosConnectionString %>" 
        SelectCommand="SELECT [Ano] FROM [tblCadAno] ORDER BY [Ano]">
    </asp:SqlDataSource>
        </td>
        <td align="left" class="auto-style5" valign="top">
            Mês:</td>
        <td align="left" valign="top" class="auto-style6">
            <dx:ASPxComboBox ID="cboMes" runat="server" EnableTheming="True" 
                SelectedIndex="1" Theme="SoftOrange" Width="110px" DropDownRows="12" 
                Native="True">
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
        </td>
        <td align="left" valign="top">
            <uc1:wucBotaoAtualizar ID="btnAtualizar" runat="server" />
        </td>
        <td align="left" valign="top">
            &nbsp;</td>
    </tr>
</table>

