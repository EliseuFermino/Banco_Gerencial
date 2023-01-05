<%@ Page Language="VB" MasterPageFile="~/MemberPages/Resultado Financeiro/mpResultadoFinanceiro.master" AutoEventWireup="false" CodeFile="frmRateioFinanc.aspx.vb" Inherits="MemberPages_Resultado_Financeiro_frmRateioFinanc" title="Rateio Financeiro para Lojas - Resultado Financeiro" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxlp" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxpc" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxnb" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style4
    {
        width: 89%;
        border-collapse: collapse;
    }
.dxeTextBox, .dxeMemo
{
    background-color: white;
    border: solid 1px #9f9f9f;
}

.dxeEditArea 
{
	font-family: Tahoma;
	font-size: 9pt;
	border: 1px solid #A0A0A0;
}
    
.dxeEditArea 
{
	font-family: Tahoma;
	font-size: 9pt;
	border: 1px solid #A0A0A0;
}

.dxeEditArea 
{
	font-family: Tahoma;
	font-size: 9pt;
	border: 1px solid #A0A0A0;
}
    
.dxeEditArea 
{
	font-family: Tahoma;
	font-size: 9pt;
	border: 1px solid #A0A0A0;
}

    .style5
    {
        color: #808080;
        font-weight: bold;
    }
        .style6
        {
            width: 887px;
        }
        .style7
        {
            color: #FFFFFF;
            font-weight: bold;
        }
        .style8
        {
            width: 84px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
    <table cellpadding="0" class="style4">
        <tr>
            <td align="right">
                &nbsp;<span class="style5">Ano:</span>&nbsp;</td>
            <td class="style8" style="padding-bottom: 2px">
                <b __designer:mapid="444"><span __designer:mapid="445">
                <dxe:ASPxComboBox runat="server" ValueType="System.String" Width="70px" 
                    AutoPostBack="True" ID="cboAno" Height="16px" BackColor="#FFFFCC"><Items>
<dxe:ListEditItem Text="2014" Value="2014"></dxe:ListEditItem>
<dxe:ListEditItem Text="2015" Value="2015"></dxe:ListEditItem>
<dxe:ListEditItem Text="2016" Value="2016"></dxe:ListEditItem>
</Items>

<ClientSideEvents ValueChanged="function(s, e) {
	lp.Show();
}"></ClientSideEvents>
</dxe:ASPxComboBox>

                </span></b>
            </td>
            <td align="right" class="style5">
                Mes:</td>
            <td style="border-bottom-style: 2">
                <dxe:ASPxComboBox runat="server" ValueType="System.String" Width="100px" 
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
            <td>
                Rateio do Financeiro do CD para as Lojas</td>
            <td>
                <dxe:ASPxButton ID="ASPxButton1" runat="server" AutoPostBack="False" 
                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                    Text="Atualiza Teórico">
                    <ClientSideEvents Click="function(s, e) {
	lp.Show();
}" />
                </dxe:ASPxButton>
            </td>
        </tr>
    </table>
    <table cellpadding="0" class="style4">
        <tr>
            <td class="style6">
                <asp:GridView runat="server" AllowSorting="True" AutoGenerateColumns="False" 
                    CellPadding="1" GridLines="None" ShowFooter="True" ForeColor="#333333" 
                    ID="GridView1" Width="798px">
<RowStyle BackColor="#F7F6F3" ForeColor="#333333"></RowStyle>

<AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
<Columns>
<asp:CommandField SelectText="S" ShowSelectButton="True">
<FooterStyle BackColor="White" BorderStyle="None"></FooterStyle>

<HeaderStyle BackColor="White" BorderStyle="None"></HeaderStyle>

<ItemStyle BorderColor="#999999" BorderWidth="1px" BorderStyle="Solid" 
        ForeColor="Blue" HorizontalAlign="Center"></ItemStyle>
</asp:CommandField>
<asp:BoundField DataField="DescFilial" HeaderText="Filial" SortExpression="DescFilial">
<FooterStyle BackColor="White" BorderStyle="None"></FooterStyle>

<HeaderStyle BorderColor="#999999" BorderWidth="1px" BorderStyle="Solid" 
        Font-Bold="False"></HeaderStyle>

<ItemStyle BorderColor="#999999" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="vlrVenda" DataFormatString="{0:n0}" HeaderText="Venda" HtmlEncode="False" SortExpression="vlrVenda">
<FooterStyle HorizontalAlign="Right" BorderColor="#999999" BorderWidth="1px" BorderStyle="Solid"></FooterStyle>

<HeaderStyle BorderColor="#999999" BorderWidth="1px" BorderStyle="Solid" 
        Font-Bold="False"></HeaderStyle>

<ItemStyle HorizontalAlign="Right" BorderColor="#999999" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="percPart" DataFormatString="{0:n2}" HeaderText="% Part" HtmlEncode="False" SortExpression="percPart">
<FooterStyle HorizontalAlign="Right" BorderColor="#999999" BorderWidth="1px" BorderStyle="Solid"></FooterStyle>

<HeaderStyle BorderColor="#999999" BorderWidth="1px" BorderStyle="Solid" 
        Font-Bold="False"></HeaderStyle>

