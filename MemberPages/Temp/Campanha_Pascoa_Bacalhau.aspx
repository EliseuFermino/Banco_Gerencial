<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/mpCampanha_Pascoa.master" AutoEventWireup="false" CodeFile="Campanha_Pascoa_Bacalhau.aspx.vb" Inherits="MemberPages_Campanha_Pascoa_Bacalhau" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dxpgw" %>


<%@ Register assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>

<%@ Register src="../../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>
<%@ Register src="../../../Controles/wucBotaoExcel.ascx" tagname="wucBotaoExcel" tagprefix="uc2" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder3" Runat="Server">
    
    <table cellspacing="1" class="style1">
            <tr>
                <td colspan="2">
                    <asp:Panel ID="Panel1" runat="server" Width="950px">
                        <table cellspacing="1" class="style1">
                            <tr>
                                <td>
                                    <uc1:wucAno ID="cboAno" runat="server" />
                                </td>
                                <td style="width: 749px">
                                    <asp:Label ID="lblTitulo" runat="server" Text="Label" Font-Bold="False" 
                                        ForeColor="#666666"></asp:Label>
                                </td>
                                <td style="width: 583px">
                                    <asp:Label ID="lblTitulo1" runat="server" Font-Bold="False" ForeColor="#666666" 
                                        Text="Label"></asp:Label>
                                </td>
                                <td>
                                    <uc2:wucBotaoExcel ID="wucBotaoExcel1" runat="server" CallGridViewID="ASPxGridView1" />
                                </td>
                                <td>


                                    <dxe:ASPxButton ID="btnVerItens" runat="server" Text="Itens" Theme="Office2003Blue" ></dxe:ASPxButton>

                                    <asp:ModalPopupExtender ID="MPE_TodoItens" runat="server" 
                                        PopupControlID="Panel_Item" 
                                        TargetControlID="btnVerItens" 
                                        CancelControlID="btnClose" 
                                        BackgroundCssClass="modalBackground">
                                    </asp:ModalPopupExtender>

                                    <asp:Panel ID="Panel_Item" runat="server" CssClass="modalPopup">                                
                                        <asp:Button ID="btnClose" runat="server" Text="X" BackColor="Red" BorderStyle="None"  /><br />
                                         <%--INICIO GRID--%>
                                        
             <dxwgv:ASPxGridView ID="gridTodosItens" runat="server" AutoGenerateColumns="False" DataSourceID="dsTodos" EnableTheming="True" Theme="DevEx" Width="920px">
                            <TotalSummary>
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdVendas" SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Venda" SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroComercial" SummaryType="Sum" />
                                <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" SummaryType="Custom" />
                            </TotalSummary>
                               <GroupSummary>
                                   <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdVendas" ShowInGroupFooterColumn="Volume" SummaryType="Sum" />
                                   <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Venda" ShowInGroupFooterColumn="R$" SummaryType="Sum" />
                                   <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroComercial" ShowInGroupFooterColumn="Lucro" SummaryType="Sum" />
                                   <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" ShowInGroupFooterColumn="% Mrg" SummaryType="Custom" />
                               </GroupSummary>
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Cod" FieldName="CodProduto" VisibleIndex="1" Width="50px">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Descrição do Produto" FieldName="DescProduto" VisibleIndex="2" Width="150px">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendas" VisibleIndex="3" Width="60px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="Venda" VisibleIndex="4" Width="60px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Lucro" FieldName="LucroComercial" VisibleIndex="5" Width="50px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="% Mrg" FieldName="percMargem" ReadOnly="True" VisibleIndex="6" Width="40px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Top" FieldName="Ranking" VisibleIndex="0" Width="30px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                    </PropertiesTextEdit>
                                    <CellStyle HorizontalAlign="Center">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Fornecedor" FieldName="descFornecedor" VisibleIndex="7" Width="100px">
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Settings ShowTitlePanel="True" ShowFooter="True" ShowVerticalScrollBar="True" VerticalScrollableHeight="450" ShowGroupPanel="true" ShowGroupFooter="VisibleAlways"  />
                            <SettingsText Title="Bacalhau - Todos Itens" EmptyDataRow="Não há informações disponiveis" GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
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
            <uc1:wucBotaoExcel runat="server" ID="wucBotaoExcel" CallGridViewID="gridTodosItens" />


            <asp:SqlDataSource ID="dsTodos" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="SELECT [CodProduto], [DescProduto], [QtdVendas], [Venda], [LucroComercial], [percMargem], [Ranking],descFornecedor FROM Gerencial.[tblCampanhaTodosProdutos] WHERE ([AnoApuracao] = @AnoApuracao) AND Cod=5 ORDER BY [Ranking]">
                <SelectParameters>
                    <asp:SessionParameter Name="AnoApuracao" SessionField="sANO" Type="Int16" />
                </SelectParameters>
            </asp:SqlDataSource>
 

                                        <%--FIM GRID--%>
                                    </asp:Panel>

                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            <tr>
                <td rowspan="3">
                    <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" 
                        AutoGenerateColumns="False" 
                        CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                        CssPostfix="Office2003_Blue" DataSourceID="dsSuper" 
                        Width="950px" KeyFieldName="idFilial" Theme="DevEx">
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                            CssPostfix="Office2003_Blue">
                            <Header ImageSpacing="5px" SortingImageSpacing="5px" HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#EAF5FF">
                            </AlternatingRow>
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
                        <Columns>
                            
                            <dxwgv:GridViewDataTextColumn FieldName="idFilial" Visible="false"  Caption="Filial" Width="40" VisibleIndex="0">
                            </dxwgv:GridViewDataTextColumn>
                             <dxwgv:GridViewDataTextColumn FieldName="Descricao" Caption="Descrição" Width="150px" VisibleIndex="1">
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
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresQtde" VisibleIndex="2" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                            </dxwgv:GridViewBandColumn>
                            <dxwgv:GridViewBandColumn Caption="Vendas R$" ToolTip="Comparativo do ano atual versus ano anterior das vendas de ovos de páscoa." VisibleIndex="3">
                                <Columns>
                                    <dxwgv:GridViewDataTextColumn Caption="2012" FieldName="VendaAA" VisibleIndex="0" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="2013" FieldName="Venda" VisibleIndex="1" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresVenda" VisibleIndex="2" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                            </dxwgv:GridViewBandColumn>
                            <dxwgv:GridViewBandColumn Caption="Margem" ToolTip="Comparativo do ano atual versus ano anterior da margem de ovos de páscoa." VisibleIndex="4">
                                <Columns>
                                    <dxwgv:GridViewDataTextColumn Caption="2012" FieldName="MargemAA" ReadOnly="True" VisibleIndex="0" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="2013" FieldName="Margem" ReadOnly="True" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Dif." FieldName="Dif" VisibleIndex="2" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                            </dxwgv:GridViewBandColumn>
                            
                            <dxwgv:GridViewDataTextColumn FieldName="Ordem" VisibleIndex="6" Visible ="false" >
                                
                            </dxwgv:GridViewDataTextColumn>
                            
                            <dxwgv:GridViewBandColumn Caption="Lucratividade" ToolTip="Comparativo do ano atual versus ano anterior da lucratividade de ovos de páscoa." VisibleIndex="5">
                                <Columns>
                                    <dxwgv:GridViewDataTextColumn Caption="2012" FieldName="LucroAA" VisibleIndex="0" Width="70px">
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
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresLucro" VisibleIndex="2" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                            </dxwgv:GridViewBandColumn>
                            
                        </Columns>
                        <Settings ShowTitlePanel="True" ShowVerticalScrollBar="True" 
                            VerticalScrollableHeight="450" />
                        <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                    </dxwgv:ASPxGridView>
                </td>
                <td align="center" valign="top" style="width: 303px; height: 185px;">
                    <dxchartsui:WebChartControl ID="WebChartControl1" runat="server" 
                        BackColor="Transparent" DataSourceID="dsCrescimento" 
                         Height="200px" Width="300px">
                        <SeriesSerializable>
                            <cc1:Series ArgumentDataMember="Ano"  
                                Name="Series 1"  
                                 
                                ValueDataMembersSerializable="perc">
                                <ViewSerializable>
