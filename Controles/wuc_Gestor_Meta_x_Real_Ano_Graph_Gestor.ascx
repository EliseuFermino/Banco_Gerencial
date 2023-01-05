<%@ Control Language="VB" AutoEventWireup="false" CodeFile="wuc_Gestor_Meta_x_Real_Ano_Graph_Gestor.ascx.vb" Inherits="Controles_wuc_Gestor_Meta_x_Real_Ano_Graph_Gestor" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web.Designer" TagPrefix="dxchartdesigner" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>



								
       <dx:WebChartControl ID="Graph_Mes_Empresa" runat="server" CrosshairEnabled="True" Height="400px" Width="1500px" DataSourceID="ds_Graph_Ano_Empresa" AppearanceNameSerializable="The Trees" PaletteName="Palette 1">
            <DiagramSerializable>
                <cc1:XYDiagram>
                    <axisx minorcount="1" visibility="False" visibleinpanesserializable="-1">
                        <gridlines visible="True">
                        </gridlines>
                    </axisx>
                    <axisy visibility="False" visibleinpanesserializable="-1">
                        <gridlines visible="False">
                        </gridlines>
                    </axisy>
                    <secondaryaxesx>
                        <cc1:SecondaryAxisX Alignment="Near" AxisID="0" MinorCount="1" Name="Secondary AxisX 1" VisibleInPanesSerializable="0">
                            <label font="Tahoma, 9pt, style=Bold">
                            </label>
                            <gridlines visible="True">
                            </gridlines>
                            <numericscaleoptions autogrid="False" />
                        </cc1:SecondaryAxisX>
                    </secondaryaxesx>
                    <secondaryaxesy>
                        <cc1:SecondaryAxisY AxisID="0" Name="Secondary AxisY 1" Visibility="False" VisibleInPanesSerializable="0">
                            <constantlines>
                                <cc1:ConstantLine AxisValueSerializable="0" Name="" ShowBehind="True" ShowInLegend="False">
                                </cc1:ConstantLine>
                            </constantlines>
                        </cc1:SecondaryAxisY>
                    </secondaryaxesy>
                    <panes>
                        <cc1:XYDiagramPane Name="Pane 1" PaneID="0">
                        </cc1:XYDiagramPane>
                    </panes>
                </cc1:XYDiagram>
            </DiagramSerializable>
<Legend Name="Default Legend" AlignmentHorizontal="Center" AlignmentVertical="BottomOutside" Direction="LeftToRight" Visibility="True"></Legend>
            <SeriesSerializable>
                <cc1:Series ArgumentDataMember="Legenda" LabelsVisibility="True" Name="Meta" ToolTipPointPattern="{V:n0}" ValueDataMembersSerializable="vlrMeta">
                    <labelserializable>
                        <cc1:SideBySideBarSeriesLabel Font="Tahoma, 10pt, style=Bold" Position="BottomInside" TextOrientation="TopToBottom" TextPattern="{V:n0}">
                        </cc1:SideBySideBarSeriesLabel>
                    </labelserializable>
                </cc1:Series>
                <cc1:Series ArgumentDataMember="Legenda" LabelsVisibility="True" Name="Realizado" ValueDataMembersSerializable="vlrReal">
                    <labelserializable>
                        <cc1:SideBySideBarSeriesLabel Font="Tahoma, 10pt, style=Bold" Position="BottomInside" TextOrientation="TopToBottom" TextPattern="{V:n0}">
                        </cc1:SideBySideBarSeriesLabel>
                    </labelserializable>
                </cc1:Series>
                <cc1:Series ArgumentDataMember="Legenda" LabelsVisibility="True" Name="Atingimento" ValueDataMembersSerializable="percAting">
                    <viewserializable>
                        <cc1:StepLineSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="128, 100, 162" MarkerVisibility="True" PaneName="Pane 1">
                            <linemarkeroptions size="5">
                            </linemarkeroptions>
                        </cc1:StepLineSeriesView>
                    </viewserializable>
                    <labelserializable>
                        <cc1:PointSeriesLabel Font="Tahoma, 10pt, style=Bold" TextPattern="{V:n2}%">
                        </cc1:PointSeriesLabel>
                    </labelserializable>
                </cc1:Series>
            </SeriesSerializable>
            <PaletteWrappers>
                <dx:PaletteWrapper Name="Palette 1" ScaleMode="Extrapolate">
                    <Palette>
                        <cc1:PaletteEntry Color="0, 187, 0" Color2="0, 187, 0" />
                        <cc1:PaletteEntry Color="117, 152, 217" Color2="50, 97, 183" />
                        <cc1:PaletteEntry Color="179, 44, 22" Color2="125, 31, 15" />
                        <cc1:PaletteEntry Color="245, 205, 45" Color2="194, 157, 9" />
                        <cc1:PaletteEntry Color="174, 186, 213" Color2="98, 121, 173" />
                        <cc1:PaletteEntry Color="119, 124, 132" Color2="83, 87, 92" />
                    </Palette>
                </dx:PaletteWrapper>
            </PaletteWrappers>
        </dx:WebChartControl>
        <asp:SqlDataSource ID="ds_Graph_Ano_Empresa" runat="server" ConnectionString="<%$ ConnectionStrings:gerMetasConnectionString %>" SelectCommand="Gestor.usp_Graph_Ano_Empresa" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                <asp:SessionParameter Name="idGestor" SessionField="sUSUARIO" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

                           