<%@ Page Title="Análise Clientes, Ticket Médio e Crescimento de Vendas" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Cli_TicMed_Cresc.aspx.vb" Inherits="MemberPages_Clientes_Cli_TicMed_Cresc" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>




<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>

<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >


        #divFilial {            
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

        #divDepto1 {
            clear: both;
            float: left;
            margin-left: 2px;
            padding-top: 10px;
        }

        #divSecao1 {
            clear: both;
            float: left;
            margin-left: 2px;
            padding-top: 10px;
        }

        #divDados_Tabela {
            float: left;
            margin-left: 10px;
        }

        #divMediaClientes {
            clear: both;
            float: left;
            margin-left: 2px;
            margin-top: 10px;
        }

        #divGraphAcumulado {
            float: left;
            margin-left: 10px;
            margin-top: 10px;
            
        }


    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">   

    <div id="divFilial">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {
	cbPanel.PerformCallback();
	cbPanel_Depto.PerformCallback();
	cbPanel_Secao.PerformCallback();
}" />
        </dx:ASPxButton>
    </div>

    <div id="divDados"> 
   
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
                <PanelCollection>
                    <dx:PanelContent>                                       
                 
                            <dxchartsui:WebChartControl ID="Graph" runat="server" DataSourceID="dsDados" Height="600px" Width="1300px">
                                <diagramserializable>
                                    <cc1:XYDiagram>
                                        <axisx visibleinpanesserializable="1" reverse="True">
                                            <autoscalebreaks enabled="True" />
                                            <range sidemarginsenabled="True" />
                                            <gridlines visible="True">
                                            </gridlines>
                                        </axisx>
                                        <axisy visibleinpanesserializable="-1" title-font="Tahoma, 10pt" title-text="Crescimento Vendas" title-visible="True">
                                            <range sidemarginsenabled="True" />
                                            <gridlines visible="False">
                                            </gridlines>
                                        </axisy>
                                        <secondaryaxesy>
                                            <cc1:SecondaryAxisY Alignment="Near" AxisID="0" Name="Clientes AxisY" Title-Font="Tahoma, 10pt" Title-Text="Crescimento Clientes" Title-Visible="True" VisibleInPanesSerializable="0">
                                                <constantlines>
                                                    <cc1:ConstantLine AxisValueSerializable="0" Color="Red" Name="" ShowInLegend="False" Title-ShowBelowLine="True">
                                                        <linestyle thickness="2" />
                                                    </cc1:ConstantLine>
                                                </constantlines>
                                                <range sidemarginsenabled="True" />
                                            </cc1:SecondaryAxisY>
                                            <cc1:SecondaryAxisY Alignment="Near" AxisID="1" Name="Ticket AxisY" Title-Font="Tahoma, 10pt" Title-Text="Ticket Médio" Title-Visible="True" VisibleInPanesSerializable="1">
                                                <constantlines>
                                                    <cc1:ConstantLine AxisValueSerializable="0" Color="Red" Name="" ShowInLegend="False" Title-ShowBelowLine="True">
                                                        <linestyle thickness="2" />
                                                    </cc1:ConstantLine>
                                                </constantlines>
                                                <range sidemarginsenabled="True" />
                                            </cc1:SecondaryAxisY>
                                        </secondaryaxesy>
                                        <panes>
                                            <cc1:XYDiagramPane Name="Pane 1" PaneID="0">
                                            </cc1:XYDiagramPane>
                                            <cc1:XYDiagramPane Name="Pane 2" PaneID="1">
                                            </cc1:XYDiagramPane>
                                        </panes>
                                    </cc1:XYDiagram>
                                </diagramserializable>
        <FillStyle><OptionsSerializable>
        <cc1:SolidFillOptions></cc1:SolidFillOptions>
        </OptionsSerializable>
        </FillStyle>

                                <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="7"></legend>
                                <seriesserializable>
                                    <cc1:Series ArgumentDataMember="Periodo1" Name="Crescimento_Venda" ValueDataMembersSerializable="percCresc_Venda" LabelsVisibility="True" LegendText="% Crescimento Venda">
                                        <viewserializable>
                                            <cc1:LineSeriesView MarkerVisibility="True">
                                                <linemarkeroptions size="2" BorderVisible="True">
                                                </linemarkeroptions>
                                            </cc1:LineSeriesView>
                                        </viewserializable>
                                        <labelserializable>
                                            <cc1:PointSeriesLabel LineVisible="True" Angle="270" Font="Tahoma, 7pt">
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
                                    <cc1:Series ArgumentDataMember="Periodo1" Name="Crescimento_Clientes" ValueDataMembersSerializable="percCresc_Clientes" LabelsVisibility="True" LegendText="% Crescimento Clientes">
                                        <viewserializable>
                                            <cc1:LineSeriesView MarkerVisibility="True" AxisYName="Clientes AxisY" PaneName="Pane 1">
                                                <linemarkeroptions BorderVisible="True" size="2">
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
                                    <cc1:Series ArgumentDataMember="Periodo1" Name="Crescimento_TicketMedio" ValueDataMembersSerializable="percCresc_TicketMedio" LabelsVisibility="True" LegendText="% Crescimento Ticket Médio">
                                        <viewserializable>
                                            <cc1:LineSeriesView MarkerVisibility="True" AxisYName="Ticket AxisY" PaneName="Pane 2">
                                                <linemarkeroptions BorderVisible="True" size="2">
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
                                    <cc1:ChartTitle Font="Tahoma, 14pt" Indent="1" Text="Análise - Crescimento de Clientes x Ticket Médio x Crescimento de Vendas" WordWrap="True" />
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
                    
		                    <asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspClientes_TicketMedio_CrescimentoVenda" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource>           


                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>

    </div>    <%--Grafico 1--%>

    <div id="divDepto1">

       <dx:ASPxComboBox ID="cboDepto" runat="server" DataSourceID="dsListaDepto" TextField="descProdutoDeptoLista" ValueField="idProdutoDepto" SelectedIndex="0">
           <ClientSideEvents SelectedIndexChanged="function(s, e) {
	cbPanel_Depto.PerformCallback();
}" />

       </dx:ASPxComboBox>

        <asp:SqlDataSource ID="dsListaDepto" runat="server" ConnectionString="<%$ ConnectionStrings:gerCadastrosConnectionString %>" SelectCommand="SELECT [idProdutoDepto], [descProdutoDeptoLista] FROM SLV.tblDepto WHERE ([idProdutoDepto] &lt;= @idProdutoDepto)">
            <SelectParameters>
                <asp:Parameter DefaultValue="5" Name="idProdutoDepto" Type="Byte" />
            </SelectParameters>
        </asp:SqlDataSource>

       <dx:ASPxCallbackPanel ID="cbPanel_Depto" runat="server" Width="100%" ClientInstanceName="cbPanel_Depto" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
                <PanelCollection>
                    <dx:PanelContent>                    

                            <dxchartsui:WebChartControl ID="Graph_Depto1" runat="server" DataSourceID="dsDados_Depto1" Height="500px" Width="1300px">
                                <diagramserializable>
                                    <cc1:XYDiagram>
                                        <axisx visibleinpanesserializable="-1" reverse="True">
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
                                    <cc1:Series ArgumentDataMember="Periodo1" Name="Crescimento_Venda" ValueDataMembersSerializable="percCresc_Venda" LabelsVisibility="True" LegendText="% Crescimento Venda">
                                        <viewserializable>
                                            <cc1:LineSeriesView MarkerVisibility="True">
                                                <linestyle thickness="5" />
                                                <linemarkeroptions size="2" BorderVisible="True">
                                                </linemarkeroptions>
                                            </cc1:LineSeriesView>
                                        </viewserializable>
                                        <labelserializable>
                                            <cc1:PointSeriesLabel LineVisible="True" Angle="270" Font="Tahoma, 7pt">
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
                                    <cc1:Series ArgumentDataMember="Periodo1" Name="Crescimento_Clientes" ValueDataMembersSerializable="percCresc_Clientes" LabelsVisibility="True" LegendText="% Crescimento Clientes">
                                        <viewserializable>
                                            <cc1:LineSeriesView MarkerVisibility="True">
                                                <linestyle thickness="4" />
                                                <linemarkeroptions BorderVisible="True" size="2">
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
                                    <cc1:Series ArgumentDataMember="Periodo1" Name="Crescimento_TicketMedio" ValueDataMembersSerializable="percCresc_TicketMedio" LabelsVisibility="True" LegendText="% Crescimento Ticket Médio">
                                        <viewserializable>
                                            <cc1:LineSeriesView MarkerVisibility="True">
                                                <linemarkeroptions BorderVisible="True" size="2">
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
                                    <cc1:ChartTitle Font="Tahoma, 14pt" Indent="1" Text="Análise Departamento - Crescimento de Clientes x Ticket Médio x Crescimento de Vendas" WordWrap="True" />
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
                    
		                    <asp:SqlDataSource ID="dsDados_Depto1" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspClientes_TicketMedio_CrescimentoVenda_Depto" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                    <asp:SessionParameter Name="idDepto" SessionField="sDEPTO" Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource>   


                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>

    </div>   <%--Grafico 2--%>




    <div id="divSecao1">

       <dx:ASPxComboBox ID="cboSecao" runat="server" DataSourceID="dsListaSecao" TextField="descProdutoSecaoLista" ValueField="idProdutoSecao" SelectedIndex="0" Width="300px">
           <ClientSideEvents SelectedIndexChanged="function(s, e) {
	cbPanel_Secao.PerformCallback();
}" />

       </dx:ASPxComboBox>

        <asp:SqlDataSource ID="dsListaSecao" runat="server" ConnectionString="<%$ ConnectionStrings:gerCadastrosConnectionString %>" SelectCommand="SELECT [idProdutoSecao], [descProdutoSecaoLista] FROM SLV.tblSecao WHERE ([idProdutoSecao] &lt;= @idProdutoSecao)">
            <SelectParameters>
                <asp:Parameter DefaultValue="56" Name="idProdutoSecao" Type="Byte" />
            </SelectParameters>
        </asp:SqlDataSource>

       <dx:ASPxCallbackPanel ID="cbPanel_Secao" runat="server" Width="100%" ClientInstanceName="cbPanel_Secao" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
                <PanelCollection>
                    <dx:PanelContent>                    

                            <dxchartsui:WebChartControl ID="Graph_Secao" runat="server" DataSourceID="dsDados_Secao" Height="500px" Width="1300px">
                                <diagramserializable>
                                    <cc1:XYDiagram>
                                        <axisx visibleinpanesserializable="-1" reverse="True">
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
                                    <cc1:Series ArgumentDataMember="Periodo1" Name="Crescimento_Venda" ValueDataMembersSerializable="percCresc_Venda" LabelsVisibility="True" LegendText="% Crescimento Venda">
                                        <viewserializable>
                                            <cc1:LineSeriesView MarkerVisibility="True">
                                                <linestyle thickness="5" />
                                                <linemarkeroptions size="2" BorderVisible="True">
                                                </linemarkeroptions>
                                            </cc1:LineSeriesView>
                                        </viewserializable>
                                        <labelserializable>
                                            <cc1:PointSeriesLabel LineVisible="True" Angle="270" Font="Tahoma, 7pt">
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
                                    <cc1:Series ArgumentDataMember="Periodo1" Name="Crescimento_Clientes" ValueDataMembersSerializable="percCresc_Clientes" LabelsVisibility="True" LegendText="% Crescimento Clientes">
                                        <viewserializable>
                                            <cc1:LineSeriesView MarkerVisibility="True">
                                                <linestyle thickness="4" />
                                                <linemarkeroptions BorderVisible="True" size="2">
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
                                    <cc1:Series ArgumentDataMember="Periodo1" Name="Crescimento_TicketMedio" ValueDataMembersSerializable="percCresc_TicketMedio" LabelsVisibility="True" LegendText="% Crescimento Ticket Médio">
                                        <viewserializable>
                                            <cc1:LineSeriesView MarkerVisibility="True">
                                                <linemarkeroptions BorderVisible="True" size="2">
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
                                    <cc1:ChartTitle Font="Tahoma, 14pt" Indent="1" Text="Análise Seção - Crescimento de Clientes x Ticket Médio x Crescimento de Vendas" WordWrap="True" />
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
                    
		                    <asp:SqlDataSource ID="dsDados_Secao" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspClientes_TicketMedio_CrescimentoVenda_Secao" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                    <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource>   


                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>

    </div>


</asp:Content>