<cc1:SideBySideBarSeriesView ColorEach="True" HiddenSerializableString="to be serialized" 
                                    Transparency="75">
                                </cc1:SideBySideBarSeriesView>
</ViewSerializable>
                                <LabelSerializable>
<cc1:SideBySideBarSeriesLabel Font="Tahoma, 12pt" HiddenSerializableString="to be serialized" 
                                    LineVisible="True"  
                                    Position="Center">
                                    <FillStyle >
                                        <OptionsSerializable>
<cc1:SolidFillOptions HiddenSerializableString="to be serialized" />
</OptionsSerializable>
                                    </FillStyle>
<PointOptionsSerializable>
<cc1:PointOptions>
<ValueNumericOptions Format="Number"></ValueNumericOptions>
</cc1:PointOptions>
</PointOptionsSerializable>
                                </cc1:SideBySideBarSeriesLabel>
</LabelSerializable>
                                <PointOptionsSerializable>
<cc1:PointOptions HiddenSerializableString="to be serialized">
                                    <ValueNumericOptions Format="Number" />
                                </cc1:PointOptions>
</PointOptionsSerializable>
                                <LegendPointOptionsSerializable>
<cc1:PointOptions HiddenSerializableString="to be serialized">
                                    <ValueNumericOptions Format="Number" />
                                </cc1:PointOptions>
