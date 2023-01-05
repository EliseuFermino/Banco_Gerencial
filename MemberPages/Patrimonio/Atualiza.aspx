<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Patrimonio/mPatrimonio.master" AutoEventWireup="false" CodeFile="Atualiza.aspx.vb" Inherits="MemberPages_Patrimonio_Atualiza" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<h2> Atualiza Clientes</h2><br />
        
        <asp:Label ID="lblID" runat="server" Font-Bold="True" Text="ID:" AssociatedControlID="txtID"></asp:Label>
        <asp:TextBox ID="txtID" runat="server" Enabled="false" ></asp:TextBox>

        <asp:Label ID="lblEAN" runat="server" Font-Bold="True" Text="EAN:" AssociatedControlID="txtEAN"></asp:Label>
        <asp:TextBox ID="txtEAN" runat="server" Enabled="false" ></asp:TextBox>

        <asp:Label ID="lblQtde" runat="server" Font-Bold="True" Text="Qtde:" AssociatedControlID="txtQtde"></asp:Label>
        <asp:TextBox ID="txtQtde" runat="server" ></asp:TextBox>

        <asp:Label ID="lblPreco" runat="server" Font-Bold="True" Text="Preço:" AssociatedControlID="txtPreco"></asp:Label>
        <asp:TextBox ID="txtPreco" runat="server" ></asp:TextBox>




        <br />

        <asp:Button ID="btnAtualiza" runat="server" onclick="btnAtualiza_Click" Text="Atualiza" UseSubmitBehavior="False" />
       
<%--        <asp:Button ID="btnCancela" runat="server" onclick="btnCancelar_Click" Text="Cancela" />
        &nbsp;&nbsp;&nbsp;

        <asp:CheckBox ID="chkDeleta" runat="server" Text="Deletar este Cliente" />
        <asp:Button ID="btnDeleta" runat="server" onclick="btnDeleta_Click" Text="Deletar" />--%>

        <br />
            <asp:Label ID="lblmsg" runat="server" style="font-weight: 700"></asp:Label>
        <br />

</asp:Content>

