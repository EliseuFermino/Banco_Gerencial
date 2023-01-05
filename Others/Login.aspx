<%@ Page Title="Log in" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Login.aspx.vb" Inherits="Account_Login" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%:Page.Title %>.</h1>
        <h2>Entre com seu usuário e senha abaixo.</h2>
    </hgroup>
    
    <section id="loginForm">
        <asp:Login ID="Login1" runat="server" ViewStateMode="Disabled" RenderOuterTable="false">
            <LayoutTemplate>
                <p class="validation-summary-errors">
                    <asp:Literal runat="server" ID="FailureText" />
                </p>
                <fieldset>
                    <legend>Log in Form</legend>
                    <ol>
                        <li>
                            <asp:Label ID="Label1" runat="server" AssociatedControlID="UserName">Usuário</asp:Label>
                            <asp:TextBox runat="server" ID="UserName" />
                        </li>
                        <li>
                            <asp:Label ID="Label2" runat="server" AssociatedControlID="Password">Senha</asp:Label>
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" />
                        </li>
                        <li>
                            <asp:CheckBox runat="server" ID="RememberMe" Visible="False" />
                            <asp:Label ID="Label3" runat="server" AssociatedControlID="RememberMe" 
                                CssClass="checkbox" Visible="False">Lembrar-me?</asp:Label>
                        </li>
                    </ol>

          
                                <asp:Button ID="Button1" runat="server" CommandName="Login" Text="Log in" />
             

                </fieldset>
            </LayoutTemplate>
        </asp:Login>

        <br />
        <br />

        <asp:Button ID="Button2" runat="server"  Text="Desbloquear Usuário" />
        Informe o Usuário para desbloquear

        <p>
            <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled" Visible="False">Registre-se</asp:HyperLink>
            <%--se você não tem uma conta.--%>
        </p>
    </section>
</asp:Content>
<asp:Content ID="Content1" runat="server" contentplaceholderid="HeadContent">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 40px;
        }
    </style>
</asp:Content>
