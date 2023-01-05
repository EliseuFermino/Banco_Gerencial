<%@ Page Title="Análise de Vendas por Seção" Language="VB" MasterPageFile="~/MemberPages/SiteVendas.master" AutoEventWireup="false" CodeFile="AnaliseVenda_porGrupo.aspx.vb" Inherits="MemberPages_SLV_AnaliseVenda_PorGrupo" %>

<%@ Register src="../../../Controles/wucListaDiaIniFin.ascx" tagname="wucListaDiaIniFin" tagprefix="uc1" %>
<%@ Register src="../../../Controles/wucBotaoAtualizar.ascx" tagname="wucBotaoAtualizar" tagprefix="uc2" %>

<%@ Register src="../../../Controles/wuciListaLojasComApoio.ascx" tagname="wuciListaLojasComApoio" tagprefix="uc3" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>


<%@ Register src="../../../Controles/wucBotaoExcel.ascx" tagname="wucBotaoExcel" tagprefix="uc4" %>

<%@ Register src="../../../Controles/wucListaSecao.ascx" tagname="wucListaSecao" tagprefix="uc5" %>




<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>
<%@ Register assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dxchartsui" %>

<%@ Register Src="~/Controles/wucOpcoesSLV.ascx" TagPrefix="uc1" TagName="wucOpcoesSLV" %>



<%@ Register src="../../../Controles/wucListaSecaoGrupo.ascx" tagname="wucListaSecaoGrupo" tagprefix="uc6" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
     
   
    
    <table style="border-collapse: collapse; width: 100%; float: left">
        <tr style="width:100px">
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server" >

    <%--        <script type="text/javascript">
            if (screen.width == "1024") {
                window.location = "highres_1024_768.html";
            }
            if (screen.width == "800") {
                window.location = "highres_800_600.html";
            }
            if (screen.width == "1600") {
                window.location = "highres_1600_900.html";
            }
            if (screen.width == "1152") {
                window.location = "highres_1152_864.html";
            }

    </script>--%>

    <table cellspacing="1" style="width: 1100px">
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <Triggers >
                         <asp:PostBackTrigger ControlID="btnExcel" /> 
                    </Triggers>
                    <ContentTemplate>
                        <table  cellspacing="1" style="width: 1145px">
                            <tr>
                                <td style="width :420px">
                                    <uc6:wucListaSecaoGrupo ID="cboSLV" runat="server" />
                                </td>
                                <td style ="width :350px; padding-left:10px">
                                    <uc1:wucListaDiaIniFin ID="cboDia" runat="server" />
                                </td>
                                <td>
                                    <uc2:wucBotaoAtualizar ID="btnAtualizar" runat="server" />
                                </td>
                                <td>

                                    <dx:ASPxCheckBox ID="chkCabecalho" runat="server" AutoPostBack="True" 
                                        Checked="True" CheckState="Checked" Text="Fixar cabeçalho" with="100px">
                                    </dx:ASPxCheckBox>

                                </td>
                                <td>
                                    <uc4:wucBotaoExcel ID="btnExcel" runat="server" />
                                </td>
                            </tr>
                            <Table>
                                <tr>
                                    <td style="width : 95%">
                                        <uc1:wucOpcoesSLV ID="wucOpcoesSLV" runat="server" />
                                    </td>
                                </tr>
                            </Table>
                            <tr>

                               
                            </tr>
                        </table>
                        <table cellspacing="1" >
                            <tr>
                                <td>
                                    <dx:ASPxGridView ID="grid" runat="server" 
                                        DataSourceID="SqlDataSource1" AutoGenerateColumns="False" 
                                        EnableTheming="True" Theme="SoftOrange" Width="1100px" 
                                        KeyFieldName="idFilial" Visible="False">

                                        <TotalSummary>
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartAA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargemAA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartAT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargemAT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAT" SummaryType="Custom" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescQtde" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescLucro" SummaryType="Custom" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingMetaVlr" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargemMeta" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemMeta" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPercMargem" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg23Meta" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingAg23" SummaryType="Custom" />

                                           <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeMA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaMA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartMA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargemMA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemMA" SummaryType="Custom" />
                                        
                                        </TotalSummary>

                                        <Columns>                                           
                                            <dx:GridViewDataTextColumn FieldName="descFilial" VisibleIndex="0" 
                                                Caption="Filial" Width="150px" FixedStyle="Left">
                                                <CellStyle Wrap="False">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>

                         <%--Dados Ano Anterior--%>

                         <%--Dados Mês Anterior--%>
                                 
                               <%--% Dados Ano Atual--%>

                                <%--% Crescimento--%>
                                                                                     
                                <%--Meta--%>
                                            <dx:GridViewBandColumn Caption="Ano Anterior" Name="bandAnoAnterior" VisibleIndex="1" Visible="False">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeAA" ToolTip="Volume do Ano Anterior (mesmo período)" VisibleIndex="0" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Reais" FieldName="vlrVendaAA" ToolTip="Valor da venda do ano anterior (mesmo período)" VisibleIndex="1" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPartAA" ToolTip="Percentual de participação da venda da seção sobre a venda total" VisibleIndex="2" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrMargemAA" ToolTip="Valor do lucro do ano anterior (mesmo período)" VisibleIndex="3" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargemAA" ToolTip="Percentual de margem do ano anterior (mesmo período)" VisibleIndex="4" Width="60px" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Ano Atual" VisibleIndex="10" Name="bandAnoAtual">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeAT" ToolTip="Volume vendida do período selecionado" VisibleIndex="0" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Reais" FieldName="vlrVendaAT" ToolTip="Valor de venda do período selecionado" VisibleIndex="1" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPartAT" ToolTip="Percentual de participação da venda da seção sobre a venda total" VisibleIndex="2" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrMargemAT" ToolTip="Valor do lucro do período selecionado" VisibleIndex="3" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargemAT" ToolTip="Percentual de margem do período selecionado" VisibleIndex="4" Width="60px" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Crescimento" Name="bandCrescimento" VisibleIndex="16">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="percCresc" ToolTip="Percentual de crescimento de Venda entre periodo atual e periodo do ano anterior" VisibleIndex="0" Width="60px" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Vol." FieldName="percCrescQtde" ToolTip="Percentual de crescimento de Quantidade entre periodo atual e periodo do ano anterior" VisibleIndex="1" Width="60px" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="percCrescLucro" ToolTip="Percentual de crescimento de Lucro entre periodo atual e periodo do ano anterior" VisibleIndex="2" Width="60px" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Meta" Name="bandMeta" VisibleIndex="20">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta" ToolTip="Valor de meta de venda do período selecionado" VisibleIndex="0" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#009900">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargemMeta" ToolTip="Percentual de meta de margem do período selecionado" VisibleIndex="2" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#009900">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#336600">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Ating." FieldName="percAtingMetaVlr" UnboundType="Decimal" VisibleIndex="1" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Dif" FieldName="difPercMargem" UnboundType="Decimal" VisibleIndex="3" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" />
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dx:GridViewBandColumn>
                                           
                                            <dx:GridViewDataTextColumn FieldName="Tipo" SortIndex="0" SortOrder="Ascending" 
                                                VisibleIndex="22" Visible="False">
                                            </dx:GridViewDataTextColumn>
                                           
                                            <dx:GridViewDataTextColumn FieldName="idFilial" SortIndex="1" 
                                                SortOrder="Ascending" VisibleIndex="23" Visible="False">
                                            </dx:GridViewDataTextColumn>
                                           
                                        </Columns>
                                                                                
                                        <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control"/>
                                        <SettingsPager Mode="ShowAllRecords">
                                        </SettingsPager>
                                        <Styles>
	                                        <FocusedRow BackColor="#CCFFFF" ForeColor="#333333"> </FocusedRow>
	                                        	<AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                            <Footer Font-Bold="True">
                                            </Footer>
                                        </Styles>                                        
                                            <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="400" 
                                            ShowFooter="True" ShowHorizontalScrollBar="True" HorizontalScrollBarMode="Auto" />
                                        <SettingsText EmptyDataRow="Não há informações disponiveis ainda para esse período e seção" />                                        
                                    </dx:ASPxGridView>
                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                                        SelectCommand="SLV.AtualizarAnaliseVendaSecao_porSecao_Buscar" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="Usuario" SessionField="sUSUARIO" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                        
