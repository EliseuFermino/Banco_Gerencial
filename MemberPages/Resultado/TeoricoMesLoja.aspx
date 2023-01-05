<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="TeoricoMesLoja.aspx.vb" Inherits="MemberPages_Resultado_TeoricoMesLoja" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>



<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMesPeriodo.ascx" TagPrefix="uc1" TagName="wuciListaMesPeriodo" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

         #divAno {
            clear:both;
            float: left;
            margin-top: 2px;            
        }

        #divMes {
            float: left;          
            margin-left: 20px;
            padding-top: 4px;
        }

        #divFilial {
            float:left;
            margin-left: 15px;
        }

        #BotaoAtualizar {
            float: left;
            margin-left: 5px;
            margin-top: 3px;
            padding-top: 6px;
            padding-left: 3px;
        }

        #Tamanho {
            float: left;
            margin-left: 2px;
            margin-top: 2px;
        }

        #Grid {
            clear:both;
            float: left;
            padding-top: 2px;
        }       

        #Periodo {
            float: left;
            margin-left: 2px;
            margin-top: 10px;
            padding-top: 5px;
           
        }

    
        
        #MostrarCabecalho {
            float: left;
            margin-left: 2px;
            width: 155px;            
        }         

        .myBorder {
            border: 1px solid #bdbbbb;
            height: 28px;
            margin-left: 1px;            
        }

        #divCheckGroup {
            clear: both;
            float: left;
            border: 1px dashed #C0C0C0;     
            margin-top: 2px;                          
         }

        .divCheck {
            float: left;
            width: 150px;
         }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divAno" >        
        <uc1:wucAno runat="server" ID="cboAno"  />
    </div>

    <div id="divMes" >
        <uc1:wuciListaMesPeriodo runat="server" ID="cboMes" />
    </div>

    <div id="divFilial" >
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" AutoPostBack ="false"  />
    </div>

