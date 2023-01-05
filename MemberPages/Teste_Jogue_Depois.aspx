<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Teste_Jogue_Depois.aspx.vb" Inherits="MemberPages_Teste_Jogue_Depois" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width, user-scalable=no, maximum-scale=1.0, minimum-scale=1.0" />
    <title>Responsive Layout - ASP.NET Panel Control</title>
    <link rel="stylesheet" type="text/css" href="../css/ResponsiveLayout.css" />
    <script type="text/javascript">
        function onListBoxValueChanged() {
            GridView.Refresh();
        }
        function updateHeaderMenuOrientation() {
            var orientation = TopPanel.IsExpandable() ? 'Vertical' : 'Horizontal';
            if (orientation !== HeaderMenu.GetOrientation())
                HeaderMenu.SetOrientation(orientation);
        }
        function updateGridHeight() {
            GridView.SetHeight(0);
            var containerHeight = ASPxClientUtils.GetDocumentClientHeight();
            if (document.body.scrollHeight > containerHeight)
                containerHeight = document.body.scrollHeight;
            GridView.SetHeight(containerHeight - TopPanel.GetHeight() - EmployeeSelectorPanel.GetHeight());
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <dx:ASPxPanel ID="TopPanel" runat="server" FixedPosition="WindowTop" ClientInstanceName="TopPanel" CssClass="topPanel" Collapsible="true" Theme="MaterialCompact">
            <Styles>
                <ExpandedPanel CssClass = "expandedPanel" />
            </Styles>
            <SettingsAdaptivity CollapseAtWindowInnerWidth="580" />
            <PanelCollection>
                <dx:PanelContent ID="PanelContent2" runat="server" SupportsDisabledAttribute="True">
                    <div class="title">Orders</div>
                    <dx:ASPxMenu ID="mMain" ClientInstanceName="HeaderMenu" runat="server" CssClass="mainMenu">
                        <Items>
                            <dx:MenuItem Text="Data" NavigateUrl="javascript:void(0)"></dx:MenuItem>
                            <dx:MenuItem Text="Settings" NavigateUrl="javascript:void(1)"></dx:MenuItem>
                            <dx:MenuItem Text="Profile" NavigateUrl="javascript:void(2)"></dx:MenuItem>
                            <dx:MenuItem Text="Help" NavigateUrl="javascript:void(3)"></dx:MenuItem>
                        </Items>
                    </dx:ASPxMenu>
                </dx:PanelContent>
            </PanelCollection>
            <ExpandBarTemplate>
                <div class="title">Orders</div>
            </ExpandBarTemplate>
        </dx:ASPxPanel>


        <dx:ASPxPanel ID="LeftPanel" runat="server" FixedPosition="WindowLeft" Collapsible="true" Theme="MaterialCompact">
            <SettingsAdaptivity CollapseAtWindowInnerWidth="900" />
            <PanelCollection>
                <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="True">
                    <dx:ASPxNavBar ID="nbMain" runat="server">
                        <Groups>
                            <dx:NavBarGroup Text="Main">
                                <Items>
                                    <dx:NavBarItem Text="Overview" NavigateUrl="javascript:void(4)"></dx:NavBarItem>
                                    <dx:NavBarItem Text="Reports" NavigateUrl="javascript:void(5)"></dx:NavBarItem>
                                    <dx:NavBarItem Text="Analitics" NavigateUrl="javascript:void(6)"></dx:NavBarItem>
                                </Items>
                            </dx:NavBarGroup>
                            <dx:NavBarGroup Text="Export">
                                <Items>
                                    <dx:NavBarItem Text="Rtf" NavigateUrl="javascript:void(7)"></dx:NavBarItem>
                                    <dx:NavBarItem Text="Xls" NavigateUrl="javascript:void(8)"></dx:NavBarItem>
                                    <dx:NavBarItem Text="Pdf" NavigateUrl="javascript:void(9)"></dx:NavBarItem>
                                </Items>
                            </dx:NavBarGroup>
                        </Groups>
                        <Paddings Padding="0px" />
                    </dx:ASPxNavBar>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxPanel>

    </form>
</body>
</html>