<br />
                        <dxchartsui:WebChartControl ID="grafico" runat="server" DataSourceID="dsGrafico" Height="600px" Visible="False" Width="1100px">
                            <borderoptions Color="LightGray" Thickness="4" />
                            <diagramserializable>
                                <cc1:XYDiagram>
                                    <axisx visibleinpanesserializable="-1">
                                        <label>
                                        <resolveoverlappingoptions allowhide="False" 
                                                            allowstagger="False" minindent="0" />
                                        </label>
                                        <range sidemarginsenabled="True" />
                                        <gridlines visible="True">
                                        </gridlines>
                                    </axisx>
                                    <axisy visible="False" visibleinpanesserializable="-1">
                                        <range sidemarginsenabled="True" />
                                    </axisy>
                                </cc1:XYDiagram>
                            </diagramserializable>
                            <fillstyle>
                                <optionsserializable>
                                    <cc1:SolidFillOptions />
                                </optionsserializable>
                            </fillstyle>
                            <legend Visibility="False"></legend>
                            <seriesserializable>
                                <cc1:Series ArgumentDataMember="descFilial" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="percCresc">
                                    <viewserializable>
                                        <cc1:SideBySideBarSeriesView ColorEach="True">
                                        </cc1:SideBySideBarSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:SideBySideBarSeriesLabel LineVisible="True" Position="TopInside" ResolveOverlappingMode="Default" TextOrientation="TopToBottom">
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
                                <cc1:ChartTitle Text="Crescimento de Vendas por Grupo de Seção" TextColor="Gray" />
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
                        <br />
                    </ContentTemplate>
                </asp:UpdatePanel>
                <table style="border-collapse: collapse; width: 100%; float: left">
                    <tr>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td>
                                    <asp:SqlDataSource ID="dsGrafico" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                                        
                                        
                                        
                                SelectCommand="SELECT 1 AS 'Number', descFilial, percCresc FROM [SLV].[AnaliseAnoAnterior] WHERE [Usuario] = @Usuario AND (([percCresc]&lt;&gt;0) AND [percCresc] BETWEEN -100 AND 100) ORDER BY [percCresc]">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="Usuario" SessionField="sUSUARIO" 
                                                DefaultValue="Eliseu" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;</td>
                    </tr>
                </table>
                <br />
            </td>
        </tr>
    </table>

</asp:Content>

