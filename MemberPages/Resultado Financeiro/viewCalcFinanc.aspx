<%@ Page Language="VB" AutoEventWireup="false" CodeFile="viewCalcFinanc.aspx.vb" Inherits="MemberPages_Resultado_Financeiro_frmCalcFinanc" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxrp" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxp" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxlp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Calculo do Rateio do CD</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 98%;
            border-collapse: collapse;
        }
        .style3
        {
            color: #FFFFFF;
            font-weight: bold;
        }

        .style5
        {
            color: #666666;
        }
    
.dxeButtonEdit
{
    background-color: white;
    border: solid 1px #9F9F9F;
    width: 170px;
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
    .dxeButtonEditButton
{	
	vertical-align: middle;
	border: solid 1px #7f7f7f;
	cursor: pointer;
	cursor: hand;
} 
        .style7
        {
            width: 100%;
            cursor: default;
            border-width: 0px;
            margin-left: 1px;
            margin-right: 1px;
            margin-top: 0px;
            margin-bottom: 1px;
            padding: 0px;
            background-color: Transparent;
        }
        .style8
        {
            color: #808080;
        }
        .style9
        {
            width: 178px;
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
        </table>
    
    </div>
    <table cellpadding="0" class="style2">
        <tr>
            <td>
                <dxrp:ASPxRoundPanel ID="ASPxRoundPanel1" runat="server" 
                    HeaderText="Calculo do Rateio do Financeiro do CD para as Lojas" Height="295px" 
                    Width="888px">
                    <HeaderStyle HorizontalAlign="Center" Font-Size="Large" ForeColor="#6699FF" />
                    <ClientSideEvents Init="function(s, e) {
	lp.Show();
	lp.Hide();
}" />
                    <PanelCollection>
<dxp:PanelContent runat="server">
    <table cellpadding="0" class="style2">
        <tr>
            <td align="left" class="style9" valign="middle">
                <span class="style8"><b>Ano:</b></span> <b><span>
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
                </span></b>
            </td>
            <td>
                <span class="style5"><b>Mes: </b></span>
                <dxe:ASPxComboBox ID="cboMes" runat="server" AutoPostBack="True" 
                    ValueType="System.String" Width="150px">
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
            <td align="left" valign="middle">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <table cellpadding="0" class="style2">
        <tr>
            <td align="center" class="style5" valign="top">
                &nbsp;</td>
            <td align="center" class="style5" valign="top">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" class="style5" valign="top">
                <b>Calculo do Rateio do Financeiro do CD</b></td>
            <td align="center" class="style5" valign="top">
                <b>Financeiro do CD</b></td>
        </tr>
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
                <table cellpadding="4" class="style2">
                    <tr>
                        <td align="center" bgcolor="#CC3300" class="style3" 
                            style="text-align: center; border: 1px solid #999999; padding-left: 4px">
                            Descrição</td>
                        <td align="center" bgcolor="#CC3300" class="style3" 
                            style="border: 1px solid #999999; text-align: center; padding-right: 4px">
                            Valor</td>
                    </tr>
                    <tr>
                        <td bgcolor="#F7F6F3" 
                            style="text-align: left; border: 1px solid #999999; padding-left: 4px">
                            Financeiro CD</td>
                        <td bgcolor="#F7F6F3" 
                            style="border: 1px solid #999999; text-align: right; padding-right: 4px">
                            <asp:Label ID="lbl_F01" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left; border: 1px solid #999999; padding-left: 4px">
                            Financeiro Trocas</td>
                        <td style="border: 1px solid #999999; text-align: right; padding-right: 4px">
                            <asp:Label ID="lbl_F12" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td bgcolor="#F7F6F3" 
                            style="text-align: left; border: 1px solid #999999; padding-left: 4px">
                            Financeiro Ceasa</td>
                        <td bgcolor="#F7F6F3" 
                            style="border: 1px solid #999999; text-align: right; padding-right: 4px">
                            <asp:Label ID="lbl_F16" runat="server" Text="Label"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                        <td style="border: 1px solid #999999; text-align: right; padding-right: 4px">
                            <asp:Label ID="lbl_FTotal" runat="server" style="font-weight: 700" Text="Label"></asp:Label>
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
                <dxe:ASPxTextBox ID="lbl_UserName" runat="server" AutoPostBack="True" 
                    Visible="False" Width="170px">
                </dxe:ASPxTextBox>
                <br />
                <dxlp:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" 
                    ClientInstanceName="lp" Modal="True">
                </dxlp:ASPxLoadingPanel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <br />
    <table cellpadding="0" class="style2">
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <br />
                        </dxp:PanelContent>
</PanelCollection>
                </dxrp:ASPxRoundPanel>
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    </form>
</body>
</html>
