<%@ Page Title="Colomba - Páscoa" Language="VB" MasterPageFile="~/MemberPages/mpCampanha_Pascoa.master" AutoEventWireup="false" CodeFile="Campanha_Pascoa_Colomba.aspx.vb" Inherits="MemberPages_Campanha_Pascoa_Colomba" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dxpgw" %>


<%@ Register assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>

<%@ Register src="../../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>
<%@ Register src="../../../Controles/wucBotaoExcel.ascx" tagname="wucBotaoExcel" tagprefix="uc2" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    
    <style type="text/css">

        #divAno {            
            float: left;
            margin-left: 5px;
        }

        #divTitulo {            
            float: left;
            margin-left: 5px;
            margin-top: 4px;
        }

        #divTitulo1 {            
            float: left;
            margin-left: 5px;
            margin-top: 4px;
        }

        #divExcelPrincipal {            
            float: left;
            margin-left: 85px;
        }

        #divExibirLucro {            
            float: left;
            margin-left: 25px;
        }

        #divGridPrincipal {
            clear: both;
            float : left;
            margin-left: 5px;
        }

        #divComparativo {
            clear:both;
            float: left;
            margin-left: 5px;
            margin-top: 20px;
        }

        #divGrafico {
            clear: both;
            float : left;
            margin-left: 5px;
            margin-top: 20px;
        }

        #divTodosItens {
            clear:both;
            float: left;
            margin-left: 5px;
            margin-top: 20px;
        }

        #divExcelItens {
            clear:both;
            float: left;
            margin-left: 5px;
            margin-top: 5px;
        }

 </style>

    <div id="divAno">
        <uc1:wucAno ID="cboAno" runat="server" />
    </div>

    <div id="divTitulo">
        <asp:Label ID="lblTitulo" runat="server" Text="Label" Font-Bold="False" ForeColor="#666666"></asp:Label>
    </div>

    <div id="divTitulo1">
        <asp:Label ID="lblTitulo1" runat="server" Font-Bold="False" ForeColor="#666666"  Text="Label"></asp:Label>
    </div>

    <div id="divExcelPrincipal">
        <uc2:wucBotaoExcel ID="wucBotaoExcel1" runat="server" CallGridViewID="ASPxGridView1" />
    </div>

    <div id="divExibirLucro">
          <dxe:ASPxCheckBox ID="ChkLucratividade" runat="server" Text="Ver Lucro" AutoPostBack="true" Checked="false" Theme="DevEx"   ></dxe:ASPxCheckBox>
    </div>

        <div id="divGridPrincipal">
                    <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" 
                        AutoGenerateColumns="False" 
                        CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                        CssPostfix="Office2003_Blue" DataSourceID="dsSuper" 
                        Width="990px" KeyFieldName="idFilial" Theme="DevEx" EnableTheming="True">
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                            CssPostfix="Office2003_Blue">
                            <Header ImageSpacing="5px" SortingImageSpacing="5px" HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#EAF5FF">
                            </AlternatingRow>
                            <Footer Font-Bold="True">
                            </Footer>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                            <TitlePanel  ForeColor="#666666" Font-Bold="True" Font-Size="Medium">
                            </TitlePanel>
                        </Styles>
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Images ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                            <CollapsedButton Height="12px" 
                                Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                                Width="11px" />
                            <ExpandedButton Height="12px" 
                                Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" Width="11px" />
                            <DetailCollapsedButton Height="12px" 
                                Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                                Width="11px" />
                            <DetailExpandedButton Height="12px" 
                                Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" Width="11px" />
                            <FilterRowButton Height="13px" Width="13px" />
                        </Images>
                        <SettingsText Title="Análise da Páscoa 2012" />
                        <TotalSummary>
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAA" SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresQtde" SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="VendaAA" SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Venda" SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresVenda" SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="MargemAA" SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Margem" SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dif" SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroAA" SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Lucro" SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresLucro" SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeEstoque" SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="TotalQuilos" SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrEstoque" SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numCliente" SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numClienteAA" SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difCliente" SummaryType="Custom" />
                        </TotalSummary>
                        <Columns>
                            
                            <dxwgv:GridViewDataTextColumn FieldName="idFilial" Visible="false"  Caption="Filial" Width="40" VisibleIndex="0" FixedStyle="Left">
                            </dxwgv:GridViewDataTextColumn>
                             <dxwgv:GridViewDataTextColumn FieldName="Descricao" Caption="Descrição" Width="140px" VisibleIndex="1" FixedStyle="Left">
                                 <CellStyle Wrap="False">
                                 </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            
                            <dxwgv:GridViewBandColumn Caption="Volume" ToolTip="Comparativo do ano atual versus ano anterior do volume de vendas de ovos de páscoa." VisibleIndex="2">
                                <Columns>
                                    <dxwgv:GridViewDataTextColumn Caption="2012" FieldName="QtdeAA" VisibleIndex="0" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="2013" FieldName="Qtde" VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="Blue">
                                        </FooterCellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresQtde" VisibleIndex="2" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                            </dxwgv:GridViewBandColumn>
                            <dxwgv:GridViewBandColumn Caption="Vendas R$" ToolTip="Comparativo do ano atual versus ano anterior das vendas de ovos de páscoa." VisibleIndex="3">
                                <Columns>
                                    <dxwgv:GridViewDataTextColumn Caption="2012" FieldName="VendaAA" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="2013" FieldName="Venda" VisibleIndex="1" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="Blue">
                                        </FooterCellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresVenda" VisibleIndex="2" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                            </dxwgv:GridViewBandColumn>
                            <dxwgv:GridViewBandColumn Caption="Margem com Sell-Out" ToolTip="Comparativo do ano atual versus ano anterior da margem de ovos de páscoa." VisibleIndex="4" Name="bandMargem">
                                <Columns>
                                    <dxwgv:GridViewDataTextColumn Caption="2012" FieldName="MargemAA" VisibleIndex="0" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="2014" FieldName="Margem" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="Blue">
                                        </FooterCellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Dif." FieldName="Dif" VisibleIndex="2" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                            </dxwgv:GridViewBandColumn>
                            
                            <dxwgv:GridViewBandColumn Caption="Nº de Clientes" ToolTip="Número de clientes que compraram Ovos de Páscoa" VisibleIndex="6">
                                <Columns>
                                    <dxwgv:GridViewDataTextColumn Caption="2013" FieldName="numCliente" VisibleIndex="1" Width="85px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="2012" FieldName="numClienteAA" VisibleIndex="0" Width="85px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Dif." FieldName="difCliente" ToolTip="Diferença de número de clientes entre esse ano e ano passado." VisibleIndex="2" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                            </dxwgv:GridViewBandColumn>
                            
                            <dxwgv:GridViewDataTextColumn FieldName="Ordem" VisibleIndex="9" Visible ="false" >
                                
                            </dxwgv:GridViewDataTextColumn>
                            
                            <dxwgv:GridViewBandColumn Caption="Lucro" ToolTip="Comparativo do ano atual versus ano anterior da lucratividade de ovos de páscoa." VisibleIndex="5" Name="bandLucro" Visible="False">
                                <Columns>
                                    <dxwgv:GridViewDataTextColumn Caption="2012" FieldName="LucroAA" VisibleIndex="0" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="2013" FieldName="Lucro" VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="Blue">
                                        </FooterCellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresLucro" VisibleIndex="2" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                            </dxwgv:GridViewBandColumn>
                            
                            <dxwgv:GridViewBandColumn Caption="Estoques" VisibleIndex="8" Name="bandEstoque" Visible="False">
                                <Columns>
                                    <dxwgv:GridViewDataTextColumn Caption="Volume" FieldName="QtdeEstoque" VisibleIndex="0" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="vlrEstoque" ToolTip="Valor do estoque pelo Custo Condor" VisibleIndex="2" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Peso" FieldName="TotalQuilos" ToolTip="Peso multiplicado de cada ovos" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                            </dxwgv:GridViewBandColumn>
                            
                        </Columns>
                        <Settings ShowTitlePanel="True" ShowVerticalScrollBar="True" 
                            VerticalScrollableHeight="400" ShowFooter="True" HorizontalScrollBarMode="Visible" />
                        <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                    </dxwgv:ASPxGridView>

    </div>


    <div id="divGrafico">
