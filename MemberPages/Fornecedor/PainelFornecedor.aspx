<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="PainelFornecedor.aspx.vb" Inherits="MemberPages_Fornecedor_PainelFornecedor" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>

<%@ Register Src="~/Controles/wucFornecedor.ascx" TagPrefix="uc1" TagName="wucFornecedor" %>

<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Src="~/Controles/wucListaFornecedor.ascx" TagPrefix="uc1" TagName="wucListaFornecedor" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >


        #divFornecedor {            
            float: left;
            margin-left: 10px;
            width: 600px;
        }

        #divBotaoAtualizar {            
            float: left;
            margin-left: 15px;
            
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divBaseCNPJ {
            float: left;         
             margin-top: 4px;
        }

        .divChartLayout {
            border: 1px solid gray;
            margin: 1px;
            padding: 3px;
            border-radius: 4px;            
        }

        #divFaturamento_Fornecedor {
            background-color: lightcyan;            
        }

        #divFornecedor_Lucro {
            background-color: cornsilk;            
        }

        #divFornecedor_Margem {
            background-color: lightyellow;           
        }



    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


    <div id="divFornecedor">
        <uc1:wucFornecedor runat="server" ID="cboFornecedor" />        
    </div>

    <div id="divBaseCNPJ">
        <dx:ASPxCheckBox ID="chkBaseCNPJ" runat="server" Theme="DevEx" Text="Base CNPJ" Checked="True" CheckState="Checked" Visible="False" >
            <ClientSideEvents CheckedChanged="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxCheckBox>
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>


        <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>
                  
                    <div id="divFaturamento_Fornecedor" class="divChartLayout">    <%-- Ultimos 24 Meses --%>
                        <dxchartsui:WebChartControl ID="chart_Faturamento_Fornecedor" runat="server" DataSourceID="ds_Faturamento_Fornecedor" Height="200px" Width="1050px" BackColor="Transparent">
                            <emptycharttext text="Não há vendas para esse fornecedor nos últimos 24 meses" />
                            <borderoptions visible="False" />
                            <diagramserializable>
                                <cc1:XYDiagram>
                                    <axisx visibleinpanesserializable="-1" reverse="True">
                                        <label angle="90">
                                        </label>
                                        <range sidemarginsenabled="True" />
                                        <gridlines color="Silver" minorcolor="Silver" visible="True">
                                            <linestyle dashstyle="Dash" />
                                            <minorlinestyle dashstyle="Dash" />
                                        </gridlines>
                                    </axisx>
                                    <axisy visible="False" visibleinpanesserializable="-1">
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

                            <legend Visibility="False"></legend>
                            <seriesserializable>
                                <cc1:Series ArgumentDataMember="Periodo" LabelsVisibility="True" Name="VendaFornecedor" ValueDataMembersSerializable="vlrVenda">
                                    <viewserializable>
                                        <cc1:LineSeriesView MarkerVisibility="True">
                                            <linemarkeroptions size="5" BorderVisible="True">
                                            </linemarkeroptions>
                                        </cc1:LineSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:PointSeriesLabel Angle="90" LineVisible="True" TextOrientation="BottomToTop">
                                            <fillstyle>
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                            <pointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Number" precision="0" />
                                                </cc1:PointOptions>
                                            </pointoptionsserializable>
                                        </cc1:PointSeriesLabel>
                                    </labelserializable>
                                    <legendpointoptionsserializable>
                                        <cc1:PointOptions>
                                            <valuenumericoptions format="Number" precision="0" />
                                        </cc1:PointOptions>
                                    </legendpointoptionsserializable>
                                </cc1:Series>
                            </seriesserializable>

<SeriesTemplate><ViewSerializable>
    <cc1:LineSeriesView MarkerVisibility="True">
        <linemarkeroptions BorderVisible="True">
        </linemarkeroptions>
    </cc1:LineSeriesView>
</ViewSerializable>
<LabelSerializable>
    <cc1:PointSeriesLabel LineVisible="True">
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
</LabelSerializable>
<LegendPointOptionsSerializable>
<cc1:PointOptions></cc1:PointOptions>
</LegendPointOptionsSerializable>
</SeriesTemplate>

                            <titles>
                                <cc1:ChartTitle Font="Tahoma, 14pt" Text="Venda do Fornecedor - 24 Meses" />
                            </titles>

<CrosshairOptions><CommonLabelPositionSerializable>
<cc1:CrosshairMousePosition></cc1:CrosshairMousePosition>
</CommonLabelPositionSerializable>
</CrosshairOptions>

