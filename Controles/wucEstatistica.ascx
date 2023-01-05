<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucEstatistica.ascx.vb" Inherits="Controles_wucEstatistica" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<style type="text/css">
    .auto-style1 {
        border-collapse: collapse;
        width: 100%;
        float: left;
    }
    .auto-style2 {
        width: 231px;
    }
    .auto-style3 {
        width: 189px;
    }
    .auto-style4 {
        height: 14px;
    }
</style>

<table align="left" class="auto-style1">
    <tr>
        <td align="left" class="auto-style2" valign="top" rowspan="2">
            <asp:Panel ID="Panel1" runat="server" Height="350px" Width="220px">
                <table align="left" cellpadding="0" 
                    style="width: 100%; float: left; border-collapse: collapse">
                    <tr>
                        <td align="center" bgcolor="#4A5A90" style="border: 1px solid #808080">
                            <asp:Label ID="Label1" runat="server" Text="Estatística" Font-Bold="True" 
                                Font-Size="X-Large" ForeColor="White"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" bgcolor="#999999" style="border: 1px solid #808080">
                            <asp:Label ID="lblTitleContagem1" runat="server" Font-Bold="True" 
                                Font-Size="Large" ForeColor="White" Text="1º Contagem"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table style="border-collapse: collapse; width: 100%; float: left">
                    <tr>
                        <td style="border: 1px solid #999999; width: 91px;">Total</td>
                        <td align="center" style="border: 1px solid #999999; width: 54px;">
                            <asp:Label ID="lblTotal" runat="server">0</asp:Label>
                        </td>
                        <td align="right" style="border: 1px solid #999999;">
                            <asp:Label ID="Label3" runat="server" Text="100,00%"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #999999; width: 91px;">Despachados</td>
                        <td align="center" style="border: 1px solid #999999; width: 54px;">
                            <asp:Label ID="lblDespachados1" runat="server" Text="0"></asp:Label>
                        </td>
                        <td align="right" style="border: 1px solid #999999;">
                            <asp:Label ID="lblCalcDespachado1" runat="server" Text="0"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #999999; width: 91px;">OK</td>
                        <td align="center" style="border: 1px solid #999999; width: 54px;">
                            <asp:Label ID="lblBaixa1" runat="server" Text="0"></asp:Label>
                        </td>
                        <td align="right" style="border: 1px solid #999999;">
                            <asp:Label ID="lblCalcBaixa1" runat="server" Text="0"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="padding-left: 7px">&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" bgcolor="#6699FF" colspan="3" 
                            style="border: 1px solid #808080;">
                            <asp:Label ID="lblTitleContagem2" runat="server" Font-Bold="True" 
                                Font-Size="Large" ForeColor="White" Text="2º Contagem"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #808080;">Total</td>
                        <td align="center" style="border: 1px solid #808080">
                            <asp:Label ID="lblTotal2" runat="server">0</asp:Label>
                        </td>
                        <td align="right" style="border: 1px solid #808080;">100,00%</td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #808080;">Despachados</td>
                        <td align="center" style="border: 1px solid #808080">
                            <asp:Label ID="lblDespachados2" runat="server" Text="0"></asp:Label>
                        </td>
                        <td align="right" style="border: 1px solid #808080;">100,00%</td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #808080;">OK</td>
                        <td align="center" style="border: 1px solid #808080">
                            <asp:Label ID="lblBaixa2" runat="server" Text="0"></asp:Label>
                        </td>
                        <td align="right" style="border: 1px solid #808080;">
                            <asp:Label ID="lblCalcBaixa2" runat="server" Text="0"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="padding-left: 7px">&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" bgcolor="#6699FF" colspan="3" 
                            style="border: 1px solid #808080;">
                            <asp:Label ID="lblTitleContagem3" runat="server" Font-Bold="True" 
                                Font-Size="Large" ForeColor="White" Text="3º Contagem"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #808080;">Total</td>
                        <td align="center" style="border: 1px solid #808080;">
                            <asp:Label ID="lblTotal3" runat="server">0</asp:Label>
                        </td>
                        <td align="right" style="border: 1px solid #808080;">100,00%</td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #808080;">Despachados</td>
                        <td align="center" style="border: 1px solid #808080;">
                            <asp:Label ID="lblDespachados3" runat="server" Text="0"></asp:Label>
                        </td>
                        <td align="right" style="border: 1px solid #808080;">100,00%</td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #808080;">OK</td>
                        <td align="center" style="border: 1px solid #808080;">
                            <asp:Label ID="lblBaixa3" runat="server" Text="0"></asp:Label>
                        </td>
                        <td align="right" style="border: 1px solid #808080;">
                            <asp:Label ID="lblCalcBaixa3" runat="server" Text="0"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <br />
            </asp:Panel>
        </td>
        <td align="left" valign="top" class="auto-style3" rowspan="2">
            <dx:ASPxGridView ID="ASPxGridView1" runat="server" DataSourceID="dsRanking" 
                AutoGenerateColumns="False" Theme="PlasticBlue" Width="170px">
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="Lotes" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Equipe" FieldName="CodEquip" 
                        VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Itens" VisibleIndex="3">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsPager Mode="ShowAllRecords">
                </SettingsPager>
                <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="400" 
                    ShowTitlePanel="True" />
                <SettingsText Title="Ranking" EmptyDataRow="Aguarde..." />
                <Styles>
                    <Header HorizontalAlign="Center">
                    </Header>
                    <Cell HorizontalAlign="Center">
                    </Cell>
                </Styles>
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="dsRanking" runat="server" 
                ConnectionString="<%$ ConnectionStrings:gerInvConnectionString %>" 
                SelectCommand="Programa.uspViewRankingEquipe" SelectCommandType="StoredProcedure">
            </asp:SqlDataSource>
        </td>
        <td align="left" valign="top" class="auto-style4">
            <asp:RadioButton ID="rndEquipe" runat="server" AutoPostBack="True" 
                GroupName="rndGrupo" Text="Equipe" />