<dxchartsui:WebChartControl ID="WebChartControl1" runat="server" 
                        BackColor="Transparent" DataSourceID="dsCrescimento" 
                         Height="350px" Width="990px">
                        <SeriesSerializable>
                            <cc1:Series ArgumentDataMember="Descricao" Name="Series 1" ValueDataMembersSerializable="VendaAA1" ArgumentScaleType="Qualitative" LabelsVisibility="True" SynchronizePointOptions="False">
                                <viewserializable>
                                    <cc1:DoughnutSeriesView RuntimeExploding="False">
                                    </cc1:DoughnutSeriesView>
                                </viewserializable>
                                <labelserializable>
                                    <cc1:DoughnutSeriesLabel LineVisible="True" EnableAntialiasing="True" ResolveOverlappingMode="Default">
                                        <fillstyle>
                                            <optionsserializable>
                                                <cc1:SolidFillOptions />
                                            </optionsserializable>
                                        </fillstyle>
                                        <pointoptionsserializable>
                                            <cc1:PiePointOptions>
                                                <valuenumericoptions format="Percent" />
                                            </cc1:PiePointOptions>
                                        </pointoptionsserializable>
                                    </cc1:DoughnutSeriesLabel>
                                </labelserializable>
                                <legendpointoptionsserializable>
                                    <cc1:PiePointOptions PointView="Argument">
                                        <valuenumericoptions format="Percent" />
                                    </cc1:PiePointOptions>
                                </legendpointoptionsserializable>
                            </cc1:Series>
                            <cc1:Series ArgumentDataMember="Descricao" Name="Series 2" ValueDataMembersSerializable="VendaAA" ArgumentScaleType="Qualitative" CrosshairHighlightPoints="True" CrosshairLabelVisibility="True" LabelsVisibility="True" ShowInLegend="False" SynchronizePointOptions="False">
                                <viewserializable>
                                    <cc1:DoughnutSeriesView RuntimeExploding="False">
                                    </cc1:DoughnutSeriesView>
                                </viewserializable>
                                <labelserializable>
                                    <cc1:DoughnutSeriesLabel LineVisible="True" EnableAntialiasing="True" ResolveOverlappingMode="Default">
                                        <fillstyle>
                                            <optionsserializable>
                                                <cc1:SolidFillOptions />
                                            </optionsserializable>
                                        </fillstyle>
                                        <pointoptionsserializable>
                                            <cc1:PiePointOptions>
                                                <valuenumericoptions format="Percent" />
                                            </cc1:PiePointOptions>
                                        </pointoptionsserializable>
                                    </cc1:DoughnutSeriesLabel>
                                </labelserializable>
                                <legendpointoptionsserializable>
                                    <cc1:PiePointOptions PointView="Argument">
                                        <valuenumericoptions format="Percent" />
                                    </cc1:PiePointOptions>
                                </legendpointoptionsserializable>
                            </cc1:Series>
                            <cc1:Series ArgumentDataMember="Descricao" Name="Series 3" ValueDataMembersSerializable="Venda" ArgumentScaleType="Qualitative" CrosshairHighlightPoints="True" CrosshairLabelVisibility="True" LabelsVisibility="True" ShowInLegend="False" SynchronizePointOptions="False">
                                <viewserializable>
                                    <cc1:DoughnutSeriesView RuntimeExploding="False">
                                    </cc1:DoughnutSeriesView>
                                </viewserializable>
                                <labelserializable>
                                    <cc1:DoughnutSeriesLabel LineVisible="True" EnableAntialiasing="True" ResolveOverlappingMode="Default">
                                        <fillstyle>
                                            <optionsserializable>
                                                <cc1:SolidFillOptions />
                                            </optionsserializable>
                                        </fillstyle>
                                        <pointoptionsserializable>
                                            <cc1:PiePointOptions>
                                                <valuenumericoptions format="Percent" />
                                            </cc1:PiePointOptions>
                                        </pointoptionsserializable>
                                    </cc1:DoughnutSeriesLabel>
                                </labelserializable>
                                <legendpointoptionsserializable>
                                    <cc1:PiePointOptions PointView="Argument">
                                        <valuenumericoptions format="Percent" />
                                    </cc1:PiePointOptions>
                                </legendpointoptionsserializable>
                            </cc1:Series>
                        </SeriesSerializable>
