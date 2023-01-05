<%@ Page Language="VB" AutoEventWireup="false" CodeFile="frmViewSistemaDia.aspx.vb" Inherits="MemberPages_Resultado_Financeiro_frmViewSistemaDia" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>por Dia - Resultado Financeiro - Conferência</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style4
        {
            width: 23px;
        }
        .style5
        {
            width: 47px;
        }
        .style7
        {
            color: #FFFFFF;
            font-weight: bold;
        }
        .style8
        {
            width: 107px;
        }
        .style9
        {
            width: 727px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="style1">
            <tr>
                <td bgcolor="#999966" class="style5" style="border: 1px solid #666633">
                    &nbsp;</td>
                <td class="style4" style="border: 1px solid #666633">
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/image/LogoCondor.jpg" />
                            </td>
                <td bgcolor="#999966" class="style9" style="border: 1px solid #666633">
                    <span class="style7">&nbsp;&nbsp;&nbsp; Conferência e Checagem do Resultado 
                    Financeiro - Abertura por Dia </span>
                </td>
                <td bgcolor="#999966" style="border: 1px solid #666633">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">
                    <b>Ano:
        <asp:DropDownList ID="cboAno" runat="server" AutoPostBack="True" 
            BackColor="#FFFFCC">
            <asp:ListItem>2013</asp:ListItem>
            <asp:ListItem>2014</asp:ListItem>
            <asp:ListItem>2015</asp:ListItem>
            <asp:ListItem>2016</asp:ListItem>
        </asp:DropDownList>
&nbsp;&nbsp;&nbsp; Mês:         <asp:DropDownList ID="cboMes" runat="server" AutoPostBack="True" 
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
        &nbsp;&nbsp;&nbsp;&nbsp; Filial:</b>
        <asp:DropDownList ID="cboFilial" runat="server" AutoPostBack="True" 
            BackColor="#FFFFCC" DataTextField="Desc" 
            DataValueField="Filial" style="height: 22px">
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp; <b>Sistema:
        <asp:DropDownList ID="cboSistema" runat="server" AutoPostBack="True" 
            BackColor="#FFFFCC" DataTextField="descSis" 
            DataValueField="idSis" style="height: 22px" DataSourceID="dsListaSistema">
        </asp:DropDownList>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    <div>
        <table class="style1">
            <tr>
                <td valign="top">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                        CellPadding="3" ForeColor="Black" GridLines="Vertical" ShowFooter="True" 
                        DataSourceID="dsDia">
                        <RowStyle BackColor="#F7F7DE" />
                        <Columns>
                            <asp:BoundField DataField="Dia" DataFormatString="{0:dd/MM/yyyy}" 
                                HeaderText="Dia" HtmlEncode="False">
                                <FooterStyle BackColor="White" BorderStyle="None" />
                                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                                    HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="vlr" DataFormatString="{0:N2}" HeaderText="Valor" 
                                HtmlEncode="False">
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
                    <asp:SqlDataSource ID="dsDia" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:conn_relReuniao %>" 
                        SelectCommand="uspResFin_ConsultarSistemaPorDia" 
                        SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="cboAno" Name="Ano" 
                                PropertyName="SelectedValue" Type="Int16" />
                            <asp:ControlParameter ControlID="cboMes" Name="Mes" 
                                PropertyName="SelectedValue" Type="Byte" />
                            <asp:ControlParameter ControlID="cboFilial" Name="idFilial" 
                                PropertyName="SelectedValue" Type="Byte" />
                            <asp:ControlParameter ControlID="cboSistema" Name="idSis" 
                                PropertyName="SelectedValue" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
    </div>
    <asp:Label ID="lblDia" runat="server" Text="Label" Visible="False"></asp:Label>
    <asp:SqlDataSource ID="dsListaSistema" runat="server" 
        ConnectionString="<%$ ConnectionStrings:conn_relReuniao %>" 
        SelectCommand="SELECT [idSis], [descSis] FROM [tblResFin_Sistema] ORDER BY [idSis]">
    </asp:SqlDataSource>
    </form>
</body>
</html>
