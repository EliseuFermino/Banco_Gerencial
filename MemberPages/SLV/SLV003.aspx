<%@ Page Title="Ranking de Vendas por Grupo" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="SLV003.aspx.vb" Inherits="MemberPages_SLV_SLV003" %>



<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>







<%@ Register src="../../Controles/wucBotaoExcel.ascx" tagname="wucBotaoExcel" tagprefix="uc4" %>

<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>


<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">           


        #divPeriodo {
           float: left;
           margin-left: 2px;                    
           padding-left: 5px;
        }

        #divFilial {     
           float: left;     
         
           padding-left: 2px;               
 
        }
   
          #divBotaoAtualizar { 
            float: left;           
            margin-left: 2px;         
            padding-top: 4px; 
            padding-left: 5px;                                         
        }

           
        #divGrid {
            clear: both;
            padding-top: 3PX;
        }

        #divOpcaoExibir {            
            margin-left: 2px;
            width: 805px;  
            padding-top: 2px; 
            margin-left: 1px;                                
        }

        #divExibir_AnoAnterior {
            clear: both;
            float: left;   
        }


        #divExibir_AnoAtual {            
            margin-left: 2px;
            width: 155px;  
            padding-top: 2px; 
            margin-left: 158px; 
            margin-top: -24px;                               
        }

        #divExibir_MargemPraticada { 
            float: left;           
            margin-left: 2px;
            width: 155px;  
            padding-top: 2px; 
            margin-left: 328px; 
            margin-top: -24px;                               
        }

        #divExibir_SellOut { 
            float: left;           
            margin-left: 2px;
            width: 155px;  
            padding-top: 2px; 
            margin-left: 518px; 
            margin-top: -24px;                               
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


        <div id="divPeriodo" class="BGC_myBorder ">
            <uc1:wucListaDiaIniFin runat="server" ID="cboPeriodo" />
        </div>

        <div id="divFilial" class="BGC_myBorder ">
            <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" AutoPostBack="false" />
        </div>

        <div id="divBotaoAtualizar" class="BGC_myBorder " >
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" Theme="MetropolisBlue" AutoPostBack="false" Height="32px"> 
                <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
            </dx:ASPxButton>
        </div>


        <div id="divOpcaoExibir">
            <div id="divExibir_AnoAnterior">

                <dx:ASPxCheckBox ID="chkMostrar_AA" runat="server" Text="Exibir Ano Anterior" Theme="DevEx" CheckState="Unchecked" Width="150px" >
                    <ClientSideEvents CheckedChanged="function(s, e) {	cbPanel.PerformCallback();}" />
                </dx:ASPxCheckBox> 
            </div>

            <div id="divExibir_AnoAtual">
                <dx:ASPxCheckBox ID="chkMostrar_AT" runat="server" Text="Exibir Ano Atual" Theme="DevEx" CheckState="Checked" Width="150px" >
                    <ClientSideEvents CheckedChanged="function(s, e) {	cbPanel.PerformCallback();}" />
                </dx:ASPxCheckBox> 
            </div>

            <div id="divExibir_MargemPraticada">
                <dx:ASPxCheckBox ID="chkMostrar_MargemPraticada" runat="server" Text="Exibir Margem Praticada" Theme="DevEx" CheckState="Unchecked" Width="250px"  Visible ="true" >
                    <ClientSideEvents CheckedChanged="function(s, e) {	cbPanel.PerformCallback();}" />
                </dx:ASPxCheckBox> 
            </div>

            <div id="divExibir_SellOut">
                <dx:ASPxCheckBox ID="chkMostrar_SellOut" runat="server" Text="Exibir SellOut" Theme="DevEx" CheckState="Unchecked" Width="150px"  Visible ="true" >
                    <ClientSideEvents CheckedChanged="function(s, e) {	cbPanel.PerformCallback();}" />
                </dx:ASPxCheckBox> 
            </div>
            
        </div>

        <div id="divGrid">
            <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde">
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttributes="both">

                        <dx:ASPxGridView ID="grid" runat="server" 
                            DataSourceID="SqlDataSource1" AutoGenerateColumns="False" 
                            EnableTheming="True" Theme="SoftOrange" Width="100%" 
                            KeyFieldName="descProdutoGrupoLista" Visible="False">
                            <Toolbars>
                            <dx:GridViewToolbar EnableAdaptivity="true">
                                <Items>
                                    <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                                    <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                                    <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação"  />
                                </Items>
                            </dx:GridViewToolbar>
                        </Toolbars>
                            <GroupSummary>
                                <dx:ASPxSummaryItem DisplayFormat="Total de produtos: {0:n0}" FieldName="idProduto" SummaryType="Count" />
                            </GroupSummary>
                            <Columns>                                           

                               <%--Posiacao AA--%>        

                                <%--Posiacao AT--%>

                                <%--Descricao do Grupo--%>
                                <dx:GridViewCommandColumn ShowInCustomizationForm="True" Visible="False" VisibleIndex="0" ShowClearFilterButton="True"/>

                                <dx:GridViewDataTextColumn FieldName="rnkVendaProduto_AA" VisibleIndex="1" 
                                    Caption="Pos AA" Width="50px" ToolTip="Posição no ranking no Ano Anterior" FixedStyle="Left">
                                    <Settings AllowAutoFilter="False" />
                                </dx:GridViewDataTextColumn>

                                <dx:GridViewDataTextColumn Caption="Pos AT" FieldName="rnkVendaProduto_AT" ShowInCustomizationForm="True" 
                                    ToolTip="Posição no ranking no Ano Atual" VisibleIndex="2" Width="50px" FixedStyle="Left">
                                    <Settings AllowAutoFilter="False" />
                                </dx:GridViewDataTextColumn>

                                <dx:GridViewDataTextColumn FieldName="descProdutoGrupoLista" VisibleIndex="3" 
                                    Caption="Descrição do Grupo" Width="190px" 
                                    ToolTip="Descrição do Grupo" FixedStyle="Left">
                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                    <CellStyle Wrap="False">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                </dx:GridViewDataTextColumn> 
                                                                           

                                <dx:GridViewBandColumn Caption="Ano Anterior" VisibleIndex="4" Visible="False" Name="bandAnoAnterior">
                                    <Columns>
                                        <dx:GridViewBandColumn Caption="Vendas" ShowInCustomizationForm="True" VisibleIndex="2">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde_AA" ShowInCustomizationForm="True" ToolTip="Volume de venda do ano anterior" VisibleIndex="0" Width="80px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                    <HeaderStyle BackColor="#CC9900" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVenda_AA" ShowInCustomizationForm="True" ToolTip="Valor de venda do ano anterior" VisibleIndex="1" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                    <HeaderStyle BackColor="#CC9900" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:GridViewBandColumn>
                                        <dx:GridViewBandColumn Caption="Margem Praticada" ShowInCustomizationForm="True" VisibleIndex="3" Name="bandMargemPraticada_AA" Visible="False">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="R$" FieldName="Lucro_AA" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                    <HeaderStyle BackColor="#CC9900" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="percMargem_AA" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                    <HeaderStyle BackColor="#CC9900" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:GridViewBandColumn>
                                        <dx:GridViewBandColumn Caption="SellOut" ShowInCustomizationForm="True" VisibleIndex="4" Name="bandSellOut_AA" Visible="False">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="R$" FieldName="LucroSO_AA" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                    <HeaderStyle BackColor="#CC9900" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemSO_AA" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                    <HeaderStyle BackColor="#CC9900" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:GridViewBandColumn>
                                        <dx:GridViewBandColumn Caption="Margem Final" ShowInCustomizationForm="True" VisibleIndex="5">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrLucroFinal_AA" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                    <HeaderStyle BackColor="#CC9900" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemFinal_AA" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                    <HeaderStyle BackColor="#CC9900" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:GridViewBandColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                                                           

                                <dx:GridViewBandColumn Caption="Ano Atual" ShowInCustomizationForm="True" ToolTip="Quadrante de Informações do Ano Atual" VisibleIndex="5" Name="bandAnoAtual">
                                    <Columns>
                                        <dx:GridViewBandColumn Caption="Vendas" Name="bandAnoAtual" ShowInCustomizationForm="True" VisibleIndex="0">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde_AT" ShowInCustomizationForm="True" ToolTip="Quantidade do Ano Atual" VisibleIndex="0" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                    <HeaderStyle BackColor="#3399FF" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVenda_AT" ShowInCustomizationForm="True" SortIndex="0" SortOrder="Descending" ToolTip="Valor da venda do ano atual" VisibleIndex="1" Width="100px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                    <HeaderStyle BackColor="#3399FF" />
                                                    <CellStyle ForeColor="Blue">
                                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:GridViewBandColumn>
                                        <dx:GridViewBandColumn Caption="Margem Praticada" ShowInCustomizationForm="True" VisibleIndex="1" Name="bandMargemPraticada_AT" Visible="False">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="R$" FieldName="Lucro_AT" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                    <HeaderStyle BackColor="#3399FF" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="percMargem_AT" ShowInCustomizationForm="True" ToolTip="Percentual de margem do ano atual " UnboundType="Decimal" VisibleIndex="1" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                    <HeaderStyle BackColor="#3399FF" />
                                                    <CellStyle>
                                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:GridViewBandColumn>
                                        <dx:GridViewBandColumn Caption="SellOut" ShowInCustomizationForm="True" VisibleIndex="2" Name="bandSellOut_AT" Visible="False">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="R$" FieldName="LucroSO_AT" ShowInCustomizationForm="True" ToolTip="Valor do SellOut" VisibleIndex="0" Width="80px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                    <HeaderStyle BackColor="#3399FF" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemSO_AT" ShowInCustomizationForm="True" ToolTip="Percentual do SellOut" VisibleIndex="1" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                    <HeaderStyle BackColor="#3399FF" />
                                                    <CellStyle>
                                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:GridViewBandColumn>
                                        <dx:GridViewBandColumn Caption="Margem Final" ShowInCustomizationForm="True" VisibleIndex="3">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrLucroFinal_AT" ShowInCustomizationForm="True" ToolTip="Valor do Lucro Final (Lucro Praticado + SellOut)" VisibleIndex="0" Width="80px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                    <HeaderStyle BackColor="#3399FF" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemFinal_AT" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Final (% da Margem Praticada + % do SellOut)" VisibleIndex="1" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                    <HeaderStyle BackColor="#3399FF" />
                                                    <CellStyle>
                                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:GridViewBandColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>

 
                                <dx:GridViewDataTextColumn Caption="Seção" FieldName="descProdutoSecaoLista" ShowInCustomizationForm="True" ToolTip="Descrição da seção" VisibleIndex="11" Width="150px">
                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                           

                                           
                                <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="partVenda" ShowInCustomizationForm="True" ToolTip="Percentual de crescimento de venda" VisibleIndex="9" Width="70px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <Settings AllowAutoFilter="False" />
                                    <CellStyle>
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                           

                                           
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                            <SettingsPager PageSize="15">
                                <Summary AllPagesText="Página: {0} - {1} ({2} grupos)" Text="Página {0} of {1} ({2} grupos)" />
                            </SettingsPager>
                            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                            <Styles>
	                            <FocusedRow BackColor="#CCFFFF" ForeColor="#333333"> </FocusedRow>
	                                <Header HorizontalAlign="Center">
                                </Header>
	                                <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                            </Styles>                                       
                            <Settings ShowGroupPanel="True" UseFixedTableLayout="True" 
                                ShowVerticalScrollBar="True" VerticalScrollableHeight="350" HorizontalScrollBarMode="Auto" ShowFilterBar="Auto" ShowFilterRow="True" />
                            <SettingsText EmptyDataRow="Não há informações disponiveis ainda para esse período e fornecedor" 
                                GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" FilterBarClear="Limpar"                                             />
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" 
                            SelectCommand="Vendas_Mes.uspSLV003" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="diaInicial" SessionField="sDIA_INICIAL" DbType="Date" />
                                <asp:SessionParameter Name="diaFinal" SessionField="sDIA_FINAL" DbType="Date" />
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </div>

  

</asp:Content>

