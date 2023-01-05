<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucListaSubCategoria.ascx.vb" Inherits="Controles_wucListaSubCategoria" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<style type="text/css">
    .style2
    {
        width: 103px;
    }
    .style3
    {
        width: 100%;
    }
</style>

<table cellspacing="1" class="style3">
    <tr>
        <td class="style6">
            Sub-Categoria: 
        </td>
        <td>
                <dx:ASPxComboBox ID="cboSubCategoria" runat="server" ClientIDMode="AutoID" 
                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                    DataSourceID="dsSubCategoria" DropDownStyle="DropDownList" 
                    EnableSynchronization="Default" HorizontalAlign="NotSet" 
                    IncrementalFilteringMode="None" SettingsLoadingPanel-ImagePosition="Top" 
                    PopupHorizontalAlign="LeftSides" PopupVerticalAlign="Below" 
                    RenderIFrameForPopupElements="Default" ShowShadow="False" 
                    SpriteCssFilePath="~/App_Themes/Aqua/{0}/sprite.css" 
                    TextField="SubCat_Descricao" ValueField="SubCat_ID" 
                    ValueType="System.String" Theme="DevEx">
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
                <asp:SqlDataSource ID="dsSubCategoria" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerSisFinConnectionString %>" 
                    
                    
                
                    SelectCommand="SELECT [SubCat_ID], [SubCat_Descricao] FROM [tblCadSubCategoria] WHERE ([Cat_ID] = @Cat_ID) ORDER BY [SubCat_Descricao]">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="lblCat_ID" Name="Cat_ID" PropertyName="Value" 
                            Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:HiddenField ID="lblCat_ID" runat="server" />
            </td>
    </tr>
</table>


