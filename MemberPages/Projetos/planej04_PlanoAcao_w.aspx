<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/mpPrincipal.master" AutoEventWireup="false" CodeFile="planej04_PlanoAcao_w.aspx.vb" Inherits="MemberPages_JogueMeDepois" %>

<%@ Register src="../Controles/Historico3Anos.ascx" tagname="Historico3Anos" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style4
        {
            width: 100%;
            border-collapse: collapse;
            height: 325px;
        }
        .style44
        {
            width: 927px;
        }
        .style41
        {
            width: 69px;
            color: #FFFFFF;
        }
        .style50
        {
            width: 51px;
            color: #FFFFFF;
            font-family: Arial, Helvetica, sans-serif;
            font-size: small;
        }
        .style51
        {
            width: 51px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <table cellspacing="1" class="style1">
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <table cellspacing="1" class="style1" style="width: 1134px">
            <tr>
                <td align="left" valign="top">
                    <table cellpadding="0" class="style4">
                        <tr>
                            <td class="style44">
                                <uc1:Historico3Anos ID="Historico3Anos1" runat="server" />
                            </td>
                            <td align="left" valign="top">
                                <table cellpadding="0" class="style4">
                                    <tr>
            <td class="style41" 
                style="border: 1px solid #808080; text-align: center; background-color: #009900;">
                                Meta</td>
            <td class="style50" 
                
                
                style="border: 1px solid #808080; text-align: center; background-color: #009900;">
                    <asp:Label ID="lblCrescLegenda_M1" runat="server" Text="Label" 
                    style="font-family: Arial, Helvetica, sans-serif; font-size: small"></asp:Label>
                </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
            <td class="style37" style="border: 1px solid #808080">
                    <asp:TextBox ID="txt_vlrMeta01" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; color: #0000FF;" AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style51" style="border: 1px solid #808080; padding-right: 2px;" 
                align="right">
                    <asp:TextBox ID="txt_percCresc01" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right;" AutoPostBack="True" 
                        Height="18px" ForeColor="Blue"></asp:TextBox>
                </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
            <td class="style37" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                    <asp:TextBox ID="txt_vlrMeta02" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; background-color: #CCFFCC; color: #0000FF;" 
                    AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style51" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px;" 
                align="right">
                    <asp:TextBox ID="txt_percCresc02" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right; background-color: #CCFFCC;" 
                    AutoPostBack="True" ForeColor="Blue"></asp:TextBox>
                </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
            <td class="style37" style="border: 1px solid #808080">
                    <asp:TextBox ID="txt_vlrMeta03" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; color: #0000FF;" AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style51" style="border: 1px solid #808080; padding-right: 2px;" 
                align="right">
                    <asp:TextBox ID="txt_percCresc03" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right;" AutoPostBack="True" ForeColor="Blue"></asp:TextBox>
                </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
            <td class="style37" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                    <asp:TextBox ID="txt_vlrMeta04" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; background-color: #CCFFCC; color: #0000FF;" 
                    AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style51" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px;" 
                align="right">
                    <asp:TextBox ID="txt_percCresc04" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right; background-color: #CCFFCC;" 
                    AutoPostBack="True" ForeColor="Blue"></asp:TextBox>
                </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
            <td class="style37" style="border: 1px solid #808080">
                    <asp:TextBox ID="txt_vlrMeta05" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; color: #0000FF;" AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style51" style="border: 1px solid #808080; padding-right: 2px;" 
                align="right">
                    <asp:TextBox ID="txt_percCresc05" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right;" AutoPostBack="True" ForeColor="Blue"></asp:TextBox>
                </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
            <td class="style37" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                    <asp:TextBox ID="txt_vlrMeta06" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; background-color: #CCFFCC; color: #0000FF;" 
                    AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style51" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px;" 
                align="right">
                    <asp:TextBox ID="txt_percCresc06" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right; background-color: #CCFFCC;" 
                    AutoPostBack="True" ForeColor="Blue"></asp:TextBox>
                </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
            <td class="style37" style="border: 1px solid #808080">
                    <asp:TextBox ID="txt_vlrMeta07" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; color: #0000FF;" AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style51" style="border: 1px solid #808080; padding-right: 2px;" 
                align="right">
                    <asp:TextBox ID="txt_percCresc07" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right;" AutoPostBack="True" ForeColor="Blue"></asp:TextBox>
                </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
            <td class="style37" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                    <asp:TextBox ID="txt_vlrMeta08" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; background-color: #CCFFCC; color: #0000FF;" 
                    AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style51" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px;" 
                align="right">
                    <asp:TextBox ID="txt_percCresc08" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right; background-color: #CCFFCC;" 
                    AutoPostBack="True" ForeColor="Blue"></asp:TextBox>
                </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
            <td class="style37" style="border: 1px solid #808080">
                    <asp:TextBox ID="txt_vlrMeta09" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; color: #0000FF;" AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style51" style="border: 1px solid #808080; padding-right: 2px;" 
                align="right">
                    <asp:TextBox ID="txt_percCresc09" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right;" AutoPostBack="True" ForeColor="Blue"></asp:TextBox>
                </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
            <td class="style37" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                    <asp:TextBox ID="txt_vlrMeta10" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; background-color: #CCFFCC; color: #0000FF;" 
                    AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style51" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px;" 
                align="right">
                    <asp:TextBox ID="txt_percCresc10" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right; background-color: #CCFFCC;" 
                    AutoPostBack="True" ForeColor="Blue"></asp:TextBox>
                </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
            <td class="style37" style="border: 1px solid #808080">
                    <asp:TextBox ID="txt_vlrMeta11" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; color: #0000FF;" AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style51" style="border: 1px solid #808080; padding-right: 2px;" 
                align="right">
                    <asp:TextBox ID="txt_percCresc11" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right;" AutoPostBack="True" ForeColor="Blue"></asp:TextBox>
                </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
            <td class="style37" 
                style="border: 1px solid #808080; background-color: #CCFFCC;">
                    <asp:TextBox ID="txt_vlrMeta12" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="65px" 
                        style="text-align:right; background-color: #CCFFCC; color: #0000FF;" 
                    AutoPostBack="True"></asp:TextBox>
                </td>
            <td class="style51" 
                
                style="border: 1px solid #808080; background-color: #CCFFCC; padding-right: 2px;" 
                align="right">
                    <asp:TextBox ID="txt_percCresc12" runat="server" onfocus="this.select();" 
                        BorderStyle="None" Width="50px" 
                        style="text-align:right; background-color: #CCFFCC;" 
                    AutoPostBack="True" ForeColor="Blue"></asp:TextBox>
                </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                    <tr>
            <td class="style37" 
                style="border: 1px solid #808080; background-color: #CCCCCC;">
                    <asp:TextBox ID="txt_vlrMetaTotal" runat="server" BackColor="#CCCCCC" 
                        BorderStyle="None" style="text-align:right; color: #0000FF;" Width="65px" 
                    ReadOnly="True" ></asp:TextBox>
                </td>
            <td class="style51" 
                
                style="border: 1px solid #808080; background-color: #CCCCCC; padding-right: 2px;" 
                align="right">
                    <asp:Label ID="lblCrescAno" runat="server" Text="Label" 
                        
                        style="font-family: Arial, Helvetica, sans-serif; font-size: small; " 
                        ForeColor="Blue"></asp:Label>
                </td>
                                        <td>
                                            &nbsp;</td>
                                        <td>
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table cellspacing="1" class="style1">
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
        <br />
    </p>
</asp:Content>