<ItemStyle HorizontalAlign="Right" BorderColor="#999999" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="vlrFinancLoja" DataFormatString="{0:n0}" HeaderText="Financ. Loja" HtmlEncode="False" SortExpression="vlrFinancLoja">
<FooterStyle HorizontalAlign="Right" BorderColor="#999999" BorderWidth="1px" BorderStyle="Solid"></FooterStyle>

<HeaderStyle BorderColor="#999999" BorderWidth="1px" BorderStyle="Solid" 
        Font-Bold="False"></HeaderStyle>

<ItemStyle HorizontalAlign="Right" BorderColor="#999999" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
    <asp:BoundField DataField="percFinancLoja" DataFormatString="{0:n2}" 
        HeaderText="%" HtmlEncode="False">
        <FooterStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
            HorizontalAlign="Right" />
        <HeaderStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
            Font-Bold="False" />
        <ItemStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
            HorizontalAlign="Right" />
    </asp:BoundField>
<asp:BoundField DataField="vlrFinancCD" DataFormatString="{0:n0}" HeaderText="Financ. CD" HtmlEncode="False" SortExpression="vlrFinancCD">
<FooterStyle HorizontalAlign="Right" BorderColor="#999999" BorderWidth="1px" BorderStyle="Solid"></FooterStyle>

<HeaderStyle BorderColor="#999999" BorderWidth="1px" BorderStyle="Solid" 
        Font-Bold="False"></HeaderStyle>

<ItemStyle HorizontalAlign="Right" BorderColor="#999999" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
    <asp:BoundField DataField="percFinancCD" DataFormatString="{0:n2}" 
        HeaderText="%" HtmlEncode="False">
        <FooterStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
            HorizontalAlign="Right" />
        <HeaderStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
            Font-Bold="False" />
        <ItemStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
            HorizontalAlign="Right" />
    </asp:BoundField>
<asp:BoundField DataField="vlrFinanc" DataFormatString="{0:n0}" HeaderText="Financeiro" HtmlEncode="False" SortExpression="vlrFinanc">
<FooterStyle HorizontalAlign="Right" BorderColor="#999999" BorderWidth="1px" BorderStyle="Solid"></FooterStyle>

<HeaderStyle BorderColor="#999999" BorderWidth="1px" BorderStyle="Solid" 
        Font-Bold="False"></HeaderStyle>

<ItemStyle HorizontalAlign="Right" BorderColor="#999999" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
    <asp:BoundField DataField="percFinanc" DataFormatString="{0:n2}" HeaderText="%" 
        HtmlEncode="False">
        <FooterStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
            HorizontalAlign="Right" />
        <HeaderStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
            Font-Bold="False" />
        <ItemStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
            HorizontalAlign="Right" />
    </asp:BoundField>
</Columns>

<EditRowStyle BackColor="#999999"></EditRowStyle>

<FooterStyle BackColor="#DFDFDF" Font-Bold="True" ForeColor="Black"></FooterStyle>

<HeaderStyle BackColor="#5D7B9D" Font-Bold="False" ForeColor="White"></HeaderStyle>

<PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>

<SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>
</asp:GridView>

            </td>
            <td valign="top">
                <table cellpadding="0" class="style4">
                    <tr>
                        <td bgcolor="#3399FF" 
                            style="text-align: left; border: 1px solid #999999; padding-left: 4px">
                            &nbsp;<span class="style7">Descrição&nbsp;</span></td>
                        <td bgcolor="#6699FF" class="style7" 
                            style="border: 1px solid #999999; text-align: center; padding-right: 4px">
                            Valor</td>
                    </tr>
                    <tr>
                        <td bgcolor="White" 
                            style="text-align: left; border: 1px solid #999999; padding-left: 4px">
                            &nbsp;Financeiro CD&nbsp;</td>
                        <td bgcolor="White" 
                            style="border: 1px solid #999999; text-align: right; padding-right: 4px">
                            <asp:Label runat="server" Text="Label" ID="lbl_F01"></asp:Label>

                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#F7F6F3" 
                            style="text-align: left; border: 1px solid #999999; padding-left: 4px">
                            &nbsp;Financeiro Trocas&nbsp;</td>
                        <td bgcolor="#F7F6F3" 
                            style="border: 1px solid #999999; text-align: right; padding-right: 4px">
                            <asp:Label runat="server" Text="Label" ID="lbl_F12"></asp:Label>

                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="White" 
                            style="text-align: left; border: 1px solid #999999; padding-left: 4px">
                            &nbsp;Financeiro Ceasa&nbsp;</td>
                        <td bgcolor="White" 
                            style="border: 1px solid #999999; text-align: right; padding-right: 4px">
                            <asp:Label runat="server" Text="Label" ID="lbl_F16"></asp:Label>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td bgcolor="#F7F6F3" 
                            style="border: 1px solid #999999; text-align: right; padding-right: 4px">
                            <asp:Label runat="server" Text="Label" ID="lbl_FTotal" style="font-weight: 700"></asp:Label>

                        </td>
                    </tr>
                </table>

            </td>
            <td valign="top">
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />

            </td>
            <td valign="top">
                &nbsp;</td>
            <td valign="top">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <dxe:ASPxTextBox runat="server" Width="170px" AutoPostBack="True" ID="lbl_UserName" Visible="False"></dxe:ASPxTextBox>

            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</p>
</asp:Content>

