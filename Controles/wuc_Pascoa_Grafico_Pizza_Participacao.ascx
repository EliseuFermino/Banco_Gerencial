<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wuc_Pascoa_Grafico_Pizza_Participacao.ascx.vb" Inherits="Controles_wuc_Pascoa_Grafico_Pizza_Participacao" %>

<%@ Register assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>

<style type="text/css" >

     #divGrafico {
            clear: both;
            float : left;
            margin-left: 5px;
            margin-top: 20px;
        }

</style>


    <div id="divGrafico">
<dxchartsui:WebChartControl ID="WebChartControl1" runat="server" 
                        BackColor="Transparent" DataSourceID="dsCrescimento" 
                         Height="350px" Width="990px" CrosshairEnabled="True">
                        <SeriesSerializable>
                            <cc1:Series ArgumentDataMember="Descricao" Name="Series 1" ValueDataMembersSerializable="VendaAA1" ArgumentScaleType="Qualitative" LabelsVisibility="True" SynchronizePointOptions="False" LegendName="Default Legend">
                                <viewserializable>
                                    <cc1:DoughnutSeriesView RuntimeExploding="False" ExplodeMode="MaxValue">
                                    </cc1:DoughnutSeriesView>
                                </viewserializable>
                                <labelserializable>
                                    <cc1:DoughnutSeriesLabel LineVisible="True" EnableAntialiasing="True" ResolveOverlappingMode="Default">
                                        <fillstyle>
                                            <optionsserializable>
                                                <cc1:SolidFillOptions />
                                            </optionsserializable>
                                        </fillstyle>
                                        <pointoptionsserializable>
                                            <cc1:PiePointOptions>
                                                <valuenumericoptions format="Percent" />
                                            </cc1:PiePointOptions>
                                        </pointoptionsserializable>
                                    </cc1:DoughnutSeriesLabel>
                                </labelserializable>
                                <legendpointoptionsserializable>
                                    <cc1:PiePointOptions PointView="Argument">
                                        <valuenumericoptions format="Percent" />
                                    </cc1:PiePointOptions>
                                </legendpointoptionsserializable>
                            </cc1:Series>
                            <cc1:Series ArgumentDataMember="Descricao" Name="Series 2" ValueDataMembersSerializable="VendaAA" ArgumentScaleType="Qualitative" CrosshairHighlightPoints="True" CrosshairLabelVisibility="True" LabelsVisibility="True" ShowInLegend="False" SynchronizePointOptions="False">
                                <viewserializable>
                                    <cc1:DoughnutSeriesView RuntimeExploding="False" ExplodeMode="MaxValue">
                                    </cc1:DoughnutSeriesView>
                                </viewserializable>
                                <labelserializable>
                                    <cc1:DoughnutSeriesLabel LineVisible="True" EnableAntialiasing="True" ResolveOverlappingMode="Default">
                                        <fillstyle>
                                            <optionsserializable>
                                                <cc1:SolidFillOptions />
                                            </optionsserializable>
                                        </fillstyle>
                                        <pointoptionsserializable>
                                            <cc1:PiePointOptions>
                                                <valuenumericoptions format="Percent" />
                                            </cc1:PiePointOptions>
                                        </pointoptionsserializable>
                                    </cc1:DoughnutSeriesLabel>
                                </labelserializable>
                                <legendpointoptionsserializable>
                                    <cc1:PiePointOptions PointView="Argument">
                                        <valuenumericoptions format="Percent" />
                                    </cc1:PiePointOptions>
                                </legendpointoptionsserializable>
                            </cc1:Series>
                            <cc1:Series ArgumentDataMember="Descricao" Name="Series 3" ValueDataMembersSerializable="Venda" ArgumentScaleType="Qualitative" CrosshairHighlightPoints="True" CrosshairLabelVisibility="True" LabelsVisibility="True" ShowInLegend="False" SynchronizePointOptions="False">
                                <viewserializable>
                                    <cc1:DoughnutSeriesView RuntimeExploding="False" ExplodeMode="MaxValue">
                                    </cc1:DoughnutSeriesView>
                                </viewserializable>
                                <labelserializable>
                                    <cc1:DoughnutSeriesLabel LineVisible="True" EnableAntialiasing="True" ResolveOverlappingMode="Default">
                                        <fillstyle>
                                            <optionsserializable>
                                                <cc1:SolidFillOptions />
                                            </optionsserializable>
                                        </fillstyle>
                                        <pointoptionsserializable>
                                            <cc1:PiePointOptions>
                                                <valuenumericoptions format="Percent" />
                                            </cc1:PiePointOptions>
                                        </pointoptionsserializable>
                                    </cc1:DoughnutSeriesLabel>
                                </labelserializable>
                                <legendpointoptionsserializable>
                                    <cc1:PiePointOptions PointView="Argument">
                                        <valuenumericoptions format="Percent" />
                                    </cc1:PiePointOptions>
                                </legendpointoptionsserializable>
                            </cc1:Series>
                        </SeriesSerializable>
<SeriesTemplate   >
<ViewSerializable>
    <cc1:DoughnutSeriesView RuntimeExploding="False">
    </cc1:DoughnutSeriesView>
</ViewSerializable>

<LabelSerializable>
    <cc1:DoughnutSeriesLabel LineVisible="True">
        <fillstyle>
            <optionsserializable>
                <cc1:SolidFillOptions />
            </optionsserializable>
        </fillstyle>
        <pointoptionsserializable>
            <cc1:PiePointOptions>
            </cc1:PiePointOptions>
<cc1:PointOptions></cc1:PointOptions>
        </pointoptionsserializable>
    </cc1:DoughnutSeriesLabel>
</LabelSerializable>

<PointOptionsSerializable>
<cc1:PointOptions HiddenSerializableString="to be serialized"></cc1:PointOptions>
</PointOptionsSerializable>

<LegendPointOptionsSerializable>
    <cc1:PiePointOptions>
    </cc1:PiePointOptions>
</LegendPointOptionsSerializable>
</SeriesTemplate>

                        <DiagramSerializable>
                            <cc1:SimpleDiagram EqualPieSize="False">
                            </cc1:SimpleDiagram>
</DiagramSerializable>

<FillStyle FillMode="Empty">
</FillStyle>
                        <Legend AlignmentHorizontal="Center" AlignmentVertical="BottomOutside" 
                            BackColor="Transparent" Direction="LeftToRight"></Legend>
                        <Titles>
                            <cc1:ChartTitle Font="Tahoma, 14pt" Text="Comparativo de Páscoa - 2017, 2018 e 2019" TextColor="128, 128, 128" Indent="1" WordWrap="True" />
                        </Titles>

<CrosshairOptions><CommonLabelPositionSerializable>
<cc1:CrosshairMousePosition></cc1:CrosshairMousePosition>
</CommonLabelPositionSerializable>
</CrosshairOptions>

<ToolTipOptions><ToolTipPositionSerializable>
<cc1:ToolTipMousePosition></cc1:ToolTipMousePosition>
</ToolTipPositionSerializable>
</ToolTipOptions>
                    </dxchartsui:WebChartControl>
                    <asp:SqlDataSource ID="dsCrescimento" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                        SelectCommand="Pascoa.uspGraficoParticipacao" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                            <asp:SessionParameter Name="Ano" SessionField="sANO" />
                        </SelectParameters>
                    </asp:SqlDataSource>
    </div>
