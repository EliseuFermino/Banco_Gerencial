<%@ Page Title="Análise de Vendas por Seção" Language="VB" MasterPageFile="~/MemberPages/SiteVendas.master" AutoEventWireup="false" CodeFile="AnaliseVenda_porEmpresaDia.aspx.vb" Inherits="MemberPages_SLV_AnaliseVenda_PorSecaoEmpresaDia" %>

<%@ Register src="../../Controles/wucListaDiaIniFin.ascx" tagname="wucListaDiaIniFin" tagprefix="uc1" %>
<%@ Register src="../../Controles/wucBotaoAtualizar.ascx" tagname="wucBotaoAtualizar" tagprefix="uc2" %>

<%@ Register src="../../Controles/wuciListaLojasComApoio.ascx" tagname="wuciListaLojasComApoio" tagprefix="uc3" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>


<%@ Register src="../../Controles/wucBotaoExcel.ascx" tagname="wucBotaoExcel" tagprefix="uc4" %>

<%@ Register src="../../Controles/wucListaSecao.ascx" tagname="wucListaSecao" tagprefix="uc5" %>

<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc6" %>
<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc7" %>

<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>
<%@ Register assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dxchartsui" %>
<%@ Register Src="~/Controles/wucOpcoesSLV.ascx" TagPrefix="uc1" TagName="wucOpcoesSLV" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <table cellspacing="1" style="width: 1045px">
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <Triggers >
                         <asp:PostBackTrigger ControlID="btnExcel" /> 
                    </Triggers>
                    <ContentTemplate>
                        <table cellspacing="1" style="width: 1040px">
                            <tr>
                                <td>
                                    <dx:ASPxRadioButton ID="rndEmpresa" runat="server" AutoPostBack="True" 
                                        Checked="True" GroupName="EmpresaFilial" Text="Empresa" 
                                        Theme="DevEx">
                                    </dx:ASPxRadioButton>
                                </td>
                                <td style="width: 120px">
                                    <dx:ASPxRadioButton ID="rndMesmas" runat="server" AutoPostBack="True" 
                                        GroupName="EmpresaFilial" Text="Mesmas Lojas" Theme="DevEx" ForeColor="#3399FF">
                                    </dx:ASPxRadioButton>
                                </td>
                                <td style="width: 55px">
                                    <dx:ASPxRadioButton ID="rndFilial" runat="server" AutoPostBack="True" 
                                        GroupName="EmpresaFilial" Text="Filial: " Theme="DevEx">
                                    </dx:ASPxRadioButton>
                                </td>
                                <td style="width: 120px; text-align:left ">
                                    <uc3:wuciListaLojasComApoio ID="cboFilial" runat="server" />
                                </td>
                                <td style="width: 400px">
                                    <uc1:wucListaDiaIniFin ID="cboDia" runat="server" />
                                </td>
                                <td>
                                    <uc2:wucBotaoAtualizar ID="btnAtualizar" runat="server" />
                                </td>
                                <td>

                                    <dx:ASPxCheckBox ID="chkCabecalho" runat="server" AutoPostBack="True" 
                                        Checked="True" CheckState="Checked" Text="Fixar cabeçalho" Theme="DevEx">
                                    </dx:ASPxCheckBox>

                                </td>
                                <td>
                                    <uc4:wucBotaoExcel ID="btnExcel" runat="server" />
                                </td>
                            </tr>
                            <Table>
                                <tr>
                                    <td>
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
                                    <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" 
                                        EnableTheming="True" Theme="SoftOrange" 
                                        KeyFieldName="idFilial" Visible="False" DataSourceID="SqlDataSource1" 
                                        Width="1100px">
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

                                        </TotalSummary>
                                        <Columns>                                           

                         <%--Dados Ano Anterior--%>

                         <%--Dados Mês Anterior--%>
                                 
                               <%--% Dados Ano Atual--%>

                                <%--% Crescimento--%>
                                                                                     
                                <%--Meta--%>
                                            <dx:GridViewBandColumn Caption="Ano Anterior" Name="bandAnoAnterior" 
                                                ToolTip="Exibe informações do Ano Anterior" VisibleIndex="1" 
                                                Visible="False">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeAA" 
                                                        ToolTip="Volume do Ano Anterior (mesmo período)" VisibleIndex="0" 
                                                        Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVendaAA" 
                                                        ToolTip="Valor da venda do ano anterior (mesmo período)" VisibleIndex="1" 
                                                        Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPartAA" 
                                                        ToolTip="Percentual de participação da venda da seção sobre a venda total" 
                                                        VisibleIndex="2" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Lucro " FieldName="vlrMargemAA" 
                                                        ToolTip="Valor do lucro do ano anterior (mesmo período)" VisibleIndex="3" 
                                                        Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Marg " FieldName="percMargemAA" 
                                                        ToolTip="Percentual de margem do ano anterior (mesmo período)" VisibleIndex="4" 
                                                        Width="60px" UnboundType="Decimal">
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
                                            <dx:GridViewBandColumn Caption="Metas" Name="bandMeta" 
                                                ToolTip="Exibe as informações de metas de Venda, Margem e Quebra Conhecida (Agenda 23)" 
                                                VisibleIndex="7">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrMeta" 
                                                        ToolTip="Valor de meta de venda do período selecionado" VisibleIndex="0" 
                                                        Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#009900">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargemMeta" 
                                                        ToolTip="Diferença entre o percentual margem realizado versus o percentual margem da meta." VisibleIndex="3" 
                                                        Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#009900">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Ag. 23" FieldName="vlrAg23Meta" 
                                                        VisibleIndex="5" Width="60px" Visible="False">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" />
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Ating." FieldName="percAtingMetaVlr" 
                                                        UnboundType="Decimal" VisibleIndex="1" Width="60px" ToolTip="Atingimento entre Realizado versus Meta">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Dif." FieldName="difPercMargem" 
                                                        ToolTip="Diferença do Realizado x Meta da Margem " UnboundType="Decimal" 
                                                        VisibleIndex="4" Width="50px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Dif Ag23" FieldName="percAtingAg23" 
                                                        ToolTip="% Percentual de Atingimento da 23. Realizado x Meta da Agenda 23" 
                                                        UnboundType="Decimal" VisibleIndex="6" Width="60px" Visible="False">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" ForeColor="White" />
                                                        <CellStyle HorizontalAlign="Right">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrMargemMeta" 
                                                        ToolTip="Meta de lucro" VisibleIndex="2" Width="90px" Visible="False">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" />
                                                        <FooterCellStyle ForeColor="#009900">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Crescimento em %" Name="bandCrescimento" 
                                                ToolTip="Exibe as informações de crescimento de Quantidade, Venda e Lucratividade em relação ao ano anterior." 
                                                VisibleIndex="5">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="percCresc" 
                                                        ToolTip="Percentual de crescimento de Venda entre periodo atual e periodo do ano anterior" 
                                                        VisibleIndex="0" Width="60px" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Vol." FieldName="percCrescQtde" 
                                                        ToolTip="Percentual de crescimento de Quantidade entre periodo atual e periodo do ano anterior" 
                                                        VisibleIndex="1" Width="60px" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="percCrescLucro" 
                                                        ToolTip="Percentual de crescimento de Lucro entre periodo atual e periodo do ano anterior" 
                                                        VisibleIndex="2" Width="60px" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Ano Atual" Name="bandAnoAtual" 
                                                ToolTip="Exibe as informações do ano atual" VisibleIndex="3">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeAT" 
                                                        ToolTip="Volume vendida do período selecionado" VisibleIndex="0" 
                                                        Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVendaAT" ToolTip="Valor de venda do período selecionado" 
                                                        VisibleIndex="1" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPartAT" 
                                                        ToolTip="Percentual de participação da venda da seção sobre a venda total" 
                                                        VisibleIndex="2" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrMargemAT" ToolTip="Valor do lucro do período selecionado" 
                                                        VisibleIndex="3" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargemAT" 
                                                        ToolTip="Percentual de margem do período selecionado" VisibleIndex="4" 
                                                        Width="60px" UnboundType="Decimal">
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
                                            <dx:GridViewBandColumn Caption="Agenda 23" Name="bandAgenda23" 
                                                ToolTip="Quantidada e Valor da quebra conhecida (Agenda 23)" 
                                                VisibleIndex="4" Visible="False">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrAg23" VisibleIndex="1" 
                                                        Width="70px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="Red" ForeColor="White" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeAg23" VisibleIndex="0" 
                                                        Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="Red" ForeColor="White" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percCrescAg23" 
                                                        ToolTip="Percentual da Agenda 23 em relação a venda" UnboundType="Decimal" 
                                                        VisibleIndex="2" Width="50px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="Red" ForeColor="White" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewDataTextColumn FieldName="descSecao" VisibleIndex="0" 
                                                Caption="Seção" Width="150px" FixedStyle="Left">
                                                <CellStyle Wrap="False">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataTextColumn FieldName="Tipo" SortIndex="0" SortOrder="Ascending" 
                                                VisibleIndex="23" Visible="False">
                                            </dx:GridViewDataTextColumn>
                                           
                                            <dx:GridViewDataTextColumn FieldName="idFilial" SortIndex="1" 
                                                SortOrder="Ascending" VisibleIndex="24" Visible="False">
                                            </dx:GridViewDataTextColumn>
                                           
                                        </Columns>
                                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                        <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                                        <Styles>
	                                        <FocusedRow BackColor="#CCFFFF" ForeColor="#333333"> </FocusedRow>
	                                        	<Header HorizontalAlign="Center" Font-Size="Small">
                                            </Header>
	                                        	<AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                            <Cell Font-Size="Small">
                                            </Cell>
                                            <Footer Font-Bold="True">
                                            </Footer>
                                        </Styles>                                        
                                        <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="400" 
                                            ShowFooter="True" ShowHorizontalScrollBar="True" 
                                            UseFixedTableLayout="True" />
                                        <SettingsText EmptyDataRow="Não há informações disponiveis ainda para esse período e seção" 
                                            />
                                    </dx:ASPxGridView>
                                </td>
                            </tr>
                        </table>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                            
                            SelectCommand="SLV.AtualizarAnaliseVendaSecaoEmpresaDia_Buscar" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Usuario" SessionField="sUSUARIO" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <table style="width: 100%">
                            <tr>
                                <td>
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
                                                <axisy visibleinpanesserializable="-1">
                                                    <range sidemarginsenabled="True" />
                                                </axisy>
                                            </cc1:XYDiagram>
                                        </diagramserializable>
                                        <fillstyle>
                                            <optionsserializable>
                                                <cc1:SolidFillOptions />
                                            </optionsserializable>
                                        </fillstyle>
                                        <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" direction="RightToLeft" equallyspaceditems="False"></legend>
                                        <seriesserializable>
                                            <cc1:Series ArgumentDataMember="descFilial" ArgumentScaleType="Qualitative" LegendText="Crescimento sobre o ano retrasado" Name="seriePercAA2" ValueDataMembersSerializable="percCrescAA2">
                                                <viewserializable>
                                                    <cc1:SplineAreaSeriesView Color="105, 255, 128, 0" Transparency="150">
                                                        <border 
                                                        color="192, 64, 0" thickness="2" />
                                                        <markeroptions bordercolor="255, 255, 255" bordervisible="False" color="255, 128, 0" size="6">
                                                            <fillstyle fillmode="Solid">
                                                                <optionsserializable>
                                                                    <cc1:SolidFillOptions />
                                                                </optionsserializable>
                                                            </fillstyle>
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
                                                                <valuenumericoptions 
                                                        format="Number" />
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
                                            <cc1:Series ArgumentDataMember="descFilial" LabelsVisibility="True" LegendText="Crescimento sobre o ano passado" Name="Series 1" SynchronizePointOptions="False" ValueDataMembersSerializable="percCresc">
                                                <viewserializable>
                                                    <cc1:SideBySideBarSeriesView Color="235, 65, 105, 225" Transparency="20">
                                                        <fillstyle fillmode="Solid">
                                                            <optionsserializable>
                                                                <cc1:SolidFillOptions />
                                                            </optionsserializable>
                                                        </fillstyle>
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
                                                        <valuenumericoptions format="Number" />
                                                    </cc1:PointOptions>
                                                </legendpointoptionsserializable>
                                            </cc1:Series>
                                            <cc1:Series ArgumentDataMember="descFilial" ArgumentScaleType="Qualitative" Name="serieOrdem" SeriesPointsSorting="Ascending" ValueDataMembersSerializable="Ordem">
                                                <viewserializable>
                                                    <cc1:SwiftPlotSeriesView>
                                                    </cc1:SwiftPlotSeriesView>
                                                </viewserializable>
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
                                            <cc1:ChartTitle Text="Crescimento de Vendas por Seção" TextColor="Gray" />
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
                                    <asp:SqlDataSource ID="dsGrafico" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="SELECT 1 AS 'Number', descSecao AS 'descFilial', percCresc, percCrescAA2, Ordem FROM [SLV].[AnaliseAnoAnterior] WHERE [Usuario] = @Usuario AND (([percCresc]&lt;&gt;0) AND [percCresc] BETWEEN -100 AND 100) AND (([percCrescAA2]&lt;&gt;0) AND [percCrescAA2] BETWEEN -100 AND 100) ORDER BY Ordem ASC">
                                        <SelectParameters>
                                            <asp:SessionParameter DefaultValue="Eliseu" Name="Usuario" SessionField="sUSUARIO" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                        <br />
                    </ContentTemplate>
                </asp:UpdatePanel>

                <table style="border-collapse: collapse; width: 100%; float: left">                    
                    <tr>
                        <td style="vertical-align: top">
                                    &nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                </table>
                <br />
            </td>
        </tr>
    </table>

</asp:Content>