<ToolTipOptions><ToolTipPositionSerializable>
<cc1:ToolTipMousePosition></cc1:ToolTipMousePosition>
</ToolTipPositionSerializable>
</ToolTipOptions>
                        </dxchartsui:WebChartControl>

                        <asp:SqlDataSource ID="ds_Faturamento_Fornecedor" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaFornecedoresConnectionString %>" SelectCommand="usp_Venda_24_Meses_Por_Fornecedor" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="idFornecedor" SessionField="sFORNECEDOR" Type="Int32" />
                                <asp:SessionParameter Name="CNPJ" SessionField="sCNPJ" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>   

                    <br />

                    <div id="div1" class ="divChartLayout">    <%-- Ultimos 24 Meses --%>
                        <dxchartsui:WebChartControl ID="chart_Crescimento_Venda" runat="server" DataSourceID="ds_Crescimento_Venda" Height="200px" Width="1050px" BackColor="Transparent">
                            <borderoptions visible="False" />
                            <diagramserializable>
                                <cc1:XYDiagram>
                                    <axisx visibleinpanesserializable="-1" reverse="True">
                                        <label angle="90">
                                        </label>
                                        <range sidemarginsenabled="True" />
                                        <gridlines color="Silver" minorcolor="Silver" visible="True">
                                            <linestyle dashstyle="Dash" />
                                            <minorlinestyle dashstyle="Dash" />
                                        </gridlines>
                                    </axisx>
                                    <axisy visible="False" visibleinpanesserializable="-1">
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

                            <legend Visibility="False"></legend>
                            <seriesserializable>
                                <cc1:Series ArgumentDataMember="Periodo" LabelsVisibility="True" Name="CrescVendaFornecedor" ValueDataMembersSerializable="percCresc">
                                    <viewserializable>
                                        <cc1:LineSeriesView MarkerVisibility="True">
                                            <linemarkeroptions size="5" BorderVisible="True">
                                            </linemarkeroptions>
                                        </cc1:LineSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:PointSeriesLabel Angle="90" LineVisible="True">
                                            <fillstyle>
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                            <pointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Number" precision="2" />
                                                </cc1:PointOptions>
                                            </pointoptionsserializable>
                                        </cc1:PointSeriesLabel>
                                    </labelserializable>
                                    <legendpointoptionsserializable>
                                        <cc1:PointOptions>
                                            <valuenumericoptions format="Number" precision="2" />
                                        </cc1:PointOptions>
                                    </legendpointoptionsserializable>
                                </cc1:Series>
                            </seriesserializable>

<SeriesTemplate><ViewSerializable>
    <cc1:LineSeriesView MarkerVisibility="True">
        <linemarkeroptions BorderVisible="True">
        </linemarkeroptions>
    </cc1:LineSeriesView>
</ViewSerializable>
<LabelSerializable>
    <cc1:PointSeriesLabel LineVisible="True">
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
</LabelSerializable>
<LegendPointOptionsSerializable>
<cc1:PointOptions></cc1:PointOptions>
</LegendPointOptionsSerializable>
</SeriesTemplate>

                            <titles>
                                <cc1:ChartTitle Font="Tahoma, 14pt" Text="Crescimento de Venda do Fornecedor - 24 Meses" />
                            </titles>

<CrosshairOptions><CommonLabelPositionSerializable>
<cc1:CrosshairMousePosition></cc1:CrosshairMousePosition>
</CommonLabelPositionSerializable>
</CrosshairOptions>

<ToolTipOptions><ToolTipPositionSerializable>
<cc1:ToolTipMousePosition></cc1:ToolTipMousePosition>
</ToolTipPositionSerializable>
</ToolTipOptions>
                        </dxchartsui:WebChartControl>
                        
                        <asp:SqlDataSource ID="ds_Crescimento_Venda" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaFornecedoresConnectionString %>" SelectCommand="usp_CrescimentoVenda_24_Meses_Por_Fornecedor" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="idFornecedor" SessionField="sFORNECEDOR" Type="Int32" />
                                <asp:SessionParameter Name="CNPJ" SessionField="sCNPJ" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>   

                    <br />
                    
                    
                    
                    <div id="div2" class="divChartLayout">    <%-- Ultimos 24 Meses --%>
                        <dxchartsui:WebChartControl ID="WebChartControl2" runat="server" DataSourceID="Volume_Valor" Height="200px" Width="1050px" BackColor="AntiqueWhite">
                            <emptycharttext text="Não há vendas para esse fornecedor nos últimos 24 meses" />
                            <borderoptions visible="False" />
                            <diagramserializable>
                                <cc1:XYDiagram>
                                    <axisx visibleinpanesserializable="-1" reverse="True">
                                        <label angle="90">
                                        </label>
                                        <range sidemarginsenabled="True" />
                                        <gridlines color="Silver" minorcolor="Silver" visible="True">
                                            <linestyle dashstyle="Dash" />
                                            <minorlinestyle dashstyle="Dash" />
                                        </gridlines>
                                    </axisx>
                                    <axisy visible="False" visibleinpanesserializable="-1">
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

                            <legend Visibility="False"></legend>
                            <seriesserializable>
                                <cc1:Series ArgumentDataMember="Periodo" LabelsVisibility="True" Name="VendaFornecedor" ValueDataMembersSerializable="vlrVenda">
                                    <viewserializable>
                                        <cc1:LineSeriesView MarkerVisibility="True">
                                            <linemarkeroptions size="5" BorderVisible="True">
                                            </linemarkeroptions>
                                        </cc1:LineSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:PointSeriesLabel Angle="90" LineVisible="True" TextOrientation="BottomToTop">
                                            <fillstyle>
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                            <pointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Number" precision="0" />
                                                </cc1:PointOptions>
                                            </pointoptionsserializable>
                                        </cc1:PointSeriesLabel>
                                    </labelserializable>
                                    <legendpointoptionsserializable>
                                        <cc1:PointOptions>
                                            <valuenumericoptions format="Number" precision="0" />
                                        </cc1:PointOptions>
                                    </legendpointoptionsserializable>
                                </cc1:Series>
                            </seriesserializable>

