<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="planej00_SWOT.aspx.vb" Inherits="Ranking_planej00_Planejamento" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">
    <p>
        <table class="style1">
            <tr>
                <td style="padding-bottom: 6px">
                    <dxm:ASPxMenu ID="ASPxMenu1" runat="server" AutoSeparators="RootOnly" 
                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                         ImageFolder="~/App_Themes/Aqua/{0}/" ItemSpacing="0px" 
                        SeparatorColor="#AECAF0" SeparatorHeight="100%" SeparatorWidth="1px" 
                        ShowPopOutImages="True">
                        <RootItemSubMenuOffset FirstItemX="-1" FirstItemY="-1" X="-1" Y="-1" />
                        <Items>
                            <dxm:MenuItem NavigateUrl="planej00_Planejamento.aspx" Text="Ideologia">
                            </dxm:MenuItem>
                            <dxm:MenuItem Text="SWOT" NavigateUrl="planej00_SWOT.aspx">
                            </dxm:MenuItem>
                            <dxm:MenuItem Text="Mapa Estratégico" 
                                NavigateUrl="planej00_MapaEstrategico.aspx">
                            </dxm:MenuItem>
                            <dxm:MenuItem Text="Linha de Visão" NavigateUrl="planej00_LinhaVisao.aspx">
                            </dxm:MenuItem>
                        </Items>
                        <VerticalPopOutImage Height="11px" Width="11px" />
                        <ItemStyle ImageSpacing="5px" PopOutImageSpacing="18px" 
                            VerticalAlign="Middle" />
                        <SubMenuStyle BackColor="#F9F9F9" GutterWidth="0px" SeparatorColor="#AECAF0" />
                        <SubMenuItemStyle ImageSpacing="7px">
                        </SubMenuItemStyle>
                        <Border BorderColor="#AECAF0" BorderStyle="Solid" BorderWidth="1px" />
                        <HorizontalPopOutImage Height="7px" Width="7px" />
                    </dxm:ASPxMenu>
                </td>
            </tr>
            <tr>
                <td align="center" valign="top">
                    <dxe:ASPxImage ID="ASPxImage1" runat="server" 
                        ImageUrl="~/image/planejSWOT.png" Height="605px" Width="635px">
                    </dxe:ASPxImage>
                </td>
            </tr>
        </table>
        <br />
    </p>
</asp:Content>

