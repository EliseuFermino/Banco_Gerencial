<%@ Page Title="" Language="VB" MasterPageFile="mpPlanejamento.master" AutoEventWireup="false" CodeFile="projProcessoRedesenho.aspx.vb" Inherits="Ranking_projProcessoAtual" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <table class="style1">
            <tr>
                <td style="color: #506196; width: 128px">
                    <b>Nome do Projeto:</b></td>
                <td>
                                <dxe:ASPxComboBox ID="cboAcompProjeto" runat="server" AutoPostBack="True" 
                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                    DataSourceID="dsAcompProjeto" ImageFolder="~/App_Themes/Aqua/{0}/" 
                                    TextField="ProjetoDesc" ValueField="ProjetoID" ValueType="System.String" 
                                    Width="200px" SettingsLoadingPanel-Text="" ShowShadow="False">
                                    <ButtonEditEllipsisImage Height="3px" 
                                        Url="~/App_Themes/Aqua/Editors/edtEllipsis.png" 
                                        UrlDisabled="~/App_Themes/Aqua/Editors/edtEllipsisDisabled.png" 
                                        UrlHottracked="~/App_Themes/Aqua/Editors/edtEllipsisHottracked.png" 
                                        UrlPressed="~/App_Themes/Aqua/Editors/edtEllipsisPressed.png" 
                                        Width="12px" />
                                    <DropDownButton>
                                        <Image Height="7px" Url="~/App_Themes/Aqua/Editors/edtDropDown.png" 
                                            UrlDisabled="~/App_Themes/Aqua/Editors/edtDropDownDisabled.png" 
                                            UrlHottracked="~/App_Themes/Aqua/Editors/edtDropDownHottracked.png" 
                                            UrlPressed="~/App_Themes/Aqua/Editors/edtDropDownPressed.png" 
                                            Width="9px" />
                                    </DropDownButton>
                                    <ValidationSettings>
                                        <ErrorImage Height="14px" Url="~/App_Themes/Aqua/Editors/edtError.png" 
                                            Width="14px" />
                                        <ErrorFrameStyle ImageSpacing="4px">
                                            <ErrorTextPaddings PaddingLeft="4px" />
                                        </ErrorFrameStyle>
                                    </ValidationSettings>
                                </dxe:ASPxComboBox>
                            </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <table class="style1">
            <tr>
                <td style="width: 439px">
                    <asp:HyperLink ID="HyperLink2" runat="server" 
                        NavigateUrl="TrocasPereciveisSistematica20.pdf" style="color: #FFFFFF">Trocas Pereciveis Sistemática 20</asp:HyperLink>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td style="width: 439px">
        <asp:SqlDataSource ID="dsAcompProjeto" runat="server" 
            ConnectionString="<%$ ConnectionStrings:gerContConn2008 %>" 
            SelectCommand="SELECT ProjetoID, ProjetoDesc FROM viewProjetosAtivo">
        </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br />
    </p>
</asp:Content>

