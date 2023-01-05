<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="SLV002.aspx.vb" Inherits="MemberPages_SLV_SLV002" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>

<%@ Register Src="~/Controles/wucOpcoesSLV.ascx" TagPrefix="uc1" TagName="wucOpcoesSLV" %>



<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucCheckBoxWithPanel.ascx" TagPrefix="uc1" TagName="wucCheckBoxWithPanel" %>
<%@ Register Src="~/Controles/wucMercadologicoNew.ascx" TagPrefix="uc1" TagName="wucMercadologicoNew" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >
       

        #divMercadologico {
           float: left;
           margin-left: 1px;
           padding-left: 5px;         
           padding-top: 5px;   
        }

        #divPeriodo {                               
            float: left;            
           margin-left: 5px; 
           margin-top: 3px; 
           padding-left: 5px;    
                   
        }

        .myBorder {
            border: 1px solid #bdbbbb;
            height: 25px;
            margin-left: 1px;  
            margin-top: 2px;          
        }


        #divGrafico {            
            float: left;
            padding-top: 5px;                        
        }

        #divBotaoAtualizar {    
            float: left;                     
            margin-left: 5px;             
            padding-top: 5px; 
            padding-left: 5px;           
                                        
        }


        #divSize {
            float: left;
            margin-left: 5px; 
            margin-top: 3px; 
            padding-top: 5px;
        } 

        #divDados {
            clear: both;
            float: left;
            padding-top: 2px;
            width: 100%;
            margin-left: 1px; 
            padding-right: 2px;           
        }


        #divAnaliseLucro{            
            float: left;
            padding-left: 10px;                
        }

        #divDelivery{            
            float: left;
            padding-left: 10px;                
        }

        #divVisao {
            float: left; 
            margin-left: 5px;   
            margin-top: 3px;         
           padding-right: 10px; 
           padding-top: 5px;
        } 

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
        <div id="divMercadologico" class="BGC_myBorder">
            <uc1:wucMercadologicoNew runat="server" ID="cboMercadologico" />
        </div>

        <div id="divPeriodo" class="BGC_myBorder" >
            <uc1:wucListaDiaIniFin runat="server" ID="cboPeriodo" />
        </div>

        <div id="divBotaoAtualizar" class="BGC_myBorder">
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="MetropolisBlue" Height="26px">
                <ClientSideEvents Click="function(s, e) {	cbPanel.PerformCallback();}" />
            </dx:ASPxButton>
        </div>

        <div id="divSize" class="BGC_myBorder">
            <uc1:wucSize runat="server" ID="cboSize" AutoPostBack="false" />
        </div>     
    
        <div id="divVisao"  class="BGC_myBorder">
            <dx:ASPxComboBox ID="cboVisao" runat="server" Native="True" SelectedIndex="0" ClientInstanceName="cboVisao">
                <ClientSideEvents SelectedIndexChanged="function(s, e) {	

	cbPanelGrid.PerformCallback();
}" CloseUp="function(s, e) {

}" DropDown="function(s, e) {

}" />
                <Items>
                    <dx:ListEditItem Selected="True" Text="Visão 1 - Normal" Value="1" />
                    <dx:ListEditItem Text="Visão 2 - Vendas" Value="2" />
                    <dx:ListEditItem Text="Visão 3 - Vendas e Participação" Value="3" />
                    <dx:ListEditItem Text="Visão 4 - Volume" Value="4" />
                    <dx:ListEditItem Text="Visão 5 - Lucro" Value="5" />
                    <dx:ListEditItem Text="Visão 6 - Lucro com Sell-Out" Value="6" />
                    <dx:ListEditItem Text="Visão 7 - Margem" Value="7" />
                    <dx:ListEditItem Text="Visão 8 - Margem com Sell-Out" Value="8" />
                    <dx:ListEditItem Text="Visão 9 - Meta x Realizado" Value="9" />
                </Items>

            </dx:ASPxComboBox>
        </div>

        <div id="divAnaliseLucro">
            <dx:ASPxCheckBox ID="chkAnaliseLucro" runat="server" Text="Ánalise Lucro" Theme="MaterialCompactOrange" CheckState="Unchecked" AutoPostBack="False">
                <ClientSideEvents CheckedChanged="function(s, e) { cbPanel.PerformCallback();}" />
            </dx:ASPxCheckBox>
        </div>

        <div id="divDelivery">
            <dx:ASPxCheckBox ID="chkDelivery" runat="server" Text="Delivery" Theme="MaterialCompactOrange" CheckState="Unchecked" AutoPostBack="False">
                <ClientSideEvents CheckedChanged="function(s, e) { cbPanel.PerformCallback();}" />
            </dx:ASPxCheckBox>
        </div>


        <div id="divDados">
            <dx:ASPxCallbackPanel ID="cbPanelGrid" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde&amp;hellip;">
