<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="ParticipacaoVendaPorDia.aspx.vb" Inherits="MemberPages_Gerencial_ParticipacaoVendaPorDia" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>

<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>

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

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divAno">
        <uc1:wucAno runat="server" ID="cboAno" />
    </div>

    <div id="divMes">
        <uc1:wuciListaMes runat="server" ID="cboMes" />
    </div>

    <div id="divFilial">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
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
                  
                    <dxchartsui:WebChartControl ID="graph" runat="server" DataSourceID="dsDados" Height="500px" Width="1020px">
                        <padding bottom="1" left="1" right="1" top="1" />
                        <diagramserializable>
                            <cc1:XYDiagram>
                                <axisx gridspacing="0.1" gridspacingauto="False" visibleinpanesserializable="-1" workdaysonly="True">
                                    <label angle="90" EnableAntialiasing="True">
                                    </label>
                                    <range sidemarginsenabled="True" />
                                    <gridlines visible="True">
                                    </gridlines>
                                    <datetimeoptions format="MonthAndDay" />
                                    <workdaysoptions workdays="Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday">
                                    </workdaysoptions>
                                </axisx>
                                <axisy visible="False" visibleinpanesserializable="-1">
                                    <range sidemarginsenabled="True" />
                                </axisy>
                                <secondaryaxesy>
                                    <cc1:SecondaryAxisY AxisID="0" GridSpacing="0.5" GridSpacingAuto="False" Name="Axes_PercCrescSemana" Visible="False" VisibleInPanesSerializable="-1">
                                        <range auto="False" maxvalueserializable="100" minvalueserializable="0" sidemarginsenabled="True" />
                                    </cc1:SecondaryAxisY>
                                </secondaryaxesy>
                                <margins bottom="1" left="1" right="1" top="1" />
                            </cc1:XYDiagram>
                        </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

                        <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" direction="LeftToRight" equallyspaceditems="False"></legend>
                        <seriesserializable>
                            <cc1:Series ArgumentDataMember="Dia" LabelsVisibility="True" Name="R$ Venda" SynchronizePointOptions="False" ValueDataMembersSerializable="vlrVenda">
                                <viewserializable>
                                    <cc1:LineSeriesView MarkerVisibility="True">
                                        <linemarkeroptions BorderVisible="True">
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
                            <cc1:Series ArgumentDataMember="Dia" Name="% Participação da Semana" SynchronizePointOptions="False" ValueDataMembersSerializable="percPartSemana">
                                <viewserializable>
                                    <cc1:StepAreaSeriesView AxisYName="Axes_PercCrescSemana" MarkerVisibility="False">
                                        <markeroptions BorderVisible="False">
                                        </markeroptions>
                                    </cc1:StepAreaSeriesView>
                                </viewserializable>
                                <labelserializable>
                                    <cc1:PointSeriesLabel Angle="270" LineVisible="True" MaxLineCount="1">
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
                            <cc1:Series ArgumentDataMember="Dia" LabelsVisibility="True" Name="% Participação do Dia" SynchronizePointOptions="False" ValueDataMembersSerializable="percPart">
                                <viewserializable>
                                    <cc1:SplineAreaSeriesView AxisYName="Axes_PercCrescSemana" MarkerVisibility="True">
                                        <markeroptions size="5" BorderVisible="True">
                                        </markeroptions>
                                    </cc1:SplineAreaSeriesView>
                                </viewserializable>
                                <labelserializable>
                                    <cc1:PointSeriesLabel Angle="90" LineVisible="True" Font="Tahoma, 7pt" LineLength="5">
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
                            <cc1:Series ArgumentDataMember="Dia" LabelsVisibility="True" Name="% Margem" ValueDataMembersSerializable="percMargem">
                                <viewserializable>
                                    <cc1:SplineSeriesView AxisYName="Axes_PercCrescSemana" Color="64, 64, 64" LineTensionPercent="50" MarkerVisibility="True">
                                        <linestyle thickness="1" />
                                        <linemarkeroptions size="4" BorderVisible="True">
                                        </linemarkeroptions>
                                    </cc1:SplineSeriesView>
                                </viewserializable>
                                <labelserializable>
                                    <cc1:PointSeriesLabel Angle="90" BackColor="Transparent" Font="Tahoma, 7pt" LineLength="2" LineVisible="False" TextColor="Black">
                                        <border visible="False" />
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
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspParticipacaoVendaPorDia" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                            
                        </SelectParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>



</asp:Content>

