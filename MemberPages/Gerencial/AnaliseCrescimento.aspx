<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="AnaliseCrescimento.aspx.vb" Inherits="MemberPages_Gerencial_AnaliseCrescimento" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>

<%@ Register assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>

<%@ Register Src="~/Controles/wucListaSecao.ascx" TagPrefix="uc1" TagName="wucListaSecao" %>



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

        #divSecao {            
             float: left;
            margin-left: 10px;  
            padding-top: 2px;     
        }

       #divTipo {            
             float: left;
            margin-left: 10px;  
            padding-top: 2px;     
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divDados_Grafico {
            float: left;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">



    <div id="divFilial">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
    </div>

    <div id="divSecao">
        <uc1:wucListaSecao runat="server" ID="cboSecao" />
    </div>

    <div id="divTipo">
        <dx:ASPxComboBox ID="cboTipo" runat="server" EnableTheming="True" Native="True" SelectedIndex="0" Theme="Default" Width="120px">
            <Items>
                <dx:ListEditItem Selected="True" Text="Vendas" Value="1" />
                <dx:ListEditItem Text="Nº de Clientes" Value="2" />
            </Items>
        </dx:ASPxComboBox>
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

                    <div id="divDados_GraficoVendas">
                    <dxchartsui:WebChartControl ID="graficoVendas" runat="server" Height="600px" Width="1200px" BackColor="Transparent" DataSourceID="dsGraficoVendas" PaletteName="Apex">
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
                                            <linemarkeroptions size="5" BorderVisible="True">
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
                                <cc1:Series ArgumentDataMember="Periodo" LabelsVisibility="True" Name="% Cresc" ValueDataMembersSerializable="percCrescSecao">
                                    <viewserializable>
                                        <cc1:LineSeriesView AxisYName="percCrescSecao" Color="Red" MarkerVisibility="True">
                                            <linemarkeroptions size="5" BorderVisible="True">
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
                </div>        
                    
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>

</asp:Content>



