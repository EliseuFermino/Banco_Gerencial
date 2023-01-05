<%@ Page Language="VB" AutoEventWireup="false" CodeFile="_Teste.aspx.vb" Inherits="_Teste" %>

<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div>
        <uc1:wucListaDiaIniFin runat="server" ID="wucListaDiaIniFin" />
    </div>
    </form>
</body>
</html>
