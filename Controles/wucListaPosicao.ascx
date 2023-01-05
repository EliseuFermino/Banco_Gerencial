<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucListaPosicao.ascx.vb" Inherits="wucListaPosicao" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<style type="text/css">
    .auto-style1 {
        border-collapse: collapse;
        float: left;
        width: 104px;
    }
    .auto-style2 {
        width: 72px;
    }
</style>
<table align="left" cellpadding="0" class="auto-style1">
    <tr>
        <td class="auto-style2">Posição: </td>
        <td>
                                                <dxe:ASPxComboBox ID="cboPosição" 
                runat="server" AutoPostBack="True" 
                                                    
                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                                    ImageFolder="~/App_Themes/Aqua/{0}/" 
                SettingsLoadingPanel-Text="" ShowShadow="False" 
                Width="121px" Theme="DevEx" Native="True">
                                                    <Items>
                                                        <dxe:ListEditItem Text="Loja" Value="1" />
                                                        <dxe:ListEditItem Text="Administração" Value="2" />
                                                        <dxe:ListEditItem Text="Definitivo" Value="3" />
                                                        <dxe:ListEditItem Text="Comercial" Value="4" />
                                                        <dxe:ListEditItem Text="Futura" Value="5" />
                                                        <dxe:ListEditItem Text="Postos" Value="6" />
                                                    </Items>
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
    </tr>
</table>