<SeriesTemplate><ViewSerializable>
    <cc1:LineSeriesView MarkerVisibility="True">
        <linemarkeroptions BorderVisible="True">
        </linemarkeroptions>
    </cc1:LineSeriesView>
</ViewSerializable>
<LabelSerializable>
    <cc1:PointSeriesLabel LineVisible="True">
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
</LabelSerializable>
<LegendPointOptionsSerializable>
<cc1:PointOptions></cc1:PointOptions>
</LegendPointOptionsSerializable>
</SeriesTemplate>

                            <titles>
                                <cc1:ChartTitle Font="Tahoma, 14pt" Text="Volume do Fornecedor - 24 Meses" />
                            </titles>

<CrosshairOptions><CommonLabelPositionSerializable>
<cc1:CrosshairMousePosition></cc1:CrosshairMousePosition>
</CommonLabelPositionSerializable>
</CrosshairOptions>

<ToolTipOptions><ToolTipPositionSerializable>
<cc1:ToolTipMousePosition></cc1:ToolTipMousePosition>
</ToolTipPositionSerializable>
</ToolTipOptions>
                        </dxchartsui:WebChartControl>

                        <asp:SqlDataSource ID="Volume_Valor" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaFornecedoresConnectionString %>" SelectCommand="usp_Volume_24_Meses_Por_Fornecedor" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="idFornecedor" SessionField="sFORNECEDOR" Type="Int32" />
                                <asp:SessionParameter Name="CNPJ" SessionField="sCNPJ" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>   

                    <br />

                    <div id="div3" class ="divChartLayout">    <%-- Ultimos 24 Meses --%>
                        <dxchartsui:WebChartControl ID="chart_Volume_Fornecedor" runat="server" DataSourceID="ds_Volume_Crescimento" Height="200px" Width="1050px" BackColor="Transparent">
                            <borderoptions visible="False" />
                            <diagramserializable>
                                <cc1:XYDiagram>
                                    <axisx visibleinpanesserializable="-1" reverse="True">
                                        <label angle="90">
                                        </label>
                                        <range sidemarginsenabled="True" />
                                        <gridlines color="Silver" minorcolor="Silver" visible="True">
                                            <linestyle dashstyle="Dash" />
                                            <minorlinestyle dashstyle="Dash" />
                                        </gridlines>
                                    </axisx>
                                    <axisy visible="False" visibleinpanesserializable="-1">
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

                            <legend Visibility="False"></legend>
                            <seriesserializable>
                                <cc1:Series ArgumentDataMember="Periodo" LabelsVisibility="True" Name="CrescVendaFornecedor" ValueDataMembersSerializable="percCresc">
                                    <viewserializable>
                                        <cc1:LineSeriesView MarkerVisibility="True">
                                            <linemarkeroptions size="5" BorderVisible="True">
                                            </linemarkeroptions>
                                        </cc1:LineSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:PointSeriesLabel Angle="90" LineVisible="True">
                                            <fillstyle>
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                            <pointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Number" precision="2" />
                                                </cc1:PointOptions>
                                            </pointoptionsserializable>
                                        </cc1:PointSeriesLabel>
                                    </labelserializable>
                                    <legendpointoptionsserializable>
                                        <cc1:PointOptions>
                                            <valuenumericoptions format="Number" precision="2" />
                                        </cc1:PointOptions>
                                    </legendpointoptionsserializable>
                                </cc1:Series>
                            </seriesserializable>