</LegendPointOptionsSerializable>
                            </cc1:Series>
                        </SeriesSerializable>
<SeriesTemplate   >
<ViewSerializable>
<cc1:SideBySideBarSeriesView HiddenSerializableString="to be serialized"></cc1:SideBySideBarSeriesView>
</ViewSerializable>

<LabelSerializable>
<cc1:SideBySideBarSeriesLabel HiddenSerializableString="to be serialized" LineVisible="True" >
<FillStyle >
<OptionsSerializable>
<cc1:SolidFillOptions HiddenSerializableString="to be serialized"></cc1:SolidFillOptions>
</OptionsSerializable>
</FillStyle>
<PointOptionsSerializable>
<cc1:PointOptions></cc1:PointOptions>
</PointOptionsSerializable>
</cc1:SideBySideBarSeriesLabel>
</LabelSerializable>

<PointOptionsSerializable>
<cc1:PointOptions HiddenSerializableString="to be serialized"></cc1:PointOptions>
</PointOptionsSerializable>

<LegendPointOptionsSerializable>
<cc1:PointOptions HiddenSerializableString="to be serialized"></cc1:PointOptions>
</LegendPointOptionsSerializable>
</SeriesTemplate>

                        <DiagramSerializable>
<cc1:XYDiagram>
                            <axisx color="Transparent" visibleinpanesserializable="-1">
<label font="Tahoma, 10pt" textcolor="0, 0, 0"></label>

<range sidemarginsenabled="True"></range>
</axisx>
                            <axisy visible="False" visibleinpanesserializable="-1">
<range sidemarginsenabled="True"></range>
</axisy>
                            <defaultpane backcolor="Transparent"></defaultpane>
                        </cc1:XYDiagram>
</DiagramSerializable>

<FillStyle FillMode="Empty">
</FillStyle>
                        <Legend AlignmentHorizontal="Center" AlignmentVertical="BottomOutside" 
                            BackColor="Transparent" Direction="LeftToRight" EquallySpacedItems="False" 
                            Visible="False"></Legend>
                        <Titles>
                            <cc1:ChartTitle Font="Tahoma, 10pt" Text="Comparativo proporcional aos mesmos períodos
