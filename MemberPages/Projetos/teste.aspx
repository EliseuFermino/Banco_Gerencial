<%@ Page Language="VB" AutoEventWireup="false" CodeFile="teste.aspx.vb" Inherits="MemberPages_Projetos_teste" %>

<%@ Register src="Controles/wucCadastroCad.ascx" tagname="wucCadastroCad" tagprefix="uc1" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <uc1:wucCadastroCad ID="wucCadastroCad1" runat="server" />

    </div>
    </form>
</body>
</html>
