<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="GraficoCrescimentoVendaQtde_Depto5.aspx.vb" Inherits="MemberPages_Gerencial_GraficoCrescimentoVendaQtde_Depto5" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>






<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>






<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>
<%@ Register Src="~/Controles/wucListaSecao.ascx" TagPrefix="uc1" TagName="wucListaSecao" %>
<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wucListaSecao_Depto5.ascx" TagPrefix="uc1" TagName="wucListaSecao_Depto5" %>





<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

         #divAno { 
            clear:both;           
            float: left;
            margin-left: 10px;
            margin-top: 2px;
        }

        #divFilial {            
            float: left;
            margin-left: 10px;
            margin-top: 4px;
        }

        #divSecao {            
            float: left;
            margin-left: 10px;
            margin-top: 4px;
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

        #divDados_Tabela {
            float: left;
            margin-left: 10px;
        }

  


    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divFilial">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
    </div>

    <div id="divSecao">
        <uc1:wucListaSecao_Depto5 runat="server" ID="cboSecao" />
    </div>

    

   
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>
                    
                    <div id="divDados">                  
                 
                        <dxchartsui:WebChartControl ID="Graph" runat="server" DataSourceID="dsDados" Height="550px" Width="1200px">
                            <diagramserializable>
                                <cc1:XYDiagram>
                                    <axisx visibleinpanesserializable="-1" reverse="True">
                                        <label angle="90">
                                        </label>
                                        <range sidemarginsenabled="True" />
                                        <gridlines visible="True">
                                            <linestyle thickness="2" />
                                        </gridlines>
                                    </axisx>
                                    <axisy visibleinpanesserializable="-1">
                                        <range sidemarginsenabled="True" />
                                    </axisy>
                                    <secondaryaxesy>
                                        <cc1:SecondaryAxisY AxisID="0" Name="PDV" VisibleInPanesSerializable="-1">
                                            <range sidemarginsenabled="True" />
                                            <numericoptions format="Number" />
                                        </cc1:SecondaryAxisY>
                                    </secondaryaxesy>
                                </cc1:XYDiagram>
                            </diagramserializable>
    <FillStyle><OptionsSerializable>
    <cc1:SolidFillOptions></cc1:SolidFillOptions>
    </OptionsSerializable>
    </FillStyle>

                            <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="7"></legend>
                            <seriesserializable>
                                <cc1:Series ArgumentDataMember="descMesCompletoRed" LabelsVisibility="True" Name="% Margem PDV" ValueDataMembersSerializable="percMargemPDV" LegendText="% Margem PDV">
                                    <viewserializable>
                                        <cc1:LineSeriesView AxisYName="PDV" Color="205, 70, 130, 180" MarkerVisibility="True">
                                            <linemarkeroptions BorderVisible="True" size="6">
                                            </linemarkeroptions>
                                        </cc1:LineSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:PointSeriesLabel LineVisible="True" ResolveOverlappingMode="Default">
                                            <fillstyle>
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                            <pointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" />
                                                    <valuenumericoptions format="Number" />
                                                </cc1:PointOptions>
                                            </pointoptionsserializable>
                                        </cc1:PointSeriesLabel>
                                    </labelserializable>
                                    <legendpointoptionsserializable>
                                        <cc1:PointOptions>
                                            <argumentnumericoptions format="Number" />
                                            <valuenumericoptions format="Number" />
                                        </cc1:PointOptions>
                                    </legendpointoptionsserializable>
                                </cc1:Series>
                                <cc1:Series ArgumentDataMember="descMesCompletoRed" LabelsVisibility="True" Name="% Cresc. Venda" ValueDataMembersSerializable="percCrescVenda" LegendText="% Cresc. Vendas">
                                    <viewserializable>
                                        <cc1:LineSeriesView MarkerVisibility="True">
                                            <linemarkeroptions size="6" BorderVisible="True">
                                            </linemarkeroptions>
                                        </cc1:LineSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:PointSeriesLabel LineVisible="True" ResolveOverlappingMode="Default">
                                            <fillstyle>
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                            <pointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" />
                                                    <valuenumericoptions format="Number" />
                                                </cc1:PointOptions>
                                            </pointoptionsserializable>
                                        </cc1:PointSeriesLabel>
                                    </labelserializable>
                                    <legendpointoptionsserializable>
                                        <cc1:PointOptions>
                                            <argumentnumericoptions format="Number" />
                                            <valuenumericoptions format="Number" />
                                        </cc1:PointOptions>
                                    </legendpointoptionsserializable>
                                </cc1:Series>
                                <cc1:Series ArgumentDataMember="descMesCompletoRed" LabelsVisibility="True" LegendText="% Cresc. Qtde" Name="% Cresc. Qtde" ValueDataMembersSerializable="percCrescQtde">
                                    <viewserializable>
                                        <cc1:LineSeriesView MarkerVisibility="True">
                                            <linemarkeroptions size="6" BorderVisible="True">
                                            </linemarkeroptions>
                                        </cc1:LineSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:PointSeriesLabel LineVisible="True" ResolveOverlappingMode="Default">
                                            <fillstyle>
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                            <pointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" />
                                                    <valuenumericoptions format="Number" />
                                                </cc1:PointOptions>
                                            </pointoptionsserializable>
                                        </cc1:PointSeriesLabel>
                                    </labelserializable>
                                    <legendpointoptionsserializable>
                                        <cc1:PointOptions>
                                            <argumentnumericoptions format="Number" />
                                            <valuenumericoptions format="Number" />
                                        </cc1:PointOptions>
                                    </legendpointoptionsserializable>
                                </cc1:Series>
                                <cc1:Series ArgumentDataMember="descMesCompletoRed" LegendText="% Participação" Name="% Part. Seção" ValueDataMembersSerializable="percPartAT">
                                    <viewserializable>
                                        <cc1:StepAreaSeriesView AxisYName="PDV" MarkerVisibility="False" Transparency="200">
                                            <border visible="False" />
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
                                <cc1:ChartTitle Font="Tahoma, 14pt" Indent="1" Text="Crescimento de Qtde  x  Crescimento de Vendas  x  Margem Cheia" WordWrap="True" />
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
                    
		                <asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="uspBuscar_Crescimento_Venda_Qtde_MargemPDV" SelectCommandType="StoredProcedure">
                            <SelectParameters>                           
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Int16" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </div>

                  



                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>




</asp:Content>

