<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucListaEstabelecimento.ascx.vb" Inherits="Controles_wucListaEstabelecimento" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<style type="text/css">
    .style2
    {
        width: 64px;
    }
    .style3
    {
        width: 100%;
    }
</style>

<table cellspacing="1" class="style3">
    <tr>
        <td class="style6">
            Empresa: 
        </td>
        <td>
            <dx:ASPxComboBox ID="cboEstabelecimento" runat="server" ClientIDMode="AutoID" 
                CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                DropDownStyle="DropDownList" EnableSynchronization="Default" 
                HorizontalAlign="NotSet" IncrementalFilteringMode="None" 
                SettingsLoadingPanel-ImagePosition="Top" PopupHorizontalAlign="LeftSides" 
                PopupVerticalAlign="Below" RenderIFrameForPopupElements="Default" 
                ShowShadow="False" SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" 
                ValueType="System.String" Width="490px" DataSourceID="dsEstabelecimento" 
                TextField="Estab_NomeFantasia" ValueField="Estab_ID">
<ItemImage Align="NotSet"></ItemImage>

<ItemStyle HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<SelectedStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</SelectedStyle>

<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</ItemStyle>

<ListBoxStyle HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</ListBoxStyle>

<LoadingPanelImage Align="NotSet" url="~/App_Themes/Aqua/Editors/Loading.gif"></LoadingPanelImage>

<LoadingPanelStyle HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</LoadingPanelStyle>

<DropDownButton ImagePosition="Left" Position="Right">
<Image Align="NotSet">
    <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" 
        PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
    </Image>
</DropDownButton>

<ButtonEditEllipsisImage Align="NotSet"></ButtonEditEllipsisImage>

<ButtonStyle HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<DisabledStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</DisabledStyle>

<PressedStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</PressedStyle>

<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</ButtonStyle>

<ValidationSettings ErrorDisplayMode="ImageWithText" Display="Static" ErrorTextPosition="Right">
<ErrorImage Align="NotSet"></ErrorImage>

<ErrorFrameStyle HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default" 
        imagespacing="4px">
    <ErrorTextPaddings PaddingLeft="4px" />
<HoverStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</HoverStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</ErrorFrameStyle>
</ValidationSettings>

<ReadOnlyStyle HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</ReadOnlyStyle>

<FocusedStyle HorizontalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</FocusedStyle>

<InvalidStyle HorizontalAlign="NotSet" Wrap="Default">
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</InvalidStyle>

<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>

<DisabledStyle>
<BackgroundImage Repeat="Repeat"></BackgroundImage>

<Border BorderStyle="NotSet"></Border>

<BorderLeft BorderStyle="NotSet"></BorderLeft>

<BorderTop BorderStyle="NotSet"></BorderTop>

<BorderRight BorderStyle="NotSet"></BorderRight>

<BorderBottom BorderStyle="NotSet"></BorderBottom>
</DisabledStyle>
            </dx:ASPxComboBox>
            <asp:SqlDataSource ID="dsEstabelecimento" runat="server" 
                ConnectionString="<%$ ConnectionStrings:gerSisFinConnectionString %>" 
                
                SelectCommand="SELECT [Estab_ID], [Estab_NomeFantasia] FROM [tblEstabelecimento] ORDER BY [Estab_NomeFantasia]">
            </asp:SqlDataSource>
        </td>
    </tr>
</table>


