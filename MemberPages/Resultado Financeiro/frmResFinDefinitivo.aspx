<%@ Page Language="VB" MasterPageFile="~/MemberPages/Resultado Financeiro/mpResultadoFinanceiro.master" AutoEventWireup="false" CodeFile="frmResFinDefinitivo.aspx.vb" Inherits="MemberPages_Resultado_Financeiro_frmResFinDefinitivo" title="Entradas e Saídas por Dia - Resultado Financeiro" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style2
    {
        color: #666666;
        font-weight: bold;
    }

.dxeButtonEdit
{
    background-color: white;
    border: solid 1px #9F9F9F;
    width: 170px;
}
        .style6
        {
            width: 404px;
        }
        .style7
        {
            width: 477px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
    <table cellpadding="0" cellspacing="0" class="style1">
        <tr>
            <td align="right">
                &nbsp;<span class="style2">Ano:</span></td>
            <td align="left" style="padding-bottom: 2px">
                <b __designer:mapid="444"><span __designer:mapid="445">
                <dxe:ASPxComboBox runat="server" Width="60px" 
                    AutoPostBack="True" ID="cboAno" Height="16px" BackColor="#FFFFCC"><Items>
<dxe:ListEditItem Text="2020" Value="2020"></dxe:ListEditItem>
<dxe:ListEditItem Text="2021" Value="2021"></dxe:ListEditItem>
<dxe:ListEditItem Text="2022" Value="2022"></dxe:ListEditItem>
<dxe:ListEditItem Text="2023" Value="2023" />
<dxe:ListEditItem Text="2024" Value="2024" />
</Items>

<ClientSideEvents ValueChanged="function(s, e) {
	lp.Show();
}"></ClientSideEvents>
</dxe:ASPxComboBox>

                </span></b>
            </td>
            <td align="right">
                &nbsp; <span class="style2">Mês:</span>&nbsp;</td>
            <td align="left" style="padding-bottom: 2px">
                <dxe:ASPxComboBox runat="server" ValueType="System.String" Width="100px" 
                    AutoPostBack="True" ID="cboMes" Height="16px" BackColor="#FFFFCC"><Items>
<dxe:ListEditItem Text="Janeiro" Value="1"></dxe:ListEditItem>
<dxe:ListEditItem Text="Fevereiro" Value="2"></dxe:ListEditItem>
<dxe:ListEditItem Text="Mar&#231;o" Value="3"></dxe:ListEditItem>
<dxe:ListEditItem Text="Abril" Value="4"></dxe:ListEditItem>
<dxe:ListEditItem Text="Maio" Value="5"></dxe:ListEditItem>
<dxe:ListEditItem Text="Junho" Value="6"></dxe:ListEditItem>
<dxe:ListEditItem Text="Julho" Value="7"></dxe:ListEditItem>
<dxe:ListEditItem Text="Agosto" Value="8"></dxe:ListEditItem>
<dxe:ListEditItem Text="Setembro" Value="9"></dxe:ListEditItem>
<dxe:ListEditItem Text="Outubro" Value="10"></dxe:ListEditItem>
<dxe:ListEditItem Text="Novembro" Value="11"></dxe:ListEditItem>
<dxe:ListEditItem Text="Dezembro" Value="12"></dxe:ListEditItem>
</Items>

