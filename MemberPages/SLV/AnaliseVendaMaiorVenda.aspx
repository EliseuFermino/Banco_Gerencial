<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="AnaliseVendaMaiorVenda.aspx.vb" Inherits="MemberPages_SLV_AnaliseVendaMaiorVenda" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>

<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucMercadologicoNew.ascx" TagPrefix="uc1" TagName="wucMercadologicoNew" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divPeriodo {            
            float: left;              
            padding-left: 1px;        
        }

        #divBotaoAtualizar {
            float: left;
            padding-left: 10px;
            padding-top: 5px;  
        }

        
        #divDados {
            clear: both;
            float: left;  
            margin-left: 2px; 
            margin-top: 3px;  
            padding-right: 3px; 
            width: 100%;     
        }
             
        #divFilial {     
           float: left;    
           padding-left: 5px;          
        }

        #divSize {     
           float: left;            
           padding-top: 5px;
           margin-left : 5px; 
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
 
    <div id="ShowButton" class="BGC_myBorder ">
        <uc1:wucMercadologicoNew runat="server" id="cboMercadologico" />
    </div>

    <div id="divPeriodo" class="BGC_myBorder ">
        <uc1:wucListaDiaIniFin runat="server" ID="cboDia" />
    </div>

    <div id="divFilial" class="BGC_myBorder ">
            <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" AutoPostBack="false" />
        </div>

    <div id="divBotaoAtualizar" class="BGC_myBorder ">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme ="MetropolisBlue">
            <ClientSideEvents Click="function(s, e) {
	cbPanelGrid.PerformCallback();
}" />
        </dx:ASPxButton>
    </div>
    


    <div id="divSize" class="BGC_myBorder ">
        <uc1:wucSize runat="server" ID="cboSize" />
    </div>

    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cbPanelGrid" runat="server" Width="100%" ClientInstanceName ="cbPanelGrid" Theme ="Metropolis" SettingsLoadingPanel-Text ="Atualizando...">
            <PanelCollection>
                <dx:PanelContent ID="PanelContent1"  runat="server" SupportsDisabledAttributes="both">
 

                        <dx:ASPxGridView ID="grid" runat="server" 
                            DataSourceID="SqlDataSource1" AutoGenerateColumns="False" 
                            EnableTheming="True" Theme="SoftOrange" Width="100%" 
                            KeyFieldName="CodProduto" Visible="False">
                            <Toolbars>
                            <dx:GridViewToolbar EnableAdaptivity="true">
                                <Items>
                                    <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                                    <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                                    <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação"  />
                                </Items>
                            </dx:GridViewToolbar>
                        </Toolbars>
                            <TotalSummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Lucro" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroSO" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroFinal" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSO" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinal" SummaryType="Custom" />
                            </TotalSummary>
                            <GroupSummary>
                                <dx:ASPxSummaryItem DisplayFormat="Total de produtos: {0:n0}" FieldName="idProduto" SummaryType="Count" />
                            </GroupSummary>
                            <Columns>                                           
                                <dx:GridViewCommandColumn ShowInCustomizationForm="True" Visible="False" VisibleIndex="0" ShowClearFilterButton="True"/>
                                <dx:GridViewDataTextColumn FieldName="nomeProduto" VisibleIndex="3" 
                                    Caption="Descrição do Produto" Width="190px" 
                                    ToolTip="Descrição do produto" FixedStyle="Left">
                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                    <CellStyle Wrap="False">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                </dx:GridViewDataTextColumn> 
                                <dx:GridViewBandColumn Caption="Sell-Out" VisibleIndex="6" ToolTip="Quadrante de Informações de Sell-Out">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemSO" ShowInCustomizationForm="True" ToolTip="Percentual do Sellout" VisibleIndex="2" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="True" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="LucroSO" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="True" AutoFilterCondition="NotEqual" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                           
                                <dx:GridViewBandColumn Caption="Margem Praticada" VisibleIndex="5" ToolTip="Quadrante de Margem Praticada">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargem" ShowInCustomizationForm="True" VisibleIndex="3" Width="80px" ToolTip="Percentual de margem do ano atual ">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="True" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="Lucro" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="True" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                           
                                <dx:GridViewBandColumn Caption="Ano Atual" Name="bandAnoAtual" ShowInCustomizationForm="True" VisibleIndex="4">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVenda" ShowInCustomizationForm="True" SortIndex="0" SortOrder="Descending" ToolTip="Valor da venda do ano atual" VisibleIndex="1" Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="True" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Vol" FieldName="Qtde" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="0" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                           
                                <dx:GridViewBandColumn Caption="Outras Informações" Name="bandCrescimento" ShowInCustomizationForm="True" VisibleIndex="11">
                                    <Columns>
