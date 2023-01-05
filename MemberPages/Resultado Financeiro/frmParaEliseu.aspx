<%@ Page Language="VB" MasterPageFile="~/MemberPages/Resultado Financeiro/mpResultadoFinanceiro.master" AutoEventWireup="false" CodeFile="frmParaEliseu.aspx.vb" Inherits="MemberPages_Resultado_Financeiro_frmParaEliseu_Novo" title="Para Eliseu - Resultado Financeiro" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxlp" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style1
    {
        width: 100%;
    }

.dxeButtonEdit
{
    background-color: white;
    border: solid 1px #9F9F9F;
    width: 170px;
}

.dxeEditArea 
{
	font-family: Tahoma;
	font-size: 9pt;
	border: 1px solid #A0A0A0;
}
.dxeButtonEditButton,
.dxeSpinIncButton, .dxeSpinDecButton, .dxeSpinLargeIncButton, .dxeSpinLargeDecButton

.dxeButtonEditButton, .dxeCalendarButton,
.dxeSpinIncButton, .dxeSpinDecButton,
.dxeSpinLargeIncButton, .dxeSpinLargeDecButton
{	
	vertical-align: middle;
	border: solid 1px #7f7f7f;
	cursor: pointer;
	cursor: hand;
} 
    .style2
    {
        color: #666666;
        font-weight: bold;
    }
    .style3
    {
        width: 576px;
    }
        .style4
        {
            width: 119px;
        }
        .style5
        {
            width: 349px;
        }
        .style6
        {
            width: 283px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
    <table cellpadding="0" cellspacing="0" class="style1">
        <tr>
            <td align="right" class="style2">
                Ano:&nbsp;
            </td>
            <td class="style4">
                <dxe:ASPxComboBox runat="server" Width="68px" 
                    Height="16px" ID="cboAno" AutoPostBack="True" BackColor="#FFFFCC"><Items>                        
                        <dxe:ListEditItem Text="2018" Value="2018" />
                        <dxe:ListEditItem Text="2019" Value="2019" />
                        <dxe:ListEditItem Text="2020" Value="2020" />
                        <dxe:ListEditItem Text="2021" Value="2021" />
</Items>
                    <ClientSideEvents ValueChanged="function(s, e) {
	lp.Show();
}" />
</dxe:ASPxComboBox>

            </td>
            <td align="right" class="style2">
                Mês:&nbsp;&nbsp;
            </td>
            <td class="style3" style="padding-bottom: 2px">
                <dxe:ASPxComboBox runat="server" ValueType="System.String" Width="95px" 
                    AutoPostBack="True" ID="cboMes" Height="16px" BackColor="#FFFFCC"><Items>
                        <dxe:ListEditItem Text="Janeiro" Value="1"></dxe:ListEditItem>
                        <dxe:ListEditItem Text="Fevereiro" Value="2"></dxe:ListEditItem>
                        <dxe:ListEditItem Text="Mar&#231;o" Value="3"></dxe:ListEditItem>
                        <dxe:ListEditItem Text="Abril" Value="4"></dxe:ListEditItem>
                        <dxe:ListEditItem Text="Maio" Value="5"></dxe:ListEditItem>
                        <dxe:ListEditItem Text="Junho" Value="6"></dxe:ListEditItem>
                        <dxe:ListEditItem Text="Julho" Value="7"></dxe:ListEditItem>
                        <dxe:ListEditItem Text="Agosto" Value="8"></dxe:ListEditItem>
                        <dxe:ListEditItem Text="Setembro" Value="9"></dxe:ListEditItem>
                        <dxe:ListEditItem Text="Outubro" Value="10"></dxe:ListEditItem>
                        <dxe:ListEditItem Text="Novembro" Value="11"></dxe:ListEditItem>
                        <dxe:ListEditItem Text="Dezembro" Value="12"></dxe:ListEditItem>
                    </Items>

