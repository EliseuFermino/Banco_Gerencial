<%@ Page Title="Size Table - gerVendaItem" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="SizeTable_gerVendaItem.aspx.vb" Inherits="MemberPages_Manutencao_SizeTable_gerVendaItem" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" EmptyDataText="It's OK!!!" Caption="gerVendaItem" CaptionAlign="Left">
        <Columns>
            <asp:BoundField DataField="File Group" HeaderText="File Group" SortExpression="File Group" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Filename" HeaderText="Filename" SortExpression="Filename" />
            <asp:BoundField DataField="Currently Allocated Space (MB)" DataFormatString="{0:n0}" HeaderText="Currently Allocated Space (MB)" HtmlEncode="False" ReadOnly="True" SortExpression="Currently Allocated Space (MB)">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="Space Used (MB)" DataFormatString="{0:n0}" HeaderText="Space Used (MB)" HtmlEncode="False" ReadOnly="True" SortExpression="Space Used (MB)">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="Available Space (MB)" DataFormatString="{0:n0}" HeaderText="Available Space (MB)" HtmlEncode="False" ReadOnly="True" SortExpression="Available Space (MB)">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
        <EmptyDataRowStyle BackColor="#3366FF" Font-Size="XX-Large" ForeColor="White" />
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" SelectCommand="usp_SizeTable" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />


    <asp:GridView ID="Grid_VendaItemMes" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="Sql_gerVendaItemMes" EmptyDataText="It's OK!!!" Caption="gerVendaItemMes" CaptionAlign="Left">
        <Columns>
            <asp:BoundField DataField="File Group" HeaderText="File Group" SortExpression="File Group" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Filename" HeaderText="Filename" SortExpression="Filename" />
            <asp:BoundField DataField="Currently Allocated Space (MB)" DataFormatString="{0:n0}" HeaderText="Currently Allocated Space (MB)" HtmlEncode="False" ReadOnly="True" SortExpression="Currently Allocated Space (MB)">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="Space Used (MB)" DataFormatString="{0:n0}" HeaderText="Space Used (MB)" HtmlEncode="False" ReadOnly="True" SortExpression="Space Used (MB)">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="Available Space (MB)" DataFormatString="{0:n0}" HeaderText="Available Space (MB)" HtmlEncode="False" ReadOnly="True" SortExpression="Available Space (MB)">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
        <EmptyDataRowStyle BackColor="#3366FF" Font-Size="XX-Large" ForeColor="White" />
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
    </asp:GridView>

    <asp:SqlDataSource ID="Sql_gerVendaItemMes" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemMesConnectionString %>" SelectCommand="usp_SizeTable" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <br />


    <asp:GridView ID="Grid_VendaItemAno" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="Sql_gerVendaItemAno" EmptyDataText="It's OK!!!" Caption="gerVendaItemAno" CaptionAlign="Left">
        <Columns>
            <asp:BoundField DataField="File Group" HeaderText="File Group" SortExpression="File Group" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Filename" HeaderText="Filename" SortExpression="Filename" />
            <asp:BoundField DataField="Currently Allocated Space (MB)" DataFormatString="{0:n0}" HeaderText="Currently Allocated Space (MB)" HtmlEncode="False" ReadOnly="True" SortExpression="Currently Allocated Space (MB)">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="Space Used (MB)" DataFormatString="{0:n0}" HeaderText="Space Used (MB)" HtmlEncode="False" ReadOnly="True" SortExpression="Space Used (MB)">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="Available Space (MB)" DataFormatString="{0:n0}" HeaderText="Available Space (MB)" HtmlEncode="False" ReadOnly="True" SortExpression="Available Space (MB)">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
        <EmptyDataRowStyle BackColor="#3366FF" Font-Size="XX-Large" ForeColor="White" />
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
    </asp:GridView>

    <asp:SqlDataSource ID="Sql_gerVendaItemAno" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemAnoConnectionString %>" SelectCommand="usp_SizeTable" SelectCommandType="StoredProcedure">
    </asp:SqlDataSource>
    <br />




    <asp:GridView ID="grid_gerManager" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="Sql_gerManager" EmptyDataText="It's OK!!!" Caption="gerManager" CaptionAlign="Left">
        <Columns>
            <asp:BoundField DataField="File Group" HeaderText="File Group" SortExpression="File Group" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Filename" HeaderText="Filename" SortExpression="Filename" />
            <asp:BoundField DataField="Currently Allocated Space (MB)" DataFormatString="{0:n0}" HeaderText="Currently Allocated Space (MB)" HtmlEncode="False" ReadOnly="True" SortExpression="Currently Allocated Space (MB)">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="Space Used (MB)" DataFormatString="{0:n0}" HeaderText="Space Used (MB)" HtmlEncode="False" ReadOnly="True" SortExpression="Space Used (MB)">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="Available Space (MB)" DataFormatString="{0:n0}" HeaderText="Available Space (MB)" HtmlEncode="False" ReadOnly="True" SortExpression="Available Space (MB)">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
        <EmptyDataRowStyle BackColor="#3366FF" Font-Size="XX-Large" ForeColor="White" />
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
    </asp:GridView>
    <asp:SqlDataSource ID="Sql_gerManager" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="usp_SizeTable" SelectCommandType="StoredProcedure">        
    </asp:SqlDataSource>
    <br />

   <asp:GridView ID="grid_gerPerdas" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="Sql_gerPerdas" EmptyDataText="It's OK!!!" Caption="gerPerdas" CaptionAlign="Left">
        <Columns>
            <asp:BoundField DataField="File Group" HeaderText="File Group" SortExpression="File Group" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Filename" HeaderText="Filename" SortExpression="Filename" />
            <asp:BoundField DataField="Currently Allocated Space (MB)" DataFormatString="{0:n0}" HeaderText="Currently Allocated Space (MB)" HtmlEncode="False" ReadOnly="True" SortExpression="Currently Allocated Space (MB)">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="Space Used (MB)" DataFormatString="{0:n0}" HeaderText="Space Used (MB)" HtmlEncode="False" ReadOnly="True" SortExpression="Space Used (MB)">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="Available Space (MB)" DataFormatString="{0:n0}" HeaderText="Available Space (MB)" HtmlEncode="False" ReadOnly="True" SortExpression="Available Space (MB)">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
        <EmptyDataRowStyle BackColor="#3366FF" Font-Size="XX-Large" ForeColor="White" />
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
    </asp:GridView>
    <asp:SqlDataSource ID="Sql_gerPerdas" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="usp_SizeTable" SelectCommandType="StoredProcedure">        
    </asp:SqlDataSource>
    <br />


   <asp:GridView ID="grid_gerFornecedores" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="Sql_gerVendaFornecedores" EmptyDataText="It's OK!!!" Caption="gerVendaFornecedores" CaptionAlign="Left">
        <Columns>
            <asp:BoundField DataField="File Group" HeaderText="File Group" SortExpression="File Group" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Filename" HeaderText="Filename" SortExpression="Filename" />
            <asp:BoundField DataField="Currently Allocated Space (MB)" DataFormatString="{0:n0}" HeaderText="Currently Allocated Space (MB)" HtmlEncode="False" ReadOnly="True" SortExpression="Currently Allocated Space (MB)">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="Space Used (MB)" DataFormatString="{0:n0}" HeaderText="Space Used (MB)" HtmlEncode="False" ReadOnly="True" SortExpression="Space Used (MB)">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="Available Space (MB)" DataFormatString="{0:n0}" HeaderText="Available Space (MB)" HtmlEncode="False" ReadOnly="True" SortExpression="Available Space (MB)">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
        <EmptyDataRowStyle BackColor="#3366FF" Font-Size="XX-Large" ForeColor="White" />
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
    </asp:GridView>
    <asp:SqlDataSource ID="Sql_gerVendaFornecedores" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaFornecedoresConnectionString %>" SelectCommand="usp_SizeTable" SelectCommandType="StoredProcedure">        
    </asp:SqlDataSource>
    <br />


   <asp:GridView ID="grid_VendaFornecedoresSLV" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="Sql_gerVendaFornecedoresSLV" EmptyDataText="It's OK!!!" Caption="gerVendaFornecedoresSLV" CaptionAlign="Left">
        <Columns>
            <asp:BoundField DataField="File Group" HeaderText="File Group" SortExpression="File Group" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Filename" HeaderText="Filename" SortExpression="Filename" />
            <asp:BoundField DataField="Currently Allocated Space (MB)" DataFormatString="{0:n0}" HeaderText="Currently Allocated Space (MB)" HtmlEncode="False" ReadOnly="True" SortExpression="Currently Allocated Space (MB)">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="Space Used (MB)" DataFormatString="{0:n0}" HeaderText="Space Used (MB)" HtmlEncode="False" ReadOnly="True" SortExpression="Space Used (MB)">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
            <asp:BoundField DataField="Available Space (MB)" DataFormatString="{0:n0}" HeaderText="Available Space (MB)" HtmlEncode="False" ReadOnly="True" SortExpression="Available Space (MB)">
            <ItemStyle HorizontalAlign="Right" />
            </asp:BoundField>
        </Columns>
        <EmptyDataRowStyle BackColor="#3366FF" Font-Size="XX-Large" ForeColor="White" />
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
    </asp:GridView>
    <asp:SqlDataSource ID="Sql_gerVendaFornecedoresSLV" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaFornecedoresSLVConnectionString %>" SelectCommand="usp_SizeTable" SelectCommandType="StoredProcedure">        
    </asp:SqlDataSource>
    <br />

    
</asp:Content>

