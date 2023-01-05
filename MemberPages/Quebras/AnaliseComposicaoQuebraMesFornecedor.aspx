<%@ Page Title="Analise de Quebras por Mês Fornecedor" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="AnaliseComposicaoQuebraMesFornecedor.aspx.vb" Inherits="MemberPages_Quebras_AnaliseComposicaoQuebraMesFornecedor" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>


<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<%@ Register src="../../Controles/wucListaLojasComCorporacao.ascx" tagname="wucListaLojasComCorporacao" tagprefix="uc3" %>

<%@ Register Src="~/Controles/wucFornecedor.ascx" TagPrefix="uc1" TagName="wucFornecedor" %>

<%@ Register src="../../Controles/wucListaDiaIniFin.ascx" tagname="wucListaDiaIniFin" tagprefix="uc6" %>
<%@ Register Src="~/Controles/wucListaProdutoStatus.ascx" TagPrefix="uc1" TagName="wucListaProdutoStatus" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>


<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    
    <style type="text/css">
       
        #divFornecedor {
            clear: both;
            float: left;
            margin-left: 2px;
            width: 700px; 
        }

        #divSize {            
            float: left;
            margin-left: -20px;
        }
     
        #divFilial {    
            clear: both;                   
            float: left;
            margin-left: 5px;            
        }

        #divItens {                       
            float: left;
            margin-left: 10px;
            margin-top: 15px;
        }

        #divDivergencia {                       
            float: left;
            margin-left: 10px;
            margin-top: 15px;
        }

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
            margin-top: 10px;
        }

        #divProdutoStatus {            
            float: left;
            margin-left: 8px;
            padding-top: 5px;
        }

        #divDados { 
            clear: both;           
            float: left;
            margin-left: 2px;
            padding-top: 3px;
            width: 100%;
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divFornecedor">    
        <uc1:wucFornecedor runat="server" ID="cboFornecedor" />
    </div>

    <div id="divSize">
        <uc1:wucSize runat="server" ID="cboSize" CallSize="100" />
    </div>

    <div id="divFilial" class="BGC_myBorder">
         <uc3:wucListaLojasComCorporacao ID="cboFilial" runat="server" />
    </div>

    <div id="divPeriodo" class="BGC_Periodo BGC_myBorder">
        <uc6:wucListaDiaIniFin ID="cboDia" runat="server" />
    </div>

    

    <div id="divItens">
        <dx:ASPxCheckBox ID="chkItens" runat="server" Theme="DevEx" Text="por Item" ToolTip="Se clicado, exibe todos os itens do fornecedor. Se não estiver clicado exibe os itens por mercadológico."></dx:ASPxCheckBox>
    </div>

    <div id="divDivergencia">
        <dx:ASPxCheckBox ID="chkDivergencia" runat="server" Theme="DevEx" Text="Total da Divergência" ToolTip="Se clicado exibe o total da divergência (sobras - falta), se não estiver clicado exibe a coluna da agenda 51 (sobra) e a coluna da agenda 52 (falta)."></dx:ASPxCheckBox>
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="MetropolisBlue">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

    <div id="divProdutoStatus">
        <uc1:wucListaProdutoStatus runat="server" ID="cboProdutoStatus" />
    </div>


    <div id="divDados">

    <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
