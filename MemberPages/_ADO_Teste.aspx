<%@ Page Language="VB" AutoEventWireup="false" CodeFile="_ADO_Teste.aspx.vb" Inherits="MemberPages_ADO_Teste" %>

<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxScheduler.Controls" TagPrefix="dxwschsc" %>

<%@ Register Assembly="DevExpress.Web.ASPxScheduler.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxScheduler" TagPrefix="dxwschs" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dxwschs:ASPxDateNavigator ID="ASPxDateNavigator1" runat="server"></dxwschs:ASPxDateNavigator>
        <br />
        <dxwschs:ASPxTimeZoneEdit ID="ASPxTimeZoneEdit1" runat="server"></dxwschs:ASPxTimeZoneEdit>
        <br />
        <dxwschsc:WeekDaysEdit ID="WeekDaysEdit1" runat="server"></dxwschsc:WeekDaysEdit>
        <br />
        <dxwschsc:MonthEdit ID="MonthEdit1" runat="server"></dxwschsc:MonthEdit>
        <br />
        <dxwschsc:WeekOfMonthEdit ID="WeekOfMonthEdit1" runat="server"></dxwschsc:WeekOfMonthEdit>
        <br />
        <dxwschsc:WeekDaysCheckEdit ID="WeekDaysCheckEdit1" runat="server"></dxwschsc:WeekDaysCheckEdit>
        <br />
        <dx:ASPxTimeEdit ID="ASPxTimeEdit1" runat="server"></dx:ASPxTimeEdit>
        <br />
    </div>
    </form>
</body>
</html>
