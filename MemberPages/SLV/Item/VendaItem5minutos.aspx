<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="VendaItem5minutos.aspx.vb" Inherits="MemberPages_SLV_Item_VendaItem5minutos" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>


<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>

<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>

<%@ Register Src="~/Controles/wucProdutoEncontra.ascx" TagPrefix="uc1" TagName="wucProdutoEncontra" %>
<%@ Register Src="~/Controles/wucListaDia.ascx" TagPrefix="uc1" TagName="wucListaDia" %>



<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divPeriodo {
            clear: both;
            float: left;
            margin-left: 2px;
            margin-top: 5px;
        }        

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
             margin-top: 1px;
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
            margin-top: 3px;
        }

        #divSize {            
            float: left;           
        }

        #divBotaoExcel {            
            float: left;
            margin-left: 10px;
            margin-top: 2px;
        }

        #divQuadrante {            
            margin-top: 8px;            
            width: 600px;
            line-break:normal
        }

        #divProdutos {
            margin-top: 2px;
            float:left;
            width: 530px;
        }

        #divFilial {
            clear:both;
            margin-top: 2px;
            float:left;
            
        }


    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divProdutos">
        <uc1:wucProdutoEncontra runat="server" ID="cboProduto" />
    </div>

    <div id="divBotaoExcel">
        <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="grid" />
    </div>

    <div id="divQuadrante">
    
        <div id="divPeriodo">
            <uc1:wucListaDia runat="server" ID="cboPeriodo" />
        </div>

        <div id="divBotaoAtualizar">
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis" Height="15px">
                <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
            </dx:ASPxButton>
        </div>


        <div id="divFilial">
            <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
        </div>
</div>



    

    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>

                 <%--Arraste seu controle aqui --%>      
                    <dxchartsui:WebChartControl ID="graph" runat="server" DataSourceID="dsGraph" Height="500px" Width="1800px">
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
                                    <range sidemarginsenabled="True" AlwaysShowZeroLevel="False" />
                                    <numericoptions format="Number" precision="0" />
                                </axisy>
                            </cc1:XYDiagram>
                        </diagramserializable>
<FillStyle><OptionsSerializable>
<cc1:SolidFillOptions></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>

                        <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" direction="BottomToTop" maxverticalpercentage="6">
                            <margins left="2" right="3" />
                        </legend>
                        <seriesserializable>
                            <cc1:Series ArgumentDataMember="HoraMinuto" Name="Estoque em Quantidade" ValueDataMembersSerializable="Estoque_Qtde" LabelsVisibility="True">
                                <viewserializable>
                                    <cc1:AreaSeriesView Color="195, 255, 192, 192" MarkerVisibility="False" Transparency="60">
                                        <markeroptions BorderVisible="False">
                                        </markeroptions>
                                    </cc1:AreaSeriesView>
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
                            <cc1:Series ArgumentDataMember="HoraMinuto" LabelsVisibility="True" Name="Quantidade Vendida" ValueDataMembersSerializable="QtdeGrafico">
                                <viewserializable>
                                    <cc1:SideBySideBarSeriesView BarWidth="0.3" Color="SteelBlue">
                                        <fillstyle fillmode="Solid">
                                            <optionsserializable>
                                                <cc1:SolidFillOptions />
                                            </optionsserializable>
                                        </fillstyle>
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
                                                <valuenumericoptions format="Number" precision="0" />
                                            </cc1:PointOptions>
                                        </pointoptionsserializable>
                                    </cc1:SideBySideBarSeriesLabel>
                                </labelserializable>
                                <legendpointoptionsserializable>
                                    <cc1:PointOptions>
                                        <valuenumericoptions format="Number" Precision="0" />
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

<CrosshairOptions><CommonLabelPositionSerializable>
<cc1:CrosshairMousePosition></cc1:CrosshairMousePosition>
</CommonLabelPositionSerializable>
</CrosshairOptions>

<ToolTipOptions><ToolTipPositionSerializable>
<cc1:ToolTipMousePosition></cc1:ToolTipMousePosition>
</ToolTipPositionSerializable>
</ToolTipOptions>
                    </dxchartsui:WebChartControl>                      
                    
                    <asp:SqlDataSource ID="dsGraph" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" SelectCommand="usp_Buscar_Venda_Item_5_Minutos" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                            <asp:SessionParameter Name="idProduto" SessionField="sPRODUTO" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <br />

                    <div id="divFalta">
                        <asp:Label ID="lblFalta" runat="server" Text="Label"></asp:Label>
                         <asp:Label ID="lblEstoque" runat="server" Text="Label"></asp:Label>
                    </div>
                    
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>



</asp:Content>


