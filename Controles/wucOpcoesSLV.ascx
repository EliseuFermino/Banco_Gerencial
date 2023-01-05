<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucOpcoesSLV.ascx.vb" Inherits="Controles_wucOpcoesSLV" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<style type="text/css">
    .auto-style2 {
        width: 169px;
    }
    .auto-style3 {
        width: 81px;
    }
    .auto-style4 {
        width: 116px;
    }
    .auto-style5 {
        width: 173px;
    }

</style>

<table style="border: 1px dashed #C0C0C0; width: 456px; border-collapse: collapse; border-spacing: 0px;">
    <tr>
        <td class="auto-style2">
                            <dx:ASPxCheckBox ID="chkAnoAnterior" runat="server" AutoPostBack="True" 
                                CheckState="Unchecked" Text="Mostrar Ano Anterior" ToolTip="Oculta ou Mostra as colunas de Quantidade, Venda, Lucro e % de Margem do Ano Anterior." Theme="DevEx" ForeColor="#CC9900">
                            </dx:ASPxCheckBox>
                        </td>
        
        <td class="auto-style5">
                            <dx:ASPxCheckBox ID="chkAnoAtual" runat="server" AutoPostBack="True" 
                                CheckState="Checked" Text="Mostrar Ano Atual" 
                                ToolTip="Oculta ou Mostra as colunas de percentual de crescimento de venda." 
                                Theme="DevEx" Checked="True" ForeColor="Blue">
                            </dx:ASPxCheckBox>
                        </td>
        <td class="auto-style4">
                            <dx:ASPxCheckBox ID="chkMeta" runat="server" AutoPostBack="True" 
                                CheckState="Checked" Text="Mostrar Meta" ToolTip="Oculta ou Mostra as colunas de Meta de Venda e Meta de Margem (%)" Theme="DevEx" ForeColor="#009900" Checked="True">
                            </dx:ASPxCheckBox>
                        </td>        
    </tr>
</table>



