<%@ Page Title="Venda por Hora e Seção" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="VendaPorHoraSecaDashBoardThree.aspx.vb" Inherits="MemberPages_Gerencial_VendaPorHoraSecaDashBoardThree" %>

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
<%@ Register Src="~/Controles/wucListaDia.ascx" TagPrefix="uc1" TagName="wucListaDia" %>




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

        .auto-style1 {
            width: 14px;
        }

        .auto-style2 {
            width: 14px;
            height: 7px;
        }
        .auto-style3 {
            height: 7px;
        }
        .auto-style6 {
            width: 18px;
        }
        .auto-style7 {
            height: 7px;
            width: 18px;
        }

        .auto-style8 {
            height: 4px;
        }
        .auto-style9 {
            width: 14px;
            height: 4px;
        }
        .auto-style10 {
            width: 18px;
            height: 4px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divMes">
        <uc1:wucListaDia runat="server" ID="cboDia" />
    </div>

    <div id="divSecao">
        <uc1:wucListaSecao runat="server" ID="cboSecao" />
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis" Height="15px">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>    
                    
                    <table cellpadding="0" cellspacing="0" class="dxflInternalEditorTable_Office2010Silver">
                        <tr>
                            <td class="auto-style8">
                                </td>
                            <td class="auto-style9"></td>
                            <td class="auto-style8">
                                </td>
                            <td class="auto-style8"></td>
                            <td class="auto-style10"></td>
                            <td class="auto-style8"></td>
                            <td style="background-color: #3366FF; color: #FFFFFF; font-weight: inherit; text-align: center; font-size: 16px;" class="auto-style8"></td>
                            <td style="background-color: #3366FF; color: #FFFFFF; font-weight: inherit; text-align: center; font-size: 16px;" class="auto-style8"></td>
                            <td style="background-color: #3366FF; color: #FFFFFF; font-weight: inherit; text-align: center; font-size: 16px;" class="auto-style8"></td>
                        </tr>
                        <tr>
                            <td >
                                <uc1:wucListaLojasComCorporacao ID="cboFilial" runat="server" />
                            </td>
                            <td class="auto-style1">&nbsp;</td>
                            <td>
                                <uc1:wucListaLojasComCorporacao ID="cboFilial1" runat="server" />
                            </td>
                            <td>&nbsp;</td>
                            <td class="auto-style6">&nbsp;</td>
                            <td>
                                <uc1:wucListaLojasComCorporacao ID="cboFilial2" runat="server" />
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="background-color: #008000; color: #FFFFFF; font-weight: inherit; text-align: center; font-size: 16px;">
                                <asp:Label ID="lblGraph1" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td class="auto-style1">&nbsp;</td>
                            <td style="background-color: #008000; color: #FFFFFF; font-weight: inherit; text-align: center; font-size: 16px;">
                                <asp:Label ID="lblGraph1_Filial1" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td class="auto-style6">&nbsp;</td>
                            <td style="background-color: #008000; color: #FFFFFF; font-weight: inherit; text-align: center; font-size: 16px;">
                                <asp:Label ID="lblGraph1_Filial2" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <dxchartsui:WebChartControl ID="graf1" runat="server" DataSourceID="dsDados1" Height="225px" Width="500px">
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="0">
                                                <label angle="270">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines minorvisible="True" visible="True">
                                                </gridlines>
                                            </axisx>
                                            <axisy title-antialiasing="False" title-font="Tahoma, 10pt" title-text="Venda Total" title-visible="True" visibleinpanesserializable="-1">
                                                <tickmarks minorvisible="False" visible="False" />
                                                <label visible="False">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                            <secondaryaxesy>
                                                <cc1:SecondaryAxisY Alignment="Near" AxisID="0" Name="Venda por Secao" Title-Antialiasing="False" Title-Font="Tahoma, 10pt" Title-Text="Venda Seção" Title-Visible="True" VisibleInPanesSerializable="0">
                                                    <tickmarks minorvisible="False" visible="False" />
                                                    <label EnableAntialiasing="True" visible="False">
                                                    </label>
                                                    <range sidemarginsenabled="True" />
                                                </cc1:SecondaryAxisY>
                                            </secondaryaxesy>
                                            <defaultpane weight="0.3">
                                            </defaultpane>
                                            <panes>
                                                <cc1:XYDiagramPane Name="Venda por Secao" PaneID="0" Weight="0.5">
                                                </cc1:XYDiagramPane>
                                            </panes>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
                                    <fillstyle>
                                        <optionsserializable>
                                            <cc1:SolidFillOptions />
                                        </optionsserializable>
                                    </fillstyle>
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
                                        <cc1:Series ArgumentDataMember="myDesc" Name="Venda por Seção" ValueDataMembersSerializable="vlrVendaSecao" LabelsVisibility="True">
                                            <viewserializable>
                                                <cc1:LineSeriesView AxisYName="Venda por Secao" MarkerVisibility="False" PaneName="Venda por Secao">
                                                    <linemarkeroptions BorderVisible="False">
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="90" Font="Tahoma, 7pt">
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
                                    <seriestemplate>
                                        <viewserializable>
                                            <cc1:LineSeriesView MarkerVisibility="True">
                                                <linemarkeroptions BorderVisible="True">
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
                                    </seriestemplate>
                                    <crosshairoptions>
                                        <commonlabelpositionserializable>
                                            <cc1:CrosshairMousePosition />
                                        </commonlabelpositionserializable>
                                    </crosshairoptions>
                                    <tooltipoptions>
                                        <tooltippositionserializable>
                                            <cc1:ToolTipMousePosition />
                                        </tooltippositionserializable>
                                    </tooltipoptions>
                                </dxchartsui:WebChartControl>
                            </td>
                            <td class="auto-style1">&nbsp;</td>
                            <td>
                                <dxchartsui:WebChartControl ID="graf7" runat="server" DataSourceID="dsDados1_Filial1" Height="225px" Width="500px">
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="0">
                                                <label angle="270">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines minorvisible="True" visible="True">
                                                </gridlines>
                                            </axisx>
                                            <axisy title-antialiasing="False" title-font="Tahoma, 10pt" title-text="Venda Total" title-visible="True" visibleinpanesserializable="-1">
                                                <tickmarks minorvisible="False" visible="False" />
                                                <label visible="False">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                            <secondaryaxesy>
                                                <cc1:SecondaryAxisY Alignment="Near" AxisID="0" Name="Venda por Secao" Title-Antialiasing="False" Title-Font="Tahoma, 10pt" Title-Text="Venda Seção" Title-Visible="True" VisibleInPanesSerializable="0">
                                                    <tickmarks minorvisible="False" visible="False" />
                                                    <label EnableAntialiasing="True" visible="False">
                                                    </label>
                                                    <range sidemarginsenabled="True" />
                                                </cc1:SecondaryAxisY>
                                            </secondaryaxesy>
                                            <defaultpane weight="0.3">
                                            </defaultpane>
                                            <panes>
                                                <cc1:XYDiagramPane Name="Venda por Secao" PaneID="0" Weight="0.5">
                                                </cc1:XYDiagramPane>
                                            </panes>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
                                    <fillstyle>
                                        <optionsserializable>
                                            <cc1:SolidFillOptions />
                                        </optionsserializable>
                                    </fillstyle>
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
                                        <cc1:Series ArgumentDataMember="myDesc" LabelsVisibility="True" Name="Venda por Seção" ValueDataMembersSerializable="vlrVendaSecao">
                                            <viewserializable>
                                                <cc1:LineSeriesView AxisYName="Venda por Secao" MarkerVisibility="False" PaneName="Venda por Secao">
                                                    <linemarkeroptions BorderVisible="False">
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel Angle="90" Font="Tahoma, 7pt" LineVisible="True">
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
                                    <seriestemplate>
                                        <viewserializable>
                                            <cc1:LineSeriesView MarkerVisibility="True">
                                                <linemarkeroptions BorderVisible="True">
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
                                    </seriestemplate>
                                    <crosshairoptions>
                                        <commonlabelpositionserializable>
                                            <cc1:CrosshairMousePosition />
                                        </commonlabelpositionserializable>
                                    </crosshairoptions>
                                    <tooltipoptions>
                                        <tooltippositionserializable>
                                            <cc1:ToolTipMousePosition />
                                        </tooltippositionserializable>
                                    </tooltipoptions>
                                </dxchartsui:WebChartControl>
                            </td>
                            <td>&nbsp;</td>
                            <td class="auto-style6">&nbsp;</td>
                            <td>
                                <dxchartsui:WebChartControl ID="graf13" runat="server" DataSourceID="dsDados1_Filial2" Height="225px" Width="500px">
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="0">
                                                <label angle="270">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines minorvisible="True" visible="True">
                                                </gridlines>
                                            </axisx>
                                            <axisy title-antialiasing="False" title-font="Tahoma, 10pt" title-text="Venda Total" title-visible="True" visibleinpanesserializable="-1">
                                                <tickmarks minorvisible="False" visible="False" />
                                                <label visible="False">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                            <secondaryaxesy>
                                                <cc1:SecondaryAxisY Alignment="Near" AxisID="0" Name="Venda por Secao" Title-Antialiasing="False" Title-Font="Tahoma, 10pt" Title-Text="Venda Seção" Title-Visible="True" VisibleInPanesSerializable="0">
                                                    <tickmarks minorvisible="False" visible="False" />
                                                    <label EnableAntialiasing="True" visible="False">
                                                    </label>
                                                    <range sidemarginsenabled="True" />
                                                </cc1:SecondaryAxisY>
                                            </secondaryaxesy>
                                            <defaultpane weight="0.3">
                                            </defaultpane>
                                            <panes>
                                                <cc1:XYDiagramPane Name="Venda por Secao" PaneID="0" Weight="0.5">
                                                </cc1:XYDiagramPane>
                                            </panes>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
                                    <fillstyle>
                                        <optionsserializable>
                                            <cc1:SolidFillOptions />
                                        </optionsserializable>
                                    </fillstyle>
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
                                        <cc1:Series ArgumentDataMember="myDesc" LabelsVisibility="True" Name="Venda por Seção" ValueDataMembersSerializable="vlrVendaSecao">
                                            <viewserializable>
                                                <cc1:LineSeriesView AxisYName="Venda por Secao" MarkerVisibility="False" PaneName="Venda por Secao">
                                                    <linemarkeroptions BorderVisible="False">
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel Angle="90" Font="Tahoma, 7pt" LineVisible="True">
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
                                    <seriestemplate>
                                        <viewserializable>
                                            <cc1:LineSeriesView MarkerVisibility="True">
                                                <linemarkeroptions BorderVisible="True">
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
                                    </seriestemplate>
                                    <crosshairoptions>
                                        <commonlabelpositionserializable>
                                            <cc1:CrosshairMousePosition />
                                        </commonlabelpositionserializable>
                                    </crosshairoptions>
                                    <tooltipoptions>
                                        <tooltippositionserializable>
                                            <cc1:ToolTipMousePosition />
                                        </tooltippositionserializable>
                                    </tooltipoptions>
                                </dxchartsui:WebChartControl>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style3"></td>
                            <td class="auto-style2"></td>
                            <td class="auto-style3"></td>
                            <td class="auto-style3">&nbsp;</td>
                            <td class="auto-style7">&nbsp;</td>
                            <td class="auto-style3">&nbsp;</td>
                            <td class="auto-style3">&nbsp;</td>
                            <td class="auto-style3">&nbsp;</td>
                            <td class="auto-style3">&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="background-color: #3366FF; color: #FFFFFF; font-weight: inherit; text-align: center; font-size: 16px;">
                                <asp:Label ID="lblGraph2" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td class="auto-style1">&nbsp;</td>
                            <td style="background-color: #3366FF; color: #FFFFFF; font-weight: inherit; text-align: center; font-size: 16px;">
                                <asp:Label ID="lblGraph2_Filial1" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td class="auto-style6">&nbsp;</td>
                            <td style="background-color: #3366FF; color: #FFFFFF; font-weight: inherit; text-align: center; font-size: 16px;">
                                <asp:Label ID="lblGraph2_Filial2" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <dxchartsui:WebChartControl ID="graf2" runat="server" DataSourceID="dsDados2" Height="225px" Width="500px">
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="0">
                                                <label angle="270">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines minorvisible="True" visible="True">
                                                </gridlines>
                                            </axisx>
                                            <axisy title-antialiasing="False" title-font="Tahoma, 10pt" title-text="Venda Total" title-visible="True" visibleinpanesserializable="-1">
                                                <tickmarks minorvisible="False" visible="False" />
                                                <label visible="False">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                            <secondaryaxesy>
                                                <cc1:SecondaryAxisY Alignment="Near" AxisID="0" Name="Venda por Secao" Title-Antialiasing="False" Title-Font="Tahoma, 10pt" Title-Text="Venda Seção" Title-Visible="True" VisibleInPanesSerializable="0">
                                                    <tickmarks minorvisible="False" visible="False" />
                                                    <label EnableAntialiasing="True" visible="False">
                                                    </label>
                                                    <range sidemarginsenabled="True" />
                                                </cc1:SecondaryAxisY>
                                            </secondaryaxesy>
                                            <defaultpane weight="0.3">
                                            </defaultpane>
                                            <panes>
                                                <cc1:XYDiagramPane Name="Venda por Secao" PaneID="0" Weight="0.5">
                                                </cc1:XYDiagramPane>
                                            </panes>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
                                    <fillstyle>
                                        <optionsserializable>
                                            <cc1:SolidFillOptions />
                                        </optionsserializable>
                                    </fillstyle>
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
                                        <cc1:Series ArgumentDataMember="myDesc" LabelsVisibility="True" Name="Venda por Seção" ValueDataMembersSerializable="vlrVendaSecao">
                                            <viewserializable>
                                                <cc1:LineSeriesView AxisYName="Venda por Secao" MarkerVisibility="False" PaneName="Venda por Secao">
                                                    <linemarkeroptions BorderVisible="False">
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel Angle="90" Font="Tahoma, 7pt" LineVisible="True">
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
                                    <seriestemplate>
                                        <viewserializable>
                                            <cc1:LineSeriesView MarkerVisibility="True">
                                                <linemarkeroptions BorderVisible="True">
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
                                    </seriestemplate>
                                    <crosshairoptions>
                                        <commonlabelpositionserializable>
                                            <cc1:CrosshairMousePosition />
                                        </commonlabelpositionserializable>
                                    </crosshairoptions>
                                    <tooltipoptions>
                                        <tooltippositionserializable>
                                            <cc1:ToolTipMousePosition />
                                        </tooltippositionserializable>
                                    </tooltipoptions>
                                </dxchartsui:WebChartControl>
                            </td>
                            <td class="auto-style1">&nbsp;</td>
                            <td>
                                <dxchartsui:WebChartControl ID="graf8" runat="server" DataSourceID="dsDados2_Filial1" Height="225px" Width="500px">
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="0">
                                                <label angle="270">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines minorvisible="True" visible="True">
                                                </gridlines>
                                            </axisx>
                                            <axisy title-antialiasing="False" title-font="Tahoma, 10pt" title-text="Venda Total" title-visible="True" visibleinpanesserializable="-1">
                                                <tickmarks minorvisible="False" visible="False" />
                                                <label visible="False">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                            <secondaryaxesy>
                                                <cc1:SecondaryAxisY Alignment="Near" AxisID="0" Name="Venda por Secao" Title-Antialiasing="False" Title-Font="Tahoma, 10pt" Title-Text="Venda Seção" Title-Visible="True" VisibleInPanesSerializable="0">
                                                    <tickmarks minorvisible="False" visible="False" />
                                                    <label EnableAntialiasing="True" visible="False">
                                                    </label>
                                                    <range sidemarginsenabled="True" />
                                                </cc1:SecondaryAxisY>
                                            </secondaryaxesy>
                                            <defaultpane weight="0.3">
                                            </defaultpane>
                                            <panes>
                                                <cc1:XYDiagramPane Name="Venda por Secao" PaneID="0" Weight="0.5">
                                                </cc1:XYDiagramPane>
                                            </panes>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
                                    <fillstyle>
                                        <optionsserializable>
                                            <cc1:SolidFillOptions />
                                        </optionsserializable>
                                    </fillstyle>
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
                                        <cc1:Series ArgumentDataMember="myDesc" LabelsVisibility="True" Name="Venda por Seção" ValueDataMembersSerializable="vlrVendaSecao">
                                            <viewserializable>
                                                <cc1:LineSeriesView AxisYName="Venda por Secao" MarkerVisibility="False" PaneName="Venda por Secao">
                                                    <linemarkeroptions BorderVisible="False">
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel Angle="90" Font="Tahoma, 7pt" LineVisible="True">
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
                                    <seriestemplate>
                                        <viewserializable>
                                            <cc1:LineSeriesView MarkerVisibility="True">
                                                <linemarkeroptions BorderVisible="True">
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
                                    </seriestemplate>
                                    <crosshairoptions>
                                        <commonlabelpositionserializable>
                                            <cc1:CrosshairMousePosition />
                                        </commonlabelpositionserializable>
                                    </crosshairoptions>
                                    <tooltipoptions>
                                        <tooltippositionserializable>
                                            <cc1:ToolTipMousePosition />
                                        </tooltippositionserializable>
                                    </tooltipoptions>
                                </dxchartsui:WebChartControl>
                            </td>
                            <td>&nbsp;</td>
                            <td class="auto-style6">&nbsp;</td>
                            <td>
                                <dxchartsui:WebChartControl ID="graf14" runat="server" DataSourceID="dsDados2_Filial2" Height="225px" Width="500px">
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="0">
                                                <label angle="270">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines minorvisible="True" visible="True">
                                                </gridlines>
                                            </axisx>
                                            <axisy title-antialiasing="False" title-font="Tahoma, 10pt" title-text="Venda Total" title-visible="True" visibleinpanesserializable="-1">
                                                <tickmarks minorvisible="False" visible="False" />
                                                <label visible="False">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                            <secondaryaxesy>
                                                <cc1:SecondaryAxisY Alignment="Near" AxisID="0" Name="Venda por Secao" Title-Antialiasing="False" Title-Font="Tahoma, 10pt" Title-Text="Venda Seção" Title-Visible="True" VisibleInPanesSerializable="0">
                                                    <tickmarks minorvisible="False" visible="False" />
                                                    <label EnableAntialiasing="True" visible="False">
                                                    </label>
                                                    <range sidemarginsenabled="True" />
                                                </cc1:SecondaryAxisY>
                                            </secondaryaxesy>
                                            <defaultpane weight="0.3">
                                            </defaultpane>
                                            <panes>
                                                <cc1:XYDiagramPane Name="Venda por Secao" PaneID="0" Weight="0.5">
                                                </cc1:XYDiagramPane>
                                            </panes>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
                                    <fillstyle>
                                        <optionsserializable>
                                            <cc1:SolidFillOptions />
                                        </optionsserializable>
                                    </fillstyle>
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
                                        <cc1:Series ArgumentDataMember="myDesc" LabelsVisibility="True" Name="Venda por Seção" ValueDataMembersSerializable="vlrVendaSecao">
                                            <viewserializable>
                                                <cc1:LineSeriesView AxisYName="Venda por Secao" MarkerVisibility="False" PaneName="Venda por Secao">
                                                    <linemarkeroptions BorderVisible="False">
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel Angle="90" Font="Tahoma, 7pt" LineVisible="True">
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
                                    <seriestemplate>
                                        <viewserializable>
                                            <cc1:LineSeriesView MarkerVisibility="True">
                                                <linemarkeroptions BorderVisible="True">
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
                                    </seriestemplate>
                                    <crosshairoptions>
                                        <commonlabelpositionserializable>
                                            <cc1:CrosshairMousePosition />
                                        </commonlabelpositionserializable>
                                    </crosshairoptions>
                                    <tooltipoptions>
                                        <tooltippositionserializable>
                                            <cc1:ToolTipMousePosition />
                                        </tooltippositionserializable>
                                    </tooltipoptions>
                                </dxchartsui:WebChartControl>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="auto-style1">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="auto-style6">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="background-color: #3366FF; color: #FFFFFF; font-weight: inherit; text-align: center; font-size: 16px;">
                                <asp:Label ID="lblGraph3" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td class="auto-style1">&nbsp;</td>
                            <td style="background-color: #3366FF; color: #FFFFFF; font-weight: inherit; text-align: center; font-size: 16px;">
                                <asp:Label ID="lblGraph3_Filial1" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td class="auto-style6">&nbsp;</td>
                            <td style="background-color: #3366FF; color: #FFFFFF; font-weight: inherit; text-align: center; font-size: 16px;">
                                <asp:Label ID="lblGraph3_Filial2" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <dxchartsui:WebChartControl ID="graf3" runat="server" DataSourceID="dsDados3" Height="225px" Width="500px">
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="0">
                                                <label angle="270">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines minorvisible="True" visible="True">
                                                </gridlines>
                                            </axisx>
                                            <axisy title-antialiasing="False" title-font="Tahoma, 10pt" title-text="Venda Total" title-visible="True" visibleinpanesserializable="-1">
                                                <tickmarks minorvisible="False" visible="False" />
                                                <label visible="False">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                            <secondaryaxesy>
                                                <cc1:SecondaryAxisY Alignment="Near" AxisID="0" Name="Venda por Secao" Title-Antialiasing="False" Title-Font="Tahoma, 10pt" Title-Text="Venda Seção" Title-Visible="True" VisibleInPanesSerializable="0">
                                                    <tickmarks minorvisible="False" visible="False" />
                                                    <label EnableAntialiasing="True" visible="False">
                                                    </label>
                                                    <range sidemarginsenabled="True" />
                                                </cc1:SecondaryAxisY>
                                            </secondaryaxesy>
                                            <defaultpane weight="0.3">
                                            </defaultpane>
                                            <panes>
                                                <cc1:XYDiagramPane Name="Venda por Secao" PaneID="0" Weight="0.5">
                                                </cc1:XYDiagramPane>
                                            </panes>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
                                    <fillstyle>
                                        <optionsserializable>
                                            <cc1:SolidFillOptions />
                                        </optionsserializable>
                                    </fillstyle>
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
                                        <cc1:Series ArgumentDataMember="myDesc" LabelsVisibility="True" Name="Venda por Seção" ValueDataMembersSerializable="vlrVendaSecao">
                                            <viewserializable>
                                                <cc1:LineSeriesView AxisYName="Venda por Secao" MarkerVisibility="False" PaneName="Venda por Secao">
                                                    <linemarkeroptions BorderVisible="False">
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel Angle="90" Font="Tahoma, 7pt" LineVisible="True">
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
                                    <seriestemplate>
                                        <viewserializable>
                                            <cc1:LineSeriesView MarkerVisibility="True">
                                                <linemarkeroptions BorderVisible="True">
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
                                    </seriestemplate>
                                    <crosshairoptions>
                                        <commonlabelpositionserializable>
                                            <cc1:CrosshairMousePosition />
                                        </commonlabelpositionserializable>
                                    </crosshairoptions>
                                    <tooltipoptions>
                                        <tooltippositionserializable>
                                            <cc1:ToolTipMousePosition />
                                        </tooltippositionserializable>
                                    </tooltipoptions>
                                </dxchartsui:WebChartControl>
                            </td>
                            <td class="auto-style1">&nbsp;</td>
                            <td>
                                <dxchartsui:WebChartControl ID="graf9" runat="server" DataSourceID="dsDados3_Filial1" Height="225px" Width="500px">
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="0">
                                                <label angle="270">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines minorvisible="True" visible="True">
                                                </gridlines>
                                            </axisx>
                                            <axisy title-antialiasing="False" title-font="Tahoma, 10pt" title-text="Venda Total" title-visible="True" visibleinpanesserializable="-1">
                                                <tickmarks minorvisible="False" visible="False" />
                                                <label visible="False">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                            <secondaryaxesy>
                                                <cc1:SecondaryAxisY Alignment="Near" AxisID="0" Name="Venda por Secao" Title-Antialiasing="False" Title-Font="Tahoma, 10pt" Title-Text="Venda Seção" Title-Visible="True" VisibleInPanesSerializable="0">
                                                    <tickmarks minorvisible="False" visible="False" />
                                                    <label EnableAntialiasing="True" visible="False">
                                                    </label>
                                                    <range sidemarginsenabled="True" />
                                                </cc1:SecondaryAxisY>
                                            </secondaryaxesy>
                                            <defaultpane weight="0.3">
                                            </defaultpane>
                                            <panes>
                                                <cc1:XYDiagramPane Name="Venda por Secao" PaneID="0" Weight="0.5">
                                                </cc1:XYDiagramPane>
                                            </panes>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
                                    <fillstyle>
                                        <optionsserializable>
                                            <cc1:SolidFillOptions />
                                        </optionsserializable>
                                    </fillstyle>
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
                                        <cc1:Series ArgumentDataMember="myDesc" LabelsVisibility="True" Name="Venda por Seção" ValueDataMembersSerializable="vlrVendaSecao">
                                            <viewserializable>
                                                <cc1:LineSeriesView AxisYName="Venda por Secao" MarkerVisibility="False" PaneName="Venda por Secao">
                                                    <linemarkeroptions BorderVisible="False">
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel Angle="90" Font="Tahoma, 7pt" LineVisible="True">
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
                                    <seriestemplate>
                                        <viewserializable>
                                            <cc1:LineSeriesView MarkerVisibility="True">
                                                <linemarkeroptions BorderVisible="True">
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
                                    </seriestemplate>
                                    <crosshairoptions>
                                        <commonlabelpositionserializable>
                                            <cc1:CrosshairMousePosition />
                                        </commonlabelpositionserializable>
                                    </crosshairoptions>
                                    <tooltipoptions>
                                        <tooltippositionserializable>
                                            <cc1:ToolTipMousePosition />
                                        </tooltippositionserializable>
                                    </tooltipoptions>
                                </dxchartsui:WebChartControl>
                            </td>
                            <td>&nbsp;</td>
                            <td class="auto-style6">&nbsp;</td>
                            <td>
                                <dxchartsui:WebChartControl ID="graf15" runat="server" DataSourceID="dsDados3_Filial2" Height="225px" Width="500px">
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="0">
                                                <label angle="270">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines minorvisible="True" visible="True">
                                                </gridlines>
                                            </axisx>
                                            <axisy title-antialiasing="False" title-font="Tahoma, 10pt" title-text="Venda Total" title-visible="True" visibleinpanesserializable="-1">
                                                <tickmarks minorvisible="False" visible="False" />
                                                <label visible="False">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                            <secondaryaxesy>
                                                <cc1:SecondaryAxisY Alignment="Near" AxisID="0" Name="Venda por Secao" Title-Antialiasing="False" Title-Font="Tahoma, 10pt" Title-Text="Venda Seção" Title-Visible="True" VisibleInPanesSerializable="0">
                                                    <tickmarks minorvisible="False" visible="False" />
                                                    <label EnableAntialiasing="True" visible="False">
                                                    </label>
                                                    <range sidemarginsenabled="True" />
                                                </cc1:SecondaryAxisY>
                                            </secondaryaxesy>
                                            <defaultpane weight="0.3">
                                            </defaultpane>
                                            <panes>
                                                <cc1:XYDiagramPane Name="Venda por Secao" PaneID="0" Weight="0.5">
                                                </cc1:XYDiagramPane>
                                            </panes>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
                                    <fillstyle>
                                        <optionsserializable>
                                            <cc1:SolidFillOptions />
                                        </optionsserializable>
                                    </fillstyle>
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
                                        <cc1:Series ArgumentDataMember="myDesc" LabelsVisibility="True" Name="Venda por Seção" ValueDataMembersSerializable="vlrVendaSecao">
                                            <viewserializable>
                                                <cc1:LineSeriesView AxisYName="Venda por Secao" MarkerVisibility="False" PaneName="Venda por Secao">
                                                    <linemarkeroptions BorderVisible="False">
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel Angle="90" Font="Tahoma, 7pt" LineVisible="True">
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
                                    <seriestemplate>
                                        <viewserializable>
                                            <cc1:LineSeriesView MarkerVisibility="True">
                                                <linemarkeroptions BorderVisible="True">
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
                                    </seriestemplate>
                                    <crosshairoptions>
                                        <commonlabelpositionserializable>
                                            <cc1:CrosshairMousePosition />
                                        </commonlabelpositionserializable>
                                    </crosshairoptions>
                                    <tooltipoptions>
                                        <tooltippositionserializable>
                                            <cc1:ToolTipMousePosition />
                                        </tooltippositionserializable>
                                    </tooltipoptions>
                                </dxchartsui:WebChartControl>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="auto-style1">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="auto-style6">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="background-color: #3366FF; color: #FFFFFF; font-weight: inherit; text-align: center; font-size: 16px;">
                                <asp:Label ID="lblGraph4" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td class="auto-style1">&nbsp;</td>
                            <td style="background-color: #3366FF; color: #FFFFFF; font-weight: inherit; text-align: center; font-size: 16px;">
                                <asp:Label ID="lblGraph4_Filial1" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td class="auto-style6">&nbsp;</td>
                            <td style="background-color: #3366FF; color: #FFFFFF; font-weight: inherit; text-align: center; font-size: 16px;">
                                <asp:Label ID="lblGraph4_Filial2" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <dxchartsui:WebChartControl ID="graf4" runat="server" DataSourceID="dsDados4" Height="225px" Width="500px">
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="0">
                                                <label angle="270">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines minorvisible="True" visible="True">
                                                </gridlines>
                                            </axisx>
                                            <axisy title-antialiasing="False" title-font="Tahoma, 10pt" title-text="Venda Total" title-visible="True" visibleinpanesserializable="-1">
                                                <tickmarks minorvisible="False" visible="False" />
                                                <label visible="False">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                            <secondaryaxesy>
                                                <cc1:SecondaryAxisY Alignment="Near" AxisID="0" Name="Venda por Secao" Title-Antialiasing="False" Title-Font="Tahoma, 10pt" Title-Text="Venda Seção" Title-Visible="True" VisibleInPanesSerializable="0">
                                                    <tickmarks minorvisible="False" visible="False" />
                                                    <label EnableAntialiasing="True" visible="False">
                                                    </label>
                                                    <range sidemarginsenabled="True" />
                                                </cc1:SecondaryAxisY>
                                            </secondaryaxesy>
                                            <defaultpane weight="0.3">
                                            </defaultpane>
                                            <panes>
                                                <cc1:XYDiagramPane Name="Venda por Secao" PaneID="0" Weight="0.5">
                                                </cc1:XYDiagramPane>
                                            </panes>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
                                    <fillstyle>
                                        <optionsserializable>
                                            <cc1:SolidFillOptions />
                                        </optionsserializable>
                                    </fillstyle>
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
                                        <cc1:Series ArgumentDataMember="myDesc" LabelsVisibility="True" Name="Venda por Seção" ValueDataMembersSerializable="vlrVendaSecao">
                                            <viewserializable>
                                                <cc1:LineSeriesView AxisYName="Venda por Secao" MarkerVisibility="False" PaneName="Venda por Secao">
                                                    <linemarkeroptions BorderVisible="False">
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel Angle="90" Font="Tahoma, 7pt" LineVisible="True">
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
                                    <seriestemplate>
                                        <viewserializable>
                                            <cc1:LineSeriesView MarkerVisibility="True">
                                                <linemarkeroptions BorderVisible="True">
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
                                    </seriestemplate>
                                    <crosshairoptions>
                                        <commonlabelpositionserializable>
                                            <cc1:CrosshairMousePosition />
                                        </commonlabelpositionserializable>
                                    </crosshairoptions>
                                    <tooltipoptions>
                                        <tooltippositionserializable>
                                            <cc1:ToolTipMousePosition />
                                        </tooltippositionserializable>
                                    </tooltipoptions>
                                </dxchartsui:WebChartControl>
                            </td>
                            <td class="auto-style1">&nbsp;</td>
                            <td>
                                <dxchartsui:WebChartControl ID="graf10" runat="server" DataSourceID="dsDados4_Filial1" Height="225px" Width="500px">
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="0">
                                                <label angle="270">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines minorvisible="True" visible="True">
                                                </gridlines>
                                            </axisx>
                                            <axisy title-antialiasing="False" title-font="Tahoma, 10pt" title-text="Venda Total" title-visible="True" visibleinpanesserializable="-1">
                                                <tickmarks minorvisible="False" visible="False" />
                                                <label visible="False">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                            <secondaryaxesy>
                                                <cc1:SecondaryAxisY Alignment="Near" AxisID="0" Name="Venda por Secao" Title-Antialiasing="False" Title-Font="Tahoma, 10pt" Title-Text="Venda Seção" Title-Visible="True" VisibleInPanesSerializable="0">
                                                    <tickmarks minorvisible="False" visible="False" />
                                                    <label EnableAntialiasing="True" visible="False">
                                                    </label>
                                                    <range sidemarginsenabled="True" />
                                                </cc1:SecondaryAxisY>
                                            </secondaryaxesy>
                                            <defaultpane weight="0.3">
                                            </defaultpane>
                                            <panes>
                                                <cc1:XYDiagramPane Name="Venda por Secao" PaneID="0" Weight="0.5">
                                                </cc1:XYDiagramPane>
                                            </panes>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
                                    <fillstyle>
                                        <optionsserializable>
                                            <cc1:SolidFillOptions />
                                        </optionsserializable>
                                    </fillstyle>
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
                                        <cc1:Series ArgumentDataMember="myDesc" LabelsVisibility="True" Name="Venda por Seção" ValueDataMembersSerializable="vlrVendaSecao">
                                            <viewserializable>
                                                <cc1:LineSeriesView AxisYName="Venda por Secao" MarkerVisibility="False" PaneName="Venda por Secao">
                                                    <linemarkeroptions BorderVisible="False">
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel Angle="90" Font="Tahoma, 7pt" LineVisible="True">
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
                                    <seriestemplate>
                                        <viewserializable>
                                            <cc1:LineSeriesView MarkerVisibility="True">
                                                <linemarkeroptions BorderVisible="True">
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
                                    </seriestemplate>
                                    <crosshairoptions>
                                        <commonlabelpositionserializable>
                                            <cc1:CrosshairMousePosition />
                                        </commonlabelpositionserializable>
                                    </crosshairoptions>
                                    <tooltipoptions>
                                        <tooltippositionserializable>
                                            <cc1:ToolTipMousePosition />
                                        </tooltippositionserializable>
                                    </tooltipoptions>
                                </dxchartsui:WebChartControl>
                            </td>
                            <td>&nbsp;</td>
                            <td class="auto-style6">&nbsp;</td>
                            <td>
                                <dxchartsui:WebChartControl ID="graf16" runat="server" DataSourceID="dsDados4_Filial2" Height="225px" Width="500px">
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="0">
                                                <label angle="270">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines minorvisible="True" visible="True">
                                                </gridlines>
                                            </axisx>
                                            <axisy title-antialiasing="False" title-font="Tahoma, 10pt" title-text="Venda Total" title-visible="True" visibleinpanesserializable="-1">
                                                <tickmarks minorvisible="False" visible="False" />
                                                <label visible="False">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                            <secondaryaxesy>
                                                <cc1:SecondaryAxisY Alignment="Near" AxisID="0" Name="Venda por Secao" Title-Antialiasing="False" Title-Font="Tahoma, 10pt" Title-Text="Venda Seção" Title-Visible="True" VisibleInPanesSerializable="0">
                                                    <tickmarks minorvisible="False" visible="False" />
                                                    <label EnableAntialiasing="True" visible="False">
                                                    </label>
                                                    <range sidemarginsenabled="True" />
                                                </cc1:SecondaryAxisY>
                                            </secondaryaxesy>
                                            <defaultpane weight="0.3">
                                            </defaultpane>
                                            <panes>
                                                <cc1:XYDiagramPane Name="Venda por Secao" PaneID="0" Weight="0.5">
                                                </cc1:XYDiagramPane>
                                            </panes>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
                                    <fillstyle>
                                        <optionsserializable>
                                            <cc1:SolidFillOptions />
                                        </optionsserializable>
                                    </fillstyle>
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
                                        <cc1:Series ArgumentDataMember="myDesc" LabelsVisibility="True" Name="Venda por Seção" ValueDataMembersSerializable="vlrVendaSecao">
                                            <viewserializable>
                                                <cc1:LineSeriesView AxisYName="Venda por Secao" MarkerVisibility="False" PaneName="Venda por Secao">
                                                    <linemarkeroptions BorderVisible="False">
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel Angle="90" Font="Tahoma, 7pt" LineVisible="True">
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
                                    <seriestemplate>
                                        <viewserializable>
                                            <cc1:LineSeriesView MarkerVisibility="True">
                                                <linemarkeroptions BorderVisible="True">
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
                                    </seriestemplate>
                                    <crosshairoptions>
                                        <commonlabelpositionserializable>
                                            <cc1:CrosshairMousePosition />
                                        </commonlabelpositionserializable>
                                    </crosshairoptions>
                                    <tooltipoptions>
                                        <tooltippositionserializable>
                                            <cc1:ToolTipMousePosition />
                                        </tooltippositionserializable>
                                    </tooltipoptions>
                                </dxchartsui:WebChartControl>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="auto-style1">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="auto-style6">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="background-color: #3366FF; color: #FFFFFF; font-weight: inherit; text-align: center; font-size: 16px;">
                                <asp:Label ID="lblGraph5" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td class="auto-style1">&nbsp;</td>
                            <td style="background-color: #3366FF; color: #FFFFFF; font-weight: inherit; text-align: center; font-size: 16px;">
                                <asp:Label ID="lblGraph5_Filial1" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td class="auto-style6">&nbsp;</td>
                            <td style="background-color: #3366FF; color: #FFFFFF; font-weight: inherit; text-align: center; font-size: 16px;">
                                <asp:Label ID="lblGraph5_Filial2" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <dxchartsui:WebChartControl ID="graf5" runat="server" DataSourceID="dsDados5" Height="225px" Width="500px">
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="0">
                                                <label angle="270">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines minorvisible="True" visible="True">
                                                </gridlines>
                                            </axisx>
                                            <axisy title-antialiasing="False" title-font="Tahoma, 10pt" title-text="Venda Total" title-visible="True" visibleinpanesserializable="-1">
                                                <tickmarks minorvisible="False" visible="False" />
                                                <label visible="False">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                            <secondaryaxesy>
                                                <cc1:SecondaryAxisY Alignment="Near" AxisID="0" Name="Venda por Secao" Title-Antialiasing="False" Title-Font="Tahoma, 10pt" Title-Text="Venda Seção" Title-Visible="True" VisibleInPanesSerializable="0">
                                                    <tickmarks minorvisible="False" visible="False" />
                                                    <label EnableAntialiasing="True" visible="False">
                                                    </label>
                                                    <range sidemarginsenabled="True" />
                                                </cc1:SecondaryAxisY>
                                            </secondaryaxesy>
                                            <defaultpane weight="0.3">
                                            </defaultpane>
                                            <panes>
                                                <cc1:XYDiagramPane Name="Venda por Secao" PaneID="0" Weight="0.5">
                                                </cc1:XYDiagramPane>
                                            </panes>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
                                    <fillstyle>
                                        <optionsserializable>
                                            <cc1:SolidFillOptions />
                                        </optionsserializable>
                                    </fillstyle>
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
                                        <cc1:Series ArgumentDataMember="myDesc" LabelsVisibility="True" Name="Venda por Seção" ValueDataMembersSerializable="vlrVendaSecao">
                                            <viewserializable>
                                                <cc1:LineSeriesView AxisYName="Venda por Secao" MarkerVisibility="False" PaneName="Venda por Secao">
                                                    <linemarkeroptions BorderVisible="False">
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel Angle="90" Font="Tahoma, 7pt" LineVisible="True">
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
                                    <seriestemplate>
                                        <viewserializable>
                                            <cc1:LineSeriesView MarkerVisibility="True">
                                                <linemarkeroptions BorderVisible="True">
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
                                    </seriestemplate>
                                    <crosshairoptions>
                                        <commonlabelpositionserializable>
                                            <cc1:CrosshairMousePosition />
                                        </commonlabelpositionserializable>
                                    </crosshairoptions>
                                    <tooltipoptions>
                                        <tooltippositionserializable>
                                            <cc1:ToolTipMousePosition />
                                        </tooltippositionserializable>
                                    </tooltipoptions>
                                </dxchartsui:WebChartControl>
                            </td>
                            <td class="auto-style1">&nbsp;</td>
                            <td>
                                <dxchartsui:WebChartControl ID="graf11" runat="server" DataSourceID="dsDados5_Filial1" Height="225px" Width="500px">
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="0">
                                                <label angle="270">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines minorvisible="True" visible="True">
                                                </gridlines>
                                            </axisx>
                                            <axisy title-antialiasing="False" title-font="Tahoma, 10pt" title-text="Venda Total" title-visible="True" visibleinpanesserializable="-1">
                                                <tickmarks minorvisible="False" visible="False" />
                                                <label visible="False">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                            <secondaryaxesy>
                                                <cc1:SecondaryAxisY Alignment="Near" AxisID="0" Name="Venda por Secao" Title-Antialiasing="False" Title-Font="Tahoma, 10pt" Title-Text="Venda Seção" Title-Visible="True" VisibleInPanesSerializable="0">
                                                    <tickmarks minorvisible="False" visible="False" />
                                                    <label EnableAntialiasing="True" visible="False">
                                                    </label>
                                                    <range sidemarginsenabled="True" />
                                                </cc1:SecondaryAxisY>
                                            </secondaryaxesy>
                                            <defaultpane weight="0.3">
                                            </defaultpane>
                                            <panes>
                                                <cc1:XYDiagramPane Name="Venda por Secao" PaneID="0" Weight="0.5">
                                                </cc1:XYDiagramPane>
                                            </panes>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
                                    <fillstyle>
                                        <optionsserializable>
                                            <cc1:SolidFillOptions />
                                        </optionsserializable>
                                    </fillstyle>
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
                                        <cc1:Series ArgumentDataMember="myDesc" LabelsVisibility="True" Name="Venda por Seção" ValueDataMembersSerializable="vlrVendaSecao">
                                            <viewserializable>
                                                <cc1:LineSeriesView AxisYName="Venda por Secao" MarkerVisibility="False" PaneName="Venda por Secao">
                                                    <linemarkeroptions BorderVisible="False">
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel Angle="90" Font="Tahoma, 7pt" LineVisible="True">
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
                                    <seriestemplate>
                                        <viewserializable>
                                            <cc1:LineSeriesView MarkerVisibility="True">
                                                <linemarkeroptions BorderVisible="True">
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
                                    </seriestemplate>
                                    <crosshairoptions>
                                        <commonlabelpositionserializable>
                                            <cc1:CrosshairMousePosition />
                                        </commonlabelpositionserializable>
                                    </crosshairoptions>
                                    <tooltipoptions>
                                        <tooltippositionserializable>
                                            <cc1:ToolTipMousePosition />
                                        </tooltippositionserializable>
                                    </tooltipoptions>
                                </dxchartsui:WebChartControl>
                            </td>
                            <td>&nbsp;</td>
                            <td class="auto-style6">&nbsp;</td>
                            <td>
                                <dxchartsui:WebChartControl ID="graf17" runat="server" DataSourceID="dsDados5_Filial2" Height="225px" Width="500px">
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="0">
                                                <label angle="270">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines minorvisible="True" visible="True">
                                                </gridlines>
                                            </axisx>
                                            <axisy title-antialiasing="False" title-font="Tahoma, 10pt" title-text="Venda Total" title-visible="True" visibleinpanesserializable="-1">
                                                <tickmarks minorvisible="False" visible="False" />
                                                <label visible="False">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                            <secondaryaxesy>
                                                <cc1:SecondaryAxisY Alignment="Near" AxisID="0" Name="Venda por Secao" Title-Antialiasing="False" Title-Font="Tahoma, 10pt" Title-Text="Venda Seção" Title-Visible="True" VisibleInPanesSerializable="0">
                                                    <tickmarks minorvisible="False" visible="False" />
                                                    <label EnableAntialiasing="True" visible="False">
                                                    </label>
                                                    <range sidemarginsenabled="True" />
                                                </cc1:SecondaryAxisY>
                                            </secondaryaxesy>
                                            <defaultpane weight="0.3">
                                            </defaultpane>
                                            <panes>
                                                <cc1:XYDiagramPane Name="Venda por Secao" PaneID="0" Weight="0.5">
                                                </cc1:XYDiagramPane>
                                            </panes>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
                                    <fillstyle>
                                        <optionsserializable>
                                            <cc1:SolidFillOptions />
                                        </optionsserializable>
                                    </fillstyle>
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
                                        <cc1:Series ArgumentDataMember="myDesc" LabelsVisibility="True" Name="Venda por Seção" ValueDataMembersSerializable="vlrVendaSecao">
                                            <viewserializable>
                                                <cc1:LineSeriesView AxisYName="Venda por Secao" MarkerVisibility="False" PaneName="Venda por Secao">
                                                    <linemarkeroptions BorderVisible="False">
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel Angle="90" Font="Tahoma, 7pt" LineVisible="True">
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
                                    <seriestemplate>
                                        <viewserializable>
                                            <cc1:LineSeriesView MarkerVisibility="True">
                                                <linemarkeroptions BorderVisible="True">
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
                                    </seriestemplate>
                                    <crosshairoptions>
                                        <commonlabelpositionserializable>
                                            <cc1:CrosshairMousePosition />
                                        </commonlabelpositionserializable>
                                    </crosshairoptions>
                                    <tooltipoptions>
                                        <tooltippositionserializable>
                                            <cc1:ToolTipMousePosition />
                                        </tooltippositionserializable>
                                    </tooltipoptions>
                                </dxchartsui:WebChartControl>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td class="auto-style1">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td class="auto-style6">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="background-color: #3366FF; color: #FFFFFF; font-weight: inherit; text-align: center; font-size: 16px;">
                                <asp:Label ID="lblGraph6" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td class="auto-style1">&nbsp;</td>
                            <td style="background-color: #3366FF; color: #FFFFFF; font-weight: inherit; text-align: center; font-size: 16px;">
                                <asp:Label ID="lblGraph6_Filial1" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td class="auto-style6">&nbsp;</td>
                            <td style="background-color: #3366FF; color: #FFFFFF; font-weight: inherit; text-align: center; font-size: 16px;">
                                <asp:Label ID="lblGraph6_Filial2" runat="server" Text="Label"></asp:Label>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <dxchartsui:WebChartControl ID="graf6" runat="server" DataSourceID="dsDados6" Height="225px" Width="500px">
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="0">
                                                <label angle="270">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines minorvisible="True" visible="True">
                                                </gridlines>
                                            </axisx>
                                            <axisy title-antialiasing="False" title-font="Tahoma, 10pt" title-text="Venda Total" title-visible="True" visibleinpanesserializable="-1">
                                                <tickmarks minorvisible="False" visible="False" />
                                                <label visible="False">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                            <secondaryaxesy>
                                                <cc1:SecondaryAxisY Alignment="Near" AxisID="0" Name="Venda por Secao" Title-Antialiasing="False" Title-Font="Tahoma, 10pt" Title-Text="Venda Seção" Title-Visible="True" VisibleInPanesSerializable="0">
                                                    <tickmarks minorvisible="False" visible="False" />
                                                    <label EnableAntialiasing="True" visible="False">
                                                    </label>
                                                    <range sidemarginsenabled="True" />
                                                </cc1:SecondaryAxisY>
                                            </secondaryaxesy>
                                            <defaultpane weight="0.3">
                                            </defaultpane>
                                            <panes>
                                                <cc1:XYDiagramPane Name="Venda por Secao" PaneID="0" Weight="0.5">
                                                </cc1:XYDiagramPane>
                                            </panes>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
                                    <fillstyle>
                                        <optionsserializable>
                                            <cc1:SolidFillOptions />
                                        </optionsserializable>
                                    </fillstyle>
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
                                        <cc1:Series ArgumentDataMember="myDesc" LabelsVisibility="True" Name="Venda por Seção" ValueDataMembersSerializable="vlrVendaSecao">
                                            <viewserializable>
                                                <cc1:LineSeriesView AxisYName="Venda por Secao" MarkerVisibility="False" PaneName="Venda por Secao">
                                                    <linemarkeroptions BorderVisible="False">
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel Angle="90" Font="Tahoma, 7pt" LineVisible="True">
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
                                    <seriestemplate>
                                        <viewserializable>
                                            <cc1:LineSeriesView MarkerVisibility="True">
                                                <linemarkeroptions BorderVisible="True">
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
                                    </seriestemplate>
                                    <crosshairoptions>
                                        <commonlabelpositionserializable>
                                            <cc1:CrosshairMousePosition />
                                        </commonlabelpositionserializable>
                                    </crosshairoptions>
                                    <tooltipoptions>
                                        <tooltippositionserializable>
                                            <cc1:ToolTipMousePosition />
                                        </tooltippositionserializable>
                                    </tooltipoptions>
                                </dxchartsui:WebChartControl>
                            </td>
                            <td class="auto-style1">&nbsp;</td>
                            <td>
                                <dxchartsui:WebChartControl ID="graf12" runat="server" DataSourceID="dsDados6_Filial1" Height="225px" Width="500px">
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="0">
                                                <label angle="270">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines minorvisible="True" visible="True">
                                                </gridlines>
                                            </axisx>
                                            <axisy title-antialiasing="False" title-font="Tahoma, 10pt" title-text="Venda Total" title-visible="True" visibleinpanesserializable="-1">
                                                <tickmarks minorvisible="False" visible="False" />
                                                <label visible="False">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                            <secondaryaxesy>
                                                <cc1:SecondaryAxisY Alignment="Near" AxisID="0" Name="Venda por Secao" Title-Antialiasing="False" Title-Font="Tahoma, 10pt" Title-Text="Venda Seção" Title-Visible="True" VisibleInPanesSerializable="0">
                                                    <tickmarks minorvisible="False" visible="False" />
                                                    <label EnableAntialiasing="True" visible="False">
                                                    </label>
                                                    <range sidemarginsenabled="True" />
                                                </cc1:SecondaryAxisY>
                                            </secondaryaxesy>
                                            <defaultpane weight="0.3">
                                            </defaultpane>
                                            <panes>
                                                <cc1:XYDiagramPane Name="Venda por Secao" PaneID="0" Weight="0.5">
                                                </cc1:XYDiagramPane>
                                            </panes>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
                                    <fillstyle>
                                        <optionsserializable>
                                            <cc1:SolidFillOptions />
                                        </optionsserializable>
                                    </fillstyle>
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
                                        <cc1:Series ArgumentDataMember="myDesc" LabelsVisibility="True" Name="Venda por Seção" ValueDataMembersSerializable="vlrVendaSecao">
                                            <viewserializable>
                                                <cc1:LineSeriesView AxisYName="Venda por Secao" MarkerVisibility="False" PaneName="Venda por Secao">
                                                    <linemarkeroptions BorderVisible="False">
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel Angle="90" Font="Tahoma, 7pt" LineVisible="True">
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
                                    <seriestemplate>
                                        <viewserializable>
                                            <cc1:LineSeriesView MarkerVisibility="True">
                                                <linemarkeroptions BorderVisible="True">
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
                                    </seriestemplate>
                                    <crosshairoptions>
                                        <commonlabelpositionserializable>
                                            <cc1:CrosshairMousePosition />
                                        </commonlabelpositionserializable>
                                    </crosshairoptions>
                                    <tooltipoptions>
                                        <tooltippositionserializable>
                                            <cc1:ToolTipMousePosition />
                                        </tooltippositionserializable>
                                    </tooltipoptions>
                                </dxchartsui:WebChartControl>
                            </td>
                            <td>&nbsp;</td>
                            <td class="auto-style6">&nbsp;</td>
                            <td>
                                <dxchartsui:WebChartControl ID="graf18" runat="server" DataSourceID="dsDados6_Filial2" Height="225px" Width="500px">
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="0">
                                                <label angle="270">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines minorvisible="True" visible="True">
                                                </gridlines>
                                            </axisx>
                                            <axisy title-antialiasing="False" title-font="Tahoma, 10pt" title-text="Venda Total" title-visible="True" visibleinpanesserializable="-1">
                                                <tickmarks minorvisible="False" visible="False" />
                                                <label visible="False">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                            <secondaryaxesy>
                                                <cc1:SecondaryAxisY Alignment="Near" AxisID="0" Name="Venda por Secao" Title-Antialiasing="False" Title-Font="Tahoma, 10pt" Title-Text="Venda Seção" Title-Visible="True" VisibleInPanesSerializable="0">
                                                    <tickmarks minorvisible="False" visible="False" />
                                                    <label EnableAntialiasing="True" visible="False">
                                                    </label>
                                                    <range sidemarginsenabled="True" />
                                                </cc1:SecondaryAxisY>
                                            </secondaryaxesy>
                                            <defaultpane weight="0.3">
                                            </defaultpane>
                                            <panes>
                                                <cc1:XYDiagramPane Name="Venda por Secao" PaneID="0" Weight="0.5">
                                                </cc1:XYDiagramPane>
                                            </panes>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
                                    <fillstyle>
                                        <optionsserializable>
                                            <cc1:SolidFillOptions />
                                        </optionsserializable>
                                    </fillstyle>
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
                                        <cc1:Series ArgumentDataMember="myDesc" LabelsVisibility="True" Name="Venda por Seção" ValueDataMembersSerializable="vlrVendaSecao">
                                            <viewserializable>
                                                <cc1:LineSeriesView AxisYName="Venda por Secao" MarkerVisibility="False" PaneName="Venda por Secao">
                                                    <linemarkeroptions BorderVisible="False">
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel Angle="90" Font="Tahoma, 7pt" LineVisible="True">
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
                                    <seriestemplate>
                                        <viewserializable>
                                            <cc1:LineSeriesView MarkerVisibility="True">
                                                <linemarkeroptions BorderVisible="True">
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
                                    </seriestemplate>
                                    <crosshairoptions>
                                        <commonlabelpositionserializable>
                                            <cc1:CrosshairMousePosition />
                                        </commonlabelpositionserializable>
                                    </crosshairoptions>
                                    <tooltipoptions>
                                        <tooltippositionserializable>
                                            <cc1:ToolTipMousePosition />
                                        </tooltippositionserializable>
                                    </tooltipoptions>
                                </dxchartsui:WebChartControl>
                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>

<div id="divFilial1">

		<asp:SqlDataSource ID="dsDados1" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspVendaHoraPorSecao_DashBoard" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="diaInicial" SessionField="sDIAINICIAL1" Type="DateTime" />                           
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                            <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="dsDados2" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspVendaHoraPorSecao_DashBoard" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="diaInicial" SessionField="sDIAINICIAL2" Type="DateTime" />                            
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                            <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="dsDados3" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspVendaHoraPorSecao_DashBoard" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="diaInicial" SessionField="sDIAINICIAL3" Type="DateTime" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                            <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsDados4" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspVendaHoraPorSecao_DashBoard" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="diaInicial" SessionField="sDIAINICIAL4" Type="DateTime" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                            <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsDados5" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspVendaHoraPorSecao_DashBoard" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="diaInicial" SessionField="sDIAINICIAL5" Type="DateTime" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                            <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsDados6" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspVendaHoraPorSecao_DashBoard" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="diaInicial" SessionField="sDIAINICIAL6" Type="DateTime" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                            <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

</div>

<div id="divFilial2">

		<asp:SqlDataSource ID="dsDados1_Filial1" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspVendaHoraPorSecao_DashBoard" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="diaInicial" SessionField="sDIAINICIAL1" Type="DateTime" />                           
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL1" Type="Byte" />
                            <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="dsDados2_Filial1" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspVendaHoraPorSecao_DashBoard" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="diaInicial" SessionField="sDIAINICIAL2" Type="DateTime" />                            
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL1" Type="Byte" />
                            <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="dsDados3_Filial1" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspVendaHoraPorSecao_DashBoard" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="diaInicial" SessionField="sDIAINICIAL3" Type="DateTime" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL1" Type="Byte" />
                            <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsDados4_Filial1" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspVendaHoraPorSecao_DashBoard" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="diaInicial" SessionField="sDIAINICIAL4" Type="DateTime" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL1" Type="Byte" />
                            <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsDados5_Filial1" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspVendaHoraPorSecao_DashBoard" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="diaInicial" SessionField="sDIAINICIAL5" Type="DateTime" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL1" Type="Byte" />
                            <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsDados6_Filial1" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspVendaHoraPorSecao_DashBoard" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="diaInicial" SessionField="sDIAINICIAL6" Type="DateTime" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL1" Type="Byte" />
                            <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

</div>

<div id="divFilial3">

		<asp:SqlDataSource ID="dsDados1_Filial2" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspVendaHoraPorSecao_DashBoard" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="diaInicial" SessionField="sDIAINICIAL1" Type="DateTime" />                           
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL2" Type="Byte" />
                            <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="dsDados2_Filial2" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspVendaHoraPorSecao_DashBoard" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="diaInicial" SessionField="sDIAINICIAL2" Type="DateTime" />                            
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL2" Type="Byte" />
                            <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="dsDados3_Filial2" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspVendaHoraPorSecao_DashBoard" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="diaInicial" SessionField="sDIAINICIAL3" Type="DateTime" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL2" Type="Byte" />
                            <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsDados4_Filial2" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspVendaHoraPorSecao_DashBoard" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="diaInicial" SessionField="sDIAINICIAL4" Type="DateTime" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL2" Type="Byte" />
                            <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsDados5_Filial2" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspVendaHoraPorSecao_DashBoard" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="diaInicial" SessionField="sDIAINICIAL5" Type="DateTime" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL2" Type="Byte" />
                            <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsDados6_Filial2" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspVendaHoraPorSecao_DashBoard" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="diaInicial" SessionField="sDIAINICIAL6" Type="DateTime" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL2" Type="Byte" />
                            <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

</div>


                    <br />
                    <br />

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>



</asp:Content>



