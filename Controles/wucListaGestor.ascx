<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucListaGestor.ascx.vb" Inherits="Controles_wucListaGestor" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>
<style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style2
    {
        width: 57px;
    }
</style>
<table cellspacing="1" class="style1">
    <tr>
        <td align="left" class="style2">
            &nbsp;Gestor:&nbsp;</td>
        <td align="left">
            <dxe:ASPxComboBox ID="cboGestor" runat="server" AutoPostBack="True" 
                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                ImageFolder="~/App_Themes/Aqua/{0}/" SettingsLoadingPanel-Text="" ShowShadow="False" 
                ValueType="System.String" Width="200px" Theme="DevEx">
                <Items>
                    <dxe:ListEditItem Text="Joanir" Value="Joanir" />
                    <dxe:ListEditItem Text="João" Value="João" />
                    <dxe:ListEditItem Text="Wanclei" Value="Wanclei" />
                    <dxe:ListEditItem Text="Adailton" Value="Adailton" />
                    <dxe:ListEditItem Text="Renato" Value="Renato" />
                    <dxe:ListEditItem Text="Vladimir" Value="Vladimir" />
                    <dxe:ListEditItem Text="Aliceu" Value="Aliceu" />
                    <dxe:ListEditItem Text="Elaine" Value="Elaine" />
                    <dxe:ListEditItem Text="Todos" Value="Todos" />
                </Items>
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