<SettingsLoadingPanel Text="Aguarde&amp;hellip;"></SettingsLoadingPanel>
                <PanelCollection>
                    <dx:PanelContent >

                        <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" 
                                        EnableTheming="True" Theme="Mulberry" 
                                        KeyFieldName="idCod" Width="100%" DataSourceID="SqlDataSource1">
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
                                            
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vAA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vAT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difVenda" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotalAA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotalAT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difLucroTotal" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescLucroTotal" SummaryType="Custom" />                                            
                                            
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pAA" SummaryType="Custom" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="mAA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="mAT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difLucro" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescLucro" SummaryType="Custom" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pmAA" SummaryType="Custom" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrSelloutAA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrSelloutAT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difSellOut" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescSellOut" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percSellOutAT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percSellOutAA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPercSellOut" SummaryType="Custom" />
                                            
                                           
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pAT" SummaryType="Custom" />                                            
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pmAT" SummaryType="Custom" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="qAA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="qAT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difVolume" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescVolume" SummaryType="Custom" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="impAA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="impAT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difImposto" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescImposto" SummaryType="Custom" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="mv" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingMetaVlr" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="mm" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pmm" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPercMargem" SummaryType="Custom" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescQtde" SummaryType="Custom" />
                                            

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="cAT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="cAA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCAI_AT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCAI_AA" SummaryType="Custom" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="maiAA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="maiAT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pmaiAA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="pmaiAT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Dif_Venda_Meta_Realizado" SummaryType="Custom" />
                                            

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n1}%" FieldName="percConclusao" SummaryType="Custom" />
                                            
                                            <dx:ASPxSummaryItem DisplayFormat="{0:c2}" FieldName="precoMedioAA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:c2}" FieldName="precoMedioAT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_PrecoMedio" SummaryType="Custom" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescReal" SummaryType="Custom" />

                                       

                                        </TotalSummary>
                                        
                            <Columns>   

                         
                                            
                                            <%--% Dados Ano Atual--%>

                                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                            </dx:GridViewCommandColumn>

                                            <dx:GridViewDataTextColumn FieldName="descID" VisibleIndex="1" 
                                                Caption="Filial" FixedStyle="Left" Width="150px">
                                                <Settings AutoFilterCondition="Contains" AllowAutoFilter="True" />
                                                <SettingsHeaderFilter Mode="CheckedList">
                                                </SettingsHeaderFilter>
                                                <CellStyle Wrap="False">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>    <%-- 01 - DESCRICAO--%>

                                            <dx:GridViewDataTextColumn FieldName="rnk" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Ranking" FixedStyle="Left" ToolTip="Ranking por maior venda" Width="60px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <Settings AllowHeaderFilter="False" />
                                                <CellStyle HorizontalAlign="Center">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>    <%-- 02 - RANKING--%>

                                            <dx:GridViewBandColumn Caption="Volume" Name="bandVolume" ShowInCustomizationForm="True" ToolTip="Quadrante de Volume de Vendas (Quantidade)" VisibleIndex="5">
                                                <Columns>
