<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="graficoPreventivaReativa.aspx.vb" Inherits="MemberPages_Patrimonio_graficoPreventivaReativa" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>








<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>

<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>
<%@ Register Src="~/Controles/wucAnoMes.ascx" TagPrefix="uc1" TagName="wucAnoMes" %>



<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>
<%@ Register Src="~/Controles/wucLista_Filial_Empresa.ascx" TagPrefix="uc1" TagName="wucLista_Filial_Empresa" %>





<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >
        
        .divFilial {            
            float: left;
            margin-left: 10px;
            margin-top: 3px;
        }

        .divPeriodo {
            float: left;
            margin-left: 20px;
        }

        .divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
            margin-bottom: 2px;
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 10px;
        }

        .divDados1 {
            clear: both;
            float: left;
            margin-left: 10px;
            padding-top: 10px;
        }

        #divDados_Tabela {
            float: left;
            margin-left: 10px;
        }

        #divInfo {
            clear: both;
            float: left;
            margin-left: 10px;
            margin-top: 10px;
        }

        #divInfo1 {            
            float: left;
            margin-left: 40px;
            margin-top: 10px;
        }

        #divGraphAcumulado {
            float: left;
            margin-left: 10px;
            margin-top: 10px;
            
        }

        #divDados_Grafico{
            clear:both;
            margin-left: 5px;
        }

        #divDia_Produto_Furto_Degustacao {
            
            float: left;
            margin-left: 10px;
            margin-top: 4px;
        }


    </style>

    <%--<link href="../../css/bootstrap.min.css" rel="stylesheet" />--%>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
   



