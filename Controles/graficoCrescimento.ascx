<%@ Control Language="VB" AutoEventWireup="false" CodeFile="graficoCrescimento.ascx.vb" Inherits="Controles_graficoCrescimento" %>
<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<%@ Register assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>

<%@ Register src="wuciListaLojasComApoio.ascx" tagname="wuciListaLojasComApoio" tagprefix="uc1" %>

<%@ Register src="wucListaLojasComCorporacao.ascx" tagname="wucListaLojasComCorporacao" tagprefix="uc2" %>
<%@ Register Src="~/Controles/wucListaSecao.ascx" TagPrefix="uc1" TagName="wucListaSecao" %>


<style type="text/css">

    #divFilial {
            float: left;
            width: 330px;
            padding-left: 2px;
        }

    .divTitulo {  
        clear: both ;       
        float :left ;
        font-size: 24px;
        width: 1024px;
        text-align: center; 
        padding-top: 10px;  
        color: #808080;     
    }
     
    .divContainer {
        clear :both ;
        float: left;
        border: 1px solid gray;
        border-radius: 5px;
        padding: 5px;
        margin-top: 8px;        
        width: 990px;
        padding-bottom: 30px;        
    }

    .floatLeft {
        float:left;
        margin-left: 10px;
        padding-top: 2px;
    }

   .divGraficoDepto {        
        float: left;
    }

    #divGrafico_Depto1 {
        clear: both;
        float: left;
    }
  
</style>

 
        
      <div id="divFilial">
          <uc2:wucListaLojasComCorporacao ID="cboFilial" runat="server" />
      </div>

      <div class="floatLeft">
          <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis" >
              <ClientSideEvents Click="function(s, e) {	
