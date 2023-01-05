<%@ Page Language="VB" MasterPageFile="~/MemberPages/Resultado Financeiro/mpResultadoFinanceiro.master" AutoEventWireup="false" CodeFile="frmResumoFinanceiro.aspx.vb" Inherits="MemberPages_Resultado_Financeiro_frmResumoFinanceiro" title="Untitled Page" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxrp" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxp" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxlp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style4
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
        .style5
    {
        width: 100%;
        border-collapse: collapse;
    }
    .style6
    {
        color: #808080;
        font-weight: bold;
    }
    .style7
    {
        width: 52px;
    }
        .style8
        {
            width: 130px;
        }
        .style9
        {
            color: #666666;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" class="style4">
        <tr>
            <td>

                <table cellpadding="0" class="style5">
                    <tr>
                        <td class="style7">
                            &nbsp;<span class="style6">Ano :&nbsp;</span></td>
                        <td style="padding-bottom: 2px" class="style8">
                <dxe:ASPxComboBox runat="server" Width="60px" AutoPostBack="True" ID="ASPxComboBox1"><Items>
<dxe:ListEditItem Text="2016" Value="2016"></dxe:ListEditItem>
<dxe:ListEditItem Text="2017" Value="2017"></dxe:ListEditItem>
<dxe:ListEditItem Text="2018" Value="2018"></dxe:ListEditItem>
</Items>
                    <ClientSideEvents ValueChanged="function(s, e) {
	lp.Show();
}" />
</dxe:ASPxComboBox>

                        </td>
                        <td>
                            &nbsp;<span class="style9">Resumo do Resultado Financeiro</span> &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
                <table cellpadding="0" class="style5">
                    <tr>
                        <td align="left">
                <asp:GridView runat="server" AutoGenerateColumns="False" CellPadding="1" GridLines="None" 
                                ShowFooter="True" DataSourceID="dsDados" ForeColor="#333333" ID="GridView1">
<RowStyle HorizontalAlign="Right" BackColor="#F2F1EC" ForeColor="#333333" Font-Size="Small"></RowStyle>

<AlternatingRowStyle BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
<Columns>
<asp:CommandField SelectText="S" ShowSelectButton="True">
<FooterStyle BackColor="White" BorderStyle="None"></FooterStyle>

<HeaderStyle BackColor="White" BorderStyle="None"></HeaderStyle>

<ItemStyle HorizontalAlign="Center" BorderColor="Silver" BorderWidth="1px" 
        BorderStyle="Solid" ForeColor="#3366FF"></ItemStyle>
</asp:CommandField>
<asp:BoundField DataField="DescFilial" HeaderText="Filial" SortExpression="DescFilial">
<FooterStyle BackColor="White" BorderStyle="None"></FooterStyle>

<HeaderStyle BorderColor="#999999" BorderWidth="1px" BorderStyle="Solid" 
        Font-Bold="False"></HeaderStyle>

<ItemStyle HorizontalAlign="Left" BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="M01" DataFormatString="{0:n0}" HeaderText="Janeiro" HtmlEncode="False" SortExpression="M01">
<FooterStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></FooterStyle>

<HeaderStyle BorderColor="#999999" BorderWidth="1px" BorderStyle="Solid" 
        Font-Bold="False"></HeaderStyle>

<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="M02" DataFormatString="{0:n0}" HeaderText="Fevereiro" HtmlEncode="False" SortExpression="M02">
<FooterStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></FooterStyle>

<HeaderStyle BorderColor="#999999" BorderWidth="1px" BorderStyle="Solid" 
        Font-Bold="False"></HeaderStyle>

<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="M03" DataFormatString="{0:n0}" HeaderText="Mar&#231;o" HtmlEncode="False" SortExpression="M03">
<FooterStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></FooterStyle>

<HeaderStyle BorderColor="#999999" BorderWidth="1px" BorderStyle="Solid" 
        Font-Bold="False"></HeaderStyle>

<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="M04" DataFormatString="{0:n0}" HeaderText="Abril" HtmlEncode="False" SortExpression="M04">
<FooterStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></FooterStyle>

<HeaderStyle BorderColor="#999999" BorderWidth="1px" BorderStyle="Solid" 
        Font-Bold="False"></HeaderStyle>

<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="M05" DataFormatString="{0:n0}" HeaderText="Maio" HtmlEncode="False" SortExpression="M05">
<FooterStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></FooterStyle>

<HeaderStyle BorderColor="#999999" BorderWidth="1px" BorderStyle="Solid" 
        Font-Bold="False"></HeaderStyle>