<dx:GridViewDataTextColumn FieldName="qAA" ShowInCustomizationForm="True" Width="100px" Caption="2014" ToolTip="Volume do Ano Anterior (mesmo per&#237;odo)" VisibleIndex="0">
<PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>

<Settings AllowAutoFilter="False" AllowHeaderFilter="False"></Settings>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>
</dx:GridViewDataTextColumn>

<dx:GridViewDataTextColumn FieldName="qAT" ShowInCustomizationForm="True" Width="100px" Caption="2015" ToolTip="Volume vendida do per&#237;odo selecionado" VisibleIndex="1">
<PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>

<Settings AllowAutoFilter="False" AllowHeaderFilter="False"></Settings>

<HeaderStyle HorizontalAlign="Center"></HeaderStyle>

<CellStyle ForeColor="Blue"></CellStyle>

<FooterCellStyle ForeColor="Blue"></FooterCellStyle>
</dx:GridViewDataTextColumn>

<dx:GridViewDataTextColumn FieldName="difVolume" ShowInCustomizationForm="True" Width="90px" Caption="Diferença" VisibleIndex="2">
<PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
    <Settings AllowHeaderFilter="False" />
</dx:GridViewDataTextColumn>

<dx:GridViewDataTextColumn FieldName="percCrescQtde" ShowInCustomizationForm="True" Width="85px" Caption="Crescimento" ToolTip="Percentual de crescimento de Quantidade entre periodo atual e periodo do ano anterior" VisibleIndex="3">
<PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>

<Settings AllowAutoFilter="False" AllowHeaderFilter="False"></Settings>

<CellStyle>
<BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px"></BorderRight>
</CellStyle>