<ClientSideEvents SelectedIndexChanged="function(s, e) {

}" ValueChanged="function(s, e) {
	lp.Show();
}"></ClientSideEvents>
</dxe:ASPxComboBox>

            </td>
            <td align="right">
                &nbsp; <span class="style2">Filial:</span>&nbsp;</td>
            <td align="left" class="style6" style="padding-bottom: 2px">
                <dxe:ASPxComboBox runat="server" ValueType="System.Int32" TextField="Desc" 
                    ValueField="Filial" ID="cboFilial" AutoPostBack="True" BackColor="#FFFFCC" 
                    Width="200px">
                    <LoadingPanelStyle BackColor="#FFFFCC">
                    </LoadingPanelStyle>
                </dxe:ASPxComboBox>

            </td>
            <td class="style7">
            </td>
            <td>
            </td>
        </tr>
    </table>
    <table cellpadding="0" cellspacing="0" class="style1">
        <tr>
            <td>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="2" DataKeyNames="Dia,idFilial" DataSourceID="dsDefinitivo" 
            ForeColor="Black" GridLines="Vertical" ShowFooter="True">
            <RowStyle BackColor="#F2F2F2" HorizontalAlign="Right" />
            <Columns>
                <asp:CommandField SelectText="S" ShowSelectButton="True">
                    <FooterStyle BackColor="White" BorderStyle="None" />
                    <HeaderStyle BackColor="White" BorderStyle="None" />
                    <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                        ForeColor="#3333FF" HorizontalAlign="Center" />
                </asp:CommandField>
                <asp:BoundField DataField="Dia" DataFormatString="{0:dd/MM/yyyy}" 
                    HeaderText="Dia" HtmlEncode="False" ReadOnly="True" SortExpression="Dia">
                    <FooterStyle BackColor="White" BorderStyle="None" />
                    <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                        HorizontalAlign="Center" />
                </asp:BoundField>
                <asp:BoundField DataField="vlrSaldoInicial" DataFormatString="{0:N0}" 
                    HeaderText="Saldo Inicial" HtmlEncode="False" 
                    SortExpression="vlrSaldoInicial">
                    <FooterStyle BackColor="White" BorderStyle="None" />
                    <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                </asp:BoundField>
                <asp:BoundField DataField="vlrEntradas" DataFormatString="{0:N0}" 
                    HeaderText="Entradas" HtmlEncode="False" SortExpression="vlrEntradas">
                    <FooterStyle BorderColor="#666666" BorderStyle="Solid" BorderWidth="1px" 
                        Font-Bold="True" />
                    <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                </asp:BoundField>
                <asp:BoundField DataField="vlrSaidas" DataFormatString="{0:N0}" 
                    HeaderText="Saídas" HtmlEncode="False" SortExpression="vlrSaidas">
                    <FooterStyle BorderColor="#666666" BorderStyle="Solid" BorderWidth="1px" 
                        Font-Bold="True" />
                    <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                </asp:BoundField>
                <asp:BoundField DataField="vlrSaldoFinal" DataFormatString="{0:N0}" 
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
                    <FooterStyle BorderColor="#666666" BorderStyle="Solid" BorderWidth="1px" 
                        Font-Bold="True" />
                    <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                </asp:BoundField>
                <asp:BoundField DataField="vlrSaldoFinanceiro" DataFormatString="{0:N0}" 
                    HeaderText="Saldo Financeiro" HtmlEncode="False" 
                    SortExpression="vlrSaldoFinanceiro">
                    <FooterStyle BackColor="White" BorderStyle="None" />
                    <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                </asp:BoundField>
            </Columns>
            <FooterStyle BackColor="#E1E1E1" HorizontalAlign="Right" />
            <PagerStyle BackColor="#6699FF" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#FFFF99" Font-Bold="True" ForeColor="Black" />
            <HeaderStyle BackColor="#6699FF" Font-Bold="False" ForeColor="White" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="dsDefinitivo" runat="server" 
            ConnectionString="<%$ ConnectionStrings:conn_relReuniao %>" 
            SelectCommand="SELECT Dia, idFilial, vlrSaldoInicial, vlrEntradas, vlrSaidas, vlrSaldoFinal, percTaxaDia, vlrRecDespFinanc, vlrSaldoFinanceiro FROM tblResFin_ResumoDia WHERE (Ano = @Ano) AND (Mes = @Mes) AND (idFilial = @idFilial)">
            <SelectParameters>
                <asp:ControlParameter ControlID="cboAno" Name="Ano" 
                    PropertyName="Value" />
                <asp:ControlParameter ControlID="cboMes" Name="Mes" 
                    PropertyName="Value" />
                <asp:ControlParameter ControlID="cboFilial" Name="idFilial" 
                    PropertyName="Value" />
            </SelectParameters>
        </asp:SqlDataSource>
            </td>
        </tr>
    </table>
    <br />
</p>
</asp:Content>

