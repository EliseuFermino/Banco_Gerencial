<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucOpcoesResultadoOne.ascx.vb" Inherits="Controles_wucOpcoesResultadoOne" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<style type="text/css">
    .auto-style1 {
        border-collapse: collapse;
        width: 150px;            
    }
    .auto-style2 {
        border-collapse: collapse;   
         width: 150px;   
    }
    .auto-style3 {
        color: #FFFFFF;
         width: 150px;
    }
</style>

<table align="left" cellpadding="0" class="auto-style1">
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Panel ID="pnlOpcoes" runat="server" Height="200px" Width="150px">
                <table align="left" class="auto-style2">
                    <tr>
                        <td bgcolor="#666666" class="auto-style3" style="text-align: center">Opções</td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxCheckBox ID="chkAnoAnterior" runat="server" AutoPostBack="True" 
                                Text="Mostrar Ano Anterior" Theme="DevEx">
                            </dx:ASPxCheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxCheckBox ID="chkMetaOriginal" runat="server" AutoPostBack="True" 
                                Text="Mostrar Meta Original" Theme="DevEx">
                            </dx:ASPxCheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxCheckBox ID="chkMetaRevista" runat="server" AutoPostBack="True" 
                                Text="Mostrar Meta Revista" Theme="DevEx">
                            </dx:ASPxCheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxCheckBox ID="chkMesAnterior" runat="server" AutoPostBack="True" 
                                Text="Mostrar Mês Anterior" Theme="DevEx">
                            </dx:ASPxCheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxCheckBox ID="chkRealizado" runat="server" AutoPostBack="True" 
                                Text="Mostrar Realizado" Theme="DevEx">
                            </dx:ASPxCheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxCheckBox ID="chkDiferencas" runat="server" AutoPostBack="True" 
                                Text="Mostrar Diferenças" Theme="DevEx">
                            </dx:ASPxCheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <dx:ASPxCheckBox ID="chkCrescimento" runat="server" AutoPostBack="True" 
                                Text="Mostrar Crescimento" Theme="DevEx">
                            </dx:ASPxCheckBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
</table>