<SeriesTemplate><ViewSerializable>
    <cc1:LineSeriesView MarkerVisibility="True">
        <linemarkeroptions BorderVisible="True">
        </linemarkeroptions>
    </cc1:LineSeriesView>
</ViewSerializable>
<LabelSerializable>
    <cc1:PointSeriesLabel LineVisible="True">
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
</LabelSerializable>
<LegendPointOptionsSerializable>
<cc1:PointOptions></cc1:PointOptions>
</LegendPointOptionsSerializable>
</SeriesTemplate>

                            <titles>
                                <cc1:ChartTitle Font="Tahoma, 14pt" Text="Crescimento de Volume do Fornecedor - 24 Meses" />
                            </titles>

<CrosshairOptions><CommonLabelPositionSerializable>
<cc1:CrosshairMousePosition></cc1:CrosshairMousePosition>
</CommonLabelPositionSerializable>
</CrosshairOptions>

<ToolTipOptions><ToolTipPositionSerializable>
<cc1:ToolTipMousePosition></cc1:ToolTipMousePosition>
</ToolTipPositionSerializable>
</ToolTipOptions>
                        </dxchartsui:WebChartControl>
                        
                        <asp:SqlDataSource ID="ds_Volume_Crescimento" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaFornecedoresConnectionString %>" SelectCommand="usp_CrescimentoVolume_24_Meses_Por_Fornecedor" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="idFornecedor" SessionField="sFORNECEDOR" Type="Int32" />
                                <asp:SessionParameter Name="CNPJ" SessionField="sCNPJ" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>   

                    <br />

                     
                    
                    <div id="divFornecedor_Lucro" class ="divChartLayout">    <%-- Ultimos 24 Meses --%>
                        <dxchartsui:WebChartControl ID="chart_Lucro_Fornecedor" runat="server" DataSourceID="ds_Lucro_Fornecedor" Height="200px" Width="1050px" BackColor="Transparent">
                            <borderoptions visible="False" />
                            <diagramserializable>
                                <cc1:XYDiagram>
                                    <axisx visibleinpanesserializable="-1" reverse="True">
                                        <label angle="90">
                                        </label>
                                        <range sidemarginsenabled="True" />
                                        <gridlines color="Silver" minorcolor="Silver" visible="True">
                                            <linestyle dashstyle="Dash" />
                                            <minorlinestyle dashstyle="Dash" />
                                        </gridlines>
                                    </axisx>
                                    <axisy visible="False" visibleinpanesserializable="-1">
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

                            <legend Visibility="False"></legend>
                            <seriesserializable>
                                <cc1:Series ArgumentDataMember="Periodo" LabelsVisibility="True" Name="LucroFornecedor" ValueDataMembersSerializable="vlrLucro">
                                    <viewserializable>
                                        <cc1:LineSeriesView MarkerVisibility="True">
                                            <linemarkeroptions size="5" BorderVisible="True">
                                            </linemarkeroptions>
                                        </cc1:LineSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:PointSeriesLabel Angle="90" LineVisible="True" TextOrientation="BottomToTop">
                                            <fillstyle>
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                            <pointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Number" precision="0" />
                                                </cc1:PointOptions>
                                            </pointoptionsserializable>
                                        </cc1:PointSeriesLabel>
                                    </labelserializable>
                                    <legendpointoptionsserializable>
                                        <cc1:PointOptions>
                                            <valuenumericoptions format="Number" precision="0" />
                                        </cc1:PointOptions>
                                    </legendpointoptionsserializable>
                                </cc1:Series>
                            </seriesserializable>

<SeriesTemplate><ViewSerializable>
    <cc1:LineSeriesView MarkerVisibility="True">
        <linemarkeroptions BorderVisible="True">
        </linemarkeroptions>
    </cc1:LineSeriesView>
</ViewSerializable>
<LabelSerializable>
    <cc1:PointSeriesLabel LineVisible="True">
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
</LabelSerializable>
<LegendPointOptionsSerializable>
<cc1:PointOptions></cc1:PointOptions>
</LegendPointOptionsSerializable>
</SeriesTemplate>

                            <titles>
                                <cc1:ChartTitle Font="Tahoma, 14pt" Text="Lucro do Fornecedor - 24 Meses" />
                            </titles>

<CrosshairOptions><CommonLabelPositionSerializable>
<cc1:CrosshairMousePosition></cc1:CrosshairMousePosition>
</CommonLabelPositionSerializable>
</CrosshairOptions>

