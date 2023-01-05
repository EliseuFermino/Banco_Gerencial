<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default_Teste.aspx.vb" Inherits="MemberPages_Default_Teste" %>

<%@ Register Src="~/Controles/wucListaComprador.ascx" TagPrefix="uc1" TagName="wucListaComprador" %>
<%@ Register Src="~/Controles/wuciListaMesPeriodo.ascx" TagPrefix="uc1" TagName="wuciListaMesPeriodo" %>








<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
   
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <div class="container-fluid ">
            <div class="row">
                <uc1:wuciListaMesPeriodo runat="server" ID="wuciListaMesPeriodo" />
            </div>
        </div>

    <div>
        
        
    </div>
    </form>
</body>
</html>