&nbsp;
            <asp:RadioButton ID="rndLote" runat="server" AutoPostBack="True" 
                GroupName="rndGrupo" Text="Lote" />
        </td>
        <td align="left" valign="top" rowspan="2">&nbsp;</td>
    </tr>
    <tr>
        <td align="left" valign="top">
            <dx:ASPxGridView ID="gridDuracaoEquipe" runat="server" 
                DataSourceID="dsDuracaoPorEquipe" AutoGenerateColumns="False" 
                Width="150px">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Equipe" FieldName="CodEquipe" 
                        VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Tempo" ReadOnly="True" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsPager Mode="ShowAllRecords">
                </SettingsPager>
                <Settings ShowTitlePanel="True" ShowVerticalScrollBar="True" 
                    VerticalScrollableHeight="400" />
                <SettingsText Title="Duração" EmptyDataRow="Aguarde..." />
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="dsDuracaoPorEquipe" runat="server" 
                ConnectionString="<%$ ConnectionStrings:gerInvConnectionString %>" 
                SelectCommand="SELECT [CodEquipe], [Cont1], [Tempo] FROM [Programa].[viewDuracaoPorEquipe]">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="dsDuracaoPorLote" runat="server" 
                ConnectionString="<%$ ConnectionStrings:gerInvConnectionString %>"                 
                SelectCommand="SELECT [Lote], [Tempo] FROM [Programa].[viewDuracaoPorLote]">
            </asp:SqlDataSource>
            <dx:ASPxGridView ID="gridDuracaoLote" runat="server" 
                DataSourceID="dsDuracaoPorLote" AutoGenerateColumns="False" 
                Width="150px" Visible="False">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Lote" FieldName="Lote" 
                        VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Tempo" ReadOnly="True" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsPager Mode="ShowAllRecords">
                </SettingsPager>
                <Settings ShowTitlePanel="True" ShowVerticalScrollBar="True" 
                    VerticalScrollableHeight="400" />
                <SettingsText Title="Duração" EmptyDataRow="Aguarde..." />
            </dx:ASPxGridView>
        </td>
    </tr>
</table>

