<%@ Control Language="VB" AutoEventWireup="false" CodeFile="graficoCrescimento_Paste.ascx.vb" Inherits="Controles_graficoCrescimento" %>
<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<%@ Register assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>

<%@ Register src="wuciListaLojasComApoio.ascx" tagname="wuciListaLojasComApoio" tagprefix="uc1" %>

<%@ Register src="wucListaLojasComCorporacao.ascx" tagname="wucListaLojasComCorporacao" tagprefix="uc2" %>
<%@ Register Src="~/Controles/wucListaSecao.ascx" TagPrefix="uc1" TagName="wucListaSecao" %>


<style type="text/css">
               
        html {            
                overflow-x:hidden;            
            }

        #moldura {
                width:1024px; 
                margin: 0 auto ;                      
            }

        #divFilial {
            float: left;
            width: 330px;
            padding-left: 2px;
        }

        #divBotaoAtualizar {
            float: left;
            padding-left: 3px;
            padding-top: 2px;
        }

    #divTituloCrescimento {
        clear:both;
        float :left;
        font-size: 24px;
        align-content :center;
        width: 1005px;
        text-align: center;
        color: #808080;
    }

    #divTituloEmpresa {
        clear:both;
        float :left;
        font-size: 18px;        
        width: 222px;
        text-align: center;
    }

    #divTituloSuperHiper {
        clear:both;
        float :left;
        font-size: 18px;
        align-content :center;
        width: 223px;
        text-align: center;
    }

    #divCresimentoAno {
            clear:both;
            float: left;
            margin-left: -8px;

        }

    #divCrescimentoEmpresa {
        clear:both;        
        font-size: 24px;
        align-content :center ;
    }

    #divCrescimentoSuperHiper {  
        clear:both;             
        font-size: 24px;
        align-content :center ;
    }

   #divMolduraEmpresaTotal {
        clear: both;
        float: left;
        border: 1px solid gray;
        border-radius: 5px;
        padding: 5px;
        margin-top: 15px;
        width: 485px;
        margin-left: 2px;
    }

    #divTituloEmpresaTotal {
        text-align: center;
        font-size: 20px;
        font-weight: bold;
    }

    #divMolduraEmpresa {
        
       float: left;
        border: 1px solid gray;
        border-radius: 5px;
        padding: 5px;
        margin-top: 8px;
    }

    #divMolduraSuperHiper {         
       float :left ;
        border: 1px solid gray;
        border-radius: 5px;
        padding: 5px;
        margin-top: 8px;
        margin-left: 7px;
    }

   #divMolduraMesmasLojas {          
        float: right;
        border: 1px solid gray;
        border-radius: 5px;
        padding: 5px;
        margin-top: 15px;  
        width: 485px;         
        height: 273px;
        margin-right: 7px;
    }

    #divTituloMesmasLojas {
        text-align: center;
        font-size: 20px;
        font-weight: bold;
    }

    #divCrescimentoEmpresaMesmas {
        
       float: left;
        border: 1px solid gray;
        border-radius: 5px;
        padding: 5px;
        margin-top: 8px;
        height: 225px;
    }

   #divMolduraSuperHiperMesmas {
        
       float: left;
        border: 1px solid gray;
        border-radius: 5px;
        padding: 5px;
        margin-top: 8px;
        margin-left: 6px;
        height: 225px;
    }

    #divMolduraEmpresaMesmas {        
        float :left ;
        font-size: 18px;
        width: 222px;
        text-align: center;
    }

    #divTituloSuperHiperMesmas {         
        float :left ;
        font-size: 18px;
        width: 223px;
        text-align: center;        
    }

    /* ---------------------  Parte do Departamento ---------------------------- */

    #divTituloPorDepartamento {  
        clear: both ;       
        float :left ;
        font-size: 24px;
        width: 1024px;
        text-align: center; 
        padding-top: 20px;       
    }

    #divContainerDepartamento {
        clear :both ;
       float: left;
        border: 1px solid gray;
        border-radius: 5px;
        padding: 5px;
        margin-top: 8px;
        height: 140px;
        width: 990px;
      
    }

    #divGrafico_Depto1 {
        clear: both;
        float: left;
    }

    #divGrafico_Depto2 {        
        float: left;
    }

    #divGrafico_Depto3 {        
        float: left;
    }

    #divGrafico_Depto4 {        
        float: left;
    }

    #divGrafico_Depto5 {        
        float: left;
    }
    
    #divTituloEmpresaSuperHiper {  
        clear: both ;       
        float :left ;
        font-size: 24px;
        width: 1024px;
        text-align: center;  
        padding-top: 30px;      
    }


    /*  -----------  Parte da Seção --------------------------------------------*/

    #divTituloPorSecao {  
        clear: both ;       
        float :left ;
        font-size: 24px;
        width: 1024px;
        text-align: center; 
        padding-top: 20px;       
    }

   #divContainerSecao {
        clear :both ;
        float: left;
        border: 1px solid gray;
        border-radius: 5px;
        padding: 5px;
        margin-top: 8px;
        height: 340px;
        width: 990px;
      
    }

    /*#divCboSecao {
        clear: both;
        float: left;
        width: 100px;
    }*/

    #divBotaoAtualizarSecao {
        float: left;
        padding-left: 5px;
    }
