<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Patrimonio/Patrimonio_Preventica_Reativa.master" AutoEventWireup="false" CodeFile="NaturezaAbordagem.aspx.vb" Inherits="MemberPages_Patrimonio_NaturezaAbordagem" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>

<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucAnoMes.ascx" TagPrefix="uc1" TagName="wucAnoMes" %>
<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>




<asp:Content ID="Content2" ContentPlaceHolderID="PatrimonioContent" Runat="Server">


                                    <div id="divFilial" class="BGC_myBorder" style="float:left; margin-left:10px ">
                                        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" Visible_cboCorporacao="false"  />
                                    </div>

                                    <div id="divAno" class="BGC_myBorder" style="float:left; margin-left: 15px; margin-top: -3px ">
                                        <uc1:wucAno runat="server" ID="cboAno" />
                                    </div>

                                    <div id="divMes"  style="float:left; margin-left: 15px; margin-top: -3px ">
                                        <uc1:wuciListaMes runat="server" ID="cboMes" />
                                    </div>

                                        <div class="divBotaoAtualizar" style="float:left ; margin-left: 15px; margin-top: -4px ">
                                            <dx:ASPxButton ID="btnAtualizar_NaturezaAbordagem" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
                                                <ClientSideEvents Click="function(s, e) {cbpPanel_NaturezaAbordagem.PerformCallback();}" />
                                            </dx:ASPxButton>
                                        </div>

                                        <dx:ASPxCallbackPanel ID="cbPanel_NaturezaAbordagem" ClientInstanceName="cbpPanel_NaturezaAbordagem" runat="server" Width="100%" SettingsLoadingPanel-Text="Aguarde. Atualizando" Theme="Metropolis">
<SettingsLoadingPanel Text="Aguarde. Atualizando"></SettingsLoadingPanel>
                                            <PanelCollection>
                                                <dx:PanelContent>
                                        
                         <div id="divDados"  style="clear:both; margin-left: 10px; padding-top: 4px ">   
                                        
                                        <dxchartsui:WebChartControl ID="Graph" runat="server" DataSourceID="dsDados" Height="450px" Width="1000px">
                                            <diagramserializable>
                                                <cc1:XYDiagram>
                                                    <axisx visibleinpanesserializable="-1">
                                                        <label font="Tahoma, 10pt, style=Bold">
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
                                                <cc1:Series ArgumentDataMember="id" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="TotalDeAbordagens">
                                                    <viewserializable>
                                                        <cc1:SideBySideBarSeriesView ColorEach="True">
                                                        </cc1:SideBySideBarSeriesView>
                                                    </viewserializable>
                                                    <labelserializable>
                                                        <cc1:SideBySideBarSeriesLabel Font="Tahoma, 12pt" LineVisible="True">
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
                                                            <valuenumericoptions format="Number" precision="0" />
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
                                                <cc1:ChartTitle Font="Tahoma, 14pt" Indent="1" Text="Natureza Abordagem - Loja" WordWrap="True" />
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
                    
		                                <asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerProjetosConnectionString %>" SelectCommand="Patrimonio.usp_Grfico_ReativaPreventivaTotal" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>   
                                        
                                               

                                            <div id="divInfo">

                                                <p class="bg-warning"><b>Abordagem Reativa =</b> Após da Linha PD</p>                        

                                            </div>

                                            <div id="divInfo1">

                                                <p class="bg-warning"><b>Preventiva =</b> Oferecimento de Cestinha, ajuda, etc, após o Suspeito ter Guardado a Mercadoria em sacola, mochila, bolsa e etc.</p>                        

                                            </div>

                                        </div>


                                                    <div id="div1"  style="clear:both; margin-left: 10px; padding-top: 4px ">   
                                        
                                        <dxchartsui:WebChartControl ID="graph_Natureza_Abordagem_Empresa" runat="server" DataSourceID="ds_Natureza_Abordagem_Empresa" Height="450px" Width="1000px">
                                            <diagramserializable>
                                                <cc1:XYDiagram>
                                                    <axisx visibleinpanesserializable="-1">
                                                        <label font="Tahoma, 10pt, style=Bold">
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
                                                <cc1:Series ArgumentDataMember="id" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="TotalDeAbordagens">
                                                    <viewserializable>
                                                        <cc1:SideBySideBarSeriesView ColorEach="True">
                                                        </cc1:SideBySideBarSeriesView>
                                                    </viewserializable>
                                                    <labelserializable>
                                                        <cc1:SideBySideBarSeriesLabel Font="Tahoma, 12pt" LineVisible="True" TextPattern="{V:n0}">
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
                                                            <valuenumericoptions format="Number" precision="0" />
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
                                                <cc1:ChartTitle Font="Tahoma, 14pt" Indent="1" Text="Natureza Abordagem - Empresa" WordWrap="True" />
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
                    
		                                <asp:SqlDataSource ID="ds_Natureza_Abordagem_Empresa" runat="server" ConnectionString="<%$ ConnectionStrings:gerProjetosConnectionString %>" SelectCommand="Patrimonio.usp_Grfico_ReativaPreventivaTotal_Empresa" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />                  
                                            </SelectParameters>
                                        </asp:SqlDataSource>   
                                        
                                               

                                            <div id="div2">

                                                <p class="bg-warning"><b>Abordagem Reativa =</b> Após da Linha PD</p>                        

                                            </div>

                                            <div id="div3">

                                                <p class="bg-warning"><b>Preventiva =</b> Oferecimento de Cestinha, ajuda, etc, após o Suspeito ter Guardado a Mercadoria em sacola, mochila, bolsa e etc.</p>                        

                                            </div>

                                        </div>


                                        <div class="divDados1">

                                            <dxchartsui:WebChartControl ID="graph_12meses" runat="server" DataSourceID="dsDados12meses" Height="450px" Width="1000px">
                                                <diagramserializable>
                                                    <cc1:XYDiagram>
                                                        <axisx visibleinpanesserializable="-1">
                                                            <label font="Tahoma, 10pt, style=Bold">
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
                                                    <cc1:Series ArgumentDataMember="desMes" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="TotalDeAbordagens">
                                                        <viewserializable>
                                                            <cc1:LineSeriesView MarkerVisibility="True">
                                                                <linemarkeroptions BorderVisible="True">
                                                                </linemarkeroptions>
                                                            </cc1:LineSeriesView>
                                                        </viewserializable>
                                                        <labelserializable>
                                                            <cc1:PointSeriesLabel Font="Tahoma, 12pt" LineVisible="True">
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
                                                    <cc1:ChartTitle Font="Tahoma, 14pt" Indent="1" Text="Total de Abordagens por Mês - Últimos 13 Meses" WordWrap="True" />
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
                    
		                                    <asp:SqlDataSource ID="dsDados12meses" runat="server" ConnectionString="<%$ ConnectionStrings:gerProjetosConnectionString %>" SelectCommand="Patrimonio.usp_Grafico_ReativaPreventivaTotal_12Meses" SelectCommandType="StoredProcedure">
                                                <SelectParameters>                                
                                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>                    


                                        </div>    
                                                    

                                                </dx:PanelContent>
                                            </PanelCollection>
                                        </dx:ASPxCallbackPanel>                                                                                                         


</asp:Content>