<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="M06" DataFormatString="{0:n0}" HeaderText="Junho" HtmlEncode="False" SortExpression="M06">
<FooterStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></FooterStyle>

<HeaderStyle BorderColor="#999999" BorderWidth="1px" BorderStyle="Solid" 
        Font-Bold="False"></HeaderStyle>

<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="M07" DataFormatString="{0:n0}" HeaderText="Julho" HtmlEncode="False" SortExpression="M07">
<FooterStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></FooterStyle>

<HeaderStyle BorderColor="#999999" BorderWidth="1px" BorderStyle="Solid" 
        Font-Bold="False"></HeaderStyle>

<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="M08" DataFormatString="{0:n0}" HeaderText="Agosto" HtmlEncode="False" SortExpression="M08">
<FooterStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></FooterStyle>

<HeaderStyle BorderColor="#999999" BorderWidth="1px" BorderStyle="Solid" 
        Font-Bold="False"></HeaderStyle>

<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="M09" DataFormatString="{0:n0}" HeaderText="Setembro" HtmlEncode="False" SortExpression="M09">
<FooterStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></FooterStyle>

<HeaderStyle BorderColor="#999999" BorderWidth="1px" BorderStyle="Solid" 
        Font-Bold="False"></HeaderStyle>

<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="M10" DataFormatString="{0:n0}" HeaderText="Outubro" HtmlEncode="False" SortExpression="M10">
<FooterStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></FooterStyle>

<HeaderStyle BorderColor="#999999" BorderWidth="1px" BorderStyle="Solid" 
        Font-Bold="False"></HeaderStyle>

<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="M11" DataFormatString="{0:n0}" HeaderText="Novembro" HtmlEncode="False" SortExpression="M11">
<FooterStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></FooterStyle>

<HeaderStyle BorderColor="#999999" BorderWidth="1px" BorderStyle="Solid" 
        Font-Bold="False"></HeaderStyle>

<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="M12" DataFormatString="{0:n0}" HeaderText="Dezembro" HtmlEncode="False" SortExpression="M12">
<FooterStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></FooterStyle>

<HeaderStyle BorderColor="#999999" BorderWidth="1px" BorderStyle="Solid" 
        Font-Bold="False"></HeaderStyle>

<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></ItemStyle>
</asp:BoundField>
<asp:BoundField DataField="Total" DataFormatString="{0:n0}" HeaderText="Total" HtmlEncode="False" SortExpression="Total">
<ControlStyle Font-Bold="False"></ControlStyle>

<FooterStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid"></FooterStyle>

<HeaderStyle BorderColor="#999999" BorderWidth="1px" BorderStyle="Solid" 
        Font-Bold="False"></HeaderStyle>

<ItemStyle BorderColor="Silver" BorderWidth="1px" BorderStyle="Solid" Font-Bold="True"></ItemStyle>
</asp:BoundField>
</Columns>

<EditRowStyle BackColor="#999999"></EditRowStyle>

<FooterStyle HorizontalAlign="Right" BackColor="#CCCCCC" Font-Bold="True" ForeColor="Blue" 
                        Font-Size="Small"></FooterStyle>

<HeaderStyle BackColor="#5D7B9D" Font-Bold="False" ForeColor="White" HorizontalAlign="Center"></HeaderStyle>

<PagerStyle HorizontalAlign="Center" BackColor="#284775" ForeColor="White"></PagerStyle>

<SelectedRowStyle BackColor="#FFFFCC" Font-Bold="True" ForeColor="#333333"></SelectedRowStyle>
</asp:GridView>

                        </td>
                    </tr>
                    <tr>
                        <td>

                <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:gerContSQL1ConnectionString %>" SelectCommand="SELECT DescFilial, M01, M02, M03, M04, M05, M06, M07, M08, M09, M10, M11, M12, Total, userName, Ano, idFilial FROM tbl12mesesUsu WHERE (Ano = @Ano) AND (userName = @User AND idFilial &lt;&gt; 100 ) ORDER BY idFilial" ID="dsDados"><SelectParameters>
<asp:ControlParameter ControlID="ASPxComboBox1" PropertyName="Value" Name="Ano"></asp:ControlParameter>
<asp:ControlParameter ControlID="lbl_UserName" PropertyName="Text" Name="User"></asp:ControlParameter>
</SelectParameters>
</asp:SqlDataSource>

                <asp:Label runat="server" Text="Label" ID="lbl_UserName" Visible="False"></asp:Label>

                            <dxlp:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" 
                                ClientInstanceName="lp" Modal="True">
                            </dxlp:ASPxLoadingPanel>

                        </td>
                    </tr>
                </table>
                &nbsp;
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

