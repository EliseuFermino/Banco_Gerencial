<%@ Page Title="Analise de Vendas - TOP 300 por Seção" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="AnaliseVendaMaiorTop1000.aspx.vb" Inherits="MemberPages_SLV_AnaliseVendaMaiorTop1000" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc6" %>
<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc7" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>





<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">           
   
        #divAno {
           float: left;                   
        }

        #divMes {
           float: left;
           margin-left: 1px;           
                
        }

        #divFilial {     
           float: left;       
           padding-left: 2px;               
 
        }

          #divBotaoAtualizar { 
            float: left;           
            margin-left: 2px;        
            padding-top: 2px;  
            padding-left: 5px;                                        
        }

        #divAnoAnterior {
           float: left; 
           margin-left: 15px;
           padding-top : 7px;
        }

        #divGrid {
            float: left;
            clear: both;
            padding-top: 3PX;
            width: 100%;
        }



    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
        <div id="divAno" class="BGC_myBorder ">
           <uc7:wucAno ID="cboAno" runat="server" AutoPostBack="false" /> 
        </div>

        <div id="divMes" >
            <uc6:wuciListaMes ID="cboMes" runat="server" AutoPostBack ="false"  />
        </div>

        <div id="divFilial" class="BGC_myBorder ">
            <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" AutoPostBack="false" />
        </div>

        <div id="divBotaoAtualizar" class="BGC_myBorder " >
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" Theme="MetropolisBlue" AutoPostBack="false" Height="32px"> 
                <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
            </dx:ASPxButton>
        </div>
    
        <div id="divAnoAnterior">
            <dx:ASPxCheckBox ID="chkAnoAnterior" runat="server" Text="Exibir Ano Anterior" CheckState="Unchecked" Theme="DevEx">
                <ClientSideEvents CheckedChanged="function(s, e) {
	cbPanel.PerformCallback();
}" />
            </dx:ASPxCheckBox>
        </div>

        <div id="divGrid">
            <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde">
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttributes="both">

                        <dx:ASPxGridView ID="grid" runat="server" 
                            DataSourceID="SqlDataSource1" AutoGenerateColumns="False" 
                            EnableTheming="True" Theme="SoftOrange" Width="100%" 
                            KeyFieldName="idProduto" Visible="False">
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
                                <dx:GridViewDataTextColumn FieldName="nomeProduto" VisibleIndex="3" 
                                    Caption="Descrição do Produto" Width="190px" 
                                    ToolTip="Descrição do produto" FixedStyle="Left">
                                    <CellStyle Wrap="False">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                </dx:GridViewDataTextColumn> 
                                <dx:GridViewBandColumn Caption="Ano Anterior" Name="bandAnoAnterior" VisibleIndex="4" Visible="False">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="qAA" ShowInCustomizationForm="True" ToolTip="Quantidade do Ano Anterior (mesmo período)" VisibleIndex="0" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#CC9900" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vAA" ShowInCustomizationForm="True" ToolTip="Valor da venda do ano anterior (mesmo período)" VisibleIndex="1" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#CC9900" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Marg" FieldName="pmAA" ShowInCustomizationForm="True" ToolTip="Percentual de margem do ano anterior (mesmo período)" VisibleIndex="3" Width="60px" UnboundType="Decimal">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#CC9900" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="mAA" VisibleIndex="2" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#CC9900" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Ano Atual" Name="bandAnoAtual" VisibleIndex="6">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="qAT" ShowInCustomizationForm="True" ToolTip="Quantidade do Ano Atual" VisibleIndex="0" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#3399FF" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vAT" ShowInCustomizationForm="True" SortIndex="0" SortOrder="Descending" ToolTip="Valor da venda do ano atual" VisibleIndex="1" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#3399FF" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Marg" FieldName="pmAT" ShowInCustomizationForm="True" ToolTip="Percentual de margem do ano atual " VisibleIndex="3" Width="60px" UnboundType="Decimal">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#3399FF" />
                                            <CellStyle ForeColor="Blue">
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="mAT" VisibleIndex="2" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#3399FF" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                           
                                <dx:GridViewBandColumn Caption="Crescimento em %" Name="bandCrescimento" ShowInCustomizationForm="True" VisibleIndex="11">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="percCresc" ShowInCustomizationForm="True" ToolTip="Percentual de crescimento entre periodo atual e periodo do ano anterior" UnboundType="Decimal" VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Vol" FieldName="percCrescQtde" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="0" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="percCrescLucro" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                           
                                <dx:GridViewDataTextColumn FieldName="idProduto" VisibleIndex="2" 
                                    Caption="Código" Width="60px" ToolTip="Código do produto" FixedStyle="Left">
                                    <PropertiesTextEdit EncodeHtml="False"></PropertiesTextEdit>
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                           
                                <dx:GridViewDataTextColumn FieldName="Rnk" VisibleIndex="1" Caption="Pos" 
                                    Width="40px" ToolTip="Posição no ranking" FixedStyle="Left">
                                </dx:GridViewDataTextColumn>
                                           
                                <dx:GridViewBandColumn Caption="Mercadológico" Name="bandMercadologico" ShowInCustomizationForm="True" VisibleIndex="14">
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="Depto" ShowInCustomizationForm="True" VisibleIndex="0" Width="75px">
                                            <HeaderStyle BackColor="#999966" />
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Seção" FieldName="Secao" ShowInCustomizationForm="True" VisibleIndex="1" Width="75px">
                                            <HeaderStyle BackColor="#999966" />
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Grupo" FieldName="Grupo" ShowInCustomizationForm="True" ToolTip="Grupo do produto (Arraste para cima para analisar por grupo)" VisibleIndex="2" Width="75px">
                                            <PropertiesTextEdit Width="100px">
                                            </PropertiesTextEdit>
                                            <EditCellStyle Wrap="False">
                                            </EditCellStyle>
                                            <FilterCellStyle Wrap="False">
                                            </FilterCellStyle>
                                            <EditFormCaptionStyle Wrap="False">
                                            </EditFormCaptionStyle>
                                            <HeaderStyle BackColor="#999966" Wrap="False" />
                                            <CellStyle HorizontalAlign="Left" Wrap="False">
                                            </CellStyle>
                                            <FooterCellStyle Wrap="False">
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle Wrap="False">
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Sub-Grupo" FieldName="Subgrupo" ShowInCustomizationForm="True" ToolTip="Sub-grupo do produto (Arraste para cima para analisar por sub-grupo)" VisibleIndex="3" Width="75px">
                                            <HeaderStyle BackColor="#999966" />
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle BackColor="#999966" />
                                </dx:GridViewBandColumn>
                                           
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                            <SettingsPager PageSize="15">
                                <Summary AllPagesText="Página: {0} - {1} ({2} produtos)" Text="Página {0} of {1} ({2} produtos)" />
                            </SettingsPager>
                             <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                            <Styles>
	                            <FocusedRow BackColor="#CCFFFF" ForeColor="#333333"> </FocusedRow>
	                                <Header HorizontalAlign="Center">
                                </Header>
	                                <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                            </Styles>                                       
                            <Settings ShowGroupPanel="True" UseFixedTableLayout="True" 
                                ShowVerticalScrollBar="True" VerticalScrollableHeight="350" HorizontalScrollBarMode="Auto" />
                            <SettingsText EmptyDataRow="Não há informações disponiveis ainda para esse período e fornecedor" 
                                GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar"                                             />
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" 
                            SelectCommand="Analises.uspBuscarTop1000" SelectCommandType="StoredProcedure" EnableCaching="true">
                            <SelectParameters>
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />                            
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </div>

   
</asp:Content>

