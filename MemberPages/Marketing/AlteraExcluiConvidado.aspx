<%@ Page Title="Alteração / Exclusão de Convidados" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="AlteraExcluiConvidado.aspx.vb" Inherits="MemberPages_Marketing_AlteraExcluiConvidado" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
 

    </style>

    <script src="../../Scripts/jquery-1.10.2.min.js"></script>
    <script src="../../Scripts/jquery.maskedinput.js"></script>

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

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

           <div id="divCNPJ" style ="float:left; margin :5px; padding: 5px; border :1px solid gray; width: 650px; padding-top: 2px">
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style3" colspan="2">Ano:</td>
                        <td colspan="5">
                            <uc1:wucAno ID="cboAno" runat="server" aEnabled="False"  AutoPostBack="False" aVisible="True"  />
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style3" colspan="2">Responsável:</td>
                        <td colspan="5">
                            <dx:ASPxComboBox ID="cboDistribuidor" runat="server" DataSourceID="dsDistribuidor" Font-Size="Medium" TextField="nomeDistribuidor" Theme="Default" ValueField="idDistribuidor" Width="400px" AutoPostBack="True" DropDownRows="15" IncrementalFilteringMode="Contains"></dx:ASPxComboBox>
                            <asp:SqlDataSource ID="dsDistribuidor" runat="server" ConnectionString="<%$ ConnectionStrings:gerMarketingConnectionString %>" SelectCommand="uspListaDistribuidor" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style3" colspan="2">Convidado:</td>
                        <td colspan="5">
                                    <dxe:ASPxComboBox ID="cboList" runat="server" AutoPostBack="True" 
                                        TextField="nomeConvidado" 
                                        ToolTip="Exibe todos os diários de bordo para este projeto. Você de selecionar uma 'Etapa' primeiro." 
                                        ValueField="nomeConvidado" Width="300px"                                          
                                         SettingsLoadingPanel-Text="" ShowShadow="False" Theme="Default" DataSourceID="dsAta" EnableTheming="True" DropDownRows="15" IncrementalFilteringMode="Contains">
                                        
                                        <Columns>                                          
<dx:ListBoxColumn FieldName="nomeConvidado" Width="200px" Caption="Nome Convidado"></dx:ListBoxColumn>
                                        </Columns>
                                        <ValidationSettings>
                                            <ErrorImage Height="14px" Url="~/App_Themes/Aqua/Editors/edtError.png" 
                                                Width="14px" />
                                            <ErrorFrameStyle ImageSpacing="4px">
                                                <ErrorTextPaddings PaddingLeft="4px" />
                                            </ErrorFrameStyle>
                                        </ValidationSettings>
                                    </dxe:ASPxComboBox>
                                    <asp:SqlDataSource ID="dsAta" runat="server" ConnectionString="<%$ ConnectionStrings:gerMarketingConnectionString %>" SelectCommand="usp_BuscarListaConvidadosPorDistribuidorReduzida" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                            <asp:ControlParameter ControlID="cboDistribuidor" Name="idDistribuidor" PropertyName="Value" Type="Byte" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style3" colspan="8" style="border-boton-style: solid; border-bottom-style: solid; border-bottom-width: 2px; border-bottom-color: #666666;">&nbsp;</td>
                    </tr>
                     <tr>
                        <td class="auto-style3" colspan="2">Opção:</td>
                        <td class="auto-style12" colspan="2">
                            <table class="dxflInternalEditorTable_Office2010Silver">
                                <tr>
                                    <td>
                                        <dx:ASPxRadioButton ID="rndCGC" runat="server" AutoPostBack="True" Checked="True" GroupName="CGC_Condor" Text="CNPJ" TabIndex="1">
                                        </dx:ASPxRadioButton>
                                    </td>
                                    <td>
                                        <dx:ASPxRadioButton ID="rndCondor" runat="server" AutoPostBack="True" ForeColor="Blue" GroupName="CGC_Condor" Text="Condor" TabIndex="2">
                                        </dx:ASPxRadioButton>
                                    </td>
                                    <td>
                                        <dx:ASPxComboBox ID="cboTipo" runat="server" DataSourceID="dsTipo" TextField="descTipo" ValueField="idTipo" Visible="False" Width="100px">
                                        </dx:ASPxComboBox>
                                        <asp:SqlDataSource ID="dsTipo" runat="server" ConnectionString="<%$ ConnectionStrings:gerMarketingConnectionString %>" SelectCommand="uspBuscarTipo" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                    </td>
                                    <td></td>
                                </tr>
                            </table>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                     <tr>
                        <td class="auto-style3" colspan="2">
                            <asp:Label ID="lblCNPJ_Caption" runat="server" Text="CNPJ:"></asp:Label>
                         </td>
                        <td class="auto-style12" colspan="5">
                            <asp:TextBox ID="txtCPF" runat="server" Width="250px" placeholder="Digite apenas números (regra 14 digitos)"  TabIndex="3" ClientIDMode="Static" Font-Size="Small" AutoPostBack="True" ></asp:TextBox>
                        </td>
                        <td>
        &nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style3" colspan="2"> </td>
                        <td colspan="5">
                            <asp:Label ID="lblEmpresa" runat="server" Font-Size="X-Large" ForeColor="#666666" TabIndex="10"></asp:Label>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style3" colspan="2">Convidado: </td>
                        <td colspan="5">
                            <asp:TextBox ID="txtConvidado" runat="server" Width="500px" Font-Size="XX-Large" TabIndex="4" Enabled="False"></asp:TextBox>
                        </td>
                        <td>
                        &nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style3" colspan="2">Cargo:</td>
                        <td colspan="5">
                            <asp:TextBox ID="txtCargo" runat="server" Width="450px" Font-Size="X-Large" TabIndex="4"></asp:TextBox>
                        </td>
                        <td>
                            &nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style3" colspan="2">Acompanhante:</td>
                        <td colspan="3">
                            <table class="auto-style1">
                                <tr>
                                    <td class="auto-style4">
                                        <dx:ASPxRadioButton ID="rnd_nao" runat="server" Checked="True" GroupName="SimNao" Text="Não" TabIndex="5">
                                        </dx:ASPxRadioButton>
                                    </td>
                                    <td>
                                        <dx:ASPxRadioButton ID="rnd_Sim" runat="server" GroupName="SimNao" Text="Sim" TabIndex="6">
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
                                        &nbsp;</td>
                        <td class="auto-style3" colspan="3" style="text-align: center">
                                        <asp:Button ID="btnExcluir" runat="server" Text="Excluir" Width="100px" style="height: 26px" TabIndex="8" Font-Bold="True" ForeColor="Red" />
                                    </td>
                        <td class="auto-style3" style="text-align: center">
                                        <asp:Button ID="btnSalvar" runat="server" Text="Salvar" Width="100px" TabIndex="9" Font-Bold="True" ForeColor="Blue" style="height: 26px" />
                                    </td>
                    </tr>
                </table>
            </div>



</asp:Content>

