<%@ Page Language="VB" AutoEventWireup="false" CodeFile="DataValidade.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">



<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Cálculo de Data de Recebimento</title>
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
        <asp:scriptmanager ID="Scriptmanager1" runat="server"></asp:scriptmanager>
    <div style="border: 2px solid gray; padding: 5px; width: 500px; border-radius: 5px">
    
        <span class="style1">Cálculo de Data de Recebimento<br />
        </span><br />  

        <asp:Label ID="lblEmissao" runat="server" Text="Informe a Data de Emissão: " AssociatedControlID="txtEmissao" ></asp:Label>
        <asp:TextBox ID="txtEmissao" TextMode="Date"  runat="server" Width="130px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="requiredEmissao" runat="server" ErrorMessage="Informe a Data de Emissão" ForeColor="Red" ControlToValidate="txtEmissao" SetFocusOnError="true" ></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="cv_Emissao" Type="Date" Operator="DataTypeCheck" ControlToValidate="txtEmissao" runat="server" ErrorMessage="Informe uma Data Valida. Ex: 25/10/2015" ForeColor="Red" ></asp:CompareValidator>

        <br />

        <asp:Label ID="lblDataVencimento" runat="server" AssociatedControlID="txtDataVencimento"   Text="Data de Vencimento do Produto"></asp:Label>

        <asp:TextBox ID="txtDataVencimento" TextMode="Date" runat="server" Width="125px"></asp:TextBox>
        <asp:RequiredFieldValidator ID="requiredVencimento" runat="server" ErrorMessage="Informe a Data de Vencimento" ForeColor="Red" ControlToValidate="txtDataVencimento" SetFocusOnError="true" ></asp:RequiredFieldValidator>
        <asp:CompareValidator ID="cv_Date" Type="Date" Operator="DataTypeCheck" ControlToValidate="txtDataVencimento" runat="server" ErrorMessage="Informe uma Data Valida. Ex: 25/10/2015" ForeColor="Red" ></asp:CompareValidator>
     
        
        <br />
        

        <asp:Label ID="lblPrazoMaximo" runat="server" Text="" ForeColor="Red" Font-Size="X-Large" Font-Bold="true"></asp:Label>
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
   
</body>
</html>
