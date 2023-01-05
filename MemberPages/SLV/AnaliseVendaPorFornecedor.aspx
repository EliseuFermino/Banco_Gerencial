<%@ Page Title="Fornecedor - Análise de Vendas por Seção" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="AnaliseVendaPorFornecedor.aspx.vb" Inherits="MemberPages_SLV_AnaliseVendaPorFornecedor" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<%@ Register src="../../Controles/wucListaDiaIniFin.ascx" tagname="wucListaDiaIniFin" tagprefix="uc1" %>




<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>


<%@ Register src="../../Controles/wucBotaoExcel.ascx" tagname="wucBotaoExcel" tagprefix="uc4" %>

<%@ Register src="../../Controles/wucFornecedor.ascx" tagname="wucFornecedor" tagprefix="uc8" %>
<%@ Register Src="~/Controles/wucMercadologico.ascx" TagPrefix="uc1" TagName="wucMercadologico" %>
<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc2" TagName="wucListaDiaIniFin" %>
<%@ Register Src="~/Controles/wucFixarCabecalho.ascx" TagPrefix="uc1" TagName="wucFixarCabecalho" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type="text/css">

        #divFornecedor {
            float: left;
            margin-left: 2px;
        }

        #divMercadologico {
            float: left;
            margin-left: 2px; 
            margin-top: 6px;      
        }

        #divPeriodo {
            float: left;
            margin-left: 20px;
            margin-top: 6px; 
        }

        #divBotaoAtualizar {
            float: left;
            margin-left: 10px;
            margin-top: 2px;
        }

        #divBotaoExcel {
            float: left;
            margin-left: 10px;
            margin-top: 2px;        
        }

        #divCNPJ_Principal { 
           clear: both;   
           float: left;                                
           padding-left: 2px;                                        
        }

        #divFixarCabecalho {
            float: left;
            margin-left: 30px;           
        }

        #divExibirMargem {
            float: left;
            margin-left: 30px;            
        }

        #divDados {      
            clear: both;              
            margin-left: 2px;            
        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divFornecedor">
        <uc8:wucFornecedor ID="txtFornecedor" runat="server" />
    </div>

    <div id="divMercadologico">
        <uc1:wucMercadologico runat="server" ID="cboMercadologico" Visible="True" />
    </div>

    <div id="divPeriodo">
        <uc2:wucListaDiaIniFin runat="server" ID="cboPeriodo" />
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" AllowFocus="False" Text="Atualizar" Theme="Metropolis" AutoPostBack="False">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />                                       
        </dx:ASPxButton>
    </div>

    <div id="divBotaoExcel">
        <uc4:wucBotaoExcel ID="btnExcel" runat="server" CallGridViewID ="grid" />
    </div>

    <div id="divCNPJ_Principal">
            <dx:ASPxCheckBox ID="chkCNPJ_Principal" runat="server" Text ="Base CNPJ" CheckState="Unchecked">
                <ClientSideEvents CheckedChanged="function(s, e) {
	cbPanel.PerformCallback();
}" />
            </dx:ASPxCheckBox>
        </div>

    <div id="divFixarCabecalho">
        <dx:ASPxCheckBox ID="chkFixarCabecalho" runat="server" 
            Checked="False" CheckState="Checked" Text="Fixar cabeçalho" Theme="DevEx">
            <ClientSideEvents CheckedChanged="function(s, e) {	cbPanel.PerformCallback();}" />
        </dx:ASPxCheckBox>
    </div>

    <div id="divExibirMargem">
        <dx:ASPxCheckBox ID="chkExibirMargem" runat="server" 
            Checked="True" CheckState="Checked" Text="Exibir Margem" Theme="DevEx" ClientInstanceName="chkExibirMargem">
            <ClientSideEvents CheckedChanged="function(s, e) {

	cbPanel.PerformCallback();
}" />
        </dx:ASPxCheckBox>
    </div>

    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cbPanel" ClientInstanceName="cbPanel" runat="server" SettingsLoadingPanel-Text="Aguarde. Atualizando informações...&amp;hellip;">
            <PanelCollection>
                <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttribute="Both">                            
                  
                    <dx:ASPxGridView ID="grid" runat="server" 
                        DataSourceID="SqlDataSource1" AutoGenerateColumns="False" 
                        EnableTheming="True" Theme="SoftOrange" Width="1000px" 
                        KeyFieldName="idFilial" Visible="False" ClientInstanceName="grid">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAT" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAT" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescQtde" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAT" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargem" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSellOutAA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSellOutAT" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargemSellOut" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescLucro" SummaryType="Custom" />
                        </TotalSummary>
                        <Columns>                                           
                            <dx:GridViewBandColumn Caption="Volume" ShowInCustomizationForm="True" VisibleIndex="1">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Ano Anterior" FieldName="QtdeAA" ShowInCustomizationForm="True" ToolTip="Quantidade do Ano Anterior (mesmo período)" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="#CC9900" />
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Ano Atual" FieldName="QtdeAT" ShowInCustomizationForm="True" ToolTip="Quantidade vendida do período selecionado" VisibleIndex="1" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="#3399FF" />
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescQtde" ShowInCustomizationForm="True" VisibleIndex="2" Width="65px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn FieldName="descFilial" VisibleIndex="0" 
                                Caption="Filial" Width="140px" FixedStyle="Left">
                                <CellStyle Wrap="False">
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                </CellStyle>
                                <FooterCellStyle>
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                </FooterCellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Vendas (R$)" ShowInCustomizationForm="True" VisibleIndex="2">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Ano Anterior" FieldName="vlrVendaAA" ShowInCustomizationForm="True" ToolTip="Valor da venda do ano anterior (mesmo período)" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="#CC9900" />
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Ano Atual" FieldName="vlrVendaAT" ShowInCustomizationForm="True" ToolTip="Valor de venda do período selecionado" VisibleIndex="1" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="#3399FF" />
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc" ShowInCustomizationForm="True" ToolTip="Percentual de crescimento entre periodo atual e periodo do ano anterior" VisibleIndex="2" Width="65px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc. Total Filial" FieldName="percCrescLucro" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento Venda Total da Filial" VisibleIndex="3" Width="100px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n02}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="#009900" />
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Margem " ShowInCustomizationForm="True" VisibleIndex="3" Name="bandMargem">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Ano Anterior" FieldName="percMargemAA" ShowInCustomizationForm="True" ToolTip="Percentual de margem do ano anterior (mesmo período)" VisibleIndex="0" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="#CC9900" />
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Ano Atual" FieldName="percMargemAT" ShowInCustomizationForm="True" ToolTip="Percentual de margem do período selecionado" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="#3399FF" />
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Dif." FieldName="difMargem" ShowInCustomizationForm="True" ToolTip="Diferença entre a margem deste ano com a do ano passado." VisibleIndex="2" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                                           
                            <dx:GridViewBandColumn Caption="Margem com SellOut" Name="bandMargemComSellOut" ShowInCustomizationForm="True" VisibleIndex="13">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Ano Anterior" FieldName="percMargemSellOutAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="#CC9900" />
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Ano Atual" FieldName="percMargemSellOutAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="#3399FF" />
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Dif." FieldName="difMargemSellOut" ShowInCustomizationForm="True" ToolTip="Diferença entre a margem com Sell-Out deste ano com a do ano passado." VisibleIndex="2" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                                           
                            <dx:GridViewDataTextColumn FieldName="Tipo" SortIndex="0" SortOrder="Ascending" 
                                VisibleIndex="12" Visible="False">
                            </dx:GridViewDataTextColumn>
                                           
                            <dx:GridViewDataTextColumn FieldName="idFilial" SortIndex="1" 
                                SortOrder="Ascending" VisibleIndex="15" Visible="False">
                            </dx:GridViewDataTextColumn>
                                           
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Styles>
	                        <FocusedRow BackColor="#CCFFFF" ForeColor="#333333"> </FocusedRow>
	                            <Header HorizontalAlign="Center">
                            </Header>
	                            <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                            <Footer Font-Bold="True">
                            </Footer>
                        </Styles>                                       
                        <Settings VerticalScrollableHeight="400" VerticalScrollBarMode="Visible" HorizontalScrollBarMode="Visible" ShowFooter="True" />
                        <SettingsText EmptyDataRow="Não há informações disponiveis ainda para esse período e fornecedor"                                             />
                    </dx:ASPxGridView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                        SelectCommand="SLV.usp_BuscarAnaliseAnoAnterior" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Usuario" SessionField="sUSUARIO" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                           
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>

    </div>   

</asp:Content>