</style>

  <div id="moldura">
        
      <div id="divFilial">
          <uc2:wucListaLojasComCorporacao ID="cboFilial" runat="server" />
      </div>

      <div id="divBotaoAtuaizar">
          <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis" >
              <ClientSideEvents Click="function(s, e) {	cbPanel.PerformCallback();}" />
          </dx:ASPxButton>
      </div>

      <div id="divDados">
          <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="1010px" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde...">
              <PanelCollection>
                  <dx:PanelContent runat="server" SuportsDisabledAttributes="both">

                      <div id="divTituloCrescimento">
                          Grafico de Crescimento da Vendas
                      </div>
      
                      <div id="divCresimentoAno">
                          <dxchartsui:WebChartControl ID="graficoCrescimento" runat="server" DataSourceID="dsCrescimento" Height="350px" Width="1020px" BackColor="Transparent">
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

                              <legend Visibility="False"></legend>
                              <seriesserializable>
                                  <cc1:Series ArgumentDataMember="Ano" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="percCresc">
                                      <viewserializable>
                                          <cc1:SplineSeriesView MarkerVisibility="True">
                                              <linemarkeroptions size="6" BorderVisible="True">
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
                        <linemarkeroptions BorderVisible="True">
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

                      <div id="divTituloPorDepartamento">
                          Gráfico de Crescimento por Departamento
                      </div>

                      <div id="divContainerDepartamento">
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

                              <legend Visibility="False"></legend>
                              <seriesserializable>
                                  <cc1:Series ArgumentDataMember="Ano" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="percCresc">
                                      <viewserializable>
                                          <cc1:SplineSeriesView MarkerVisibility="True" Color="0, 192, 0">
                                              <linemarkeroptions size="6" BorderVisible="True">
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
                        <linemarkeroptions BorderVisible="True">
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

                          <div id="divGrafico_Depto2">
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

                              <legend Visibility="False"></legend>
                              <seriesserializable>
                                  <cc1:Series ArgumentDataMember="Ano" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="percCresc">
                                      <viewserializable>
                                          <cc1:SplineSeriesView MarkerVisibility="True" Color="192, 0, 192">
                                              <linemarkeroptions size="6" BorderVisible="True">
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
                        <linemarkeroptions BorderVisible="True">
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

                          <div id="divGrafico_Depto3">
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

                              <legend Visibility="False"></legend>
                              <seriesserializable>
                                  <cc1:Series ArgumentDataMember="Ano" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="percCresc">
                                      <viewserializable>
                                          <cc1:SplineSeriesView MarkerVisibility="True" Color="Chocolate">
                                              <linemarkeroptions size="6" BorderVisible="True">
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
                        <linemarkeroptions BorderVisible="True">
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

                          <div id="divGrafico_Depto4">
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

                              <legend Visibility="False"></legend>
                              <seriesserializable>
                                  <cc1:Series ArgumentDataMember="Ano" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="percCresc">
                                      <viewserializable>
                                          <cc1:SplineSeriesView MarkerVisibility="True" Color="DeepSkyBlue">
                                              <linemarkeroptions size="6" BorderVisible="True">
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
                        <linemarkeroptions BorderVisible="True">
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

                          <div id="divGrafico_Depto5">
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

                              <legend Visibility="False"></legend>
                              <seriesserializable>
                                  <cc1:Series ArgumentDataMember="Ano" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="percCresc">
                                      <viewserializable>
                                          <cc1:SplineSeriesView MarkerVisibility="True" Color="DarkKhaki">
                                              <linemarkeroptions size="6" BorderVisible="True">
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
                        <linemarkeroptions BorderVisible="True">
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

                      <%--Aqui Começa por Empresa e Região--%>

                      <div id="divTituloEmpresaSuperHiper">
                          Gráfico de Crescimento por Empresa, Super, Hiper e Super E
                      </div>

                      <div id="divMolduraEmpresaTotal">

                          <div id="divTituloEmpresaTotal">
                              Empresa Todas as Lojas
                          </div>                          

                          <div id="divMolduraEmpresa">

                              <div id="divTituloEmpresa">
                                  Empresa - Últimos 4 Anos
                              </div>

                              <div id="divCrescimentoEmpresa">
                                    <dxchartsui:WebChartControl ID="WebChartControl1" runat="server" Height="200px" Width="227px" 
                        AppearanceNameSerializable="Dark Flat" BackColor="Transparent" 
                        PaletteName="Civic" DataSourceID="dsEmpresa">
                                <borderoptions visible="False" />
                                <diagramserializable>
                                    <cc1:XYDiagram>
                                        <axisx visibleinpanesserializable="-1" color="Gray">
                                            <label font="Tahoma, 10pt" textcolor="Gray">
                                            </label>
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

                                <legend Visibility="False"></legend>

                                <seriesserializable>
                                    <cc1:Series ArgumentDataMember="Ano" Name="Series 1" 
                                        ValueDataMembersSerializable="percCresc" LabelsVisibility="True" SeriesID="0">
                                        <viewserializable>
                                            <cc1:SideBySideBarSeriesView ColorEach="True">
                                                <shadow color="224, 224, 224" visible="True" />
                                            </cc1:SideBySideBarSeriesView>
                                        </viewserializable>
                                        <labelserializable>
                                            <cc1:SideBySideBarSeriesLabel LineVisible="True" EnableAntialiasing="True" 
                                                Font="Tahoma, 14pt, style=Bold" Position="TopInside" 
                                                TextOrientation="TopToBottom">
                                                <fillstyle>
                                                    <optionsserializable>
                                                        <cc1:SolidFillOptions />
                                                    </optionsserializable>
                                                </fillstyle>
                                                <pointoptionsserializable>
                                                    <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" /><valuenumericoptions format="Number" /></cc1:PointOptions>
                                                </pointoptionsserializable>
                                            </cc1:SideBySideBarSeriesLabel>
                                        </labelserializable>
                                        <legendpointoptionsserializable>
                                            <cc1:PointOptions>
                                            <argumentnumericoptions format="Number" /><valuenumericoptions format="Number" /></cc1:PointOptions>
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
                                    <asp:SqlDataSource ID="dsEmpresa" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspCrescimentoAnual_Empresa" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                              </div>

                          </div>

                          <div id="divMolduraSuperHiper">

                              <div id="divTituloSuperHiper">
                                  <asp:Label ID="lblSuperHiperSuperET" runat="server" Text="Super"></asp:Label>  
                              </div>

                              <div id="divCrescimentoSuperHiper">
                                   <dxchartsui:WebChartControl ID="graficoCrescimentoSuperHiper" runat="server" Height="200px" Width="227px" 
                        AppearanceNameSerializable="Dark Flat" BackColor="Transparent" 
                        PaletteName="Civic" DataSourceID="dsSuperHiper">
                                <borderoptions visible="False" />
                                <diagramserializable>
                                    <cc1:XYDiagram>
                                        <axisx visibleinpanesserializable="-1" color="Gray">
                                            <label font="Tahoma, 10pt" textcolor="Gray">
                                            </label>
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

                                <legend Visibility="False"></legend>

                                <seriesserializable>
                                    <cc1:Series ArgumentDataMember="Ano" Name="Series 1" 
                                        ValueDataMembersSerializable="percCresc" LabelsVisibility="True" SeriesID="0">
                                        <viewserializable>
                                            <cc1:SideBySideBarSeriesView ColorEach="True">
                                                <shadow color="224, 224, 224" visible="True" />
                                            </cc1:SideBySideBarSeriesView>
                                        </viewserializable>
                                        <labelserializable>
                                            <cc1:SideBySideBarSeriesLabel LineVisible="True" EnableAntialiasing="True" 
                                                Font="Tahoma, 14pt, style=Bold" Position="TopInside" 
                                                TextOrientation="TopToBottom">
                                                <fillstyle>
                                                    <optionsserializable>
                                                        <cc1:SolidFillOptions />
                                                    </optionsserializable>
                                                </fillstyle>
                                                <pointoptionsserializable>
                                                    <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" /><valuenumericoptions format="Number" /></cc1:PointOptions>
                                                </pointoptionsserializable>
                                            </cc1:SideBySideBarSeriesLabel>
                                        </labelserializable>
                                        <legendpointoptionsserializable>
                                            <cc1:PointOptions>
                                            <argumentnumericoptions format="Number" /><valuenumericoptions format="Number" /></cc1:PointOptions>
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
                                    <asp:SqlDataSource ID="dsSuperHiper" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspCrescimentoAnual_SuperHiper" SelectCommandType="StoredProcedure">
                                          <SelectParameters>
                                              <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                          </SelectParameters>
                                    </asp:SqlDataSource>
                            
                              </div>
                          </div>
                      </div>

                      <div id="divMolduraMesmasLojas">

                          <div id="divTituloMesmasLojas">
                              Empresa Mesmas Lojas
                          </div>                          

                          <div id="divCrescimentoEmpresaMesmas">

                              <div id="divMolduraEmpresaMesmas">
                                  Empresa - Últimos 4 Anos
                              </div>

                              <div id="divTituloEmpresaMesmas">
                                    <dxchartsui:WebChartControl ID="WebChartControl2" runat="server" Height="200px" Width="227px" 
                        AppearanceNameSerializable="Dark Flat" BackColor="Transparent" 
                        PaletteName="Civic" DataSourceID="dsEmpresaMesmas">
                                <borderoptions visible="False" />
                                <diagramserializable>
                                    <cc1:XYDiagram>
                                        <axisx visibleinpanesserializable="-1" color="Gray">
                                            <label font="Tahoma, 10pt" textcolor="Gray">
                                            </label>
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

                                <legend Visibility="False"></legend>

                                <seriesserializable>
                                    <cc1:Series ArgumentDataMember="Ano" Name="Series 1" 
                                        ValueDataMembersSerializable="percCresc" LabelsVisibility="True" SeriesID="0">
                                        <viewserializable>
                                            <cc1:SideBySideBarSeriesView ColorEach="True">
                                                <shadow color="224, 224, 224" visible="True" />
                                            </cc1:SideBySideBarSeriesView>
                                        </viewserializable>
                                        <labelserializable>
                                            <cc1:SideBySideBarSeriesLabel LineVisible="True" EnableAntialiasing="True" 
                                                Font="Tahoma, 14pt, style=Bold" Position="TopInside" 
                                                TextOrientation="TopToBottom">
                                                <fillstyle>
                                                    <optionsserializable>
                                                        <cc1:SolidFillOptions />
                                                    </optionsserializable>
                                                </fillstyle>
                                                <pointoptionsserializable>
                                                    <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" /><valuenumericoptions format="Number" /></cc1:PointOptions>
                                                </pointoptionsserializable>
                                            </cc1:SideBySideBarSeriesLabel>
                                        </labelserializable>
                                        <legendpointoptionsserializable>
                                            <cc1:PointOptions>
                                            <argumentnumericoptions format="Number" /><valuenumericoptions format="Number" /></cc1:PointOptions>
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
                                    <asp:SqlDataSource ID="dsEmpresaMesmas" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspCrescimentoAnual_Empresa_MesmasLojas" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                              </div>

                          </div>

                          <div id="divMolduraSuperHiperMesmas">

                              <div id="divTituloSuperHiperMesmas">
                                  <asp:Label ID="lblSuperHiperSuperE" runat="server" Text="Super"></asp:Label>
                              </div>

                              <div id="divCrescimentoSuperHiperMesmas">
                                   <dxchartsui:WebChartControl ID="WebChartControl4" runat="server" Height="200px" Width="227px" 
                        AppearanceNameSerializable="Dark Flat" BackColor="Transparent" 
                        PaletteName="Civic" DataSourceID="dsSuperHiperMesmas">
                                <borderoptions visible="False" />
                                <diagramserializable>
                                    <cc1:XYDiagram>
                                        <axisx visibleinpanesserializable="-1" color="Gray">
                                            <label font="Tahoma, 10pt" textcolor="Gray">
                                            </label>
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

                                <legend Visibility="False"></legend>

                                <seriesserializable>
                                    <cc1:Series ArgumentDataMember="Ano" Name="Series 1" 
                                        ValueDataMembersSerializable="percCresc" LabelsVisibility="True" SeriesID="0">
                                        <viewserializable>
                                            <cc1:SideBySideBarSeriesView ColorEach="True">
                                                <shadow color="224, 224, 224" visible="True" />
                                            </cc1:SideBySideBarSeriesView>
                                        </viewserializable>
                                        <labelserializable>
                                            <cc1:SideBySideBarSeriesLabel LineVisible="True" EnableAntialiasing="True" 
                                                Font="Tahoma, 14pt, style=Bold" Position="TopInside" 
                                                TextOrientation="TopToBottom">
                                                <fillstyle>
                                                    <optionsserializable>
                                                        <cc1:SolidFillOptions />
                                                    </optionsserializable>
                                                </fillstyle>
                                                <pointoptionsserializable>
                                                    <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" /><valuenumericoptions format="Number" /></cc1:PointOptions>
                                                </pointoptionsserializable>
                                            </cc1:SideBySideBarSeriesLabel>
                                        </labelserializable>
                                        <legendpointoptionsserializable>
                                            <cc1:PointOptions>
                                            <argumentnumericoptions format="Number" /><valuenumericoptions format="Number" /></cc1:PointOptions>
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
                                    <asp:SqlDataSource ID="dsSuperHiperMesmas" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspCrescimentoAnual_SuperHiper_MesmasLojas" SelectCommandType="StoredProcedure">
                                          <SelectParameters>
                                              <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                          </SelectParameters>
                                    </asp:SqlDataSource>
                            
                              </div>
                          </div>
                      </div>                      

                  </dx:PanelContent>
              </PanelCollection>
          </dx:ASPxCallbackPanel>
          
      </div>

      <div id="divSecao">

        <div id="divTituloPorSecao">
            Gráfico de Crescimento por Seção
        </div>

        <div id="divContainerSecao">
              <div id="divCboSecao">
                  <uc1:wucListaSecao runat="server" ID="cboSecao" />
              </div>

              <div id="divBotaoAtualizarSecao">
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

                                    <legend Visibility="False"></legend>
                                    <seriesserializable>
                                        <cc1:Series ArgumentDataMember="Ano" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="percCresc">
                                            <viewserializable>
                                                <cc1:SplineSeriesView MarkerVisibility="True" Color="Green">
                                                    <linemarkeroptions size="6" BorderVisible="True">
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
                            <linemarkeroptions BorderVisible="True">
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
                                    <label begintext="Mês ">
                                    </label>
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

