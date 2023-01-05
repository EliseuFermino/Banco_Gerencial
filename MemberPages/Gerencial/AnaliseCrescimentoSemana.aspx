<%@ Page Title="Analise Crescimento Semana" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="AnaliseCrescimentoSemana.aspx.vb" Inherits="MemberPages_Gerencial_AnaliseCrescimentoSemana" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>






<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wuciListaSemana.ascx" TagPrefix="uc1" TagName="wuciListaSemana" %>


<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >
        html {            
            overflow-x:hidden;            
        }

        #moldura {
            width:1024px;
            margin: 0 auto ;            
        }

        #divAno {
           float: left;
           margin-left: 25px;
        }

        #divMes {
           float: left;
        }

        #divFilial {
           float: left;
           width: 340px;
           padding-left: 2px;                     
        }

        #divSemana {
           float: left;
           width: 140px;
           padding-left: 2px;           
        }

        .myBorder {
            border: 1px solid #bdbbbb;
            height: 30px;
            margin-left: 1px;  
            margin-top: 2px;          
        }

        #divBotaoAtualizar {
            float: left;
            margin-left: 2px;
            width: 80px;  
            padding-top: 2px;                                
        }

        #divGrid1 {
            clear: both;
            float: left;
            padding-top: 2px;
            width: 1015px;
            margin-left: 25px;            
        }

        #divGraficoResumoAno {
            float: left;
        }

        #divGraficoResumoMes {
            float: left;
            padding-top: 5px;
        }

        #divGrafico1 {
            clear:both;
           float: left;
        }

        #divGrafico2 {
           float: left;
           margin-left: -20px;
        }

        #divGrafico3 {
           float: left;
           margin-left: -20px;
        }
                
        #divDadosDia {
            clear:both;
           float: left;
           padding-top: 10px;  
           margin-left: 10px;         
        }

        #divDadosMes {            
           float: left;
           padding-top: 10px; 
           padding-left: 5px;          
        }

        .Titulo {
            clear:both;
            color:dimgray;
            padding-top: 10px;
            font-size: 26px;
            text-align: center;
        }

       #divGraficoResumoAno_TodasLojas {
            float: left;
        }


    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="moldura">
        <div id="divAno" class="myBorder">
            <uc1:wucAno runat="server" ID="cboAno" AutoPostBack="false"  />
        </div>

        <div id="divMes" class="myBorder">
            <uc1:wuciListaMes runat="server" ID="cboMes" AutoPostBack="false"  />
        </div>

        <div id="divFilial" class="myBorder">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
                </ContentTemplate>
            </asp:UpdatePanel>            
        </div>

        <div id="divSemana" class="myBorder">
            <uc1:wuciListaSemana runat="server" ID="cboSemana" />
        </div>

        <div id="divBotaoAtualizar">
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
                <ClientSideEvents Click="function(s, e) {	cbPanel1.PerformCallback();}" />
            </dx:ASPxButton>
        </div>

        <div id="divGrid1">
            <dx:ASPxCallbackPanel ID="cbPanel1" runat="server" Width="1020px" ClientInstanceName="cbPanel1" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde.Atualizando&amp;hellip;">
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttributes="both">

                        <div class="Titulo">
                            <asp:Label ID="lblTituloResumoAno" runat="server" Text=""></asp:Label>
                        </div>

                        <div id="divGraficoResumoAno">
                            <dxchartsui:WebChartControl ID="graficoResumoAno" runat="server" DataSourceID="dsGraficoResumoAno" CssClass="auto-style8" Height="379px" Width="975px" AppearanceNameSerializable="Chameleon" BackColor="Transparent">
                                <borderoptions Color="Gainsboro" />
                                <diagramserializable>
                                    <cc1:XYDiagram>
                                        <axisx visibleinpanesserializable="-1" color="Silver">
                                            <tickmarks minorvisible="False" visible="False" />
                                            <range sidemarginsenabled="True" />
                                        </axisx>
                                        <axisy visibleinpanesserializable="-1" visible="False">
                                            <range sidemarginsenabled="True" />
                                            <gridlines visible="False">
                                            </gridlines>
                                        </axisy>
                                        <defaultpane backcolor="Transparent" bordervisible="False">
                                            <fillstyle fillmode="Solid">
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                        </defaultpane>
                                    </cc1:XYDiagram>
                                </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

                               
                                <seriesserializable>
                                    <cc1:Series ArgumentDataMember="Dia" ArgumentScaleType="Qualitative" LabelsVisibility="True" Name="Series 1" SeriesPointsSorting="Ascending" ValueDataMembersSerializable="perc">
                                        <viewserializable>
                                            <cc1:SideBySideBarSeriesView Color="LimeGreen">
                                                <fillstyle fillmode="Solid">
                                                    <optionsserializable>
                                                        <cc1:SolidFillOptions />
                                                    </optionsserializable>
                                                </fillstyle>
                                            </cc1:SideBySideBarSeriesView>
                                        </viewserializable>
                                        <labelserializable>
                                            <cc1:SideBySideBarSeriesLabel LineVisible="True" Font="Tahoma, 8pt, style=Bold">
                                                <fillstyle>
                                                    <optionsserializable>
                                                        <cc1:SolidFillOptions />
                                                    </optionsserializable>
                                                </fillstyle>
                                                <pointoptionsserializable>
                                                    <cc1:PointOptions>
                                                        <valuenumericoptions format= "FixedPoint" />
                                                    </cc1:PointOptions>
                                                </pointoptionsserializable>
                                            </cc1:SideBySideBarSeriesLabel>
                                        </labelserializable>
                                        <legendpointoptionsserializable>
                                            <cc1:PointOptions>
                                                <valuenumericoptions format="FixedPoint" />
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
                            <asp:SqlDataSource ID="dsGraficoResumoAno" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspCrescimentoSemana_Ano_ResumoDias" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>

                        <div id="divTituloResumoMes" class="Titulo">
                            <asp:Label ID="lblTituloResumoMes" runat="server" Text=""></asp:Label>
                        </div>
                        
                        <div id="divGraficoResumoMes">
                            <dxchartsui:WebChartControl ID="graficoResumoMes" runat="server" DataSourceID="dsGraficoResumoMes" CssClass="auto-style8" Height="379px" Width="975px" AppearanceNameSerializable="Chameleon" BackColor="Transparent">
                                <borderoptions Color="Gainsboro" />
                                <diagramserializable>
                                    <cc1:XYDiagram>
                                        <axisx visibleinpanesserializable="-1" color="Silver">
                                            <tickmarks minorvisible="False" visible="False" />
                                            <range sidemarginsenabled="True" />
                                        </axisx>
                                        <axisy visibleinpanesserializable="-1" visible="False">
                                            <range sidemarginsenabled="True" />
                                            <gridlines visible="False">
                                            </gridlines>
                                        </axisy>
                                        <defaultpane backcolor="Transparent" bordervisible="False">
                                            <fillstyle fillmode="Solid">
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                        </defaultpane>
                                    </cc1:XYDiagram>
                                </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

                                <seriesserializable>
                                    <cc1:Series ArgumentDataMember="Dia" ArgumentScaleType="Qualitative" LabelsVisibility="True" Name="Series 1" SeriesPointsSorting="Ascending" ValueDataMembersSerializable="perc">
                                        <viewserializable>
                                            <cc1:SideBySideBarSeriesView Color="210, 151, 37">
                                                <fillstyle fillmode="Solid">
                                                    <optionsserializable>
                                                        <cc1:SolidFillOptions />
                                                    </optionsserializable>
                                                </fillstyle>
                                            </cc1:SideBySideBarSeriesView>
                                        </viewserializable>
                                        <labelserializable>
                                            <cc1:SideBySideBarSeriesLabel LineVisible="True" Font="Tahoma, 8pt, style=Bold">
                                                <fillstyle>
                                                    <optionsserializable>
                                                        <cc1:SolidFillOptions />
                                                    </optionsserializable>
                                                </fillstyle>
                                                <pointoptionsserializable>
                                                    <cc1:PointOptions>
                                                        <valuenumericoptions format= "FixedPoint" />
                                                    </cc1:PointOptions>
                                                </pointoptionsserializable>
                                            </cc1:SideBySideBarSeriesLabel>
                                        </labelserializable>
                                        <legendpointoptionsserializable>
                                            <cc1:PointOptions>
                                                <valuenumericoptions format="FixedPoint" />
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
                            <asp:SqlDataSource ID="dsGraficoResumoMes" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspCrescimentoSemana_Mes_ResumoDias" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>

                        <div class="Titulo">
                            <asp:Label ID="lblTituloDetalhado" runat="server" Text=""></asp:Label>
                        </div>

                        <div id="divGrafico1">
                            <dxchartsui:WebChartControl ID="grafico1" runat="server" DataSourceID="dsGrafico1" CssClass="auto-style8" Height="379px" Width="536px" BackColor="Transparent">
                                <borderoptions visible="False" />
                                <diagramserializable>
                                    <cc1:XYDiagram>
                                        <axisx visibleinpanesserializable="-1" color="Silver">
                                            <tickmarks minorvisible="False" visible="False" />
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

                                <seriesserializable>
                                    <cc1:Series ArgumentDataMember="Dia" ArgumentScaleType="Qualitative" LabelsVisibility="True" Name="Series 1" SeriesPointsSorting="Ascending" ValueDataMembersSerializable="perc">
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
                                                        <valuenumericoptions format= "FixedPoint" />
                                                    </cc1:PointOptions>
                                                </pointoptionsserializable>
                                            </cc1:SideBySideBarSeriesLabel>
                                        </labelserializable>
                                        <legendpointoptionsserializable>
                                            <cc1:PointOptions>
                                                <valuenumericoptions format="FixedPoint" />
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
                            <asp:SqlDataSource ID="dsGrafico1" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspCrescimentoSemana_Dia" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                    <asp:SessionParameter Name="numSemana" SessionField="sSEMANA" Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>

                        <div id="divGrafico2">
                            <dxchartsui:WebChartControl ID="grafico2" runat="server" DataSourceID="dsGrafico2" CssClass="auto-style8" Height="379px" Width="377px" AppearanceNameSerializable="Nature Colors" BackColor="Transparent">
                                <borderoptions visible="False" />
                                <diagramserializable>
                                    <cc1:XYDiagram>
                                        <axisx visibleinpanesserializable="-1" color="Silver">
                                            <tickmarks minorvisible="False" visible="False" />
                                            <range sidemarginsenabled="True" />
                                        </axisx>
                                        <axisy visibleinpanesserializable="-1" visible="False">
                                            <range sidemarginsenabled="True" />
                                            <gridlines visible="False">
                                            </gridlines>
                                        </axisy>
                                        <defaultpane backcolor="Transparent" bordervisible="False">
                                            <fillstyle fillmode="Solid">
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                        </defaultpane>
                                    </cc1:XYDiagram>
                                </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

                              
                                <seriesserializable>
                                    <cc1:Series ArgumentDataMember="Dia" ArgumentScaleType="Qualitative" LabelsVisibility="True" Name="Series 1" SeriesPointsSorting="Ascending" ValueDataMembersSerializable="perc">
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
                                                        <valuenumericoptions format= "FixedPoint" />
                                                    </cc1:PointOptions>
                                                </pointoptionsserializable>
                                            </cc1:SideBySideBarSeriesLabel>
                                        </labelserializable>
                                        <legendpointoptionsserializable>
                                            <cc1:PointOptions>
                                                <valuenumericoptions format="FixedPoint" />
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
                            <asp:SqlDataSource ID="dsGrafico2" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspCrescimentoSemana_Mes" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                    <asp:SessionParameter Name="numSemana" SessionField="sSEMANA" Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>

                        <div id="divGrafico3">
                            <dxchartsui:WebChartControl ID="grafico3" runat="server" DataSourceID="dsGrafico3" CssClass="auto-style8" Height="379px" Width="92px" AppearanceNameSerializable="Northern Lights" BackColor="Transparent">
                                <borderoptions visible="False" />
                                <diagramserializable>
                                    <cc1:XYDiagram>
                                        <axisx visibleinpanesserializable="-1" reverse="True" color="Silver">
                                            <tickmarks minorvisible="False" visible="False" />
                                            <range sidemarginsenabled="True" />
                                        </axisx>
                                        <axisy visibleinpanesserializable="-1" visible="False">
                                            <range sidemarginsenabled="True" />
                                            <gridlines visible="False">
                                            </gridlines>
                                        </axisy>
                                        <defaultpane backcolor="Transparent" bordervisible="False">
                                            <fillstyle fillmode="Solid">
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                        </defaultpane>
                                    </cc1:XYDiagram>
                                </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

                                <seriesserializable>
                                    <cc1:Series ArgumentDataMember="Ano" ArgumentScaleType="Qualitative" LabelsVisibility="True" Name="Series 1" SeriesPointsSorting="Ascending" ValueDataMembersSerializable="perc">
                                        <viewserializable>
                                            <cc1:SideBySideBarSeriesView Color="LimeGreen">
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
                                                        <valuenumericoptions format= "FixedPoint" />
                                                    </cc1:PointOptions>
                                                </pointoptionsserializable>
                                            </cc1:SideBySideBarSeriesLabel>
                                        </labelserializable>
                                        <legendpointoptionsserializable>
                                            <cc1:PointOptions>
                                                <valuenumericoptions format="FixedPoint" />
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
                            <asp:SqlDataSource ID="dsGrafico3" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspCrescimentoSemana_Ano" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                    <asp:SessionParameter Name="numSemana" SessionField="sSEMANA" Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>

                        <div id="divDadosDia">
                            <dx:ASPxGridView ID="gridDia" runat="server" DataSourceID="dsDadosDia" AutoGenerateColumns="False" Theme="Office2010Silver" EnableTheming="True" KeyFieldName="Dia">
                                <Columns>
                                    <dx:GridViewBandColumn Caption="Ano Atual" ShowInCustomizationForm="True" VisibleIndex="3">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Dia " FieldName="DiaAT" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="&nbsp;{0:dd/MM/yyyy} " EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda" ShowInCustomizationForm="True" VisibleIndex="1">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewDataTextColumn FieldName="perc" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5" Caption="%">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewBandColumn Caption="Ano Anterior" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <Columns>
                                            <dx:GridViewDataDateColumn Caption="Dia" FieldName="DiaAA" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                            </dx:GridViewDataDateColumn>
                                            <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVendaAA" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                </Columns>
                                <SettingsBehavior AllowFocusedRow="True" />
                                <SettingsPager Mode="ShowAllRecords">
                                </SettingsPager>
                                <Settings ShowTitlePanel="True" />
                                <SettingsText Title="Abertura Dia" />
                                <SettingsLoadingPanel Text="Aguarde. Atualizando&amp;hellip;" />
                                <Styles>
                                    <Header HorizontalAlign="Center"></Header>
	                                <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
	                                <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                    <TitlePanel Font-Size="Medium" ForeColor="#666666">
                                    </TitlePanel>
                                </Styles>
                            </dx:ASPxGridView>
                            <asp:SqlDataSource ID="dsDadosDia" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspCrescimentoSemana_Dia" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                    <asp:SessionParameter Name="numSemana" SessionField="sSEMANA" Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>

                        <div id="divDadosMes">
                            <dx:ASPxGridView ID="gridMes" runat="server" DataSourceID="dsDadosMes" EnableTheming="True" Theme="Office2010Silver" AutoGenerateColumns="False" KeyFieldName="DiaAA">

                                <TotalSummary>
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAT" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAA" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />
                                </TotalSummary>

                                <GroupSummary>
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAT" ShowInGroupFooterColumn="vlrVendaAT" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAA" ShowInGroupFooterColumn="vlrVendaAA" SummaryType="Sum" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" ShowInGroupFooterColumn="percCresc" SummaryType="Custom" />
                                </GroupSummary>
                                <Columns>
                                    <dx:GridViewBandColumn Caption="Ano Atual" ShowInCustomizationForm="True" VisibleIndex="5">
                                        <Columns>
                                            <dx:GridViewDataDateColumn Caption="Dia" FieldName="DiaAT" ShowInCustomizationForm="True" VisibleIndex="0">
                                            </dx:GridViewDataDateColumn>
                                            <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVendaAT" ShowInCustomizationForm="True" VisibleIndex="1">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Ano Anterior" ShowInCustomizationForm="True" VisibleIndex="3">
                                        <Columns>
                                            <dx:GridViewDataDateColumn Caption="Dia" FieldName="DiaAA" ShowInCustomizationForm="True" VisibleIndex="0">
                                            </dx:GridViewDataDateColumn>
                                            <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVendaAA" ShowInCustomizationForm="True" VisibleIndex="1">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewDataTextColumn FieldName="Mes" GroupIndex="0" ReadOnly="True" ShowInCustomizationForm="True" SortIndex="0" SortOrder="Descending" VisibleIndex="1">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percCresc" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Perecentual de crescimento. Ano atual versus ano anterior" VisibleIndex="6">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowFocusedRow="True" />
                                <SettingsPager Mode="ShowAllRecords">
                                </SettingsPager>
                                <Settings ShowGroupFooter="VisibleAlways" ShowFooter="True" ShowTitlePanel="True" />
                                <SettingsText Title="Abertura Mês e Ano" />
                                <SettingsLoadingPanel Text="Aguarde. Atualizando&amp;hellip;" />
                                <Styles>
                                    <Header HorizontalAlign="Center"></Header>
	                                <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
	                                <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                    <Footer BackColor="LimeGreen" Font-Bold="True">
                                    </Footer>
                                    <GroupFooter BackColor="#ECB853" Font-Bold="True">
                                    </GroupFooter>
                                    <TitlePanel Font-Size="Medium" ForeColor="#666666">
                                    </TitlePanel>
                                </Styles>

                            </dx:ASPxGridView>
                            <asp:SqlDataSource ID="dsDadosMes" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspCrescimentoSemana_Mes_Detalhe" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                    <asp:SessionParameter Name="numSemana" SessionField="sSEMANA" Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>

                        <div class="Titulo">
                            <asp:Label ID="lblTitulo_ResumoAno_TodasLojas" runat="server" Text=""></asp:Label>
                        </div>

                        <div id="divGraficoResumoAno_TodasLojas">
                            <dxchartsui:WebChartControl ID="GraficoResumoAno_TodasLojas" runat="server" DataSourceID="dsGraficoResumoAno_TodasLojas" CssClass="auto-style8" Height="379px" Width="975px" AppearanceNameSerializable="Chameleon" BackColor="Transparent">
                                <borderoptions Color="Gainsboro" />
                                <diagramserializable>
                                    <cc1:XYDiagram>
                                        <axisx visibleinpanesserializable="-1" color="Silver">
                                            <tickmarks minorvisible="False" visible="False" />
                                            <range sidemarginsenabled="True" />
                                        </axisx>
                                        <axisy visibleinpanesserializable="-1" visible="False">
                                            <range sidemarginsenabled="True" />
                                            <gridlines visible="False">
                                            </gridlines>
                                        </axisy>
                                        <defaultpane backcolor="Transparent" bordervisible="False">
                                            <fillstyle fillmode="Solid">
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                        </defaultpane>
                                    </cc1:XYDiagram>
                                </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

                                <seriesserializable>
                                    <cc1:Series ArgumentScaleType="Qualitative" LabelsVisibility="True" Name="Series 1" SeriesPointsSorting="Ascending" ValueDataMembersSerializable="perc" ArgumentDataMember="FilialLista" SeriesPointsSortingKey="Value_1">
                                        <viewserializable>
                                            <cc1:SideBySideBarSeriesView Color="LimeGreen">
                                                <fillstyle fillmode="Solid">
                                                    <optionsserializable>
                                                        <cc1:SolidFillOptions />
                                                    </optionsserializable>
                                                </fillstyle>
                                            </cc1:SideBySideBarSeriesView>
                                        </viewserializable>
                                        <labelserializable>
                                            <cc1:SideBySideBarSeriesLabel LineVisible="True" Font="Tahoma, 8pt, style=Bold" TextOrientation="TopToBottom">
                                                <fillstyle>
                                                    <optionsserializable>
                                                        <cc1:SolidFillOptions />
                                                    </optionsserializable>
                                                </fillstyle>
                                                <pointoptionsserializable>
                                                    <cc1:PointOptions>
                                                        <valuenumericoptions format= "FixedPoint" />
                                                    </cc1:PointOptions>
                                                </pointoptionsserializable>
                                            </cc1:SideBySideBarSeriesLabel>
                                        </labelserializable>
                                        <legendpointoptionsserializable>
                                            <cc1:PointOptions>
                                                <valuenumericoptions format="FixedPoint" />
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
                            <asp:SqlDataSource ID="dsGraficoResumoAno_TodasLojas" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspCrescimentoSemana_Ano_ResumoTodasLojas" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                    <asp:SessionParameter Name="numSemana" SessionField="sSEMANA" Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>

                        <div class="Titulo">
                            <asp:Label ID="lblTitulo_ResumoMes_TodasLojas" runat="server" Text=""></asp:Label>
                        </div>

                        <div id="divGraficoResumoMes_TodasLojas">
                            <dxchartsui:WebChartControl ID="GraficoResumoMes_TodasLojas" runat="server" DataSourceID="dsGraficoResumoMes_TodasLojas" CssClass="auto-style8" Height="379px" Width="975px" AppearanceNameSerializable="Chameleon" BackColor="Transparent">
                                <borderoptions Color="Gainsboro" />
                                <diagramserializable>
                                    <cc1:XYDiagram>
                                        <axisx visibleinpanesserializable="-1" color="Silver">
                                            <tickmarks minorvisible="False" visible="False" />
                                            <range sidemarginsenabled="True" />
                                        </axisx>
                                        <axisy visibleinpanesserializable="-1" visible="False">
                                            <range sidemarginsenabled="True" />
                                            <gridlines visible="False">
                                            </gridlines>
                                        </axisy>
                                        <defaultpane backcolor="Transparent" bordervisible="False">
                                            <fillstyle fillmode="Solid">
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                        </defaultpane>
                                    </cc1:XYDiagram>
                                </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

                                <seriesserializable>
                                    <cc1:Series ArgumentScaleType="Qualitative" LabelsVisibility="True" Name="Series 1" SeriesPointsSorting="Ascending" ValueDataMembersSerializable="perc" ArgumentDataMember="FilialLista" SeriesPointsSortingKey="Value_1">
                                        <viewserializable>
                                            <cc1:SideBySideBarSeriesView Color="210, 151, 37">
                                                <fillstyle fillmode="Solid">
                                                    <optionsserializable>
                                                        <cc1:SolidFillOptions />
                                                    </optionsserializable>
                                                </fillstyle>
                                            </cc1:SideBySideBarSeriesView>
                                        </viewserializable>
                                        <labelserializable>
                                            <cc1:SideBySideBarSeriesLabel LineVisible="True" Font="Tahoma, 8pt, style=Bold" TextOrientation="TopToBottom">
                                                <fillstyle>
                                                    <optionsserializable>
                                                        <cc1:SolidFillOptions />
                                                    </optionsserializable>
                                                </fillstyle>
                                                <pointoptionsserializable>
                                                    <cc1:PointOptions>
                                                        <valuenumericoptions format= "FixedPoint" />
                                                    </cc1:PointOptions>
                                                </pointoptionsserializable>
                                            </cc1:SideBySideBarSeriesLabel>
                                        </labelserializable>
                                        <legendpointoptionsserializable>
                                            <cc1:PointOptions>
                                                <valuenumericoptions format="FixedPoint" />
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
                            <asp:SqlDataSource ID="dsGraficoResumoMes_TodasLojas" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspCrescimentoSemana_Mes_ResumoTodasLojas" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                    <asp:SessionParameter Name="numSemana" SessionField="sSEMANA" Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>

                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </div>



    </div>
</asp:Content>

