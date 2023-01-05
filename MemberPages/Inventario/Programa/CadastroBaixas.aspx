<%@ Page Title="Baixa de lotes" Language="VB" MasterPageFile="~/MemberPages/Inventario/Programa/SiteInventario.master" AutoEventWireup="false" CodeFile="CadastroBaixas.aspx.vb" Inherits="MemberPages_Inventario_Programa_Baixas" %>

<%@ Register src="../../../Controles/wucBotaoAtualizar.ascx" tagname="wucBotaoAtualizar" tagprefix="uc1" %>

<%@ Register src="../../../Controles/wucEstatistica.ascx" tagname="wucEstatistica" tagprefix="uc2" %>

<%@ Register src="../../../Controles/wucBotaoExcel.ascx" tagname="wucBotaoExcel" tagprefix="uc3" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSalvar" />
        </Triggers>
        <ContentTemplate>
            
    <table cellpadding="0" style="border-collapse: collapse; width: 100%">
        <tr>
            <td>
                <table style="border-collapse: collapse; width: 100%; float: left">
                    <tr>
                        <td align="left" style="width: 228px" valign="top">
                            <asp:Panel ID="Panel2" runat="server" Height="300px" Width="220px">
                                <table cellpadding="0" 
    style="border-collapse: collapse; width: 100%; float: left">
                                    <tr>
                                        <td align="center" style="font-size: large; color: #FF0000;"><strong>&nbsp;Baixa de Lotes</strong></td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;
                                            <asp:RadioButton ID="rndSequencial" runat="server" GroupName="rnd" 
                                                Text="Sequencial" AutoPostBack="True" />
                                            &nbsp;&nbsp;&nbsp;
                                            <asp:RadioButton ID="rndNumerico" runat="server" GroupName="rnd" 
                                                Text="Numérico" AutoPostBack="True" />
                                            <br />
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;&nbsp;&nbsp;&nbsp; Lote:&nbsp;<asp:TextBox ID="txtLoteInicial" runat="server" Width="45px"></asp:TextBox>
                                            &nbsp;
                                            <asp:Label ID="lblAO" runat="server" Text="ao"></asp:Label>
                                            &nbsp;
                                            <asp:TextBox ID="txtLoteFinal" runat="server" Width="45px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <dx:ASPxButton ID="btnSalvar" runat="server" Text="Baixar" 
                                                Theme="iOS">
                                            </dx:ASPxButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center">
                                            <br />
                                            <br />
                                            <br />
                                            &nbsp;<asp:RequiredFieldValidator ID="reqValLoteInicial" runat="server" ControlToValidate="txtLoteInicial" ErrorMessage="Lote Inicial não informado" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <br />
                                            <asp:RequiredFieldValidator ID="reqValLoteFinal" runat="server" ControlToValidate="txtLoteFinal" ErrorMessage="Lote Final não informado" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                            <br />
                                            <asp:RangeValidator ID="rngValLoteInicial" runat="server" ControlToValidate="txtLoteInicial" ErrorMessage="Lote Inicial - Esse lote não existe!" ForeColor="Red" MaximumValue="3000" MinimumValue="1" SetFocusOnError="True" Type="Integer"></asp:RangeValidator>
                                            <br />
                                            <asp:RangeValidator ID="rngValLoteFinal" runat="server" ControlToValidate="txtLoteFinal" ErrorMessage="Lote Final - Esse lote não existe!" ForeColor="Red" MaximumValue="3000" MinimumValue="1" SetFocusOnError="True" Type="Integer"></asp:RangeValidator>
                                            <br />
                                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True" ShowSummary="False" />
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                        </td>
                        <td align="left" valign="top">
                            <asp:Panel ID="Panel5" runat="server">
                                <uc2:wucEstatistica ID="wucEstatistica1" runat="server" />
                            </asp:Panel>
                        </td>
                        <td align="left" valign="top">
                            <asp:Panel ID="Panel4" runat="server">
                            </asp:Panel>
                        </td>
                    </tr>
                </table>
                <br />
            </td>
        </tr>
    </table>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

