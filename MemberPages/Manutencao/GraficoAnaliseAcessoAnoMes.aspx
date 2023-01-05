<%@ Page Title="Grafico Analise Acesso Mes" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="GraficoAnaliseAcessoAnoMes.aspx.vb" Inherits="MemberPages_Manutencao_GraficoAnaliseAcessoAnoMes" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>

<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


    <div>

        <dxchartsui:WebChartControl ID="WebChartControl2" runat="server" DataSourceID="SqlDataSource2" Height="200px" Width="1700px" BackColor="Transparent" CrosshairEnabled="True">
            <borderoptions visible="False" />
            <diagramserializable>
                <cc1:XYDiagram>
                    <axisx visibleinpanesserializable="-1">
                        <label angle="90"></label><range sidemarginsenabled="True" />
                    </axisx>
                    <axisy visibleinpanesserializable="-1" visible="False">
                        <range sidemarginsenabled="True" />
<Label TextPattern="{V:N0}"></Label>

                        <gridlines visible="False">
                        </gridlines>
                        <numericoptions format="Number" precision="0" />
                    </axisy>
                    <defaultpane backcolor="Transparent" bordervisible="False">
                    </defaultpane>
                </cc1:XYDiagram>
            </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

            <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" horizontalindent="25" maxverticalpercentage="10" textoffset="9" verticalindent="100" Visibility="False">
                <margins bottom="0" left="0" right="0" top="0" />
            </legend>
            <seriesserializable>
                <cc1:Series ArgumentDataMember="Dia" LabelsVisibility="True" Name="Serie_Acessos" ValueDataMembersSerializable="Acessos" LegendText="Acessos" ArgumentScaleType="Qualitative">
                    <viewserializable>
                        <cc1:StackedLineSeriesView Color="CornflowerBlue">
                            <linemarkeroptions BorderVisible="True">
                            </linemarkeroptions>
                        </cc1:StackedLineSeriesView>
                    </viewserializable>
                    <labelserializable>
                        <cc1:StackedLineSeriesLabel Angle="90" LineVisible="True" TextPattern="{V:n0}">
                            <fillstyle>
                                <optionsserializable>
                                    <cc1:SolidFillOptions />
                                </optionsserializable>
                            </fillstyle>
                            <pointoptionsserializable>
                                <cc1:PointOptions>
                                    <argumentnumericoptions format="Number" precision="0" />
                                    <valuenumericoptions format="Number" precision="0" />
                                </cc1:PointOptions>
                            </pointoptionsserializable>
                        </cc1:StackedLineSeriesLabel>
                    </labelserializable>
                    <legendpointoptionsserializable>
                        <cc1:PointOptions>
                            <argumentnumericoptions format="Number" precision="0" />
                            <valuenumericoptions format="Number" precision="0" />
                        </cc1:PointOptions>
                    </legendpointoptionsserializable>
                </cc1:Series>
                <cc1:Series ArgumentDataMember="Dia" Name="Series_Media" ValueDataMembersSerializable="MediaAtual" ArgumentScaleType="Qualitative">
                    <viewserializable>
                        <cc1:AreaSeriesView Color="55, 211, 211, 211" MarkerVisibility="False" Transparency="200">
                            <markeroptions BorderVisible="False">
                            </markeroptions>
                        </cc1:AreaSeriesView>
                    </viewserializable>
                    <labelserializable>
                        <cc1:PointSeriesLabel LineVisible="True" TextAlignment="Near">
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
            </seriesserializable>

<SeriesTemplate><ViewSerializable>
    <cc1:StackedLineSeriesView MarkerVisibility="True">
        <linemarkeroptions BorderVisible="True">
        </linemarkeroptions>
    </cc1:StackedLineSeriesView>
</ViewSerializable>
<LabelSerializable>
    <cc1:StackedLineSeriesLabel LineVisible="True">
        <fillstyle>
            <optionsserializable>
                <cc1:SolidFillOptions />
            </optionsserializable>
        </fillstyle>
        <pointoptionsserializable>
            <cc1:PointOptions>
            </cc1:PointOptions>
        </pointoptionsserializable>
    </cc1:StackedLineSeriesLabel>