<FooterCellStyle>
<BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px"></BorderRight>
</FooterCellStyle>
</dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>    <%-- 03 - VOLUME--%>

                                            <dx:GridViewBandColumn Caption="Vendas " Name="bandVendas" ShowInCustomizationForm="True" ToolTip="Quadrante de Vendas" VisibleIndex="6">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="vAA" ShowInCustomizationForm="True" ToolTip="Valor da venda do ano anterior (mesmo período)" VisibleIndex="0" Width="110px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="vAT" ShowInCustomizationForm="True" ToolTip="Valor de venda do período selecionado" VisibleIndex="1" Width="110px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difVenda" ShowInCustomizationForm="True" ToolTip="Diferença de Vendas" VisibleIndex="2" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowHeaderFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Meta" FieldName="mv" ShowInCustomizationForm="True" ToolTip="Valor de meta de venda do período selecionado" VisibleIndex="4" Width="110px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                                        <HeaderStyle BackColor="#009900" ForeColor="White" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#009900">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Dif Meta x Real" FieldName="Dif_Venda_Meta_Realizado" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="5" Width="100px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowHeaderFilter="False" />
                                                        <HeaderStyle BackColor="#009900" ForeColor="White" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Ating." FieldName="percAtingMetaVlr" ShowInCustomizationForm="True" ToolTip="Atingimento entre Realizado versus Meta" VisibleIndex="6" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowHeaderFilter="False" />
                                                        <HeaderStyle BackColor="#009900" ForeColor="White" />
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#009900">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="percConclusao" VisibleIndex="7" Caption="Concluido" Width="100px" >
                                                        <Settings AllowHeaderFilter="False" />
                                                        <DataItemTemplate>
                                                            <dx:ASPxProgressBar ID="pb" runat="server" Height="21px" OnDataBound="pb_DataBound" Theme="SoftOrange" 
                                                                Value='<%#Eval("percConclusao")%>' Width="80px" DisplayFormatString=" 0.0" >
                                                            </dx:ASPxProgressBar>
                                                        </DataItemTemplate>
                                                        <HeaderStyle BackColor="#009900" ForeColor="White" />
                                                        <CellStyle HorizontalAlign="Center">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                        <FooterCellStyle HorizontalAlign="Center">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>    <%-- 04 - VENDAS--%>                                            
                                                                                        
                                            <dx:GridViewBandColumn Caption="Lucro" Name="bandLucro" 
                                                ToolTip="Quadrante de Lucro" VisibleIndex="10">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="mAA" 
                                                        ToolTip="Valor do lucro do ano anterior (mesmo período)" VisibleIndex="0" 
                                                        Width="100px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="mAT" 
                                                        ToolTip="Valor do lucro do período selecionado" VisibleIndex="1" 
                                                        Width="100px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difLucro" ShowInCustomizationForm="True" VisibleIndex="2" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowHeaderFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Crescimento" FieldName="percCrescLucro" ShowInCustomizationForm="True" ToolTip="Percentual de crescimento de Lucro entre periodo atual e periodo do ano anterior" VisibleIndex="3" Width="85px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                        <FooterCellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>    <%-- 05 - LUCRO --%>

                                            <dx:GridViewBandColumn Caption="% de Margem" ShowInCustomizationForm="True" VisibleIndex="11" Name="bandMargem" ToolTip="Quadrante de Margem">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="pmAA" ShowInCustomizationForm="True" ToolTip="Percentual de margem do ano anterior (mesmo período)" VisibleIndex="0" Width="70px" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="pmAT" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="1" Width="70px" ToolTip="Percentual de margem do período selecionado">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difPercMargem" ShowInCustomizationForm="True" ToolTip="Diferença de Margem" VisibleIndex="2" Width="80px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowHeaderFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>    <%-- 06 - % MARGEM --%>


                                            <dx:GridViewBandColumn Caption="Lucro SellOut" Name="bandLucroSellOut"  ToolTip="Quadrante de Lucro" VisibleIndex="12">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="vlrSelloutAA" 
                                                        ToolTip="Valor do SellOut do ano anterior (mesmo período)" VisibleIndex="0" 
                                                        Width="100px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="vlrSelloutAT" 
                                                        ToolTip="Valor do SellOut do período selecionado" VisibleIndex="1" 
                                                        Width="100px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difSellOut" ShowInCustomizationForm="True" VisibleIndex="2" Width="90px" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowHeaderFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Crescimento" FieldName="percCrescSellOut" ShowInCustomizationForm="True" ToolTip="Percentual de crescimento de Lucro entre periodo atual e periodo do ano anterior" UnboundType="Decimal" VisibleIndex="3" Width="85px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                        <FooterCellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>    <%-- 07 - LUCRO SELLOTU --%>

                                            <dx:GridViewBandColumn Caption="% de SellOut" ShowInCustomizationForm="True" VisibleIndex="13" Name="bandMargemSellOut" ToolTip="Quadrante de SellOut">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="percSellOutAA" ShowInCustomizationForm="True" ToolTip="Percentual de SellOut do ano anterior (mesmo período)" VisibleIndex="0" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="percSellOutAT" ShowInCustomizationForm="True"  VisibleIndex="1" Width="70px" ToolTip="Percentual de SellOut do período selecionado">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difPercSellOut" ShowInCustomizationForm="True" ToolTip="Diferença de % de SellOut" VisibleIndex="2" Width="80px" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowHeaderFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>    <%-- 08 - % MARGEM de SELLOUT --%>
                                

                                            <dx:GridViewBandColumn Caption="Impostos" Name="bandImpostos" 
                                                ToolTip="Quadrante de Impostos" VisibleIndex="14">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="impAA" 
                                                        ToolTip="Valor do Imposto do ano anterior (mesmo período)" VisibleIndex="0" 
                                                        Width="100px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="impAT" 
                                                        ToolTip="Valor do Imposto do período selecionado" VisibleIndex="1" 
                                                        Width="100px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difImposto" ShowInCustomizationForm="True" VisibleIndex="2" Width="90px" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowHeaderFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Crescimento" FieldName="percCrescImposto" ShowInCustomizationForm="True" ToolTip="Percentual de crescimento de Lucro entre periodo atual e periodo do ano anterior" UnboundType="Decimal" VisibleIndex="3" Width="85px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                        <FooterCellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>    <%-- 09 - IMPOSTOS --%>

                                            <dx:GridViewBandColumn Caption="CAI" Name="bandCAI" ShowInCustomizationForm="True" VisibleIndex="15">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="cAA" ShowInCustomizationForm="True" ToolTip="Valor do CAI do ano atual" VisibleIndex="0">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowHeaderFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="cAT" ShowInCustomizationForm="True" ToolTip="Valor do CAI do ano anterior" VisibleIndex="1">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowHeaderFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difCAI" ShowInCustomizationForm="True" ToolTip="Diferença" VisibleIndex="2">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowHeaderFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Crescimento" FieldName="percCrescCAI" ShowInCustomizationForm="True" ToolTip="Crescimento" VisibleIndex="3">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowHeaderFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>    <%-- 10 - CAI --%>

                                            <dx:GridViewBandColumn Caption="% do CAI" Name="bandPercentualCAI" ShowInCustomizationForm="True" VisibleIndex="16">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="percCAI_AA" ShowInCustomizationForm="True" VisibleIndex="0" Width="65px" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowHeaderFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="percCAI_AT" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowHeaderFilter="False" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>    <%-- 11 - % do CAI--%>
                                
                                            <dx:GridViewBandColumn Caption="MAI" ShowInCustomizationForm="True" VisibleIndex="17" Name="bandMAI">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="maiAA" ShowInCustomizationForm="True" VisibleIndex="0">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowHeaderFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="maiAT" ShowInCustomizationForm="True" VisibleIndex="2">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowHeaderFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="pmaiAT" ShowInCustomizationForm="True" ToolTip="Percentual do MAI sobre a Venda." VisibleIndex="3">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowHeaderFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" ShowInCustomizationForm="True" ToolTip="Percentual do MAI sobre a Venda." VisibleIndex="1">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowHeaderFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>    <%-- 12 - MAI --%>


                                            <dx:GridViewBandColumn Caption="Metas" Name="bandMeta" 
                                                VisibleIndex="18" ToolTip="Exibe as informações de metas de Venda, Margem e Quebra Conhecida (Agenda 23)" Visible="False">
                                                <Columns>

                                                    <dx:GridViewDataTextColumn FieldName="pmm" ShowInCustomizationForm="True" Width="70px" Caption="% Marg" VisibleIndex="3" ToolTip="Diferença entre o percentual margem realizado versus o percentual margem da meta.">
    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
    </PropertiesTextEdit>