<SettingsLoadingPanel Text="Aguarde. Atualizando"></SettingsLoadingPanel>
            <PanelCollection>

                <dx:PanelContent>

        <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableTheming="True" KeyFieldName="idProduto" OnCustomSummaryCalculate="ASPxGridView1_CustomSummaryCalculate" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" OnHtmlFooterCellPrepared="ASPxGridView1_HtmlFooterCellPrepared" Theme="Default" Width="100%">
            <Toolbars>
                <dx:GridViewToolbar EnableAdaptivity="true">
                    <Items>
                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>

            <TotalSummary>
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargem" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde51" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg51" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde52" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg52" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeDiv" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDiv" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde23" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg23" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeQuebra" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrQuebra" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LS" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LF" SummaryType="Sum" />        
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pMS" SummaryType="Custom" />                                                    
            </TotalSummary>
            <GroupSummary>
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" ShowInGroupFooterColumn="vlrVenda" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde51" ShowInGroupFooterColumn="Qtde51" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg51" ShowInGroupFooterColumn="vlrAg51" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde52" ShowInGroupFooterColumn="Qtde52" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg52" ShowInGroupFooterColumn="vlrAg52" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeDiv" ShowInGroupFooterColumn="QtdeDiv" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDiv" ShowInGroupFooterColumn="vlrDiv" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde23" ShowInGroupFooterColumn="Qtde23" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg23" ShowInGroupFooterColumn="vlrAg23" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeQuebra" ShowInGroupFooterColumn="QtdeQuebra" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrQuebra" ShowInGroupFooterColumn="vlrQuebra" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" ShowInGroupFooterColumn="percCresc" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargem" ShowInGroupFooterColumn="vlrMargem" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" ShowInGroupFooterColumn="percMargem" SummaryType="Custom" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" ShowInGroupFooterColumn="Qtde" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LS" ShowInGroupFooterColumn="LS" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LF" ShowInGroupFooterColumn="LF" SummaryType="Sum" />
                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pMS" ShowInGroupFooterColumn="pMS" SummaryType="Custom" />
                <dx:ASPxSummaryItem />
            </GroupSummary>
            <Columns>
                <dx:GridViewBandColumn Caption="Margem Praticada" ToolTip="Informações sobre Margem Praticada" VisibleIndex="4" Name="bandMargemPraticada">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrMargem" ToolTip="Valor do lucro praticado" VisibleIndex="0" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="%" FieldName="percMargem" ReadOnly="True" ToolTip="Percentual de margem de frente de caixa." VisibleIndex="1" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" AllowHeaderFilter="False" ShowFilterRowMenu="False" ShowInFilterControl="True" />
                            <GroupFooterCellStyle BackColor="#D7EBFF" ForeColor="Blue">
                            </GroupFooterCellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Sell Out" ToolTip="Valor e Margem do Sell Out" VisibleIndex="5" Name="bandSellOut">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="R$" FieldName="LS" ToolTip="Valor do Sell Out" VisibleIndex="0" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="%" FieldName="pMS" ToolTip="Percentual do Sell Out" VisibleIndex="1" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Margem Final" ToolTip="Informações da Margem Final" VisibleIndex="6" Name="bandMargemFinal">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="R$" FieldName="LF" ToolTip="Valor da Margem Final (valor da margem praticada + valor do Sell Out)" VisibleIndex="0" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="%" FieldName="pMF" ToolTip="Percentual da Margem Final (% da margem praticada + % do Sell Out)" VisibleIndex="1" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewCommandColumn Visible="False" VisibleIndex="0" Width="10px" ShowClearFilterButton="True"/>
                <dx:GridViewBandColumn Caption="Produto" VisibleIndex="1" Name="bandProduto">

                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Código" FieldName="idProduto" ToolTip="Código do produto" VisibleIndex="0" Width="60px" FixedStyle="Left">
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Descrição" FieldName="DescProduto" ToolTip="Descrição do produto" VisibleIndex="1" Width="200px" FixedStyle="Left">
                            <Settings AutoFilterCondition="Contains" />
                            <CellStyle Wrap="False">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Venda" ToolTip="Valores de venda por item" VisibleIndex="3" Name="bandVenda">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVenda" ReadOnly="True" ToolTip="Valor de venda." VisibleIndex="3" Width="80px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" AllowAutoFilterTextInputTimer="False" AllowHeaderFilter="False" ShowFilterRowMenu="False" ShowInFilterControl="False" />
                            <GroupFooterCellStyle BackColor="#C1E0FF" ForeColor="Blue">                                                
                                <BorderRight BorderColor="#999999" BorderStyle="Dotted" BorderWidth="1px" />
                            </GroupFooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde" ToolTip="Quantidade vendida" VisibleIndex="1" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" AllowHeaderFilter="False" ShowFilterRowMenu="False" ShowInFilterControl="False" AllowAutoFilterTextInputTimer="False" />
                            <GroupFooterCellStyle BackColor="#B7DBFF" ForeColor="Blue">
                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                <BorderRight BorderColor="#999999" BorderStyle="Dotted" BorderWidth="1px" />
                            </GroupFooterCellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Agenda 51 (sobra)" ToolTip="Exibe as informações de volume e valor em reais da agenda 51 (sobra de mercadoria)." VisibleIndex="7" Name="bandAgenda51">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde51" ReadOnly="True" VisibleIndex="0" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                            <CellStyle>
                                <BorderLeft BorderStyle="None" />
                            </CellStyle>
                            <GroupFooterCellStyle>
                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                <BorderRight BorderColor="#999999" BorderStyle="Dotted" BorderWidth="1px" />
                            </GroupFooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrAg51" ReadOnly="True" VisibleIndex="1" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Agenda 52 (falta)" ToolTip="Exibe as informações de volume e valor em reais da agenda 52 (falta de mercadoria)." VisibleIndex="8" Name="bandAgenda52">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde52" ReadOnly="True" VisibleIndex="0" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                            <CellStyle>
                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </CellStyle>
                            <GroupFooterCellStyle>
                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                <BorderRight BorderColor="#999999" BorderStyle="Dotted" BorderWidth="1px" />
                            </GroupFooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrAg52" ReadOnly="True" VisibleIndex="1" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>

                <dx:GridViewBandColumn Caption="Agenda 23 (lixo)" ToolTip="Exibe as informações de volume e valor em reais da agenda 23 (lixo)." VisibleIndex="18">
                    <Columns>
                                       
                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrAg23" ReadOnly="True" VisibleIndex="1" Width="60px" ShowInCustomizationForm="True">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                            <GroupFooterCellStyle BackColor="#D8D8D8">
                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                <BorderRight BorderColor="#999999" BorderStyle="Dotted" BorderWidth="1px" />
                            </GroupFooterCellStyle>
                        </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Qtde23" ReadOnly="True" ShowInCustomizationForm="True" Width="60px" Caption="Volume" VisibleIndex="0">
<PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>

<Settings AllowAutoFilter="False"></Settings>

<GroupFooterCellStyle BackColor="#D8D8D8">
<BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px"></BorderLeft>

<BorderRight BorderColor="#999999" BorderStyle="Dotted" BorderWidth="1px"></BorderRight>
</GroupFooterCellStyle>
</dx:GridViewDataTextColumn>
                    </Columns>

                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Total Perda" ToolTip="Exibe as informações de volume, valor em reais  e percentual de crescimento do total da perda. O total da perda é composto pelo calculo (+ agenda23 + agenda 51 - agenda 52). O percentual de crescimento se dá pela divisão do valor total de quebra pela venda." VisibleIndex="2">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeQuebra" ReadOnly="True" VisibleIndex="0" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <Settings AllowAutoFilter="False" />
                            <GroupFooterCellStyle BackColor="#FFFFCC" Font-Bold="True">
                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                <BorderRight BorderColor="#999999" BorderStyle="Double" BorderWidth="1px" />
                            </GroupFooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrQuebra" ReadOnly="True" VisibleIndex="1" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <GroupFooterCellStyle BackColor="#FFFFCC" Font-Bold="True">
                            </GroupFooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="% Perda" FieldName="percCresc" ReadOnly="True" VisibleIndex="2" Width="60px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <GroupFooterCellStyle BackColor="#CCFFCC" Font-Bold="False">
                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </GroupFooterCellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewDataTextColumn FieldName="ListaGrupo" VisibleIndex="28" Caption="Grupo" GroupIndex="1" SortIndex="1" SortOrder="Ascending" Width="150px">
                    <Settings AutoFilterCondition="Contains" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Sub-grupo" FieldName="ListaSubgrupo" VisibleIndex="30" Width="150px" GroupIndex="3" SortIndex="3" SortOrder="Ascending">
                    <Settings AutoFilterCondition="Contains" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="vlrMargem" Visible="False" VisibleIndex="33" Width="50px">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn Caption="Seção" FieldName="ListaSecao" GroupIndex="0" SortIndex="0" SortOrder="Ascending" VisibleIndex="26" Width="150px">
                    <Settings AutoFilterCondition="Contains" />
                    <CellStyle Wrap="False">
                    </CellStyle>
                </dx:GridViewDataTextColumn>
                <dx:GridViewBandColumn Caption="Divergência" ToolTip="Total de Divergência. Agenda 51 (sobra) - Agenda 52 (falta)" VisibleIndex="9" Name="bandDivergencia" Visible="False">
                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeDiv" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle>
                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                            </CellStyle>
                            <GroupFooterCellStyle>
                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                <BorderRight BorderColor="#999999" BorderStyle="Dotted" BorderWidth="1px" />
                            </GroupFooterCellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrDiv" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                </dx:GridViewBandColumn>
            </Columns>
            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
            <SettingsPager PageSize="20">
            </SettingsPager>
             <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
            <Settings ShowFilterBar="Auto" ShowFilterRow="True" ShowFilterRowMenu="True" ShowFooter="True" ShowGroupFooter="VisibleAlways" ShowGroupPanel="True" VerticalScrollableHeight="350" VerticalScrollBarMode="Auto" HorizontalScrollBarMode="Auto" />
            <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" EmptyDataRow="Não há informações disponíveis ainda para esse período." />
            <SettingsLoadingPanel Text="Processando informação. Aguarde...&amp;hellip;" />
            <SettingsDetail ShowDetailButtons="False" />
            <Styles>
                <Header HorizontalAlign="Center">
                </Header>
                <GroupFooter BackColor="#EAEAEA" Font-Bold="False">
                </GroupFooter>
                <FocusedRow BackColor="Silver" ForeColor="#0066FF">
                </FocusedRow>
                <GroupRow Font-Bold="True">
                </GroupRow>
                <AlternatingRow BackColor="#E6F2FF">
                </AlternatingRow>
            </Styles>
        </dx:ASPxGridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="Analises.uspPerda_BuscarPorFornecedor" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="DiaInicial" SessionField="sDIA_INICIAL" DbType="Date" DefaultValue="" />
                <asp:SessionParameter Name="DiaFinal" SessionField="sDIA_FINAL" DbType="Date" />
                <asp:SessionParameter Name="idFornecedor" SessionField="sFORNECEDOR" Type="Int32" />
                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                <asp:SessionParameter Name="CNPJ_Principal" SessionField="sCNPJ" Type="Byte" />
                <asp:SessionParameter Name="Ativo" SessionField="sATIVO" Type="Byte" />
            </SelectParameters>
        </asp:SqlDataSource>

                    <br />


        <%--GRAFICO--%>

                    <dxchartsui:WebChartControl ID="graph" runat="server" DataSourceID="dsGraph" Height="600px" Width="1083px">
                        <diagramserializable>
                            <cc1:XYDiagram>
                                <axisx visibleinpanesserializable="-1">
                                    <range sidemarginsenabled="True" />
                                </axisx>
                                <axisy visibleinpanesserializable="-1">
                                    <tickmarks minorvisible="False" visible="False" />
                                    <label visible="False">
                                    </label>
                                    <range sidemarginsenabled="True" />
                                </axisy>
                                <secondaryaxesy>
                                    <cc1:SecondaryAxisY AxisID="0" Name="ValorQuebra" VisibleInPanesSerializable="-1">
                                        <tickmarks minorvisible="False" visible="False" />
                                        <label visible="False">
                                        </label>
                                        <range sidemarginsenabled="True" />
                                    </cc1:SecondaryAxisY>
                                </secondaryaxesy>
                            </cc1:XYDiagram>
                        </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

                        <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="7"></legend>
                        <seriesserializable>
                            <cc1:Series ArgumentDataMember="descProdutoSubgrupoLista" LabelsVisibility="True" Name="% Perda Sob Fat Bruto" ValueDataMembersSerializable="percQuebraFamilia">
                                <viewserializable>
                                    <cc1:SideBySideBarSeriesView>
                                    </cc1:SideBySideBarSeriesView>
                                </viewserializable>
                                <labelserializable>
                                    <cc1:SideBySideBarSeriesLabel Font="Tahoma, 7pt" LineVisible="True" Position="TopInside" TextPattern="{V:n2}">
                                        <fillstyle>
                                            <optionsserializable>
                                                <cc1:SolidFillOptions />
                                            </optionsserializable>
                                        </fillstyle>
                                        <pointoptionsserializable>
                                            <cc1:PointOptions>
                                                <valuenumericoptions format="Number" />
                                            </cc1:PointOptions>
                                        </pointoptionsserializable>
                                    </cc1:SideBySideBarSeriesLabel>
                                </labelserializable>
                                <legendpointoptionsserializable>
                                    <cc1:PointOptions>
                                        <valuenumericoptions format="Number" />
                                    </cc1:PointOptions>
                                </legendpointoptionsserializable>
                            </cc1:Series>
                            <cc1:Series ArgumentDataMember="descProdutoSubgrupoLista" LabelsVisibility="True" Name="% Participação do Valor da Perda sob Valor da Perda Total" ValueDataMembersSerializable="percPart">
                                <viewserializable>
                                    <cc1:SideBySideBarSeriesView Color="255, 128, 128">
                                    </cc1:SideBySideBarSeriesView>
                                </viewserializable>
                                <labelserializable>
                                    <cc1:SideBySideBarSeriesLabel Font="Tahoma, 7pt" LineVisible="True" Position="TopInside" TextPattern="{V:n2}">
                                        <fillstyle>
                                            <optionsserializable>
                                                <cc1:SolidFillOptions />
                                            </optionsserializable>
                                        </fillstyle>
                                        <pointoptionsserializable>
                                            <cc1:PointOptions>
                                                <valuenumericoptions format="Number" />
                                            </cc1:PointOptions>
                                        </pointoptionsserializable>
                                    </cc1:SideBySideBarSeriesLabel>
                                </labelserializable>
                                <legendpointoptionsserializable>
                                    <cc1:PointOptions>
                                        <valuenumericoptions format="Number" />
                                    </cc1:PointOptions>
                                </legendpointoptionsserializable>
                            </cc1:Series>
                            <cc1:Series ArgumentDataMember="descProdutoSubgrupoLista" LabelsVisibility="True" Name="Valor da Perda" ValueDataMembersSerializable="vlrTotalPerda">
                                <viewserializable>
                                    <cc1:LineSeriesView AxisYName="ValorQuebra" Color="Red" MarkerVisibility="True">
                                        <linestyle thickness="3" />
                                        <linemarkeroptions size="6" BorderVisible="True">
                                        </linemarkeroptions>
                                    </cc1:LineSeriesView>
                                </viewserializable>
                                <labelserializable>
                                    <cc1:PointSeriesLabel LineVisible="True" TextPattern="{V:n2}">
                                        <fillstyle>
                                            <optionsserializable>
                                                <cc1:SolidFillOptions />
                                            </optionsserializable>
                                        </fillstyle>
                                        <pointoptionsserializable>
                                            <cc1:PointOptions>
                                                <valuenumericoptions format="Number" precision="0" />
                                            </cc1:PointOptions>
                                        </pointoptionsserializable>
                                    </cc1:PointSeriesLabel>
                                </labelserializable>
                                <legendpointoptionsserializable>
                                    <cc1:PointOptions>
                                        <valuenumericoptions format="Number" precision="0" />
                                    </cc1:PointOptions>
                                </legendpointoptionsserializable>
                            </cc1:Series>
                        </seriesserializable>

