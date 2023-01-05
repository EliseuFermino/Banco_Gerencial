<%@ Page Title="Grafico Analise Acesso Mes por Usuario" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="GraficoAnaliseAcessoAnoMesPorFilial.aspx.vb" Inherits="MemberPages_Manutencao_GraficoAnaliseAcessoAnoMesPorFilial" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>

<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>





<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divNomeUsuario {
            clear: both;
            float : left;
            margin-left: 2px;
            margin-top : 2px;
        }

      #divUsuario {            
            float : left;
            margin-left: 2px;
            margin-top : 2px;
        }

        #divG1 {
            clear: both;
            float : left;
            margin-left: 2px;
            margin-top : 20px;
        }

        #divG2 {
            clear: both;
            float : left;
            margin-left: 2px;
            margin-top : 20px;
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divNomeUsuario">
        Usuario: 
    </div>

    <div id="divUsuario">
        <dx:ASPxComboBox ID="cboUsuario" runat="server" DataSourceID="dsLista" AutoPostBack="False" TextField="Usuario" ValueField="IP" DropDownRows="15" IncrementalFilteringMode="Contains" Width="250px"></dx:ASPxComboBox>
        <asp:SqlDataSource ID="dsLista" runat="server" ConnectionString="<%$ ConnectionStrings:gerContSQL1ConnectionString %>" SelectCommand="Estatistica.uspBuscarListaIP" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="idUsuario" SessionField="sUSUARIO" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
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
                  
                    <div id="divG1">

                        <dxchartsui:WebChartControl ID="grafDia" runat="server" DataSourceID="SqlDataSource2" Height="200px" Width="1000px" BackColor="Transparent" Visible="False">
                            <borderoptions visible="False" />
                            <diagramserializable>
                                <cc1:XYDiagram>
                                    <axisx visibleinpanesserializable="-1">
                                        <label angle="90"></label><range sidemarginsenabled="True" />
                                    </axisx>
                                    <axisy visibleinpanesserializable="-1" visible="False">
                                        <range sidemarginsenabled="True" />
                                        <gridlines visible="False">
                                        </gridlines>
                                        <numericoptions format="Number" precision="0" />
                                    </axisy>
                                    <defaultpane backcolor="Transparent" bordervisible="False">
                                    </defaultpane>
                                </cc1:XYDiagram>
                            </diagramserializable>
                <FillStyle><OptionsSerializable>
                <cc1:SolidFillOptions></cc1:SolidFillOptions>
                </OptionsSerializable>
                </FillStyle>

                            <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" horizontalindent="25" maxverticalpercentage="10" textoffset="9" verticalindent="100" Visibility="False">
                                <margins bottom="0" left="0" right="0" top="0" />
                            </legend>
                            <seriesserializable>
                                <cc1:Series ArgumentDataMember="Dia" LabelsVisibility="True" Name="Serie_Acessos" ValueDataMembersSerializable="Acessos" LegendText="Acessos">
                                    <viewserializable>
                                        <cc1:StackedLineSeriesView Color="CornflowerBlue">
                                            <linemarkeroptions BorderVisible="True">
                                            </linemarkeroptions>
                                        </cc1:StackedLineSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:StackedLineSeriesLabel Angle="90" LineVisible="True">
                                            <fillstyle>
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                            <pointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" precision="0" />
                                                    <valuenumericoptions format="Number" precision="0" />
                                                </cc1:PointOptions>
                                            </pointoptionsserializable>
                                        </cc1:StackedLineSeriesLabel>
                                    </labelserializable>
                                    <legendpointoptionsserializable>
                                        <cc1:PointOptions>
                                            <argumentnumericoptions format="Number" precision="0" />
                                            <valuenumericoptions format="Number" precision="0" />
                                        </cc1:PointOptions>
                                    </legendpointoptionsserializable>
                                </cc1:Series>
                                <cc1:Series ArgumentDataMember="Dia" Name="Series_Media" ValueDataMembersSerializable="MediaAtual">
                                    <viewserializable>
                                        <cc1:AreaSeriesView Color="55, 211, 211, 211" MarkerVisibility="False" Transparency="200">
                                            <markeroptions BorderVisible="False">
                                            </markeroptions>
                                        </cc1:AreaSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:PointSeriesLabel LineVisible="True" TextAlignment="Near">
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
                    <cc1:StackedLineSeriesView MarkerVisibility="True">
                        <linemarkeroptions BorderVisible="True">
                        </linemarkeroptions>
                    </cc1:StackedLineSeriesView>
                </ViewSerializable>
                <LabelSerializable>
                    <cc1:StackedLineSeriesLabel LineVisible="True">
                        <fillstyle>
                            <optionsserializable>
                                <cc1:SolidFillOptions />
                            </optionsserializable>
                        </fillstyle>
                        <pointoptionsserializable>
                            <cc1:PointOptions>
                            </cc1:PointOptions>
                        </pointoptionsserializable>
                    </cc1:StackedLineSeriesLabel>
                </LabelSerializable>
                <LegendPointOptionsSerializable>
                <cc1:PointOptions></cc1:PointOptions>
                </LegendPointOptionsSerializable>
                </SeriesTemplate>

                            <titles>
                                <cc1:ChartTitle Text="Total de Acessos por Dia do Mês Atual por Usuário" />
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

                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:gerContSQL1ConnectionString %>" SelectCommand="Estatistica.vw_AcessosPorDia_Usuario" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Usuario" SessionField="sUSUARIO" Type="String" />
                            </SelectParameters>

                        </asp:SqlDataSource>

                    </div>

                    <div id="divG2">

                        <dxchartsui:WebChartControl ID="grafMes" runat="server" DataSourceID="SqlDataSource1" Height="400px" Width="1000px" Visible="False">
                            <diagramserializable>
                                <cc1:XYDiagram>
                                    <axisx visibleinpanesserializable="-1">
                                        <label angle="90">
                                        </label>
                                        <range sidemarginsenabled="True" />
                                        <gridlines visible="True">
                                        </gridlines>
                                    </axisx>
                                    <axisy visibleinpanesserializable="-1">
                                        <range sidemarginsenabled="True" />
                                        <numericoptions format="Number" precision="0" />
                                    </axisy>
                                    <secondaryaxesy>
                                        <cc1:SecondaryAxisY AxisID="0" Name="Secondary AxisY 1" VisibleInPanesSerializable="-1">
                                            <range auto="False" maxvalueserializable="1000" minvalueserializable="0" sidemarginsenabled="True" />
                                            <numericoptions format="Number" precision="0" />
                                        </cc1:SecondaryAxisY>
                                    </secondaryaxesy>
                                </cc1:XYDiagram>
                            </diagramserializable>
                <FillStyle><OptionsSerializable>
                <cc1:SolidFillOptions></cc1:SolidFillOptions>
                </OptionsSerializable>
                </FillStyle>

                            <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" horizontalindent="25" maxverticalpercentage="10" textoffset="9" verticalindent="100">
                                <margins bottom="0" left="0" right="0" top="0" />
                            </legend>
                            <seriesserializable>
                                <cc1:Series ArgumentDataMember="Ano" LabelsVisibility="True" Name="Serie_Acessos" ValueDataMembersSerializable="Acessos" LegendText="Acessos">
                                    <viewserializable>
                                        <cc1:StackedLineSeriesView>
                                            <linemarkeroptions BorderVisible="True">
                                            </linemarkeroptions>
                                        </cc1:StackedLineSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:StackedLineSeriesLabel Angle="90" LineVisible="True">
                                            <fillstyle>
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                            <pointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" precision="0" />
                                                    <valuenumericoptions format="Number" precision="0" />
                                                </cc1:PointOptions>
                                            </pointoptionsserializable>
                                        </cc1:StackedLineSeriesLabel>
                                    </labelserializable>
                                    <legendpointoptionsserializable>
                                        <cc1:PointOptions>
                                            <argumentnumericoptions format="Number" precision="0" />
                                            <valuenumericoptions format="Number" precision="0" />
                                        </cc1:PointOptions>
                                    </legendpointoptionsserializable>
                                </cc1:Series>
                                <cc1:Series ArgumentDataMember="Ano" LabelsVisibility="True" Name="Serie_MediaAcessoDia" ValueDataMembersSerializable="MediaAcessoDia" LegendText="Média de Acesso Dia">
                                    <viewserializable>
                                        <cc1:SplineAreaSeriesView AxisYName="Secondary AxisY 1" MarkerVisibility="True">
                                            <markeroptions size="4"  BorderVisible="True">
                                            </markeroptions>
                                        </cc1:SplineAreaSeriesView>
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
                                                    <argumentnumericoptions format="Number" precision="0" />
                                                    <valuenumericoptions format="Number" precision="0" />
                                                </cc1:PointOptions>
                                            </pointoptionsserializable>
                                        </cc1:PointSeriesLabel>
                                    </labelserializable>
                                    <legendpointoptionsserializable>
                                        <cc1:PointOptions>
                                            <argumentnumericoptions format="Number" precision="0" />
                                            <valuenumericoptions format="Number" precision="0" />
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

                            <titles>
                                <cc1:ChartTitle Text="Total de Acesso por Ano e Mês por Usuário" />
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

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerContSQL1ConnectionString %>" SelectCommand="Estatistica.vw_AcessosPorAnoMes_Usuario" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Usuario" SessionField="sUSUARIO" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </div>


                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>






</asp:Content>

