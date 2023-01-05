<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Projetos/mpPlanejamento.master" AutoEventWireup="false" CodeFile="planej06_Ata.aspx.vb" Inherits="Ranking_planej06_DiarioBordo" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<%@ Register src="Controles/wuc_cboProjeto_Subprojeto.ascx" tagname="wuc_cboProjeto_Subprojeto" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Panel ID="panGeral" runat="server" BackColor="White" BorderColor="#4E5F95" 
        BorderStyle="Solid" BorderWidth="2px" Width="800px" Height="360px">
        <table class="style1">
            <tr>
                <td align="center" class="style10" valign="top" 
                    style="width: 209px; ">
                    <asp:Panel ID="panMemoriaImg" runat="server" Width="161px">
                        <dxe:ASPxImage ID="ASPxImage3" runat="server" ImageUrl="~/image/documents-white-edit-icon_128.png" 
                            Height="89px" Width="88px">
                        </dxe:ASPxImage>
                    </asp:Panel>
                </td>
                <td align="left" rowspan="9" valign="top">
                    <asp:Panel ID="panMemoriaTable" runat="server" BorderColor="#C4DDFA" 
                        BorderStyle="Solid" BorderWidth="1px" Height="350px">
                        <table class="style1">
                            <tr>
                                <td style="color: #5066AC; width: 144px">
                                    <b>Dia:</b></td>
                                <td style="width: 170px">
                                    <dxe:ASPxDateEdit ID="txtDia" runat="server" 
                                        CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" CssPostfix="Office2003_Blue" 
                                        ImageFolder="~/App_Themes/Office2003 Blue/{0}/" Width="110px" 
                                        Enabled="False">
                                        <ButtonStyle Width="13px">
                                        </ButtonStyle>
                                    </dxe:ASPxDateEdit>
                                </td>
                                <td style="width: 112px">
                                    &nbsp;</td>
                                <td align="right">
                                    <asp:TextBox ID="txtDiarioID" runat="server" 
                                        BorderStyle="None" Width="52px" ForeColor="White"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                        <table class="style1">
                            <tr>
                                <td class="style9" style="font-weight: bold; color: #4A5EA1; width: 144px">
                                    Nome do Projeto:</td>
                                <td>
                                    <uc1:wuc_cboProjeto_Subprojeto ID="cboProjeto" runat="server" />
                                </td>
                                <td>
                                    &nbsp;</td>
                            </tr>
                        </table>
                        <table class="style1">
                            <tr>
                                <td class="style8" style="font-weight: bold; color: #4A5EA1; width: 149px" 
                                    align="left" valign="top">
                                    Atividade Desenvolvida:</td>
                                <td style="width: 409px" align="left" valign="top">
                                    <asp:TextBox ID="txtMemo" runat="server" BackColor="#FAFAFA" 
                                        BorderColor="#C4DDFA" BorderStyle="Solid" BorderWidth="1px" Font-Size="Medium" 
                                        ForeColor="#4C61A2" Height="245px" TextMode="MultiLine" Width="356px"></asp:TextBox>
                                </td>
                                <td align="left" valign="top">
                                    <table class="style1">
                                        <tr>
                                            <td align="center">
                                                <dxe:ASPxButton ID="btnNovo" runat="server" 
                                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                                    Text="Novo" Width="90px">
                                                </dxe:ASPxButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <dxe:ASPxButton ID="btnAlterar" runat="server" 
                                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" Text="Alterar" 
                                                    Width="90px">
                                                </dxe:ASPxButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <dxe:ASPxButton ID="btnCancelar" runat="server" 
                                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                                    Text="Cancelar" Width="90px">
                                                </dxe:ASPxButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <dxe:ASPxButton ID="btnSalvar" runat="server" 
                                                    CssFilePath="~/App_Themes/Youthful/{0}/styles.css" CssPostfix="Youthful" 
                                                    Text="Salvar" Width="90px">
                                                </dxe:ASPxButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <dxe:ASPxButton ID="btnExcluir" runat="server" 
                                                    CssFilePath="~/App_Themes/Red Wine/{0}/styles.css" CssPostfix="RedWine" 
                                                    Text="Excluir" Width="90px">
                                                </dxe:ASPxButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <br />
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td align="center" class="style4" valign="top" 
                    style="width: 209px; font-weight: bold; color: #4A5EA1;">
                    Memorial do Diário</td>
            </tr>
            <tr>
                <td align="center" class="style4" 
                    style="width: 209px; font-weight: bold; color: #4A5EA1;" valign="top">
                    <dxe:ASPxComboBox ID="cboList" runat="server" AutoPostBack="True" 
                        BackColor="#FAFAFA" CssFilePath="~/App_Themes/Aqua/{0}/styles.css" 
                        CssPostfix="Aqua" DataSourceID="SqlDataSource1" 
                        ImageFolder="~/App_Themes/Aqua/{0}/" SettingsLoadingPanel-Text="" ShowShadow="False" 
                        ToolTip="Exibe todas as atas das reuniões para este projeto. Você de selecionar um projeto primeiro." 
                        ValueField="ID" Width="151px">
                        <ButtonEditEllipsisImage Height="3px" 
                            Url="~/App_Themes/Aqua/Editors/edtEllipsis.png" 
                            UrlDisabled="~/App_Themes/Aqua/Editors/edtEllipsisDisabled.png" 
                            UrlHottracked="~/App_Themes/Aqua/Editors/edtEllipsisHottracked.png" 
                            UrlPressed="~/App_Themes/Aqua/Editors/edtEllipsisPressed.png" Width="12px" />
                        <DropDownButton>
                            <Image Height="7px" Url="~/App_Themes/Aqua/Editors/edtDropDown.png" 
                                UrlDisabled="~/App_Themes/Aqua/Editors/edtDropDownDisabled.png" 
                                UrlHottracked="~/App_Themes/Aqua/Editors/edtDropDownHottracked.png" 
                                UrlPressed="~/App_Themes/Aqua/Editors/edtDropDownPressed.png" Width="9px" />
                        </DropDownButton>
                        <Columns>
                            <dxe:ListBoxColumn Caption="ID" FieldName="ID" Width="20px" />
                            <dxe:ListBoxColumn Caption="Dia" FieldName="dbDia" Name="Dia" Width="70px" />
                            <dxe:ListBoxColumn Caption="Hora" FieldName="dbHora" Width="60px" />
                        </Columns>
                        <ValidationSettings>
                            <ErrorImage Height="14px" Url="~/App_Themes/Aqua/Editors/edtError.png" 
                                Width="14px" />
                            <ErrorFrameStyle ImageSpacing="4px">
                                <ErrorTextPaddings PaddingLeft="4px" />
                            </ErrorFrameStyle>
                        </ValidationSettings>
                    </dxe:ASPxComboBox>
                </td>
            </tr>
            <tr>
                <td align="center" class="style4" 
                    style="width: 209px; font-weight: bold; color: #4A5EA1;" valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" class="style4" 
                    style="width: 209px; font-weight: bold; color: #4A5EA1;" valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" class="style4" 
                    style="width: 209px; font-weight: bold; color: #4A5EA1;" valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" class="style4" 
                    style="width: 209px; font-weight: bold; color: #4A5EA1;" valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" class="style4" 
                    style="width: 209px; font-weight: bold; color: #4A5EA1;" valign="top">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center" class="style4" style="width: 209px" valign="top">
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerProjetosConnectionString %>" 
                        
                        SelectCommand="uspBuscarDiarioBordo" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="ProjetoID" SessionField="idProjeto" Type="Int16" />
                            <asp:SessionParameter Name="Tipo" SessionField="idTipo" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td align="left" class="style4" valign="top" style="width: 209px">
                    <asp:SqlDataSource ID="dsMemoProjeto" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerContConn2008 %>" 
                        SelectCommand="SELECT ProjetoID, ProjetoDesc FROM viewProjetosAtivo">
                    </asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <br />
    </asp:Panel>
    <p>
        <br />
    </p>
</asp:Content>

