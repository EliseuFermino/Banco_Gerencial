<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucAguarde.ascx.vb" Inherits="Controles_wucAguarde" %>
<asp:UpdateProgress ID="UpdateProgress1" runat="server">
    <ProgressTemplate>
        Aguarde...
        <asp:Image ID="Image1" runat="server" ImageUrl="~/image/update.gif" />
    </ProgressTemplate>
</asp:UpdateProgress>
