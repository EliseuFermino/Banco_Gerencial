<%@ Page Language="VB" AutoEventWireup="false" CodeFile="viewDespMesTotal.aspx.vb" Inherits="MemberPages_Despesas_Gestor_viewDespMesTotal" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            font-size: x-large;
            font-weight: bold;
        }
        .style3
        {
            width: 196px;
        }
        .style4
        {
            width: 191px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <div>
            <table class="style1">
                <tr>
                    <td class="style2">
                        Meta x Realizado - Despesa - por Gestor - Mês</td>
                </tr>
                <tr>
                    <td>
            <b>Ano:</b>
        <asp:DropDownList ID="cboAno" runat="server" AutoPostBack="True" 
            BackColor="#FFFFCC" style="height: 22px">
            <asp:ListItem>2010</asp:ListItem>
            <asp:ListItem>2011</asp:ListItem>
            <asp:ListItem>2012</asp:ListItem>
        </asp:DropDownList>
                    &nbsp; <b>Mes:</b>         <asp:DropDownList ID="cboMes" runat="server" AutoPostBack="True" 
            BackColor="#FFFFCC">
            <asp:ListItem Value="1">Janeiro</asp:ListItem>
            <asp:ListItem Value="2">Fevereiro</asp:ListItem>
            <asp:ListItem Value="3">Março</asp:ListItem>
            <asp:ListItem Value="4">Abril</asp:ListItem>
            <asp:ListItem Value="5">Maio</asp:ListItem>
            <asp:ListItem Value="6">Junho</asp:ListItem>
            <asp:ListItem Value="7">Julho</asp:ListItem>
            <asp:ListItem Value="8">Agosto</asp:ListItem>
            <asp:ListItem Value="9">Setembro</asp:ListItem>
            <asp:ListItem Value="10">Outubro</asp:ListItem>
            <asp:ListItem Value="11">Novembro</asp:ListItem>
            <asp:ListItem Value="12">Dezembro</asp:ListItem>
        </asp:DropDownList>
&nbsp;</td>
                </tr>
            </table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
    
    </div>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
        CellPadding="2" DataSourceID="dsGestorTotalMes" ForeColor="Black" 
        GridLines="Vertical" ShowFooter="True">
        <RowStyle BackColor="#F7F7DE" HorizontalAlign="Right" />
        <Columns>
            <asp:BoundField DataField="Gestor" HeaderText="Gestor" 
                SortExpression="Gestor">
                <FooterStyle BackColor="White" BorderStyle="None" />
                <ItemStyle HorizontalAlign="Left" BorderColor="#999999" BorderStyle="Solid" 
                    BorderWidth="1px" />
            </asp:BoundField>
            <asp:BoundField DataField="vlrRev" DataFormatString="{0:N0}" 
                HeaderText="vlr. Meta" HtmlEncode="False" ReadOnly="True" 
                SortExpression="vlrRev" >
                <ItemStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
            </asp:BoundField>
            <asp:BoundField DataField="percRev" DataFormatString="{0:N2}" 
                HeaderText="% " HtmlEncode="False" ReadOnly="True" 
                SortExpression="percRev" >
                <ItemStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
            </asp:BoundField>
            <asp:BoundField DataField="vlrReal" DataFormatString="{0:N0}" 
                HeaderText="vlr. Real" HtmlEncode="False" ReadOnly="True" 
                SortExpression="vlrReal" >
                <ItemStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
            </asp:BoundField>
            <asp:BoundField DataField="percReal" DataFormatString="{0:N2}" 
                HeaderText="%" HtmlEncode="False" ReadOnly="True" 
                SortExpression="percReal" >
                <ItemStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
            </asp:BoundField>
            <asp:BoundField DataField="difVlrRev" DataFormatString="{0:N0}" 
                HeaderText="Dif. Valor" HtmlEncode="False" ReadOnly="True" 
                SortExpression="difVlrRev" >
                <ItemStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
            </asp:BoundField>
            <asp:BoundField DataField="difPercRev" DataFormatString="{0:N2}" HeaderText="%" 
                HtmlEncode="False" SortExpression="difPercRev">
                <ItemStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
            </asp:BoundField>
        </Columns>
        <FooterStyle BackColor="#CCCC99" HorizontalAlign="Right" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#99CCFF" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:GridView>
    <asp:SqlDataSource ID="dsGestorTotalMes" runat="server" 
        ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" 
        SelectCommand="SELECT Gestor, vlrRev, percRev, vlrReal, percReal, vlrRealAA, percRealAA, difVlrRev, difPercRev FROM Gestor.tbl_MxR_Mes_Gestor_Grupo WHERE (Ano = @Ano) AND (Mes = @Mes) ORDER BY Ordem">
        <SelectParameters>
            <asp:ControlParameter ControlID="cboAno" Name="Ano" 
                PropertyName="SelectedValue" Type="Int32" />
            <asp:ControlParameter ControlID="cboMes" Name="Mes" 
                PropertyName="SelectedValue" Type="Int16" />
        </SelectParameters>
    </asp:SqlDataSource>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;
                <br />
    <div>
        <table cellpadding="0" cellspacing="0" class="style1">
            <tr>
                <td class="style3" 
                    style="border: 1px solid #808080; background-color: #CCFFCC;">
                    &nbsp;Meta de Venda&nbsp;</td>
                <td align="right" class="style4" 
                    
                    style="border-style: solid solid solid none; border-width: 1px; border-color: #808080; background-color: #CCFFCC;">
                    &nbsp;<asp:Label ID="lblMetaRevista" runat="server" Text="Label"></asp:Label>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3" 
                    
                    style="border-style: none solid solid solid; border-width: 1px; border-color: #808080; background-color: #FFFFCC;">
                    &nbsp;Venda Realizada&nbsp;</td>
                <td align="right" class="style4" 
                    
                    style="border-style: none solid solid none; border-width: 1px; border-color: #808080; background-color: #FFFFCC;">
                    &nbsp;<asp:Label ID="lblVendaRealizada" runat="server" Text="Label"></asp:Label>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
                    &nbsp;</td>
                <td align="right" class="style4">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style3">
    <asp:Button ID="btnExportExcel" runat="server" Text="Exportar para Excel" />
                </td>
                <td align="right" class="style4">
                <asp:HyperLink ID="HyperLink1" runat="server" 
                    NavigateUrl="~/MemberPages/Principal.aspx">Menu Principal</asp:HyperLink>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    </div>
    <br />
    </form>
<p>
    &nbsp;</p>
</body>
</html>