<SeriesTemplate   >
<ViewSerializable>
    <cc1:DoughnutSeriesView RuntimeExploding="False">
    </cc1:DoughnutSeriesView>
</ViewSerializable>

<LabelSerializable>
    <cc1:DoughnutSeriesLabel LineVisible="True">
        <fillstyle>
            <optionsserializable>
                <cc1:SolidFillOptions />
            </optionsserializable>
        </fillstyle>
        <pointoptionsserializable>
            <cc1:PiePointOptions>
            </cc1:PiePointOptions>
<cc1:PointOptions></cc1:PointOptions>
        </pointoptionsserializable>
    </cc1:DoughnutSeriesLabel>
</LabelSerializable>

<PointOptionsSerializable>
<cc1:PointOptions HiddenSerializableString="to be serialized"></cc1:PointOptions>
</PointOptionsSerializable>

<LegendPointOptionsSerializable>
    <cc1:PiePointOptions>
    </cc1:PiePointOptions>
</LegendPointOptionsSerializable>
</SeriesTemplate>

                        <DiagramSerializable>
                            <cc1:SimpleDiagram EqualPieSize="False">
                            </cc1:SimpleDiagram>
</DiagramSerializable>

<FillStyle FillMode="Empty">
</FillStyle>
                        <Legend AlignmentHorizontal="Center" AlignmentVertical="BottomOutside" 
                            BackColor="Transparent" Direction="LeftToRight"></Legend>
                        <Titles>
                            <cc1:ChartTitle Font="Tahoma, 14pt" Text="Comparativo de Páscoa - 2016, 2017 e 2018
