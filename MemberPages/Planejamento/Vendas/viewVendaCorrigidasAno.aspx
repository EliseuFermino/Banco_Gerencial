<%@ Page Title="Vendas Corrigidas pelo IPCA" Language="VB" MasterPageFile="~/MemberPages/SiteOrcamento.master" AutoEventWireup="false" CodeFile="viewVendaCorrigidasAno.aspx.vb" Inherits="MemberPages_Planejamento_Vendas_viewVendaCorrigidasAno" %>

<%@ Register src="../../../Controles/wuciListaLojasComApoio.ascx" tagname="wuciListaLojasComApoio" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="auto-style1">
        <tr>
            <td style="width: 194px">
                <uc1:wuciListaLojasComApoio ID="cboFilial" runat="server" />
            </td>
            <td align="center" style="font-size: large" valign="middle">Tabela 12 Meses</td>
        </tr>
        <tr>
            <td align="left" style="width: 194px" valign="top">
                <asp:GridView ID="GridView2" runat="server" AllowSorting="True" 
                    AutoGenerateColumns="False" BackColor="White" BorderColor="#E7E7FF" 
                    BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                    DataSourceID="dsCorrecaoAno" GridLines="Horizontal">
                    <RowStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" />
                    <Columns>
                        <asp:CommandField SelectText="S" ShowSelectButton="True">
                            <HeaderStyle BackColor="#999999" BorderColor="Gray" BorderStyle="None" />
                            <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </asp:CommandField>
                        <asp:BoundField DataField="Ano" HeaderText="Ano" SortExpression="Ano">
                            <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                                HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Venda_Corrigida" DataFormatString="{0:n0}" 
                            HeaderText="Venda Corrigida" HtmlEncode="False" 
                            SortExpression="Venda_Corrigida">
                            <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                                HorizontalAlign="Right" />
                        </asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
                    <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
                    <AlternatingRowStyle BackColor="#F7F7F7" />
                </asp:GridView>
                <asp:SqlDataSource ID="dsCorrecaoAno" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                    
                    SelectCommand="SELECT [Venda Corrigida] AS Venda_Corrigida, [Ano] FROM [viewVendaCorrigida_IPCA_Ano] WHERE ([Loja] = @Loja) ORDER BY [Loja]">
                    <SelectParameters>
                        <asp:SessionParameter Name="Loja" SessionField="sFILIAL" Type="Byte" />
                    </SelectParameters>
                </asp:SqlDataSource>
    <asp:SqlDataSource ID="dsCorrecaoMes" runat="server" 
        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
        
                    
                    SelectCommand="SELECT [Ano], [Mes], [Venda Nominal] AS Venda_Nominal, [indice], [Venda Real] AS Venda_Real, [% Correção] AS column1, [Valor Correção] AS Valor_Correção, [Venda Corrigida] AS Venda_Corrigida FROM [viewVendaCorrigida_IPCA_12meses] WHERE (([Ano] = @Ano) AND ([Loja] = @Loja))">
        <SelectParameters>
            <asp:ControlParameter ControlID="lblAno" Name="Ano" 
                PropertyName="Text" Type="Int16" />
            <asp:SessionParameter Name="Loja" SessionField="sFILIAL" Type="Byte" />
        </SelectParameters>
    </asp:SqlDataSource>
            </td>
            <td align="left" valign="top">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" ForeColor="Black" 
        GridLines="Vertical" ShowFooter="True" DataSourceID="dsCorrecaoMes">
        <RowStyle BackColor="#F7F7DE" />
        <Columns>
            <asp:BoundField DataField="Ano" HeaderText="Ano" SortExpression="Ano">
                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                    HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Mes" HeaderText="Mês" SortExpression="Mes">
                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                    HorizontalAlign="Center" />
            </asp:BoundField>
            <asp:BoundField DataField="Venda_Nominal" DataFormatString="{0:n0}" 
                HeaderText="Venda Nominal" HtmlEncode="False" 
                SortExpression="Venda_Nominal">
                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                    HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="indice" DataFormatString="{0:n2}" 
                HeaderText="Índice" HtmlEncode="False" SortExpression="indice">
                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                    HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="Venda_Real" DataFormatString="{0:n0}" 
                HeaderText="Venda Real" HtmlEncode="False" SortExpression="Venda_Real">
                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                    HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="column1" DataFormatString="{0:p3}" 
                HeaderText="% Correção" HtmlEncode="False" SortExpression="column1">
                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                    HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="Valor_Correção" DataFormatString="{0:n0}" 
                HeaderText="Valor Correção" HtmlEncode="False" 
                SortExpression="Valor_Correção">
                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                    HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="Venda_Corrigida" DataFormatString="{0:n0}" 
                HeaderText="Venda Corrigida" HtmlEncode="False" 
                SortExpression="Venda_Corrigida">
                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                    HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#CCCC99" HorizontalAlign="Right" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
                <br />
                <asp:Label ID="lblAno" runat="server" ForeColor="White" Text="Label"></asp:Label>
            </td>
        </tr>
    </table>
</asp:Content>

