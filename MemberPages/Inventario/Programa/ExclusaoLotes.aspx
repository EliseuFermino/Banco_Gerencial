<%@ Page Title="Exclusão de lotes" Language="VB" MasterPageFile="~/MemberPages/Inventario/Programa/SiteInventario.master" AutoEventWireup="false" CodeFile="ExclusaoLotes.aspx.vb" Inherits="MemberPages_Inventario_Programa_InsercaoLotes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <table class="style1">
            <tr>
                <td style="padding-bottom: 20px; font-size: xx-large; text-decoration: underline;" 
                    valign="middle">
                    <strong>Exclusão de Lotes</strong></td>
            </tr>
            <tr>
                <td style="padding-bottom: 20px" valign="middle">
                    &nbsp;&nbsp;&nbsp;&nbsp;<strong><asp:RadioButton ID="rndSequencial" runat="server" AutoPostBack="True" 
                                            Font-Size="Medium" GroupName="gr1" Text="Sequencial" />
                                        </strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:RadioButton ID="rndNumerico" runat="server" AutoPostBack="True" 
                                            Font-Size="Medium" GroupName="gr1" Text="Numérico" 
                        style="font-weight: 700" />
                                    <br />
                    <br />
                    <span style="font-size: large">Equipe:</span>&nbsp;
                                        <asp:TextBox ID="txtEquipe" runat="server" AutoPostBack="True" 
                                            Font-Size="Large"   Height="30px" Width="70px"></asp:TextBox>
                </td>
            </tr>
        </table>
        <table class="style1">
            <tr>
                <td style="padding-bottom: 20px" valign="middle">
                                        <span style="font-size: large" __designer:mapid="128">Lote:</span>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                                        <asp:TextBox ID="txtLoteInicial" runat="server" AutoPostBack="True" 
                                            Font-Size="Large" Height="30px" Width="70px"></asp:TextBox>
                                        &nbsp; <span style="font-size: large" 
                        __designer:mapid="12a">ao</span>&nbsp;
                                        <asp:TextBox ID="txtLoteFinal" runat="server" AutoPostBack="True" 
                                            Enabled="False" Font-Size="Large" Height="30px" 
                        Width="70px"></asp:TextBox>
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            </table>
        <table class="style1">
            <tr>
                <td>
                    <asp:Button ID="btnConfirmar" runat="server" Text="Confirmar" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br />
    </p>
</asp:Content>