2012 ao realizado e 2013 a meta" TextColor="128, 128, 128" />
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
                        SelectCommand="SELECT Ano, perc FROM tblCampanhaGraficos WHERE (idCampanha = @Campanha) AND (idFilial = 99) AND (Cod = 5) AND (idGrafico = 1) AND AnoApuracao=@Ano">
                        <SelectParameters>
                            <asp:SessionParameter Name="Campanha" SessionField="sCAMPANHA" />
                            <asp:SessionParameter Name="Ano" SessionField="sANO" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td align="center" valign="top" style="width: 303px; height: 164px;">
                    <dxwgv:ASPxGridView ID="gridMeta" runat="server" AutoGenerateColumns="False" 
                        CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" CssPostfix="Office2003_Blue" 
                        DataSourceID="dsMeta" KeyFieldName="Descricao" Width="375px" Theme="DevEx">
                        <SettingsBehavior AllowFocusedRow="True" />
                        <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                            CssPostfix="Office2003_Blue">
                            <Header ImageSpacing="5px" SortingImageSpacing="5px">
                            </Header>
                            <AlternatingRow BackColor="#E6F2FF"></AlternatingRow>
                            <LoadingPanel ImageSpacing="10px">
                            </LoadingPanel>
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
                        <SettingsText Title="Comparativo de Bacalhau" />
                        <Columns>
                            <dxwgv:GridViewDataTextColumn Caption="Descrição" FieldName="Descricao" 
                                VisibleIndex="0" Width="130px">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="2012" FieldName="VendaAA" 
                                VisibleIndex="1" Width="75px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <HeaderStyle HorizontalAlign="Center" />
                            </dxwgv:GridViewDataTextColumn>
                            
                            <dxwgv:GridViewDataTextColumn Caption="Meta 2013" FieldName="Meta" 
                                VisibleIndex="2" Width="75px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle ForeColor="#009900">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            
                            <dxwgv:GridViewDataProgressBarColumn Caption="% Ating." FieldName="Part" 
                                VisibleIndex="3">
                                <PropertiesProgressBar Height="" Width="">
                                </PropertiesProgressBar>
                            </dxwgv:GridViewDataProgressBarColumn>
                            
                        </Columns>
                        <Settings ShowTitlePanel="True" ShowVerticalScrollBar="True" 
                            VerticalScrollableHeight="225" />
                        <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                    </dxwgv:ASPxGridView>
                    <asp:SqlDataSource ID="dsMeta" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                        
                        
                        
                        
                        
                        SelectCommand="SELECT tblCampanhaMeta.Descricao, tblCampanhaMeta.VendaAA, tblCampanhaMeta.Meta,   tblCampanhaMeta.Real /  tblCampanhaMeta.Meta * 100 AS Part
FROM tblCampanhaDesc INNER JOIN tblCampanhaMeta ON tblCampanhaDesc.idCampanha = tblCampanhaMeta.idCampanha AND tblCampanhaDesc.Cod = tblCampanhaMeta.Cod WHERE (tblCampanhaMeta.idCampanha = @Campanha) AND (tblCampanhaMeta.Ano = @Ano) AND (tblCampanhaMeta.Cod = 5) ORDER BY tblCampanhaMeta.idFilial">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="" Name="Campanha" 
                                SessionField="sCAMPANHA" />
                            <asp:SessionParameter Name="Ano" SessionField="sANO" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td align="center" valign="top" style="width: 303px">
                    &nbsp;</td>
            </tr>
        </table>
        <table cellspacing="1" class="style1">
            <tr>
                <td>
                    <asp:SqlDataSource ID="dsSuper" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                        
                        
                        
                        SelectCommand="SELECT Ano, idFilial, QtdeAA, Qtde, CAST(Qtde AS FLOAT) / CAST(QtdeAA AS FLOAT) * 100 - 100 AS 'percCresQtde', VendaAA, Venda, CAST(Venda AS FLOAT) / CAST(VendaAA AS FLOAT) * 100 - 100 AS 'percCresVenda',LucroAA, Lucro, Descricao, Ordem, CAST(LucroAA AS FLOAT) / CAST(VendaAA AS FLOAT) * 100 AS MargemAA, CAST(Lucro AS FLOAT) / CAST(Venda AS FLOAT) * 100 AS Margem, (CAST(Lucro AS FLOAT) / CAST(Venda AS FLOAT) * 100 - CAST(LucroAA AS FLOAT) / CAST(VendaAA AS FLOAT) * 100) AS Dif, CAST(Lucro AS FLOAT) / CAST(LucroAA AS FLOAT) * 100 - 100 AS 'percCresLucro' FROM tblCampanhaView WHERE (Cod = 5) AND (idCampanha = @idCampanha) AND (Ano = @Ano) ORDER BY Ordem">
                        <SelectParameters>
                            <asp:SessionParameter Name="idCampanha" SessionField="sCAMPANHA" />
                            <asp:SessionParameter Name="Ano" SessionField="sANO" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <dxwgv:ASPxGridViewExporter ID="ExporterExcel1" runat="server" 
                        FileName="Total Pascoa" GridViewID="ASPxGridView1">
                    </dxwgv:ASPxGridViewExporter>
                </td>
            </tr>
        </table>