<div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanelTeorico.PerformCallback();cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>


    <div id="ShowButton"  runat="server" >
        <dx:ASPxButton ID="btnShowButton" runat="server" Text="Ver Loja a Loja" AutoPostBack="false"  Visible ="False"
            Theme="SoftOrange" ClientInstanceName="meuBotao" ClientSideEvents-Click="function(s, e) { MudarTextoBotao(); }">
        </dx:ASPxButton>
    </div>
    
    <div id="divCheckGroup">
            <div class ="divCheck">
                <dx:ASPxCheckBox ID="chkVerOriginal" runat="server" Text="Ver Meta Original" AutoPostBack ="false" Theme ="DevEx" 
                    Checked="false" ForeColor="Orange">
                    <ClientSideEvents CheckedChanged="function(s, e) {	cbPanel.PerformCallback();}" />
                </dx:ASPxCheckBox>
            </div>

            <div class ="divCheck">
                <dx:ASPxCheckBox ID="chkVerRevista" runat="server" Text="Ver Meta Revista" AutoPostBack ="false" Theme ="DevEx" 
                    Checked="true" ForeColor="Green">
                    <ClientSideEvents CheckedChanged="function(s, e) {	cbPanel.PerformCallback();}" />
                </dx:ASPxCheckBox>
            </div>

            <div class ="divCheck">
                <dx:ASPxCheckBox ID="chkVerRealizado" runat="server" Text="Ver Realizado" AutoPostBack ="false" Theme ="DevEx" 
                    Checked="true" ForeColor="Blue">
                    <ClientSideEvents CheckedChanged="function(s, e) {	cbPanel.PerformCallback();}" />
                </dx:ASPxCheckBox>
            </div>

            <div class ="divCheck">
                <dx:ASPxCheckBox ID="chkVerDiferencas" runat="server" Text="Ver Diferenças" AutoPostBack ="false" Theme ="DevEx" 
                    Checked="true" ForeColor="Red">
                    <ClientSideEvents CheckedChanged="function(s, e) {	cbPanel.PerformCallback();}" />
                </dx:ASPxCheckBox>
            </div>

            <div id="MostrarCabecalho">
                <dx:ASPxCheckBox ID="chkMostrarCabecalho" runat="server" 
                    Checked="False" CheckState="Checked" Text="Fixar cabeçalho" Theme="DevEx">
                    <ClientSideEvents CheckedChanged="function(s, e) {	cbPanel.PerformCallback();}" />
                </dx:ASPxCheckBox>
            </div>
    </div>


     <dx:ASPxCallbackPanel ID="cboPanelTeorico" runat="server" Width="100%" ClientInstanceName="cbPanelTeorico" Theme="Metropolis"  Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>



        <div id="Grid">
   
                        <dx:ASPxGridView ID="gridGrupoMes" runat="server" AutoGenerateColumns="False" 
                            DataSourceID="dsGrupoMes" EnableTheming="True" Theme="SoftOrange" Width="1020px">
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
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAA" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOri" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRev" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReal" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difVlrRev" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealAA" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percOri" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRev" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percReal" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPercRev" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percDifReal" SummaryType="Custom" />
                            </TotalSummary>
                            <Columns>
                                <dx:GridViewCommandColumn VisibleIndex="0" Width="10px">
                                </dx:GridViewCommandColumn>
                                <dx:GridViewBandColumn Caption="Crescimento" VisibleIndex="9" 
                                    Name="band_Crescimento">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="% A.A." FieldName="percCresc" 
                                            ShowInCustomizationForm="True" 
                                            ToolTip="Percentual de Crescimento sobre o ano anterior" VisibleIndex="0" 
                                            Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="ID" FieldName="idGrupo" VisibleIndex="1" 
                                    Width="40px">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Diferenças" VisibleIndex="8" 
                                    Name="band_Diferencas">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Valor" FieldName="difVlrRev" 
                                            ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Meta" FieldName="difPercRev" 
                                            ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Real" FieldName="percDifReal" ShowInCustomizationForm="True" ToolTip="Diferença entre o Percentual Real Ano Anterior e Ano Atual" VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>    <%--Diferenças--%>

                                <dx:GridViewBandColumn Caption="Realizado" VisibleIndex="7" 
                                    Name="band_Realizado">
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="vlrReal" ShowInCustomizationForm="True" Width="100px" Caption="Valor" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
                                        <HeaderStyle BackColor="#3399FF"></HeaderStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="percReal" ShowInCustomizationForm="True" Width="60px" Caption="%" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
                                        <HeaderStyle BackColor="#3399FF"></HeaderStyle>
                                        <CellStyle><BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px"></BorderRight></CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>                               
                                </dx:GridViewBandColumn>    <%--Realizado--%>

                                <dx:GridViewBandColumn Caption="Meta Revista" VisibleIndex="5" 
                                    Name="band_MetaRevista">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrRev" VisibleIndex="0" 
                                            Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
                                            <HeaderStyle BackColor="#009900" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percRev" VisibleIndex="1" 
                                            Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
                                            <HeaderStyle BackColor="#009900" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>    <%--Meta Revista--%>

                                <dx:GridViewBandColumn Caption="Meta Original" VisibleIndex="4" 
                                    Name="band_MetaOriginal">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrOri" VisibleIndex="0" 
                                            Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
                                            <HeaderStyle BackColor="#CCCC00" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percOri" VisibleIndex="1" 
                                            Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
                                            <HeaderStyle BackColor="#CCCC00" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>    <%--Meta Original--%>

                                <dx:GridViewBandColumn Caption="Ano Anterior" VisibleIndex="3" 
                                    Name="band_AnoAnterior">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrRealAA" 
                                            VisibleIndex="0" Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
                                            <HeaderStyle BackColor="#CC9900" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percRealAA" VisibleIndex="1" 
                                            Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" ShowFilterRowMenu="False" />
                                            <HeaderStyle BackColor="#CC9900" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>   <%-- Ano Anterior--%>
                                <dx:GridViewDataTextColumn Caption="Descrição" FieldName="descConta" 
                                    VisibleIndex="2" Width="200px">
                                    <CellStyle Wrap="False">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior ColumnResizeMode="Control" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                            <Settings ShowTitlePanel="True" 
                                VerticalScrollableHeight="400" ShowFilterBar="Visible" ShowFilterRow="True" ShowFilterRowMenu="True" ShowFooter="True" />
                            <SettingsText CommandClearFilter="Limpar" EmptyDataRow="Não há informações para este período e loja" FilterBarCreateFilter="Limpar Filtro" />
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <Footer Font-Bold="True">
                                </Footer>
                            </Styles>
                        </dx:ASPxGridView>

                        <asp:SqlDataSource ID="dsGrupoMes" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" 
                        
                        
                            SelectCommand="Resultados.uspBuscarTeoricoMes" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" DbType="Int16" SessionField="sANO" />
                                <asp:SessionParameter Name="Mes" DbType="Byte" SessionField="sMES" />
                                <asp:SessionParameter Name="idFilial" DbType="Int16" SessionField="sFILIAL" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    
             <div id="divTituloGrafico24Meses_UltimaLinha">
                            Resultado da Última Linha - Mês a Mês - Último Dois Anos
                        </div>

                        <div id="divGrafico24Meses_UltimaLinha">
                                <dxchartsui:WebChartControl ID="Grafico24Meses_UltimaLinha" runat="server" DataSourceID="dsDados24MesesUltimaLinha" Height="400px" Width="1020px" BackColor="Transparent" CrosshairEnabled="True">
                                    <borderoptions color="Silver" />
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="-1">
                                                <label angle="90">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                            </axisx>
                                            <axisy visibleinpanesserializable="-1" visible="False">
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                            <defaultpane backcolor="Transparent" bordervisible="False">
                                            </defaultpane>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
                    <FillStyle><OptionsSerializable>
                    <cc1:SolidFillOptions></cc1:SolidFillOptions>
                    </OptionsSerializable>
                    </FillStyle>

                                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="10">
                                        <margins bottom="0" />
                                    </legend>

                                    <seriesserializable>
                                        <cc1:Series ArgumentDataMember="DescMes" Name="Meta" ValueDataMembersSerializable="percRev" LabelsVisibility="True">
                                            <datafilters>
                                                <cc1:DataFilter ColumnName="Tipo" DataType="System.Int32" InvariantValueSerializable="1" />
                                            </datafilters>
                                            <viewserializable>
                                                <cc1:SplineAreaSeriesView Color="119, 128, 255, 128" MarkerVisibility="True" Transparency="136">
                                                    <markeroptions size="5" BorderVisible="True">
                                                    </markeroptions>
                                                </cc1:SplineAreaSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="False" Angle="90" TextOrientation="BottomToTop">
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
                                                </cc1:PointSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Number" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="DescMes" ArgumentScaleType="Qualitative" Name="Realizado" ValueDataMembersSerializable="percRea" LabelsVisibility="True">
                                            <datafilters>
                                                <cc1:DataFilter ColumnName="Tipo" DataType="System.Int32" InvariantValueSerializable="1" />
                                            </datafilters>
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Color="175, 30, 144, 255" Transparency="80">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Position="BottomInside">
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
                                <asp:SqlDataSource ID="dsDados24MesesUltimaLinha" runat="server" ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" SelectCommand="Resultados.uspBuscarGrupo_24Meses" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                                        <asp:Parameter DefaultValue="47" Name="idGrupo" Type="Int16" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                        </div>

                        <div id="divTituloGraficoUltimaLinha_Quadrimestres">
                            Quadrimestres - Último Dois Anos
                        </div>

                       
                        <div id="divGraficoUltimaLinha_Quadrimestres">
                                <dxchartsui:WebChartControl ID="GraficoUltimaLinha_Quadrimestres" runat="server" DataSourceID="dsDados24MesesUltimaLinha" Height="200px" Width="600px" BackColor="Transparent">
                                    <borderoptions color="Silver" />
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="-1">
                                                <label angle="0">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                            </axisx>
                                            <axisy visibleinpanesserializable="-1" visible="False">
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                            <defaultpane backcolor="Transparent" bordervisible="False">
                                            </defaultpane>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
                    <FillStyle><OptionsSerializable>
                    <cc1:SolidFillOptions></cc1:SolidFillOptions>
                    </OptionsSerializable>
                    </FillStyle>

                                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="20">
                                        <margins bottom="0" />
                                    </legend>

                                    <seriesserializable>
                                        <cc1:Series ArgumentDataMember="DescMes" Name="Meta" ValueDataMembersSerializable="percRev" LabelsVisibility="True">
                                            <datafilters>
                                                <cc1:DataFilter ColumnName="Tipo" DataType="System.Int32" InvariantValueSerializable="2" />
                                            </datafilters>
                                            <viewserializable>
                                                <cc1:SplineAreaSeriesView Color="119, 128, 255, 128" MarkerVisibility="True" Transparency="136">
                                                    <markeroptions size="5" BorderVisible="True">
                                                    </markeroptions>
                                                </cc1:SplineAreaSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="False" Angle="90" TextOrientation="BottomToTop">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:PointSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="DescMes" ArgumentScaleType="Qualitative" Name="Realizado" ValueDataMembersSerializable="percRea" LabelsVisibility="True">
                                            <datafilters>
                                                <cc1:DataFilter ColumnName="Tipo" DataType="System.Int32" InvariantValueSerializable="2" />
                                            </datafilters>
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Color="175, 30, 144, 255" Transparency="80">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Position="BottomInside">
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
                        </div>

                        <div id="divTituloGraficoUltimaLinha_Acumulado">
                            Acumulado - Último Dois Anos
                        </div>

                        <div id="divGraficoUltimaLinha_Acumulado">
                                <dxchartsui:WebChartControl ID="GraficoUltimaLinha_Acumulado" runat="server" DataSourceID="dsDados24MesesUltimaLinha" Height="200px" Width="390px" BackColor="Transparent">
                                    <borderoptions color="Silver" />
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="-1">
                                                <label angle="0">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                            </axisx>
                                            <axisy visibleinpanesserializable="-1" visible="False">
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                            <defaultpane backcolor="Transparent" bordervisible="False">
                                            </defaultpane>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
                    <FillStyle><OptionsSerializable>
                    <cc1:SolidFillOptions></cc1:SolidFillOptions>
                    </OptionsSerializable>
                    </FillStyle>

                                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="20">
                                        <margins bottom="0" />
                                    </legend>

                                    <seriesserializable>
                                        <cc1:Series ArgumentDataMember="DescMes" Name="Meta" ValueDataMembersSerializable="percRev" LabelsVisibility="True">
                                            <datafilters>
                                                <cc1:DataFilter ColumnName="Tipo" DataType="System.Int32" InvariantValueSerializable="3" />
                                            </datafilters>
                                            <viewserializable>
                                                <cc1:SplineAreaSeriesView Color="119, 128, 255, 128" MarkerVisibility="True" Transparency="136">
                                                    <markeroptions size="5" BorderVisible="True">
                                                    </markeroptions>
                                                </cc1:SplineAreaSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="False" Angle="90" TextOrientation="BottomToTop">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:PointSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="DescMes" ArgumentScaleType="Qualitative" Name="Realizado" ValueDataMembersSerializable="percRea" LabelsVisibility="True">
                                            <datafilters>
                                                <cc1:DataFilter ColumnName="Tipo" DataType="System.Int32" InvariantValueSerializable="3" />
                                            </datafilters>
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Color="175, 30, 144, 255" Transparency="80">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Position="BottomInside">
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
                        </div>
        
        </div>   

             <asp:Label ID="lblOBS" runat="server" Text="TESTE" Visible="false" ></asp:Label>


             </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>



    <%--Aqui começa a caixa modal--%>
    <dx:ASPxPopupControl ID="PopupControl" runat="server" LoadContentViaCallback="OnFirstShow" Theme="Metropolis"
                                PopupElementID="ShowButton" PopupVerticalAlign="Below" PopupHorizontalAlign="WindowCenter" AllowDragging="True"
                          ShowHeader="true" ShowCloseButton="true" Width="900px" Height="115px" 
                         HeaderText="Updatable content" ClientInstanceName="ClientPopupControl" ShowRefreshButton="True" SettingsLoadingPanel-Text="Aguarde. Atualizando&amp;hellip;" SettingsLoadingPanel-Enabled="True">
