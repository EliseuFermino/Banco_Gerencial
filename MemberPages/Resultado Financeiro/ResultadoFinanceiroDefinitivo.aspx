<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ResultadoFinanceiroDefinitivo.aspx.vb" Inherits="MemberPages_Resultado_Financeiro_ResultadoFinanceiroDefinitivo" %>


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
    <div>
    
        <table class="style1">
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    <b>Ano:</b>
                    <b>
        <asp:DropDownList ID="cboAno" runat="server" AutoPostBack="True" 
            BackColor="#FFFFCC">
            <asp:ListItem>2014</asp:ListItem>
            <asp:ListItem>2015</asp:ListItem>
            <asp:ListItem>2016</asp:ListItem>
        </asp:DropDownList>
&nbsp;&nbsp; Mês:         <asp:DropDownList ID="cboMes" runat="server" AutoPostBack="True" 
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
        &nbsp;&nbsp; Filial:
        <asp:DropDownList ID="cboFilial" runat="server" AutoPostBack="True" 
            BackColor="#FFFFCC" DataTextField="Desc" 
            DataValueField="Filial" style="height: 22px">
        </asp:DropDownList>
                    </b>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    <div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="2" DataKeyNames="Dia,idFilial" DataSourceID="dsDefinitivo" 
            ForeColor="Black" GridLines="Vertical" ShowFooter="True">
            <RowStyle BackColor="#F7F7DE" HorizontalAlign="Right" />
            <Columns>
                <asp:BoundField DataField="Dia" DataFormatString="{0:dd/MM/yyyy}" 
                    HeaderText="Dia" HtmlEncode="False" ReadOnly="True" SortExpression="Dia">
                    <FooterStyle BackColor="White" BorderStyle="None" />
                    <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                        HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="vlrSaldoInicial" DataFormatString="{0:N2}" 
                    HeaderText="Saldo Inicial" HtmlEncode="False" SortExpression="vlrSaldoInicial">
                    <FooterStyle BackColor="White" BorderStyle="None" />
                    <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                </asp:BoundField>
                <asp:BoundField DataField="vlrEntradas" DataFormatString="{0:N2}" 
                    HeaderText="Entradas" HtmlEncode="False" SortExpression="vlrEntradas">
                    <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                </asp:BoundField>
                <asp:BoundField DataField="vlrSaidas" DataFormatString="{0:N2}" 
                    HeaderText="Saídas" HtmlEncode="False" SortExpression="vlrSaidas">
                    <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                </asp:BoundField>
                <asp:BoundField DataField="vlrSaldoFinal" DataFormatString="{0:N2}" 
                    HeaderText="Saldo Final" HtmlEncode="False" SortExpression="vlrSaldoFinal">
                    <FooterStyle BackColor="White" BorderStyle="None" />
                    <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                </asp:BoundField>
                <asp:BoundField DataField="percTaxaDia" DataFormatString="{0:N5}" 
                    HeaderText="% Taxa" HtmlEncode="False" SortExpression="percTaxaDia">
                    <FooterStyle BackColor="White" BorderStyle="None" />
                    <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                </asp:BoundField>
                <asp:BoundField DataField="vlrRecDespFinanc" DataFormatString="{0:N2}" 
                    HeaderText="Rec. Desp. " HtmlEncode="False" SortExpression="vlrRecDespFinanc">
                    <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                </asp:BoundField>
                <asp:BoundField DataField="vlrSaldoFinanceiro" DataFormatString="{0:N2}" 
                    HeaderText="Saldo Financeiro" HtmlEncode="False" 
                    SortExpression="vlrSaldoFinanceiro">
                    <FooterStyle BackColor="White" BorderStyle="None" />
                    <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="dsDefinitivo" runat="server" 
            ConnectionString="<%$ ConnectionStrings:conn_relReuniao %>" 
            SelectCommand="SELECT Dia, idFilial, vlrSaldoInicial, vlrEntradas, vlrSaidas, vlrSaldoFinal, percTaxaDia, vlrRecDespFinanc, vlrSaldoFinanceiro FROM tblResFin_ResumoDia WHERE (Ano = @Ano) AND (Mes = @Mes) AND (idFilial = @idFilial)">
            <SelectParameters>
                <asp:ControlParameter ControlID="cboAno" Name="Ano" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="cboMes" Name="Mes" 
                    PropertyName="SelectedValue" />
                <asp:ControlParameter ControlID="cboFilial" Name="idFilial" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    </form>
</body>
</html>