<Settings AllowAutoFilter="False" AllowHeaderFilter="False"></Settings>

    <HeaderStyle BackColor="#009900" HorizontalAlign="Center" ForeColor="White" />

<CellStyle ForeColor="#009900"></CellStyle>
    <FooterCellStyle ForeColor="#009900">
    </FooterCellStyle>
</dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difPercMargem" ShowInCustomizationForm="True" ToolTip="Diferença do Realizado x Meta da Margem " UnboundType="Decimal" VisibleIndex="4" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                                        <HeaderStyle BackColor="#009900" ForeColor="White" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="mm" ShowInCustomizationForm="True" ToolTip="Meta de lucro" VisibleIndex="2" Width="100px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                                        <HeaderStyle BackColor="#009900" ForeColor="White" />
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#009900">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" BackColor="#009900" ForeColor="White" />
                                            </dx:GridViewBandColumn>  <%--13 - Metas--%>

                                            <dx:GridViewBandColumn Caption="Outras Informações" Name="bandinfo" 
                                                VisibleIndex="20" ToolTip="Exibe as informações de metas de Venda, Margem e Quebra Conhecida (Agenda 23)">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Região" FieldName="descRegiao" VisibleIndex="0" 
                                                        Width="200px" ToolTip="Região da Filial">                                                       
                                                        <Settings AllowAutoFilter="True" AllowHeaderFilter="True" />                                                 
                                                        <SettingsHeaderFilter Mode="CheckedList">
                                                        </SettingsHeaderFilter>
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                       
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn FieldName="descRegional" ShowInCustomizationForm="True" Width="200px" Caption="Regional" ToolTip="Regional da Filial" VisibleIndex="4">
                                                    <Settings AllowAutoFilter="True" AllowHeaderFilter="True"></Settings>

                                                        <SettingsHeaderFilter Mode="CheckedList">
                                                        </SettingsHeaderFilter>

                                                    <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px"></BorderRight>
                                                    </CellStyle>
                                                    </dx:GridViewDataTextColumn>

                                                    <dx:GridViewDataTextColumn FieldName="descCidade" ShowInCustomizationForm="True" Width="200px" Caption="Cidade" ToolTip="Cidade da Filial" VisibleIndex="2">
                                                    <Settings AllowAutoFilter="True"></Settings>

                                                        <SettingsHeaderFilter Mode="CheckedList">
                                                        </SettingsHeaderFilter>

                                                    <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px"></BorderRight>
                                                    </CellStyle>
                                                    </dx:GridViewDataTextColumn>

                                                </Columns>                                                

                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dx:GridViewBandColumn>  <%--13 - Metas--%>


                                            <dx:GridViewBandColumn Caption="% de Participação" Name="bandAnoAtual" 
                                                ToolTip="Exibe as informações do ano atual" VisibleIndex="4">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Empresa" FieldName="pAT" ShowInCustomizationForm="True" ToolTip="Percentual de participação da venda sobre o total da empresa" VisibleIndex="0" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Loja" FieldName="pptAT" ShowInCustomizationForm="True" ToolTip="Percentual de participação da venda sobre o total da venda da loja" VisibleIndex="1" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowHeaderFilter="False" />
                                                        <CellStyle ForeColor="Blue">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                                                                        

                                            <dx:GridViewDataTextColumn FieldName="idCod" ShowInCustomizationForm="True" Visible="False" VisibleIndex="19">
                                            </dx:GridViewDataTextColumn>
                                            

                                            <dx:GridViewBandColumn Caption="Preço Médio" ShowInCustomizationForm="True" VisibleIndex="8">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="2018" FieldName="precoMedioAA" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="0">
                                                        <PropertiesTextEdit DisplayFormatString="{0:c2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowHeaderFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="2019" FieldName="precoMedioAT" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="1">
                                                        <PropertiesTextEdit DisplayFormatString="{0:c2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowHeaderFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Cresc." FieldName="percCresc_PrecoMedio" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="2" Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowHeaderFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            

                                            <dx:GridViewBandColumn Caption="Lucro Total" ShowInCustomizationForm="True" VisibleIndex="9">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Lucro Total 2018" FieldName="vlrLucroTotalAT" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="1">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowHeaderFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Lucro Total 2019" FieldName="vlrLucroTotalAA" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="0">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowHeaderFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difLucroTotal" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="2">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowHeaderFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Crescimento" FieldName="percCrescLucroTotal" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="3">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowHeaderFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            

                                            <dx:GridViewDataTextColumn Caption="Dia de &lt;br&gt; Abertura" FieldName="DataAbertura" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="2">
                                                <PropertiesTextEdit DisplayFormatString="{0:dd/MM/yyyy} " EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                            

                                            <dx:GridViewBandColumn Caption="Crescimento de Vendas" ShowInCustomizationForm="True" VisibleIndex="7">
                                                <HeaderStyle BackColor="#0033CC" />
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Nominal" FieldName="percCresc" ShowInCustomizationForm="True" ToolTip="Percentual de crescimento de Venda entre periodo atual e periodo do ano anterior" VisibleIndex="0" Width="85px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                                        <HeaderStyle BackColor="#0033CC" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Real" FieldName="percCrescReal" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="1" Width="85px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                                        <HeaderStyle BackColor="#0033CC" />
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            

                                            <dx:GridViewBandColumn Caption="Campanha Pascoa" ShowInCustomizationForm="True" VisibleIndex="23">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="volumeAtual" ShowInCustomizationForm="True" VisibleIndex="0">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="volumePascoa" ShowInCustomizationForm="True" VisibleIndex="1">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="vendaAtual" ShowInCustomizationForm="True" VisibleIndex="2">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="vendaPascoa" ShowInCustomizationForm="True" VisibleIndex="3">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            

                                        </Columns>
                                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                        <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" ></SettingsExport>
                                        <FormatConditions>
                                            <dx:GridViewFormatConditionIconSet FieldName="percCresc" Format="PositiveNegativeArrowsColored" />
                                            <dx:GridViewFormatConditionIconSet FieldName="percCrescQtde" Format="PositiveNegativeArrowsColored" />
                                            <dx:GridViewFormatConditionIconSet FieldName="percCrescLucro" Format="PositiveNegativeArrowsColored" />
                                            <dx:GridViewFormatConditionIconSet FieldName="percAtingMetaVlr" Format="PositiveNegativeTriangles" />
                                            <dx:GridViewFormatConditionHighlight Expression="[difLucroTotal] &lt; 0.0" FieldName="difLucroTotal">
                                            </dx:GridViewFormatConditionHighlight>
                                            <dx:GridViewFormatConditionHighlight Expression="[percCrescLucroTotal] &lt; 0.0" FieldName="percCrescLucroTotal">
                                            </dx:GridViewFormatConditionHighlight>
                                            <dx:GridViewFormatConditionIconSet FieldName="percCrescLucroTotal" Format="PositiveNegativeArrowsColored" />
                                            <dx:GridViewFormatConditionIconSet FieldName="percCrescReal" Format="PositiveNegativeArrowsColored" />
                            </FormatConditions>
                                        <Styles>
	                                        <FocusedRow BackColor="#CCFF33" ForeColor="#333333"> </FocusedRow>
	                                        	<Header HorizontalAlign="Center" Font-Size="Small" BackColor="#666633" ForeColor="White">
                                            </Header>
	                                        	<AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                            <Cell Font-Size="Small">
                                            </Cell>
                                            <Footer Font-Bold="True" Font-Size="Small">
                                            </Footer>
                                            <TitlePanel HorizontalAlign="Left">
                                            </TitlePanel>
                                        </Styles>                                        
                                        <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="400" 
                                            ShowFooter="True" ShowHorizontalScrollBar="True" ShowHeaderFilterButton="True" />
                                        <SettingsText EmptyDataRow="Não há informações disponiveis ainda para esse período e seção" 
                                            />
                                    </dx:ASPxGridView>        

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Vendas_Dia.uspSLV002" SelectCommandType="StoredProcedure"    >
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="iAT" SessionField="sDATA_INICIAL" />
                                <asp:SessionParameter DbType="Date" Name="fAT" SessionField="sDATA_FINAL" />
                                <asp:SessionParameter Name="vOpcao" SessionField="sOPCAO" Type="Byte" />
                                <asp:SessionParameter Name="idMesmosDias" SessionField="sMESMOS_DIAS" Type="Byte" />
                                <asp:SessionParameter Name="Usuario" SessionField="sUSUARIO" Type="String" />
                                <asp:SessionParameter Name="Delivery" SessionField="sDELIVERY" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                      
                        <asp:Label ID="lblTeste" runat="server" Visible="true" ForeColor="Red"></asp:Label>

                        <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="Database: DW_Condor_One"  Anotacao2="Stored: Vendas_Dia.uspSLV002"/>

                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </div>
            
    
   
</asp:Content>

