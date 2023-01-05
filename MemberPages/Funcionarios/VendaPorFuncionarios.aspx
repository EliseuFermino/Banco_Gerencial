<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="VendaPorFuncionarios.aspx.vb" Inherits="MemberPages_Funcionarios_VendaPorFuncionarios" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>






<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>






<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >


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


    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
   

    <div id="divFilial">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

   
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>
                    
                    <div id="divDados">                  
                 
                        <dxchartsui:WebChartControl ID="Graph" runat="server" DataSourceID="dsDados" Height="550px" Width="1000px">
                            <diagramserializable>
                                <cc1:XYDiagram>
                                    <axisx visibleinpanesserializable="2">
                                        <label angle="270">
                                        </label>
                                        <range sidemarginsenabled="True" />
                                        <gridlines visible="True">
                                        </gridlines>
                                    </axisx>
                                    <axisy title-antialiasing="False" title-font="Tahoma, 8pt" title-text="Venda por Funcionário" title-visible="True" visibleinpanesserializable="-1">
                                        <tickmarks minorvisible="False" visible="False" />
                                        <label visible="False">
                                        </label>
                                        <range sidemarginsenabled="True" />
                                        <gridlines visible="False">
                                        </gridlines>
                                    </axisy>
                                    <secondaryaxesy>
                                        <cc1:SecondaryAxisY Alignment="Near" AxisID="0" Name="Secondary AxisY 1" Title-Font="Tahoma, 8pt" Title-Text="% Cresc. Venda Func." Title-Visible="True" VisibleInPanesSerializable="0">
                                            <tickmarks minorvisible="False" visible="False" />
                                            <label visible="False">
                                            </label>
                                            <range sidemarginsenabled="True" />
                                        </cc1:SecondaryAxisY>
                                        <cc1:SecondaryAxisY Alignment="Near" AxisID="1" Name="Secondary AxisY 2" Title-Font="Tahoma, 8pt" Title-Text="% Cresc. Nº Func." Title-Visible="True" VisibleInPanesSerializable="1">
                                            <tickmarks minorvisible="False" visible="False" />
                                            <label visible="False">
                                            </label>
                                            <range sidemarginsenabled="True" />
                                        </cc1:SecondaryAxisY>
                                        <cc1:SecondaryAxisY Alignment="Near" AxisID="2" Name="Secondary AxisY 3" Title-Font="Tahoma, 8pt" Title-Text="Nº de Funcionários" Title-Visible="True" VisibleInPanesSerializable="2">
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
                                    </panes>
                                </cc1:XYDiagram>
                            </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

                            <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" direction="BottomToTop" maxverticalpercentage="5" Visibility="False"></legend>
                            <seriesserializable>

                                <cc1:Series ArgumentDataMember="Periodo" LabelsVisibility="True" Name="vlrVendaFunc" ValueDataMembersSerializable="vlrVendaFunc">
                                    <viewserializable>
                                        <cc1:LineSeriesView MarkerVisibility="True">
                                            <linemarkeroptions size="5" BorderVisible="True">
                                            </linemarkeroptions>
                                        </cc1:LineSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:PointSeriesLabel Angle="270" Font="Tahoma, 7.5pt" LineVisible="True">
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

                                <cc1:Series ArgumentDataMember="Periodo" LabelsVisibility="True" Name="percCrescVendaFunc" ValueDataMembersSerializable="percCrescVendaFunc">
                                    <viewserializable>
                                        <cc1:LineSeriesView AxisYName="Secondary AxisY 1" MarkerVisibility="True" PaneName="Pane 1">
                                            <linemarkeroptions size="5" BorderVisible="True">
                                            </linemarkeroptions>
                                        </cc1:LineSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:PointSeriesLabel Angle="270" Font="Tahoma, 7.5pt" LineVisible="True">
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

                                <cc1:Series ArgumentDataMember="Periodo" LabelsVisibility="True" Name="percCrescFunc" ValueDataMembersSerializable="percCrescFunc">
                                    <viewserializable>
                                        <cc1:LineSeriesView AxisYName="Secondary AxisY 2" MarkerVisibility="True" PaneName="Pane 2">
                                            <linemarkeroptions size="5" BorderVisible="True">
                                            </linemarkeroptions>
                                        </cc1:LineSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:PointSeriesLabel Angle="270" Font="Tahoma, 7.5pt" LineVisible="True">
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

                                <cc1:Series ArgumentDataMember="Periodo" LabelsVisibility="True" Name="numFuncionarios" ValueDataMembersSerializable="numFuncionarios">
                                    <viewserializable>
                                        <cc1:LineSeriesView AxisYName="Secondary AxisY 3" MarkerVisibility="True" PaneName="Pane 3">
                                            <linemarkeroptions size="5" BorderVisible="True">
                                            </linemarkeroptions>
                                        </cc1:LineSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:PointSeriesLabel Angle="270" Font="Tahoma, 7.5pt" LineVisible="True">
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

<CrosshairOptions><CommonLabelPositionSerializable>
<cc1:CrosshairMousePosition></cc1:CrosshairMousePosition>
</CommonLabelPositionSerializable>
</CrosshairOptions>

<ToolTipOptions><ToolTipPositionSerializable>
<cc1:ToolTipMousePosition></cc1:ToolTipMousePosition>
</ToolTipPositionSerializable>
</ToolTipOptions>
                        </dxchartsui:WebChartControl>                                
                    
		                <asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerCadastrosConnectionString %>" SelectCommand="Funcionarios.uspAnaliseVendaPorFuncionarios" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </div>



                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>




</asp:Content>