<ToolTipOptions><ToolTipPositionSerializable>
<cc1:ToolTipMousePosition></cc1:ToolTipMousePosition>
</ToolTipPositionSerializable>
</ToolTipOptions>
                        </dxchartsui:WebChartControl>
                        <asp:SqlDataSource ID="ds_Lucro_Fornecedor" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaFornecedoresConnectionString %>" SelectCommand="usp_Lucro_24_Meses_Por_Fornecedor" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="idFornecedor" SessionField="sFORNECEDOR" Type="Int32" />
                                <asp:SessionParameter Name="CNPJ" SessionField="sCNPJ" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>   

                    <br />

                    <div id="divFornecedor_LucroSellOut" class ="divChartLayout">    <%-- Ultimos 24 Meses --%>
                        <dxchartsui:WebChartControl ID="chart_LucroSellOut_Fornecedor" runat="server" DataSourceID="ds_LucroSellOut_Fornecedor" Height="200px" Width="1050px" BackColor="Transparent">
                            <borderoptions visible="False" />
                            <diagramserializable>
                                <cc1:XYDiagram>
                                    <axisx visibleinpanesserializable="-1" reverse="True">
                                        <label angle="90">
                                        </label>
                                        <range sidemarginsenabled="True" />
                                        <gridlines color="Silver" minorcolor="Silver" visible="True">
                                            <linestyle dashstyle="Dash" />
                                            <minorlinestyle dashstyle="Dash" />
                                        </gridlines>
                                    </axisx>
                                    <axisy visible="False" visibleinpanesserializable="-1">
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

                            <legend Visibility="False"></legend>
                            <seriesserializable>
                                <cc1:Series ArgumentDataMember="Periodo" LabelsVisibility="True" Name="LucroFornecedor" ValueDataMembersSerializable="vlrLucro">
                                    <viewserializable>
                                        <cc1:LineSeriesView MarkerVisibility="True">
                                            <linemarkeroptions size="5" BorderVisible="True">
                                            </linemarkeroptions>
                                        </cc1:LineSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:PointSeriesLabel Angle="90" LineVisible="True" TextOrientation="BottomToTop">
                                            <fillstyle>
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                            <pointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Number" precision="0" />
                                                </cc1:PointOptions>
                                            </pointoptionsserializable>
                                        </cc1:PointSeriesLabel>
                                    </labelserializable>
                                    <legendpointoptionsserializable>
                                        <cc1:PointOptions>
                                            <valuenumericoptions format="Number" precision="0" />
                                        </cc1:PointOptions>
                                    </legendpointoptionsserializable>
                                </cc1:Series>
                            </seriesserializable>

<SeriesTemplate><ViewSerializable>
    <cc1:LineSeriesView MarkerVisibility="True">
        <linemarkeroptions BorderVisible="True">
        </linemarkeroptions>
    </cc1:LineSeriesView>
</ViewSerializable>
<LabelSerializable>
    <cc1:PointSeriesLabel LineVisible="True">
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
</LabelSerializable>
<LegendPointOptionsSerializable>
<cc1:PointOptions></cc1:PointOptions>
</LegendPointOptionsSerializable>
</SeriesTemplate>

                            <titles>
                                <cc1:ChartTitle Font="Tahoma, 14pt" Text="Lucro SellOut do Fornecedor - 24 Meses" />
                            </titles>

<CrosshairOptions><CommonLabelPositionSerializable>
<cc1:CrosshairMousePosition></cc1:CrosshairMousePosition>
</CommonLabelPositionSerializable>
</CrosshairOptions>

<ToolTipOptions><ToolTipPositionSerializable>
<cc1:ToolTipMousePosition></cc1:ToolTipMousePosition>
</ToolTipPositionSerializable>
</ToolTipOptions>
                        </dxchartsui:WebChartControl>
                        <asp:SqlDataSource ID="ds_LucroSellOut_Fornecedor" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaFornecedoresConnectionString %>" SelectCommand="usp_LucroSellOut_24_Meses_Por_Fornecedor" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="idFornecedor" SessionField="sFORNECEDOR" Type="Int32" />
                                <asp:SessionParameter Name="CNPJ" SessionField="sCNPJ" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>   

                    <br />

                    <div id="divFornecedor_Margem" class ="divChartLayout">    <%-- Ultimos 24 Meses --%>
                        <dxchartsui:WebChartControl ID="chart_MargemFrenteDeCaixa" runat="server" DataSourceID="ds_Margem_Fornecedor" Height="150px" Width="1050px" BackColor="Transparent">
                            <borderoptions visible="False" />
                            <diagramserializable>
                                <cc1:XYDiagram>
                                    <axisx visibleinpanesserializable="-1" reverse="True">
                                        <label angle="90">
                                        </label>
                                        <range sidemarginsenabled="True" />
                                        <gridlines color="Silver" minorcolor="Silver" visible="True">
                                            <linestyle dashstyle="Dash" />
                                            <minorlinestyle dashstyle="Dash" />
                                        </gridlines>
                                    </axisx>
                                    <axisy visible="False" visibleinpanesserializable="-1">
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

                            <legend Visibility="False"></legend>
                            <seriesserializable>
                                <cc1:Series ArgumentDataMember="Periodo" LabelsVisibility="True" Name="MargemFornecedor" ValueDataMembersSerializable="percMargem">
                                    <viewserializable>
                                        <cc1:LineSeriesView MarkerVisibility="True">
                                            <linemarkeroptions size="5" BorderVisible="True">
                                            </linemarkeroptions>
                                        </cc1:LineSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:PointSeriesLabel Angle="90" LineVisible="True">
                                            <fillstyle>
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                            <pointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Number" precision="2" />
                                                </cc1:PointOptions>
                                            </pointoptionsserializable>
                                        </cc1:PointSeriesLabel>
                                    </labelserializable>
                                    <legendpointoptionsserializable>
                                        <cc1:PointOptions>
                                            <valuenumericoptions format="Number" precision="2" />
                                        </cc1:PointOptions>
                                    </legendpointoptionsserializable>
                                </cc1:Series>
                            </seriesserializable>

