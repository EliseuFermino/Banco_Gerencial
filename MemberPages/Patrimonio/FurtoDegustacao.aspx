<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Patrimonio/Patrimonio_Preventica_Reativa.master" AutoEventWireup="false" CodeFile="FurtoDegustacao.aspx.vb" Inherits="MemberPages_Patrimonio_FurtoDegustacao" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>

<%@ Register Src="~/Controles/wucAnoMes.ascx" TagPrefix="uc1" TagName="wucAnoMes" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>



<asp:Content ID="Content2" ContentPlaceHolderID="PatrimonioContent" Runat="Server">

                                    <div id="divFilial" class="BGC_myBorder BGC_Filial_Clear " >
                                        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" Visible_cboCorporacao="false"   />
                                    </div>

                                    <div id="divAno" class="BGC_myBorder BGC_Periodo" style="padding:8px">
                                        <uc1:wucAno runat="server" ID="cboAno"  />
                                    </div>

                                    <div id="divMes" class="BGC_Periodo" style="margin-top:1px; padding: 6px">
                                        <uc1:wuciListaMes runat="server" ID="cboMes" />
                                    </div>

                                        <div class="BGC_myBorder" style ="float:left ; margin-left: 15px; margin-top: 1px ">
                                            <dx:ASPxButton ID="btnAtualizar_FurtoDegustacao" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
                                                <ClientSideEvents Click="function(s, e) {cbpPanel_FurtoDegustacao.PerformCallback();}" />
                                            </dx:ASPxButton>
                                        </div>

                                        <div class="divDados1" style="clear:both; margin-left: 10px; padding-top: 4px ">
                                        <dx:ASPxCallbackPanel ID="cbpPanel_FurtoDegustacao" ClientInstanceName="cbpPanel_FurtoDegustacao" runat="server" Width="100%" SettingsLoadingPanel-Text="Aguarde. Atualizando" Theme="Metropolis">