</LabelSerializable>
<LegendPointOptionsSerializable>
<cc1:PointOptions></cc1:PointOptions>
</LegendPointOptionsSerializable>
</SeriesTemplate>

            <titles>
                <cc1:ChartTitle Text="Total de Acessos por Dia do Mês Atual" />
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

        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:gerContSQL1ConnectionString %>" SelectCommand="Estatistica.vw_AcessosPorDia" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    </div>


    <div style="margin :2px; padding :2px">

        <dxchartsui:WebChartControl ID="WebChartControl1" runat="server" DataSourceID="SqlDataSource1" Height="600px" Width="1700px" CrosshairEnabled="True">
            <diagramserializable>
                <cc1:XYDiagram>
                    <axisx visibleinpanesserializable="-1" minorcount="1">
                        <qualitativescaleoptions autogrid="False" gridoffset="1" />
                        <label angle="90">
                        </label>
                        <range sidemarginsenabled="True" />
                        <gridlines visible="True">
                        </gridlines>
                    </axisx>
                    <axisy visibleinpanesserializable="-1">
                        <range sidemarginsenabled="True" />
                        <numericoptions format="Number" precision="0" />
<Label TextPattern="{V:N0}"></Label>
                    </axisy>
                    <secondaryaxesy>
                        <cc1:SecondaryAxisY AxisID="0" Name="Secondary AxisY 1" VisibleInPanesSerializable="-1">
                            <range auto="False" maxvalueserializable="1500" minvalueserializable="0" sidemarginsenabled="True" />
                            <numericoptions format="Number" precision="0" />
<Label TextPattern="{V:N0}"></Label>

<VisualRange Auto="False" MinValueSerializable="0" MaxValueSerializable="1500"></VisualRange>

<WholeRange Auto="False" MinValueSerializable="0" MaxValueSerializable="1500"></WholeRange>
                        </cc1:SecondaryAxisY>
                    </secondaryaxesy>
                </cc1:XYDiagram>
            </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

            <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" horizontalindent="25" maxverticalpercentage="10" textoffset="9" verticalindent="100">
                <margins bottom="0" left="0" right="0" top="0" />
            </legend>
            <seriesserializable>
                <cc1:Series ArgumentDataMember="Ano" LabelsVisibility="True" Name="Serie_Acessos" ValueDataMembersSerializable="Acessos" LegendText="Acessos" ArgumentScaleType="Qualitative">
                    <viewserializable>
                        <cc1:StackedLineSeriesView>
                            <linemarkeroptions BorderVisible="True">
                            </linemarkeroptions>
                        </cc1:StackedLineSeriesView>
                    </viewserializable>
                    <labelserializable>
                        <cc1:StackedLineSeriesLabel Angle="90" LineVisible="True" TextPattern="{V:n0}">
                            <fillstyle>
                                <optionsserializable>
                                    <cc1:SolidFillOptions />
                                </optionsserializable>
                            </fillstyle>
                            <pointoptionsserializable>
                                <cc1:PointOptions>
                                    <argumentnumericoptions format="Number" precision="0" />
                                    <valuenumericoptions format="Number" precision="0" />
                                </cc1:PointOptions>
                            </pointoptionsserializable>
                        </cc1:StackedLineSeriesLabel>
                    </labelserializable>
                    <legendpointoptionsserializable>
                        <cc1:PointOptions>
                            <argumentnumericoptions format="Number" precision="0" />
                            <valuenumericoptions format="Number" precision="0" />
                        </cc1:PointOptions>
                    </legendpointoptionsserializable>
                </cc1:Series>
                <cc1:Series ArgumentDataMember="Ano" LabelsVisibility="True" Name="Serie_MediaAcessoDia" ValueDataMembersSerializable="MediaAcessoDia" LegendText="Média de Acesso Dia" ArgumentScaleType="Qualitative">
                    <viewserializable>
                        <cc1:SplineAreaSeriesView AxisYName="Secondary AxisY 1" MarkerVisibility="True">
                            <markeroptions size="4" BorderVisible="True">
                            </markeroptions>
                        </cc1:SplineAreaSeriesView>
                    </viewserializable>
                    <labelserializable>
                        <cc1:PointSeriesLabel Angle="270" LineVisible="True" TextPattern="{V:n0}">
                            <fillstyle>
                                <optionsserializable>
                                    <cc1:SolidFillOptions />
                                </optionsserializable>
                            </fillstyle>
                            <pointoptionsserializable>
                                <cc1:PointOptions>
                                    <argumentnumericoptions format="Number" precision="0" />
                                    <valuenumericoptions format="Number" precision="0" />
                                </cc1:PointOptions>
                            </pointoptionsserializable>
                        </cc1:PointSeriesLabel>
                    </labelserializable>
                    <legendpointoptionsserializable>
                        <cc1:PointOptions>
                            <argumentnumericoptions format="Number" precision="0" />
                            <valuenumericoptions format="Number" precision="0" />
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

            <titles>
                <cc1:ChartTitle Text="Total de Acesso por Ano e Mês" />
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

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerContSQL1ConnectionString %>" SelectCommand="Estatistica.vw_AcessosPorAnoMes" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

    </div>


</asp:Content>

