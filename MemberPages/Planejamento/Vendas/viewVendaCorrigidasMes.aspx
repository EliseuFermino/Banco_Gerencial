<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/SiteOrcamento.master" AutoEventWireup="false" CodeFile="viewVendaCorrigidasMes.aspx.vb" Inherits="MemberPages_Planejamento_Vendas_viewVendaCorrigidasMes" %>

<%@ Register src="../../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>
<%@ Register src="../../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc2" %>
<%@ Register src="../../../Controles/wuciListaLojasComApoio.ascx" tagname="wuciListaLojasComApoio" tagprefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        <table class="auto-style1">
            <tr>
                <td style="width: 193px">
                    <uc3:wuciListaLojasComApoio ID="cboFilial" runat="server" />
                </td>
                <td>
                    <uc2:wuciListaMes ID="cboMes" runat="server" />
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table class="auto-style1">
            <tr>
                <td>
            
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
        CellPadding="4" DataSourceID="dsCorrecaoMes" ForeColor="Black" 
        GridLines="Vertical" AllowSorting="True">
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
            <asp:BoundField DataField="Venda_Nominal" DataFormatString="{0:N0}" 
                HeaderText="Venda Nominal" HtmlEncode="False" SortExpression="Venda_Nominal">
                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                    HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="indice" DataFormatString="{0:N2}" 
                HeaderText="Índice" HtmlEncode="False" SortExpression="indice">
                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                    HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="Venda_Real" DataFormatString="{0:N0}" 
                HeaderText="Venda Real" HtmlEncode="False" SortExpression="Venda_Real">
                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                    HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="column1" DataFormatString="{0:P3}" 
                HeaderText="% Correção" HtmlEncode="False" SortExpression="column1">
                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                    HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="Valor_Correção" DataFormatString="{0:N0}" 
                HeaderText="Valor Correção" HtmlEncode="False" SortExpression="Valor_Correção">
                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                    HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="Venda_Corrigida" DataFormatString="{0:N0}" 
                HeaderText="Venda Corrigida" HtmlEncode="False" 
                SortExpression="Venda_Corrigida">
                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                    HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="percCresc" DataFormatString="{0:N2}" 
                HeaderText="Cresc." HtmlEncode="False" SortExpression="percCresc">
                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                    HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#CCCC99" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>

                </td>
            </tr>
        </table>

    <asp:SqlDataSource ID="dsCorrecaoMes" runat="server" 
        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
        
            SelectCommand="SELECT [Ano], [Mes], [Venda Nominal] AS Venda_Nominal, [indice], [Venda Real] AS Venda_Real, [% Correção] AS column1, [Valor Correção] AS Valor_Correção, [Venda Corrigida] AS Venda_Corrigida, [percCresc] FROM [viewVendaCorrigida_IPCA] WHERE (([Loja] = @Loja) AND ([Mes] = @Mes)) ORDER BY [Ano]">
        <SelectParameters>
            <asp:SessionParameter Name="Loja" SessionField="sFILIAL" Type="Byte" />
            <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
        </SelectParameters>
    </asp:SqlDataSource>
  
        <br />
    </p>
</asp:Content>

