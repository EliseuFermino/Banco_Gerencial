<%@ Page Title="Análise Item por Ano - PGR295" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="AnaliseVendaUnicoItemPorAno.aspx.vb" Inherits="MemberPages_SLV_Item_AnaliseVendaUnicoItemPorAno" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>




<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>
<%@ Register Src="~/Controles/wucProdutoEncontra.ascx" TagPrefix="uc1" TagName="wucProdutoEncontra" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divFilial {            
            float: left;
            margin-left: 10px;
            margin-top: 5px;
            margin-bottom: 2px;            
        }  

        #divProduto {            
            float: left;
            margin-left: 10px;
            margin-top: 3px;
            margin-bottom: 2px;
            width: 600px;
        }                  

        #divBotaoAtualizar {            
            float: left;
            margin-left: 0px;
             margin-top: 2px;
        }

        #divTamanho {            
            float: left;
            margin-left: 10px;
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

        #divTituloGrafico_Depto {
            clear:both;
            padding-top: 10px;
            font-size:30px;
            text-align:center;
            color:darkgray;
        }


    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divFilial">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
    </div>

    <div id="divProduto">        
        <uc1:wucProdutoEncontra runat="server" ID="cboProduto" />
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {
cbPanel.PerformCallback();

}" />
        </dx:ASPxButton>
    </div>

    <div id="divTamanho">
        <dx:ASPxComboBox ID="cboTamanho" runat="server" Font-Size="16px" SelectedIndex="0" Theme="Metropolis" Width="70px" Height="27px">
            <ClientSideEvents SelectedIndexChanged="function(s, e) {
	cbPanel.PerformCallback();
}" />
            <Items>
                <dx:ListEditItem Selected="True" Text="100%" Value="100%" />
                <dx:ListEditItem Text="110%" Value="110%" />
                <dx:ListEditItem Text="120%" Value="120%" />
                <dx:ListEditItem Text="130%" Value="130%" />
                <dx:ListEditItem Text="140%" Value="140%" />
                <dx:ListEditItem Text="150%" Value="150%" />
                <dx:ListEditItem Text="160%" Value="160%" />
            </Items>
        </dx:ASPxComboBox>
    </div>

    <div id="divDados">

        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>

                    <dxchartsui:WebChartControl ID="graph" runat="server" DataSourceID="SqlDataSource1" Height="450px" Width="1000px" Visible="False">
                        <diagramserializable>
                            <cc1:XYDiagram>
                                <axisx visibleinpanesserializable="1" gridspacingauto="False" minorcount="1">
                                    <autoscalebreaks enabled="True" />
                                    <tickmarks crossaxis="True" />
                                    <label angle="90" font="Tahoma, 9pt">
                                    <resolveoverlappingoptions allowhide="False" />
                                    </label>
                                    <range sidemarginsenabled="True" />
                                    <gridlines visible="True" minorvisible="True">
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
                                </secondaryaxesy>
                                <panes>
                                    <cc1:XYDiagramPane Name="Pane 1" PaneID="0">
                                    </cc1:XYDiagramPane>
                                    <cc1:XYDiagramPane Name="Pane 2" PaneID="1">
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

                        <titles>
                            <cc1:ChartTitle Font="Tahoma, 12pt" Text="Análise de Vendas, Lucro com Sellout e Margem com Sellout - Ano 2015" />
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

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemAnoConnectionString %>" SelectCommand="Analises.usp_Unico_Item" SelectCommandType="StoredProcedure">
                        <SelectParameters>                            
                            <asp:SessionParameter Name="idProduto" SessionField="sPRODUTO" Type="Int32" />    
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />                          
                        </SelectParameters>
                    </asp:SqlDataSource>
                    
                    <br />
                    
                    <dxchartsui:WebChartControl ID="graph1" runat="server" DataSourceID="SqlDataSource1" Height="450px" Width="1000px" Visible="False">
                        <diagramserializable>
                            <cc1:XYDiagram>
                                <axisx visibleinpanesserializable="4" gridspacingauto="False" minorcount="1">
                                    <tickmarks crossaxis="True" />
                                    <label angle="90" font="Tahoma, 9pt">
                                    <resolveoverlappingoptions allowhide="False" />
                                    </label>
                                    <range sidemarginsenabled="True" />
                                    <gridlines visible="True" minorvisible="True">
                                    </gridlines>
                                </axisx>
                                <axisy visibleinpanesserializable="-1" title-font="Tahoma, 9pt, style=Bold" title-text="Volume" title-visible="True">
                                    <tickmarks minorvisible="False" visible="False" />
                                    <label visible="False">
                                    </label>
                                    <range sidemarginsenabled="True" />
                                    <gridlines visible="False">
                                    </gridlines>
                                </axisy>
                                <secondaryaxesy>
                                    <cc1:SecondaryAxisY Alignment="Near" AxisID="0" Name="Clientes AxisY " VisibleInPanesSerializable="4" Title-Antialiasing="False" Title-Font="Tahoma, 9pt, style=Bold" Title-Text="Clientes" Title-Visible="True">
                                        <tickmarks minorvisible="False" visible="False" />
                                        <label visible="False">
                                        </label>
                                        <range sidemarginsenabled="True" />
                                    </cc1:SecondaryAxisY>
                                    <cc1:SecondaryAxisY Alignment="Near" AxisID="1" Name="PrecoMedio AxisY " VisibleInPanesSerializable="3" Title-Antialiasing="False" Title-Font="Tahoma, 9pt, style=Bold" Title-Text="Preço Médio" Title-Visible="True">
                                        <tickmarks minorvisible="False" visible="False" />
                                        <label visible="False">
                                        </label>
                                        <range sidemarginsenabled="True" />
                                    </cc1:SecondaryAxisY>
                                </secondaryaxesy>
                                <defaultpane weight="0.5">
                                </defaultpane>
                                <panes>
                                    <cc1:XYDiagramPane Name="Pane 4" PaneID="3" Weight="0.3">
                                    </cc1:XYDiagramPane>
                                    <cc1:XYDiagramPane Name="Pane 5" PaneID="4" Weight="0.5">
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
                                    <cc1:LineSeriesView MarkerVisibility="True">
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
                            <cc1:ChartTitle Font="Tahoma, 12pt" Text="Análise Volume, Preço Médio e Número de Clientes - Ano 2015" />
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


                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>




    </div>




</asp:Content>


