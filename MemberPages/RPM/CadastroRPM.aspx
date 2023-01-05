<%@ Page Title="Cadastro RPM" Language="VB" MasterPageFile="~/MemberPages/RPM/masterRPM.master" AutoEventWireup="false" CodeFile="CadastroRPM.aspx.vb" Inherits="MemberPages_RPM_CadastroRPM" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>


<%@ Register assembly="DevExpress.Web.ASPxSpellChecker.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxSpellChecker" tagprefix="dx" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <style type ="text/css" >

        #divCadastro {
            float: left;            
            margin-top: 2px;
            width: 400px;
            height: 300px;
            border: 1px solid gray;
        }

        #divDescricao {
            float: left;            
            margin-top: 2px;
            margin-left: 4px;
        }

        #divPrazo {
            float: left;            
            margin-top: 5px;
            margin-left: 4px;
        }

        #divTerceiro {
            float: left;            
            margin-top: 5px;
            margin-left: 4px;
        }

        .auto-style2 {
            width: 23px;
        }

        #divBotoes {
            clear: both;
            float: left;            
            margin-top: 10px;
            margin-left: 4px;            
        }



    </style>

    <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="450px" ClientInstanceName="cbPanel" Theme="Metropolis">
        

        <PanelCollection>
    <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
    


    <div id="divCadastro">

        <div id="divDescricao">    

            <table cellpadding="0" cellspacing="0" class="dxflInternalEditorTable_Office2010Silver">
                <tr>
                    <td style="font-weight: bold">Descrição da Tarefa:</td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxMemo ID="txtDesc" runat="server" Height="150px" Width="380px" Native="True" Theme="Glass">
                        </dx:ASPxMemo>
                    </td>
                </tr>
            </table>

        </div>

        <div id="divPrazo">

           <table cellpadding="0" cellspacing="0" class="dxflInternalEditorTable_Office2010Silver">
                <tr>
                    <td style="font-weight: bold">Solicitante:</td>
                    <td class="auto-style2"></td>
                    <td style="font-weight: bold">Prazo da Tarefa:</td>
                    <td class="auto-style2"></td>
                    <td style="font-weight: bold">Duração</td>
                </tr>
                <tr>
                    <td>
                        <asp:TextBox ID="txtSolicitante" runat="server" Width="100px"></asp:TextBox>
                    </td>
                    <td class="auto-style2"></td>
                    <td>
                        <dx:ASPxDateEdit ID="cboDia" runat="server" HorizontalAlign="Center" Width="110px"></dx:ASPxDateEdit>
                    </td>
                    <td class="auto-style2"></td>
                    <td>
                        <dx:ASPxTextBox ID="txtDuracao" runat="server" Width="60px" HorizontalAlign="Center">
                            <MaskSettings Mask="HH:mm" />
                        </dx:ASPxTextBox>
                    </td>
                </tr>
            </table>

        </div>

        <div id="divTerceiro">

           <table cellpadding="0" cellspacing="0" class="dxflInternalEditorTable_Office2010Silver">
                <tr>
                    <td style="font-weight:bold">Status:</td>
                    <td class="auto-style2"></td>
                    <td style="font-weight: bold">Categoria</td>
                </tr>
                <tr>
                    <td>
                        <dx:ASPxComboBox ID="cboStatus" runat="server" DataSourceID="dsStatus" TextField="descStatus" ValueField="idStatus" ValueType="System.Byte" Width="120px">
                        </dx:ASPxComboBox>
                        <asp:SqlDataSource ID="dsStatus" runat="server" ConnectionString="<%$ ConnectionStrings:gerRPMConnectionString %>" SelectCommand="uspLista_Status" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                    </td>
                    <td class="auto-style2">
                        <asp:Label ID="lblError" runat="server"></asp:Label>
                    </td>
                    <td>
                        <dx:ASPxComboBox ID="cboCategoria" runat="server" DataSourceID="dsListaPersonal" TextField="descCatPersonal" ValueField="idCatPersonal" ValueType="System.Byte" Width="140px" style="margin-left: 0px">
                        </dx:ASPxComboBox>
                        <asp:SqlDataSource ID="dsListaPersonal" runat="server" ConnectionString="<%$ ConnectionStrings:gerRPMConnectionString %>" SelectCommand="uspLista_CategoriaPersonal" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

                    </td>
                </tr>
            </table>

        </div>

         </div>
            </dx:PanelContent>
</PanelCollection>
        

    </dx:ASPxCallbackPanel>

        <div id="divBotoes">
            <table cellpadding="0" cellspacing="0" class="dxflInternalEditorTable_Office2010Silver" style="width: 450%">
                <tr>
                    <td>
                        <dx:ASPxButton ID="btnSalvar" runat="server" Text="Salvar" AutoPostBack="False">
                            <ClientSideEvents Click="function(s, e) {
	cbPanel.PerformCallback();
}" />
                        </dx:ASPxButton>
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>
    </div>

   


    

</asp:Content>

