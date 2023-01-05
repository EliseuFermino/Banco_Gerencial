<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="RupturaControladoria.aspx.vb" Inherits="MemberPages_Estoque_Ruptura_RupturaControladoria" %>


	<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>






<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

      

        #divFilial {            
            float: left;
            margin-left: 10px;
        }

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
        }

        #divBotaoExcel {            
            float: left;
            margin-left: 10px;
        }

        #divSize {            
            float: left;           
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

   
    <div id="divFilial">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

    <div id="divBotaoExcel">
        <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="grid" />
    </div>

    <div id="divSize">
        <uc1:wucSize runat="server" ID="cboSize" />
    </div>



    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>
                    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsDados" AutoGenerateColumns="False" KeyFieldName="Produto" Width="1000px">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="Quantidade de Produtos: {0:n0}" FieldName="Produto" SummaryType="Count" ShowInColumn="Descricao" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:c}" FieldName="vlrVendaPerdida" SummaryType="Sum" />
                        </TotalSummary>
                        <GroupSummary>
                            <dx:ASPxSummaryItem DisplayFormat="Qtde de Produtos: {0:n0}" FieldName="Produto" SummaryType="Count" />
                        </GroupSummary>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="Sistematica" ShowInCustomizationForm="True" VisibleIndex="2" Width="80px">
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Departamento" ShowInCustomizationForm="True" VisibleIndex="0">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Setor" ShowInCustomizationForm="True" VisibleIndex="1" Width="150px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Produto" ShowInCustomizationForm="True" VisibleIndex="3" Width="80px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Descricao" ShowInCustomizationForm="True" VisibleIndex="4" Width="250px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Giro" ShowInCustomizationForm="True" VisibleIndex="5" Width="50px">
                                <HeaderStyle BackColor="#009900" ForeColor="White" />
                                <CellStyle Font-Bold="True" ForeColor="#009900" HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Ranking" ShowInCustomizationForm="True" VisibleIndex="6" Width="70px">
                                <HeaderStyle BackColor="Red" ForeColor="White" />
                                <CellStyle ForeColor="Red" HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Perda de Vendas" ShowInCustomizationForm="True" VisibleIndex="7">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="Ultima_Saida" ShowInCustomizationForm="True" VisibleIndex="0" Caption="Última Venda">
                                        <PropertiesTextEdit DisplayFormatString="{0:dd/MM/yyyy} " EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Dias_Sem_Saida" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Dias Sem Venda">
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="VolumeMedio" ShowInCustomizationForm="True" VisibleIndex="2">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrPrecoVenda" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Preço Venda" ToolTip="Último preço de venda">
                                        <PropertiesTextEdit DisplayFormatString="{0:c}">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Venda Perdida" FieldName="vlrVendaPerdida" ShowInCustomizationForm="True" ToolTip="Venda Média Perdida " VisibleIndex="4" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:c}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn Caption="Pedido Pendente" FieldName="Ped#Pendente" ShowInCustomizationForm="True" VisibleIndex="8" Width="120px" Visible="False">
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn Caption="Previsão Entrega" FieldName="Dt#Prev#Entr" ShowInCustomizationForm="True" ToolTip="Dia de Previsão de Entrega" VisibleIndex="9" Visible="False">
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn FieldName="Dias Atraso" ShowInCustomizationForm="True" ToolTip="Dias em Atraso" VisibleIndex="10" Width="70px" Visible="False">
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Qtd#Pend" ShowInCustomizationForm="True" VisibleIndex="11" ToolTip="QTDE PENDENTE" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Ped#Pend#Bon" ShowInCustomizationForm="True" VisibleIndex="12" ToolTip="PEDIDO PENDENTE BONIFICAÇÃO">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Dt#Prev#Bon" ShowInCustomizationForm="True" VisibleIndex="13" ToolTip="PREVISÃO ENTREGA BONIFICAÇÃO">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Dias Pend#Bon" ShowInCustomizationForm="True" VisibleIndex="14" ToolTip="DIAS ATRASO BONIFICAÇÃO">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Qtd#Pend#Bon" ShowInCustomizationForm="True" VisibleIndex="15" ToolTip="QTDE PENDENTE BONIFICAÇÃO">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Codigo" FieldName="idFornecedor" ShowInCustomizationForm="True" VisibleIndex="16" Width="60px">
                                <HeaderStyle BackColor="Silver" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Descrição Fornecedor" FieldName="nomeFornecedor" ShowInCustomizationForm="True" VisibleIndex="17" Width="150px">
                                <HeaderStyle BackColor="Silver" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Comprador" FieldName="nomeCompradorAbrev" ShowInCustomizationForm="True" VisibleIndex="19">
                                <HeaderStyle BackColor="Silver" />
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Auto" ShowFooter="True" ShowTitlePanel="True" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" ShowFilterRow="True" ShowGroupPanel="True" />
                        <SettingsText EmptyDataRow="Nenhuma Ruptura" GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
                        <SettingsLoadingPanel Text="Atualizando&amp;hellip;" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#F3F3F3">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF66" ForeColor="Blue">
                            </FocusedRow>
                            <Footer Font-Bold="True">
                            </Footer>
                        </Styles>
                    </dx:ASPxGridView>                    
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="usp_BuscarRupturas" SelectCommandType="StoredProcedure" EnableCaching="False">
                        <SelectParameters>
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>


</asp:Content>
