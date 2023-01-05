<%@ Page Title="Cadastro de Setor" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="CadastroSetor.aspx.vb" Inherits="MemberPages_Inventario_Programa_CadastroSetor" %>

<%@ Register src="../../../Controles/wucBotaoAtualizar.ascx" tagname="wucBotaoAtualizar" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            float: left;
            border-collapse: collapse;
        }
        .auto-style2 {
            width: 100%;
            float: left;
        }
        .auto-style3 {
            width: 359px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table cellpadding="0" class="auto-style1">
        <tr>
            <td>
                <table cellspacing="1" class="auto-style2">
                    <tr>
                        <td class="auto-style3" style="vertical-align: top">
                                    <asp:Panel ID="Panel1" runat="server" BorderColor="#999999" BorderStyle="Solid" 
                                        BorderWidth="1px" Height="274px" Width="350px">
                                        <table cellspacing="1" class="auto-style2">
                                            <tr>
                                                <td class="auto-style6" colspan="3" style="text-align: center">
                                                    <asp:Label ID="Label1" runat="server" Font-Size="Larger" 
                                                        style="font-weight: 700" Text="Cadastro de Setores"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style6">Nº Setor:</td>
                                                <td>
                                                    <asp:TextBox ID="txtNumSetor" runat="server" Width="200px"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                        ControlToValidate="txtNumSetor" 
                                                        ErrorMessage="Você deve informar o número do setor 'Nº Setor'" ForeColor="Red" 
                                                        SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style6">Descrição:</td>
                                                <td>
                                                    <asp:TextBox ID="txtDescricao" runat="server" Width="200px"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                        ControlToValidate="txtDescricao" ErrorMessage="Você deve informar uma Descrição para o setor" 
                                                        ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                        </table>
    <br />
                                        <table cellspacing="1" class="auto-style2">
                                            <tr>
                                                <td style="text-align: center">
                                                    <uc1:wucBotaoAtualizar ID="btnSalvar" runat="server" />
                                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
                                                </td>
                                            </tr>
                                        </table>
    <br />
                                    </asp:Panel>
                        </td>
                        <td style="vertical-align: top; text-align: left">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                CellPadding="4" DataSourceID="dsGrid" ForeColor="#333333" GridLines="None">
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                <Columns>
                                    <asp:BoundField DataField="idSetor" HeaderText="Setor" />
                                    <asp:BoundField DataField="SetorDesc" HeaderText="Nome do Setor" />
                                </Columns>
                                <EditRowStyle BackColor="#999999" />
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                            </asp:GridView>
                            <asp:SqlDataSource ID="dsGrid" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:gerInvConnectionString %>" 
                                SelectCommand="Programa.uspListaSetor" SelectCommandType="StoredProcedure">
                            </asp:SqlDataSource>
                        </td>
                    </tr>
                </table>
                <br />
                <br />
            </td>
        </tr>
    </table>
</asp:Content>

