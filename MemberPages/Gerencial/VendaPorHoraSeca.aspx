<%@ Page Title="Venda por Hora e Seção" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="VendaPorHoraSeca.aspx.vb" Inherits="MemberPages_Gerencial_VendaPorHoraSeca" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>

<%@ Register Src="~/Controles/wucListaSecao.ascx" TagPrefix="uc1" TagName="wucListaSecao" %>



<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>



<%@ Register src="../../Controles/wucListaDiaIniFin.ascx" tagname="wucListaDiaIniFin" tagprefix="uc2" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

      
        #divMes {            
            float: left;
            margin-left: 10px;
        }

        #divFilial {            
            float: left;
            margin-left: 10px;
        }

        #divSecao {            
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

    <div id="divMes">
        <uc2:wucListaDiaIniFin ID="cboDia" runat="server" />
    </div>

    <div id="divFilial">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
    </div>

    <div id="divSecao">
        <uc1:wucListaSecao runat="server" ID="cboSecao" />
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
                                  
                    <dxchartsui:WebChartControl ID="WebChartControl1" runat="server" DataSourceID="dsDados1" Height="550px" Width="1000px">
                        <diagramserializable>
                            <cc1:XYDiagram>
                                <axisx visibleinpanesserializable="2">
                                    <label angle="270">
                                    </label>
                                    <range sidemarginsenabled="True" />
                                    <gridlines minorvisible="True" visible="True">
                                    </gridlines>
                                </axisx>
                                <axisy title-antialiasing="False" title-font="Tahoma, 12pt, style=Bold" title-text="Venda Total" title-visible="True" visibleinpanesserializable="-1">
                                    <tickmarks minorvisible="False" visible="False" />
                                    <label visible="False">
                                    </label>
                                    <range sidemarginsenabled="True" />
                                    <gridlines visible="False">
                                    </gridlines>
                                </axisy>
                                <secondaryaxesy>
                                    <cc1:SecondaryAxisY Alignment="Near" AxisID="0" Name="Venda por Secao" Title-Antialiasing="False" Title-Font="Tahoma, 12pt, style=Bold" Title-Text="Venda por Seção" Title-Visible="True" VisibleInPanesSerializable="0">
                                        <tickmarks minorvisible="False" visible="False" />
                                        <label EnableAntialiasing="True" visible="False">
                                        </label>
                                        <range sidemarginsenabled="True" />
                                    </cc1:SecondaryAxisY>
                                    <cc1:SecondaryAxisY Alignment="Near" AxisID="1" Name="Clientes" Title-Antialiasing="False" Title-Font="Tahoma, 11pt, style=Bold" Title-Text="Clientes" Title-Visible="True" VisibleInPanesSerializable="1">
                                        <tickmarks minorvisible="False" visible="False" />
                                        <label visible="False">
                                        </label>
                                        <range sidemarginsenabled="True" />
                                    </cc1:SecondaryAxisY>
                                    <cc1:SecondaryAxisY Alignment="Near" AxisID="2" Name="Participacao" Title-Antialiasing="False" Title-Font="Tahoma, 11pt, style=Bold" Title-Text="Part." Title-Visible="True" VisibleInPanesSerializable="2">
                                        <tickmarks minorvisible="False" Visible="False" />
                                        <label visible="False">
                                        </label>
                                        <range sidemarginsenabled="True" />
                                    </cc1:SecondaryAxisY>
                                </secondaryaxesy>
                                <defaultpane weight="0.5">
                                </defaultpane>
                                <panes>
                                    <cc1:XYDiagramPane Name="Venda por Secao" PaneID="0" Weight="0.5">
                                    </cc1:XYDiagramPane>
                                    <cc1:XYDiagramPane Name="Clientes" PaneID="1" Weight="0.15">
                                    </cc1:XYDiagramPane>
                                    <cc1:XYDiagramPane Name="Participacao" PaneID="2" Weight="0.5">
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
                            <cc1:Series ArgumentDataMember="myDesc" Name="Venda Total" ValueDataMembersSerializable="vlrVendaTotal">
                                <viewserializable>
                                    <cc1:LineSeriesView MarkerVisibility="False">
                                        <linemarkeroptions BorderVisible="False">
                                        </linemarkeroptions>
                                    </cc1:LineSeriesView>
                                </viewserializable>
                                <labelserializable>
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
                                </labelserializable>
                                <legendpointoptionsserializable>
                                    <cc1:PointOptions>
                                    </cc1:PointOptions>
                                </legendpointoptionsserializable>
                            </cc1:Series>
                            <cc1:Series ArgumentDataMember="myDesc" Name="Venda por Seção" ValueDataMembersSerializable="vlrVendaSecao">
                                <viewserializable>
                                    <cc1:LineSeriesView AxisYName="Venda por Secao" MarkerVisibility="False" PaneName="Venda por Secao">
                                        <linemarkeroptions BorderVisible="False">
                                        </linemarkeroptions>
                                    </cc1:LineSeriesView>
                                </viewserializable>
                                <labelserializable>
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
                                </labelserializable>
                                <legendpointoptionsserializable>
                                    <cc1:PointOptions>
                                    </cc1:PointOptions>
                                </legendpointoptionsserializable>
                            </cc1:Series>
                            <cc1:Series ArgumentDataMember="myDesc" Name="numClientes" ValueDataMembersSerializable="numCliente">
                                <viewserializable>
                                    <cc1:StepAreaSeriesView AxisYName="Clientes" MarkerVisibility="False" PaneName="Clientes">
                                        <markeroptions BorderVisible="False">
                                        </markeroptions>
                                    </cc1:StepAreaSeriesView>
                                </viewserializable>
                                <labelserializable>
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
                                </labelserializable>
                                <legendpointoptionsserializable>
                                    <cc1:PointOptions>
                                    </cc1:PointOptions>
                                </legendpointoptionsserializable>
                            </cc1:Series>
                            <cc1:Series ArgumentDataMember="myDesc" Name="% Part. Seção" ValueDataMembersSerializable="percPartSecao">
                                <viewserializable>
                                    
                                <cc1:AreaSeriesView AxisYName="Participacao" MarkerVisibility="False" PaneName="Participacao"><markeroptions BorderVisible="False"></markeroptions></cc1:AreaSeriesView></viewserializable>
                                <labelserializable>
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
                                </labelserializable>
                                <legendpointoptionsserializable>
                                    <cc1:PointOptions>
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

		<asp:SqlDataSource ID="dsDados1" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspVendaHoraPorSecao" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="diaInicial" SessionField="sDIAINICIAL" Type="DateTime" />
                            <asp:SessionParameter Name="diaFinal" SessionField="sDIAFINAL" Type="DateTime" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                            <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>



</asp:Content>