<table>
    <tr>
        <td>
            <dxwgv:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="dsTop10" EnableTheming="True" Theme="DevEx">
                <TotalSummary>
                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdVendas" SummaryType="Sum" />
                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Venda" SummaryType="Sum" />
                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroComercial" SummaryType="Sum" />
                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" SummaryType="Custom" />
                </TotalSummary>
                <Columns>
                    <dxwgv:GridViewDataTextColumn Caption="Cod" FieldName="CodProduto" VisibleIndex="1" Width="50px">
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Descrição do Produto" FieldName="DescProduto" VisibleIndex="2">
                        <HeaderStyle HorizontalAlign="Left" />
                        <CellStyle Wrap="False">
                        </CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendas" VisibleIndex="3" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}">
                        </PropertiesTextEdit>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="Venda" VisibleIndex="4" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}">
                        </PropertiesTextEdit>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Lucro" FieldName="LucroComercial" VisibleIndex="5" Width="70px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}">
                        </PropertiesTextEdit>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="% Mrg" FieldName="percMargem" ReadOnly="True" VisibleIndex="6" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}">
                        </PropertiesTextEdit>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Top" FieldName="Ranking" VisibleIndex="0" Width="30px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}">
                        </PropertiesTextEdit>
                        <CellStyle HorizontalAlign="Center">
                        </CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                    <dxwgv:GridViewDataTextColumn Caption="Fornecedor" FieldName="descFornecedor" VisibleIndex="7" Width="100px">
                        <HeaderStyle HorizontalAlign="Left" />
                        <CellStyle Wrap="False">
                        </CellStyle>
                    </dxwgv:GridViewDataTextColumn>
                </Columns>
                <SettingsPager Mode="ShowAllRecords">
                </SettingsPager>
                <Settings ShowTitlePanel="True" ShowFooter="True" />
                <SettingsText Title="Bacalhau - Item Top 10" />
                <Styles>
                    <Header HorizontalAlign="Center">
                    </Header>
                    <Footer Font-Bold="True">
                    </Footer>
                    <TitlePanel Font-Bold="True" Font-Size="Medium">
                    </TitlePanel>                    
	                <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
	                <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>


                </Styles>
            </dxwgv:ASPxGridView>
            <asp:SqlDataSource ID="dsTop10" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="SELECT [CodProduto], [DescProduto], [QtdVendas], [Venda], [LucroComercial], [percMargem], [Ranking],descFornecedor FROM Gerencial.[tblCampanhaRankingProdutos] WHERE ([AnoApuracao] = @AnoApuracao) AND Cod=5 ORDER BY [Ranking]">
                <SelectParameters>
                    <asp:SessionParameter Name="AnoApuracao" SessionField="sANO" Type="Int16" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
</table>


</asp:Content>