cbPanel.PerformCallback();
cbPanelSecao.PerformCallback();
cboPanelCrescimentoSecao.PerformCallback();
}" />
          </dx:ASPxButton>
      </div>

      <div id="divDados">
          <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="1010px" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde...">
              <PanelCollection>
                  <dx:PanelContent runat="server" SuportsDisabledAttributes="both">

                     
                      <p class="divTitulo">Grafico de Crescimento da Vendas</p> 
                   
      
                      <div class="divContainer">
                          <dxchartsui:WebChartControl ID="graficoCrescimento" runat="server" DataSourceID="dsCrescimento" Height="350px" Width="995px" BackColor="Transparent">
                              <borderoptions visible="False" />
                              <diagramserializable>
                                  <cc1:XYDiagram>
                                      <axisx visibleinpanesserializable="-1" color="Gray" gridspacingauto="False">
                                          <range sidemarginsenabled="True" />
                                      </axisx>
                                      <axisy visibleinpanesserializable="-1">
                                          <range sidemarginsenabled="True" />
                                          <gridlines color="192, 192, 192">
                                              <linestyle dashstyle="Dash" />
                                          </gridlines>
                                      </axisy>
                                      <defaultpane backcolor="Transparent">
                                      </defaultpane>
                                  </cc1:XYDiagram>
                              </diagramserializable>
                <FillStyle><OptionsSerializable>
                <cc1:SolidFillOptions></cc1:SolidFillOptions>
                </OptionsSerializable>
                </FillStyle>

                          
                              <seriesserializable>
                                  <cc1:Series ArgumentDataMember="Ano" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="percCresc">
                                      <viewserializable>
                                          <cc1:SplineSeriesView MarkerVisibility="True">
                                              <linemarkeroptions size="6"  BorderVisible="True">
                                              </linemarkeroptions>
                                          </cc1:SplineSeriesView>
                                      </viewserializable>
                                      <labelserializable>
                                          <cc1:PointSeriesLabel Angle="90" Font="Tahoma, 10pt" LineVisible="True">
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
                    <cc1:SplineSeriesView>
                        <linemarkeroptions  BorderVisible="True">
                        </linemarkeroptions>
                    </cc1:SplineSeriesView>
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
                          <asp:SqlDataSource ID="dsCrescimento" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspCrescimentoAnual" SelectCommandType="StoredProcedure">
                              <SelectParameters>
                                  <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                              </SelectParameters>
                          </asp:SqlDataSource>
                      </div>

                      <%--Aqui começa por Departamento--%>
                                            
                      <p class="divTitulo">Gráfico de Crescimento por Departamento</p>                       

                      <div class="divContainer" >
                          <div id="divGrafico_Depto1">
                              <dxchartsui:WebChartControl ID="grfDepto1" runat="server" DataSourceID="dsDepto1" Height="150px" Width="194px" BackColor="Transparent">
                              <borderoptions visible="False" />
                              <diagramserializable>
                                  <cc1:XYDiagram>
                                      <axisx visibleinpanesserializable="-1" color="Gray">
                                          <range sidemarginsenabled="True" />
                                      </axisx>
                                      <axisy visibleinpanesserializable="-1" color="Gray">
                                          <label textcolor="Gray">
                                          </label>
                                          <range sidemarginsenabled="True" />
                                          <gridlines color="192, 192, 192">
                                              <linestyle dashstyle="Dash" />
                                          </gridlines>
                                      </axisy>
                                      <defaultpane backcolor="Transparent">
                                      </defaultpane>
                                  </cc1:XYDiagram>
                              </diagramserializable>
                <FillStyle><OptionsSerializable>
                <cc1:SolidFillOptions></cc1:SolidFillOptions>
                </OptionsSerializable>
                </FillStyle>

                      
                              <seriesserializable>
                                  <cc1:Series ArgumentDataMember="Ano" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="percCresc">
                                      <viewserializable>
                                          <cc1:SplineSeriesView MarkerVisibility="True" Color="0, 192, 0">
                                              <linemarkeroptions size="6"  BorderVisible="True">
                                              </linemarkeroptions>
                                          </cc1:SplineSeriesView>
                                      </viewserializable>
                                      <labelserializable>
                                          <cc1:PointSeriesLabel Angle="90" LineVisible="True">
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
                    <cc1:SplineSeriesView>
                        <linemarkeroptions  BorderVisible="True">
                        </linemarkeroptions>
                    </cc1:SplineSeriesView>
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
                                      <cc1:ChartTitle Font="Tahoma, 11pt" Text="Mercearia" />
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

                              <asp:SqlDataSource ID="dsDepto1" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspBuscarCrescimentoDepto" SelectCommandType="StoredProcedure">
                                  <SelectParameters>
                                      <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                      <asp:Parameter DefaultValue="1" Name="idDepto" Type="Byte" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
                          </div>

                          <div class="divGraficoDepto">
                              <dxchartsui:WebChartControl ID="grfDepto2" runat="server" DataSourceID="dsDepto2" Height="150px" Width="194px" BackColor="Transparent">
                              <borderoptions visible="False" />
                              <diagramserializable>
                                  <cc1:XYDiagram>
                                      <axisx visibleinpanesserializable="-1" color="Gray">
                                          <range sidemarginsenabled="True" />
                                      </axisx>
                                      <axisy visibleinpanesserializable="-1" color="Gray">
                                          <label textcolor="Gray">
                                          </label>
                                          <range sidemarginsenabled="True" />
                                          <gridlines color="192, 192, 192">
                                              <linestyle dashstyle="Dash" />
                                          </gridlines>
                                      </axisy>
                                      <defaultpane backcolor="Transparent">
                                      </defaultpane>
                                  </cc1:XYDiagram>
                              </diagramserializable>
                <FillStyle><OptionsSerializable>
                <cc1:SolidFillOptions></cc1:SolidFillOptions>
                </OptionsSerializable>
                </FillStyle>

                          
                              <seriesserializable>
                                  <cc1:Series ArgumentDataMember="Ano" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="percCresc">
                                      <viewserializable>
                                          <cc1:SplineSeriesView MarkerVisibility="True" Color="192, 0, 192">
                                              <linemarkeroptions size="6"  BorderVisible="True">
                                              </linemarkeroptions>
                                          </cc1:SplineSeriesView>
                                      </viewserializable>
                                      <labelserializable>
                                          <cc1:PointSeriesLabel Angle="90" LineVisible="True">
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
                    <cc1:SplineSeriesView>
                        <linemarkeroptions  BorderVisible="True">
                        </linemarkeroptions>
                    </cc1:SplineSeriesView>
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
                                      <cc1:ChartTitle Font="Tahoma, 11pt" Text="Perecíveis" />
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

                              <asp:SqlDataSource ID="dsDepto2" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspBuscarCrescimentoDepto" SelectCommandType="StoredProcedure">
                                  <SelectParameters>
                                      <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                      <asp:Parameter DefaultValue="2" Name="idDepto" Type="Byte" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
                          </div>

                          <div class="divGraficoDepto">
                              <dxchartsui:WebChartControl ID="grfDepto3" runat="server" DataSourceID="dsDepto3" Height="150px" Width="194px" BackColor="Transparent">
                              <borderoptions visible="False" />
                              <diagramserializable>
                                  <cc1:XYDiagram>
                                      <axisx visibleinpanesserializable="-1" color="Gray">
                                          <range sidemarginsenabled="True" />
                                      </axisx>
                                      <axisy visibleinpanesserializable="-1" color="Gray">
                                          <label textcolor="Gray">
                                          </label>
                                          <range sidemarginsenabled="True" />
                                          <gridlines color="192, 192, 192">
                                              <linestyle dashstyle="Dash" />
                                          </gridlines>
                                      </axisy>
                                      <defaultpane backcolor="Transparent">
                                      </defaultpane>
                                  </cc1:XYDiagram>
                              </diagramserializable>
                <FillStyle><OptionsSerializable>
                <cc1:SolidFillOptions></cc1:SolidFillOptions>
                </OptionsSerializable>
                </FillStyle>

                              <seriesserializable>
                                  <cc1:Series ArgumentDataMember="Ano" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="percCresc">
                                      <viewserializable>
                                          <cc1:SplineSeriesView MarkerVisibility="True" Color="Chocolate">
                                              <linemarkeroptions size="6"  BorderVisible="True">
                                              </linemarkeroptions>
                                          </cc1:SplineSeriesView>
                                      </viewserializable>
                                      <labelserializable>
                                          <cc1:PointSeriesLabel Angle="90" LineVisible="True">
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
                    <cc1:SplineSeriesView>
                        <linemarkeroptions  BorderVisible="True">
                        </linemarkeroptions>
                    </cc1:SplineSeriesView>
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
                                      <cc1:ChartTitle Font="Tahoma, 11pt" Text="Bazar" />
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

                              <asp:SqlDataSource ID="dsDepto3" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspBuscarCrescimentoDepto" SelectCommandType="StoredProcedure">
                                  <SelectParameters>
                                      <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                      <asp:Parameter DefaultValue="3" Name="idDepto" Type="Byte" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
                          </div>

                          <div class="divGraficoDepto">
                              <dxchartsui:WebChartControl ID="grfDepto4" runat="server" DataSourceID="dsDepto4" Height="150px" Width="194px" BackColor="Transparent">
                              <borderoptions visible="False" />
                              <diagramserializable>
                                  <cc1:XYDiagram>
                                      <axisx visibleinpanesserializable="-1" color="Gray">
                                          <range sidemarginsenabled="True" />
                                      </axisx>
                                      <axisy visibleinpanesserializable="-1" color="Gray">
                                          <label textcolor="Gray">
                                          </label>
                                          <range sidemarginsenabled="True" />
                                          <gridlines color="192, 192, 192">
                                              <linestyle dashstyle="Dash" />
                                          </gridlines>
                                      </axisy>
                                      <defaultpane backcolor="Transparent">
                                      </defaultpane>
                                  </cc1:XYDiagram>
                              </diagramserializable>
                <FillStyle><OptionsSerializable>
                <cc1:SolidFillOptions></cc1:SolidFillOptions>
                </OptionsSerializable>
                </FillStyle>

                          
                              <seriesserializable>
                                  <cc1:Series ArgumentDataMember="Ano" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="percCresc">
                                      <viewserializable>
                                          <cc1:SplineSeriesView MarkerVisibility="True" Color="DeepSkyBlue">
                                              <linemarkeroptions size="6"  BorderVisible="True">
                                              </linemarkeroptions>
                                          </cc1:SplineSeriesView>
                                      </viewserializable>
                                      <labelserializable>
                                          <cc1:PointSeriesLabel Angle="90" LineVisible="True">
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
                    <cc1:SplineSeriesView>
                        <linemarkeroptions  BorderVisible="True">
                        </linemarkeroptions>
                    </cc1:SplineSeriesView>
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
                                      <cc1:ChartTitle Font="Tahoma, 11pt" Text="Textil" />
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
                              <asp:SqlDataSource ID="dsDepto4" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspBuscarCrescimentoDepto" SelectCommandType="StoredProcedure">
                                  <SelectParameters>
                                      <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                      <asp:Parameter DefaultValue="4" Name="idDepto" Type="Byte" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
                          </div>

                          <div class="divGraficoDepto">
                              <dxchartsui:WebChartControl ID="grfDepto5" runat="server" DataSourceID="dsDepto5" Height="150px" Width="194px" BackColor="Transparent">
                              <borderoptions visible="False" />
                              <diagramserializable>
                                  <cc1:XYDiagram>
                                      <axisx visibleinpanesserializable="-1" color="Gray">
                                          <range sidemarginsenabled="True" />
                                      </axisx>
                                      <axisy visibleinpanesserializable="-1" color="Gray">
                                          <label textcolor="Gray">
                                          </label>
                                          <range sidemarginsenabled="True" />
                                          <gridlines color="192, 192, 192">
                                              <linestyle dashstyle="Dash" />
                                          </gridlines>
                                      </axisy>
                                      <defaultpane backcolor="Transparent">
                                      </defaultpane>
                                  </cc1:XYDiagram>
                              </diagramserializable>
                <FillStyle><OptionsSerializable>
                <cc1:SolidFillOptions></cc1:SolidFillOptions>
                </OptionsSerializable>
                </FillStyle>

                              <seriesserializable>
                                  <cc1:Series ArgumentDataMember="Ano" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="percCresc">
                                      <viewserializable>
                                          <cc1:SplineSeriesView MarkerVisibility="True" Color="DarkKhaki">
                                              <linemarkeroptions size="6"  BorderVisible="True">
                                              </linemarkeroptions>
                                          </cc1:SplineSeriesView>
                                      </viewserializable>
                                      <labelserializable>
                                          <cc1:PointSeriesLabel Angle="90" LineVisible="True">
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
                    <cc1:SplineSeriesView>
                        <linemarkeroptions  BorderVisible="True">
                        </linemarkeroptions>
                    </cc1:SplineSeriesView>
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
                                      <cc1:ChartTitle Font="Tahoma, 11pt" Text="Eletro" />
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

                              <asp:SqlDataSource ID="dsDepto5" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspBuscarCrescimentoDepto" SelectCommandType="StoredProcedure">
                                  <SelectParameters>
                                      <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                      <asp:Parameter DefaultValue="5" Name="idDepto" Type="Byte" />
                                  </SelectParameters>
                              </asp:SqlDataSource>
                          </div>

                      </div>
                                   
                  </dx:PanelContent>
              </PanelCollection>
          </dx:ASPxCallbackPanel>
          
      </div>

      <div id="divSecao">

        
         <p class ="divTitulo">Gráfico de Crescimento por Seção</p>   
        

        <div class="divContainer">

              <div id="divCboSecao">
                  <uc1:wucListaSecao runat="server" ID="cboSecao" />
              </div>

              <div class="floatLeft">
                  <dx:ASPxButton ID="btnBotaoAtualizarSecao" runat="server" Text="Atualizar" AutoPostBack ="False" Theme ="Metropolis" >
                      <ClientSideEvents Click="function(s, e) {	cbPanelSecao.PerformCallback();}" />
                  </dx:ASPxButton>
              </div>

              <div id="divDadosSecao">
                <div id="divGraficoSecao">
                    <dx:ASPxCallbackPanel ID="cbPanelSecao" runat="server" Width="1020px" ClientInstanceName="cbPanelSecao" Theme="Metropolis">
                        <PanelCollection>
                            <dx:PanelContent runat="server" SuportsDisabledAttributes="both">
                                <dxchartsui:WebChartControl ID="grfSecao" runat="server" DataSourceID="dsCrescimentoSecao" Height="320px" Width="995px" BackColor="Transparent">
                                    <borderoptions visible="False" />
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="-1" color="Gray" gridspacingauto="False">
                                                <range sidemarginsenabled="True" />
                                            </axisx>
                                            <axisy visibleinpanesserializable="-1">
                                                <range sidemarginsenabled="True" />
                                                <gridlines color="192, 192, 192">
                                                    <linestyle dashstyle="Dash" />
                                                </gridlines>
                                            </axisy>
                                            <defaultpane backcolor="Transparent">
                                            </defaultpane>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
                    <FillStyle><OptionsSerializable>
                    <cc1:SolidFillOptions></cc1:SolidFillOptions>
                    </OptionsSerializable>
                    </FillStyle>

                             
                                    <seriesserializable>
                                        <cc1:Series ArgumentDataMember="Ano" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="percCresc">
                                            <viewserializable>
                                                <cc1:SplineSeriesView MarkerVisibility="True" Color="Green">
                                                    <linemarkeroptions size="6"  BorderVisible="True">
                                                    </linemarkeroptions>
                                                </cc1:SplineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel Angle="90" Font="Tahoma, 10pt" LineVisible="True">
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
                        <cc1:SplineSeriesView>
                            <linemarkeroptions  BorderVisible="True">
                            </linemarkeroptions>
                        </cc1:SplineSeriesView>
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
                                <asp:SqlDataSource ID="dsCrescimentoSecao" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspCrescimentoAnual_porSecao" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                        <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Byte" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </dx:PanelContent>
                        </PanelCollection>

                    </dx:ASPxCallbackPanel>
                </div>
              </div>
          </div>

      </div>



        
     <p class="divTitulo">Gráfico de Crescimento por Seção - 36 Meses</p>
        

    <div class="divContainer">

    <div class="floatLeft">
        <uc1:wucListaSecao runat="server" ID="cboSecao36Meses" />
    </div>

    <div class="floatLeft">
        <dx:ASPxComboBox ID="cboTipo" runat="server" EnableTheming="True" Native="True" SelectedIndex="0" Theme="Default" Width="120px">
            <Items>
                <dx:ListEditItem Selected="True" Text="Vendas" Value="1" />
                <dx:ListEditItem Text="Nº de Clientes" Value="2" />
            </Items>
        </dx:ASPxComboBox>
    </div>

    <div class="floatLeft">
        <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cboPanelCrescimentoSecao.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

    <div id="div2">
        <dx:ASPxCallbackPanel ID="cboPanelCrescimentoSecao" runat="server" Width="100%" ClientInstanceName="cboPanelCrescimentoSecao" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>                  

                    
                    <dxchartsui:WebChartControl ID="graficoVendas" runat="server" Height="600px" Width="995px" BackColor="Transparent" DataSourceID="dsGraficoVendas" PaletteName="Apex">
                            <borderoptions visible="False" />
                            <diagramserializable>
                                <cc1:XYDiagram LabelsResolveOverlappingMinIndent="0">
                                    <axisx reverse="True" visibleinpanesserializable="-1">
                                        <label angle="90">
                                        </label>
                                        <range sidemarginsenabled="True" />
                                    </axisx>
                                    <axisy visibleinpanesserializable="-1" visible="False">
                                        <range sidemarginsenabled="True" />
                                        <gridlines>
                                            <linestyle dashstyle="Dash" />
                                        </gridlines>
                                    </axisy>
                                    <secondaryaxesy>
                                        <cc1:SecondaryAxisY AxisID="0" Name="percMargem" Visible="False" VisibleInPanesSerializable="-1">
                                            <range sidemarginsenabled="True" />
                                        </cc1:SecondaryAxisY>
                                        <cc1:SecondaryAxisY AxisID="1" Name="percCrescSecao" Visible="False" VisibleInPanesSerializable="-1">
                                            <range sidemarginsenabled="True" />
                                        </cc1:SecondaryAxisY>
                                    </secondaryaxesy>
                                    <defaultpane backcolor="Transparent" bordervisible="False">
                                    </defaultpane>
                                </cc1:XYDiagram>
                            </diagramserializable>
        <FillStyle><OptionsSerializable>
        <cc1:SolidFillOptions></cc1:SolidFillOptions>
        </OptionsSerializable>
        </FillStyle>

                            <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="5"></legend>
                            <seriesserializable>
                                <cc1:Series ArgumentDataMember="Periodo" ArgumentScaleType="Qualitative" LabelsVisibility="True" Name="Venda" SynchronizePointOptions="False" ValueDataMembersSerializable="percCresc">
                                    <viewserializable>
                                        <cc1:SideBySideBarSeriesView Color="YellowGreen">
                                            <fillstyle fillmode="Solid">
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                        </cc1:SideBySideBarSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:SideBySideBarSeriesLabel Indent="10" LineLength="20" LineVisible="True" Position="BottomInside" ResolveOverlappingMode="Default" TextOrientation="BottomToTop">
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
                                        </cc1:SideBySideBarSeriesLabel>
                                    </labelserializable>
                                    <legendpointoptionsserializable>
                                        <cc1:PointOptions>
                                            <valuenumericoptions format="Number" />
                                        </cc1:PointOptions>
                                    </legendpointoptionsserializable>
                                </cc1:Series>
                                <cc1:Series ArgumentDataMember="Periodo" LabelsVisibility="True" Name="% Margem" SynchronizePointOptions="False" ValueDataMembersSerializable="percMargem">
                                    <viewserializable>
                                        <cc1:LineSeriesView AxisYName="percMargem" Color="DodgerBlue" MarkerVisibility="True">
                                            <linemarkeroptions size="5"  BorderVisible="True">
                                            </linemarkeroptions>
                                        </cc1:LineSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:PointSeriesLabel LineVisible="True" TextOrientation="TopToBottom">
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
                                <cc1:Series ArgumentDataMember="Periodo" LabelsVisibility="True" Name="% Cresc" ValueDataMembersSerializable="percCrescSecao" Visible="False">
                                    <viewserializable>
                                        <cc1:LineSeriesView AxisYName="percCrescSecao" Color="Red" MarkerVisibility="True">
                                            <linemarkeroptions size="5"  BorderVisible="True">
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
                            <seriestemplate>
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
                                            </cc1:PointOptions>
                                        </pointoptionsserializable>
                                    </cc1:SideBySideBarSeriesLabel>
                                </labelserializable>
                                <legendpointoptionsserializable>
                                    <cc1:PointOptions>
                                    </cc1:PointOptions>
                                </legendpointoptionsserializable>
                            </seriestemplate>

        <CrosshairOptions><CommonLabelPositionSerializable>
        <cc1:CrosshairMousePosition></cc1:CrosshairMousePosition>
        </CommonLabelPositionSerializable>
        </CrosshairOptions>

        <ToolTipOptions><ToolTipPositionSerializable>
        <cc1:ToolTipMousePosition></cc1:ToolTipMousePosition>
        </ToolTipPositionSerializable>
        </ToolTipOptions>
                        </dxchartsui:WebChartControl>  

                    <asp:Label ID="Label2" runat="server" Text="Observação: Ultimos 36 meses corridos" Font-Italic="true" ></asp:Label>

                    <asp:SqlDataSource ID="dsGraficoVendas" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspVendas36MesesPorSecao" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Int16" />
                                <asp:SessionParameter Name="idTipo" SessionField="sTIPO" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                  
                    
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>


        </div>



 


