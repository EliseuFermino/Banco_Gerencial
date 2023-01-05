<%@ Page Title="Análise de Quebra" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="appQuebras008_.aspx.vb" Inherits="MemberPages_Quebras_appQuebras008_" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>




<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucFornecedor.ascx" TagPrefix="uc1" TagName="wucFornecedor" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divCNPJ_Principal { 
           clear: both;   
           float: left;                                
           padding-left: 2px;   
           padding-top: 7px;                                      
        }

        #divFornecedor {            
            float: left;
            margin-left: 10px;
            width: 600px;
            margin-top: 2px;
        }

        #ShowButton {
            float: left;
            margin-left: 2px;
            width: 115px;  
            padding-top: 2px;                      
        }

        #divPeriodo {            
            float: left;    
            padding-top: 5px;        
        }

        #divBotaoAtualizar {
            float: left;
            margin-left: 5px;
            padding-top: 2px;  
        }

        #divFixarCabecalho {
            float: left;
            margin-left: 5px;
            padding-top: 3px; 
        }

        #divExcel {
            float: left;
            margin-left: 15px;
            padding-top: 1px; 
        }

        #divSize {
            float: left;
            margin-left: 15px;
            padding-top: 1px; 
        }

        #divDados {
            clear: both;
            float: left;  
            margin-left: 2px; 
            margin-top: 1px;    
            width: 100%;    
        }

        #divMercadologico_Total {
            float: left;           
        }

        #divMercadologico_Departamento {
            float: left;
            margin-left: 15px;
        }

        #divMercadologico_Secao {
            float: left;
            margin-left: 15px;
        }

        #divMercadologico_Grupo {
            float: left;
            margin-left: 15px;
        }

        #divMercadologico_Subgrupo {
            float: left;
            margin-left: 15px;
        }

        #divLista_Departamento {
            clear: both;
            float: left;
        }

        #divLista_Secao {            
            float: left;
            padding-left: 5px;
        }

        #divLista_Grupo {            
            float: left;
            padding-left: 5px;
        }

        #divLista_Subgrupo {            
            float: left;
            padding-left: 5px;
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <div id="ShowButton" >
        <dx:ASPxButton ID="btnShowButton" runat="server" Text="Mercadologico" AutoPostBack="false" Width="50px"
            Theme="SoftOrange" ClientInstanceName="meuBotao" ClientSideEvents-Click="function(s, e) { MudarTextoBotao(); }">
        </dx:ASPxButton>
    </div>

    <div id="divPeriodo">
        <uc1:wucListaDiaIniFin runat="server" ID="cboDia" AutoPostBack_cboDiaFinal="false" AutoPostBack_cboDiaInicial="false"  />
    </div>    

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme ="Metropolis">
            <ClientSideEvents Click="function(s, e) {
	cbPanelGrid.PerformCallback();
}" />
        </dx:ASPxButton>
    </div>

    <div id="divFixarCabecalho">
        <dx:ASPxCheckBox ID="chkFixarCabecalho" runat="server" Theme ="DevEx" Text ="Fixar cabeçalho" Checked="True" CheckState="Checked">
            <ClientSideEvents CheckedChanged="function(s, e) {
	cbPanelGrid.PerformCallback();
}" />
        </dx:ASPxCheckBox>
    </div>

    <div id="divExcel">
        <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="grid" />
    </div>

    <div id="divSize">
        <uc1:wucSize runat="server" ID="cboSize" />
    </div>

    <div id="divCNPJ_Principal">
            <dx:ASPxCheckBox ID="chkCNPJ_Principal" runat="server" Text ="Base CNPJ" CheckState="Unchecked" AutoPostBack="false">                
            </dx:ASPxCheckBox>
        </div>

    <div id="divFornecedor">       
        <uc1:wucFornecedor runat="server" ID="txtFornecedor" />
    </div>

    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cbPanelGrid" runat="server" Width="100%" ClientInstanceName ="cbPanelGrid" Theme ="Metropolis" SettingsLoadingPanel-Text ="Atualizando...">
            <PanelCollection>
                <dx:PanelContent ID="PanelContent1"  runat="server" SupportsDisabledAttributes="both">

                        <dx:ASPxGridView ID="grid" runat="server" Theme="Default" DataSourceID="dsDados" Width="100%" ClientInstanceName="grid1" KeyFieldName="FilialLista" Visible="False">
                            <TotalSummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeQuebra" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrQuebra" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercial" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroSellOut" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotal" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde51" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg51" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAg51" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde52" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg52" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAg52" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde23" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg23" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAg23" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSellOut" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemCheia" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeDiv" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDiv" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percDiv" SummaryType="Custom" />
                            </TotalSummary>
                            <groupsummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" ShowInGroupFooterColumn="vlrVenda" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg51" ShowInGroupFooterColumn="vlrAg51" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde51" ShowInGroupFooterColumn="Qtde51" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAg51" ShowInGroupFooterColumn="percAg51" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg52" ShowInGroupFooterColumn="vlrAg52" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde52" ShowInGroupFooterColumn="Qtde52" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAg52" ShowInGroupFooterColumn="percAg52" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg23" ShowInGroupFooterColumn="vlrAg23" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde23" ShowInGroupFooterColumn="Qtde23" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAg23" ShowInGroupFooterColumn="percAg23" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeQuebra" ShowInGroupFooterColumn="QtdeQuebra" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrQuebra" ShowInGroupFooterColumn="vlrQuebra" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" ShowInGroupFooterColumn="percCresc" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargem" ShowInGroupFooterColumn="vlrMargem" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" ShowInGroupFooterColumn="percMargem" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percDiv" ShowInGroupFooterColumn="percDiv" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="Total de Lojas: {0:n0}" FieldName="FilialLista" SummaryType="Count" />
                            </groupsummary>

                            <Toolbars>
                <dx:GridViewToolbar EnableAdaptivity="true">
                    <Items>
                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>


                            <Columns>
                                <dx:GridViewBandColumn Caption="Divergência" ShowInCustomizationForm="True" VisibleIndex="7">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeDiv" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px" ToolTip="Divergência da Quantidade (Qtde. Agenda 51 - Qtde. Agenda 52)">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrDiv" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px" ToolTip="Divergência em Reais (Valor Agenda 51 - Valor Agenda 52)">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percDiv" ShowInCustomizationForm="True" VisibleIndex="2" Width="60px" UnboundType="Decimal">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewCommandColumn VisibleIndex="0" Width="0px">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewBandColumn Caption="Margem em %" VisibleIndex="6">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="F.Caixa" FieldName="percMargem" ReadOnly="True" ToolTip="Percentual de margem de frente de caixa." VisibleIndex="0" Width="60px">
                                            <propertiestextedit displayformatstring="{0:n2}" encodehtml="False"></propertiestextedit>
                                            <Settings AllowAutoFilter="False" AllowHeaderFilter="False" ShowFilterRowMenu="False" ShowInFilterControl="False" AllowAutoFilterTextInputTimer="False" />
                                            <cellstyle forecolor="Blue">
                                            </cellstyle>
                                            <footercellstyle forecolor="Blue">
                                            </footercellstyle>
                                            <groupfootercellstyle backcolor="#C1E0FF" forecolor="Blue">
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                <BorderRight BorderColor="#999999" BorderStyle="Dotted" BorderWidth="1px" />
                                            </groupfootercellstyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Sell-Out" FieldName="percMargemSellOut" VisibleIndex="1" Width="60px" ToolTip="Percentual margem Sell-Out">
                                            <propertiestextedit displayformatstring="{0:n2}" encodehtml="False"></propertiestextedit>
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Total" FieldName="percMargemCheia" ShowInCustomizationForm="True" VisibleIndex="2" Width="60px" ToolTip="Percentual Total da Margem (% Frente de Caixa + % Sell-Out)">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle ForeColor="Blue">
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Lucro" ShowInCustomizationForm="True" VisibleIndex="5" Name="bandLucro">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="F.Caixa" FieldName="vlrLucroComercial" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px" ToolTip="Lucro de frente de caixa">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Sell-Out" FieldName="vlrLucroSellOut" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px" ToolTip="Lucro de Sell-Out">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Total" FieldName="vlrLucroTotal" ShowInCustomizationForm="True" VisibleIndex="2" Width="80px" ToolTip="Total do Lucro (Lucro Frente de Caixa + Lucrto Sell-Out)">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle ForeColor="Blue">
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Vendas " ToolTip="Valores de venda e percentual de margem por item" VisibleIndex="4" Name="bandVenda">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVenda" ReadOnly="True" VisibleIndex="1" Width="100px" ToolTip="Valor de venda.">
                                            <propertiestextedit displayformatstring="{0:n0}" encodehtml="False"></propertiestextedit>
                                            <Settings AllowAutoFilter="False" AllowHeaderFilter="False" ShowFilterRowMenu="False" ShowInFilterControl="True" />
                                            <CellStyle ForeColor="Blue">
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </FooterCellStyle>
                                            <GroupFooterCellStyle BackColor="#D7EBFF" ForeColor="Blue">
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde" VisibleIndex="0" Width="90px" ToolTip="Quantidade de Itens Vendidos">
                                            <propertiestextedit displayformatstring="{0:n0}" encodehtml="False"></propertiestextedit>
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Agenda 51 (sobra)" ToolTip="Exibe as informações de volume e valor em reais da agenda 51 (sobra de mercadoria)." VisibleIndex="8">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde51" ReadOnly="True" VisibleIndex="0" Width="90px" ToolTip="Quantidade da Agenda 51 - Sobra">
                                            <propertiestextedit displayformatstring="{0:n0}" encodehtml="False"></propertiestextedit>
                                            <CellStyle>
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                            <FooterCellStyle>
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrAg51" ReadOnly="True" VisibleIndex="1" Width="90px" ToolTip="Valor da Agenda 51 - Sobra">
                                            <propertiestextedit displayformatstring="{0:n0}" encodehtml="False"></propertiestextedit>
                                            <Settings AllowAutoFilter="False" />
                                            <groupfootercellstyle>
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                <BorderRight BorderColor="#999999" BorderStyle="Dotted" BorderWidth="1px" />
                                            </groupfootercellstyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percAg51" ShowInCustomizationForm="True" VisibleIndex="2" Width="60px" UnboundType="Decimal">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Agenda 52 (falta)" ToolTip="Exibe as informações de volume e valor em reais da agenda 52 (falta de mercadoria)." VisibleIndex="9">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde52" ReadOnly="True" VisibleIndex="0" Width="90px" ToolTip="Quantidade da Agenda 52 - Falta">
                                            <propertiestextedit displayformatstring="{0:n0}" encodehtml="False"></propertiestextedit>
                                            <CellStyle>
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                            <FooterCellStyle>
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrAg52" ReadOnly="True" VisibleIndex="1" Width="90px" ToolTip="Valor da Agenda 52 - Falta">
                                            <propertiestextedit displayformatstring="{0:n0}" encodehtml="False"></propertiestextedit>
                                            <Settings AllowAutoFilter="False" />
                                            <groupfootercellstyle>
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                <BorderRight BorderColor="#999999" BorderStyle="Dotted" BorderWidth="1px" />
                                            </groupfootercellstyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percAg52" ShowInCustomizationForm="True" VisibleIndex="2" Width="60px" UnboundType="Decimal">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Agenda 23 (lixo)" ShowInCustomizationForm="True" ToolTip="Exibe as informações de volume e valor em reais da agenda 23 (lixo)." VisibleIndex="10">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde23" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px" ToolTip="Quantidade da Agenda 23 - Lixo">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                            <FooterCellStyle>
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrAg23" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px" ToolTip="Valor da Agenda 23 - Lixo">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <GroupFooterCellStyle BackColor="#D8D8D8">
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                <BorderRight BorderColor="#999999" BorderStyle="Dotted" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percAg23" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Total Perda" ToolTip="Exibe as informações de volume, valor em reais  e percentual de crescimento do total da perda. O total da perda é composto pelo calculo (+ agenda23 + agenda 51 - agenda 52). O percentual de crescimento se dá pela divisão do valor total de quebra pela venda." VisibleIndex="3">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeQuebra" ReadOnly="True" VisibleIndex="0" Width="90px" ToolTip="Quantidade perdida">
                                            <propertiestextedit displayformatstring="{0:n0}" encodehtml="False"></propertiestextedit>
                                            <groupfootercellstyle backcolor="#FFFFCC" font-bold="True">
                                            </groupfootercellstyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrQuebra" ReadOnly="True" VisibleIndex="1" Width="90px" ToolTip="Valor em reais perdido">
                                            <propertiestextedit displayformatstring="{0:n0}" encodehtml="False"></propertiestextedit>
                                            <Settings AllowAutoFilter="False" />
                                            <groupfootercellstyle backcolor="#FFFFCC" font-bold="True">
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                <BorderRight BorderColor="#999999" BorderStyle="Double" BorderWidth="1px" />
                                            </groupfootercellstyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Perda" FieldName="percCresc" ReadOnly="True" VisibleIndex="2" Width="60px" ToolTip="Percentual da perda em relação a venda">
                                            <propertiestextedit displayformatstring="{0:n2}" encodehtml="False"></propertiestextedit>
                                            <cellstyle>
                                                <BorderLeft BorderColor="Silver" BorderStyle="Dotted" BorderWidth="1px" />
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </cellstyle>
                                            <FooterCellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </FooterCellStyle>
                                            <groupfootercellstyle backcolor="#CCFFCC" font-bold="False">
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </groupfootercellstyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="Filial" FieldName="FilialLista" ToolTip="Descrição Filial" VisibleIndex="1" Width="140px" FixedStyle="Left">
                                    <cellstyle wrap="False">
                                    </cellstyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Status de Perdas" VisibleIndex="2">
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="CFTV" VisibleIndex="0" Width="50px" ToolTip="Indicador se a loja tem CFTV">
                                            <cellstyle horizontalalign="Center">
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </cellstyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="Antena" VisibleIndex="1" Width="50px" ToolTip="Indicador se a loja tem Antena">
                                            <cellstyle horizontalalign="Center">
                                            </cellstyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="PPP" ToolTip="Indicador se a loja tem Programa de Prevenção de Perdas" VisibleIndex="2" Width="50px">
                                            <cellstyle horizontalalign="Center">
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </cellstyle>
                                            <FooterCellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                            <settingspager mode="ShowAllRecords">
                            </settingspager>
                             <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                            <Settings ShowFilterBar="Auto" ShowFilterRowMenu="True" ShowGroupFooter="VisibleAlways" ShowVerticalScrollBar="True" VerticalScrollableHeight="400" ShowGroupPanel="True" HorizontalScrollBarMode="Visible" ShowFooter="True" />
                            <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" EmptyDataRow="Não há informações disponíveis ainda para esse período" />
                            <SettingsLoadingPanel Text="Processando informação. Aguarde...&amp;hellip;" />
                            <SettingsDetail ShowDetailButtons="False" />
                            <styles>
                                <header horizontalalign="Center">
                                </header>
                                <Footer Font-Bold="True">
                                </Footer>
                                <groupfooter backcolor="#EAEAEA" font-bold="False">
                                </groupfooter>
                                <focusedrow backcolor="#FFFF99" forecolor="#0066FF" Font-Bold="True">
                                </focusedrow>
                                <grouprow font-bold="True">
                                </grouprow>
                                <alternatingrow backcolor="#EBEBEB">
                                </alternatingrow>
                                <titlepanel horizontalalign="Left">
                                </titlepanel>
                            </styles>
                        </dx:ASPxGridView>

                    <asp:SqlDataSource ID="dsDados" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" 
                        SelectCommand="Analises_Mes.uspQuebras008_" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="idFornecedor" SessionField="sFORNECEDOR" Type="Int32" />
                            <asp:SessionParameter DbType="Date" Name="DiaInicial" SessionField="sDIA_INICIAL" />
                            <asp:SessionParameter DbType="Date" Name="DiaFinal" SessionField="sDIA_FINAL" />                            
                            <asp:SessionParameter Name="BaseCNPJ" SessionField="sBASE_CNPJ" Type="Boolean" />
                            <asp:SessionParameter Name="idTipoMercadologico" SessionField="sTIPO" Type="Byte" />
                            <asp:SessionParameter Name="idMercadologico" SessionField="sMERCADOLOGICO" Type="Int16" />
                        </SelectParameters>
                    </asp:SqlDataSource>


                    <asp:Label ID="lblError" runat="server" Text="" ForeColor ="Red" ></asp:Label>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>


   <%-- AQUI COMEÇA A CAIXA DE DIALOGO.--%>
    <dx:ASPxPopupControl ID="popMercadologico" runat="server" LoadContentViaCallback="OnFirstShow" Theme="Metropolis"
                                PopupElementID="ShowButton" PopupVerticalAlign="Below" PopupHorizontalAlign="LeftSides" AllowDragging="True"
                          ShowHeader="true" ShowCloseButton="true" Width="900px" Height="50px" 
                         HeaderText="Updatable content" ClientInstanceName="ClientPopupControl" ShowRefreshButton="True" SettingsLoadingPanel-Text="Aguarde. Atualizando&amp;hellip;" SettingsLoadingPanel-Enabled="True">
        <HeaderTemplate>      
        </HeaderTemplate>

        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl" runat="server">
  <%--              <div style="vertical-align:middle">
                    The content of this popup control is relevant to: <b> <%= DateTime.Now.ToLongTimeString() %></b>
                     <asp:Label ID="lblDados" runat="server" Text="Label"></asp:Label>
                </div>--%>

                    <dx:ASPxCallbackPanel ID="cbPanelMercadologico" runat="server" Width="900px" Theme="Metropolis" ClientInstanceName="cbPanelMercadologico" SettingsLoadingPanel-Text ="Atualizando..." >
                        <PanelCollection>
                            <dx:PanelContent ID="PanelContent2"  runat="server" SupportsDisabledAttributes="both">

                                <div id="divMercadologico_Total">
                                    <dx:ASPxRadioButton ID="rdTotal" runat="server" Text="Total" GroupName="rdMercadologico" Checked="True" ClientInstanceName="rdTotal" Theme="Metropolis" ToolTip="Exibe a venda de todos os departamentos" TextSpacing="2">
                                         <ClientSideEvents CheckedChanged="function(s, e) {
	
	cbPanelMercadologico.PerformCallback();
}" />
                                    </dx:ASPxRadioButton>
                                </div>

                                <div id="divMercadologico_Departamento">
                                    <dx:ASPxRadioButton ID="rdDepartamento" runat="server" Text="Departamento" GroupName="rdMercadologico" ClientInstanceName="rdDepartamento" Theme="Metropolis" ToolTip="Exibe a venda de todas as seções do departamento selecionado" AutoPostBack="False">
                                        <ClientSideEvents CheckedChanged="function(s, e) {
	
	cbPanelMercadologico.PerformCallback();
}" />
                                    </dx:ASPxRadioButton>
                                </div>

                                <div id="divMercadologico_Secao">
                                    <dx:ASPxRadioButton ID="rdSecao" runat="server" Text="Seção" GroupName="rdMercadologico" ClientInstanceName="rdSecao" Theme="Metropolis" ToolTip="Exibe a venda de todos os grupos de familia da seção selecionada" AutoPostBack="False">
                                        <ClientSideEvents CheckedChanged="function(s, e) {
	cbPanelMercadologico.PerformCallback();
}" />
                                    </dx:ASPxRadioButton>

                                </div>

                                <div id="divMercadologico_Grupo">
                                    <dx:ASPxRadioButton ID="rdGrupo" runat="server" Text="Grupo" GroupName="rdMercadologico" ClientInstanceName="rdGrupo" Theme="Metropolis" ToolTip="Exibe a venda de todas os familias do grupo selecionado" AutoPostBack="False" Width="59px">
                                        <ClientSideEvents CheckedChanged="function(s, e) {

	cbPanelMercadologico.PerformCallback();

	
}" />
                                    </dx:ASPxRadioButton>
                                </div>

                                <div id="divMercadologico_Subgrupo">
                                    <dx:ASPxRadioButton ID="rdSubgrupo" runat="server" Text="Familia" GroupName="rdMercadologico" ClientInstanceName="rdSubgrupo" Theme="Metropolis" ToolTip="Exibe a venda de todos os itens da familia selecionada" AutoPostBack="False">
                                        <ClientSideEvents CheckedChanged="function(s, e) {
	cbPanelMercadologico.PerformCallback();
}" />
                                    </dx:ASPxRadioButton>
                                </div>

                                <div id="divLista_Departamento" >
                                    <dx:ASPxListBox ID="cblDepartamento" runat="server" ValueType="System.Int32" ClientInstanceName="cblDepartamento" DataSourceID="dsListaDepartamento" TextField="ListaReduzida" ValidateRequestMode="Disabled" ValueField="idDepto" ViewStateMode="Disabled" EnableTheming="True" Height="145px" Theme="Office2010Black" Visible="False" Width="160px">
                                        <Columns>
                                            <dx:ListBoxColumn Caption="Departamento" FieldName="ListaReduzida" />
                                        </Columns>
                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {	
	cbPanelMercadologico.PerformCallback();
}" />
                                    </dx:ASPxListBox>               

                                    <asp:SqlDataSource ID="dsListaDepartamento" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" 
                                        SelectCommand="Cadastros.uspCboDepartamento" SelectCommandType="StoredProcedure">
                                        <SelectParameters>                                            
                                            <asp:SessionParameter Name="Departamento" SessionField="sDEPARTAMENTO" Type="String" />
                                            <asp:SessionParameter Name="Matricula" SessionField="sMATRICULA" Type="String" />                                            
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>

                                <div id="divLista_Secao" >
                                    <dx:ASPxListBox ID="cblSecao" runat="server" ValueType="System.Int32" ClientInstanceName="cblSecao" DataSourceID="dsListaSecao" EnableTheming="True" Height="145px" TextField="ListaReduzida" Theme="Office2010Black" ValidateRequestMode="Disabled" ValueField="idSecao" ViewStateMode="Disabled" Visible="False" Width="160px">
                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {	
	cbPanelMercadologico.PerformCallback()
}" />
                                            <Columns>                                                
                                                <dx:ListBoxColumn FieldName="ListaReduzida" Caption="Seção" />
                                            </Columns>
                                    </dx:ASPxListBox>
                                    <asp:SqlDataSource ID="dsListaSecao" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" 
                                        SelectCommand="Cadastros.uspCboSecaoFiltro_IN" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="cblDepartamento" Name="idDepto" PropertyName="Value" Type="Byte" />
                                            <asp:SessionParameter Name="Usuario" SessionField="sUSUARIO" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>

                                <div id="divLista_Grupo" >
                                    <dx:ASPxListBox ID="cblGrupo" runat="server" ValueType="System.Int32" ClientInstanceName="cblGrupo" DataSourceID="dsListaGrupo" EnableTheming="True" Height="145px" TextField="ListaReduzida" Theme="Office2010Black" ValidateRequestMode="Disabled" ValueField="idGrupo" ViewStateMode="Disabled" Visible="False" Width="160px">
                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {cbPanelMercadologico.PerformCallback()}" />
                                            <Columns>                                                
                                                <dx:ListBoxColumn FieldName="ListaReduzida" Caption="Grupo" />
                                            </Columns>
                                    </dx:ASPxListBox>
                                    <asp:SqlDataSource ID="dsListaGrupo" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" 
                                        SelectCommand="Cadastros.uspCboGrupoFiltro_IN" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="cblSecao" Name="idSecao" PropertyName="Value" Type="Byte" />
                                            <asp:SessionParameter Name="Usuario" SessionField="sUSUARIO" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>

                                <div id="divLista_Subgrupo">
                                    <dx:ASPxListBox ID="cblsubgrupo" runat="server" ValueType="System.Int32" ClientInstanceName="cblSubgrupo" DataSourceID="dsListaSubgrupo" EnableTheming="True" Height="145px" TextField="ListaReduzida" Theme="Office2010Black" ValidateRequestMode="Disabled" ValueField="idSubgrupo" ViewStateMode="Disabled" Visible="False" Width="160px">
                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {cbPanelMercadologico.PerformCallback()}" />
                                            <Columns>                                                
                                                <dx:ListBoxColumn FieldName="ListaReduzida" Caption="Familia" />
                                            </Columns>
                                    </dx:ASPxListBox>
                                    <asp:SqlDataSource ID="dsListaSubgrupo" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" 
                                        SelectCommand="Cadastros.uspCboSubgrupoFiltro_IN" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="cblGrupo" Name="idGrupo" PropertyName="Value" Type="Int16" />
                                            <asp:SessionParameter Name="Usuario" SessionField="sUSUARIO" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>


                                
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxCallbackPanel>
                
            </dx:PopupControlContentControl>
        </ContentCollection>

    </dx:ASPxPopupControl>

    
</asp:Content>


