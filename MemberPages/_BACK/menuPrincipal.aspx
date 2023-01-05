<%@ Page Title="Menu Principal" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="menuPrincipal.aspx.vb" Inherits="MemberPages_menuPrincipal_OLD" %>

<%@ Register Assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGauges" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register Src="~/Controles/wucVendaAcompanhamentoMercadologico.ascx" TagPrefix="uc1" TagName="wucVendaAcompanhamentoMercadologico" %>
<%@ Register Src="~/Controles/wucMargemNegativaFilial.ascx" TagPrefix="uc1" TagName="wucMargemNegativaFilial" %>
<%@ Register Src="~/Controles/wuc_KPI_Secao_Depto.ascx" TagPrefix="uc1" TagName="wuc_KPI_Secao_Depto" %>


<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Linear" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Circular" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.State" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Digital" tagprefix="dx" %>

<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    
    <style type="text/css">
        
        #divContainer {
            clear: both ;
            float: left;
            margin-left: 4px;
            margin-top: 4px;
           
        }

        #div_KPI_Grupo_Vendas {
            text-align:center;
            
            float: left;            
            margin-top: 4px;
            /*border: 1px solid gray;
            padding: 4px;
            border-radius: 3px;*/
        }

        #div_MP_MargemNegativa {
            clear: both ;
            float: left;  
            margin-left: 2px;
        }

        .myMargem {
            padding: 8px 2px 2px 2px;
        }

    </style>

    <link href="../css/bootstrap.min.css" rel="stylesheet" />

 
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server" >

    <div id="divGerentes" class="container-fluid myMargem " runat="server" >
        <div class="row">
            <div class="col-md-12">
                <div class="panel panel-primary">
                  <div class="panel-heading"><span class="glyphicon glyphicon-signal"></span> Percentual de Crescimento de Número de Clientes comparando com a Empresa - Últimos 12 meses</div>
                  <div class="panel-body">
                    
                        <dxchartsui:WebChartControl ID="Graph" runat="server" DataSourceID="dsDados" Height="450px" Width="950px">
                            <diagramserializable>
                                <cc1:XYDiagram>
                                    <axisx visibleinpanesserializable="-1">
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

                            <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="7"></legend>
                            <seriesserializable>
                                <cc1:Series LabelsVisibility="True" Name="Empresa" ArgumentDataMember="Periodo" ValueDataMembersSerializable="percCrescEmpresaMesas">                                                                     
                                    <viewserializable>
                                        <cc1:LineSeriesView MarkerVisibility="True">
                                            <linemarkeroptions size="2" BorderVisible="True">
                                            </linemarkeroptions>
                                        </cc1:LineSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:PointSeriesLabel Angle="270" LineVisible="True" ResolveOverlappingMode="JustifyAroundPoint">
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
                                <cc1:Series LabelsVisibility="True" Name="Loja" ArgumentDataMember="Periodo" ValueDataMembersSerializable="percCrescLoja">
                                    <viewserializable>
                                        <cc1:LineSeriesView MarkerVisibility="True" Color="ForestGreen">
                                            <linemarkeroptions size="2" BorderVisible="True">
                                            </linemarkeroptions>
                                        </cc1:LineSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:PointSeriesLabel Angle="270" LineVisible="True" ResolveOverlappingMode="JustifyAroundPoint">
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
                                <cc1:ChartTitle Font="Tahoma, 14pt" Indent="1" Text=" Percentual de Crescimento do Número de Clientes Mensal" WordWrap="True" />
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
                    
		                <asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:DW_VendasConnectionString %>" SelectCommand="dbo.sp_BuscarCrescimento" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>


                  </div>
                </div>
            </div>
            
        </div>

 <div class="row">
            <div class="col-md-12">
                <div class="panel panel-danger">
                  <div class="panel-heading"><span class="glyphicon glyphicon-signal"></span> Valor do Ticket Médio e Percentual de Crescimento do Ticket Médio - Últimos 12 meses</div>
                  <div class="panel-body">
                    
                        <dxchartsui:WebChartControl ID="Chart_TicketMedio" runat="server" DataSourceID="dsTicketMedio" Height="450px" Width="950px">
                            <diagramserializable>
                                <cc1:XYDiagram>
                                    <axisx visibleinpanesserializable="-1" reverse="True">
                                        <range sidemarginsenabled="True" />
                                    </axisx>
                                    <axisy visibleinpanesserializable="-1" visible="False">
                                        <range sidemarginsenabled="True" />
                                    </axisy>
                                </cc1:XYDiagram>
                            </diagramserializable>
    <FillStyle><OptionsSerializable>
    <cc1:SolidFillOptions></cc1:SolidFillOptions>
    </OptionsSerializable>
    </FillStyle>

                            <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="7"></legend>
                            <seriesserializable>
                                <cc1:Series LabelsVisibility="True" Name="TicketMedio" ArgumentDataMember="Periodo" ValueDataMembersSerializable="vlrTicketMedio">                                                                     
                                    <viewserializable>
                                        <cc1:SideBySideBarSeriesView Color="156, 128, 128, 255" Transparency="99">
                                            <fillstyle fillmode="Solid">
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                        </cc1:SideBySideBarSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:SideBySideBarSeriesLabel LineVisible="True" ResolveOverlappingMode="Default">
                                            <fillstyle>
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                            <pointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </pointoptionsserializable>
                                        </cc1:SideBySideBarSeriesLabel>
                                    </labelserializable>
                                    <legendpointoptionsserializable>
                                        <cc1:PointOptions>
                                            <valuenumericoptions format="Currency" />
                                        </cc1:PointOptions>
                                    </legendpointoptionsserializable>
                                </cc1:Series>
                                <cc1:Series LabelsVisibility="True" Name="Percentual" ArgumentDataMember="Periodo" ValueDataMembersSerializable="percCresc">
                                    <viewserializable>
                                        <cc1:LineSeriesView MarkerVisibility="True" Color="ForestGreen">
                                            <linemarkeroptions size="2" BorderVisible="True">
                                            </linemarkeroptions>
                                        </cc1:LineSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:PointSeriesLabel Angle="270" LineVisible="True" ResolveOverlappingMode="JustifyAroundPoint">
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
                                <cc1:ChartTitle Font="Tahoma, 14pt" Indent="1" Text="Ticket Médio e Percentual de Crescimento Mensal" WordWrap="True" />
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
                    
		                <asp:SqlDataSource ID="dsTicketMedio" runat="server" ConnectionString="<%$ ConnectionStrings:DW_VendasConnectionString %>" SelectCommand="dbo.uspBuscarTicketMedio_12Meses" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>


                  </div>
                </div>
            </div>
            
        </div>

    </div>
   


   
</asp:Content>

