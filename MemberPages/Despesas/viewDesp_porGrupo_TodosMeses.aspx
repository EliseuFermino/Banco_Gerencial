<%@ Page Language="VB" AutoEventWireup="false" CodeFile="viewDesp_porGrupo_TodosMeses.aspx.vb" Inherits="MemberPages_Despesas_viewDesp_porGrupo_TodosMeses" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table class="style1">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                &nbsp;<b>Ano:</b>
        <asp:DropDownList ID="cboAno" runat="server" AutoPostBack="True" 
            BackColor="#FFFFCC" style="height: 22px">
            <asp:ListItem>2010</asp:ListItem>
            <asp:ListItem>2011</asp:ListItem>
            <asp:ListItem>2012</asp:ListItem>
        </asp:DropDownList>
                    &nbsp;&nbsp;&nbsp; <b>Filial:</b>
                <asp:DropDownList ID="cboFilial" runat="server" AutoPostBack="True" 
                    BackColor="#FFFFCC">
                </asp:DropDownList>
                &nbsp;&nbsp;&nbsp; <b>Grupo:</b>
                        <asp:DropDownList ID="cboGrupo" runat="server" AutoPostBack="True" 
                            BackColor="#FFFFCC">
                        </asp:DropDownList>
                    </td>
        </tr>
    </table>
    <div>
    
        <div>
            <asp:GridView ID="gridGrupo" runat="server" AutoGenerateColumns="False" 
                BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                CellPadding="2" ForeColor="Black" GridLines="Vertical" ShowFooter="True">
                <RowStyle BackColor="#F7F7DE" HorizontalAlign="Right" />
                <Columns>
                    <asp:BoundField DataField="descMes" HeaderText="Descrição">
                        <FooterStyle BackColor="White" BorderStyle="None" />
                        <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                            HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="vlrRev" DataFormatString="{0:N0}" 
                        HeaderText="vlr. Revista" HtmlEncode="False">
                        <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="percRev" DataFormatString="{0:N2}" HeaderText="%" 
                        HtmlEncode="False">
                        <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="vlrRea" DataFormatString="{0:N0}" 
                        HeaderText="vlr. Real" HtmlEncode="False">
                        <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="percRea" DataFormatString="{0:N2}" HeaderText="%" 
                        HtmlEncode="False">
                        <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="difVlr" DataFormatString="{0:N0}" 
                        HeaderText="Dif. Valor" HtmlEncode="False">
                        <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="difPerc" DataFormatString="{0:N2}" HeaderText="%" 
                        HtmlEncode="False">
                        <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                    </asp:BoundField>
                </Columns>
                <FooterStyle BackColor="#CCCC99" HorizontalAlign="Right" />
                <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
        </div>
    
    </div>
    </form>
<div>
</div>
</body>
</html>