<SeriesTemplate><ViewSerializable>
<cc1:SideBySideBarSeriesView></cc1:SideBySideBarSeriesView>
</ViewSerializable>
<LabelSerializable>
<cc1:SideBySideBarSeriesLabel LineVisible="True">
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>
<PointOptionsSerializable>
<cc1:PointOptions></cc1:PointOptions>
</PointOptionsSerializable>
</cc1:SideBySideBarSeriesLabel>
</LabelSerializable>
<LegendPointOptionsSerializable>
<cc1:PointOptions></cc1:PointOptions>
</LegendPointOptionsSerializable>
</SeriesTemplate>

<CrosshairOptions><CommonLabelPositionSerializable>
<cc1:CrosshairMousePosition></cc1:CrosshairMousePosition>
</CommonLabelPositionSerializable>
</CrosshairOptions>

<ToolTipOptions><ToolTipPositionSerializable>
<cc1:ToolTipMousePosition></cc1:ToolTipMousePosition>
</ToolTipPositionSerializable>
</ToolTipOptions>
                    </dxchartsui:WebChartControl>

                    <asp:SqlDataSource ID="dsGraph" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="Analises.uspPerda_GraficoFamilia" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter DbType="Date" Name="DiaInicial" SessionField="sDIA_INICIAL" />
                            <asp:SessionParameter DbType="Date" Name="DiaFinal" SessionField="sDIA_FINAL" />
                            <asp:SessionParameter Name="idFornecedor" SessionField="sFORNECEDOR" Type="Int32" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                            <asp:SessionParameter Name="CNPJ_Principal" SessionField="sCNPJ" Type="Byte" />
                            <asp:SessionParameter Name="Ativo" SessionField="sATIVO" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>


    </div>


    </asp:Content>

