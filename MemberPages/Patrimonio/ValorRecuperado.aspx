    <%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Patrimonio/Patrimonio_Preventica_Reativa.master" AutoEventWireup="false" CodeFile="ValorRecuperado.aspx.vb" Inherits="MemberPages_Patrimonio_ValorRecuperado" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>

<%@ Register Src="~/Controles/wucAnoMes.ascx" TagPrefix="uc1" TagName="wucAnoMes" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>
<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>




<asp:Content ID="Content2" ContentPlaceHolderID="PatrimonioContent" Runat="Server">

    <div id="div1" class="divFilial BGC_myBorder " style="float:left; margin-left:10px ">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" Visible_cboCorporacao="false"  />
    </div>

    <div id="divAno" class="BGC_myBorder " style="float:left; margin-left: 15px; margin-top: -3px ">
        <uc1:wucAno runat="server" ID="cboAno" />
    </div>

    <div id="divMes" style="float:left; margin-left: 15px; margin-top: -3px ">
        <uc1:wuciListaMes runat="server" ID="cboMes" />
    </div>

    <div class="divBotaoAtualizar" style="float:left ; margin-left: 15px; margin-top: -4px ">
        <dx:ASPxButton ID="btnAtualizar_ValorRecuperado" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbpPanel_ValorRecuperado.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

                              <div class="divDados1" style="clear:both; margin-left: 10px; padding-top: 4px ">

                                        <dx:ASPxCallbackPanel ID="cbpPanel_ValorRecuperado" ClientInstanceName="cbpPanel_ValorRecuperado" runat="server" Width="100%" SettingsLoadingPanel-Text="Aguarde. Atualizando" Theme="Metropolis">
<SettingsLoadingPanel Text="Aguarde. Atualizando"></SettingsLoadingPanel>
                                            <PanelCollection>
                                                <dx:PanelContent>

                                        

                                            <dxchartsui:WebChartControl ID="graph_ValorRecuperado_porFilial" runat="server" DataSourceID="dsValorRecuperadoFilial" Height="450px" Width="1400px">
                                                <diagramserializable>
                                                    <cc1:XYDiagram>
                                                        <axisx visibleinpanesserializable="-1" minorcount="1">
                                                            <qualitativescaleoptions autogrid="False" gridoffset="1" GridSpacing="0.5" />
                                                            <tickmarks minorvisible="False" />
                                                            <label angle="90">
                                                            </label>
                                                            <range sidemarginsenabled="True" />
                                                            <numericscaleoptions gridoffset="1" />
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
                                                    <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="vlrTotalRecuperado" ArgumentScaleType="Qualitative">
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
                                                    <cc1:ChartTitle Font="Tahoma, 14pt" Indent="1" Text="Valor Recuperado por Mês " WordWrap="True" />
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
                    
		                                    <asp:SqlDataSource ID="dsValorRecuperadoFilial" runat="server" ConnectionString="<%$ ConnectionStrings:gerProjetosConnectionString %>" SelectCommand="Patrimonio.usp_TotalValorRecuperadoPorFilial" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />                            
                                                </SelectParameters>
                                            </asp:SqlDataSource>                    

                                            
                                        
                                        <br />

                                        

                                            <dxchartsui:WebChartControl ID="graph_ValorRecuperado" runat="server" DataSourceID="dsValorRecuperado" Height="450px" Width="1400px">
                                                <diagramserializable>
                                                    <cc1:XYDiagram>
                                                        <axisx visibleinpanesserializable="-1" minorcount="1" title-font="Tahoma, 8.25pt" title-visibility="Default" visibility="True">
                                                            <qualitativescaleoptions autogrid="False" gridoffset="1" />
                                                            <tickmarks minorlength="1" visible="False" />
                                                            <label angle="90" enableantialiasing="False" font="Tahoma, 8.25pt">
                                                            <resolveoverlappingoptions minindent="1" />
                                                            </label>
                                                            <range sidemarginsenabled="True" />
                                                            <wholerange autosidemargins="False" sidemarginsvalue="1" />
                                                            <numericscaleoptions autogrid="False" />
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
                                                    <cc1:Series ArgumentDataMember="Descricao" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="vlrTotalRecuperado">
                                                        <viewserializable>
                                                            <cc1:SideBySideBarSeriesView ColorEach="True">
                                                            </cc1:SideBySideBarSeriesView>
                                                        </viewserializable>
                                                        <labelserializable>
                                                            <cc1:SideBySideBarSeriesLabel Font="Tahoma, 8.25pt" LineVisible="True" TextOrientation="BottomToTop" Indent="0" TextPattern="{V:n0}">
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
                                                    <cc1:ChartTitle Font="Tahoma, 14pt" Indent="1" Text="Valor Recuperado no Mês - por Loja " WordWrap="True" />
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
                                                    
                                                    
		                                    <asp:SqlDataSource ID="dsValorRecuperado" runat="server" ConnectionString="<%$ ConnectionStrings:gerProjetosConnectionString %>" SelectCommand="Patrimonio.usp_TotalValorRecuperado" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />                            
                                                </SelectParameters>
                                            </asp:SqlDataSource>                    

                                            <h4>&nbsp;</h4>

                                                    <p>
                                                        &nbsp;</p>
                                                    <h4><b>
                                                        <asp:Label ID="lblTotalRecuperadoEmpresa" runat="server"></asp:Label>
                                                        </b></h4>

                                        </div>



                                                </dx:PanelContent>
                                            </PanelCollection>
                                        </dx:ASPxCallbackPanel>  

    <uc1:wucObsPrograma runat="server" ID="wucObsPrograma"  Anotacao1="Servidor 10.1.1.14    Banco: gerProjetos" Anotacao2="Stored Procedure: Patrimonio.usp_TotalValorRecuperadoPorFilial"/>

    </asp:Content>

