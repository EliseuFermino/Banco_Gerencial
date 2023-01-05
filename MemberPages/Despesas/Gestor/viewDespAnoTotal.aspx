<%@ Page Language="VB" AutoEventWireup="false" CodeFile="viewDespAnoTotal.aspx.vb" Inherits="MemberPages_Despesas_Gestor_viewDespMesTotal" %>

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
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <div>
            <table class="style1">
                <tr>
                    <td class="style2">
                        Meta x Realizado - Despesa - por Gestor - Ano</td>
                </tr>
                <tr>
                    <td>
            <b>Ano:</b>
        <asp:DropDownList ID="cboAno" runat="server" AutoPostBack="True" 
            BackColor="#FFFFCC">
            <asp:ListItem>2010</asp:ListItem>
            <asp:ListItem>2011</asp:ListItem>
            <asp:ListItem>2012</asp:ListItem>
        </asp:DropDownList>
                    &nbsp; 
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
            <asp:BoundField DataField="DescPessoalAdm" HeaderText="Gestor" 
                SortExpression="DescPessoalAdm">
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
            <asp:BoundField DataField="vlrRea" DataFormatString="{0:N0}" 
                HeaderText="vlr. Real" HtmlEncode="False" ReadOnly="True" 
                SortExpression="vlrRea" >
                <ItemStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
            </asp:BoundField>
            <asp:BoundField DataField="percRea" DataFormatString="{0:N2}" 
                HeaderText="%" HtmlEncode="False" ReadOnly="True" 
                SortExpression="percRea" >
                <ItemStyle BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" />
            </asp:BoundField>
            <asp:BoundField DataField="difVlr" DataFormatString="{0:N0}" 
                HeaderText="Dif. Valor" HtmlEncode="False" ReadOnly="True" 
                SortExpression="difVlr" >
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
        ConnectionString="<%$ ConnectionStrings:conn_relReuniao %>" 
        SelectCommand="uspGestorDespesas_Ano_Total" 
        SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="cboAno" Name="Ano" 
                PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    &nbsp;&nbsp;&nbsp;
                <asp:HyperLink ID="HyperLink1" runat="server" 
                    NavigateUrl="~/MemberPages/Principal.aspx">Menu Principal</asp:HyperLink>
    <br />
    </form>
<p>
    &nbsp;</p>
</body>
</html>