<%--    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>--%>

   <div id="divDados_Grafico">


                    <dx:ASPxPageControl ID="aspxPanel" runat="server" ActiveTabIndex="4" Theme="SoftOrange">                        

                        <TabPages>
                            <dx:TabPage Text="Empresa">
                                <contentcollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">

                                        <div id="divPeriodoEmpresa">
                                            <uc1:wucAnoMes runat="server" ID="cboPeriodoEmpresa" />
                                        </div>

                                        <div class="divBotaoAtualizar">
                                            <dx:ASPxButton ID="btnAtualizarEmpresa" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
                                                <ClientSideEvents Click="function(s, e) {cbpPanel_Empresa.PerformCallback();}" />
                                            </dx:ASPxButton>
                                        </div>

                                        <dx:ASPxCallbackPanel ID="cbPanel_Empresa" ClientInstanceName="cbpPanel_Empresa" runat="server" Width="100%" SettingsLoadingPanel-Text="Aguarde. Atualizando" Theme="Metropolis">
                                            <PanelCollection>
                                                <dx:PanelContent>



                                        <dxchartsui:WebChartControl ID="graph_ValorRecuperado_Empresa_Periodo" runat="server" BackColor="#FFFFC0" DataSourceID="dsValorRecuperado_Empresa_Periodo" Height="450px" Width="1000px">
                                            <diagramserializable>
                                                <cc1:XYDiagram>
                                                    <axisx visibleinpanesserializable="-1">
                                                        <label angle="90">
                                                        </label>
                                                        <range sidemarginsenabled="True" />
                                                    </axisx>
                                                    <axisy visible="False" visibleinpanesserializable="-1">
                                                        <range sidemarginsenabled="True" />
                                                    </axisy>
                                                    <defaultpane backcolor="255, 255, 192">
                                                    </defaultpane>
                                                </cc1:XYDiagram>
                                            </diagramserializable>
                                            <fillstyle>
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                            <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="7" visible="False"></legend>
                                            <seriesserializable>
                                                <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="vlrTotalRecuperado">
                                                    <viewserializable>
                                                        <cc1:LineSeriesView ColorEach="True" MarkerVisibility="True">
                                                            <linemarkeroptions BorderVisible="True">
                                                            </linemarkeroptions>
                                                        </cc1:LineSeriesView>
                                                    </viewserializable>
                                                    <labelserializable>
                                                        <cc1:PointSeriesLabel Font="Tahoma, 9pt" LineVisible="True" TextOrientation="BottomToTop">
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
                                                        </cc1:PointSeriesLabel>
                                                    </labelserializable>
                                                    <legendpointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <valuenumericoptions format="Currency" precision="0" />
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
                                            <titles>
                                                <cc1:ChartTitle Font="Tahoma, 14pt" Indent="1" Text="Valor Recuperado por Mês - Empresa " WordWrap="True" />
                                            </titles>
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
                                        <asp:SqlDataSource ID="dsValorRecuperado_Empresa_Periodo" runat="server" ConnectionString="<%$ ConnectionStrings:gerProjetosConnectionString %>" SelectCommand="Patrimonio.usp_TotalValorRecuperadoPorFilial" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                                <asp:SessionParameter DefaultValue="99" Name="idFilial" Type="Byte" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                        <br />
                                        <br />
                                                                                            
                                        <br />
                                                    
                                        <dxchartsui:WebChartControl ID="graph_Total_Furto_Degustacao_daEMPRESA" runat="server" BackColor="#FFFFC0" DataSourceID="dsTotal_Furto_Degustacao_daEMPRESA" Height="450px" Width="1000px">
                                            <diagramserializable>
                                                <cc1:XYDiagram>
                                                    <axisx visibleinpanesserializable="-1">
                                                        <label angle="90">
                                                        </label>
                                                        <range sidemarginsenabled="True" />
                                                    </axisx>
                                                    <axisy visible="False" visibleinpanesserializable="-1">
                                                        <range sidemarginsenabled="True" />
                                                    </axisy>
                                                    <defaultpane backcolor="255, 255, 192">
                                                    </defaultpane>
                                                </cc1:XYDiagram>
                                            </diagramserializable>
                                            <fillstyle>
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                            <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="7" visible="False"></legend>
                                            <seriesserializable>
                                                <cc1:Series ArgumentDataMember="Descricao" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="vlrTotal">
                                                    <viewserializable>
                                                        <cc1:SideBySideBarSeriesView ColorEach="True">
                                                        </cc1:SideBySideBarSeriesView>
                                                    </viewserializable>
                                                    <labelserializable>
                                                        <cc1:SideBySideBarSeriesLabel Font="Tahoma, 9pt" LineVisible="True" TextOrientation="BottomToTop">
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
                                            <titles>
                                                <cc1:ChartTitle Font="Tahoma, 14pt" Indent="1" Text="Furto e Degustação da EMPRESA - Mês" WordWrap="True" />
                                            </titles>
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
                                        <asp:SqlDataSource ID="dsTotal_Furto_Degustacao_daEMPRESA" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="Analises.usp_Total_Furto_Degustacao_daEMPRESA" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        <b>
                                        <asp:Label ID="Label5" runat="server"></asp:Label>
                                        </b>

                                        <br />

                                        <dxchartsui:WebChartControl ID="graph_Total_Furto_Degustacao_daEMPRESA_13_Mes" runat="server" BackColor="#FFFFC0" DataSourceID="dsValorRecuperadoEmpresa_13_Mes" Height="450px" Width="1000px">
                                            <diagramserializable>
                                                <cc1:XYDiagram>
                                                    <axisx visibleinpanesserializable="-1">
                                                        <label angle="90">
                                                        </label>
                                                        <range sidemarginsenabled="True" />
                                                    </axisx>
                                                    <axisy visible="False" visibleinpanesserializable="-1">
                                                        <range sidemarginsenabled="True" />
                                                    </axisy>
                                                    <defaultpane backcolor="255, 255, 192">
                                                    </defaultpane>
                                                </cc1:XYDiagram>
                                            </diagramserializable>
                                            <fillstyle>
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                            <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="7" visible="False"></legend>
                                            <seriesserializable>
                                                <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="vlrTotal">
                                                    <viewserializable>
                                                        <cc1:LineSeriesView ColorEach="True" MarkerVisibility="True">
                                                            <linemarkeroptions BorderVisible="True">
                                                            </linemarkeroptions>
                                                        </cc1:LineSeriesView>
                                                    </viewserializable>
                                                    <labelserializable>
                                                        <cc1:PointSeriesLabel Font="Tahoma, 9pt" LineVisible="True" TextOrientation="BottomToTop">
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
                                                        </cc1:PointSeriesLabel>
                                                    </labelserializable>
                                                    <legendpointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <valuenumericoptions format="Currency" precision="0" />
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
                                            <titles>
                                                <cc1:ChartTitle Font="Tahoma, 14pt" Indent="1" Text="Empresa - Furto e Degustação - Últimos 13 Meses" WordWrap="True" />
                                            </titles>
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
                                        <asp:SqlDataSource ID="dsValorRecuperadoEmpresa_13_Mes" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="Analises.usp_Total_Furto_Degustacao_daEMPRESA_13_Mes" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                   

                                                </dx:PanelContent>
                                            </PanelCollection>
                                        </dx:ASPxCallbackPanel>
                                        
                                        
                                         </dx:ContentControl>
                                </contentcollection>
                            </dx:TabPage>

                            <dx:TabPage Text="Natureza Abordagem">
                                <ContentCollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">

                                    <div id="divFilial" class="divFilial">
                                        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
                                    </div>

                                    <div id="divPeriodo" class="divPeriodo">
                                        <uc1:wucAnoMes runat="server" ID="cboPeriodo" />
                                    </div>

                                        <div class="divBotaoAtualizar">
                                            <dx:ASPxButton ID="btnAtualizar_NaturezaAbordagem" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
                                                <ClientSideEvents Click="function(s, e) {cbpPanel_NaturezaAbordagem.PerformCallback();}" />
                                            </dx:ASPxButton>
                                        </div>

                                        <dx:ASPxCallbackPanel ID="cbPanel_NaturezaAbordagem" ClientInstanceName="cbpPanel_NaturezaAbordagem" runat="server" Width="100%" SettingsLoadingPanel-Text="Aguarde. Atualizando" Theme="Metropolis">
                                            <PanelCollection>
                                                <dx:PanelContent>

                                        
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

                                            <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="7" visible="False"></legend>
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
                                                <cc1:ChartTitle Font="Tahoma, 14pt" Indent="1" Text="Natureza Abordagem" WordWrap="True" />
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
                                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>   
                                        
                                                    <br />
                                        
                                        <div id="divDados">                  
                 

                                            <div id="divInfo">

                                                <p class="bg-warning"><b>Abordagem Reativa =</b> Após da Linha PD</p>                        

                                            </div>

                                            <div id="divInfo1">

                                                <p class="bg-warning"><b>Preventiva =</b> Oferecimento de Cestinha, ajuda, etc, após o Suspeito ter Guardado a Mercadoria
                        em sacola, mochila, bolsa e etc.</p>                        

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

                                                <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="7" visible="False"></legend>
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
                                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>                    


                                        </div>    
                                                    

                                                </dx:PanelContent>
                                            </PanelCollection>
                                        </dx:ASPxCallbackPanel>                                                                                                         


                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Valor Recuperado">
                                <ContentCollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">


                                    <div id="div1" class="divFilial">
                                        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial_ValorRecuperado" />
                                    </div>

                                    <div id="div2" class="divPeriodo">
                                        <uc1:wucAnoMes runat="server" ID="cboPeriodo_ValorRecuperado" />
                                    </div>

                                        <div class="divBotaoAtualizar">
                                            <dx:ASPxButton ID="btnAtualizar_ValorRecuperado" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
                                                <ClientSideEvents Click="function(s, e) {cbpPanel_ValorRecuperado.PerformCallback();}" />
                                            </dx:ASPxButton>
                                        </div>


                                        <dx:ASPxCallbackPanel ID="cbpPanel_ValorRecuperado" ClientInstanceName="cbpPanel_ValorRecuperado" runat="server" Width="100%" SettingsLoadingPanel-Text="Aguarde. Atualizando" Theme="Metropolis">
                                            <PanelCollection>
                                                <dx:PanelContent>

                                        <div class="divDados1">

                                            <dxchartsui:WebChartControl ID="graph_ValorRecuperado_porFilial" runat="server" DataSourceID="dsValorRecuperadoFilial" Height="450px" Width="1000px">
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

                                                <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="7" visible="False"></legend>
                                                <seriesserializable>
                                                    <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="vlrTotalRecuperado">
                                                        <viewserializable>
                                        
                                                        <cc1:LineSeriesView ColorEach="True" MarkerVisibility="True"><linemarkeroptions BorderVisible="True"></linemarkeroptions></cc1:LineSeriesView></viewserializable>
                                                        <labelserializable>
                                        
                                                        <cc1:PointSeriesLabel Font="Tahoma, 9pt" LineVisible="True" TextOrientation="BottomToTop"><fillstyle><optionsserializable><cc1:SolidFillOptions /></optionsserializable></fillstyle><pointoptionsserializable><cc1:PointOptions><valuenumericoptions format="Currency" precision="0" /></cc1:PointOptions></pointoptionsserializable></cc1:PointSeriesLabel></labelserializable>
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

                                            
                                        </div>


                                        
                                        <div class="divDados1">

                                            <dxchartsui:WebChartControl ID="graph_ValorRecuperado" runat="server" DataSourceID="dsValorRecuperado" Height="450px" Width="1000px">
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

                                                <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="7" visible="False"></legend>
                                                <seriesserializable>
                                                    <cc1:Series ArgumentDataMember="Descricao" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="vlrTotalRecuperado">
                                                        <viewserializable>
                                                            <cc1:SideBySideBarSeriesView ColorEach="True">
                                                            </cc1:SideBySideBarSeriesView>
                                                        </viewserializable>
                                                        <labelserializable>
                                                            <cc1:SideBySideBarSeriesLabel Font="Tahoma, 9pt" LineVisible="True" TextOrientation="BottomToTop">
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

                                            <h4><b>
                                            <asp:Label ID="lblTotalRecuperadoEmpresa" runat="server" ></asp:Label>
                                            </b></h4>
                                        </div>



                                                </dx:PanelContent>
                                            </PanelCollection>
                                        </dx:ASPxCallbackPanel>  



                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Furto e Degustação">
                                <ContentCollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">

                                    <div id="div3" class="divFilial">
                                        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial_FurtoDegustacao" />
                                    </div>

                                    <div id="div4" class="divPeriodo">
                                        <uc1:wucAnoMes runat="server" ID="cboPeriodo_FurtoDegustacao" />
                                    </div>

                                        <div class="divBotaoAtualizar">
                                            <dx:ASPxButton ID="btnAtualizar_FurtoDegustacao" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
                                                <ClientSideEvents Click="function(s, e) {cbpPanel_FurtoDegustacao.PerformCallback();}" />
                                            </dx:ASPxButton>
                                        </div>


                                        <dx:ASPxCallbackPanel ID="cbpPanel_FurtoDegustacao" ClientInstanceName="cbpPanel_FurtoDegustacao" runat="server" Width="100%" SettingsLoadingPanel-Text="Aguarde. Atualizando" Theme="Metropolis">
                                            <PanelCollection>
                                                <dx:PanelContent>

                                            <div class="divDados1">

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

                                                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="7" visible="False"></legend>
                                                    <seriesserializable>
                                                        <cc1:Series ArgumentDataMember="Descricao" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="vlrTotal">
                                                            <viewserializable>
                                                                <cc1:SideBySideBarSeriesView ColorEach="True">
                                                                </cc1:SideBySideBarSeriesView>
                                                            </viewserializable>
                                                            <labelserializable>
                                                                <cc1:SideBySideBarSeriesLabel Font="Tahoma, 9pt" LineVisible="True" TextOrientation="BottomToTop">
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

                                                <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="7" visible="False"></legend>
                                                <seriesserializable>
                                                    <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="vlrTotal">
                                                        <viewserializable>
                                        
                                                        <cc1:LineSeriesView ColorEach="True" MarkerVisibility="True"><linemarkeroptions BorderVisible="True"></linemarkeroptions></cc1:LineSeriesView></viewserializable>
                                                        <labelserializable>
                                        
                                                        <cc1:PointSeriesLabel Font="Tahoma, 9pt" LineVisible="True" TextOrientation="BottomToTop"><fillstyle><optionsserializable><cc1:SolidFillOptions /></optionsserializable></fillstyle><pointoptionsserializable><cc1:PointOptions><valuenumericoptions format="Currency" precision="0" /></cc1:PointOptions></pointoptionsserializable></cc1:PointSeriesLabel></labelserializable>
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
                                            

                                        
                                            <div class="divDados1">

                                                <dxchartsui:WebChartControl ID="graph_FurtoDegustao_porLoja" runat="server" DataSourceID="dsFurtoDegustao_porLoja" Height="450px" Width="1000px">
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

                                                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="7" visible="False"></legend>
                                                    <seriesserializable>
                                                        <cc1:Series ArgumentDataMember="Descricao" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="vlrTotal">
                                                            <viewserializable>
                                                                <cc1:SideBySideBarSeriesView ColorEach="True">
                                                                </cc1:SideBySideBarSeriesView>
                                                            </viewserializable>
                                                            <labelserializable>
                                                                <cc1:SideBySideBarSeriesLabel Font="Tahoma, 9pt" LineVisible="True" TextOrientation="BottomToTop">
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

                                            <div class="divDados1">

                                                <dxchartsui:WebChartControl ID="graph_FurtoDegustao_Deposito" runat="server" DataSourceID="dsFurtoDegustao_Deposito" Height="450px" Width="1000px">
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

                                                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="7" visible="False"></legend>
                                                    <seriesserializable>
                                                        <cc1:Series ArgumentDataMember="Descricao" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="vlrTotal">
                                                            <viewserializable>
                                                                <cc1:SideBySideBarSeriesView ColorEach="True">
                                                                </cc1:SideBySideBarSeriesView>
                                                            </viewserializable>
                                                            <labelserializable>
                                                                <cc1:SideBySideBarSeriesLabel Font="Tahoma, 9pt" LineVisible="True" TextOrientation="BottomToTop">
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


                                            <div class="divDados1">

                                                <dxchartsui:WebChartControl ID="graph_Total_Furto_Degustacao_Total" runat="server" DataSourceID="dsTotal_Furto_Degustacao_Total" Height="450px" Width="1000px">
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

                                                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="7" visible="False"></legend>
                                                    <seriesserializable>
                                                        <cc1:Series ArgumentDataMember="Descricao" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="vlrTotal">
                                                            <viewserializable>
                                                                <cc1:SideBySideBarSeriesView ColorEach="True">
                                                                </cc1:SideBySideBarSeriesView>
                                                            </viewserializable>
                                                            <labelserializable>
                                                                <cc1:SideBySideBarSeriesLabel Font="Tahoma, 9pt" LineVisible="True" TextOrientation="BottomToTop">
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

                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            <dx:TabPage Text="Furto e Degustação - Produtos" Name="tabFGP">
                                <ContentCollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">

                                        <div class="divFilial" >
                                            <uc1:wucLista_Filial_Empresa runat="server" ID="wucLista_Filial_Empresa" />
                                        </div>

                                        <div id="divDia_Produto_Furto_Degustacao">
                                            <uc1:wucListaDiaIniFin runat="server" ID="cboDia_Produto" />
                                        </div>                                        

                                        <div class="divBotaoAtualizar">
                                            <dx:ASPxButton ID="btnAtualizar_Produto_Furto_Degustacao" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
                                                <ClientSideEvents Click="function(s, e) {cbpPanel_Produto_Furto_Degustacao.PerformCallback();}" />
                                            </dx:ASPxButton>
                                        </div>

                                        <dx:ASPxCallbackPanel ID="cbpPanel_Produto_Furto_Degustacao" ClientInstanceName="cbpPanel_Produto_Furto_Degustacao" runat="server" Width="100%" SettingsLoadingPanel-Text="Aguarde. Atualizando" Theme="Metropolis">
                                            <PanelCollection>
                                                <dx:PanelContent>

                                        <div class="divDados1">

                                        
                                        <dx:ASPxGridView ID="grid_Produto_AreaVenda" runat="server" DataSourceID="dsProduto_AreaVenda" AutoGenerateColumns="False" EnableTheming="True" KeyFieldName="idProduto" Theme="SoftOrange" Width="950px">
                                            <TotalSummary>
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n3}" FieldName="Qtde" ShowInGroupFooterColumn="Valor" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrTotal" SummaryType="Sum" />
                                            </TotalSummary>
                                            <GroupSummary>
                                                <dx:ASPxSummaryItem DisplayFormat="Total de Itens: R$ {0:n2}" FieldName="vlrTotal" SummaryType="Sum" />
                                            </GroupSummary>
                                            <Columns>
                                                <dx:GridViewCommandColumn ShowInCustomizationForm="True" Visible="False" VisibleIndex="0" ShowClearFilterButton="True"/>
                                                <dx:GridViewDataTextColumn Caption="Ranking" FieldName="rnk" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px" SortIndex="0" SortOrder="Ascending">
                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="LessOrEqual" />
                                                    <CellStyle HorizontalAlign="Center">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Codigo" FieldName="idProduto" ShowInCustomizationForm="True" VisibleIndex="2" Width="65px">
                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Descrição do Produto" FieldName="nomeProduto" ShowInCustomizationForm="True" VisibleIndex="3">
                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Seção" FieldName="Secao" ShowInCustomizationForm="True" VisibleIndex="4" Width="100px">
                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Grupo" ShowInCustomizationForm="True" VisibleIndex="5" Width="100px">
                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Familia" ShowInCustomizationForm="True" VisibleIndex="6" Width="100px">
                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Qtde" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="7" Width="80px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n3}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrTotal" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="8" Width="80px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                            <SettingsPager PageSize="20">
                                            </SettingsPager>
                                            <Settings ShowFilterRow="True" ShowFooter="True" ShowGroupFooter="VisibleIfExpanded" ShowGroupPanel="True" ShowTitlePanel="True" VerticalScrollableHeight="450" VerticalScrollBarMode="Auto" />
                                            <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" Title="Furto e Degustação  - Área de Vendas" />
                                            <Styles>
                                                <Header HorizontalAlign="Center">
                                                </Header>
                                                <AlternatingRow BackColor="#EAEAEA">
                                                </AlternatingRow>
                                                <FocusedRow BackColor="Yellow" ForeColor="Blue">
                                                </FocusedRow>
                                                <Footer Font-Bold="True">
                                                </Footer>
                                            </Styles>
                                            </dx:ASPxGridView>

                                            <asp:SqlDataSource ID="dsProduto_AreaVenda" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="Analises.usp_Furto_Degustacao_porProduto_Loja_AreaVenda" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:SessionParameter DbType="Date" Name="DiaInicial" SessionField="sDIA_INICIAL" />
                                                    <asp:SessionParameter DbType="Date" Name="DiaFinal" SessionField="sDIA_FINAL" />
                                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>

                                        <br />

                                        <dx:ASPxGridView ID="grid_Produto_Deposito" runat="server" DataSourceID="dsProduto_Deposito" AutoGenerateColumns="False" EnableTheming="True" KeyFieldName="idProduto" Theme="PlasticBlue" Width="950px">
                                            <TotalSummary>
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n3}" FieldName="Qtde" ShowInGroupFooterColumn="Valor" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrTotal" SummaryType="Sum" />
                                            </TotalSummary>
                                            <GroupSummary>
                                                <dx:ASPxSummaryItem DisplayFormat="Total de Itens: R$ {0:n2}" FieldName="vlrTotal" SummaryType="Sum" />
                                            </GroupSummary>
                                            <Columns>
                                                <dx:GridViewCommandColumn ShowInCustomizationForm="True" Visible="False" VisibleIndex="0" ShowClearFilterButton="True"/>
                                                <dx:GridViewDataTextColumn Caption="Ranking" FieldName="rnk" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px" SortIndex="0" SortOrder="Ascending">
                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="LessOrEqual" />
                                                    <CellStyle HorizontalAlign="Center">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Codigo" FieldName="idProduto" ShowInCustomizationForm="True" VisibleIndex="2" Width="65px">
                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Descrição do Produto" FieldName="nomeProduto" ShowInCustomizationForm="True" VisibleIndex="3">
                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Seção" FieldName="Secao" ShowInCustomizationForm="True" VisibleIndex="4" Width="100px">
                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Grupo" ShowInCustomizationForm="True" VisibleIndex="5" Width="100px">
                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Familia" ShowInCustomizationForm="True" VisibleIndex="6" Width="100px">
                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn FieldName="Qtde" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="7" Width="70px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n3}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrTotal" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="8" Width="80px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <Settings AllowAutoFilter="False" />
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                            <SettingsPager PageSize="20">
                                            </SettingsPager>
                                            <Settings ShowFilterRow="True" ShowFooter="True" ShowGroupFooter="VisibleIfExpanded" ShowGroupPanel="True" ShowTitlePanel="True" VerticalScrollableHeight="450" VerticalScrollBarMode="Auto" />
                                            <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" Title="Furto e Degustação  - Área de Depósito" />
                                            <Styles>
                                                <Header HorizontalAlign="Center">
                                                </Header>
                                                <AlternatingRow BackColor="#EAEAEA">
                                                </AlternatingRow>
                                                <FocusedRow BackColor="Yellow" ForeColor="Blue">
                                                </FocusedRow>
                                                <Footer Font-Bold="True">
                                                </Footer>
                                            </Styles>
                                            </dx:ASPxGridView>

                                            <asp:SqlDataSource ID="dsProduto_Deposito" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="Analises.usp_Furto_Degustacao_porProduto_Loja_Deposito" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:SessionParameter DbType="Date" Name="DiaInicial" SessionField="sDIA_INICIAL" />
                                                    <asp:SessionParameter DbType="Date" Name="DiaFinal" SessionField="sDIA_FINAL" />
                                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>

                                        </div>


                                                </dx:PanelContent>
                                            </PanelCollection>
                                        </dx:ASPxCallbackPanel>


                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                        </TabPages>
                        

                        <ClientSideEvents ActiveTabChanging="function(s, e) {

}" />
                        

                    </dx:ASPxPageControl>                    


 </div>


</asp:Content>

