<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/SiteDespesas.master" AutoEventWireup="false" CodeFile="graphAlimTransp.aspx.vb" Inherits="MemberPages_Despesas_graphAlimTransp" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>






<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>






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

    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>
                  
                    <dxchartsui:WebChartControl ID="graph" runat="server" AppearanceNameSerializable="In A Fog" DataSourceID="dsDados" Height="500px" Width="800px">
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

                        <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxhorizontalpercentage="99" maxverticalpercentage="5">
                            <margins bottom="1" left="1" right="1" top="1" />
                        </legend>
                        <seriesserializable>
                            <cc1:Series ArgumentDataMember="Mes" LabelsVisibility="True" LegendText="Vale Transporte" Name="Series 2" SeriesPointsSorting="Ascending" ValueDataMembersSerializable="vlrValeTransporte">
                                <viewserializable>
                                    <cc1:StackedAreaSeriesView Transparency="80">
                                    </cc1:StackedAreaSeriesView>
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
                            <cc1:Series ArgumentDataMember="Mes" LabelsVisibility="True" LegendText="Alimentação" Name="Series 1" ValueDataMembersSerializable="vlrAlimentacao">
                                <viewserializable>
                                    <cc1:StackedLineSeriesView MarkerVisibility="True">
                                        <linestyle thickness="3" />
                                        <linemarkeroptions size="7"  BorderVisible="True">
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
                                                <valuenumericoptions format="Number" precision="0" />
                                            </cc1:PointOptions>
                                        </pointoptionsserializable>
                                    </cc1:StackedLineSeriesLabel>
                                </labelserializable>
                                <legendpointoptionsserializable>
                                    <cc1:PointOptions>
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

<CrosshairOptions><CommonLabelPositionSerializable>
<cc1:CrosshairMousePosition></cc1:CrosshairMousePosition>
</CommonLabelPositionSerializable>
</CrosshairOptions>

<ToolTipOptions><ToolTipPositionSerializable>
<cc1:ToolTipMousePosition></cc1:ToolTipMousePosition>
</ToolTipPositionSerializable>
</ToolTipOptions>
                    </dxchartsui:WebChartControl>                      
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerDespesasConnectionString %>" SelectCommand="usp_Alimentacao_ValeTrtansporte" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

    <br />

                    <dx:ASPxGridView ID="grid_Cozinha_Analitica" runat="server" AutoGenerateColumns="False" DataSourceID="dsCozinha" KeyFieldName="SECAO" Width="800px">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="VALOR" SummaryType="Sum" />
                        </TotalSummary>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="ANO" ShowInCustomizationForm="True" VisibleIndex="0" Caption="Ano" Width="50px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="MES" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Mes" Width="50px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="LOJA" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Loja" Visible="False" Width="50px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="CODIGO" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Código" SortIndex="0" SortOrder="Ascending" Width="50px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="Descricao" ShowInCustomizationForm="True" VisibleIndex="4" Width="150px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="AGENDA" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Agenda" Width="50px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="SECAO" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Centro-Custo">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="FONTE" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Fonte">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="VALOR" ShowInCustomizationForm="True" VisibleIndex="8" Caption="Valor">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <FooterCellStyle Font-Bold="True">
                                </FooterCellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="DATA" ShowInCustomizationForm="True" VisibleIndex="9" Caption="Data">
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn FieldName="CCUSTO" ShowInCustomizationForm="True" VisibleIndex="10" Caption="Descrição Centro de Custo" Width="150px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings ShowFooter="True" HorizontalScrollBarMode="Auto" VerticalScrollableHeight="250" VerticalScrollBarMode="Auto" />
                        <Styles>
                            <AlternatingRow BackColor="#E9E9E9">
                            </AlternatingRow>
                        </Styles>
                    </dx:ASPxGridView>

                    <asp:SqlDataSource ID="dsCozinha" runat="server" ConnectionString="<%$ ConnectionStrings:gerDespesasConnectionString %>" SelectCommand="usp_Abertura_Cozinha_Por_Conta" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

    <br />

                    <dx:ASPxGridView ID="grid_Cozinha_Agenda245" runat="server" AutoGenerateColumns="False" DataSourceID="dsCozinha_245" KeyFieldName="SECAO" Width="800px">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="VALOR" SummaryType="Sum" />
                        </TotalSummary>
                        <GroupSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{c2}" FieldName="VALOR" SummaryType="Sum" />
                        </GroupSummary>
                        <Columns>
                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" Visible="False" VisibleIndex="0" ShowClearFilterButton="True"/>
<dx:GridViewDataTextColumn FieldName="DESCRICAO" ShowInCustomizationForm="True" VisibleIndex="1" FixedStyle="Left" Width="250px">
    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
    <CellStyle Wrap="False">
    </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="NOTA" ShowInCustomizationForm="True" VisibleIndex="2" FixedStyle="Left" Width="60px">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="DATA" ShowInCustomizationForm="True" VisibleIndex="3" FixedStyle="Left" Width="80px">
    <PropertiesTextEdit DisplayFormatString="{0:dd/MM/yyyy} " EncodeHtml="False">
    </PropertiesTextEdit>
    <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="ANO" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Ano" Width="50px">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="MES" ShowInCustomizationForm="True" VisibleIndex="5" Caption="Mes" Width="50px">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="LOJA" ShowInCustomizationForm="True" VisibleIndex="7" Caption="Loja" Visible="False" Width="50px">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="CODIGO" ShowInCustomizationForm="True" VisibleIndex="8" Caption="Conta" SortIndex="0" SortOrder="Ascending" Width="50px">
                            </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Desc1" ShowInCustomizationForm="True" Caption="Descrição da Conta" VisibleIndex="9" Width="150px"></dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="AGENDA" ShowInCustomizationForm="True" VisibleIndex="10" Caption="Agenda" Width="50px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="SECAO" ShowInCustomizationForm="True" VisibleIndex="11" Caption="Centro-Custo">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="FONTE" ShowInCustomizationForm="True" VisibleIndex="12" Caption="Fonte">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="VALOR" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Valor">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                                <FooterCellStyle Font-Bold="True">
                                </FooterCellStyle>
                            </dx:GridViewDataTextColumn>                            
                            <dx:GridViewDataTextColumn FieldName="CCUSTO" ShowInCustomizationForm="True" VisibleIndex="13" Caption="Descrição Centro de Custo" Width="150px">
                                <Settings AllowAutoFilter="True" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager NumericButtonCount="11">
                        </SettingsPager>
                        <Settings ShowFooter="True" HorizontalScrollBarMode="Auto" ShowFilterRow="True" VerticalScrollableHeight="250" VerticalScrollBarMode="Auto" ShowGroupPanel="True" />
                        <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
                        <Styles>
                            <AlternatingRow BackColor="#E9E9E9">
                            </AlternatingRow>
                        </Styles>
                    </dx:ASPxGridView>

                    <asp:SqlDataSource ID="dsCozinha_245" runat="server" ConnectionString="<%$ ConnectionStrings:gerDespesasConnectionString %>" SelectCommand="usp_Abertura_Cozinha_Insumos" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <uc1:wucBotaoExcel runat="server" ID="btnExcelItem" CallGridView="grid_Cozinha_Agenda245" />


                    <p id="divInfo">
                        O ideal é que a linha rosa (Alimentação) esteja dentro da área azul (Vale Transporte).
                    </p>
                    <p> Se a linha rosa ultrapassar a área azul quer dizer que o gasto com Alimentação é maior que o Vale Transporte.</p>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>



</asp:Content>