" TextColor="128, 128, 128" Indent="1" />
                        </Titles>

<CrosshairOptions><CommonLabelPositionSerializable>
<cc1:CrosshairMousePosition></cc1:CrosshairMousePosition>
</CommonLabelPositionSerializable>
</CrosshairOptions>

<ToolTipOptions><ToolTipPositionSerializable>
<cc1:ToolTipMousePosition></cc1:ToolTipMousePosition>
</ToolTipPositionSerializable>
</ToolTipOptions>
                    </dxchartsui:WebChartControl>
                    <asp:SqlDataSource ID="dsCrescimento" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                        SelectCommand="Pascoa.uspGraficoParticipacao" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                            <asp:SessionParameter Name="Ano" SessionField="sANO" />
                        </SelectParameters>
                    </asp:SqlDataSource>
    </div>

    <div id="divComparativo">
<dxwgv:ASPxGridView ID="gridMeta" runat="server" AutoGenerateColumns="False" 
                        CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" CssPostfix="Office2003_Blue" 
                        DataSourceID="dsMeta" KeyFieldName="Descricao" Width="470px" Theme="DevEx">
                        <SettingsBehavior AllowFocusedRow="True" />
                        <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                            CssPostfix="Office2003_Blue">
                            <Header ImageSpacing="5px" SortingImageSpacing="5px" HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#E6F2FF"></AlternatingRow>
                            <Footer Font-Bold="True">
                            </Footer>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
                            <TitlePanel Font-Size="Medium" ForeColor="#666666">
                            </TitlePanel>
                        </Styles>
                        <SettingsPager Mode="ShowAllRecords">
                            <AllButton Text="All">
                            </AllButton>
                            <NextPageButton Text="Next &gt;">
                            </NextPageButton>
                            <PrevPageButton Text="&lt; Prev">
                            </PrevPageButton>
                        </SettingsPager>
                        <Images ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                            <DetailCollapsedButton Height="12px" 
                                Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                                Width="11px" />
                            <DetailExpandedButton Height="12px" 
                                Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" Width="11px" />
                            <FilterRowButton Height="13px" Width="13px" />
                            <CollapsedButton Height="12px" 
                                Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                                Width="11px" />
                            <ExpandedButton Height="12px" 
                                Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" 
                                Width="11px" />
                        </Images>
                        <SettingsText Title="Comparativo Ovos de Páscoa - Meta x Realizado" />
                        <TotalSummary>
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="VendaAA" SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Meta" SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Real" SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Part" SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />
                        </TotalSummary>
                        <Columns>
                            <dxwgv:GridViewDataTextColumn Caption="Descrição" FieldName="Descricao" 
                                VisibleIndex="0" Width="130px">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="2012" FieldName="VendaAA" 
                                VisibleIndex="1" Width="85px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            
                            <dxwgv:GridViewDataTextColumn Caption="Meta 2013" FieldName="Meta" 
                                VisibleIndex="2" Width="85px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle ForeColor="#009900">
                                </CellStyle>
                                <FooterCellStyle ForeColor="#009900">
                                </FooterCellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            
                            <dxwgv:GridViewDataProgressBarColumn Caption="% Ating." FieldName="Part" 
                                VisibleIndex="4" Width="80px">
                                <PropertiesProgressBar Height="" Width="">
                                </PropertiesProgressBar>
                                <FooterCellStyle HorizontalAlign="Center">
                                </FooterCellStyle>
                            </dxwgv:GridViewDataProgressBarColumn>
                            
                            <dxwgv:GridViewDataTextColumn FieldName="Real" VisibleIndex="3" Width="85px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <CellStyle ForeColor="Blue">
                                </CellStyle>
                                <FooterCellStyle ForeColor="Blue">
                                </FooterCellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            
                            <dxwgv:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc" ToolTip="Percentual de crescimento sobre o ano anterior" VisibleIndex="5" Width="70px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            
                        </Columns>
                        <Settings ShowTitlePanel="True" ShowVerticalScrollBar="True" 
                            VerticalScrollableHeight="225" ShowFooter="True" />
                        <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                    </dxwgv:ASPxGridView>

                    <asp:SqlDataSource ID="dsMeta" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>"                   
                        SelectCommand="Pascoa.uspBuscarComparativo" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="idCampanha" Type="Byte" />
                            <asp:SessionParameter Name="Ano" SessionField="sANO" />
                            <asp:SessionParameter DefaultValue="" Name="Cod" SessionField="sCOD" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>
    </div>

    <div id="divTodosItens">