<SettingsLoadingPanel Text="Aguarde. Atualizando&amp;hellip;"></SettingsLoadingPanel>
        <HeaderTemplate>
            <asp:UpdatePanel ID="upGrupo" runat="server">
                <ContentTemplate>

                     

                </ContentTemplate>
            </asp:UpdatePanel>           
        </HeaderTemplate>

        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl" runat="server">
  <%--              <div style="vertical-align:middle">
                    The content of this popup control is relevant to: <b> <%= DateTime.Now.ToLongTimeString() %></b>
                     <asp:Label ID="lblDados" runat="server" Text="Label"></asp:Label>
                </div>--%>
                <div>

                    <dx:ASPxComboBox ID="cboGrupo" runat="server" AutoPostBack ="false" Caption="Selecione" ValueType="System.String" DataSourceID="dsCadastroGrupo" Native="True" TextField="listaGrupo" ValueField="idGrupo">
                        <ClientSideEvents SelectedIndexChanged="function(s, e) {
	cpContas.PerformCallback();
}" />
                    </dx:ASPxComboBox>
                     <asp:SqlDataSource ID="dsCadastroGrupo" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="SELECT [idGrupo], [listaGrupo] FROM [Cadastros].[tblCategoriaLinha]"></asp:SqlDataSource>
                    

                    <dx:ASPxCallbackPanel ID="cpContas" runat="server" Width="100%" ClientInstanceName="cpContas">
                            <PanelCollection>         
                                <dx:PanelContent>

                     <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dsAnalisePorConta" Width="700px" Theme="Office2010Black" KeyFieldName="Descricao" ClientInstanceName="ASPxGridView1">
                               <Columns>
                                   <dx:GridViewDataTextColumn FieldName="idFilial" VisibleIndex="0" Visible="False" Width="50"></dx:GridViewDataTextColumn>
                                   <dx:GridViewDataTextColumn FieldName="Descricao" VisibleIndex="1" Caption="Filial" Width="190px">
                                       <CellStyle Wrap="False">
                                       </CellStyle>
                                   </dx:GridViewDataTextColumn>
                                   <dx:GridViewBandColumn Caption="Ano Anterior" Name="bandAnoAnterior" VisibleIndex="2">
                                       <Columns>
                                           <dx:GridViewDataTextColumn Caption="Real" FieldName="vlrRealAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                               <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                               </PropertiesTextEdit>
                                               <CellStyle>
                                                   <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                               </CellStyle>
                                           </dx:GridViewDataTextColumn>
                                           <dx:GridViewDataTextColumn Caption="%" FieldName="percRealAA" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                                               <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                               </PropertiesTextEdit>
                                           </dx:GridViewDataTextColumn>
                                       </Columns>
                                   </dx:GridViewBandColumn>
                                   <dx:GridViewBandColumn Caption="Realizado" Name="bandAnoAtual" VisibleIndex="4">
                                       <Columns>
                                           <dx:GridViewDataTextColumn Caption="Real" FieldName="vlrReal" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                                               <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                               </PropertiesTextEdit>
                                               <CellStyle ForeColor="Blue">
                                                   <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                               </CellStyle>
                                           </dx:GridViewDataTextColumn>
                                           <dx:GridViewDataTextColumn Caption="%" FieldName="percReal" ShowInCustomizationForm="True" VisibleIndex="2" Width="60px">
                                               <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                               </PropertiesTextEdit>
                                               <CellStyle ForeColor="Blue">
                                               </CellStyle>
                                           </dx:GridViewDataTextColumn>
                                       </Columns>
                                   </dx:GridViewBandColumn>
                                   <dx:GridViewBandColumn Caption="Dif. Meta" VisibleIndex="5" ToolTip="Diferença entre Meta e Realizado">
                                       <Columns>
                                           <dx:GridViewDataTextColumn Caption="Valor" FieldName="difVlrRev" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                                               <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                               </PropertiesTextEdit>
                                               <CellStyle>
                                                   <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                               </CellStyle>
                                           </dx:GridViewDataTextColumn>
                                           <dx:GridViewDataTextColumn Caption="%" FieldName="difPercRev" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                                               <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                               </PropertiesTextEdit>
                                           </dx:GridViewDataTextColumn>
                                       </Columns>
                                   </dx:GridViewBandColumn>
                                   <dx:GridViewBandColumn Caption="Meta Revista" VisibleIndex="3">
                                       <Columns>
                                           <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrRev" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                               <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                               </PropertiesTextEdit>
                                               <CellStyle ForeColor="#009900">
                                                   <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                               </CellStyle>
                                           </dx:GridViewDataTextColumn>
                                           <dx:GridViewDataTextColumn Caption="%" FieldName="percRev" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                                               <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                               </PropertiesTextEdit>
                                               <CellStyle ForeColor="#009900">
                                               </CellStyle>
                                           </dx:GridViewDataTextColumn>
                                       </Columns>
                                   </dx:GridViewBandColumn>
                                   <dx:GridViewBandColumn Caption="Dif. Ano.Ant." ToolTip="Diferença entre Realiazado versus Realizado Ano Anterior" VisibleIndex="8">
                                       <Columns>
                                           <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrDifAA" VisibleIndex="0" Width="80px">
                                               <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                               </PropertiesTextEdit>
                                               <CellStyle>
                                                   <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                               </CellStyle>
                                           </dx:GridViewDataTextColumn>
                                           <dx:GridViewDataTextColumn Caption="%" FieldName="percCrescAA" VisibleIndex="1" Width="60px">
                                               <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                               </PropertiesTextEdit>
                                           </dx:GridViewDataTextColumn>
                                       </Columns>
                                   </dx:GridViewBandColumn>
                               </Columns>
                               <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                               <SettingsPager Mode="ShowAllRecords">
                               </SettingsPager>
                               <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="400" ShowTitlePanel="True" />
                               <SettingsText Title="Comparativo loja a loja da conta selecionada" />
                               <Styles>
                                   <Header HorizontalAlign="Center"></Header>
	                                <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
	                                <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                   <TitlePanel Font-Size="Medium">
                                   </TitlePanel>
                               </Styles>
                            </dx:ASPxGridView>                           
 
                     <asp:SqlDataSource ID="dsAnalisePorConta" runat="server" ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" SelectCommand="usp_Buscar_TeoricoAnaliseTodasLojas" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                    <asp:ControlParameter ControlID="cboGrupo" DefaultValue="47" Name="idGrupo" PropertyName="Value" Type="Byte" />
                          
                                </SelectParameters>
                            </asp:SqlDataSource>  

                                    </dx:PanelContent>
                          </PanelCollection>
                    </dx:ASPxCallbackPanel>  


                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>

    </dx:ASPxPopupControl>


</asp:Content>

