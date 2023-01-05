<%@ Page Title="Cadastro de Convidados" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="CadConvidados.aspx.vb" Inherits="MemberPages_Marketing_CadConvidados" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

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

   

        #divLista {
            clear:both;
            float: left;
            border: 1px solid gray;             
            padding: 3px;
            margin-left: 5px;
            margin-top: 5px;
        }

        #divExcel {
            clear:both;
            float: left;                      
            padding: 3px;
            margin-left: 5px;
          
        }

        #divCNPJ {
            clear:both;
            float: left;
            border: 1px solid gray;
            width: 620px;     
            padding: 3px;
            margin-left: 5px;
            margin-top: 2px;
        }

         .watermarked {
            color:lightgray
            

        }

    </style>

  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSalvar" />
            <asp:PostBackTrigger ControlID ="wucBotaoExcel" />
        </Triggers>
        <ContentTemplate>

            


           <div id="divCNPJ">
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style3" colspan="2">Ano:</td>
                        <td colspan="5">
                            <uc1:wucAno ID="cboAno" runat="server" aEnabled="False" AutoPostBack="False" aVisible="True" />
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
                        <td class="auto-style3" colspan="2">Opção:</td>
                        <td class="auto-style12" colspan="2">
                            <table class="dxflInternalEditorTable_Office2010Silver">
                                <tr>
                                    <td>
                                        <dx:ASPxRadioButton ID="rndCGC" runat="server" AutoPostBack="True" Checked="True" GroupName="CGC_Condor" Text="CNPJ" TabIndex="1">
                                        </dx:ASPxRadioButton>
                                    </td>
                                    <td>
                                        <dx:ASPxRadioButton ID="rndCPF" runat="server" AutoPostBack="True" Checked="True" GroupName="CGC_Condor" TabIndex="2" Text="CPF">
                                        </dx:ASPxRadioButton>
                                    </td>
                                    <td>
                                        <dx:ASPxRadioButton ID="rndCondor" runat="server" AutoPostBack="True" ForeColor="Blue" GroupName="CGC_Condor" TabIndex="3" Text="Condor">
                                        </dx:ASPxRadioButton>
                                    </td>
                                    <td>
                                        <dx:ASPxComboBox ID="cboTipo" runat="server" DataSourceID="dsTipo" TextField="descTipo" ValueField="idTipo" Visible="False" Width="100px" AutoPostBack="True">
                                        </dx:ASPxComboBox>
                                        <asp:SqlDataSource ID="dsTipo" runat="server" ConnectionString="<%$ ConnectionStrings:gerMarketingConnectionString %>" SelectCommand="uspBuscarTipo" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                    </td>
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
                             

                            <dx:ASPxTextBox ID="txtCPF" runat="server" Native="True" Width="250px" AutoPostBack="True" TabIndex="4">
                                <MaskSettings IncludeLiterals="None" Mask="00,000,000/0000-00" />
                            </dx:ASPxTextBox>
                             

                            <dx:ASPxTextBox ID="txtCPF1" runat="server" AutoPostBack="True" Native="True" Visible="False" Width="170px">
                                <MaskSettings IncludeLiterals="None" Mask="000,000,000-00" />
                            </dx:ASPxTextBox>
                             

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
                            <asp:TextBox ID="txtConvidado" runat="server" Width="500px" Font-Size="XX-Large" TabIndex="5"></asp:TextBox>
                        </td>
                        <td>
                        &nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style3" colspan="2">Cargo:</td>
                        <td colspan="5">
                            <asp:TextBox ID="txtCargo" runat="server" Width="450px" Font-Size="X-Large" TabIndex="6"></asp:TextBox>
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
                                        <dx:ASPxRadioButton ID="rnd_nao" runat="server" Checked="True" GroupName="SimNao" Text="Não" TabIndex="7">
                                        </dx:ASPxRadioButton>
                                    </td>
                                    <td>
                                        <dx:ASPxRadioButton ID="rnd_Sim" runat="server" GroupName="SimNao" Text="Sim" TabIndex="8">
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
                                        <asp:Button ID="btnNovo" runat="server" Text="Novo" Width="100px" TabIndex="7" style="text-align: center" Visible="False" />
                                    </td>
                        <td class="auto-style3" colspan="3" style="text-align: center">
                                        <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" Width="100px" style="height: 26px" TabIndex="8" Visible="False" />
                                    </td>
                        <td class="auto-style3" style="text-align: center">
                                        <asp:Button ID="btnSalvar" runat="server" Text="Salvar" Width="100px" TabIndex="9" Enabled="False" UseSubmitBehavior="False" />
                                    </td>
                    </tr>
                </table>
            </div>

      
    <div id="divLista">
        <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="dsLista" KeyFieldName="nomeConvidado" Width="1000px">
            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="Total de Convidados: {0:n0}" FieldName="nomeConvidado" ShowInColumn="Nome do Convidado" SummaryType="Count" />
            </TotalSummary>
            <Columns>
                <dx:GridViewCommandColumn VisibleIndex="0" ShowClearFilterButton="True"/>
                <dx:GridViewDataTextColumn Caption="Ano" FieldName="Ano" VisibleIndex="1" Width="50px">
                    <Settings AllowAutoFilter="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="CNPJ do Fornecedor" FieldName="CPF_CGC" VisibleIndex="3" Width="130px">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Nome do Fornecedor" FieldName="DescFornecedor" ReadOnly="True" VisibleIndex="5" Width="150px">
                    <Settings AutoFilterCondition="Contains" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Nome do Convidado" FieldName="nomeConvidado" VisibleIndex="6" Width="200px">
                    <Settings AutoFilterCondition="Contains" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Acompanhante" ReadOnly="True" VisibleIndex="8" Width="100px">
                    <Settings AutoFilterCondition="Contains" />
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="Usuario" VisibleIndex="9" Width="90px" Caption="Quem Incluiu?">
                    <Settings AutoFilterCondition="Contains" />
                    <CellStyle HorizontalAlign="Center" Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="DataInclusao" VisibleIndex="10" Width="100px" Caption="Data Inclusão">
                    <Settings AutoFilterCondition="Contains" />
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="HoraInclusao" VisibleIndex="11" Caption="Hora Inclusão" Width="100px">
                    <Settings AllowAutoFilter="False" />
                    <CellStyle HorizontalAlign="Center">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Tipo" FieldName="descTipo" VisibleIndex="2" Width="100px">
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Cargo" FieldName="Cargo" VisibleIndex="7" Width="100px">
                    <Settings AutoFilterCondition="Contains" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Nome Fantasia" FieldName="DescFornecedor" VisibleIndex="4" Width="200px">
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
            </Columns>
            <SettingsBehavior ColumnResizeMode="Control" />
            <SettingsPager Mode="ShowAllRecords">
            </SettingsPager>
            <Settings ShowTitlePanel="True" VerticalScrollBarMode="Auto" ShowFilterRow="True" ShowFooter="True" />
            <SettingsText Title="Lista de Convidados " EmptyDataRow="Não há nenhum convidado informado ainda." />
            <Styles>
                <Header HorizontalAlign="Center">
                </Header>
                <AlternatingRow BackColor="#F2F2F2">
                </AlternatingRow>
                <TitlePanel Font-Bold="True" Font-Size="X-Large">
                </TitlePanel>
            </Styles>
        </dx:ASPxGridView>
        <asp:SqlDataSource ID="dsLista" runat="server" ConnectionString="<%$ ConnectionStrings:gerMarketingConnectionString %>" SelectCommand="usp_BuscarListaConvidadosPorDistribuidor" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:ControlParameter ControlID="cboDistribuidor" DefaultValue="1" Name="idDistribuidor" PropertyName="Value" Type="Byte" />
            </SelectParameters>
        </asp:SqlDataSource>


        <ajaxToolkit:TextBoxWatermarkExtender ID="TBWE_Convidado" runat="server" 
                        TargetControlID="txtConvidado" 
                         WatermarkText="Informe o nome do convidado." WatermarkCssClass="watermarked"   
                          />

        <ajaxToolkit:TextBoxWatermarkExtender ID="TBWE_Cargo" runat="server" 
                        TargetControlID="txtCargo" 
                         WatermarkText="Informe o Cargo do convidado." WatermarkCssClass="watermarked"   
                          />

       

    </div>


    <div id="divExcel">
        <uc1:wucBotaoExcel runat="server" ID="wucBotaoExcel" CallGridViewID="grid" GuiaNome="Lista de Convidados" />
    </div>
 
                    </ContentTemplate>
    </asp:UpdatePanel>   


</asp:Content>

