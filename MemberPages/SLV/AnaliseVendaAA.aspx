<%@ Page Title="Análise de Vendas com Ano Anterior" Language="VB" MasterPageFile="~/MemberPages/SiteVendas.master" AutoEventWireup="false" CodeFile="AnaliseVendaAA.aspx.vb" Inherits="MemberPages_SLV_AnaliseVendaAA" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucBotaoAtualizar.ascx" TagPrefix="uc1" TagName="wucBotaoAtualizar" %>

<%@ Register src="../../Controles/wucListaDiaIniFin.ascx" tagname="wucListaDiaIniFin" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:UpdatePanel ID="updatePanel1" runat="server">   
        <ContentTemplate>        
            <table>
        <tr>
            <td>
                <uc2:wucListaDiaIniFin ID="cboDia" runat="server" />
            </td>
            <td>
                <uc1:wucListaLojasComCorporacao ID="cboFilial" runat="server" />
            </td>
            <td>
                <uc1:wucBotaoAtualizar ID="btnAtualizar" runat="server" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <dx:ASPxGridView ID="gridDepto" runat="server" DataSourceID="dsDepto" AutoGenerateColumns="False" KeyFieldName="idDepto">
                <TotalSummary>
                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="perc" SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercial" SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAA" SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAA" SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAA" SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercialAA" SummaryType="Sum" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAT" SummaryType="Custom" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAA" SummaryType="Custom" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Vol" SummaryType="Custom" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Reais" SummaryType="Custom" />
                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Lucro" SummaryType="Custom" />
                </TotalSummary>
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="idFilial" Visible="False" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="Ano" Visible="False" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="idDepto" Visible="False" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewBandColumn Caption="Crescimento em %" VisibleIndex="5">
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="Vol" FieldName="percCresc_Vol" ToolTip="Cresimento do Volume vendido" UnboundType="Decimal" VisibleIndex="0">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                <CellStyle>
                                    <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="R$" FieldName="percCresc_Reais" ToolTip="Crescimento em Reais" UnboundType="Decimal" VisibleIndex="1">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Lucro" FieldName="percCresc_Lucro" ToolTip="Crescimento do Lucro" UnboundType="Decimal" VisibleIndex="2">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:GridViewBandColumn>
                    <dx:GridViewBandColumn Caption="Ano Atual" VisibleIndex="4">
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVenda" ReadOnly="True" VisibleIndex="1">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                <CellStyle ForeColor="Blue"></CellStyle>
                                <FooterCellStyle ForeColor="Blue"></FooterCellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde" ReadOnly="True" VisibleIndex="0">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                <CellStyle>
                                    <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="% Part." FieldName="perc" VisibleIndex="2">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucroComercial" ReadOnly="True" VisibleIndex="3">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargemAT" UnboundType="Decimal" VisibleIndex="4">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:GridViewBandColumn>
                    <dx:GridViewBandColumn Caption="Ano Anterior" VisibleIndex="3">
                        <Columns>
                            <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeAA" ReadOnly="True" VisibleIndex="0">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                <CellStyle>
                                    <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVendaAA" ReadOnly="True" VisibleIndex="1">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                <CellStyle ForeColor="Blue"></CellStyle>
                                <FooterCellStyle ForeColor="Blue"></FooterCellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="% Part." FieldName="percAA" VisibleIndex="2">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucroComercialAA" ReadOnly="True" VisibleIndex="3">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargemAA" UnboundType="Decimal" VisibleIndex="4">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:GridViewBandColumn>
                    <dx:GridViewDataTextColumn FieldName="listaDepto" VisibleIndex="0" Caption="Departamento">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <SettingsBehavior AllowFocusedRow="True" />
                <SettingsPager Mode="ShowAllRecords">
                </SettingsPager>
                <Settings ShowFooter="True" />
                <SettingsDetail ShowDetailRow="True" />
                <Styles>
                    <Header HorizontalAlign="Center"></Header>
	                <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
	                <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                    <Footer Font-Bold="True"></Footer>
                </Styles>
                <Templates>
                    <DetailRow>
                        <dx:ASPxGridView ID="gridSecao" runat="server" AutoGenerateColumns="False" DataSourceID="dsSecao" KeyFieldName="idSecao" OnBeforePerformDataSelect="gridSecao_BeforePerformDataSelect" OnCustomSummaryCalculate="gridSecao_CustomSummaryCalculate" OnCustomUnboundColumnData="gridSecao_CustomUnboundColumnData" OnHtmlDataCellPrepared="gridSecao_HtmlDataCellPrepared" OnHtmlFooterCellPrepared="gridSecao_HtmlFooterCellPrepared">
                            <TotalSummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="perc" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercial" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAA" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAA" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAA" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercialAA" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAT" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAA" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Vol" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Reais" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Lucro" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartTotalAT" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartTotalAA" SummaryType="Sum" />
                            </TotalSummary>
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="idFilial" Visible="False" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="Ano" Visible="False" VisibleIndex="1">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn FieldName="idSecao" Visible="False" VisibleIndex="2">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Crescimento em %" VisibleIndex="6">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Vol" FieldName="percCresc_Vol" ToolTip="Cresimento do Volume vendido" UnboundType="Decimal" VisibleIndex="0">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="percCresc_Reais" ToolTip="Crescimento em Reais" UnboundType="Decimal" VisibleIndex="1">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="percCresc_Lucro" ToolTip="Crescimento do Lucro" UnboundType="Decimal" VisibleIndex="2">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Ano Atual" VisibleIndex="5">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVenda" ReadOnly="True" VisibleIndex="1">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle ForeColor="Blue"></CellStyle>
                                            <FooterCellStyle ForeColor="Blue"></FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde" ReadOnly="True" VisibleIndex="0">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% P.D." FieldName="perc" ToolTip="% de Participação no Departamento" VisibleIndex="3">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucroComercial" ReadOnly="True" VisibleIndex="4">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargemAT" UnboundType="Decimal" VisibleIndex="5">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Part." FieldName="percPartTotalAA" ToolTip="% de Participação no total geral" VisibleIndex="2">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Ano Anterior" VisibleIndex="3">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeAA" ReadOnly="True" VisibleIndex="0">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVendaAA" ReadOnly="True" VisibleIndex="1">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle ForeColor="Blue"></CellStyle>
                                            <FooterCellStyle ForeColor="Blue"></FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% P.D." FieldName="percAA" ToolTip="% de Participação no Departamento" VisibleIndex="3">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucroComercialAA" ReadOnly="True" VisibleIndex="4">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargemAA" UnboundType="Decimal" VisibleIndex="5">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPartTotalAT" ToolTip="% de Participação no total geral" VisibleIndex="2">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="Seção" FieldName="ListaReduzida" VisibleIndex="0" Width="150px">
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Settings ShowFooter="True" />
                            <SettingsDetail ShowDetailRow="True" />
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF">
                                </FocusedRow>
                                <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                <Footer Font-Bold="True"></Footer>
                            </Styles>
                            <Templates>
                                <DetailRow>
                                    <dx:ASPxGridView ID="gridGrupo" runat="server" AutoGenerateColumns="False" DataSourceID="dsGrupo" KeyFieldName="idGrupo" OnBeforePerformDataSelect="gridSecao_BeforePerformDataSelect1" OnCustomSummaryCalculate="gridSecao_CustomSummaryCalculate1" OnCustomUnboundColumnData="gridSecao_CustomUnboundColumnData1" OnHtmlDataCellPrepared="gridSecao_HtmlDataCellPrepared1" OnHtmlFooterCellPrepared="gridSecao_HtmlFooterCellPrepared1">
                                        <TotalSummary>
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="perc" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercial" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAA" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAA" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAA" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercialAA" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Vol" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Reais" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Lucro" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartTotalAT" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartTotalAA" SummaryType="Sum" />
                                        </TotalSummary>
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="idFilial" Visible="False" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="Ano" Visible="False" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="idGrupo" Visible="False" VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewBandColumn Caption="Crescimento em %" VisibleIndex="6">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Vol" FieldName="percCresc_Vol" ToolTip="Cresimento do Volume vendido" UnboundType="Decimal" VisibleIndex="0">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="percCresc_Reais" ToolTip="Crescimento em Reais" UnboundType="Decimal" VisibleIndex="1">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle>
                                                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="percCresc_Lucro" ToolTip="Crescimento do Lucro" UnboundType="Decimal" VisibleIndex="2">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Ano Atual" VisibleIndex="5">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVenda" ReadOnly="True" VisibleIndex="1">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde" ReadOnly="True" VisibleIndex="0">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% P.D." FieldName="perc" ToolTip="% de Participação no Departamento" VisibleIndex="3">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucroComercial" ReadOnly="True" VisibleIndex="4">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle>
                                                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargemAT" UnboundType="Decimal" VisibleIndex="5">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Part." FieldName="percPartTotalAA" ToolTip="% de Participação no total geral" VisibleIndex="2">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Ano Anterior" VisibleIndex="3">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeAA" ReadOnly="True" VisibleIndex="0">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle>
                                                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue"></FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVendaAA" ReadOnly="True" VisibleIndex="1">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% P.D." FieldName="percAA" ToolTip="% de Participação no Departamento" VisibleIndex="3">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucroComercialAA" ReadOnly="True" VisibleIndex="4">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargemAA" UnboundType="Decimal" VisibleIndex="5">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPartTotalAT" ToolTip="% de Participação no total geral" VisibleIndex="2">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewDataTextColumn Caption="Grupo" FieldName="ListaReduzida" VisibleIndex="0" Width="150px">
                                                <CellStyle Wrap="False">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <SettingsBehavior AllowFocusedRow="True" />
                                        <SettingsPager Mode="ShowAllRecords">
                                        </SettingsPager>
                                        <Settings ShowFooter="True" />
                                        <SettingsDetail ShowDetailRow="True" />
                                        <Styles>
                                            <Header HorizontalAlign="Center">
                                            </Header>
                                            <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF">
                                            </FocusedRow>
                                            <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                            <Footer Font-Bold="True"></Footer>
                                        </Styles>
                                        <Templates>
                                            <DetailRow>
                                                <dx:ASPxGridView ID="gridSubgrupo" runat="server" AutoGenerateColumns="False" DataSourceID="dsSubgrupo" KeyFieldName="idSubgrupo" OnBeforePerformDataSelect="gridSubgrupo_BeforePerformDataSelect" OnCustomSummaryCalculate="gridSubgrupo_CustomSummaryCalculate1" OnCustomUnboundColumnData="gridSubgrupo_CustomUnboundColumnData" OnHtmlDataCellPrepared="gridSubgrupo_HtmlDataCellPrepared" OnHtmlFooterCellPrepared="gridSubgrupo_HtmlFooterCellPrepared">
                                                    <TotalSummary>
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="perc" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercial" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAA" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAA" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAA" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercialAA" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAT" SummaryType="Custom" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAA" SummaryType="Custom" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Vol" SummaryType="Custom" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Reais" SummaryType="Custom" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Lucro" SummaryType="Custom" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartTotalAT" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartTotalAA" SummaryType="Sum" />
                                                    </TotalSummary>
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn FieldName="idFilial" Visible="False" VisibleIndex="1">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="Ano" Visible="False" VisibleIndex="1">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="idSubgrupo" Visible="False" VisibleIndex="2">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewBandColumn Caption="Crescimento em %" VisibleIndex="6">
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Vol" FieldName="percCresc_Vol" ToolTip="Cresimento do Volume vendido" UnboundType="Decimal" VisibleIndex="0">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="R$" FieldName="percCresc_Reais" ToolTip="Crescimento em Reais" UnboundType="Decimal" VisibleIndex="1">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <CellStyle>
                                                                        <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Lucro" FieldName="percCresc_Lucro" ToolTip="Crescimento do Lucro" UnboundType="Decimal" VisibleIndex="2">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                        </dx:GridViewBandColumn>
                                                        <dx:GridViewBandColumn Caption="Ano Atual" VisibleIndex="5">
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVenda" ReadOnly="True" VisibleIndex="1">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <CellStyle ForeColor="Blue"></CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde" ReadOnly="True" VisibleIndex="0">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <FooterCellStyle ForeColor="Blue">
                                                                    </FooterCellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="% P.D." FieldName="perc" ToolTip="% de Participação no Departamento" VisibleIndex="3">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucroComercial" ReadOnly="True" VisibleIndex="4">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <CellStyle>
                                                                        <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargemAT" UnboundType="Decimal" VisibleIndex="5">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="% Part." FieldName="percPartTotalAA" ToolTip="% de Participação no total geral" VisibleIndex="2">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                        </dx:GridViewBandColumn>
                                                        <dx:GridViewBandColumn Caption="Ano Anterior" VisibleIndex="3">
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeAA" ReadOnly="True" VisibleIndex="0">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <FooterCellStyle ForeColor="Blue">
                                                                    </FooterCellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVendaAA" ReadOnly="True" VisibleIndex="1">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <CellStyle>
                                                                        <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="% P.D." FieldName="percAA" ToolTip="% de Participação no Departamento" VisibleIndex="3">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucroComercialAA" ReadOnly="True" VisibleIndex="4">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <CellStyle ForeColor="Blue">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargemAA" UnboundType="Decimal" VisibleIndex="5">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPartTotalAT" ToolTip="% de Participação no total geral" VisibleIndex="2">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                        </dx:GridViewBandColumn>
                                                        <dx:GridViewDataTextColumn Caption="Sub-Grupo" FieldName="ListaReduzida" VisibleIndex="0" Width="150px">
                                                            <CellStyle Wrap="False">
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                    <SettingsBehavior AllowFocusedRow="True" />
                                                    <SettingsPager Mode="ShowAllRecords">
                                                    </SettingsPager>
                                                    <Settings ShowFooter="True" />
                                                    <Styles>
                                                        <Header HorizontalAlign="Center">
                                                        </Header>
                                                        <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF">
                                                        </FocusedRow>
                                                        <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                                        <Footer Font-Bold="True"></Footer>
                                                    </Styles>
                                                    <Templates>
                                                        <DetailRow>
                                                            <dx:ASPxGridView ID="gridSubgrupo" runat="server" AutoGenerateColumns="False" KeyFieldName="idSubgrupo">
                                                                <TotalSummary>
                                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" SummaryType="Sum" />
                                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="perc" SummaryType="Sum" />
                                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercial" SummaryType="Sum" />
                                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAA" SummaryType="Sum" />
                                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAA" SummaryType="Sum" />
                                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAA" SummaryType="Sum" />
                                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercialAA" SummaryType="Sum" />
                                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAT" SummaryType="Custom" />
                                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAA" SummaryType="Custom" />
                                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Vol" SummaryType="Custom" />
                                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Reais" SummaryType="Custom" />
                                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Lucro" SummaryType="Custom" />
                                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartTotalAT" SummaryType="Sum" />
                                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartTotalAA" SummaryType="Sum" />
                                                                </TotalSummary>
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn FieldName="idFilial" Visible="False" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="Ano" Visible="False" VisibleIndex="1">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn FieldName="idSubgrupo" Visible="False" VisibleIndex="2">
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewBandColumn Caption="Crescimento em %" VisibleIndex="6">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="Vol" FieldName="percCresc_Vol" ToolTip="Cresimento do Volume vendido" UnboundType="Decimal" VisibleIndex="0">
                                                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                                </PropertiesTextEdit>
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="R$" FieldName="percCresc_Reais" ToolTip="Crescimento em Reais" UnboundType="Decimal" VisibleIndex="1">
                                                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                                </PropertiesTextEdit>
                                                                                <CellStyle>
                                                                                    <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                                </CellStyle>
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="Lucro" FieldName="percCresc_Lucro" ToolTip="Crescimento do Lucro" UnboundType="Decimal" VisibleIndex="2">
                                                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                                </PropertiesTextEdit>
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="Ano Atual" VisibleIndex="5">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVenda" ReadOnly="True" VisibleIndex="1">
                                                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                                </PropertiesTextEdit>
                                                                                <CellStyle ForeColor="Blue">
                                                                                </CellStyle>
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde" ReadOnly="True" VisibleIndex="0">
                                                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                                </PropertiesTextEdit>
                                                                                <FooterCellStyle ForeColor="Blue">
                                                                                </FooterCellStyle>
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="% P.D." FieldName="perc" ToolTip="% de Participação no Departamento" VisibleIndex="3">
                                                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                                </PropertiesTextEdit>
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucroComercial" ReadOnly="True" VisibleIndex="4">
                                                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                                </PropertiesTextEdit>
                                                                                <CellStyle>
                                                                                    <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                                </CellStyle>
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargemAT" UnboundType="Decimal" VisibleIndex="5">
                                                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                                </PropertiesTextEdit>
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="% Part." FieldName="percPartTotalAA" ToolTip="% de Participação no total geral" VisibleIndex="2">
                                                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                                </PropertiesTextEdit>
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewBandColumn Caption="Ano Anterior" VisibleIndex="3">
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeAA" ReadOnly="True" VisibleIndex="0">
                                                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                                </PropertiesTextEdit>
                                                                                <FooterCellStyle ForeColor="Blue">
                                                                                </FooterCellStyle>
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVendaAA" ReadOnly="True" VisibleIndex="1">
                                                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                                </PropertiesTextEdit>
                                                                                <CellStyle>
                                                                                    <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                                </CellStyle>
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="% P.D." FieldName="percAA" ToolTip="% de Participação no Departamento" VisibleIndex="3">
                                                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                                </PropertiesTextEdit>
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrLucroComercialAA" ReadOnly="True" VisibleIndex="4">
                                                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                                </PropertiesTextEdit>
                                                                                <CellStyle ForeColor="Blue">
                                                                                </CellStyle>
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargemAA" UnboundType="Decimal" VisibleIndex="5">
                                                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                                </PropertiesTextEdit>
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPartTotalAT" ToolTip="% de Participação no total geral" VisibleIndex="2">
                                                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                                </PropertiesTextEdit>
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                    </dx:GridViewBandColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Sub-Grupo" FieldName="ListaReduzida" VisibleIndex="0" Width="150px">
                                                                        <CellStyle Wrap="False">
                                                                        </CellStyle>
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                                <SettingsBehavior AllowFocusedRow="True" />
                                                                <SettingsPager Mode="ShowAllRecords">
                                                                </SettingsPager>
                                                                <Settings ShowFooter="True" />
                                                                <Styles>
                                                                    <Header HorizontalAlign="Center">
                                                                    </Header>
                                                                    <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF">
                                                                    </FocusedRow>
                                                                    <AlternatingRow BackColor="#EEEEEE">
                                                                    </AlternatingRow>
                                                                    <Footer Font-Bold="True">
                                                                    </Footer>
                                                                </Styles>
                                                            </dx:ASPxGridView>
                                                            <asp:SqlDataSource ID="dsItem" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Vendas_Mes.uspBuscarAnaliseAA_Subgrupo" SelectCommandType="StoredProcedure">
                                                                <SelectParameters>
                                                                    <asp:SessionParameter DefaultValue="Eliseu" Name="usuario" SessionField="sUSUARIO" Type="String" />
                                                                    <asp:SessionParameter DefaultValue="2013" Name="Ano" SessionField="sANO" Type="Int16" />
                                                                    <asp:SessionParameter DefaultValue="10" Name="idGrupo" SessionField="sGRUPO" Type="Int16" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>
                                                        </DetailRow>
                                                    </Templates>
                                                </dx:ASPxGridView>
                                                <asp:SqlDataSource ID="dsSubgrupo" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Vendas_Mes.uspBuscarAnaliseAA_Subgrupo" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:SessionParameter DefaultValue="Eliseu" Name="usuario" SessionField="sUSUARIO" Type="String" />
                                                        <asp:SessionParameter DefaultValue="2013" Name="Ano" SessionField="sANO" Type="Int16" />
                                                        <asp:SessionParameter DefaultValue="10" Name="idGrupo" SessionField="sGRUPO" Type="Int16" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </DetailRow>
                                        </Templates>
                                    </dx:ASPxGridView>
                                    <asp:SqlDataSource ID="dsGrupo" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Vendas_Mes.uspBuscarAnaliseAA_Grupo" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:SessionParameter DefaultValue="Eliseu" Name="usuario" SessionField="sUSUARIO" Type="String" />
                                            <asp:SessionParameter DefaultValue="2013" Name="Ano" SessionField="sANO" Type="Int16" />
                                            <asp:SessionParameter DefaultValue="1" Name="idSecao" SessionField="sSECAO" Type="Int16" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    
                                </DetailRow>
                            </Templates>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="dsSecao" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Vendas_Mes.uspBuscarAnaliseAA_Secao" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="Eliseu" Name="usuario" SessionField="sUSUARIO" Type="String" />
                                <asp:SessionParameter DefaultValue="2013" Name="Ano" SessionField="sANO" Type="Int16" />
                                <asp:SessionParameter DefaultValue="1" Name="idDepto" SessionField="sDEPTO" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        
                    </DetailRow>
                </Templates>
            </dx:ASPxGridView>
            <asp:SqlDataSource ID="dsDepto" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Vendas_Mes.uspBuscarAnaliseAA" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="Eliseu" Name="usuario" SessionField="sUSUARIO" Type="String" />
                    <asp:SessionParameter DefaultValue="2013" Name="Ano" SessionField="sANO" Type="Int16" />
                </SelectParameters>
            </asp:SqlDataSource>

            <%--------------------------------%>

        </tr>
    </table>
        </ContentTemplate>
</asp:UpdatePanel>
</asp:Content>

