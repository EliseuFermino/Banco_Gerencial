<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wucBotaoAtualizar.ascx.vb" Inherits="Controles_wucBotaoAtualizar" %>


<style type="text/css">
    .auto-style1 {
        width: 80px;
        float: left;
    }
    .auto-style3 {
        width: 70px;
        vertical-align:central;
    }
    </style>
<table align="left" cellspacing="1" class="auto-style1">
    <tr>
        <td>
            <asp:Button ID="ASPxButton1" runat="server" Text="Atualizar" />
        </td>
        <td class="auto-style3">
            <asp:UpdateProgress ID="UpdateProgress1" runat="server">
                <ProgressTemplate>
                    <asp:Image ID="Image1" runat="server" ImageUrl="~/image/UpdateProgress.gif" />
                </ProgressTemplate>
            </asp:UpdateProgress>
        </td>
    </tr>
</table>




