<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Jquery1.aspx.vb" Inherits="Jquery1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script src="Scripts/jquery.maskedinput.js"></script>

    <script type ="text/javascript" >
        jQuery(function ($)
        {

            // do  things here
            alert(jQuery('img').attr('alt'));

            $("#date1").mask("99/99/9999");

        });

    </script>

</head>
<body>
    <form id="form1" runat="server">
    <div>

        <asp:TextBox ID="date1" runat="server"></asp:TextBox>
    
    </div>
    </form>
</body>
</html>
