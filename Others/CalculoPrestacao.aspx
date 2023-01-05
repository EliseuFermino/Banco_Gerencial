<%@ Page Language="VB" AutoEventWireup="false" CodeFile="CalculoPrestacao.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cálculo de Prestações</title>
    <style type="text/css">
        .style1
        {
            font-size: x-large;
            font-weight: bold;
        }
        .auto-style1 {
            font-size: small;
        }
    </style>
</head>
<body alink="Controladoria">
    <form id="form1" runat="server">
    <div style="border: 2px solid gray; padding: 5px; width: 400px; border-radius: 5px">
    
        <span class="style1">Cálculo de Prestações*<br />
        </span><br />
        <asp:TextBox ID="txtAmount" runat="server"></asp:TextBox>

        <asp:Label ID="lblAmount" runat="server" Text="Valor que quero emprestar"></asp:Label>
        <br />
        <br />
        <asp:TextBox ID="txtInterest" runat="server"></asp:TextBox>

        <asp:Label ID="Interest" runat="server" Text="Taxa"></asp:Label>
        (exemplo: 2,00 ou 1,85)<br />
        <br />
        <asp:TextBox ID="txtMeses" runat="server"></asp:TextBox>

        <asp:Label ID="Label1" runat="server" Text="Quantidade de meses (exemplo: 24)"></asp:Label>
        <br />
        <br />
        <asp:TextBox ID="txtPayment" runat="server" Enabled="False"></asp:TextBox>

        <asp:Label ID="lblPayment" runat="server" Text="Valor da prestação"></asp:Label>
        <br />
        <br />
        <asp:Button ID="btnCalculate" runat="server" Text="Calcular" />
    
        <asp:Button ID="btnLimpar" runat="server" Text="Limpar" />
    
        <br />
        <br />
    
        <asp:HyperLink ID="HyperLink1" runat="server" 
            NavigateUrl="~/MemberPages/Principal.aspx">Menu Principal</asp:HyperLink>
    
   
                    
    </div>
    </form>
    <p class="auto-style1">
        <em>* Juros compostos</em></p>
</body>
</html>