<SeriesTemplate><ViewSerializable>
    <cc1:LineSeriesView MarkerVisibility="True">
        <linemarkeroptions BorderVisible="True">
        </linemarkeroptions>
    </cc1:LineSeriesView>
</ViewSerializable>
<LabelSerializable>
    <cc1:PointSeriesLabel LineVisible="True">
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
</LabelSerializable>
<LegendPointOptionsSerializable>
<cc1:PointOptions></cc1:PointOptions>
</LegendPointOptionsSerializable>
</SeriesTemplate>

                            <titles>
                                <cc1:ChartTitle Font="Tahoma, 14pt" Text="Margem Frente de Caixa do Fornecedor - 24 Meses" />
                            </titles>

<CrosshairOptions><CommonLabelPositionSerializable>
<cc1:CrosshairMousePosition></cc1:CrosshairMousePosition>
</CommonLabelPositionSerializable>
</CrosshairOptions>

<ToolTipOptions><ToolTipPositionSerializable>
<cc1:ToolTipMousePosition></cc1:ToolTipMousePosition>
</ToolTipPositionSerializable>
</ToolTipOptions>
                        </dxchartsui:WebChartControl>
                        <asp:SqlDataSource ID="ds_Margem_Fornecedor" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaFornecedoresConnectionString %>" SelectCommand="usp_Margem_24_Meses_Por_Fornecedor" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="idFornecedor" SessionField="sFORNECEDOR" Type="Int32" />
                                <asp:SessionParameter Name="CNPJ" SessionField="sCNPJ" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>   

                    <br />    
                    
                    <div id="div4" class="divChartLayout">    <%-- Ultimos 24 Meses --%>
                        <dxchartsui:WebChartControl ID="WebChartControl3" runat="server" DataSourceID="ds_Cliente_Fornecedor" Height="200px" Width="1050px" BackColor="Transparent">
                            <emptycharttext text="Não há vendas para esse fornecedor nos últimos 24 meses" />
                            <borderoptions visible="False" />
                            <diagramserializable>
                                <cc1:XYDiagram>
                                    <axisx visibleinpanesserializable="-1" reverse="True">
                                        <label angle="90">
                                        </label>
                                        <range sidemarginsenabled="True" />
                                        <gridlines color="Silver" minorcolor="Silver" visible="True">
                                            <linestyle dashstyle="Dash" />
                                            <minorlinestyle dashstyle="Dash" />
                                        </gridlines>
                                    </axisx>
                                    <axisy visible="False" visibleinpanesserializable="-1">
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

                            <legend Visibility="False"></legend>
                            <seriesserializable>
                                <cc1:Series ArgumentDataMember="Periodo" LabelsVisibility="True" Name="VendaFornecedor" ValueDataMembersSerializable="vlrVenda">
                                    <viewserializable>
                                        <cc1:LineSeriesView MarkerVisibility="True">
                                            <linemarkeroptions size="5" BorderVisible="True">
                                            </linemarkeroptions>
                                        </cc1:LineSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:PointSeriesLabel Angle="90" LineVisible="True" TextOrientation="BottomToTop">
                                            <fillstyle>
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                            <pointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Number" precision="0" />
                                                </cc1:PointOptions>
                                            </pointoptionsserializable>
                                        </cc1:PointSeriesLabel>
                                    </labelserializable>
                                    <legendpointoptionsserializable>
                                        <cc1:PointOptions>
                                            <valuenumericoptions format="Number" precision="0" />
                                        </cc1:PointOptions>
                                    </legendpointoptionsserializable>
                                </cc1:Series>
                            </seriesserializable>

