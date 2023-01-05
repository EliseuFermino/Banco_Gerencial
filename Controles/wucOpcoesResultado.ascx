<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucOpcoesResultado.ascx.vb" Inherits="Controles_wucOpcoesSLV" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<style type="text/css">
    .auto-style1 {
        border-collapse: collapse;
        width: 150px;
        float: left;
    }

    .auto-style2 {
        height: 21px;
    }

</style>

<table align="left" cellpadding="0" class="auto-style1">
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td align="center" style="color: #FFFFFF">
            <asp:Panel ID="Panel1" runat="server" BackColor="#999999" BorderColor="Gray" 
                BorderStyle="Solid" BorderWidth="1px" Visible="False">
                Períodos</asp:Panel>
        </td>
    </tr>
    <tr>
        <td>
                            <dx:ASPxCheckBox ID="chk1Periodo" runat="server" AutoPostBack="True" 
                                CheckState="Checked" Text="Mostrar 1º Período" ToolTip="Oculta ou Mostra o grupo de colunas do 1º Período. Exibe a Meta Original, Meta Revista e Realizado. Exibe o valor e o percentual." 
                                Visible="False" Theme="DevEx" Checked="True" ForeColor="#333333">
                            </dx:ASPxCheckBox>
                        </td>
    </tr>
    <tr>
        <td>
                            <dx:ASPxCheckBox ID="chk2Periodo" runat="server" AutoPostBack="True" 
                                CheckState="Checked" Text="Mostrar 2º Período" ToolTip="Oculta ou Mostra o grupo de colunas do 2º Período. Exibe a Meta Original, Meta Revista e Realizado. Exibe o valor e o percentual." 
                                Visible="False" Theme="DevEx" Checked="True" ForeColor="#333333">
                            </dx:ASPxCheckBox>
                        </td>
    </tr>
    <tr>
        <td>
                            <dx:ASPxCheckBox ID="chk3Periodo" runat="server" AutoPostBack="True" 
                                CheckState="Checked" Text="Mostrar 3º Período" ToolTip="Oculta ou Mostra o grupo de colunas do 3º Período. Exibe a Meta Original, Meta Revista e Realizado. Exibe o valor e o percentual." 
                                Visible="False" Theme="DevEx" ForeColor="#333333">
                            </dx:ASPxCheckBox>
                        </td>
    </tr>
    <tr>
        <td>
                            <dx:ASPxCheckBox ID="chkAcumulado" runat="server" AutoPostBack="True" 
                                CheckState="Checked" Text="Mostrar Acumulado" ToolTip="Oculta ou Mostra o grupo de colunas do Acumulado. Exibe a Meta Original, Meta Revista e Realizado. Exibe o valor e o percentual." 
                                Visible="False" Theme="DevEx" ForeColor="#333333">
                            </dx:ASPxCheckBox>
                        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="Silver" style="color: #FFFFFF">
            <asp:Panel ID="Panel2" runat="server" BorderColor="Gray" BorderStyle="Solid" 
                BorderWidth="1px" Visible="False">
                Meta Original</asp:Panel>
        </td>
    </tr>
    <tr>
        <td>
                            <dx:ASPxCheckBox ID="chkOriP1Vlr" runat="server" AutoPostBack="True" 
                                CheckState="Checked" Text="Valor do 1º Período" ToolTip="Oculta ou Mostra os valores" 
                                Visible="False" Theme="DevEx" Checked="True" ForeColor="Gray">
                            </dx:ASPxCheckBox>
                        </td>
    </tr>
    <tr>
        <td>
                            <dx:ASPxCheckBox ID="chkOriP2Vlr" runat="server" AutoPostBack="True" 
                                CheckState="Unchecked" Text="Valor do 2º Período" ToolTip="Oculta ou Mostra os percentuais" 
                                Visible="False" Theme="DevEx" ForeColor="Gray">
                            </dx:ASPxCheckBox>
                        </td>
    </tr>
    <tr>
        <td>
                            <dx:ASPxCheckBox ID="chkOriP3Vlr" runat="server" AutoPostBack="True" 
                                CheckState="Unchecked" Text="Valor do 3º Período" ToolTip="Oculta ou Mostra os percentuais" 
                                Visible="False" Theme="DevEx" ForeColor="Gray">
                            </dx:ASPxCheckBox>
                        </td>
    </tr>
    <tr>
        <td>
                            <dx:ASPxCheckBox ID="chkOriAcuVlr" runat="server" AutoPostBack="True" 
                                CheckState="Unchecked" Text="Valor do Acumulado" ToolTip="Oculta ou Mostra os percentuais" 
                                Visible="False" Theme="DevEx" ForeColor="Gray">
                            </dx:ASPxCheckBox>
                        </td>
    </tr>
    <tr>
        <td>
                            &nbsp;</td>
    </tr>
    <tr>
        <td>
                            <dx:ASPxCheckBox ID="chkOriP1Perc" runat="server" AutoPostBack="True" 
                                CheckState="Checked" Text="% do 1º Período" ToolTip="Oculta ou Mostra os valores" 
                                Visible="False" Theme="DevEx" Checked="True" ForeColor="Gray">
                            </dx:ASPxCheckBox>
                        </td>
    </tr>
    <tr>
        <td>
                            <dx:ASPxCheckBox ID="chkOriP2Perc" runat="server" AutoPostBack="True" 
                                CheckState="Checked" Text="% do 2º Período" ToolTip="Oculta ou Mostra os valores" 
                                Visible="False" Theme="DevEx" Checked="True" ForeColor="Gray">
                            </dx:ASPxCheckBox>
                        </td>
    </tr>
    <tr>
        <td>
                            <dx:ASPxCheckBox ID="chkOriP3Perc" runat="server" AutoPostBack="True" 
                                CheckState="Checked" Text="% do 3º Período" ToolTip="Oculta ou Mostra os valores" 
                                Visible="False" Theme="DevEx" Checked="True" ForeColor="Gray">
                            </dx:ASPxCheckBox>
                        </td>
    </tr>
    <tr>
        <td>
                            <dx:ASPxCheckBox ID="chkOriAcuPerc" runat="server" AutoPostBack="True" 
                                CheckState="Checked" Text="% do Acumulado" ToolTip="Oculta ou Mostra os valores" 
                                Visible="False" Theme="DevEx" Checked="True" ForeColor="Gray">
                            </dx:ASPxCheckBox>
                        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="Silver" style="color: #FFFFFF">
            <asp:Panel ID="Panel_Revista" runat="server" BorderColor="Gray" BorderStyle="Solid" 
                BorderWidth="1px" Visible="False">
                Meta Revista</asp:Panel>
        </td>
    </tr>
    <tr>
        <td class="auto-style2">
                            <dx:ASPxCheckBox ID="chkRevista_Tudo" runat="server" AutoPostBack="True" 
                                CheckState="Checked" Text="Mostrar Tudo" ToolTip="Oculta ou Mostra as colunas de percentual de participação de venda do ano atual." 
                                Visible="False" Theme="DevEx" Checked="True" ForeColor="Gray">
                            </dx:ASPxCheckBox>
                        </td>
    </tr>
    <tr>
        <td>
                            <dx:ASPxCheckBox ID="chkRevista_Valor" runat="server" AutoPostBack="True" 
                                CheckState="Unchecked" Text="Mostrar R$" ToolTip="Oculta ou Mostra as colunas de percentual de participação de venda do mês anterior." 
                                Visible="False" Theme="DevEx" ForeColor="Gray">
                            </dx:ASPxCheckBox>
                        </td>
    </tr>
    <tr>
        <td>
                            <dx:ASPxCheckBox ID="chkRevista_Perc" runat="server" AutoPostBack="True" 
                                CheckState="Unchecked" Text="Mostrar %" ToolTip="Oculta ou Mostra as colunas de percentual de participação de venda do ano anterior." 
                                Visible="False" Theme="DevEx" ForeColor="Gray">
                            </dx:ASPxCheckBox>
                        </td>
    </tr>
    <tr>
        <td align="center" bgcolor="Silver" style="color: #FFFFFF">
            <asp:Panel ID="Panel4" runat="server" BorderColor="Gray" BorderStyle="Solid" 
                BorderWidth="1px" Visible="False">
                Realizado</asp:Panel>
        </td>
    </tr>
    <tr>
        <td>
                            <dx:ASPxCheckBox ID="chkLucroAT" runat="server" AutoPostBack="True" 
                                CheckState="Checked" Text="Mostrar Lucro AT" ToolTip="Oculta ou Mostra a coluna de lucro do ano atual." 
                                Visible="False" Theme="DevEx" Checked="True" ForeColor="Gray">
                            </dx:ASPxCheckBox>
                        </td>
    </tr>
    <tr>
        <td>
                            <dx:ASPxCheckBox ID="chkLucroMA" runat="server" AutoPostBack="True" 
                                CheckState="Unchecked" Text="Mostrar Lucro MA" ToolTip="Oculta ou Mostra a coluna de lucro do mês anterior." 
                                Visible="False" Theme="DevEx" ForeColor="Gray">
                            </dx:ASPxCheckBox>
                        </td>
    </tr>
    <tr>
        <td>
                            <dx:ASPxCheckBox ID="chkLucroAA" runat="server" AutoPostBack="True" 
                                CheckState="Unchecked" Text="Mostrar Lucro AA" ToolTip="Oculta ou Mostra a coluna de lucro do ano anterior." 
                                Visible="False" Theme="DevEx" ForeColor="Gray">
                            </dx:ASPxCheckBox>
                        </td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
</table>

