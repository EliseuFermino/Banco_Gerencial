<%@ Page Title="Imposto da Importação - Resultado Financeiro" Language="VB" MasterPageFile="~/MemberPages/Resultado Financeiro/mpResultadoFinanceiro.master" AutoEventWireup="false" CodeFile="viewImpostoCompraImportacao.aspx.vb" Inherits="MemberPages_Resultado_Financeiro_viewImpostoCompraImportacao1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

        .style1
        {
            width: 100%;
        }
        .style4
        {
            width: 1002px;
        }
        .style3
        {
            color: #FFFFFF;
            font-weight: bold;
            font-size: x-large;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
    <table class="style1">
        <tr>
            <td>
                <b>Ano:</b>
        <asp:DropDownList ID="cboAno" runat="server" AutoPostBack="True" 
            BackColor="#FFFFCC">
            <asp:ListItem>2016</asp:ListItem>
            <asp:ListItem>2017</asp:ListItem>
            <asp:ListItem>2018</asp:ListItem>
            <asp:ListItem>2019</asp:ListItem>
        </asp:DropDownList>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" DataSourceID="dsImpostosTotal" ForeColor="Black" 
                    GridLines="Vertical" style="font-size: medium">
                        <RowStyle BackColor="#F7F7DE" HorizontalAlign="Right" />
                        <Columns>
                            <asp:CommandField SelectText="S" ShowSelectButton="True">
                                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                                    ForeColor="#3333CC" />
                            </asp:CommandField>
                            <asp:BoundField DataField="Mes" HeaderText="Mes" SortExpression="Mes">
                                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                                    HorizontalAlign="Center" />
                            </asp:BoundField>
                            <asp:BoundField DataField="vlrImposto" DataFormatString="{0:N0}" 
                                HeaderText="vlr. ICMS" HtmlEncode="False" SortExpression="vlrImposto">
                                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="vlrCofins" DataFormatString="{0:N0}" 
                                HeaderText="vlr. COFINS" HtmlEncode="False" SortExpression="vlrCofins">
                                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="vlrPis" DataFormatString="{0:N0}" 
                                HeaderText="vlr. PIS" HtmlEncode="False" SortExpression="vlrPis">
                                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="vlrImp" DataFormatString="{0:N0}" HeaderText="Total" 
                                HtmlEncode="False" SortExpression="vlrImp">
                                <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </asp:BoundField>
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" 
                            HorizontalAlign="Right" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            </td>
        </tr>
    </table>
    <table class="style1">
        <tr>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    <asp:SqlDataSource ID="dsImpostosTotal" runat="server" 
        ConnectionString="<%$ ConnectionStrings:conn_relReuniao %>" 
        SelectCommand="SELECT [idFilial], [Mes], [Ano], [vlrImposto], [vlrCofins], [vlrPis], [vlrImp] FROM [viewResFin_ImpostoDaCompraImportacao] WHERE ([Ano] = @Ano)">
        <SelectParameters>
            <asp:ControlParameter ControlID="cboAno" Name="Ano" 
                PropertyName="SelectedValue" Type="Int16" />
        </SelectParameters>
    </asp:SqlDataSource>
    <table class="style1">
        <tr>
            <td bgcolor="#0066FF" class="style4">
                <span class="style3">&nbsp;Ver agendas analiticas do mês selecionado acima.</span>&nbsp;</td>
        </tr>
    </table>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                    CellPadding="3" ForeColor="#333333" GridLines="None">
                    <RowStyle BackColor="#E3EAEB" HorizontalAlign="Right" />
                    <Columns>
                        <asp:BoundField DataField="idAgenda" HeaderText="Agenda" HtmlEncode="False">
                            <FooterStyle BackColor="White" BorderColor="White" BorderStyle="None" />
                            <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                                HorizontalAlign="Center" />
                        </asp:BoundField>
                        <asp:BoundField DataField="descAgenda" HeaderText="Descrição">
                            <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" 
                                HorizontalAlign="Left" />
                        </asp:BoundField>
                        <asp:BoundField DataField="vlrContabil" DataFormatString="{0:N0}" 
                            HeaderText="vlrContabil" HtmlEncode="False">
                            <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="vlrBaseImposto" DataFormatString="{0:N0}" 
                            HeaderText="vlrBaseImposto" HtmlEncode="False">
                            <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="vlrImposto" DataFormatString="{0:N0}" 
                            HeaderText="vlrImposto" HtmlEncode="False">
                            <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="vlrLiqSemImposto" DataFormatString="{0:N0}" 
                            HeaderText="vlrLiqSemImposto" HtmlEncode="False">
                            <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="vlrBaseCofinsPis" DataFormatString="{0:N0}" 
                            HeaderText="vlrBaseCofinsPis" HtmlEncode="False">
                            <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="vlrCofins" DataFormatString="{0:N0}" 
                            HeaderText="vlrCofins" HtmlEncode="False">
                            <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="vlrPis" DataFormatString="{0:N0}" 
                            HeaderText="vlrPis" HtmlEncode="False">
                            <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="vlrLiqSemImpostoI" DataFormatString="{0:N0}" 
                            HeaderText="vlrLiqSemImpostoI" HtmlEncode="False">
                            <ItemStyle BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <EditRowStyle BackColor="#7C6F57" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
            <br />
    </p>
</asp:Content>