<ClientSideEvents SelectedIndexChanged="function(s, e) {

}" ValueChanged="function(s, e) {
	lp.Show();
}"></ClientSideEvents>
</dxe:ASPxComboBox>

            </td>
            <td class="style3" style="padding-bottom: 2px">
                &nbsp;</td>
            <td class="style5">
                <asp:HyperLink ID="HyperLink1" runat="server" 
                    NavigateUrl="~/MemberPages/Replanejamento/frmAP0154.aspx">Despesas</asp:HyperLink>
            &nbsp;&nbsp;
                <asp:HyperLink ID="HyperLink2" runat="server" 
                    NavigateUrl="~/Ranking/newRankPrincipal.aspx">Rank</asp:HyperLink>
            </td>
            <td class="style6">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <table cellpadding="0" cellspacing="0" class="style1">
        <tr>
            <td>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                        CellPadding="1" DataKeyNames="idFilial,Ano,Mes" DataSourceID="dsDados" 
                        ForeColor="Black" GridLines="Vertical" ShowFooter="True">
                        <RowStyle BackColor="#F4F4F4" HorizontalAlign="Right" />
                        <Columns>
                            <asp:CommandField SelectText="S" ShowSelectButton="True">
                                <FooterStyle BackColor="White" BorderStyle="None" />
                                <HeaderStyle BackColor="White" BorderStyle="None" />
                                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                                    ForeColor="Blue" HorizontalAlign="Center" />
                            </asp:CommandField>
                            <asp:BoundField DataField="idFilial" HeaderText="Filial" ReadOnly="True" 
                                SortExpression="idFilial">
                                <FooterStyle BackColor="White" BorderStyle="None" />
                                <HeaderStyle BackColor="#6699FF" />
                                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                                    HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Descricao" HeaderText="Descrição" 
                                SortExpression="Descricao">
                                <FooterStyle BackColor="White" BorderStyle="None" />
                                <HeaderStyle BackColor="#6699FF" />
                                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                                    HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="vlrPropaganda" DataFormatString="{0:N0}" 
                                HeaderText="Propaganda" HtmlEncode="False" SortExpression="vlrPropaganda">
                                <FooterStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                <HeaderStyle BackColor="#6699FF" />
                                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="vlrTranspValores" DataFormatString="{0:N0}" 
                                HeaderText="Transp. Valores" HtmlEncode="False" 
                                SortExpression="vlrTranspValores">
                                <FooterStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                <HeaderStyle BackColor="#6699FF" />
                                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="vlrLuz" DataFormatString="{0:N0}" HeaderText="Luz" 
                                HtmlEncode="False" SortExpression="vlrLuz">
                                <FooterStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                <HeaderStyle BackColor="#6699FF" />
                                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="vlrAgua" DataFormatString="{0:N0}" HeaderText="Água" 
                                HtmlEncode="False" SortExpression="vlrAgua">
                                <FooterStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                <HeaderStyle BackColor="#6699FF" />
                                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="vlrTelefone" DataFormatString="{0:N0}" 
                                HeaderText="Telefone" HtmlEncode="False" SortExpression="vlrTelefone">
                                <FooterStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                <HeaderStyle BackColor="#6699FF" />
                                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="vlrAluguel" DataFormatString="{0:N0}" 
                                HeaderText="Aluguel" HtmlEncode="False" SortExpression="vlrAluguel">
                                <FooterStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                <HeaderStyle BackColor="#6699FF" />
                                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="vlrRateioAdm" DataFormatString="{0:N0}" 
                                HeaderText="Rateio Adm" HtmlEncode="False" SortExpression="vlrRateioAdm">
                                <FooterStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                <HeaderStyle BackColor="#6699FF" />
                                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="vlrImpostoVendas" DataFormatString="{0:N0}" 
                                HeaderText="Imp. Vendas" HtmlEncode="False" SortExpression="vlrImpostoVendas">
                                <FooterStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                <HeaderStyle BackColor="#999966" />
                                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="vlrImpostoCompras" DataFormatString="{0:N0}" 
                                HeaderText="Imp. Compras" HtmlEncode="False" SortExpression="vlrImpostoCompras">
                                <FooterStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                <HeaderStyle BackColor="#999966" />
                                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="vlrImpostoExportacao" DataFormatString="{0:N0}" 
                                HeaderText="Imp. Exportação" HtmlEncode="False" 
                                SortExpression="vlrImpostoExportacao">
                                <FooterStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                                    HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:BoundField DataField="vlrImpostoDif" DataFormatString="{0:N0}" 
                                HeaderText="Imp. Dif." HtmlEncode="False" SortExpression="vlrImpostoDif">
                                <FooterStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                <HeaderStyle BackColor="#999966" />
                                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </asp:BoundField>
                        </Columns>
                        <FooterStyle BackColor="#E1E1E1" Font-Bold="True" HorizontalAlign="Right" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#FFFFCC" Font-Bold="True" ForeColor="Black" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    </td>
        </tr>
        <tr>
            <td>
                    <asp:SqlDataSource ID="dsDados" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerContSQL1ConnectionString %>" 
                        SelectCommand="uspResFin_ParaEliseu_View" 
                        SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="cboAno" Name="ano" 
                                PropertyName="Value" Type="Int16" />
                            <asp:ControlParameter ControlID="cboMes" Name="mes" 
                                PropertyName="Value" Type="Byte" />
                            <asp:ControlParameter ControlID="lblUserName" Name="userName" 
                                PropertyName="Text" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                &nbsp;<asp:Label ID="lblUSerName" runat="server" Text="Label" Visible="False"></asp:Label>
                </td>
        </tr>
    </table>
    <br />
</p>
</asp:Content>

