<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucAguardeRoda.ascx.vb" Inherits="Controles_wucAguardeRoda" %>
<asp:UpdateProgress ID="UpdateProgress1" runat="server">
    <ProgressTemplate>
        Aguarde...
        <asp:Image ID="Image1" runat="server" ImageUrl="~/image/updateCirculo.gif" 
            Height="24px" Width="24px" />
    </ProgressTemplate>
</asp:UpdateProgress>
