<%@ Page Language="VB" MasterPageFile="~/MemberPages/Resultado Financeiro/mpResultadoFinanceiro.master" AutoEventWireup="false" CodeFile="frmConsultaPorAgrupamento.aspx.vb" Inherits="MemberPages_Resultado_Financeiro_frmConsultaPorAgrupamento" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            width: 284px;
        }
        .style3
        {
            width: 38px;
        }
        .style4
        {
            width: 28px;
        }
        .style5
        {
            width: 1269px;
        }
        .style6
        {
            width: 360px;
        }
        .style7
        {
            color: #FFFFFF;
            font-weight: bold;
        }
        .style8
        {
            width: 321px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div>
    
        <table class="style1">
            <tr>
                <td bgcolor="#999966" class="style3" style="border: 1px solid #666633">
                    &nbsp;</td>
                <td align="center" class="style4" style="border: 1px solid #666633">
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/image/LogoCondor.jpg" />
                            </td>
                <td bgcolor="#999966" class="style5" style="border: 1px solid #666633">
                    <span class="style7">&nbsp;&nbsp;&nbsp; Conferência e Checagem do Resultado 
                    Financeiro - por Sistema</span>&nbsp;</td>
                <td class="style6">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="4">
&nbsp;<b>Ano:</b>
        <asp:DropDownList ID="cboAno" runat="server" AutoPostBack="True" 
            BackColor="#FFFFCC">
            <asp:ListItem>2014</asp:ListItem>
            <asp:ListItem>2015</asp:ListItem>
            <asp:ListItem>2016</asp:ListItem>
            <asp:ListItem>2017</asp:ListItem>
            <asp:ListItem>2018</asp:ListItem>
            <asp:ListItem>2019</asp:ListItem>
            <asp:ListItem>2020</asp:ListItem>
        </asp:DropDownList>
                    &nbsp;&nbsp; <b>Mês:</b>         
                                <asp:DropDownList ID="cboMes" runat="server" AutoPostBack="True" 
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
        &nbsp;&nbsp; <b>Filial:</b>
                    <asp:DropDownList ID="cboFilial" runat="server" AutoPostBack="True" 
                        BackColor="#FFFFCC">
                    </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:RadioButton ID="optLojas" runat="server" AutoPostBack="True" 
                        GroupName="groupAgrup" Text="Lojas" />
&nbsp;&nbsp;&nbsp;
                    <asp:RadioButton ID="optApoio" runat="server" AutoPostBack="True" 
                        GroupName="groupAgrup" Text="Apoio" />
&nbsp;&nbsp;&nbsp;
                    <asp:RadioButton ID="optEmpresa" runat="server" AutoPostBack="True" 
                        GroupName="groupAgrup" Text="Empresa" />
                </td>
                <td>
                    <asp:Label ID="lblTipo" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
        </table>
    
    </div>
    <table class="style1">
        <tr>
            <td class="style2" valign="top">
                <asp:GridView ID="gridSistema" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="2" ForeColor="Black" GridLines="Vertical" ShowFooter="True" 
                    DataSourceID="dsDaddd">
                    <RowStyle BackColor="#F7F7DE" BorderColor="Gray" BorderStyle="Solid" 
                        BorderWidth="1px" />
                    <Columns>
                        <asp:BoundField DataField="idSis" HeaderText="Cod">
                            <FooterStyle BackColor="White" BorderStyle="None" />
                        </asp:BoundField>
                        <asp:BoundField DataField="descSis" HeaderText="Sistema">
                            <FooterStyle BackColor="White" BorderStyle="None" />
                            <ItemStyle Wrap="False" />
                        </asp:BoundField>
                        <asp:BoundField DataField="vlr" DataFormatString="{0:N2}" HeaderText="vlr" 
                            HtmlEncode="False">
                            <FooterStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                        </asp:BoundField>
                    </Columns>
                    <FooterStyle BackColor="#CCCC99" />
                    <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="dsDaddd" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerContSQL1ConnectionString %>" 
                    SelectCommand="uspResFin_ConsultaSistemaPorMes" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="cboAno" Name="Ano" 
                            PropertyName="SelectedValue" Type="Int16" />
                        <asp:ControlParameter ControlID="cboMes" Name="Mes" 
                            PropertyName="SelectedValue" Type="Byte" />
                        <asp:ControlParameter ControlID="cboFilial" Name="idFilial" 
                            PropertyName="SelectedValue" Type="Byte" />
                        <asp:ControlParameter ControlID="lblTipo" Name="idTipo" PropertyName="Text" 
                            Type="Byte" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td valign="top" align="center" class="style8">
                &nbsp;</td>
        </tr>
        </table>
    &nbsp;
    <br />
&nbsp;
    <asp:HyperLink ID="HyperLink4" runat="server" 
        NavigateUrl="~/MemberPages/Resultado Financeiro/frmViewSistemaAgrupamento.aspx" 
        Target="_blank">1 - Abrir por Agrupamento</asp:HyperLink>
    <br />
&nbsp;
    <asp:HyperLink ID="HyperLink3" runat="server" 
        NavigateUrl="~/MemberPages/Resultado Financeiro/frmViewSistemaDia.aspx" 
        Target="_blank">2 - Abrir por Dia</asp:HyperLink>
    <br />
&nbsp;
    <asp:HyperLink ID="HyperLink2" runat="server" 
        NavigateUrl="~/MemberPages/Resultado Financeiro/frmViewSistemaAgenda.aspx" 
        Target="_blank">3 - Abrir por Agenda</asp:HyperLink>
    
</asp:Content>
