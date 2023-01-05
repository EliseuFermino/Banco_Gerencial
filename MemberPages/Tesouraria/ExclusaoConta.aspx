<%@ Page Title="Excluir Cadastro" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="ExclusaoConta.aspx.vb" Inherits="Tesouraria_ExclusaoConta" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/MemberPages/Tesouraria/Controles/wucCPF_Tesouraria.ascx" TagPrefix="uc1" TagName="wucCPF_Tesouraria" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

   

        <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style12 {
            width: 457px;
        }
        .auto-style16 {
            height: 35px;
        }
        .auto-style18 {
            width: 457px;
            height: 39px;
        }
        .auto-style19 {
            height: 39px;
        }
            .auto-style20 {
                height: 39px;
                }
            
        .watermarked {
            color:GrayText
        }

            .auto-style22 {
                width: 319px;
            }

            .auto-style23 {
                width: 278px;
            }
            .auto-style24 {
                height: 39px;
                width: 110px;
            }
            .auto-style25 {
                width: 110px;
            }

    </style>

    
    




</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

   
    <div>    
        <table cellspacing="1" class="auto-style1">
            <tr>
                <td class="auto-style16" colspan="4" style="border-bottom-style: solid; border-bottom-width: 2px; border-bottom-color: #808080; center-align: top;">
                    
                    <table class="dxflInternalEditorTable_Office2010Silver">
                        <tr>
                            <td class="auto-style22">
                                <uc1:wucListaLojasComCorporacao runat="server" id="cboFilial" />
                            </td>
                            <td class="auto-style23">
                                <uc1:wucCPF_Tesouraria runat="server" id="cboCPF" />
                            </td>
                            <td>
                                <asp:Button ID="btnSalvar" runat="server" Text="Excluir" Width="150px" />
                            </td>
                        </tr>
                    </table>
                    
                </td>
            </tr>  <%--Cta. Destino Banco--%>
            <tr>
                <td class="auto-style20" colspan="4" style="vertical-align: top">
                    &nbsp;</td>
            </tr>  
            <tr>
                <td class="auto-style24">Nome Completo:</td>
                <td class="auto-style18">
                    <asp:TextBox ID="txtNomeCompleto" runat="server" Width="442px" TextMode="SingleLine" placeholder="Informe o nome igual ao do RG." TabIndex="50" ></asp:TextBox>
                </td>
                <td class="auto-style19">
                    &nbsp;</td>
                <td class="auto-style19"></td>
            </tr>  <%--Cta. Destino Agencia--%>
            <tr>
                <td class="auto-style25">Matricula:</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtMatricula" runat="server" Width="250px" placeholder="Número da Matricula do Funcionário" MaxLength="8" TabIndex="51" ></asp:TextBox>
                </td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>  
            <tr>
                <td class="auto-style25">CPF:</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtCPF" runat="server" Width="250px" placeholder="Digite apenas números (regra 11 digitos)" MaxLength="11" TabIndex="52" ClientIDMode="Static" ></asp:TextBox>
                </td>
                <td>
&nbsp;</td>
                <td>&nbsp;</td>
            </tr>  <%--Cta. Destino DV--%>
            </table>
    
    </div>
    


</asp:Content>
