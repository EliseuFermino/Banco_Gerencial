<%@ Page Title="Vendas por Hora" Language="VB" MasterPageFile="~/MemberPages/SiteVendas.master" AutoEventWireup="false" CodeFile="VendasPorHora.aspx.vb" Inherits="MemberPages_Vendas_VendasPorHora" %>

<%@ Register src="../../Controles/wucListaDia.ascx" tagname="wucListaDia" tagprefix="uc1" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">       
        .style2
        {
            width: 226px;
        }
        .style3
        {
            width: 184px;
        }
        .style4
        {
            height: 272px;
            width: 184px;
        }
        .style5
        {
            width: 9px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">    
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
             <table class="style1">
        <tr>
            <td align="left" class="style2" valign="top">
                <asp:Panel ID="Panel1" runat="server" Width="350px">
                    <table class="style1">
                        <tr>
                            <td>                                
                                <uc1:wucListaDia ID="ASPxCalendario" runat="server" />                                
                                <br />
                                <asp:Label ID="lblText" runat="server" 
                                    Text="Disponível todo o dia à partir das 09:00"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </asp:Panel>
            </td>
            <td align="left" valign="top">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                CellPadding="1" ForeColor="#333333" GridLines="None" 
                style="font-family: 'Times New Roman', Times, serif; font-size: small" 
                DataSourceID="dsVendaPorHora">
                <RowStyle BackColor="#EAEAEA" />
                <Columns>
                    <asp:BoundField DataField="descHI" HeaderText="Intervalo">
                        <HeaderStyle BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" />
                        <ItemStyle BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
                            HorizontalAlign="Center" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Real" DataFormatString="{0:n0}" 
                        HeaderText="Realizado" HtmlEncode="False">
                        <HeaderStyle BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" />
                        <ItemStyle BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
                            HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="perc" DataFormatString="{0:n2}" HeaderText="%" 
                        HtmlEncode="False">
                        <HeaderStyle BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" />
                        <ItemStyle BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
                            HorizontalAlign="Right" />
                    </asp:BoundField>
                    <asp:BoundField DataField="Hora" DataFormatString="{0:HH:mm:ss}" 
                        HeaderText="Atualização">
                        <HeaderStyle BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" />
                        <ItemStyle BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
                            HorizontalAlign="Center" />
                    </asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" 
                    HorizontalAlign="Center" />
                <EditRowStyle BackColor="#2461BF" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <asp:SqlDataSource ID="dsVendaPorHora" runat="server" 
                ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                SelectCommand="web_VendaPorHora" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                </SelectParameters>
            </asp:SqlDataSource>
            </td>
        </tr>
    </table>
        </ContentTemplate>
    </asp:UpdatePanel>   
</asp:Content>

