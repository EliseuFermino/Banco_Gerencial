<%@ Page Title="Agenda 23 - Comparativo Entre Períodos" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="appQuebras011.aspx.vb" Inherits="MemberPages_Quebras_appQuebras011" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Src="~/Controles/wucMercadologico.ascx" TagPrefix="uc1" TagName="wucMercadologico" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>

<%@ Register Src="~/Controles/wucOpcoesSLV.ascx" TagPrefix="uc1" TagName="wucOpcoesSLV" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>




<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #pageHeaderLeft {
            clear:left;
            float: left;
            margin:3px 1px 2px 0px;         
            width: 210px;
                     
        }

        #pageHeaderRight {
            float: left;
            margin:1px 1px 2px 2px;          
        }  
        
        #pageHeaderRight_Baixo {
            clear: both ;
            float: left;             
            margin:0px 2px 2px 0px; 
    
        }             
        

        #divPeriodo{
            margin-top: -4px;
        }
        
        #divBotaoAtualizar { 
            float: left;            
            margin-left: 5px;
            width: 80px;  
            margin-top: 2px;                                
        }

        #divOpcao_MesAnterior {
            float: left;
            margin-top: 7px;                                       
        }

        #divOpcao_AnoAnterior {    
            float: left;       
            margin-left: 10px;   
            margin-top: 7px;                                              
        }


        #divGrafico {            
            float: left;
            padding-top: 5px;                        
        }

        #divSize {
            float:left ;           
            margin-top: -1px;
            margin-left: 15px;
        }             
       
        #divDados {
            clear: both;
            float: left;            
            width: 100%;
            margin-left: 1px;            
        }  
        
        .MsgInformation {
            margin: 30px;
            padding: 50px;
            background-color: #fc6969;
            border: 10px solid red;
            font-size:x-large;
            color: white;
            border-radius: 5px;
            text-align: center;
        }      

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="pageHeaderLeft">
        <div id="divMercadologico">
             <uc1:wucMercadologico runat="server" ID="cboMercadologico" />
        </div>
    </div>

    <div id="pageHeaderRight">
        <div id="divFilial" class="BGC_myBorder">
            <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
        </div>

        <div id="divPeriodo" Class="BGC_Periodo" >
            <uc1:wucListaDiaIniFin runat="server" ID="cboPeriodo" />
        </div>

        <div id="divBotaoAtualizar">
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis" Height="25px">
                <ClientSideEvents Click="function(s, e) {	cbPanelGrid.PerformCallback();}" />
            </dx:ASPxButton>
        </div>

        <div id="pageHeaderRight_Baixo">
            <div id="divOpcao_MesAnterior">
                <dx:ASPxRadioButton ID="rndOpcaoMesAnterior" runat="server" Text="Mês Anterior" AutoPostBack="false" GroupName="gnOpcao" ToolTip="Clique aqui para buscar a informação dos mesmos dias do período selecionado, só que do Mês Anterior"></dx:ASPxRadioButton>
            </div>

            <div id="divOpcao_AnoAnterior">
                <dx:ASPxRadioButton ID="rndOpcaoAnoAnterior" runat="server" Text="Ano Anterior" AutoPostBack="false" GroupName="gnOpcao" ToolTip="Clique aqui para buscar a informação dos mesmos dias do período selecionado, só que do Ano Anterior"></dx:ASPxRadioButton>
            </div>

            <div id="divSize">
                <uc1:wucSize runat="server" ID="cboSize" AutoPostBack="false" />
            </div>


        </div>

    </div>
 


    
        <div id="divDados">
            <dx:ASPxCallbackPanel ID="cbPanelGrid" runat="server" Width="100%" ClientInstanceName="cbPanelGrid" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde&amp;hellip;">
