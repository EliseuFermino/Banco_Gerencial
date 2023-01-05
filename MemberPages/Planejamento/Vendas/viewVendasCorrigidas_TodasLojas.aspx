<%@ Page Title="Vendas Corrigidas pelo IPCA" Language="VB" MasterPageFile="~/MemberPages/SiteOrcamento.master" AutoEventWireup="false" CodeFile="viewVendasCorrigidas_TodasLojas.aspx.vb" Inherits="MemberPages_Planejamento_Vendas_viewVendasCorrigidas_TodasLojas" %>

<%@ Register src="../../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>
<%@ Register src="../../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        <table class="auto-style1">
            <tr>
                <td align="left" style="width: 205px" valign="top">
                    <uc1:wucAno ID="cboAno" runat="server" />
                </td>
                <td align="left" valign="top">
                    <uc2:wuciListaMes ID="cboMes" runat="server" />
                </td>
                <td align="left" valign="top">&nbsp;</td>
            </tr>
        </table>
        <table class="auto-style1">
            <tr>
                <td>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
        CellPadding="3" DataSourceID="dsCorrecaoMes" ForeColor="Black" 
        GridLines="Vertical" AllowSorting="True">
        <RowStyle BackColor="#F7F7DE" />
        <Columns>
            <asp:CommandField SelectText="S" ShowSelectButton="True">
                <HeaderStyle BackColor="White" BorderStyle="None" />
                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                    ForeColor="Blue" />
            </asp:CommandField>
            <asp:BoundField DataField="FilialLista" HeaderText="Filial" 
                SortExpression="Ano">
                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                    HorizontalAlign="Left" />
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
            <asp:BoundField DataField="Valor_Correção" DataFormatString="{0:N0}" 
                HeaderText="Valor Correção" HtmlEncode="False" 
                SortExpression="Valor_Correção">
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
                HeaderText="Cresc." HtmlEncode="False" 
                SortExpression="percCresc">
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
        
        
            SelectCommand="SELECT viewVendaCorrigida_IPCA.[Venda Nominal] AS Venda_Nominal, viewVendaCorrigida_IPCA.indice, viewVendaCorrigida_IPCA.[Venda Real] AS Venda_Real, viewVendaCorrigida_IPCA.[Valor Correção] AS Valor_Correção, viewVendaCorrigida_IPCA.[Venda Corrigida] AS Venda_Corrigida, viewVendaCorrigida_IPCA.percCresc, tblCadFiliais.FilialLista FROM viewVendaCorrigida_IPCA INNER JOIN gerManager.Cadastros.tblCadFiliais ON viewVendaCorrigida_IPCA.Loja = tblCadFiliais.Filial WHERE (viewVendaCorrigida_IPCA.Ano = @Ano) AND (viewVendaCorrigida_IPCA.Mes = @Mes) AND (tblCadFiliais.CodigoEmpresa &lt;&gt; 0) AND (tblCadFiliais.ApareceLista &lt;&gt; 0) ORDER BY viewVendaCorrigida_IPCA.Ano">
        <SelectParameters>
            <asp:SessionParameter Name="Ano" SessionField="sANO" />
            <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
        </SelectParameters>
    </asp:SqlDataSource>
        <br />
    </p>
</asp:Content>

