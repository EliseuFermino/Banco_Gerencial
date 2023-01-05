<%@ Page Title="Análise Item Semanal - 12 Meses - PGR291" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="AnaliseVendaUnicoItemDiaSemana.aspx.vb" Inherits="MemberPages_SLV_Item_AnaliseVendaUnicoItemDiaSemana" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>




<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>
<%@ Register Src="~/Controles/wuciListaSemana.ascx" TagPrefix="uc1" TagName="wuciListaSemana" %>
<%@ Register Src="~/Controles/wucProdutoEncontra.ascx" TagPrefix="uc1" TagName="wucProdutoEncontra" %>













<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        
        #divProduto {            
            float: left;
            margin-left: 10px;
            margin-top: 3px;
            margin-bottom: 2px;
            width: 600px;
        }   
        
        #divSemana {            
            float: left;
            margin-left: 1px;
            margin-top: 5px;
        }                         

        #divBotaoAtualizar {            
            float: left;
            margin-left: 20px;
             margin-top: 2px;
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divSize {            
            float: left;           
        }

        #divBotaoExcel {            
            float: left;
            margin-left: 10px;
        }



    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


    <div id="divProduto">        
        <uc1:wucProdutoEncontra runat="server" ID="cboProduto" />
    </div>

    <div id="divSemana">
        <uc1:wuciListaSemana runat="server" ID="cboSemana" />
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

                    <dxchartsui:WebChartControl ID="graph" runat="server" DataSourceID="SqlDataSource1" Height="700px" Width="1300px" Visible="False">
                        <diagramserializable>
                            <cc1:XYDiagram>
                                <axisx visibleinpanesserializable="4" gridspacing="7" gridspacingauto="False">
                                    <label angle="90" font="Tahoma, 7pt">
                                    </label>
                                    <range sidemarginsenabled="True" />
                                    <gridlines visible="True">
                                    </gridlines>
                                </axisx>
                                <axisy visibleinpanesserializable="-1" title-font="Tahoma, 9pt, style=Bold" title-text="Vendas" title-visible="True">
                                    <tickmarks minorvisible="False" visible="False" />
                                    <label visible="False">
                                    </label>
                                    <range sidemarginsenabled="True" />
                                    <gridlines visible="False">
                                    </gridlines>
                                </axisy>
                                <secondaryaxesy>
                                    <cc1:SecondaryAxisY Alignment="Near" AxisID="0" Name="Lucro AxisY " VisibleInPanesSerializable="0" Title-Antialiasing="False" Title-Font="Tahoma, 9pt, style=Bold" Title-Text="Lucro" Title-Visible="True">
                                        <tickmarks minorvisible="False" visible="False" />
                                        <label visible="False">
                                        </label>
                                        <range sidemarginsenabled="True" />
                                    </cc1:SecondaryAxisY>
                                    <cc1:SecondaryAxisY Alignment="Near" AxisID="1" Name="Margem AxisY " VisibleInPanesSerializable="1" Title-Antialiasing="False" Title-Font="Tahoma, 9pt, style=Bold" Title-Text="Margem" Title-Visible="True">
                                        <tickmarks minorvisible="False" visible="False" />
                                        <label visible="False">
                                        </label>
                                        <range sidemarginsenabled="True" />
                                    </cc1:SecondaryAxisY>
                                    <cc1:SecondaryAxisY Alignment="Near" AxisID="2" Name="Volume AxisY " VisibleInPanesSerializable="2" Title-Antialiasing="False" Title-Font="Tahoma, 9pt, style=Bold" Title-Text="Volume" Title-Visible="True">
                                        <tickmarks minorvisible="False" visible="False" />
                                        <label visible="False">
                                        </label>
                                        <range sidemarginsenabled="True" />
                                    </cc1:SecondaryAxisY>
                                    <cc1:SecondaryAxisY Alignment="Near" AxisID="3" Name="Clientes AxisY " VisibleInPanesSerializable="4" Title-Antialiasing="False" Title-Font="Tahoma, 9pt, style=Bold" Title-Text="Clientes" Title-Visible="True">
                                        <tickmarks minorvisible="False" visible="False" />
                                        <label visible="False">
                                        </label>
                                        <range sidemarginsenabled="True" />
                                    </cc1:SecondaryAxisY>
                                    <cc1:SecondaryAxisY Alignment="Near" AxisID="4" Name="PrecoMedio AxisY " VisibleInPanesSerializable="3" Title-Antialiasing="False" Title-Font="Tahoma, 9pt, style=Bold" Title-Text="Preço Médio" Title-Visible="True">
                                        <tickmarks minorvisible="False" visible="False" />
                                        <label visible="False">
                                        </label>
                                        <range sidemarginsenabled="True" />
                                    </cc1:SecondaryAxisY>
                                </secondaryaxesy>
                                <panes>
                                    <cc1:XYDiagramPane Name="Pane 1" PaneID="0">
                                    </cc1:XYDiagramPane>
                                    <cc1:XYDiagramPane Name="Pane 2" PaneID="1">
                                    </cc1:XYDiagramPane>
                                    <cc1:XYDiagramPane Name="Pane 3" PaneID="2">
                                    </cc1:XYDiagramPane>
                                    <cc1:XYDiagramPane Name="Pane 4" PaneID="3">
                                    </cc1:XYDiagramPane>
                                    <cc1:XYDiagramPane Name="Pane 5" PaneID="4">
                                    </cc1:XYDiagramPane>
                                </panes>
                            </cc1:XYDiagram>
                        </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

                        <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="5" Visibility="False"></legend>
                        <seriesserializable>
                            <cc1:Series ArgumentDataMember="Dia" Name="Volume" ValueDataMembersSerializable="Volume" LabelsVisibility="True">
                                <viewserializable>
                                    <cc1:LineSeriesView AxisYName="Volume AxisY " MarkerVisibility="True" PaneName="Pane 3">
                                        <linemarkeroptions BorderVisible="True" size="3">
                                        </linemarkeroptions>
                                    </cc1:LineSeriesView>
                                </viewserializable>
                                <labelserializable>
                                    <cc1:PointSeriesLabel LineVisible="True" Angle="90" TextOrientation="BottomToTop">
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
                            <cc1:Series ArgumentDataMember="Dia" Name="vlrVenda" ValueDataMembersSerializable="vlrVenda" LabelsVisibility="True">
                                <viewserializable>
                                    <cc1:LineSeriesView MarkerVisibility="True">
                                        <linemarkeroptions BorderVisible="True" size="5">
                                        </linemarkeroptions>
                                    </cc1:LineSeriesView>
                                </viewserializable>
                                <labelserializable>
                                    <cc1:PointSeriesLabel LineVisible="True" Angle="90" TextOrientation="BottomToTop">
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
                            <cc1:Series ArgumentDataMember="Dia" Name="vlrLucroComercial" ValueDataMembersSerializable="vlrLucroComercial" LabelsVisibility="True">
                                <viewserializable>
                                    <cc1:LineSeriesView AxisYName="Lucro AxisY " MarkerVisibility="True" PaneName="Pane 1">
                                        <linemarkeroptions BorderVisible="True" size="5">
                                        </linemarkeroptions>
                                    </cc1:LineSeriesView>
                                </viewserializable>
                                <labelserializable>
                                    <cc1:PointSeriesLabel LineVisible="True" Angle="90" TextOrientation="BottomToTop">
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
                            <cc1:Series ArgumentDataMember="Dia" Name="numCliente" ValueDataMembersSerializable="numCliente" LabelsVisibility="True">
                                <viewserializable>
                                    <cc1:LineSeriesView AxisYName="Clientes AxisY " MarkerVisibility="True" PaneName="Pane 5">
                                        <linemarkeroptions BorderVisible="True" size="5">
                                        </linemarkeroptions>
                                    </cc1:LineSeriesView>
                                </viewserializable>
                                <labelserializable>
                                    <cc1:PointSeriesLabel LineVisible="True" Angle="90" TextOrientation="BottomToTop">
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
                            <cc1:Series ArgumentDataMember="Dia" Name="vlrPrecoMedio" ValueDataMembersSerializable="vlrPrecoMedio" LabelsVisibility="True">
                                <viewserializable>
                                    <cc1:LineSeriesView AxisYName="PrecoMedio AxisY " MarkerVisibility="True" PaneName="Pane 4">
                                        <linemarkeroptions BorderVisible="True" size="5">
                                        </linemarkeroptions>
                                    </cc1:LineSeriesView>
                                </viewserializable>
                                <labelserializable>
                                    <cc1:PointSeriesLabel LineVisible="True" Angle="90" TextOrientation="BottomToTop">
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
                            <cc1:Series ArgumentDataMember="Dia" Name="percMargem" ValueDataMembersSerializable="percMargem" LabelsVisibility="True">
                                <viewserializable>
                                    <cc1:LineSeriesView AxisYName="Margem AxisY " MarkerVisibility="True" PaneName="Pane 2">
                                        <linemarkeroptions BorderVisible="True" size="5">
                                        </linemarkeroptions>
                                    </cc1:LineSeriesView>
                                </viewserializable>
                                <labelserializable>
                                    <cc1:PointSeriesLabel LineVisible="True" Angle="90" TextOrientation="BottomToTop">
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

<CrosshairOptions><CommonLabelPositionSerializable>
<cc1:CrosshairMousePosition></cc1:CrosshairMousePosition>
</CommonLabelPositionSerializable>
</CrosshairOptions>

<ToolTipOptions><ToolTipPositionSerializable>
<cc1:ToolTipMousePosition></cc1:ToolTipMousePosition>
</ToolTipPositionSerializable>
</ToolTipOptions>
                    </dxchartsui:WebChartControl>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" SelectCommand="Analises.usp_Unico_Item_porDia_da_Semana" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                            <asp:SessionParameter Name="idProduto" SessionField="sPRODUTO" Type="Int32" />
                            <asp:SessionParameter Name="idDiaSemana" SessionField="sDIA_SEMANA" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>




</asp:Content>