<SeriesTemplate><ViewSerializable>
    <cc1:LineSeriesView MarkerVisibility="True">
        <linemarkeroptions BorderVisible="True">
        </linemarkeroptions>
    </cc1:LineSeriesView>
</ViewSerializable>
<LabelSerializable>
    <cc1:PointSeriesLabel LineVisible="True">
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
</LabelSerializable>
<LegendPointOptionsSerializable>
<cc1:PointOptions></cc1:PointOptions>
</LegendPointOptionsSerializable>
</SeriesTemplate>

                            <titles>
                                <cc1:ChartTitle Font="Tahoma, 14pt" Text="Número de Clientes do Fornecedor - 24 Meses" />
                            </titles>

<CrosshairOptions><CommonLabelPositionSerializable>
<cc1:CrosshairMousePosition></cc1:CrosshairMousePosition>
</CommonLabelPositionSerializable>
</CrosshairOptions>

<ToolTipOptions><ToolTipPositionSerializable>
<cc1:ToolTipMousePosition></cc1:ToolTipMousePosition>
</ToolTipPositionSerializable>
</ToolTipOptions>
                        </dxchartsui:WebChartControl>

                        <asp:SqlDataSource ID="ds_Cliente_Fornecedor" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaFornecedoresConnectionString %>" SelectCommand="usp_Clientes_24_Meses_Por_Fornecedor" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="idFornecedor" SessionField="sFORNECEDOR" Type="Int32" />
                                <asp:SessionParameter Name="CNPJ" SessionField="sCNPJ" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>   

                    <br />

                    <div id="div5" class ="divChartLayout">    <%-- Ultimos 24 Meses --%>
                        <dxchartsui:WebChartControl ID="chart_Crescimento_Clientes_Fornecedor" runat="server" DataSourceID="ds_Crescimento_Clientes" Height="200px" Width="1050px" BackColor="Transparent">
                            <borderoptions visible="False" />
                            <diagramserializable>
                                <cc1:XYDiagram>
                                    <axisx visibleinpanesserializable="-1" reverse="True">
                                        <label angle="90">
                                        </label>
                                        <range sidemarginsenabled="True" />
                                        <gridlines color="Silver" minorcolor="Silver" visible="True">
                                            <linestyle dashstyle="Dash" />
                                            <minorlinestyle dashstyle="Dash" />
                                        </gridlines>
                                    </axisx>
                                    <axisy visible="False" visibleinpanesserializable="-1">
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

                            <legend Visibility="False"></legend>
                            <seriesserializable>
                                <cc1:Series ArgumentDataMember="Periodo" LabelsVisibility="True" Name="CrescVendaFornecedor" ValueDataMembersSerializable="percCresc">
                                    <viewserializable>
                                        <cc1:LineSeriesView MarkerVisibility="True">
                                            <linemarkeroptions size="5" BorderVisible="True">
                                            </linemarkeroptions>
                                        </cc1:LineSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:PointSeriesLabel Angle="90" LineVisible="True">
                                            <fillstyle>
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                            <pointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Number" precision="2" />
                                                </cc1:PointOptions>
                                            </pointoptionsserializable>
                                        </cc1:PointSeriesLabel>
                                    </labelserializable>
                                    <legendpointoptionsserializable>
                                        <cc1:PointOptions>
                                            <valuenumericoptions format="Number" precision="2" />
                                        </cc1:PointOptions>
                                    </legendpointoptionsserializable>
                                </cc1:Series>
                            </seriesserializable>

<SeriesTemplate><ViewSerializable>
    <cc1:LineSeriesView MarkerVisibility="True">
        <linemarkeroptions BorderVisible="True">
        </linemarkeroptions>
    </cc1:LineSeriesView>
</ViewSerializable>
<LabelSerializable>
    <cc1:PointSeriesLabel LineVisible="True">
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
</LabelSerializable>
<LegendPointOptionsSerializable>
<cc1:PointOptions></cc1:PointOptions>
</LegendPointOptionsSerializable>
</SeriesTemplate>

                            <titles>
                                <cc1:ChartTitle Font="Tahoma, 14pt" Text="Crescimento de Clientes do Fornecedor - 24 Meses" />
                            </titles>

<CrosshairOptions><CommonLabelPositionSerializable>
<cc1:CrosshairMousePosition></cc1:CrosshairMousePosition>
</CommonLabelPositionSerializable>
</CrosshairOptions>

