<%@ Page Language="VB" AutoEventWireup="false" CodeFile="_Page_Teste.aspx.vb" Inherits="MemberPages_Page_Teste" %>

<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <uc1:wucListaDiaIniFin runat="server" ID="wucListaDiaIniFin" /> 
    </div>
    </form>
</body>
</html>
