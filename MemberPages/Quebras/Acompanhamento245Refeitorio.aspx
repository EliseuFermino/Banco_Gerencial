<%@ Page Title="Acompanhamento Agenda 245 - Cozinha" Language="VB"  MasterPageFile="~/MemberPages/SiteDespesas.master" AutoEventWireup="false" CodeFile="Acompanhamento245Refeitorio.aspx.vb" Inherits="MemberPages_Quebras_Acompanhamento245Refeitorio" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>


	<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>






<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>







<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divAno {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divMes {            
            float: left;
            margin-left: 10px;
        }

        #divFilial {            
            float: left;
            margin-left: 10px;
        }

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
        }

        #divBotaoExcel {            
            float: left;
            margin-left: 10px;
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divAno">
        <uc1:wucAno runat="server" ID="cboAno" />
    </div>

    <div id="divMes">
        <uc1:wuciListaMes runat="server" ID="cboMes" />
    </div>

    <div id="divFilial">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

    <div id="divBotaoExcel">
        <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="grid" />
    </div>




    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>
                    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsDados" AutoGenerateColumns="False" Width="550px" KeyFieldName="DescDia">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrMA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrAT" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrMeta" SummaryType="Sum" />
                        </TotalSummary>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="DescDia" ShowInCustomizationForm="True" VisibleIndex="0" Width="100px" Caption="Dia">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Agenda 245 em R$" ShowInCustomizationForm="True" VisibleIndex="1">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Jan/2016" FieldName="vlrAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px" ToolTip="Mesmos dias">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="Silver" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Dez/2016" FieldName="vlrMA" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Meta" ShowInCustomizationForm="True" VisibleIndex="2" Width="90px" ToolTip="Meta de Agenda 245" FieldName="vlrMeta">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="#009900" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Jan/2017" FieldName="vlrAT" ShowInCustomizationForm="True" VisibleIndex="3" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle ForeColor="Blue" />
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="Blue">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn Caption="% Ating" FieldName="percAting" ShowInCustomizationForm="True" ToolTip="Percentual de atingimento da meta" VisibleIndex="3" Width="70px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Auto" ShowFooter="True" ShowTitlePanel="True" VerticalScrollableHeight="300" VerticalScrollBarMode="Auto" />
                        <SettingsLoadingPanel Text="Atualizando&amp;hellip;" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#F3F3F3">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF66" ForeColor="Blue">
                            </FocusedRow>
                            <Footer Font-Bold="True">
                            </Footer>
                        </Styles>
                    </dx:ASPxGridView>                    
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="uspAnaliseAgenda245" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <br />

                    <dxchartsui:WebChartControl ID="graph_13meses" runat="server" DataSourceID="dsGrafico" Height="250px" Width="820px">
                        <diagramserializable>
                            <cc1:XYDiagram>
                                <axisx visibleinpanesserializable="-1">
                                    <range sidemarginsenabled="True" />
                                </axisx>
                                <axisy visible="False" visibleinpanesserializable="-1">
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
                            <cc1:Series ArgumentDataMember="desc_AnoMes" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="vlrTotal">
                                <viewserializable>
                                    <cc1:LineSeriesView MarkerVisibility="True">
                                        <linemarkeroptions size="5" BorderVisible="True">
                                        </linemarkeroptions>
                                    </cc1:LineSeriesView>
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
                            <cc1:ChartTitle Font="Tahoma, 11pt, style=Bold" Text="Agenda 245 - Cozinha - Mês a Mês" />
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

                    <asp:SqlDataSource ID="dsGrafico" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="usp_Agenda245_Cozinha_GraficoMensal" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>


                    <br />

                    <dxchartsui:WebChartControl ID="gridGraficoSecao" runat="server" DataSourceID="dsGraficoSecao" Height="450px" Width="820px">
                        <diagramserializable>
                            <cc1:XYDiagram>
                                <axisx visibleinpanesserializable="-1">
                                    <range sidemarginsenabled="True" />
                                </axisx>
                                <axisy visible="False" visibleinpanesserializable="-1">
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
                            <cc1:Series ArgumentDataMember="desc_AnoMes" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="vlrTotal" SeriesPointsSorting="Ascending">
                                <viewserializable>
                                    <cc1:LineSeriesView MarkerVisibility="True">
                                        <linemarkeroptions size="5" BorderVisible="True">
                                        </linemarkeroptions>
                                    </cc1:LineSeriesView>
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
                            <cc1:ChartTitle Font="Tahoma, 11pt, style=Bold" Text="Agenda 245 - Cozinha - Por Seção - Período Selecionado" />
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

                    <asp:SqlDataSource ID="dsGraficoSecao" runat="server" ConnectionString="<%$ ConnectionStrings:gerDespesasConnectionString %>" SelectCommand="dbo.usp_TotalAgenda245_Cozinha_porSecao_AnoMesLojas" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>





                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>

    <br />




    <br />

    <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="Banco: gerPerdas" Anotacao2="grid = dbo.uspAnaliseAgenda245  |  grafico = dbo.usp_Agenda245_Cozinha_GraficoMensal" />

</asp:Content>


