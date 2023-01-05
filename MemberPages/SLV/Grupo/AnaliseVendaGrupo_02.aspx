<%@ Page Title="Análise de Vendas por Seção" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="AnaliseVendaGrupo_02.aspx.vb" Inherits="MemberPages_SLV_AnaliseVendaGrupo_02" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register src="../../../Controles/wucListaDiaIniFin.ascx" tagname="wucListaDiaIniFin" tagprefix="uc1" %>




<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>


<%@ Register src="../../../Controles/wucBotaoExcel.ascx" tagname="wucBotaoExcel" tagprefix="uc4" %>

<%@ Register assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>

<%@ Register src="../../../Controles/wucListaLojasComCorporacao.ascx" tagname="wucListaLojasComCorporacao" tagprefix="uc7" %>
<%@ Register Src="~/Controles/wucListaDeptoSecao.ascx" TagPrefix="uc1" TagName="wucListaDeptoSecao" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    
   <style type ="text/css" >
        html {            
            overflow-x:hidden;            
        }

        #moldura {
            width:1024px;
            margin: 0 auto ;            
        }

        #divMercadologico {
           float: left;
           margin-left: 1px;
        }

        #divFilial {
           float: left;
           width: 320px;
           padding-left: 2px;
        }

        #divPeriodo {    
           float: left;                  
           padding-left: 2px;  
           width: 290px;                           
        }

        .myBorder {
            border: 1px solid #bdbbbb;
            height: 25px;
            margin-left: 1px;  
            margin-top: 2px;          
        }

        #divDados {
            clear: both;
            float: left;
            padding-top: 2px;
            width: 1015px;
            margin-left: 1px;            
        }

        #divGrafico {            
            float: left;
            padding-top: 5px;                        
        }

        #divBotaoAtualizar {
            float: left;
            margin-left: 2px;
            width: 80px;  
            padding-top: 2px; 
                                           
        }

        #divBotaoExcel {
            float: left;
                       width: 80px;  
            padding-top: 2px;                                
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="moldura">
        <div id="divMercadologico" style="border: 1px solid #bdbbbb;margin-top: 2px">
            <uc1:wucListaDeptoSecao runat="server" ID="cboMercadologico" />
        </div>

        <div id="divFilial" class="myBorder">
            <uc7:wucListaLojasComCorporacao ID="cboFilial" runat="server" />
        </div>

        <div id="divPeriodo" class="myBorder" >
            <uc1:wucListaDiaIniFin ID="cboDia" runat="server" />
        </div>     

        <div id="divBotaoAtualizar">
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis" Height="32px">
                <ClientSideEvents Click="function(s, e) {
	cbPanelGrid.PerformCallback();
}" />
            </dx:ASPxButton>
        </div>

        <div id="divBotaoExcel">
            <uc4:wucBotaoExcel ID="btnExcel" runat="server" />
        </div>

        <div id="divDados">
            <dx:ASPxCallbackPanel ID="cbPanelGrid" runat="server" Width="1020px" ClientInstanceName="cbPanelGrid" Theme="Metropolis">
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttributes="both">
                        <div id="divGrid1">
                            <dx:ASPxGridView ID="grid" runat="server" 
                                DataSourceID="SqlDataSource1" AutoGenerateColumns="False" 
                                EnableTheming="True" Theme="SoftOrange" 
                                KeyFieldName="idFilial" Visible="False" Width="1000px">
                                <TotalSummary>
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAA" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAA" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartAA" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargemAA" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAA" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeMA" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaMA" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartMA" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargemMA" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemMA" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAT" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAT" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartAT" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargemAT" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAT" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescQtde" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescLucro" SummaryType="Custom" />
                                </TotalSummary>
                                <Columns>                                           

                    <%--Dados Ano Anterior--%>

                    <%--Dados Mês Anterior--%>
                                 
                        <%--% Dados Ano Atual--%>

                        <%--% Crescimento--%>
                                                                                     
                        <%--Meta--%>
                                    <dx:GridViewBandColumn Caption="Mês Anterior" Name="bandMesAnterior" VisibleIndex="3" Visible="False">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeMA" ToolTip="Quantidade do mês anterior (mesmo dias)" VisibleIndex="0" Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#FF9900" HorizontalAlign="Center" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVendaMA" ToolTip="Valor de venda do mês anterior (mesmo dias)" VisibleIndex="1" Width="80px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#FF9900" HorizontalAlign="Center" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPartMA" ToolTip="Percentual de participação da venda da seção sobre a venda total" VisibleIndex="2" Width="60px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#FF9900" HorizontalAlign="Center" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrMargemMA" ToolTip="Valor do lucro do mês anterior (mesmo dias)" VisibleIndex="3" Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#FF9900" HorizontalAlign="Center" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargemMA" ToolTip="Percentual de margem do mês anterior (mesmo dias)" VisibleIndex="4" Width="60px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#FF9900" HorizontalAlign="Center" />
                                                <CellStyle ForeColor="Blue">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Ano Anterior" Name="bandAnoAnterior" VisibleIndex="2" Visible="False">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeAA" ToolTip="Quantidade do Ano Anterior (mesmo período)" VisibleIndex="0" Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVendaAA" ToolTip="Valor da venda do ano anterior (mesmo período)" VisibleIndex="1" Width="80px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPartAA" ToolTip="Percentual de participação da venda da seção sobre a venda total" VisibleIndex="2" Width="60px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrMargemAA" ToolTip="Valor do lucro do ano anterior (mesmo período)" VisibleIndex="3" Width="80px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargemAA" ToolTip="Percentual de margem do ano anterior (mesmo período)" VisibleIndex="4" Width="60px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewCommandColumn VisibleIndex="0" Width="5px" ShowClearFilterButton="True"/>
                                    <dx:GridViewDataTextColumn FieldName="descGrupo" VisibleIndex="1" 
                                        Caption="Grupo" Width="250px">
                                        <HeaderStyle Font-Size="X-Large" HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <CellStyle Wrap="False">
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewBandColumn Caption="Ano Atual" Name="bandAnoAtual" VisibleIndex="11">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeAT" ToolTip="Quantidade vendida do período selecionado" VisibleIndex="0" Width="90px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                <CellStyle ForeColor="Blue">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVendaAT" ToolTip="Valor de venda do período selecionado" VisibleIndex="1" Width="90px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                <CellStyle ForeColor="Blue">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPartAT" ToolTip="Percentual de participação da venda da seção sobre a venda total" VisibleIndex="2" Width="60px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                <CellStyle ForeColor="Blue">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrMargemAT" ToolTip="Valor do lucro do período selecionado" VisibleIndex="3" Width="90px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                <CellStyle ForeColor="Blue">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargemAT" ToolTip="Percentual de margem do período selecionado" VisibleIndex="4" Width="60px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                <CellStyle ForeColor="Blue">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="% de Crescimento" Name="bandCrescimento" VisibleIndex="17">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="R$" FieldName="percCresc" ToolTip="Percentual de crescimento de Venda entre periodo atual e periodo do ano anterior" VisibleIndex="0" Width="60px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Volume" FieldName="percCrescQtde" ToolTip="Percentual de crescimento de Quantidade entre periodo atual e periodo do ano anterior" VisibleIndex="1" Width="60px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Lucro" FieldName="percCrescLucro" ToolTip="Percentual de crescimento de Lucro entre periodo atual e periodo do ano anterior" VisibleIndex="2" Width="60px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </dx:GridViewBandColumn>
                                           
                                </Columns>
                                <SettingsBehavior AllowFocusedRow="True" />
                                <SettingsPager Mode="ShowAllRecords">
                                </SettingsPager>
                                <Styles>
	                                <FocusedRow BackColor="#CCFFFF" ForeColor="#333333"> </FocusedRow>
	                                    <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                    <Footer Font-Bold="True">
                                    </Footer>
                                </Styles>                                        
                                <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="350" ShowFilterBar="Auto" ShowFilterRow="True" ShowFilterRowMenu="True" ShowFooter="True" />
                                <SettingsText EmptyDataRow="Não há informações disponiveis ainda para esse período e seção" 
                                    />
                            </dx:ASPxGridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                                SelectCommand="SELECT [descGrupo], [QtdeAT], [vlrVendaAT], [percMargemAT], [QtdeAA], [vlrVendaAA], [percMargemAA], [vlrVendaMA], [QtdeMA], [percMargemMA], [percCresc], [vlrMeta], [percMargemMeta],[Tipo],[idFilial], [vlrMargemAA], [vlrMargemAT], [vlrMargemMA], [percCrescQtde], [percCrescLucro], [percPartAT], [percPartAA], [percPartMA] FROM [SLV].[AnaliseAnoAnterior] WHERE ([Usuario] = @Usuario) ORDER BY [Tipo]">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Usuario" SessionField="sUSUARIO" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>

                        <div id="divGrafico" >
                                    <dxchartsui:WebChartControl ID="grafico" runat="server" 
                                        DataSourceID="dsGrafico" Height="600px" Width="1000px" Visible="False">
                                        <borderoptions Color="LightGray" Thickness="4" />
                                        <diagramserializable>
                                            <cc1:XYDiagram>
                                                <axisx visibleinpanesserializable="-1">
                                                    <label>
                                                    <resolveoverlappingoptions allowhide="False" 
                                                            allowstagger="False" minindent="0" />
                                                    </label>
                                                    <range sidemarginsenabled="True" />
                                                    <gridlines visible="True">
                                                    </gridlines>
                                                </axisx>
                                                <axisy visible="False" visibleinpanesserializable="-1">
                                                    <range sidemarginsenabled="True" />
                                                </axisy>
                                            </cc1:XYDiagram>
                                        </diagramserializable>
                                        <fillstyle>
                                            <optionsserializable>
                                                <cc1:SolidFillOptions />
                                            </optionsserializable>
                                        </fillstyle>
                                        <legend Visibility="False"></legend>
                                        <seriesserializable>
                                            <cc1:Series ArgumentDataMember="descGrupo" LabelsVisibility="True" 
                                                Name="Series 1" ValueDataMembersSerializable="percCresc" ArgumentScaleType="Qualitative">
                                                <viewserializable>
                                                    <cc1:SideBySideBarSeriesView ColorEach="True">
                                                    </cc1:SideBySideBarSeriesView>
                                                </viewserializable>
                                                <labelserializable>
                                                    <cc1:SideBySideBarSeriesLabel LineVisible="True" Position="TopInside" 
                                                        ResolveOverlappingMode="Default" TextOrientation="TopToBottom">
                                                        <fillstyle>
                                                            <optionsserializable>
                                                                <cc1:SolidFillOptions />
                                                            </optionsserializable>
                                                        </fillstyle>
                                                        <pointoptionsserializable>
                                                            <cc1:PointOptions>
                                                            </cc1:PointOptions>
                                                        </pointoptionsserializable>
                                                    </cc1:SideBySideBarSeriesLabel>
                                                </labelserializable>
                                                <legendpointoptionsserializable>
                                                    <cc1:PointOptions>
                                                    </cc1:PointOptions>
                                                </legendpointoptionsserializable>
                                            </cc1:Series>
                                        </seriesserializable>
                                        <seriestemplate>
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </seriestemplate>
                                        <titles>
                                            <cc1:ChartTitle Text="Crescimento de Vendas por Grupo de Familia" 
                                                TextColor="Gray" />
                                        </titles>
                                        <crosshairoptions>
                                            <commonlabelpositionserializable>
                                                <cc1:CrosshairMousePosition />
                                            </commonlabelpositionserializable>
                                        </crosshairoptions>
                                        <tooltipoptions>
                                            <tooltippositionserializable>
                                                <cc1:ToolTipMousePosition />
                                            </tooltippositionserializable>
                                        </tooltipoptions>
                                    </dxchartsui:WebChartControl>

                                    <asp:SqlDataSource ID="dsGrafico" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                                        
                                        SelectCommand="SELECT 1 AS 'Number', descGrupo, percCresc FROM [SLV].[AnaliseAnoAnterior] WHERE [Usuario] = @Usuario AND (([percCresc]&lt;&gt;0) AND [percCresc] BETWEEN -100 AND 100) ORDER BY [percCresc]">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="Usuario" SessionField="sUSUARIO" 
                                                DefaultValue="Eliseu" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

                        </div>
                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </div>

    </div>

</asp:Content>

