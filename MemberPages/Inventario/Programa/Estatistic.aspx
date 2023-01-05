<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Inventario/Programa/SiteInventario.master" AutoEventWireup="false" CodeFile="Estatistic.aspx.vb" Inherits="MemberPages_Inventario_Programa_Estatistic" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>
            <asp:Panel ID="Panel1" runat="server" Height="350px" Width="220px">
                <table align="left" cellpadding="0" 
                    style="width: 100%; float: left; border-collapse: collapse">
                    <tr>
                        <td align="center" bgcolor="#4A5A90" style="border: 1px solid #808080">
                            <asp:Label ID="Label1" runat="server" Text="Estatística" Font-Bold="True" 
                                Font-Size="X-Large" ForeColor="White"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" bgcolor="#999999" style="border: 1px solid #808080">
                            <asp:Label ID="lblTitleContagem1" runat="server" Font-Bold="True" 
                                Font-Size="Large" ForeColor="White" Text="1º Contagem"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <table style="border-collapse: collapse; width: 100%; float: left">
                    <tr>
                        <td style="border: 1px solid #999999; width: 91px;">Total</td>
                        <td align="center" style="border: 1px solid #999999; width: 54px;">
                            <asp:Label ID="lblTotal" runat="server">0</asp:Label>
                        </td>
                        <td align="right" style="border: 1px solid #999999;">
                            <asp:Label ID="Label3" runat="server" Text="100,00%"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #999999; width: 91px;">Despachados</td>
                        <td align="center" style="border: 1px solid #999999; width: 54px;">
                            <asp:Label ID="lblDespachados1" runat="server" Text="0"></asp:Label>
                        </td>
                        <td align="right" style="border: 1px solid #999999;">
                            <asp:Label ID="lblCalcDespachado1" runat="server" Text="0"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #999999; width: 91px;">OK</td>
                        <td align="center" style="border: 1px solid #999999; width: 54px;">
                            <asp:Label ID="lblBaixa1" runat="server" Text="0"></asp:Label>
                        </td>
                        <td align="right" style="border: 1px solid #999999;">
                            <asp:Label ID="lblCalcBaixa1" runat="server" Text="0"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="padding-left: 7px">&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" bgcolor="#6699FF" colspan="3" 
                            style="border: 1px solid #808080;">
                            <asp:Label ID="lblTitleContagem2" runat="server" Font-Bold="True" 
                                Font-Size="Large" ForeColor="White" Text="2º Contagem"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #808080;">Total</td>
                        <td align="center" style="border: 1px solid #808080">
                            <asp:Label ID="lblTotal2" runat="server">0</asp:Label>
                        </td>
                        <td align="right" style="border: 1px solid #808080;">100,00%</td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #808080;">Despachados</td>
                        <td align="center" style="border: 1px solid #808080">
                            <asp:Label ID="lblDespachados2" runat="server" Text="0"></asp:Label>
                        </td>
                        <td align="right" style="border: 1px solid #808080;">100,00%</td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #808080;">OK</td>
                        <td align="center" style="border: 1px solid #808080">
                            <asp:Label ID="lblBaixa2" runat="server" Text="0"></asp:Label>
                        </td>
                        <td align="right" style="border: 1px solid #808080;">
                            <asp:Label ID="lblCalcBaixa2" runat="server" Text="0"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3" style="padding-left: 7px">&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="center" bgcolor="#6699FF" colspan="3" 
                            style="border: 1px solid #808080;">
                            <asp:Label ID="lblTitleContagem3" runat="server" Font-Bold="True" 
                                Font-Size="Large" ForeColor="White" Text="3º Contagem"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #808080;">Total</td>
                        <td align="center" style="border: 1px solid #808080;">
                            <asp:Label ID="lblTotal3" runat="server">0</asp:Label>
                        </td>
                        <td align="right" style="border: 1px solid #808080;">100,00%</td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #808080;">Despachados</td>
                        <td align="center" style="border: 1px solid #808080;">
                            <asp:Label ID="lblDespachados3" runat="server" Text="0"></asp:Label>
                        </td>
                        <td align="right" style="border: 1px solid #808080;">100,00%</td>
                    </tr>
                    <tr>
                        <td style="border: 1px solid #808080;">OK</td>
                        <td align="center" style="border: 1px solid #808080;">
                            <asp:Label ID="lblBaixa3" runat="server" Text="0"></asp:Label>
                        </td>
                        <td align="right" style="border: 1px solid #808080;">
                            <asp:Label ID="lblCalcBaixa3" runat="server" Text="0"></asp:Label>
                        </td>
                    </tr>
                </table>
                <br />
                <br />
            </asp:Panel>
<br />
        </ContentTemplate>
    </asp:UpdatePanel>
    <br />
</asp:Content>

