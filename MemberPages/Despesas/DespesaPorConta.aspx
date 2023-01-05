<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="DespesaPorConta.aspx.vb" Inherits="MemberPages_Despesas_DespesaPorConta" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>

<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucListaGrupo.ascx" TagPrefix="uc1" TagName="wucListaGrupo" %>
<%@ Register Src="~/Controles/wucListaGrupo_Subgrupo.ascx" TagPrefix="uc1" TagName="wucListaGrupo_Subgrupo" %>
<%@ Register Src="~/Controles/wucListaGrupo_Subgrupo_work.ascx" TagPrefix="uc1" TagName="wucListaGrupo_Subgrupo_work" %>






<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divAno {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divMes {            
            float: left;
            margin-left: 10px;
        }

        #divFilial {            
            float: left;
            margin-left: 10px;
        }

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #wrapper {
            width: 990px;
            margin-right: auto;
            
        }

        #divDados {
            clear:both;
            float: left;                
            width: 990px;            
            margin-top: 15px;
            height: 420px;
            background-color : #F2F2F2;
            border-radius: 5px;
            border: 1px solid #DEDCD9;
        }

        #divDespesa {
            float: left;
            width: 300px;
        }

    </style>


</asp:Content>



<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divAno">
        <uc1:wucAno runat="server" ID="cboAno" />
    </div>

    <div id="divMes">
        <uc1:wuciListaMes runat="server" ID="cboMes" />
    </div>

    <div id="divFilial">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
    </div>

    <div id="divDespesa">
        <uc1:wucListaGrupo runat="server" ID="cboGrupo" />
        
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

    <div id="div1">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>
                  
                 <%--Arraste seu controle aqui --%>                         
                    
                    <div id="wrapper">

                        <div id="divDados">

                            <dxchartsui:WebChartControl ID="graph_1" runat="server" DataSourceID="dsGraph_1" Height="398px" Width="991px">
                                <diagramserializable>
                                    <cc1:XYDiagram>
                                        <axisx visibleinpanesserializable="-1" color="Silver">
                                            <range sidemarginsenabled="True" />
                                            <gridlines visible="True">
                                            </gridlines>
                                        </axisx>
                                        <axisy visibleinpanesserializable="-1">
                                            <range sidemarginsenabled="True" />
                                        </axisy>
                                    </cc1:XYDiagram>
                                </diagramserializable>
                <FillStyle><OptionsSerializable>
                <cc1:SolidFillOptions></cc1:SolidFillOptions>
                </OptionsSerializable>
                </FillStyle>

                                <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="7">
                                    <margins bottom="1" left="1" right="1" top="1" />
                                </legend>
                                <seriesserializable>
                                    <cc1:Series ArgumentDataMember="DescGraph" LabelsVisibility="True" LegendText="% Crescimento da Despesa" Name="despAnoAnterior" ValueDataMembersSerializable="percCrescVenda">
                                        <datafilters>
                                            <cc1:DataFilter ColumnName="Ordem" Condition="LessThan" DataType="System.Byte" InvariantValueSerializable="3" />
                                        </datafilters>
                                        <viewserializable>
                                            <cc1:SideBySideBarSeriesView Color="Red">
                                                <fillstyle fillmode="Solid">
                                                    <optionsserializable>
                                                        <cc1:SolidFillOptions />
                                                    </optionsserializable>
                                                </fillstyle>
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
                                    <cc1:Series ArgumentDataMember="DescGraph" LabelsVisibility="True" LegendText="% Crescimento da Venda" Name="vendaAnoAnterior" ValueDataMembersSerializable="percCrescDespesa">
                                        <datafilters>
                                            <cc1:DataFilter ColumnName="Ordem" Condition="LessThan" DataType="System.Byte" InvariantValueSerializable="3" />
                                        </datafilters>
                                        <viewserializable>
                                            <cc1:SideBySideBarSeriesView Color="Blue">
                                                <fillstyle fillmode="Solid">
                                                    <optionsserializable>
                                                        <cc1:SolidFillOptions />
                                                    </optionsserializable>
                                                </fillstyle>
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
                                    <cc1:Series ArgumentDataMember="DescGraph" LabelsVisibility="True" Name="vendaMesesAnoAtual" ShowInLegend="False" ValueDataMembersSerializable="percCrescVenda">
                                        <datafilters>
                                            <cc1:DataFilter ColumnName="Ordem" Condition="GreaterThan" DataType="System.Byte" InvariantValueSerializable="2" />
                                            <cc1:DataFilter ColumnName="Ordem" Condition="LessThan" DataType="System.Byte" InvariantValueSerializable="15" />
                                        </datafilters>
                                        <viewserializable>
                                            <cc1:SplineSeriesView Color="Blue" MarkerVisibility="True">
                                                <linemarkeroptions size="5" BorderVisible="True">
                                                </linemarkeroptions>
                                            </cc1:SplineSeriesView>
                                        </viewserializable>
                                        <labelserializable>
                                            <cc1:PointSeriesLabel LineVisible="True" ResolveOverlappingMode="Default">
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
                                    <cc1:Series ArgumentDataMember="DescGraph" LabelsVisibility="True" Name="despMesesAnoAtual" ShowInLegend="False" ValueDataMembersSerializable="percCrescDespesa">
                                        <datafilters>
                                            <cc1:DataFilter ColumnName="Ordem" Condition="GreaterThan" DataType="System.Byte" InvariantValueSerializable="2" />
                                            <cc1:DataFilter ColumnName="Ordem" Condition="LessThan" DataType="System.Byte" InvariantValueSerializable="15" />
                                        </datafilters>
                                        <viewserializable>
                                            <cc1:SplineSeriesView Color="Red" MarkerVisibility="True">
                                                <linemarkeroptions size="5" BorderVisible="True">
                                                </linemarkeroptions>
                                            </cc1:SplineSeriesView>
                                        </viewserializable>
                                        <labelserializable>
                                            <cc1:PointSeriesLabel Angle="90" LineVisible="True" ResolveOverlappingMode="Default">
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
                                    <cc1:Series ArgumentDataMember="DescGraph" LabelsVisibility="True" Name="vendaAnoAtual" ShowInLegend="False" ValueDataMembersSerializable="percCrescVenda">
                                        <datafilters>
                                            <cc1:DataFilter ColumnName="Ordem" DataType="System.Byte" InvariantValueSerializable="15" />
                                        </datafilters>
                                        <viewserializable>
                                            <cc1:SideBySideBarSeriesView Color="Red">
                                                <fillstyle fillmode="Solid">
                                                    <optionsserializable>
                                                        <cc1:SolidFillOptions />
                                                    </optionsserializable>
                                                </fillstyle>
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
                                    <cc1:Series ArgumentDataMember="DescGraph" LabelsVisibility="True" Name="despAnoAtual" ShowInLegend="False" ValueDataMembersSerializable="percCrescDespesa">
                                        <datafilters>
                                            <cc1:DataFilter ColumnName="Ordem" DataType="System.Byte" InvariantValueSerializable="15" />
                                        </datafilters>
                                        <viewserializable>
                                            <cc1:SideBySideBarSeriesView Color="Blue">
                                                <fillstyle fillmode="Solid">
                                                    <optionsserializable>
                                                        <cc1:SolidFillOptions />
                                                    </optionsserializable>
                                                </fillstyle>
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
                                    <cc1:ChartTitle Text="Crescimento s/ Ano Anterior - Despesa  x Venda" />
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

                            <asp:SqlDataSource ID="dsGraph_1" runat="server" ConnectionString="<%$ ConnectionStrings:gerDespesasConnectionString %>" SelectCommand="uspDespesaPorConta" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                    <asp:SessionParameter Name="idGrupo" SessionField="sGRUPO" Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource>




                            </div>

                        <div id="div13Meses">
                            <dxchartsui:WebChartControl ID="chart_2" runat="server" DataSourceID="dsGraph_2" Height="295px" Width="555px">

                                <diagramserializable>
                                    <cc1:XYDiagram>
                                        <axisx reverse="True" visibleinpanesserializable="-1">
                                            <range sidemarginsenabled="True" />
                                        </axisx>
                                        <axisy visibleinpanesserializable="-1">
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
                                    <cc1:Series ArgumentDataMember="DescGraph" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="perc">
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
                            <asp:SqlDataSource ID="dsGraph_2" runat="server" ConnectionString="<%$ ConnectionStrings:gerDespesasConnectionString %>" SelectCommand="uspDespesaPorConta_13Meses_Percentual" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                    <asp:SessionParameter Name="idGrupo" SessionField="sGRUPO" Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>

                    </div>


                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>



</asp:Content>