<dx:GridViewDataTextColumn FieldName="numCliente" UnboundType="Decimal" ShowInCustomizationForm="True" Width="70px" Caption="Clientes" ToolTip="Número de Clientes que compraram o item" VisibleIndex="1">
<PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>

    <Settings AllowAutoFilter="False" />

<CellStyle Wrap="False"></CellStyle>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="percPartAT" ShowInCustomizationForm="True" Width="60px" Caption="% Part" VisibleIndex="0" UnboundType="Decimal" ToolTip="Percentual de participação de venda do item sobre o total.">
<PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>

    <Settings AllowAutoFilter="False" />

</dx:GridViewDataTextColumn>
                                    </Columns>
                                    
                                </dx:GridViewBandColumn>
                                           
                                <dx:GridViewDataTextColumn FieldName="CodProduto" VisibleIndex="2" 
                                    Caption="Código" Width="60px" ToolTip="Código do produto" FixedStyle="Left">
                                    <PropertiesTextEdit EncodeHtml="False"></PropertiesTextEdit>
                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                           
                                <dx:GridViewBandColumn Caption="Margem Final" ShowInCustomizationForm="True" ToolTip="Quadrante de Informações de Margem Final" VisibleIndex="7">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrLucroFinal" ShowInCustomizationForm="True" ToolTip="Valor da margem Final" VisibleIndex="0" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemFinal" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Final" VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                           
                                <dx:GridViewDataTextColumn FieldName="rnkProdAT" VisibleIndex="1" Caption="Pos" 
                                    Width="40px" ToolTip="Posição no ranking" FixedStyle="Left">
                                    <Settings AllowAutoFilter="False" />
                                </dx:GridViewDataTextColumn>
                                           
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                            <SettingsPager PageSize="15">
                                <Summary AllPagesText="Página: {0} - {1} ({2} produtos)" Text="Página {0} of {1} ({2} produtos)" />
                            </SettingsPager>
                             <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                            <SettingsLoadingPanel Text="Atualizando&amp;hellip;" />
                            <Styles>
	                            <FocusedRow BackColor="#CCFFFF" ForeColor="#333333"> </FocusedRow>
	                                <Header HorizontalAlign="Center">
                                </Header>
	                                <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                <Footer Font-Bold="True">
                                </Footer>
                            </Styles>                                       
                            <Settings UseFixedTableLayout="True" 
                                ShowVerticalScrollBar="True" VerticalScrollableHeight="350" HorizontalScrollBarMode="Auto" ShowFilterBar="Auto" ShowFilterRow="True" ShowFooter="True" ShowFilterRowMenu="True" />
                            <SettingsText EmptyDataRow="Não há informações disponiveis ainda para esse período e fornecedor" 
                                GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" FilterBarClear="Limpar"                                             />
                        </dx:ASPxGridView>



                       <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" 
                            SelectCommand="Analises.uspBuscarTodosItens_AnoAtual" SelectCommandType="StoredProcedure"  EnableCaching="true" >
                            <SelectParameters>
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                <asp:SessionParameter Name="DiaInicial" SessionField="sDIA_INICIAL" DbType="Date" />
                                <asp:SessionParameter Name="DiaFinal" SessionField="sDIA_FINAL" DbType="Date" />
                                <asp:SessionParameter Name="idMercadologico" SessionField="sMERCADOLOGICO" Type="Int16" />
                                <asp:SessionParameter Name="vOpcao" SessionField="sOPCAO" Type="Byte" />
                                <asp:SessionParameter Name="MesmosDias" SessionField="sMESMOSDIAS" Type="Byte" />
                                <asp:SessionParameter Name="Compara" SessionField="sCOMPARA" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    <asp:Label ID="lblError" runat="server" Text="" ForeColor ="Red" ></asp:Label>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>

    
</asp:Content>


