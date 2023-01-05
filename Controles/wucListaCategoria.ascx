<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucListaCategoria.ascx.vb" Inherits="Controles_wucListaCategoria" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<style type="text/css">
    .style5
    {
        width: 50%;
        border-collapse: collapse;
    }
    .style6
    {
        width: 76px;
    }
</style>

<table cellpadding="0" class="style5">
    <tr>
        <td class="style6">
            Categoria: </td>
        <td style="margin-left: 2px; padding-left: 4px;">
                <dx:ASPxComboBox ID="cboCategoria" runat="server" ClientIDMode="AutoID" 
                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                    DataSourceID="dsCategoria" DropDownStyle="DropDownList" 
                    EnableSynchronization="Default" HorizontalAlign="NotSet" 
                    IncrementalFilteringMode="None" SettingsLoadingPanel-ImagePosition="Top" 
                    PopupHorizontalAlign="LeftSides" PopupVerticalAlign="Below" 
                    RenderIFrameForPopupElements="Default" ShowShadow="False" 
                    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" TextField="Cat_Descricao" 
                    ValueField="Cat_ID" ValueType="System.String" AutoPostBack="True">
                    <ItemImage Align="NotSet">
                    </ItemImage>
                    <ItemStyle HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
                    <SelectedStyle>
                        <BackgroundImage Repeat="Repeat" />
                        <Border BorderStyle="NotSet" />
                        <BorderLeft BorderStyle="NotSet" />
                        <BorderTop BorderStyle="NotSet" />
                        <BorderRight BorderStyle="NotSet" />
                        <BorderBottom BorderStyle="NotSet" />
                    </SelectedStyle>
                    <HoverStyle>
                        <BackgroundImage Repeat="Repeat" />
                        <Border BorderStyle="NotSet" />
                        <BorderLeft BorderStyle="NotSet" />
                        <BorderTop BorderStyle="NotSet" />
                        <BorderRight BorderStyle="NotSet" />
                        <BorderBottom BorderStyle="NotSet" />
                    </HoverStyle>
                    <BackgroundImage Repeat="Repeat" />
                    <Border BorderStyle="NotSet" />
                    <BorderLeft BorderStyle="NotSet" />
                    <BorderTop BorderStyle="NotSet" />
                    <BorderRight BorderStyle="NotSet" />
                    <BorderBottom BorderStyle="NotSet" />
                    </ItemStyle>
                    <ListBoxStyle HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
                        <BackgroundImage Repeat="Repeat" />
                        <Border BorderStyle="NotSet" />
                        <BorderLeft BorderStyle="NotSet" />
                        <BorderTop BorderStyle="NotSet" />
                        <BorderRight BorderStyle="NotSet" />
                        <BorderBottom BorderStyle="NotSet" />
                    </ListBoxStyle>
                    <LoadingPanelImage Align="NotSet" url="~/App_Themes/Aqua/Editors/Loading.gif">
                    </LoadingPanelImage>
                    <LoadingPanelStyle HorizontalAlign="NotSet" VerticalAlign="NotSet" 
                        Wrap="Default">
                        <BackgroundImage Repeat="Repeat" />
                        <Border BorderStyle="NotSet" />
                        <BorderLeft BorderStyle="NotSet" />
                        <BorderTop BorderStyle="NotSet" />
                        <BorderRight BorderStyle="NotSet" />
                        <BorderBottom BorderStyle="NotSet" />
                    </LoadingPanelStyle>
                    <DropDownButton ImagePosition="Left" Position="Right">
                        <Image Align="NotSet">
                            <SpriteProperties HottrackedCssClass="dxEditors_edtDropDownHover_Aqua" 
                                PressedCssClass="dxEditors_edtDropDownPressed_Aqua" />
                        </Image>
                    </DropDownButton>
                    <ButtonEditEllipsisImage Align="NotSet">
                    </ButtonEditEllipsisImage>
                    <ButtonStyle HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
                        <DisabledStyle>
                            <BackgroundImage Repeat="Repeat" />
                            <Border BorderStyle="NotSet" />
                            <BorderLeft BorderStyle="NotSet" />
                            <BorderTop BorderStyle="NotSet" />
                            <BorderRight BorderStyle="NotSet" />
                            <BorderBottom BorderStyle="NotSet" />
                        </DisabledStyle>
                        <PressedStyle>
                            <BackgroundImage Repeat="Repeat" />
                            <Border BorderStyle="NotSet" />
                            <BorderLeft BorderStyle="NotSet" />
                            <BorderTop BorderStyle="NotSet" />
                            <BorderRight BorderStyle="NotSet" />
                            <BorderBottom BorderStyle="NotSet" />
                        </PressedStyle>
                        <HoverStyle>
                            <BackgroundImage Repeat="Repeat" />
                            <Border BorderStyle="NotSet" />
                            <BorderLeft BorderStyle="NotSet" />
                            <BorderTop BorderStyle="NotSet" />
                            <BorderRight BorderStyle="NotSet" />
                            <BorderBottom BorderStyle="NotSet" />
                        </HoverStyle>
                        <BackgroundImage Repeat="Repeat" />
                        <Border BorderStyle="NotSet" />
                        <BorderLeft BorderStyle="NotSet" />
                        <BorderTop BorderStyle="NotSet" />
                        <BorderRight BorderStyle="NotSet" />
                        <BorderBottom BorderStyle="NotSet" />
                    </ButtonStyle>
                    <ValidationSettings Display="Static" ErrorDisplayMode="ImageWithText" 
                        ErrorTextPosition="Right">
                        <ErrorImage Align="NotSet">
                        </ErrorImage>
                        <ErrorFrameStyle HorizontalAlign="NotSet" imagespacing="4px" 
                            VerticalAlign="NotSet" Wrap="Default">
                            <ErrorTextPaddings PaddingLeft="4px" />
                            <HoverStyle>
                                <BackgroundImage Repeat="Repeat" />
                                <Border BorderStyle="NotSet" />
                                <BorderLeft BorderStyle="NotSet" />
                                <BorderTop BorderStyle="NotSet" />
                                <BorderRight BorderStyle="NotSet" />
                                <BorderBottom BorderStyle="NotSet" />
                            </HoverStyle>
                            <BackgroundImage Repeat="Repeat" />
                            <Border BorderStyle="NotSet" />
                            <BorderLeft BorderStyle="NotSet" />
                            <BorderTop BorderStyle="NotSet" />
                            <BorderRight BorderStyle="NotSet" />
                            <BorderBottom BorderStyle="NotSet" />
                        </ErrorFrameStyle>
                    </ValidationSettings>
                    <ReadOnlyStyle HorizontalAlign="NotSet" VerticalAlign="NotSet" Wrap="Default">
                        <BackgroundImage Repeat="Repeat" />
                        <Border BorderStyle="NotSet" />
                        <BorderLeft BorderStyle="NotSet" />
                        <BorderTop BorderStyle="NotSet" />
                        <BorderRight BorderStyle="NotSet" />
                        <BorderBottom BorderStyle="NotSet" />
                    </ReadOnlyStyle>
                    <FocusedStyle HorizontalAlign="NotSet" Wrap="Default">
                        <BackgroundImage Repeat="Repeat" />
                        <Border BorderStyle="NotSet" />
                        <BorderLeft BorderStyle="NotSet" />
                        <BorderTop BorderStyle="NotSet" />
                        <BorderRight BorderStyle="NotSet" />
                        <BorderBottom BorderStyle="NotSet" />
                    </FocusedStyle>
                    <InvalidStyle HorizontalAlign="NotSet" Wrap="Default">
                        <BackgroundImage Repeat="Repeat" />
                        <Border BorderStyle="NotSet" />
                        <BorderLeft BorderStyle="NotSet" />
                        <BorderTop BorderStyle="NotSet" />
                        <BorderRight BorderStyle="NotSet" />
                        <BorderBottom BorderStyle="NotSet" />
                    </InvalidStyle>
                    <BackgroundImage Repeat="Repeat" />
                    <Border BorderStyle="NotSet" />
                    <BorderLeft BorderStyle="NotSet" />
                    <BorderTop BorderStyle="NotSet" />
                    <BorderRight BorderStyle="NotSet" />
                    <BorderBottom BorderStyle="NotSet" />
                    <DisabledStyle>
                        <BackgroundImage Repeat="Repeat" />
                        <Border BorderStyle="NotSet" />
                        <BorderLeft BorderStyle="NotSet" />
                        <BorderTop BorderStyle="NotSet" />
                        <BorderRight BorderStyle="NotSet" />
                        <BorderBottom BorderStyle="NotSet" />
                    </DisabledStyle>
                </dx:ASPxComboBox>
                </td>
    </tr>
</table>
                <asp:HiddenField ID="lblTipo_ID" runat="server" />
                <asp:SqlDataSource ID="dsCategoria" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerSisFinConnectionString %>" 
                    
                    
    
    SelectCommand="SELECT [Cat_ID], [Cat_Descricao] FROM [tblCadCategoria] WHERE Tipo_ID=@Tipo_ID ORDER BY [Cat_Descricao] ">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblTipo_ID" Name="Tipo_ID" 
                            PropertyName="Value" />
                    </SelectParameters>
                </asp:SqlDataSource>
                

