<%@ Page Title="Analise de Venda por Dia da Semana" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="VendaDiaSemana.aspx.vb" Inherits="MemberPages_Vendas_Analises_VendaDiaSemana" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>





<%@ Register Src="~/Controles/wuciListaSemana.ascx" TagPrefix="uc1" TagName="wuciListaSemana" %>











<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>






<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type="text/css" >
        html {             
            overflow-x:hidden ;
        }

        #moldura {
            width:1024px;
            margin:0 auto;           
        }

        #Ano {
            float: left;
        }

        #Mes {
            float: left;
        }

        #Filial {
            float: left;
            margin-left: 2px;
            width: 335px;
            padding-left: 2px;
        }

        #Semana {
            float: left;
            padding-left: 2px;
        }

        #Button {
            float: left;
            padding-left: 2px;
            width: 70px;
            padding-top: 2px;
        }

        #Conteudo {
            clear:both ;
            float: left;            
            padding-top: 2px;   
            width: 1015px;
            margin-left: 1px;          
        }

        #divGrafico1 {
            clear:both ;
            float: left;            
            padding-top: 2px;                   
        }

        #divGrafico2 {
            clear:both ;
            float: left;            
            padding-top: 2px;                   
        }

        #divGrafico3 {
            clear:both ;
            float: left;            
            padding-top: 2px;                   
        }

       .divTituloGrafico {
            clear:both ;
            float: left;            
            padding-top: 10px; 
            text-align:center;
            font-size: 18px;
            width: 1000px; 
            color: gray;                
        }

        .myBorder {
            border: 1px solid #bdbbbb;
            height: 28px;
            margin-left: 1px;            
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <div id="moldura" >
        <div id="Ano" class="myBorder">
            <uc1:wucAno runat="server" ID="cboAno" />
        </div>

        <div id="Mes" class="myBorder">
            <uc1:wuciListaMes runat="server" ID="cboMes" />
        </div>

        <div id="Filial" class="myBorder">
            <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
        </div>

        <div id="Semana" class="myBorder">
            <uc1:wuciListaSemana runat="server" ID="cboSemana" />
        </div>

        <div id="Button" >
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="false" 
                ClientSideEvents-Click="function (s, e) {myPanel.PerformCallback();} " ></dx:ASPxButton>
        </div>

        <div id="Conteudo">
            <dx:ASPxCallbackPanel ID="myPanel" runat="server" Width="300px" ClientInstanceName="myPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Atualizando informações. Aguarde&amp;hellip;"> 
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttribute="True">
                        <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsData" AutoGenerateColumns="False" Width="500px">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Dia" FieldName="diaAbrev" ToolTip="Dia" VisibleIndex="0" Width="70px">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Descrição" FieldName="nomeDia" ReadOnly="True" ToolTip="Nome do dia da semana" VisibleIndex="1" Width="60px">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda" ToolTip="Valor de vendas" VisibleIndex="2" Width="90px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Clientes" FieldName="numCliente" ToolTip="Número de clientes" VisibleIndex="3" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="% part Sem." FieldName="percPartVendaSemana" ReadOnly="True" ToolTip="Percentual de participação do dia na semana" VisibleIndex="4" Width="70px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargem" ReadOnly="True" ToolTip="Percentual de margem" VisibleIndex="5" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsPager Mode="ShowAllRecords">
                </SettingsPager>

                            <Settings VerticalScrollableHeight="100" VerticalScrollBarMode="Visible" />

            </dx:ASPxGridView>
                        <uc1:wucBotaoExcel runat="server" ID="wucBotaoExcel" CallGridViewID="grid" />
                        <asp:SqlDataSource ID="dsData" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspVendaPorDiaDaSemana" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="numDiaSemana" SessionField="sNUM_DIA_SEMANA" Type="Byte" />
                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                </SelectParameters>
            </asp:SqlDataSource>
                        
                        <div class="divTituloGrafico">
                            Evolução das Vendas e Margem
                        </div>

                        <div id="divGrafico1">
                            <dxchartsui:WebChartControl ID="grafDados" runat="server" DataSourceID="dsData" Height="350px" Width="1000px">
                            <diagramserializable>
                                <cc1:XYDiagram>
                                    <axisx visibleinpanesserializable="-1">
                                        <label angle="90"></label><range sidemarginsenabled="False" />
                                    </axisx>
                                    <axisy visible="False" visibleinpanesserializable="-1">
                                        <range sidemarginsenabled="True" />
                                    </axisy>
                                    <secondaryaxesy>
                                        <cc1:SecondaryAxisY AxisID="0" Name="Secondary AxisY 1" Visible="False" VisibleInPanesSerializable="-1">
                                            <range auto="False" maxvalueserializable="200" minvalueserializable="0" sidemarginsenabled="True" />
                                        </cc1:SecondaryAxisY>
                                    </secondaryaxesy>
                                </cc1:XYDiagram>
                            </diagramserializable>
                            <fillstyle>
                                <optionsserializable>
                                    <cc1:SolidFillOptions />
                                </optionsserializable>
                            </fillstyle>
                            <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" horizontalindent="8" markersize="30, 16" maxverticalpercentage="10">
                                <margins bottom="0" left="0" right="0" top="0" />
                            </legend>
                            <seriesserializable>
                                <cc1:Series ArgumentDataMember="diaAbrev" ArgumentScaleType="Qualitative" LabelsVisibility="True" Name="Vendas" ValueDataMembersSerializable="vlrVenda">
                                    <viewserializable>
                                        <cc1:SplineAreaSeriesView MarkerVisibility="True">
                                            <markeroptions size="5"  BorderVisible="True">
                                            </markeroptions>
                                        </cc1:SplineAreaSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:PointSeriesLabel Angle="90" LineVisible="True" TextOrientation="BottomToTop" BackColor="Transparent">
                                            <border visible="False" />
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
                                <cc1:Series ArgumentDataMember="diaAbrev" ArgumentScaleType="Qualitative" LabelsVisibility="True" Name="Margem" ValueDataMembersSerializable="percMargem">
                                    <viewserializable>
                                        <cc1:SplineAreaSeriesView AxisYName="Secondary AxisY 1" MarkerVisibility="True">
                                            <markeroptions size="5"  BorderVisible="True">
                                            </markeroptions>
                                        </cc1:SplineAreaSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:PointSeriesLabel Angle="90" LineVisible="True" TextOrientation="BottomToTop" BackColor="Transparent">
                                            <border visible="False" />
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
                                    <topnoptions mode="ThresholdValue" />
                                </cc1:Series>
                            </seriesserializable>
                            <seriestemplate>
                                <viewserializable>
                                    <cc1:SplineAreaSeriesView MarkerVisibility="True">
                                        <markeroptions  BorderVisible="True">
                                        </markeroptions>
                                    </cc1:SplineAreaSeriesView>
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
                                <tooltipcontroller openmode="OnClick" />
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
                        </div>

                        <div class="divTituloGrafico">
                            Evolução do Número de Clientes e Participação da Venda na Semana
                        </div>

                        <div id="divGrafico2">
                           <dxchartsui:WebChartControl ID="grafDados1" runat="server" DataSourceID="dsData" Height="350px" Width="1000px" AppearanceNameSerializable="In A Fog">
                            <diagramserializable>
                                <cc1:XYDiagram>
                                    <axisx visibleinpanesserializable="-1">
                                        <label angle="90"></label><range sidemarginsenabled="False" />
                                    </axisx>
                                    <axisy visible="False" visibleinpanesserializable="-1">
                                        <range sidemarginsenabled="True" />
                                    </axisy>
                                    <secondaryaxesy>
                                        <cc1:SecondaryAxisY AxisID="0" Name="Secondary AxisY 1" Visible="False" VisibleInPanesSerializable="-1">
                                            <range auto="False" maxvalueserializable="200" minvalueserializable="0" sidemarginsenabled="True" />
                                        </cc1:SecondaryAxisY>
                                    </secondaryaxesy>
                                </cc1:XYDiagram>
                            </diagramserializable>
                            <fillstyle>
                                <optionsserializable>
                                    <cc1:SolidFillOptions />
                                </optionsserializable>
                            </fillstyle>
                            <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" horizontalindent="8" markersize="30, 16" maxverticalpercentage="10">
                                <margins bottom="0" left="0" right="0" top="0" />
                            </legend>
                            <seriesserializable>
                                <cc1:Series ArgumentDataMember="diaAbrev" ArgumentScaleType="Qualitative" LabelsVisibility="True" Name="Nº Clientes" ValueDataMembersSerializable="numCliente">
                                    <viewserializable>
                                        <cc1:SplineAreaSeriesView MarkerVisibility="True">
                                            <markeroptions size="5"  BorderVisible="True">
                                            </markeroptions>
                                        </cc1:SplineAreaSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:PointSeriesLabel Angle="90" LineVisible="True" TextOrientation="BottomToTop">
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
                                <cc1:Series ArgumentDataMember="diaAbrev" ArgumentScaleType="Qualitative" LabelsVisibility="True" Name="% Part. Semana" ValueDataMembersSerializable="percPartVendaSemana">
                                    <viewserializable>
                                        <cc1:SplineAreaSeriesView AxisYName="Secondary AxisY 1" MarkerVisibility="True">
                                            <markeroptions size="5"  BorderVisible="True">
                                            </markeroptions>
                                        </cc1:SplineAreaSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:PointSeriesLabel Angle="90" LineVisible="True" TextOrientation="BottomToTop">
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
                                    <topnoptions mode="ThresholdValue" />
                                </cc1:Series>
                            </seriesserializable>
                            <seriestemplate>
                                <viewserializable>
                                    <cc1:SplineAreaSeriesView MarkerVisibility="True">
                                        <markeroptions  BorderVisible="True">
                                        </markeroptions>
                                    </cc1:SplineAreaSeriesView>
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
                        </div>

                        <div class="divTituloGrafico">
                            Participação de Vendas na Semana - Loja à Loja
                        </div>

                        <div id="divGrafico3">
                           <dxchartsui:WebChartControl ID="WebChartControl1" runat="server" DataSourceID="dsGrafico3" Height="350px" Width="1000px" AppearanceNameSerializable="In A Fog">
                            <diagramserializable>
                                <cc1:XYDiagram>
                                    <axisx visibleinpanesserializable="-1">
                                        <label angle="90"></label><range sidemarginsenabled="False" />
                                    </axisx>
                                    <axisy visible="False" visibleinpanesserializable="-1">
                                        <range sidemarginsenabled="True" />
                                        <gridlines>
                                            <linestyle thickness="2" />
                                        </gridlines>
                                    </axisy>
                                </cc1:XYDiagram>
                            </diagramserializable>
                            <fillstyle>
                                <optionsserializable>
                                    <cc1:SolidFillOptions />
                                </optionsserializable>
                            </fillstyle>
                            <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" horizontalindent="8" markersize="30, 16">
                                <margins bottom="0" left="0" right="0" top="0" />
                            </legend>
                            <seriesserializable>
                                <cc1:Series ArgumentDataMember="FilialLista" ArgumentScaleType="Qualitative" LabelsVisibility="True" Name="Lojas" ValueDataMembersSerializable="percPartVendaSemana">
                                    <viewserializable>
                                        <cc1:SplineAreaSeriesView MarkerVisibility="True">
                                            <markeroptions size="5"  BorderVisible="True">
                                            </markeroptions>
                                        </cc1:SplineAreaSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:PointSeriesLabel Angle="90" LineVisible="True" TextOrientation="BottomToTop">
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
                                    <cc1:SplineAreaSeriesView MarkerVisibility="True">
                                        <markeroptions   BorderVisible="True">
                                        </markeroptions>
                                    </cc1:SplineAreaSeriesView>
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
                            <asp:SqlDataSource ID="dsGrafico3" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspParticipacaDiaDaSemanaTodasLojas" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="numDiaSemana" SessionField="sNUM_DIA_SEMANA" Type="Byte" />                                 
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>

                        <div class="divTituloGrafico">
                            Acompanhamento Atingimento de Metas
                        </div>

                        <div id="divGrafico4">
                            <dxchartsui:WebChartControl ID="WebChartControl2" runat="server" DataSourceID="dsGrafico4" Height="350px" Width="1000px" PaletteName="Metro">
                            <diagramserializable>
                                <cc1:XYDiagram>
                                    <axisx visibleinpanesserializable="-1">
                                        <label angle="90"></label><range sidemarginsenabled="True" />
                                    </axisx>
                                    <axisy visible="False" visibleinpanesserializable="-1">
                                        <range sidemarginsenabled="True" />
                                    </axisy>
                                    <secondaryaxesy>
                                        <cc1:SecondaryAxisY AxisID="0" Name="Secondary AxisY 1" Visible="False" VisibleInPanesSerializable="-1">
                                            <range sidemarginsenabled="True" />
                                        </cc1:SecondaryAxisY>
                                    </secondaryaxesy>
                                </cc1:XYDiagram>
                            </diagramserializable>
                            <fillstyle>
                                <optionsserializable>
                                    <cc1:SolidFillOptions />
                                </optionsserializable>
                            </fillstyle>
                            <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" horizontalindent="8" markersize="30, 16" maxverticalpercentage="10">
                                <margins bottom="0" left="0" right="0" top="0" />
                            </legend>
                            <seriesserializable>
                                <cc1:Series ArgumentDataMember="Dia" ArgumentScaleType="Qualitative" Name="Meta" ValueDataMembersSerializable="vlrMeta">
                                    <viewserializable>
                                        <cc1:SplineAreaSeriesView MarkerVisibility="False">
                                            <markeroptions size="5"  BorderVisible="False">
                                            </markeroptions>
                                        </cc1:SplineAreaSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:PointSeriesLabel Angle="90" LineVisible="True" TextOrientation="BottomToTop">
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
                                    <topnoptions mode="ThresholdValue" />
                                </cc1:Series>
                                <cc1:Series ArgumentDataMember="Dia" ArgumentScaleType="Qualitative" Name="Vendas" ValueDataMembersSerializable="vlrVenda">
                                    <viewserializable>
                                        <cc1:SideBySideBarSeriesView Color="205, 100, 149, 237" Transparency="50">
                                            <fillstyle fillmode="Solid">
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                        </cc1:SideBySideBarSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:SideBySideBarSeriesLabel LineVisible="True" TextOrientation="BottomToTop">
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
                                <cc1:Series ArgumentDataMember="Dia" ArgumentScaleType="Qualitative" LabelsVisibility="True" Name="percAtingimento" ValueDataMembersSerializable="percAting">
                                    <viewserializable>
                                        <cc1:LineSeriesView AxisYName="Secondary AxisY 1" Color="Transparent" MarkerVisibility="False">
                                            <linestyle dashstyle="Dash" thickness="1" />
                                            <linemarkeroptions size="5"  BorderVisible="False">
                                            </linemarkeroptions>
                                        </cc1:LineSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:PointSeriesLabel Angle="90" BackColor="Transparent" LineColor="Transparent" LineLength="5" LineVisible="True" TextColor="64, 64, 64" TextOrientation="BottomToTop">
                                            <border visible="False" />
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
                                    <cc1:SplineAreaSeriesView MarkerVisibility="True">
                                        <markeroptions  BorderVisible="True">
                                        </markeroptions>
                                    </cc1:SplineAreaSeriesView>
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
                            <asp:SqlDataSource ID="dsGrafico4" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.uspAcompanhamentoMetaRealizado" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                    <asp:SessionParameter Name="numSemana" SessionField="sNUM_DIA_SEMANA" Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>

                    </dx:PanelContent>
                </PanelCollection> 
            </dx:ASPxCallbackPanel>


        </div>
    </div>
</asp:Content>