<SettingsLoadingPanel Text="Aguarde&amp;hellip;"></SettingsLoadingPanel>
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttributes="both">

                        <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" 
                                        EnableTheming="True" Theme="SoftOrange" Visible="False" 
                                        Width="100%" DataSourceID="SqlDataSource1" KeyFieldName="Lista">
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
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercial" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="qtdeAT" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrAT" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="qtdeAA" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrAA" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDif" SummaryType="Sum" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />

                                        </TotalSummary>
                                        <Columns>                                           

                         

                         <%--Dados Mês Anterior--%>
                                 
                               

                               
                                                                                     
                                

                                            <%--Dados Ano Anterior--%>

                                            <%--Meta--%>

                                             <%--% Crescimento--%>
                                            
                                            <%--% Dados Ano Atual--%>
                                            <dx:GridViewDataTextColumn FieldName="Lista" VisibleIndex="0" FixedStyle="Left" Width="200px">
                                                <CellStyle Wrap="False">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                                <FooterCellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewBandColumn Caption="Venda e Margem 2014" ShowInCustomizationForm="True" VisibleIndex="1" Name="bandVenda">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVenda" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucroComercial" ShowInCustomizationForm="True" VisibleIndex="2" Width="80px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargem" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                        <FooterCellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde" ShowInCustomizationForm="True" ToolTip="Quantidade de Itens Vendidos" VisibleIndex="0" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Agenda 23 - 2013" ShowInCustomizationForm="True" VisibleIndex="3" Name="bandAgendaAA">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Volume" FieldName="qtdeAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrAA" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percAA" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="60px">
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
                                            <dx:GridViewBandColumn Caption="Agenda 23 - 2014" ShowInCustomizationForm="True" VisibleIndex="2" Name="bandAgendaAT">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Volume" FieldName="qtdeAT" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percAT" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="60px">
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
                                            <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento da agenda 23" VisibleIndex="7" Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Diferença" FieldName="vlrDif" ShowInCustomizationForm="True" ToolTip="Diferença do valor da agenda 23. Ano Atual - Ano Anterior" VisibleIndex="5" Width="80px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>

                                        </Columns>
                                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                        <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                             <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                                        <Styles>
	                                        <FocusedRow BackColor="#FFFF99" ForeColor="#0066FF" Font-Bold="True"> </FocusedRow>
	                                        	<Header HorizontalAlign="Center" Font-Size="Small">
                                            </Header>
	                                        	<AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                            <Cell Font-Size="Small">
                                            </Cell>
                                            <Footer Font-Bold="True">
                                            </Footer>
                                        </Styles>                                        
                                        <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="300" 
                                            ShowFooter="True" ShowHorizontalScrollBar="True" 
                                            UseFixedTableLayout="True" />
                                        <SettingsText EmptyDataRow="Não há informações disponiveis ainda para esse período e seção" 
                                            />
                                    </dx:ASPxGridView>        
                        

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="Analises.uspQuebras011" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="DiaInicial" SessionField="sDIA_INICIAL" DbType="Date" />
                                <asp:SessionParameter DbType="Date" Name="DiaFinal" SessionField="sDIA_FINAL" />
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                <asp:SessionParameter Name="idTipo" SessionField="sOPCAO" Type="Byte" />
                                <asp:SessionParameter Name="idMercadologico" SessionField="sMERCADOLOGICO" Type="Int16" />
                                <asp:SessionParameter Name="idMesAnoAnterior" SessionField="sMES_ANO_ANTERIOR" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        
                        <div id="divInformation" runat="server" visible="false" class="MsgInformation">
                            Os Período de Dias tem que estar dentro do mesmo Mes e Ano.
                        </div>

                        <br />
                        <br />

                        <dx:WebChartControl ID="chartPercentual" runat="server" DataSourceID="dsQuebraPercentual" Height="400px" Width="1700px">

                            <DiagramSerializable>
                                <cc1:XYDiagram>
                                <axisx reverse="True" visibility="True" visibleinpanesserializable="-1">
                                    <label angle="90">
                                    </label>
                                </axisx>
                                <axisy visibility="False" visibleinpanesserializable="-1">
                                </axisy>
                                </cc1:XYDiagram>
                            </DiagramSerializable>

<Legend Name="Default Legend" AlignmentHorizontal="Center" AlignmentVertical="BottomOutside" Direction="BottomToTop" MarkerSize="21, 16" MaxCrosshairContentWidth="200" MaxVerticalPercentage="10" TextOffset="10" VerticalIndent="1" Visibility="True">
    <border visibility="True" />
    <title wordwrap="True"></title></Legend>

                            <SeriesSerializable>
                                <cc1:Series ArgumentDataMember="Caption" ArgumentScaleType="Qualitative" Name="Meta" ValueDataMembersSerializable="percAg23meta">
                                <viewserializable>
                                    <cc1:AreaSeriesView MarkerVisibility="False">
                                    </cc1:AreaSeriesView>
                                </viewserializable>
                                <labelserializable>
                                    <cc1:PointSeriesLabel LineVisibility="True">
                                    </cc1:PointSeriesLabel>
                                </labelserializable>
                                </cc1:Series>
                                <cc1:Series ArgumentDataMember="Caption" ArgumentScaleType="Qualitative" LabelsVisibility="True" Name="Realizado" ValueDataMembersSerializable="percAg23">
                                <labelserializable>
                                    <cc1:SideBySideBarSeriesLabel Position="Top" TextPattern="{V:n2}">
                                    </cc1:SideBySideBarSeriesLabel>
                                </labelserializable>
                                </cc1:Series>
                            </SeriesSerializable>

                        </dx:WebChartControl>

                        <asp:SqlDataSource ID="dsQuebraPercentual" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="Analises.uspPerdas_por_Mes" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                <asp:SessionParameter Name="idTipo" SessionField="sOPCAO" Type="Byte" />
                                <asp:SessionParameter Name="idMercadologico" SessionField="sMERCADOLOGICO" Type="Int16" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </dx:PanelContent>
                </PanelCollection>                

            </dx:ASPxCallbackPanel>
        </div>

   
</asp:Content>

