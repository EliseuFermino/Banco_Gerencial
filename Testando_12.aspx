<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Testando_12.aspx.vb" Inherits="Testando_12" %>

<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <uc1:wucListaLojasComCorporacao runat="server" ID="wucListaLojasComCorporacao" />
    </div>
    </form>
</body>
</html>
