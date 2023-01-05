<%@ Page Language="VB" AutoEventWireup="false" CodeFile="frmViewSistemaAgenda.aspx.vb" Inherits="MemberPages_Resultado_Financeiro_frmViewSistemaDia" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>por Agenda - Resultado Financeiro</title>
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 238px;
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
        .style10
        {
            width: 479px;
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
                    Financeiro - Abertura por Dia e Agenda</span>
                </td>
                <td bgcolor="#999966" style="border: 1px solid #666633">
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="3">
                    <b>Filial:</b>
        <asp:DropDownList ID="cboFilial" runat="server" AutoPostBack="True" 
            BackColor="#FFFFCC" DataTextField="Desc" 
            DataValueField="Filial" style="height: 22px">
        </asp:DropDownList>
        &nbsp;&nbsp;&nbsp; Sistema:
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
                <td class="style2" valign="top">
                    <b>Selecione uma data abaixo:</b><asp:Calendar ID="Calendar1" runat="server" 
                        BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" 
                        DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" 
                        ForeColor="#663399" Height="200px" ShowGridLines="True" Width="220px">
                        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                        <SelectorStyle BackColor="#FFCC66" />
                        <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                        <OtherMonthDayStyle ForeColor="#CC9966" />
                        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                        <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                        <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" 
                            ForeColor="#FFFFCC" />
                    </asp:Calendar>
                </td>
                <td valign="top" class="style10">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                        CellPadding="3" ForeColor="Black" GridLines="Vertical" ShowFooter="True">
                        <RowStyle BackColor="#F7F7DE" />
                        <Columns>
                            <asp:BoundField DataField="Dia" DataFormatString="{0:dd/MM/yyyy}" 
                                HeaderText="Dia" HtmlEncode="False">
                                <FooterStyle BackColor="White" BorderStyle="None" />
                                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                                    HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="idAgenda" HeaderText="Agenda">
                                <FooterStyle BackColor="White" BorderStyle="None" />
                                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                                    HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="descAgenda" HeaderText="Descrição da Agenda">
                                <FooterStyle BackColor="White" BorderStyle="None" />
                                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                                    HorizontalAlign="Left" />
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
                </td>
                <td valign="top">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" ForeColor="#333333" GridLines="None" ShowFooter="True" 
                        style="margin-left: 5px">
                        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                        <Columns>
                            <asp:BoundField DataField="Ano" 
                                HeaderText="Ano" HtmlEncode="False">
                                <FooterStyle BackColor="White" BorderStyle="None" />
                                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                                    HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Mes" HeaderText="Mês">
                            <FooterStyle BackColor="White" BorderStyle="None" />
                            <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="idAgenda" HeaderText="Agenda">
                                <FooterStyle BackColor="White" BorderStyle="None" />
                                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                                    HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="descAgenda" HeaderText="Descrição da Agenda">
                                <FooterStyle BackColor="White" BorderStyle="None" />
                                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                                    HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="vlr" DataFormatString="{0:N2}" HeaderText="Valor" 
                                HtmlEncode="False">
                                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                                    HorizontalAlign="Right" />
                            </asp:BoundField>
                        </Columns>
                        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle BackColor="#999999" />
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                    </asp:GridView>
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
