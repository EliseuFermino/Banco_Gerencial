<%@ Page Title="Cadastro" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="CadastroConta.aspx.vb" Inherits="Tesouraria_CadastroConta" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <script src="../../Scripts/jquery-1.10.2.min.js"></script>
    <script src="../../Scripts/jquery.maskedinput.js"></script>

     <script type ="text/javascript" >
         jQuery(function ($)
         {

             $("#txtDataNascimento").mask("99/99/9999");
             $("#txtCPF").mask("999.999.999-99");
             $("#txtDOC").mask("99/99/9999");
             $("#txtDataAdmissao").mask("99/99/9999");
             $("#txtTelefone").mask("(999) 9999-9999");
         });

    </script>

        <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 22px;
        }
        .auto-style4 {
        }
        .auto-style5 {
            height: 22px;
            width: 177px;
        }
        .auto-style7 {
                width: 177px;
                height: 25px;
            }
        .auto-style8 {
            height: 25px;
        }
        .auto-style11 {
            width: 130px;
        }
        .auto-style12 {
            width: 457px;
        }
        .auto-style13 {
            height: 25px;
            width: 457px;
        }
        .auto-style14 {
            height: 22px;
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
            .auto-style21 {
                width: 177px;
            }

        .watermarked {
            color:GrayText
        }

    </style>

    
    




</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

   
    <div>    
        <table cellspacing="1" class="auto-style1">
            <tr>
                <td class="auto-style16" colspan="4" style="border-bottom-style: solid; border-bottom-width: 2px; border-bottom-color: #808080; center-align: top;">
                    <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
                </td>
            </tr>  <%--Renda--%>
            <tr>
                <td class="auto-style20" colspan="4" style="vertical-align: top">
                    <asp:ValidationSummary ID="vs" runat="server" ForeColor="Red" TabIndex="999" />
                </td>
            </tr>  
            <tr>
                <td class="auto-style20">Nome Completo:</td>
                <td class="auto-style18">
                    <asp:TextBox ID="txtNomeCompleto" runat="server" Width="442px" TextMode="SingleLine" placeholder="Informe o nome igual ao do RG." TabIndex="50" ></asp:TextBox>
                </td>
                <td class="auto-style19">
                    <asp:RequiredFieldValidator ID="rfv_NomeCompleto" runat="server" ControlToValidate="txtNomeCompleto" ErrorMessage="'Nome Completo' é obrigatório." Font-Bold="True" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
                <td class="auto-style19"></td>
            </tr>  <%--Cta. Destino Banco--%>
            <tr>
                <td class="auto-style21">Matricula:</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtMatricula" runat="server" Width="250px" placeholder="Número da Matricula do Funcionário" MaxLength="8" TabIndex="51" ></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Matricula" runat="server" ControlToValidate="txtMatricula" ErrorMessage="'Matricula' é obrigatório" Font-Bold="True" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>  
            <tr>
                <td class="auto-style21">CPF:</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtCPF" runat="server" Width="250px" placeholder="Digite apenas números (regra 11 digitos)" MaxLength="11" TabIndex="52" ClientIDMode="Static" ></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_CPF" runat="server" ControlToValidate="txtCPF" ErrorMessage="'CPF' é obrigatório" Font-Bold="True" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
&nbsp;</td>
                <td>&nbsp;</td>
            </tr>  <%--Cta. Destino Agencia--%>
            <tr>
                <td class="auto-style7">PIS</td>
                <td class="auto-style13">
                    <asp:TextBox ID="txtPIS" runat="server" Width="175px" Enabled="false" TabIndex="53"></asp:TextBox>
                </td>
                <td class="auto-style8"></td>
                <td class="auto-style8"></td>
            </tr>  <%--Cta. Destino DV--%>
            <tr>
                <td class="auto-style21">Carteira de Trabalho<br />
                    com Serie:</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtCarteiraDeTrabalho" runat="server" Width="175px" Enabled="false" TabIndex="54"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>  <%--Grau de Instrução--%>
            <tr>
                <td class="auto-style21">Data de Nascimento:</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtDataNascimento" runat="server"  Width="140px" TabIndex="55" ClientIDMode="Static"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_DataDeNascimento" runat="server" ControlToValidate="txtDataNascimento" ErrorMessage="'Data de Nascimento' é obrigatório." Font-Bold="True" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>  <%--Renda--%>
            <tr>
                <td class="auto-style21">Local de Nascimento:</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtLocalNascimento" runat="server" Width="231px" TabIndex="56"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_LocalNascimento" runat="server" ControlToValidate="txtLocalNascimento" ErrorMessage="'Local de Nascimento' é obrigatório." Font-Bold="True" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>  <%--Cta. Destino Banco--%>
            <tr>
                <td class="auto-style21">UF de Nascimento:</td>
                <td class="auto-style12">
                    <asp:DropDownList ID="cboUFNascimento" runat="server" TabIndex="57">
                        <asp:ListItem Value="1">AC</asp:ListItem>
                        <asp:ListItem Value="2">AL</asp:ListItem>
                        <asp:ListItem Value="3">AP</asp:ListItem>
                        <asp:ListItem Value="4">AM</asp:ListItem>
                        <asp:ListItem Value="5">BA</asp:ListItem>
                        <asp:ListItem Value="6">CE</asp:ListItem>
                        <asp:ListItem Value="7">DF</asp:ListItem>
                        <asp:ListItem Value="8">ES</asp:ListItem> 
                        <asp:ListItem Value="9">GO</asp:ListItem>
                        <asp:ListItem Value="10">MA</asp:ListItem>
                        <asp:ListItem Value="11">MT</asp:ListItem>
                        <asp:ListItem Value="12">MS</asp:ListItem>
                        <asp:ListItem Value="13">MG</asp:ListItem>
                        <asp:ListItem Value="14">PA</asp:ListItem>
                        <asp:ListItem Value="15">PB</asp:ListItem>
                        <asp:ListItem Value="16">PR</asp:ListItem>
                        <asp:ListItem Value="17">PE</asp:ListItem>
                        <asp:ListItem Value="18">PI</asp:ListItem>
                        <asp:ListItem Value="19">RJ</asp:ListItem>
                        <asp:ListItem Value="20">RN</asp:ListItem>
                        <asp:ListItem Value="21">RS</asp:ListItem>
                        <asp:ListItem Value="22">RO</asp:ListItem>
                        <asp:ListItem Value="23">RR</asp:ListItem>
                        <asp:ListItem Value="24">SC</asp:ListItem>
                        <asp:ListItem Value="25">SP</asp:ListItem>
                        <asp:ListItem Value="26">SE</asp:ListItem>
                        <asp:ListItem Value="27">TO</asp:ListItem>
                        
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>  <%--Cta. Destino Agencia--%>
            <tr>
                <td class="auto-style21">Estado Civil:</td>
                <td class="auto-style12">
                    <asp:DropDownList ID="cboEstadoCivil" runat="server" AutoPostBack="True" DataSourceID="dsEstadoCivil" DataTextField="descEstadoCivil" DataValueField="idEstadoCivil" TabIndex="58">
                        <asp:ListItem Value="1">Solteiro</asp:ListItem>
                        <asp:ListItem Value="2">Casado c/ comunhão de bens</asp:ListItem>
                        <asp:ListItem Value="3">Casado c/ comunhão parcial</asp:ListItem>
                        <asp:ListItem Value="4">Casado c/ separação de bens</asp:ListItem>
                        <asp:ListItem Value="5">Divorciado (a)</asp:ListItem>
                        <asp:ListItem Value="6">Separado (a)</asp:ListItem>
                        <asp:ListItem Value="7">Viúvo (a)</asp:ListItem>
                        <asp:ListItem Value="8">Ignorado</asp:ListItem>                        
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:SqlDataSource ID="dsEstadoCivil" runat="server" ConnectionString="<%$ ConnectionStrings:gerCadastrosConnectionString %>" SelectCommand="SELECT [idEstadoCivil], [descEstadoCivil] FROM [tblCadEstadoCivil]"></asp:SqlDataSource>
                </td>
                <td>&nbsp;</td>
            </tr>  <%--Cta. Destino DV--%>
            <tr>
                <td class="auto-style21">Nome do Conjugê:</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtNomeDoConjuge" runat="server" Width="400px" Enabled="False" TabIndex="59"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_NomeConjuge" runat="server" ControlToValidate="txtNomeDoConjuge" ErrorMessage="'Nome do Conjugê' é obrigatório." Font-Bold="True" ForeColor="Red" SetFocusOnError="True" Enabled="False">*</asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>  <%--Grau de Instrução--%>
            <tr>
                <td class="auto-style21">Nome do Pai:</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtNomeDoPai" runat="server" Width="400px" placeholder="Nome igual ao RG do funcionário" TabIndex="60"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>  <%--Renda--%>
            <tr>
                <td class="auto-style21">Nome da Mãe:</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtNomeDaMae" runat="server" Width="400px" placeholder="Nome igual ao RG do funcionário" TabIndex="61"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_NomeDaMae" runat="server" ControlToValidate="txtNomeDaMae" ErrorMessage="'Nome da Mãe' é obrigatório." Font-Bold="True" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>  <%--Cta. Destino Banco--%>
            <tr>
                <td class="auto-style21">Sexo:</td>
                <td class="auto-style12">
                    <asp:DropDownList ID="cboSexo" runat="server" TabIndex="62">
                        <asp:ListItem Value="1">Feminino</asp:ListItem>
                        <asp:ListItem Value="2">Masculino</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>  <%--Cta. Destino Agencia--%>
            <tr>
                <td class="auto-style21">Número do <b>RG</b>/CNH/CTPS:</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtNumeroRG" runat="server" Width="143px" TabIndex="63"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_NumeroRG" runat="server" ControlToValidate="txtNumeroRG" ErrorMessage="'Número do RG' é obrigatório." Font-Bold="True" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>  <%--Cta. Destino DV--%>
            <tr>
                <td class="auto-style21">Orgão Emissor do <b>RG</b>/CNH/CTPS:</td>
                <td class="auto-style12">
                   
                   <asp:DropDownList ID="txtOrgaoEmissorRG" runat="server" TabIndex="64">
                        <asp:ListItem Value="1">SSP (RG)</asp:ListItem>
                        <asp:ListItem Value="2">CONTRAN (CNH)</asp:ListItem>
                        <asp:ListItem Value="3">Outros (CTPS)</asp:ListItem>                        
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>  <%--Grau de Instrução--%>
            <tr>
                <td class="auto-style21">UF do <b>RG</b>/CNH/CTPS:</td>
                <td class="auto-style12">
                    <asp:DropDownList ID="cboUF_RG" runat="server" TabIndex="65">
                        <asp:ListItem Value="1">AC</asp:ListItem>
                        <asp:ListItem Value="2">AL</asp:ListItem>
                        <asp:ListItem Value="3">AP</asp:ListItem>
                        <asp:ListItem Value="4">AM</asp:ListItem>
                        <asp:ListItem Value="5">BA</asp:ListItem>
                        <asp:ListItem Value="6">CE</asp:ListItem>
                        <asp:ListItem Value="7">DF</asp:ListItem>
                        <asp:ListItem Value="8">ES</asp:ListItem> 
                        <asp:ListItem Value="9">GO</asp:ListItem>
                        <asp:ListItem Value="10">MA</asp:ListItem>
                        <asp:ListItem Value="11">MT</asp:ListItem>
                        <asp:ListItem Value="12">MS</asp:ListItem>
                        <asp:ListItem Value="13">MG</asp:ListItem>
                        <asp:ListItem Value="14">PA</asp:ListItem>
                        <asp:ListItem Value="15">PB</asp:ListItem>
                        <asp:ListItem Value="16">PR</asp:ListItem>
                        <asp:ListItem Value="17">PE</asp:ListItem>
                        <asp:ListItem Value="18">PI</asp:ListItem>
                        <asp:ListItem Value="19">RJ</asp:ListItem>
                        <asp:ListItem Value="20">RN</asp:ListItem>
                        <asp:ListItem Value="21">RS</asp:ListItem>
                        <asp:ListItem Value="22">RO</asp:ListItem>
                        <asp:ListItem Value="23">RR</asp:ListItem>
                        <asp:ListItem Value="24">SC</asp:ListItem>
                        <asp:ListItem Value="25">SP</asp:ListItem>
                        <asp:ListItem Value="26">SE</asp:ListItem>
                        <asp:ListItem Value="27">TO</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>  <%--Renda--%>
            <tr>
                <td class="auto-style21">DOC (Data de Emissão):</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtDOC" runat="server" Width="140px" TabIndex="66" ClientIDMode ="Static" ></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_10" runat="server" ControlToValidate="txtDOC" ErrorMessage="'DOC - Data de Emissão' é obrigatório." Font-Bold="True" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>  <%--Cta. Destino Banco--%>
            <tr>
                <td class="auto-style21">Ocupação:</td>
                <td class="auto-style12">
                    <asp:DropDownList ID="cboOcupacao" runat="server" Width="300px" DataSourceID="dsOcupacao" DataTextField="descOcupacao" DataValueField="idOcupacao" TabIndex="67">
                        
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:SqlDataSource ID="dsOcupacao" runat="server" ConnectionString="<%$ ConnectionStrings:gerCadastrosConnectionString %>" SelectCommand="SELECT [idOcupacao], [descOcupacao] FROM [tblCadOcupacao]"></asp:SqlDataSource>
                </td>
                <td>&nbsp;</td>
            </tr>  <%--Cta. Destino Agencia--%>
            <tr>
                <td class="auto-style21">Data de Admissão:</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtDataAdmissao" runat="server" Width="140px" TabIndex="68" ClientIDMode ="Static" ></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_DataAdmissao" runat="server" ControlToValidate="txtDataAdmissao" ErrorMessage="'Data de Admissão' é obrigatório." Font-Bold="True" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>  <%--Cta. Destino DV--%>
            <tr>
                <td class="auto-style21">Endereço (Rua/Avenida):</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtEndereco" runat="server" Width="400px" TabIndex="69"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Endereco" runat="server" ControlToValidate="txtEndereco" ErrorMessage="'Endereço' é obrigatório." Font-Bold="True" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>  <%--Grau de Instrução--%>
            <tr>
                <td class="auto-style21">Número:</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtNumero" runat="server" Width="90px" TabIndex="70"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Numero" runat="server" ControlToValidate="txtNumero" ErrorMessage="'Número' é obrigatório." Font-Bold="True" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>  <%--Renda--%>
            <tr>
                <td class="auto-style21">Complemento:</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtComplemento" runat="server" Width="300px"  TabIndex="71"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>  <%--Cta. Destino Banco--%>
            <tr>
                <td class="auto-style21">Bairro:</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtBairro" runat="server" Width="229px"  TabIndex="72"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Bairro" runat="server" ControlToValidate="txtBairro" ErrorMessage="'Bairro' é obrigatório." Font-Bold="True" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>  <%--Cta. Destino Agencia--%>
            <tr>
                <td class="auto-style21">Cidade:</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtCidade" runat="server" Width="228px"  TabIndex="73"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Cidade" runat="server" ControlToValidate="txtCidade" ErrorMessage="'Cidade' é obrigatório." Font-Bold="True" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>  <%--Cta. Destino DV--%>
            <tr>
                <td class="auto-style21">UF:</td>
                <td class="auto-style12">
                    <asp:DropDownList ID="cboUF" runat="server" TabIndex="74">
                        <asp:ListItem Value="1">AC</asp:ListItem>
                        <asp:ListItem Value="2">AL</asp:ListItem>
                        <asp:ListItem Value="3">AP</asp:ListItem>
                        <asp:ListItem Value="4">AM</asp:ListItem>
                        <asp:ListItem Value="5">BA</asp:ListItem>
                        <asp:ListItem Value="6">CE</asp:ListItem>
                        <asp:ListItem Value="7">DF</asp:ListItem>
                        <asp:ListItem Value="8">ES</asp:ListItem> 
                        <asp:ListItem Value="9">GO</asp:ListItem>
                        <asp:ListItem Value="10">MA</asp:ListItem>
                        <asp:ListItem Value="11">MT</asp:ListItem>
                        <asp:ListItem Value="12">MS</asp:ListItem>
                        <asp:ListItem Value="13">MG</asp:ListItem>
                        <asp:ListItem Value="14">PA</asp:ListItem>
                        <asp:ListItem Value="15">PB</asp:ListItem>
                        <asp:ListItem Value="16">PR</asp:ListItem>
                        <asp:ListItem Value="17">PE</asp:ListItem>
                        <asp:ListItem Value="18">PI</asp:ListItem>
                        <asp:ListItem Value="19">RJ</asp:ListItem>
                        <asp:ListItem Value="20">RN</asp:ListItem>
                        <asp:ListItem Value="21">RS</asp:ListItem>
                        <asp:ListItem Value="22">RO</asp:ListItem>
                        <asp:ListItem Value="23">RR</asp:ListItem>
                        <asp:ListItem Value="24">SC</asp:ListItem>
                        <asp:ListItem Value="25">SP</asp:ListItem>
                        <asp:ListItem Value="26">SE</asp:ListItem>
                        <asp:ListItem Value="27">TO</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>  <%--Grau de Instrução--%>
            <tr>
                <td class="auto-style7">CEP:</td>
                <td class="auto-style13">
                    <dx:ASPxTextBox ID="txtCEP" runat="server" HorizontalAlign="Center" MaxLength="10" Native="True" Width="90px" TabIndex="75">
                        <MaskSettings Mask="00000-000" ShowHints="True" />
                    </dx:ASPxTextBox>
                </td>
                <td class="auto-style8">
                    <asp:RequiredFieldValidator ID="rfv_CEP" runat="server" ControlToValidate="txtCEP" ErrorMessage="'CEP' é obrigatório." Font-Bold="True" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                &nbsp;&nbsp;&nbsp;
                </td>
                <td class="auto-style8"></td>
            </tr>  <%--Renda--%>

            <tr>
                <td class="auto-style21">Telefone:</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtTelefone" runat="server" Width="120px" ClientIDMode="Static" TabIndex="77"></asp:TextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Telefone" runat="server" ControlToValidate="txtTelefone" ErrorMessage="'Telefone' é obrigatório" Font-Bold="True" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>  <%--Cta. Destino Agencia--%>
            <tr>
                <td class="auto-style21">E-mail:</td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtEmail" runat="server" Width="403px" TabIndex="78"></asp:TextBox>
                </td>
                <td>
&nbsp;</td>
                <td>&nbsp;</td>
            </tr>  <%--Cta. Destino DV--%>
            <tr>
                <td class="auto-style21">Grau de Instrução:</td>
                <td class="auto-style12">
                    <asp:DropDownList ID="cboGrauDeInstrucao" runat="server" DataSourceID="dsInstrucao" DataTextField="descEscolaridade" DataValueField="idEscolaridade" TabIndex="79">
                        <asp:ListItem Value="0">Ignorado</asp:ListItem>
                        <asp:ListItem Value="1">1º Grau Incompleto</asp:ListItem>
                        <asp:ListItem Value="2">1º Grau Completo</asp:ListItem>
                        <asp:ListItem Value="3">2º Grau Incompleto</asp:ListItem>
                        <asp:ListItem Value="4">2º Grau Completo</asp:ListItem>
                        <asp:ListItem Value="5">3º Grau Incompleto</asp:ListItem>
                        <asp:ListItem Value="6">3º Grau Completo</asp:ListItem>
                        <asp:ListItem Value="7">Especialização, Mestrado e Doutorado</asp:ListItem>
                        <asp:ListItem Value="8">Analfabeto</asp:ListItem>                        
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:SqlDataSource ID="dsInstrucao" runat="server" ConnectionString="<%$ ConnectionStrings:gerCadastrosConnectionString %>" SelectCommand="SELECT [idEscolaridade], [descEscolaridade] FROM [tblCadEscolaridade]"></asp:SqlDataSource>
                </td>
                <td>&nbsp;</td>
            </tr>  <%--Grau de Instrução--%>
            <tr>
                <td class="auto-style21">Renda (Valor):</td>
                <td class="auto-style12">
                    <dx:ASPxTextBox ID="txtRenda" runat="server" Text="0" Width="100px" TabIndex="80">
                        <MaskSettings Mask="&lt;0..99999g&gt;" />
                    </dx:ASPxTextBox>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="rfv_Renda" runat="server" ControlToValidate="txtRenda" ErrorMessage="'Renda' é obrigatório" Font-Bold="True" ForeColor="Red" SetFocusOnError="True">*</asp:RequiredFieldValidator>
                </td>
                <td>&nbsp;</td>
            </tr>  <%--Renda--%>

            <tr>
                <td class="auto-style21">&nbsp;</td>
                <td class="auto-style12">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4" colspan="4">
                    <table cellspacing="1" class="auto-style1">
                        <tr>
                            <td class="auto-style11">
                                <asp:Button ID="btnNovo" runat="server" Text="Novo" Width="100px" TabIndex="86" />
                            </td>
                            <td class="auto-style11">
                                <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" Width="100px" style="height: 26px" TabIndex="85" />
                            </td>
                            <td>
                                <asp:Button ID="btnSalvar" runat="server" Text="Salvar" Width="100px" TabIndex="84" />
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="auto-style21">&nbsp;</td>
                <td class="auto-style12">&nbsp;</td>
                
                <td>                    
                    <ajaxToolkit:TextBoxWatermarkExtender ID="TBWE_NomeCompleto" runat="server" 
                        TargetControlID="txtNomeCompleto"
                         WatermarkText="Informe o nome igual ao do RG." WatermarkCssClass="watermarked" 
                          />                        
                </td>

                <td>                    
                    <ajaxToolkit:TextBoxWatermarkExtender ID="TBWE_Matricula" runat="server" 
                        TargetControlID="txtMatricula"
                         WatermarkText="Número da Matricula do Funcionário" WatermarkCssClass="watermarked" 
                          />                        
                </td>

                <td>                    
                    <ajaxToolkit:TextBoxWatermarkExtender ID="TBWE_CPF" runat="server" 
                        TargetControlID="txtCPF"
                         WatermarkText="Digite apenas números (regra 11 digitos)" WatermarkCssClass="watermarked" 
                          />                        
                </td>

                <td>                    
                    <ajaxToolkit:TextBoxWatermarkExtender ID="TBWE_NomeDoPai" runat="server" 
                        TargetControlID="txtNomeDoPai"
                         WatermarkText="Nome igual ao RG do funcionário" WatermarkCssClass="watermarked" 
                          />                        
                </td>

                <td>                    
                    <ajaxToolkit:TextBoxWatermarkExtender ID="TBWE_NomeDoMae" runat="server" 
                        TargetControlID="txtNomeDaMae"
                         WatermarkText="Nome igual ao RG do funcionário" WatermarkCssClass="watermarked" 
                          />                        
                </td>

                <td>                    
                    <ajaxToolkit:TextBoxWatermarkExtender ID="TBWE_Complemento" runat="server" 
                        TargetControlID="txtComplemento"
                         WatermarkText="Apartamento, Sobrado, Bloco e etc." WatermarkCssClass="watermarked" 
                          />                        
                </td>

                <td>                    
                    <ajaxToolkit:TextBoxWatermarkExtender ID="TBWE_Bairro" runat="server" 
                        TargetControlID="txtBairro"
                         WatermarkText="Sem abreviações" WatermarkCssClass="watermarked" 
                          />                        
                </td>
                
                <td>                    
                    <ajaxToolkit:TextBoxWatermarkExtender ID="TBWE_Cidade" runat="server" 
                        TargetControlID="txtCidade"
                         WatermarkText="Sem abreviações" WatermarkCssClass="watermarked" 
                          />                        
                </td>

                <td>                    
                    <ajaxToolkit:TextBoxWatermarkExtender ID="TBWE_Endereco" runat="server" 
                        TargetControlID="txtEndereco"
                         WatermarkText="Informe o endereço sem o Nº, sem a Cidade e sem o Bairro" WatermarkCssClass="watermarked" 
                          />                        
                </td>

                <td>                    
                    <ajaxToolkit:TextBoxWatermarkExtender ID="TBWE_NumeroRG" runat="server" 
                        TargetControlID="txtNumeroRG"
                         WatermarkText="sem ponto e sem traço" WatermarkCssClass="watermarked" 
                          />                        
                </td>

                <td>                    
                    <ajaxToolkit:TextBoxWatermarkExtender ID="TBWE_Email" runat="server" 
                        TargetControlID="txtEmail"
                         WatermarkText="Informe o E-mail" WatermarkCssClass="watermarked" 
                          />                        
                </td>

                <td>                    
                    <ajaxToolkit:TextBoxWatermarkExtender ID="TBWE_DataNascimento" runat="server" 
                        TargetControlID="txtDataNascimento"
                         WatermarkText="Dia sem barra (/)" WatermarkCssClass="watermarked" 
                          />                        
                </td>

                <td>                    
                    <ajaxToolkit:TextBoxWatermarkExtender ID="TBWE_DOC" runat="server" 
                        TargetControlID="txtDOC"
                         WatermarkText="Dia sem barra (/)" WatermarkCssClass="watermarked" 
                          />                        
                </td>

               <td>                    
                    <ajaxToolkit:TextBoxWatermarkExtender ID="TBWE_DataAdmissao" runat="server" 
                        TargetControlID="txtDataAdmissao"
                         WatermarkText="Dia sem barra (/)" WatermarkCssClass="watermarked" 
                          />                        
                </td>

               <td>                    
                    <ajaxToolkit:TextBoxWatermarkExtender ID="TBWE_Telefone" runat="server" 
                        TargetControlID="txtTelefone"
                         WatermarkText="com Prefixo" WatermarkCssClass="watermarked" 
                          />                        
                </td> 
                
               <td>                    
                    <ajaxToolkit:TextBoxWatermarkExtender ID="TBWE_LocalNascimento" runat="server" 
                        TargetControlID="txtLocalNascimento"
                         WatermarkText="Cidade" WatermarkCssClass="watermarked" 
                          />                        
                </td>                               

               <td>                    
                    <ajaxToolkit:TextBoxWatermarkExtender ID="TBWE_Numero" runat="server" 
                        TargetControlID="txtNumero"
                         WatermarkText="Só Números" WatermarkCssClass="watermarked" 
                          />                        
                </td>  
               
                
            </tr>
            </table>
    
    </div>
    
    


</asp:Content>
