<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="BindingToBinaryData.aspx.vb" Inherits="MemberPages_Concorrrentes_BindingToBinaryData" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>











<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

        <style type="text/css">
        .dxisControl .dxis-passePartout {
            background-color: transparent !important;
        }
        .dxisControl .dxis-nextBtnHorWrapper, .dxisControl .dxis-prevBtnHorWrapper {
            background-color: transparent !important;
        }
        .dxisControl .dxis-nbBottom {
            padding-left: 100px;
            padding-right: 100px;
        }
    </style>
    <script type="text/javascript">
        // <![CDATA[
        function OnControlsInitialized() {
            if (window.location.hash)
                OnImageClick(window.location.hash.substring(1));
            ASPxClientUtils.AttachEventToElement(window, "keydown", KeyHandler);
            ASPxClientUtils.AttachEventToElement(window, "resize", UpdatePopupPosition);
        }
        function OnImageClick(name) {
            var imageSliderItem = imageSlider.GetItemByName(name);
            if (!imageSliderItem)
                return;
            window.location.hash = name;
            popup.Show();
            window.setTimeout(function () { UpdatePopupPosition(); }, 0);
            imageSlider.SetActiveItem(imageSliderItem, true);
            UpdateText();
        }
        function OnActiveItemChanged(s, e) {
            window.location.hash = e.item.name;
            UpdateText();
        }
        function OnPopupCloseUp() {
            window.location.hash = "";
        }
        function OnPopupUp() {
            imageSlider.Focus();
        }
        function KeyHandler(e) {
            if (e.keyCode == ASPxClientUtils.StringToShortcutCode("ESC"))
                popup.Hide();
            if (e.keyCode == ASPxClientUtils.StringToShortcutCode("SPACE"))
                imageSlider.SetActiveItemIndex(imageSlider.GetActiveItemIndex() + 1);
            return true;
        }
        function UpdateText() {
            document.getElementById("itemText").innerHTML = (imageSlider.GetActiveItemIndex() + 1) + " / " + imageSlider.GetItemCount();
        }
        function UpdatePopupPosition() {
            if (popup.IsVisible())
                popup.UpdatePosition();
        }
        // ]]>
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <p>
        Click a photo to enlarge it.</p>
    <dx:ASPxPopupControl ID="ASPxPopupControl1" runat="server" ClientInstanceName="popup" Modal="true"
        PopupHorizontalAlign="WindowCenter" PopupVerticalAlign="WindowCenter" BackColor="Transparent"
        ShowShadow="false" Border-BorderStyle="None" ShowHeader="false" ShowPageScrollbarWhenModal="false"
         EnableTheming="false">
        <ContentStyle Paddings-Padding="0" Border-BorderWidth="0" >
<Paddings Padding="0px"></Paddings>

<Border BorderWidth="0px"></Border>
        </ContentStyle>
        <ClientSideEvents CloseUp="OnPopupCloseUp" PopUp="OnPopupUp" />
        <ModalBackgroundStyle Opacity="100" BackColor="#1a1a1a" />
        <ContentCollection>
            <dx:PopupControlContentControl>
                <table cellpadding="0" cellspacing="0">
                    <tr valign="top">
                        <td align="right" style="padding-right: 11px; padding-bottom: 21px;">
                            <a href="javascript:popup.Hide();" style="padding: 20px; margin-right: -20px;">
                                <img alt="Close" src="images/close.png" width="10" height="10" title="Press Esc to close" /></a>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="padding-bottom: 36px;">
                            <dx:ASPxImageSlider ID="ASPxImageSlider1" runat="server" ClientInstanceName="imageSlider"
                                DataSourceID="datasource1" NameField="ID" Width="860"
                                EnableTheming="false" ThumbnailUrlField="ImageExemplo" ShowNavigationBar="false" ImageUrlField="ImageExemplo" NavigateUrlField="ImageExemplo" TextField="Informacao">
                                <SettingsImageArea ItemTextVisibility="None" NavigationButtonVisibility="Always" />
                                <SettingsBehavior EnablePagingByClick="True" />
                                <Styles>
                                    <ImageArea Width="660" Height="660" />
                                </Styles>
                                <ClientSideEvents ActiveItemChanged="OnActiveItemChanged" />
                            </dx:ASPxImageSlider>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" style="padding-bottom: 36px;">
                            <span style="color: #ffffff; font-size: 9pt; font-family: 'Segoe UI', 'Helvetica Neue', Tahoma;" id="itemText">
                                1/20</span>
                        </td>
                    </tr>
                </table>
            </dx:PopupControlContentControl>
        </ContentCollection>
        <Border BorderStyle="None"></Border>
    </dx:ASPxPopupControl>
    <dx:ASPxDataView ID="dvGalery" runat="server" DataSourceID="datasource1" AllowPaging="False"
        ColumnCount="2" Layout="Flow" PageIndex="-1" RowPerPage="2" Width="632px" ItemSpacing="4px"
        EnableTheming="False">
        <ItemTemplate>
            <b>ID</b>:
            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
            <br/>
            <b>Informacao</b>:
            <asp:Label ID="InformacaoLabel" runat="server" Text='<%# Eval("Informacao") %>' />
            <br/>
            <b>ImageExemplo</b>:
            <asp:Label ID="ImageExemploLabel" runat="server" Text='<%# Eval("ImageExemplo") %>' />
            <br/>
        </ItemTemplate>
        <Paddings Padding="0px" />
        <ItemStyle Height="152px" Width="152px" BackColor="Transparent" Border-BorderStyle="None">
            <Paddings Padding="0px" />
            <Border BorderWidth="1px" />
        </ItemStyle>
    </dx:ASPxDataView>
    <dx:ASPxGlobalEvents ID="ASPxGlobalEvents1" runat="server">
        <ClientSideEvents ControlsInitialized="OnControlsInitialized" />
    </dx:ASPxGlobalEvents>

     <div style="float:left;">
         <asp:SqlDataSource ID="datasource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerKnowledgeConnectionString %>" SelectCommand="SELECT [ID], [Informacao], [ImageExemplo] FROM [tblKnowDados]"></asp:SqlDataSource>
    </div>


</asp:Content>