<SettingsLoadingPanel Text="Aguarde. Atualizando"></SettingsLoadingPanel>
                                            <PanelCollection>
                                                <dx:PanelContent>

                                            

                                                <dxchartsui:WebChartControl ID="graph_Total_Furto_Degustacao_daLOJA" runat="server" DataSourceID="dsTotal_Furto_Degustacao_daLOJA" Height="450px" Width="1000px">
                                                    <diagramserializable>
                                                        <cc1:XYDiagram>
                                                            <axisx visibleinpanesserializable="-1">
                                                                <label angle="90">
                                                                </label>
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

                                                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="7"  Visibility="False"></legend>
                                                    <seriesserializable>
                                                        <cc1:Series ArgumentDataMember="Descricao" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="vlrTotal">
                                                            <viewserializable>
                                                                <cc1:SideBySideBarSeriesView ColorEach="True">
                                                                </cc1:SideBySideBarSeriesView>
                                                            </viewserializable>
                                                            <labelserializable>
                                                                <cc1:SideBySideBarSeriesLabel Font="Tahoma, 9pt" LineVisible="True" TextOrientation="BottomToTop" TextPattern="{V:n0}">
                                                                    <fillstyle>
                                                                        <optionsserializable>
                                                                            <cc1:SolidFillOptions />
                                                                        </optionsserializable>
                                                                    </fillstyle>
                                                                    <pointoptionsserializable>
                                                                        <cc1:PointOptions>
                                                                            <valuenumericoptions format="Currency" precision="0" />
                                                                        </cc1:PointOptions>
                                                                    </pointoptionsserializable>
                                                                </cc1:SideBySideBarSeriesLabel>
                                                            </labelserializable>
                                                            <legendpointoptionsserializable>
                                                                <cc1:PointOptions>
                                                                    <valuenumericoptions format="Currency" precision="0" />
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
                                                        <cc1:ChartTitle Font="Tahoma, 14pt" Indent="1" Text="Furto e Degustação da Loja - Mês " WordWrap="True" />
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
                    
		                                        <asp:SqlDataSource ID="dsTotal_Furto_Degustacao_daLOJA" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="Analises.usp_Total_Furto_Degustacao_daLOJA" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                                        <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />  
                                                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />                           
                                                    </SelectParameters>
                                                </asp:SqlDataSource>                    

                                                <h4><b>
                                                <asp:Label ID="Label4" runat="server" ></asp:Label>
                                                </b></h4>
                                            </div>

                                           
                                            <div class="divDados1">

                                            <dxchartsui:WebChartControl ID="graph_Total_Furto_Degustacao_daLOJA_13_Mes" runat="server" DataSourceID="dsValorRecuperadoFilial_13_Mes" Height="450px" Width="1000px" BackColor="White">
                                                <diagramserializable>
                                                    <cc1:XYDiagram>
                                                        <axisx visibleinpanesserializable="-1">
                                                            <tickmarks minorvisible="False" />
                                                            <label angle="90">
                                                            </label>
                                                            <range sidemarginsenabled="True" />
                                                        </axisx>
                                                        <axisy visibleinpanesserializable="-1" visible="False">
                                                            <range sidemarginsenabled="True" />
                                                        </axisy>
                                                        <defaultpane backcolor="White">
                                                        </defaultpane>
                                                    </cc1:XYDiagram>
                                                </diagramserializable>
                        <FillStyle><OptionsSerializable>
                        <cc1:SolidFillOptions></cc1:SolidFillOptions>
                        </OptionsSerializable>
                        </FillStyle>

                                                <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="7" Visibility="False"></legend>
                                                <seriesserializable>
                                                    <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="vlrTotal" SeriesPointsSorting="Ascending">
                                                        <viewserializable>
                                        
                                                        <cc1:LineSeriesView ColorEach="True" MarkerVisibility="True"><linemarkeroptions BorderVisible="True"></linemarkeroptions></cc1:LineSeriesView></viewserializable>
                                                        <labelserializable>
                                        
                                                        <cc1:PointSeriesLabel Font="Tahoma, 9pt" LineVisible="True" TextOrientation="BottomToTop" TextPattern="{V:n0}"><fillstyle><optionsserializable><cc1:SolidFillOptions /></optionsserializable></fillstyle><pointoptionsserializable><cc1:PointOptions><valuenumericoptions format="Currency" precision="0" /></cc1:PointOptions></pointoptionsserializable></cc1:PointSeriesLabel></labelserializable>
                                                        <legendpointoptionsserializable>
                                                            <cc1:PointOptions>
                                                                <valuenumericoptions format="Currency" precision="0" />
                                                            </cc1:PointOptions>
                                                        </legendpointoptionsserializable>
                                                    </cc1:Series>
                                                </seriesserializable>

                        <SeriesTemplate><ViewSerializable>
        
                        <cc1:LineSeriesView MarkerVisibility="True"><linemarkeroptions BorderVisible="True"></linemarkeroptions></cc1:LineSeriesView></ViewSerializable>
                        <LabelSerializable>
        
                        <cc1:PointSeriesLabel LineVisible="True"><fillstyle><optionsserializable><cc1:SolidFillOptions /></optionsserializable></fillstyle><pointoptionsserializable><cc1:PointOptions></cc1:PointOptions></pointoptionsserializable></cc1:PointSeriesLabel></LabelSerializable>
                        <LegendPointOptionsSerializable>
                        <cc1:PointOptions></cc1:PointOptions>
                        </LegendPointOptionsSerializable>
                        </SeriesTemplate>

                                                <titles>
                                                    <cc1:ChartTitle Font="Tahoma, 14pt" Indent="1" Text="Furto e Degustação - Loja e Depósito" WordWrap="True" />
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
                    
		                                    <asp:SqlDataSource ID="dsValorRecuperadoFilial_13_Mes" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="Analises.usp_Total_Furto_Degustacao_daLOJA_13_Mes" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    
                                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />                            
                                                </SelectParameters>
                                            </asp:SqlDataSource>                    

                                           
                                        </div>
                                          <br />  

                                            
                                            <div class="divDados1">

                                                <dxchartsui:WebChartControl ID="graph_FurtoDegustao_porLoja" runat="server" DataSourceID="dsFurtoDegustao_porLoja" Height="450px" Width="1000px">
                                                    <diagramserializable>
                                                        <cc1:XYDiagram>
                                                            <axisx visibleinpanesserializable="-1">
                                                                <qualitativescaleoptions autogrid="False" gridspacing="0.5" />
                                                                <tickmarks minorvisible="False" />
                                                                <label angle="90">
                                                                </label>
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

                                                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="7" Visibility="False"></legend>
                                                    <seriesserializable>
                                                        <cc1:Series ArgumentDataMember="Descricao" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="vlrTotal" ArgumentScaleType="Qualitative">
                                                            <viewserializable>
                                                                <cc1:SideBySideBarSeriesView ColorEach="True">
                                                                </cc1:SideBySideBarSeriesView>
                                                            </viewserializable>
                                                            <labelserializable>
                                                                <cc1:SideBySideBarSeriesLabel Font="Tahoma, 9pt" LineVisible="True" TextOrientation="BottomToTop" TextPattern="{V:n0}">
                                                                    <fillstyle>
                                                                        <optionsserializable>
                                                                            <cc1:SolidFillOptions />
                                                                        </optionsserializable>
                                                                    </fillstyle>
                                                                    <pointoptionsserializable>
                                                                        <cc1:PointOptions>
                                                                            <valuenumericoptions format="Currency" precision="0" />
                                                                        </cc1:PointOptions>
                                                                    </pointoptionsserializable>
                                                                </cc1:SideBySideBarSeriesLabel>
                                                            </labelserializable>
                                                            <legendpointoptionsserializable>
                                                                <cc1:PointOptions>
                                                                    <valuenumericoptions format="Currency" precision="0" />
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
                                                        <cc1:ChartTitle Font="Tahoma, 14pt" Indent="1" Text="Furto e Degustação Loja" WordWrap="True" />
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
                    
		                                        <asp:SqlDataSource ID="dsFurtoDegustao_porLoja" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="Analises.usp_Total_Furto_Degustacao" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                                        <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />                            
                                                    </SelectParameters>
                                                </asp:SqlDataSource>                    

                                                
                                            </div>
                                            <br />

                                            <div class="divDados1">

                                                <dxchartsui:WebChartControl ID="graph_FurtoDegustao_Deposito" runat="server" DataSourceID="dsFurtoDegustao_Deposito" Height="450px" Width="1000px">
                                                    <diagramserializable>
                                                        <cc1:XYDiagram>
                                                            <axisx visibleinpanesserializable="-1">
                                                                <tickmarks minorvisible="False" />
                                                                <label angle="90">
                                                                </label>
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

                                                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="7" Visibility="False"></legend>
                                                    <seriesserializable>
                                                        <cc1:Series ArgumentDataMember="Descricao" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="vlrTotal">
                                                            <viewserializable>
                                                                <cc1:SideBySideBarSeriesView ColorEach="True">
                                                                </cc1:SideBySideBarSeriesView>
                                                            </viewserializable>
                                                            <labelserializable>
                                                                <cc1:SideBySideBarSeriesLabel Font="Tahoma, 9pt" LineVisible="True" TextOrientation="BottomToTop" TextPattern="{V:n0}">
                                                                    <fillstyle>
                                                                        <optionsserializable>
                                                                            <cc1:SolidFillOptions />
                                                                        </optionsserializable>
                                                                    </fillstyle>
                                                                    <pointoptionsserializable>
                                                                        <cc1:PointOptions>
                                                                            <valuenumericoptions format="Currency" precision="0" />
                                                                        </cc1:PointOptions>
                                                                    </pointoptionsserializable>
                                                                </cc1:SideBySideBarSeriesLabel>
                                                            </labelserializable>
                                                            <legendpointoptionsserializable>
                                                                <cc1:PointOptions>
                                                                    <valuenumericoptions format="Currency" precision="0" />
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
                                                        <cc1:ChartTitle Font="Tahoma, 14pt" Indent="1" Text="Furto e Degustação Depósito " WordWrap="True" />
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
                    
		                                        <asp:SqlDataSource ID="dsFurtoDegustao_Deposito" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="Analises.usp_Total_Furto_Degustacao_Deposito" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                                        <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />                            
                                                    </SelectParameters>
                                                </asp:SqlDataSource>                    

                                               
                                            </div>
                                            <br />

                                            <div class="divDados1">

                                                <dxchartsui:WebChartControl ID="graph_Total_Furto_Degustacao_Total" runat="server" DataSourceID="dsTotal_Furto_Degustacao_Total" Height="450px" Width="1000px">
                                                    <diagramserializable>
                                                        <cc1:XYDiagram>
                                                            <axisx visibleinpanesserializable="-1">
                                                                <qualitativescaleoptions autogrid="False" gridspacing="0.5" />
                                                                <tickmarks minorvisible="False" />
                                                                <label angle="90">
                                                                </label>
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

                                                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="7" Visibility="False"></legend>
                                                    <seriesserializable>
                                                        <cc1:Series ArgumentDataMember="Descricao" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="vlrTotal" ArgumentScaleType="Qualitative">
                                                            <viewserializable>
                                                                <cc1:SideBySideBarSeriesView ColorEach="True">
                                                                </cc1:SideBySideBarSeriesView>
                                                            </viewserializable>
                                                            <labelserializable>
                                                                <cc1:SideBySideBarSeriesLabel Font="Tahoma, 9pt" LineVisible="True" TextOrientation="BottomToTop" TextPattern="{V:n0}">
                                                                    <fillstyle>
                                                                        <optionsserializable>
                                                                            <cc1:SolidFillOptions />
                                                                        </optionsserializable>
                                                                    </fillstyle>
                                                                    <pointoptionsserializable>
                                                                        <cc1:PointOptions>
                                                                            <valuenumericoptions format="Currency" precision="0" />
                                                                        </cc1:PointOptions>
                                                                    </pointoptionsserializable>
                                                                </cc1:SideBySideBarSeriesLabel>
                                                            </labelserializable>
                                                            <legendpointoptionsserializable>
                                                                <cc1:PointOptions>
                                                                    <valuenumericoptions format="Currency" precision="0" />
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
                                                        <cc1:ChartTitle Font="Tahoma, 14pt" Indent="1" Text="Furto e Degustação Total (Loja + Depósito) " WordWrap="True" />
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
                    
		                                        <asp:SqlDataSource ID="dsTotal_Furto_Degustacao_Total" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="Analises.usp_Total_Furto_Degustacao_Total" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                                        <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />                            
                                                    </SelectParameters>
                                                </asp:SqlDataSource>                    

                                                
                                            </div>
                                        



                                                </dx:PanelContent>
                                            </PanelCollection>
                                        </dx:ASPxCallbackPanel>  



</asp:Content>

