<%@ Page Language="VB" AutoEventWireup="false" CodeFile="work_Convidado.aspx.vb" Inherits="MemberPages_Marketing_work_Convidado" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Convidado</title>

    <script src="Scripts/jquery-1.10.2.min.js"></script>
    <script src="Scripts/jquery.maskedinput.js"></script>

     <script type ="text/javascript" >
         jQuery(function ($)
         {

             $("#txtDataNascimento").mask("99/99/9999");
             $("#txtCPF").mask("99.999.999/9999-99");
             $("#txtDOC").mask("99/99/9999");
             $("#txtDataAdmissao").mask("99/99/9999");
             $("#txtTelefone").mask("(999) 9999-9999");
         });

    </script>

    <style type="text/css">
        .auto-style1 {
            width: 79%;
        }
        .auto-style2 {
            width: 169px;
        }
        .auto-style3 {
        }
        .auto-style4 {
            width: 64px;
        }

        #divCNPJ {
            border: 2px solid gray;
            width: 620px;
            border-radius: 5px;
            padding: 3px;
        }

    </style>

</head>
<body>
    <form id="form1" runat="server">

    <div id="divDistribuidor">
    </div>



    <div id="divCNPJ">
        <table class="auto-style1">
            <tr>
                <td class="auto-style3" colspan="2">Distribuidor</td>
                <td colspan="4">
                    <dx:ASPxComboBox ID="cboDistribuidor" runat="server" DataSourceID="dsDistribuidor" Font-Size="Medium" TextField="nomeDistribuidor" Theme="Default" ValueField="idDistribuidor" Width="400px"></dx:ASPxComboBox>
                    <asp:SqlDataSource ID="dsDistribuidor" runat="server" ConnectionString="<%$ ConnectionStrings:LOCAL_gerMarketingConnectionString %>" SelectCommand="uspListaDistribuidor" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                </td>
                <td>&nbsp;</td>
            </tr>
             <tr>
                <td class="auto-style3" colspan="2">CGC:</td>
                <td class="auto-style12" colspan="4">
                    <asp:TextBox ID="txtCPF" runat="server" Width="250px" placeholder="Digite apenas números (regra 14 digitos)" MaxLength="11" TabIndex="1" ClientIDMode="Static" Font-Size="Small" ></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_CPF" runat="server" ControlToValidate="txtCPF" ErrorMessage="'CGC' é obrigatório" Font-Bold="True" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2">Empresa: </td>
                <td colspan="4">
                    <asp:Label ID="lblEmpresa" runat="server" Font-Size="X-Large" ForeColor="#666666" TabIndex="10"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2">Convidado: </td>
                <td colspan="4">
                    <asp:TextBox ID="txtConvidado" runat="server" Width="500px" Font-Size="XX-Large" TabIndex="2"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Convidado" runat="server" ControlToValidate="txtConvidado" ErrorMessage="'Convidado' é obrigatório" Font-Bold="True" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3" colspan="2">Acompanhante:</td>
                <td colspan="2">
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style4">
                                <dx:ASPxRadioButton ID="rnd_nao" runat="server" Checked="True" GroupName="SimNao" Text="Não" TabIndex="3">
                                </dx:ASPxRadioButton>
                            </td>
                            <td>
                                <dx:ASPxRadioButton ID="rnd_Sim" runat="server" GroupName="SimNao" Text="Sim" TabIndex="4">
                                </dx:ASPxRadioButton>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="auto-style2" colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style3" colspan="2" style="text-align: center">
                                <asp:Button ID="btnNovo" runat="server" Text="Novo" Width="100px" TabIndex="5" style="text-align: center" />
                            </td>
                <td class="auto-style3" colspan="2" style="text-align: center">
                                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" Width="100px" style="height: 26px" TabIndex="6" />
                            </td>
                <td class="auto-style3" style="text-align: center">
                                <asp:Button ID="btnSalvar" runat="server" Text="Salvar" Width="100px" TabIndex="7" />
                            </td>
            </tr>
        </table>
    </div>
        
    </form>
</body>
</html>