<dxwgv:ASPxGridView ID="gridTodosItens" runat="server" AutoGenerateColumns="False" DataSourceID="dsTodos" EnableTheming="True" Theme="DevEx" Width="990px" >
                            <TotalSummary>
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdVendas" SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Venda" SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroComercial" SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" SummaryType="Custom" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="qtdeEstoque" SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="TotalQuilos" SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrEstoque" SummaryType="Sum" />
                            </TotalSummary>
                               <GroupSummary>
                                   <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdVendas" ShowInGroupFooterColumn="QtdVendas" SummaryType="Sum" />
                                   <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Venda" ShowInGroupFooterColumn="Venda" SummaryType="Sum" />
                                   <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroComercial" ShowInGroupFooterColumn="LucroComercial" SummaryType="Sum" />
                                   <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" ShowInGroupFooterColumn="percMargem" SummaryType="Custom" />
                                   <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="qtdeEstoque" ShowInGroupFooterColumn="qtdeEstoque" SummaryType="Sum" />
                                   <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="TotalQuilos" ShowInGroupFooterColumn="TotalQuilos" SummaryType="Sum" />
                                   <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrEstoque" ShowInGroupFooterColumn="vlrEstoque" SummaryType="Sum" />
                               </GroupSummary>
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Cod" FieldName="CodProduto" VisibleIndex="1" Width="60px">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Descrição do Produto" FieldName="DescProduto" VisibleIndex="2" Width="210px">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle Wrap="False">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewBandColumn Caption="Vendas" VisibleIndex="3">
                                    <Columns>
                                        <dxwgv:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendas" VisibleIndex="0" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                            </PropertiesTextEdit>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="Venda" VisibleIndex="1" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                            </PropertiesTextEdit>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Lucro" FieldName="LucroComercial" VisibleIndex="2" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                            </PropertiesTextEdit>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="% Mrg" FieldName="percMargem" ReadOnly="True" VisibleIndex="3" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                    </Columns>
                                </dxwgv:GridViewBandColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Pos." FieldName="Ranking" VisibleIndex="0" Width="40px" ToolTip="Posição">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                    </PropertiesTextEdit>
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Fornecedor" FieldName="descFornecedor" VisibleIndex="8" Width="150px">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewBandColumn Caption="Estoques" VisibleIndex="9" Visible="False">
                                    <Columns>
                                        <dxwgv:GridViewDataTextColumn Caption="Volume" FieldName="qtdeEstoque" VisibleIndex="0" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Peso" FieldName="TotalQuilos" VisibleIndex="1" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="vlrEstoque" VisibleIndex="2" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dxwgv:GridViewDataTextColumn>
                                    </Columns>
                                </dxwgv:GridViewBandColumn>
                            </Columns>
                            <SettingsBehavior ColumnResizeMode="Control" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Settings ShowTitlePanel="True" ShowFooter="True" ShowVerticalScrollBar="True" VerticalScrollableHeight="450" ShowGroupPanel="true" ShowGroupFooter="VisibleAlways"  />
                            <SettingsText Title="Ovos de Páscoa - Todos Itens" EmptyDataRow="Não há informações disponiveis" GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <Footer Font-Bold="True">
                                </Footer>
                                <GroupFooter BackColor="#DDDDDD" Font-Bold="True">
                                </GroupFooter>
                                <TitlePanel Font-Bold="True" Font-Size="Medium">
                                </TitlePanel>                    
	                            <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
	                            <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>


                            </Styles>
                        </dxwgv:ASPxGridView>

            <asp:SqlDataSource ID="dsTodos" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="Pascoa.uspBuscarTodosItens" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                    <asp:SessionParameter Name="Cod" SessionField="sCOD" Type="Byte" />
                </SelectParameters>
            </asp:SqlDataSource> 


    </div>

    <div id="divExcelItens">
        <uc1:wucBotaoExcel runat="server" ID="wucBotaoExcel" CallGridViewID="gridTodosItens" />
    </div>


                    <asp:SqlDataSource ID="dsSuper" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>"                  
                        
                        
                        SelectCommand="Pascoa.uspBuscarAnaliseTotalPorCod" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="idCampanha" SessionField="sCAMPANHA" />
                            <asp:SessionParameter Name="Ano" SessionField="sANO" />
                            <asp:SessionParameter Name="Cod" SessionField="sCOD" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <dxwgv:ASPxGridViewExporter ID="ExporterExcel1" runat="server" 
                        FileName="Total Pascoa" GridViewID="ASPxGridView1">
                    </dxwgv:ASPxGridViewExporter>


    <div>
    </div>



</asp:Content>