<ToolTipOptions><ToolTipPositionSerializable>
<cc1:ToolTipMousePosition></cc1:ToolTipMousePosition>
</ToolTipPositionSerializable>
</ToolTipOptions>
                        </dxchartsui:WebChartControl>
                        
                        <asp:SqlDataSource ID="ds_Crescimento_Clientes" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaFornecedoresConnectionString %>" SelectCommand="usp_CrescimentoClientes_24_Meses_Por_Fornecedor" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="idFornecedor" SessionField="sFORNECEDOR" Type="Int32" />
                                <asp:SessionParameter Name="CNPJ" SessionField="sCNPJ" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>   

                    <br />

                    
                                    
                    
                    <div id="divRanking_Ano">
                        <dxchartsui:WebChartControl ID="WebChartControl1" runat="server" DataSourceID="ds_Ranking_Ano" Height="150px" Width="300px">
                            <diagramserializable>
                                <cc1:XYDiagram>
                                    <axisx visibleinpanesserializable="-1">
                                        <range sidemarginsenabled="True" />
                                    </axisx>
                                    <axisy visible="False" visibleinpanesserializable="-1">
                                        <range sidemarginsenabled="True" />
                                    </axisy>
                                </cc1:XYDiagram>
                            </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

                            <legend Visibility="False"></legend>
                            <seriesserializable>
                                <cc1:Series ArgumentDataMember="Ano" LabelsVisibility="True" Name="Posicao_Ano" ValueDataMembersSerializable="PosicaoNoRanking">
                                    <viewserializable>
                                        <cc1:LineSeriesView MarkerVisibility="True">
                                            <linemarkeroptions size="5" BorderVisible="True">
                                            </linemarkeroptions>
                                        </cc1:LineSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:PointSeriesLabel Angle="90" LineVisible="True" TextOrientation="BottomToTop">
                                            <fillstyle>
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                            <pointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Number" precision="0" />
                                                </cc1:PointOptions>
                                            </pointoptionsserializable>
                                        </cc1:PointSeriesLabel>
                                    </labelserializable>
                                    <legendpointoptionsserializable>
                                        <cc1:PointOptions>
                                            <valuenumericoptions format="Number" precision="0" />
                                        </cc1:PointOptions>
                                    </legendpointoptionsserializable>
                                </cc1:Series>
                            </seriesserializable>

<SeriesTemplate><ViewSerializable>
    <cc1:LineSeriesView MarkerVisibility="True">
        <linemarkeroptions BorderVisible="True">
        </linemarkeroptions>
    </cc1:LineSeriesView>
</ViewSerializable>
<LabelSerializable>
    <cc1:PointSeriesLabel LineVisible="True">
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
</LabelSerializable>
<LegendPointOptionsSerializable>
<cc1:PointOptions></cc1:PointOptions>
</LegendPointOptionsSerializable>
</SeriesTemplate>

                            <titles>
                                <cc1:ChartTitle Font="Tahoma, 14pt" Text="Posicionamento Empresa" />
                            </titles>

<CrosshairOptions><CommonLabelPositionSerializable>
<cc1:CrosshairMousePosition></cc1:CrosshairMousePosition>
</CommonLabelPositionSerializable>
</CrosshairOptions>

<ToolTipOptions><ToolTipPositionSerializable>
<cc1:ToolTipMousePosition></cc1:ToolTipMousePosition>
</ToolTipPositionSerializable>
</ToolTipOptions>
                        </dxchartsui:WebChartControl>
                        <asp:SqlDataSource ID="ds_Ranking_Ano" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaFornecedoresConnectionString %>" SelectCommand="usp_Posicao_Ranking_Ano" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="idFornecedor" SessionField="sFORNECEDOR" Type="Int32" />
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int32" />
                                <asp:SessionParameter Name="CNPJ" SessionField="sCNPJ" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </div>

                    <div id="divRankingCategoria_Ano">
                        <asp:GridView ID="grid_RankingCategoriaAno" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="ds_RankingCategoria" ForeColor="Black" Caption="Posicionamento Categoria">
                            <AlternatingRowStyle BackColor="White" />
                            <Columns>
                                <asp:BoundField DataField="Ano" HeaderText="Ano" SortExpression="Ano" />
                                <asp:BoundField DataField="Categoria" HeaderText="Categoria" SortExpression="Categoria" />
                                <asp:BoundField DataField="Posicao" HeaderText="Posicao" SortExpression="Posicao">
                                <ItemStyle HorizontalAlign="Center" />
                                </asp:BoundField>
                            </Columns>
                            <FooterStyle BackColor="#CCCC99" />
                            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                            <RowStyle BackColor="#F7F7DE" />
                            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#FBFBF2" />
                            <SortedAscendingHeaderStyle BackColor="#848384" />
                            <SortedDescendingCellStyle BackColor="#EAEAD3" />
                            <SortedDescendingHeaderStyle BackColor="#575357" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="ds_RankingCategoria" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaFornecedoresSLVConnectionString %>" SelectCommand="usp_PosicaoNaCategoria" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                <asp:SessionParameter Name="idFornecedor" SessionField="sFORNECEDOR" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>



</asp:Content>