<table class="auto-style1">
   
    <tr>
        <td>
                    
                    </td>
        <td>
                    </td>
        <td>
                    <dxchartsui:WebChartControl ID="WebChartControl3" runat="server" DataSourceID="SqlDataSource3" Height="386px" SideBySideEqualBarWidth="True" Width="550px" Visible="False">
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

                        <legend Visibility="False"></legend>
                        <seriesserializable>
                            <cc1:Series ArgumentDataMember="Mes" ArgumentScaleType="Qualitative" LabelsVisibility="True" Name="Series 1" SeriesPointsSorting="Ascending" ValueDataMembersSerializable="percCresc">
                                <viewserializable>
                                    <cc1:SideBySideBarSeriesView ColorEach="True">
                                        <indicators>
                                            <cc1:TrendLine Name="LinhaTendencia">
                                                <point1 argumentserializable="1" />
                                                <point2 argumentserializable="12" />
                                            </cc1:TrendLine>
                                        </indicators>
                                        <financialindicators>
                                            <trendlines>
                                                <cc1:TrendLine Name="LinhaTendencia">
                                                    <point1 argumentserializable="1" />
                                                    <point2 argumentserializable="12" />
                                                </cc1:TrendLine>
                                            </trendlines>
                                        </financialindicators>
                                    </cc1:SideBySideBarSeriesView>
                                </viewserializable>
                                <labelserializable>
                                    <cc1:SideBySideBarSeriesLabel Indent="9" LineVisible="True" Position="TopInside">
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
                                </labelserializable>
                                <legendpointoptionsserializable>
                                    <cc1:PointOptions>
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
                    </td>
    </tr>
    <tr>
        <td>
                    &nbsp;</td>
        <td>
                    &nbsp;</td>
        <td>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" 
                        
                        
                SelectCommand="Analise.uspPercCrescimento" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="3" Name="idFilial" SessionField="sFILIAL" 
                                Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
    </tr>
</table>

