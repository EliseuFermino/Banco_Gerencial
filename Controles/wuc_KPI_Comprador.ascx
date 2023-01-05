<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wuc_KPI_Comprador.ascx.vb" Inherits="Controles_wuc_KPI_Comprador" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>


<link href="../css/bootstrap.css" rel="stylesheet" />

<%-- <div class="container-fluid">
    
   <div class="row">
        <div class="col-md-12">
            <div class="panel panel panel-primary">
              <div class="panel-heading">
                <h3 class="panel-title" style="color:gray">Crescimento de Vendas - Últimos 3 Anos</h3>
              </div>
              <div class="panel-body">--%>
                
                                <dxchartsui:WebChartControl ID="graphCrescimentoVendas" runat="server" DataSourceID="dsCrescimentoVendas" Height="200px" Width="1713px" PaletteName="Aspect" CrosshairEnabled="True">
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="-1" minorcount="1">
                                                <range sidemarginsenabled="True" />
                                                <gridlines minorcolor="LightSteelBlue" minorvisible="True">
                                                    <minorlinestyle dashstyle="Dash" />
                                                </gridlines>
                                            </axisx>
                                            <axisy visibleinpanesserializable="-1">
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
    <FillStyle><OptionsSerializable>
    <cc1:SolidFillOptions></cc1:SolidFillOptions>
    </OptionsSerializable>
    </FillStyle>

                                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="14" maxhorizontalpercentage="90">
                                        <margins bottom="0" top="0" />
                                    </legend>
                                    <seriesserializable>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="2019" ValueDataMembersSerializable="numDadosAAAA">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" ResolveOverlappingMode="Default" Position="Top" TextPattern="{V:n2}">
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
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="2020" ValueDataMembersSerializable="numDadosAAA">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel Indent="20" LineVisible="True" ResolveOverlappingMode="Default" Position="Top" TextPattern="{V:n2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Number" />
                                                            <valuenumericoptions format="Number" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" />
                                                    <valuenumericoptions format="Number" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" Name="2021" ValueDataMembersSerializable="numDadosAA" LabelsVisibility="True">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Transparency="90">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13"  EnableAntialiasing="True" ResolveOverlappingMode="Default" Position="Top" TextPattern="{V:n2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Number" precision="0" />
                                                            <valuenumericoptions format="Number" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" precision="0" />
                                                    <valuenumericoptions format="Number" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" Name="2022" ValueDataMembersSerializable="numDadosAT" LabelsVisibility="True">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Transparency="90">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" ResolveOverlappingMode="Default" Position="Top" TextPattern="{V:n2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Number" /><valuenumericoptions format="Number" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" /><valuenumericoptions format="Number" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                    </seriesserializable>

    <SeriesTemplate><ViewSerializable>
        <cc1:SideBySideBarSeriesView>
        </cc1:SideBySideBarSeriesView>
    </ViewSerializable>
    <LabelSerializable>
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
    </LabelSerializable>
    <LegendPointOptionsSerializable>
    <cc1:PointOptions></cc1:PointOptions>
    </LegendPointOptionsSerializable>
    </SeriesTemplate>

                                    <titles>
                                        <cc1:ChartTitle Font="Tahoma, 12pt" Text="Percentual de Crescimento de Vendas - Últimos 4 Anos" TextColor="Black" />
                                    </titles>

                                    <palettewrappers>
                                        <dxchartsui:PaletteWrapper Name="Palette 1" ScaleMode="Repeat">
                                            <palette>
                                                <cc1:PaletteEntry Color="Silver" Color2="Silver" />
                                                <cc1:PaletteEntry Color="Silver" Color2="Silver" />
                                            </palette>
                                        </dxchartsui:PaletteWrapper>
                                    </palettewrappers>

    <CrosshairOptions><CommonLabelPositionSerializable>
    <cc1:CrosshairMousePosition></cc1:CrosshairMousePosition>
    </CommonLabelPositionSerializable>
    </CrosshairOptions>

    <ToolTipOptions><ToolTipPositionSerializable>
    <cc1:ToolTipMousePosition></cc1:ToolTipMousePosition>
    </ToolTipPositionSerializable>
    </ToolTipOptions>
                                </dxchartsui:WebChartControl>
                                <asp:SqlDataSource ID="dsCrescimentoVendas" runat="server" ConnectionString="<%$ ConnectionStrings:DW_VendasConnectionString %>" SelectCommand="uspBuscarCrescimentoVendas_12Meses_Comprador" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idComprador" SessionField="sUSUARIO" Type="String"/>
                                    </SelectParameters>
                                </asp:SqlDataSource>

<%---- MATERIAL ESCOALR ----%>
<%--    <div style="padding: 2px; border: 1px solid gray; margin-top: 2px; width: 700px; background-color: yellow; font-weight:bold">
        &nbsp Crescimento Material Escolar 2019: Total: <span style="color:blue"> 2,92%</span> &nbsp &nbsp   Mesmas Lojas: <span style="color:red"> -4,94%</span><span style="color:gray; font-weight:normal; font-size:small">&nbsp &nbsp  Atualizado em 26/02/2018</span> 
    </div>--%>



              <%--</div>
            </div>            
        </div>
    </div>
</div>--%>

