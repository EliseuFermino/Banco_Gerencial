<%@ Page Title="Mudar Senha" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.vb" Inherits="Account_ChangePassword" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <hgroup class="title">
        <h1><%: Page.Title %>.</h1>
        <h2>Use o formulário abaixo para mudar sua senha.</h2>
    </hgroup>

    <p class="message-info">
        A nova senha deve ter no minimo <%: Membership.MinRequiredPasswordLength %> combinaçãoes de letras ou números. É necessário ter uma @.
    </p>

    <asp:ChangePassword runat="server" ID="ChangeUserPassword" CancelDestinationPageUrl="~/" EnableViewState="false" RenderOuterTable="false" SuccessPageUrl="ChangePasswordSuccess.aspx">
        <ChangePasswordTemplate>
            <p class="validation-summary-errors">
                <asp:Literal runat="server" ID="FailureText" />
            </p>
            <fieldset class="changePassword">
                <legend>Informação da Conta</legend>
                <ol>
                    <li>
                        <asp:Label runat="server" ID="CurrentPasswordLabel" AssociatedControlID="CurrentPassword">Senha Atual</asp:Label>
                        <asp:TextBox runat="server" ID="CurrentPassword" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="CurrentPassword"
                                CssClass="field-validation-error" 
                            ErrorMessage="Você precisa digitar a senha atual." />
                    </li>
                    <li>
                        <asp:Label runat="server" ID="NewPasswordLabel" AssociatedControlID="NewPassword">Nova Senha</asp:Label>
                        <asp:TextBox runat="server" ID="NewPassword" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="NewPassword"
                                CssClass="field-validation-error" 
                            ErrorMessage="Informa a nova senha" />
                    </li>
                    <li>
                        <asp:Label runat="server" ID="ConfirmNewPasswordLabel" AssociatedControlID="ConfirmNewPassword">Confirme a nova senha</asp:Label>
                        <asp:TextBox runat="server" ID="ConfirmNewPassword" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmNewPassword"
                                CssClass="field-validation-error" Display="Dynamic" 
                            ErrorMessage="Confirme novamente a nova senha" />
                        <asp:CompareValidator runat="server" ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword"
                                CssClass="field-validation-error" Display="Dynamic" 
                            ErrorMessage="As duas novas senhas que você informou estão diferentes uma da outra. Digite a senha nova novamente." />
                    </li>
                </ol>
                <asp:Button runat="server" CommandName="ChangePassword" Text="Mudar Senha" OnClick="Unnamed5_Click" />
            </fieldset>
        </ChangePasswordTemplate>
    </asp:ChangePassword>
</asp:Content>
