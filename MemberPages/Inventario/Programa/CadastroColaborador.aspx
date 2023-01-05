<%@ Page Title="Cadastro de Funcionários" Language="VB" MasterPageFile="~/MemberPages/Inventario/Programa/SiteInventario.master" AutoEventWireup="false" CodeFile="CadastroColaborador.aspx.vb" Inherits="MemberPages_Inventario_Programa_CadastroColaborador" %>

<%@ Register src="../../../Controles/wucBotaoAtualizar.ascx" tagname="wucBotaoAtualizar" tagprefix="uc1" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table cellpadding="0" class="auto-style1">
        <tr>
            <td>
                <table cellspacing="1" class="auto-style2">
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    <asp:Panel ID="Panel1" runat="server" BorderColor="#999999" BorderStyle="Solid" 
                                        BorderWidth="1px" Height="274px" Width="300px">
                                        <table cellspacing="1" class="auto-style2">
                                            <tr>
                                                <td class="auto-style6" colspan="3" style="text-align: center" 
                                                    bgcolor="#18508A">
                                                    <asp:Label ID="Label1" runat="server" Font-Size="Larger" ForeColor="White" 
                                                        style="font-weight: 700; font-size: large;" 
                                                        Text="Cadastro de Colaboradores"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style6" style="height: 25px">Matricula:</td>
                                                <td style="height: 25px">
                                                    <asp:TextBox ID="txtMatricula" runat="server" Width="200px"></asp:TextBox>
                                                </td>
                                                <td style="height: 25px">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                                        ControlToValidate="txtMatricula" 
                                                        ErrorMessage="Você deve informar a 'Matricula'" ForeColor="Red" 
                                                        SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style6">Nome Completo:</td>
                                                <td>
                                                    <asp:TextBox ID="txtNome" runat="server" Width="200px" Height="33px" TextMode="MultiLine"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                                        ControlToValidate="txtNome" ErrorMessage="Você deve informar um 'Nome'" 
                                                        ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style7" style="height: 20px">&nbsp;</td>
                                                <td class="auto-style7" colspan="2" style="height: 20px">
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" class="auto-style7" colspan="3">
                                                    <uc1:wucBotaoAtualizar ID="btnSalvar" runat="server" />
                                                </td>
                                            </tr>
                                        </table>
    <br />
                                        <table cellspacing="1" class="auto-style2">
                                            <tr>
                                                <td style="text-align: center">
                                                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
                                                </td>
                                            </tr>
                                        </table>
    <br />
                                    </asp:Panel>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
                <br />
                <br />
            </td>
        </tr>
    </table>
</asp:Content>

