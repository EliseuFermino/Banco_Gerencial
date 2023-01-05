<%@ Page Title="Quebras loja a loja por Fornecedor" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="appQuebras010.aspx.vb" Inherits="MemberPages_Quebras_appQuebras010" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>
<%@ Register Src="~/Controles/wucMercadologicoNew.ascx" TagPrefix="uc1" TagName="wucMercadologicoNew" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>





<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type="text/css" >
                               
        #divFornecedor {
            float: left;
            
             
            margin-top: 2px;
        }

        #divPeriodo {
            float: left;
            margin-left: 5px;
            margin-top: 7px;
        }

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
            width: 80px;  
            padding-top: 2px;                      
        }

        #divBotaoExcel {
            float: left;
            margin-left: 0px;              
            padding-top: 2px;                      
        }

        #divZoom {
            float: left;
            margin-left: 20px;
            margin-top: 5px
        }

        #divSize {
            float:left ;  
            margin-left: 2px;
            margin-top: 2px
        }
        
        #divGrid1 {
            clear: both;
            float: left;
            padding-top: 1px;
            width: 100%;
            margin-left: 1px;
            padding-right: 5px;
        }

        .myBorder {
            border: 1px solid #bdbbbb;
            height: 47px;
            margin-left: 1px;            
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
 
        <div id="divFornecedor"    >           
            <uc1:wucMercadologicoNew runat="server" ID="cboMercadologico" />
        </div>        
    
        <div id="divPeriodo">
            <uc1:wucListaDiaIniFin runat="server" ID="cboDia" />
        </div>

        <div id="divBotaoAtualizar">
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" Theme="Metropolis" AutoPostBack="False" Height="15px">
                <ClientSideEvents Click="function(s, e) {	cbPanel1.PerformCallback();   }" />
            </dx:ASPxButton>
        </div>

        <div id="divBotaoExcel">
            <uc1:wucBotaoExcel runat="server" ID="wucBotaoExcel" CallGridViewID="grid1" />
        </div>

        <div id="divSize">
            <uc1:wucSize runat="server" ID="cboSize" AutoPostBack="False" />
        </div>
    
        <div id="divGrid1">
            <dx:ASPxCallbackPanel ID="cbPanel1" runat="server" Width="100%" ClientInstanceName="cbPanel1" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando&amp;hellip;">
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttribute="both">
                        <dx:ASPxGridView ID="grid1" runat="server" Theme="Default" DataSourceID="dsDados" Width="100%" ClientInstanceName="grid1" KeyFieldName="FilialLista" Visible="False">
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
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde52" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg52" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde23" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg23" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSellOut" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemCheia" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeDiv" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDiv" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAg23" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAg51" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAg52" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percDiv" SummaryType="Custom" />
                            </TotalSummary>
                            <groupsummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" ShowInGroupFooterColumn="vlrVenda" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg51" ShowInGroupFooterColumn="vlrAg51" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde51" ShowInGroupFooterColumn="Qtde51" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg52" ShowInGroupFooterColumn="vlrAg52" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde52" ShowInGroupFooterColumn="Qtde52" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg23" ShowInGroupFooterColumn="vlrAg23" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde23" ShowInGroupFooterColumn="Qtde23" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeQuebra" ShowInGroupFooterColumn="QtdeQuebra" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrQuebra" ShowInGroupFooterColumn="vlrQuebra" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" ShowInGroupFooterColumn="percCresc" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargem" ShowInGroupFooterColumn="vlrMargem" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" ShowInGroupFooterColumn="percMargem" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="Total de Lojas: {0:n0}" FieldName="FilialLista" SummaryType="Count" />
                            </groupsummary>
                            <Columns>
                                <dx:GridViewBandColumn Caption="Divergência" ShowInCustomizationForm="True" VisibleIndex="7">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeDiv" ShowInCustomizationForm="True" VisibleIndex="0" Width="100px" ToolTip="Divergência da Quantidade (Qtde. Agenda 51 - Qtde. Agenda 52)">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrDiv" ShowInCustomizationForm="True" VisibleIndex="1" Width="100px" ToolTip="Divergência em Reais (Valor Agenda 51 - Valor Agenda 52)">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" ShowInCustomizationForm="True" VisibleIndex="2" Width="60px" FieldName="percDiv">
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
                                        <dx:GridViewDataTextColumn Caption="F.Caixa" FieldName="vlrLucroComercial" ShowInCustomizationForm="True" VisibleIndex="0" Width="100px" ToolTip="Lucro de frente de caixa">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Sell-Out" FieldName="vlrLucroSellOut" ShowInCustomizationForm="True" VisibleIndex="1" Width="100px" ToolTip="Lucro de Sell-Out">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Total" FieldName="vlrLucroTotal" ShowInCustomizationForm="True" VisibleIndex="2" Width="100px" ToolTip="Total do Lucro (Lucro Frente de Caixa + Lucrto Sell-Out)">
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
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVenda" ReadOnly="True" VisibleIndex="2" Width="110px" ToolTip="Valor de venda.">
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
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde" VisibleIndex="1" Width="100px" ToolTip="Quantidade de Itens Vendidos">
                                            <propertiestextedit displayformatstring="{0:n0}" encodehtml="False"></propertiestextedit>
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Rnk." FieldName="rnkVenda" ShowInCustomizationForm="True" ToolTip="Posição no Ranking das Vendas" VisibleIndex="0" Width="35px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}º" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle Font-Bold="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Agenda 51 (sobra)" ToolTip="Exibe as informações de volume e valor em reais da agenda 51 (sobra de mercadoria)." VisibleIndex="8">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde51" ReadOnly="True" VisibleIndex="0" Width="100px" ToolTip="Quantidade da Agenda 51 - Sobra">
                                            <propertiestextedit displayformatstring="{0:n0}" encodehtml="False"></propertiestextedit>
                                            <CellStyle>
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                            <FooterCellStyle>
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrAg51" ReadOnly="True" VisibleIndex="1" Width="100px" ToolTip="Valor da Agenda 51 - Sobra">
                                            <propertiestextedit displayformatstring="{0:n0}" encodehtml="False"></propertiestextedit>
                                            <Settings AllowAutoFilter="False" />
                                            <groupfootercellstyle>
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                <BorderRight BorderColor="#999999" BorderStyle="Dotted" BorderWidth="1px" />
                                            </groupfootercellstyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percAg51" ShowInCustomizationForm="True" VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Agenda 52 (falta)" ToolTip="Exibe as informações de volume e valor em reais da agenda 52 (falta de mercadoria)." VisibleIndex="9">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde52" ReadOnly="True" VisibleIndex="0" Width="100px" ToolTip="Quantidade da Agenda 52 - Falta">
                                            <propertiestextedit displayformatstring="{0:n0}" encodehtml="False"></propertiestextedit>
                                            <CellStyle>
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                            <FooterCellStyle>
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrAg52" ReadOnly="True" VisibleIndex="1" Width="100px" ToolTip="Valor da Agenda 52 - Falta">
                                            <propertiestextedit displayformatstring="{0:n0}" encodehtml="False"></propertiestextedit>
                                            <Settings AllowAutoFilter="False" />
                                            <groupfootercellstyle>
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                <BorderRight BorderColor="#999999" BorderStyle="Dotted" BorderWidth="1px" />
                                            </groupfootercellstyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percAg52" ShowInCustomizationForm="True" VisibleIndex="2" Width="60px">
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
                                <dx:GridViewBandColumn Caption="Agenda 23 (lixo)" ShowInCustomizationForm="True" ToolTip="Exibe as informações de volume e valor em reais da agenda 23 (lixo)." VisibleIndex="10">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde23" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px" ToolTip="Quantidade da Agenda 23 - Lixo">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrAg23" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="90px" ToolTip="Valor da Agenda 23 - Lixo">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <GroupFooterCellStyle BackColor="#D8D8D8">
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                <BorderRight BorderColor="#999999" BorderStyle="Dotted" BorderWidth="1px" />
                                            </GroupFooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percAg23" ShowInCustomizationForm="True" ToolTip="Percentual da Agenda 23 sobre a Venda" VisibleIndex="3" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Rnk." FieldName="rnkAg23" ShowInCustomizationForm="True" ToolTip="Posição no Ranking da Agenda 23." VisibleIndex="0" Width="35px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}º" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle Font-Bold="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Total Perda" ToolTip="Exibe as informações de volume, valor em reais  e percentual de crescimento do total da perda. O total da perda é composto pelo calculo (+ agenda23 + agenda 51 - agenda 52). O percentual de crescimento se dá pela divisão do valor total de quebra pela venda." VisibleIndex="3">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeQuebra" ReadOnly="True" VisibleIndex="1" Width="100px" ToolTip="Quantidade perdida">
                                            <propertiestextedit displayformatstring="{0:n0}" encodehtml="False"></propertiestextedit>
                                            <groupfootercellstyle backcolor="#FFFFCC" font-bold="True">
                                            </groupfootercellstyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrQuebra" ReadOnly="True" VisibleIndex="2" Width="100px" ToolTip="Valor em reais perdido">
                                            <propertiestextedit displayformatstring="{0:n0}" encodehtml="False"></propertiestextedit>
                                            <Settings AllowAutoFilter="False" />
                                            <groupfootercellstyle backcolor="#FFFFCC" font-bold="True">
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                <BorderRight BorderColor="#999999" BorderStyle="Double" BorderWidth="1px" />
                                            </groupfootercellstyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Perda" FieldName="percCresc" ReadOnly="True" VisibleIndex="3" Width="60px" ToolTip="Percentual da perda em relação a venda">
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
                                        <dx:GridViewDataTextColumn Caption="Rnk." FieldName="rnkQuebra" ShowInCustomizationForm="True" ToolTip="Posição no Ranking de Total de Perdas." VisibleIndex="0" Width="35px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}º" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle Font-Bold="True">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="Filial" FieldName="FilialLista" ToolTip="Descrição Filial" VisibleIndex="1" Width="140px" FixedStyle="Left" SortIndex="0" SortOrder="Ascending">
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
                            <Settings ShowFilterBar="Auto" ShowFilterRowMenu="True" ShowGroupFooter="VisibleAlways" ShowVerticalScrollBar="True" VerticalScrollableHeight="400" HorizontalScrollBarMode="Visible" ShowFooter="True" />
                            <SettingsText EmptyDataRow="Não há informações disponíveis ainda para esse período" />
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

                        <asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="Analises.uspQuebras010" SelectCommandType="StoredProcedure" >
                            <SelectParameters>
                                <asp:SessionParameter Name="DiaInicial" SessionField="sDIA_INICIAL" DbType="Date" />
                                <asp:SessionParameter Name="DiaFinal" SessionField="sDIA_FINAL" DbType="Date" />
                                <asp:SessionParameter Name="idTipo" SessionField="sOPCAO" Type="Byte" />
                                <asp:SessionParameter Name="idMercadologico" SessionField="sMERCADOLOGICO" Type="Int16" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <br />
                        <asp:Label ID="lblError" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>

            <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="gerPerdas"  Anotacao2="Analises.uspQuebras010" />

        </div>

   
</asp:Content>

