<%@ Page Language="VB" AutoEventWireup="false" CodeFile="menuResFin.aspx.vb" Inherits="MemberPages_Resultado_Financeiro_menuResFin" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxtc" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxw" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxlp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
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
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 64px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table cellpadding="0" class="style1">
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <dxtc:ASPxTabControl ID="ASPxTabControl1" runat="server" ActiveTabIndex="0">
                        <Tabs>
                            <dxtc:Tab Text="Rateio Lojas - Financeiro CD">
                            </dxtc:Tab>
                            <dxtc:Tab Text="Tab 2">
                            </dxtc:Tab>
                            <dxtc:Tab Text="Tab 3">
                            </dxtc:Tab>
                        </Tabs>
                    </dxtc:ASPxTabControl>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:MultiView ID="multiTabs" runat="server" ActiveViewIndex="0">
                        <asp:View ID="View1" runat="server">
                            <table cellpadding="0" cellspacing="0" class="style1">
                                <tr>
                                    <td>
                                        <span class="style7"><b>&nbsp;Ano:
                                        <dxe:ASPxComboBox ID="cboAno" runat="server" AutoPostBack="True" 
                                            ValueType="System.String" Width="100px">
                                            <ClientSideEvents ValueChanged="function(s, e) {
	lp.Show();
}" />
                                            <Items>
                                                <dxe:ListEditItem Text="2014" Value="2014" />
                                                <dxe:ListEditItem Text="2015" Value="2015" />
                                                <dxe:ListEditItem Text="2016" Value="2016" />
                                            </Items>
                                        </dxe:ASPxComboBox>
                                        </b></span>
                                    </td>
                                    <td>
                                        <span class="style7"><b>Mês:</b></span>&nbsp;<dxe:ASPxComboBox ID="cboMes" 
                                            runat="server" AutoPostBack="True" ValueType="System.String" Width="150px">
                                            <ClientSideEvents SelectedIndexChanged="function(s, e) {

}" ValueChanged="function(s, e) {
	lp.Show();
}" />
                                            <Items>
                                                <dxe:ListEditItem Text="Janeiro" Value="1" />
                                                <dxe:ListEditItem Text="Fevereiro" Value="2" />
                                                <dxe:ListEditItem Text="Março" Value="3" />
                                                <dxe:ListEditItem Text="Abril" Value="4" />
                                                <dxe:ListEditItem Text="Maio" Value="5" />
                                                <dxe:ListEditItem Text="Junho" Value="6" />
                                                <dxe:ListEditItem Text="Julho" Value="7" />
                                                <dxe:ListEditItem Text="Agosto" Value="8" />
                                                <dxe:ListEditItem Text="Setembro" Value="9" />
                                                <dxe:ListEditItem Text="Outubro" Value="10" />
                                                <dxe:ListEditItem Text="Novembro" Value="11" />
                                                <dxe:ListEditItem Text="Dezembro" Value="12" />
                                            </Items>
                                        </dxe:ASPxComboBox>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                            <table cellpadding="0" cellspacing="0" class="style1">
                                <tr>
                                    <td align="center" valign="top">
                                        <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                                            AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" 
                                            GridLines="None" ShowFooter="True">
                                            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                            <Columns>
                                                <asp:CommandField SelectText="S" ShowSelectButton="True">
                                                    <FooterStyle BackColor="#F7F7F7" BorderStyle="None" />
                                                    <HeaderStyle BackColor="#F7F7F7" BorderStyle="None" />
                                                    <ItemStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                                                        ForeColor="Blue" />
                                                </asp:CommandField>
                                                <asp:BoundField DataField="DescFilial" HeaderText="Filial" 
                                                    SortExpression="DescFilial">
                                                    <FooterStyle BackColor="#F7F7F7" BorderStyle="None" />
                                                    <HeaderStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                                    <ItemStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="vlrVenda" DataFormatString="{0:n0}" 
                                                    HeaderText="Venda" HtmlEncode="False" SortExpression="vlrVenda">
                                                    <FooterStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                                                        HorizontalAlign="Right" />
                                                    <HeaderStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                                    <ItemStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                                                        HorizontalAlign="Right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="percPart" DataFormatString="{0:n2}" 
                                                    HeaderText="% Part" HtmlEncode="False" SortExpression="percPart">
                                                    <FooterStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                                                        HorizontalAlign="Right" />
                                                    <HeaderStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                                    <ItemStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                                                        HorizontalAlign="Right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="vlrFinancLoja" DataFormatString="{0:n0}" 
                                                    HeaderText="Financ. Loja" HtmlEncode="False" SortExpression="vlrFinancLoja">
                                                    <FooterStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                                                        HorizontalAlign="Right" />
                                                    <HeaderStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                                    <ItemStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                                                        HorizontalAlign="Right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="vlrFinancCD" DataFormatString="{0:n0}" 
                                                    HeaderText="Financ. CD" HtmlEncode="False" SortExpression="vlrFinancCD">
                                                    <FooterStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                                                        HorizontalAlign="Right" />
                                                    <HeaderStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                                    <ItemStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                                                        HorizontalAlign="Right" />
                                                </asp:BoundField>
                                                <asp:BoundField DataField="vlrFinanc" DataFormatString="{0:n0}" 
                                                    HeaderText="Financeiro" HtmlEncode="False" SortExpression="vlrFinanc">
                                                    <FooterStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                                                        HorizontalAlign="Right" />
                                                    <HeaderStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
                                                    <ItemStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" 
                                                        HorizontalAlign="Right" />
                                                </asp:BoundField>
                                            </Columns>
                                            <EditRowStyle BackColor="#999999" />
                                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                            <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                        </asp:GridView>
                                    </td>
                                    <td align="center" valign="top">
                                        <table cellpadding="4" class="style8">
                                            <tr>
                                                <td bgcolor="#CC3300" class="style9" 
                                                    style="text-align: center; border: 1px solid #999999; padding-left: 4px">
                                                    <b>Descrição</b></td>
                                                <td bgcolor="#CC3300" class="style2" 
                                                    style="border: 1px solid #999999; text-align: center; padding-right: 4px">
                                                    Valor</td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#F7F6F3" 
                                                    style="text-align: left; border: 1px solid #999999; padding-left: 4px">
                                                    Financeiro CD</td>
                                                <td bgcolor="#F7F6F3" class="style2" 
                                                    style="border: 1px solid #999999; text-align: right; padding-right: 4px">
                                                    <asp:Label ID="lbl_F01" runat="server" Text="Label"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="White" 
                                                    style="text-align: left; border: 1px solid #999999; padding-left: 4px">
                                                    Financeiro Trocas</td>
                                                <td bgcolor="White" class="style2" 
                                                    style="border: 1px solid #999999; text-align: right; padding-right: 4px">
                                                    <asp:Label ID="lbl_F12" runat="server" Text="Label"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td bgcolor="#F7F6F3" 
                                                    style="text-align: left; border: 1px solid #999999; padding-left: 4px">
                                                    Financeiro Ceasa</td>
                                                <td bgcolor="#F7F6F3" class="style2" 
                                                    style="border: 1px solid #999999; text-align: right; padding-right: 4px">
                                                    <asp:Label ID="lbl_F16" runat="server" Text="Label"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    &nbsp;</td>
                                                <td class="style2" 
                                                    style="border: 1px solid #999999; text-align: right; padding-right: 4px">
                                                    <asp:Label ID="lbl_FTotal" runat="server" Text="Label"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                            <br />
                            <table cellpadding="0" cellspacing="1" class="style1">
                                <tr>
                                    <td>
                                        <dxe:ASPxTextBox ID="lbl_UserName" runat="server" AutoPostBack="True" 
                                            Visible="False" Width="170px">
                                        </dxe:ASPxTextBox>
                                        <dxlp:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" 
                                            ClientInstanceName="lp" Modal="True"></dxlp:ASPxLoadingPanel>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                        </asp:View>
                        <asp:View ID="View2" runat="server">
                            View 2
                        </asp:View>
                        <asp:View ID="View3" runat="server">
                            View 3
                        </asp:View>
                        <asp:View ID="View4" runat="server">
                        </asp:View>
                        <asp:View ID="View5" runat="server">
                        </asp:View>
                        <asp:View ID="View6" runat="server">
                        </asp:View>
                        <asp:View ID="View7" runat="server">
                        </asp:View>
                        <asp:View ID="View8" runat="server">
                        </asp:View>
                        <asp:View ID="View9" runat="server">
                        </asp:View>
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                        <br />
                    </asp:MultiView>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
