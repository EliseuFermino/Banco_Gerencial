<%@ Page Title="Analise de Quebras por Mês" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="AnaliseComposicaoQuebraMes.aspx.vb" Inherits="MemberPages_Quebras_AnaliseComposicaoQuebraMes" %>

<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>
<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc2" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<%@ Register src="../../Controles/wucListaLojasComCorporacao.ascx" tagname="wucListaLojasComCorporacao" tagprefix="uc3" %>
<%@ Register src="../../Controles/wucBotaoAtualizar.ascx" tagname="wucBotaoAtualizar" tagprefix="uc4" %>

<%@ Register src="../../Controles/wucBotaoExcel.ascx" tagname="wucBotaoExcel" tagprefix="uc5" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
        }
        .auto-style4 {
        }
        .auto-style8 {
            width: 369px;
        }
        .auto-style9 {
            width: 92px;
        }
        .auto-style10 {
            width: 100px;
        }
        .auto-style11 {
            width: 91px;
        }
        .auto-style12 {
            width: 102px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table cellspacing="1" class="auto-style1">
                <tr>
                    <td class="auto-style4" style="border: 1px solid #C0C0C0; text-align: center; vertical-align: top; background-color: #CCCCCC;" colspan="2">
                        <strong>Período Inicial</strong></td>
                    <td class="auto-style2" style="border: 1px solid #C0C0C0; text-align: center; vertical-align: top; background-color: #CCCCCC;" colspan="2">
                        <strong>Periodo Final</strong></td>
                    <td style="border: 1px solid #C0C0C0; text-align: center; vertical-align: top; background-color: #CCCCCC;" class="auto-style8">
                        <strong>Lojas e Empresa</strong></td>
                    <td>
                        &nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style9" style="text-align: left; vertical-align: top">
                        <uc1:wucAno ID="cboAnoInicial" runat="server" />
                    </td>
                    <td class="auto-style10">
                        <uc2:wuciListaMes ID="cboMesInicial" runat="server" LabelDescMes="Mês:" />
                    </td>
                    <td class="auto-style11" style="text-align: left; vertical-align: top">
                        <uc1:wucAno ID="cboAnoFinal" runat="server" />
                    </td>
                    <td class="auto-style12" style="text-align: left; vertical-align: top">
                        <uc2:wuciListaMes ID="cboMesFinal" runat="server" LabelDescMes="Mês:" />
                    </td>
                    <td class="auto-style8" style="text-align: left; vertical-align: top">
                        <uc3:wucListaLojasComCorporacao ID="cboFilial" runat="server" />
                    </td>
                    <td>
                        <uc4:wucBotaoAtualizar ID="btnAtualizar" runat="server" />
                    </td>
                    <td></td>
                </tr>
            </table>
            <table cellspacing="1" class="auto-style1">
                <tr>
                    <td style="text-align: left; vertical-align: top">
                        <dx:ASPxGridView ID="gridDepto" runat="server" DataSourceID="dsDepto" AutoGenerateColumns="False" EnableTheming="True" Theme="DevEx" KeyFieldName="Depto">
                            <TotalSummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargem" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde51" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg51" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde52" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg52" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeDiv" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDiv" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde23" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg23" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeQuebra" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrQuebra" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />
                            </TotalSummary>
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="listaDepto" ReadOnly="True" SortIndex="0" SortOrder="Ascending" VisibleIndex="0" Width="100px" Caption="Departamento">
                                    <HeaderStyle Font-Size="Medium" />
                                    <CellStyle Wrap="False">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Venda e Margem" Name="bandVendaMargem" VisibleIndex="1">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVenda" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargem" VisibleIndex="3" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="vlrMargem" Visible="False" VisibleIndex="1" Width="80px">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Agenda 51 (sobra)" Name="bandAgenda51" VisibleIndex="2">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde51" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrAg51" VisibleIndex="1" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Agenda 52 (falta)" Name="bandAgenda52" VisibleIndex="3">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde52" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrAg52" VisibleIndex="1" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Divergência (dif. 51 e 52)" Name="bandDivergencia" VisibleIndex="5">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeDiv" UnboundType="Decimal" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrDiv" UnboundType="Decimal" VisibleIndex="1" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Agenda 23 (lixo)" Name="bandAgenda23" VisibleIndex="8">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde23" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrAg23" VisibleIndex="1" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Total da Perda" Name="bandTotalPerda" VisibleIndex="11">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeQuebra" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrQuebra" VisibleIndex="1" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Perda" FieldName="percCresc" UnboundType="Decimal" VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn FieldName="Depto" VisibleIndex="15" Width="5px" Visible="False">
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
                                <Footer Font-Bold="True">
                                </Footer>
                                    <FocusedRow BackColor="Silver" ForeColor="#0066FF"> </FocusedRow>
                                	<AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                            </Styles>
                            <Templates>
                                <DetailRow>
                                    <dx:ASPxGridView ID="gridSecao" runat="server" AutoGenerateColumns="False" DataSourceID="dsSecao" EnableTheming="True" KeyFieldName="Secao" OnBeforePerformDataSelect="gridSecao_BeforePerformDataSelect" Theme="DevEx" OnCustomSummaryCalculate="gridSecao_CustomSummaryCalculate" OnHtmlDataCellPrepared="gridSecao_HtmlDataCellPrepared" OnHtmlFooterCellPrepared="gridSecao_HtmlFooterCellPrepared">
                                        <TotalSummary>
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargem" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde51" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg51" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde52" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg52" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeDiv" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDiv" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde23" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg23" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeQuebra" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrQuebra" SummaryType="Sum" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />
                                        </TotalSummary>
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Seção" FieldName="listaReduzida" ReadOnly="True" SortIndex="0" SortOrder="Ascending" VisibleIndex="0" Width="100px">
                                                <HeaderStyle Font-Size="Medium" />
                                                <CellStyle Wrap="False">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewBandColumn Caption="Venda e Margem" Name="bandVendaMargem" VisibleIndex="1">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVenda" VisibleIndex="0" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargem" VisibleIndex="3" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="vlrMargem" Visible="False" VisibleIndex="1" Width="80px">
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Agenda 51 (sobra)" Name="bandAgenda51" VisibleIndex="2">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde51" VisibleIndex="0" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrAg51" VisibleIndex="1" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Agenda 52 (falta)" Name="bandAgenda52" VisibleIndex="3">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde52" VisibleIndex="0" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrAg52" VisibleIndex="1" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Divergência (dif. 51 e 52)" Name="bandDivergencia" VisibleIndex="5">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeDiv" UnboundType="Decimal" VisibleIndex="0" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrDiv" UnboundType="Decimal" VisibleIndex="1" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Agenda 23 (lixo)" Name="bandAgenda23" VisibleIndex="8">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde23" VisibleIndex="0" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrAg23" VisibleIndex="1" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Total da Perda" Name="bandTotalPerda" VisibleIndex="11">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeQuebra" VisibleIndex="0" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrQuebra" VisibleIndex="1" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Perda" FieldName="percCresc" UnboundType="Decimal" VisibleIndex="2" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewDataTextColumn FieldName="Depto" Visible="False" VisibleIndex="15" Width="5px">
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
                                            <Footer Font-Bold="True">
                                            </Footer>
                                            <FocusedRow BackColor="Silver" ForeColor="#0066FF"> </FocusedRow>
                                            <AlternatingRow BackColor="#E6F2FF"></AlternatingRow>
                                        </Styles>
                                        <Templates>
                                            <DetailRow>
                                                <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" EnableTheming="True" KeyFieldName="idProduto" OnBeforePerformDataSelect="ASPxGridView1_BeforePerformDataSelect" OnCustomSummaryCalculate="ASPxGridView1_CustomSummaryCalculate" OnHtmlDataCellPrepared="ASPxGridView1_HtmlDataCellPrepared" OnHtmlFooterCellPrepared="ASPxGridView1_HtmlFooterCellPrepared" Theme="DevEx">
                                                    <TotalSummary>
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargem" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" SummaryType="Custom" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde51" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg51" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde52" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg52" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeDiv" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDiv" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde23" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg23" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeQuebra" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrQuebra" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" SummaryType="Sum" />
                                                    </TotalSummary>
                                                    <GroupSummary>
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" ShowInGroupFooterColumn="vlrVenda" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde51" ShowInGroupFooterColumn="Qtde51" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg51" ShowInGroupFooterColumn="vlrAg51" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde52" ShowInGroupFooterColumn="Qtde52" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg52" ShowInGroupFooterColumn="vlrAg52" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde23" ShowInGroupFooterColumn="Qtde23" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg23" ShowInGroupFooterColumn="vlrAg23" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeQuebra" ShowInGroupFooterColumn="QtdeQuebra" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrQuebra" ShowInGroupFooterColumn="vlrQuebra" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" ShowInGroupFooterColumn="percCresc" SummaryType="Custom" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargem" ShowInGroupFooterColumn="vlrMargem" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" ShowInGroupFooterColumn="percMargem" SummaryType="Custom" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" ShowInGroupFooterColumn="Qtde" SummaryType="Sum" />
                                                    </GroupSummary>
                                                    <Columns>
                                                        <dx:GridViewCommandColumn Visible="False" VisibleIndex="0" Width="10px" ShowClearFilterButton="True"/>
                                                        <dx:GridViewBandColumn Caption="Produto" VisibleIndex="1">
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Código" FieldName="idProduto" ToolTip="Código do produto" VisibleIndex="0" Width="60px">                                                                   
                                                                    <Settings AutoFilterCondition="Equals" />
                                                                    <CellStyle Wrap="False"></CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Descrição" FieldName="DescProduto" ToolTip="Descrição do produto" VisibleIndex="0" Width="100px">
                                                                     <Settings AutoFilterCondition="Contains" />
                                                                    <CellStyle Wrap="False"></CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                        </dx:GridViewBandColumn>
                                                        <dx:GridViewBandColumn Caption="Volume, Vendas e Margem" ToolTip="Valores de venda e percentual de margem por item" VisibleIndex="2">
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVenda" ReadOnly="True" ToolTip="Valor de venda." VisibleIndex="1" Width="80px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargem" ReadOnly="True" ToolTip="Percentual de margem de frente de caixa." VisibleIndex="2" Width="60px">
                                                                     <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                     <Settings AllowAutoFilter="False" AllowHeaderFilter="False" ShowFilterRowMenu="False" ShowInFilterControl="True" />
                                                                     <GroupFooterCellStyle BackColor="#D7EBFF" ForeColor="Blue">
                                                                     </GroupFooterCellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde" VisibleIndex="0" Width="60px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" AllowAutoFilterTextInputTimer="False" AllowHeaderFilter="False" ShowFilterRowMenu="False" ShowInFilterControl="False" />
                                                                    <GroupFooterCellStyle BackColor="#C1E0FF" ForeColor="Blue">
                                                                        <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                        <BorderRight BorderColor="#999999" BorderStyle="Dotted" BorderWidth="1px" />
                                                                    </GroupFooterCellStyle>                                                                   
                                                                    <Settings AllowAutoFilter="False" AllowAutoFilterTextInputTimer="False" AllowHeaderFilter="False" ShowFilterRowMenu="False" ShowInFilterControl="False" />
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                        </dx:GridViewBandColumn>
                                                        <dx:GridViewBandColumn Caption="Agenda 51 (sobra)" ToolTip="Exibe as informações de volume e valor em reais da agenda 51 (sobra de mercadoria)." VisibleIndex="3">
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde51" ReadOnly="True" VisibleIndex="0" Width="60px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                    <GroupFooterCellStyle>
                                                                        <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                        <BorderRight BorderColor="#999999" BorderStyle="Dotted" BorderWidth="1px" />
                                                                    </GroupFooterCellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrAg51" ReadOnly="True" VisibleIndex="1" Width="80px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                        </dx:GridViewBandColumn>
                                                        <dx:GridViewBandColumn Caption="Agenda 52 (falta)" ToolTip="Exibe as informações de volume e valor em reais da agenda 52 (falta de mercadoria)." VisibleIndex="4">
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde52" ReadOnly="True" VisibleIndex="0" Width="60px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                    <GroupFooterCellStyle>
                                                                        <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                        <BorderRight BorderColor="#999999" BorderStyle="Dotted" BorderWidth="1px" />
                                                                    </GroupFooterCellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrAg52" ReadOnly="True" VisibleIndex="1" Width="80px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                        </dx:GridViewBandColumn>
                                                        <dx:GridViewBandColumn Caption="Agenda 23 (lixo)" ToolTip="Exibe as informações de volume e valor em reais da agenda 23 (lixo)." VisibleIndex="5">
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde23" ReadOnly="True" VisibleIndex="0" Width="60px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                    <GroupFooterCellStyle BackColor="#D8D8D8">
                                                                    </GroupFooterCellStyle>
                                                                    <GroupFooterCellStyle BackColor="#D8D8D8">
                                                                        <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                        <BorderRight BorderColor="#999999" BorderStyle="Dotted" BorderWidth="1px" />
                                                                    </GroupFooterCellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrAg23" ReadOnly="True" VisibleIndex="1" Width="80px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                        </dx:GridViewBandColumn>
                                                        <dx:GridViewBandColumn Caption="Total Perda" ToolTip="Exibe as informações de volume, valor em reais  e percentual de crescimento do total da perda. O total da perda é composto pelo calculo (+ agenda23 + agenda 51 - agenda 52). O percentual de crescimento se dá pela divisão do valor total de quebra pela venda." VisibleIndex="6">
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeQuebra" ReadOnly="True" VisibleIndex="0" Width="70px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <GroupFooterCellStyle BackColor="#FFFFCC" Font-Bold="True">
                                                                    </GroupFooterCellStyle>
                                                                    <GroupFooterCellStyle BackColor="#CCFFCC" Font-Bold="False">
                                                                        <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                    </GroupFooterCellStyle>
                                                                    <Settings AllowAutoFilter="False" />
                                                                    <GroupFooterCellStyle BackColor="#FFFFCC" Font-Bold="True">
                                                                        <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                        <BorderRight BorderColor="#999999" BorderStyle="Double" BorderWidth="1px" />
                                                                    </GroupFooterCellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrQuebra" ReadOnly="True" VisibleIndex="1" Width="90px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="% Perda" FieldName="percCresc" ReadOnly="True" VisibleIndex="2" Width="60px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                        </dx:GridViewBandColumn>
                                                        <dx:GridViewDataTextColumn Caption="Grupo" FieldName="ListaGrupo" GroupIndex="0" SortIndex="0" SortOrder="Ascending" VisibleIndex="15" Width="50px">
                                                            <Settings AutoFilterCondition="Contains" />
                                                            <CellStyle Wrap="False">
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Sub-grupo" FieldName="ListaSubgrupo" VisibleIndex="17" Width="70px" GroupIndex="1" SortIndex="1" SortOrder="Ascending">
                                                            <Settings AutoFilterCondition="Contains" />
                                                            <CellStyle Wrap="False"></CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Fornecedor" FieldName="DescFornecedor" VisibleIndex="21" Width="100px" ToolTip="Fornecedor. Exibe informações por fornecedor">                                                            
                                                            <Settings AutoFilterCondition="Contains" />
                                                            <CellStyle Wrap="False">
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="vlrMargem" VisibleIndex="25" Width="1px" Visible="False">
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="Secao" Visible="False" VisibleIndex="24">
                                                            <CellStyle Wrap="False">
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                    <SettingsBehavior ColumnResizeMode="Control" AllowFocusedRow="True" />                                                   
                                                    <SettingsPager Mode="ShowAllRecords">
                                                    </SettingsPager>
                                                    <Settings ShowFilterBar="Auto" ShowFilterRow="True" ShowFilterRowMenu="True" ShowFooter="True" ShowGroupFooter="VisibleAlways" ShowGroupPanel="True" />
                                                    <SettingsLoadingPanel Text="Processando informação. Aguarde...&amp;hellip;" />
                                                    <Styles>
                                                        <Header HorizontalAlign="Center"></Header>
                                                        <GroupFooter BackColor="#EAEAEA" Font-Bold="False"></GroupFooter>
                                                        <FocusedRow BackColor="Silver" ForeColor="#0066FF"> </FocusedRow>
                                                        <GroupRow Font-Bold="True"></GroupRow>
                                                        <AlternatingRow BackColor="#E6F2FF"></AlternatingRow>
                                                    </Styles>
                                                </dx:ASPxGridView>
                                            </DetailRow>
                                        </Templates>
                                    </dx:ASPxGridView>
                                </DetailRow>
                            </Templates>
                        </dx:ASPxGridView>

                        <asp:SqlDataSource ID="dsDepto" runat="server" ConnectionString="<%$ ConnectionStrings:gerAgendasConnectionString %>" SelectCommand="AnaliseMes.vBuscaQuebraDepto" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="anoI" SessionField="sANO_INICIAL" Type="Int16" />
                                <asp:SessionParameter Name="anoF" SessionField="sANO_FINAL" Type="Int16" />
                                <asp:SessionParameter Name="mesI" SessionField="sMES_INICIAL" Type="Byte" />
                                <asp:SessionParameter Name="mesF" SessionField="sMES_FINAL" Type="Byte" />
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <asp:SqlDataSource ID="dsSecao" runat="server" ConnectionString="<%$ ConnectionStrings:gerAgendasConnectionString %>" SelectCommand="AnaliseMes.vBuscaQuebraSecao" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="anoI" SessionField="sANO_INICIAL" Type="Int16" />
                                <asp:SessionParameter Name="anoF" SessionField="sANO_FINAL" Type="Int16" />
                                <asp:SessionParameter Name="mesI" SessionField="sMES_INICIAL" Type="Byte" />
                                <asp:SessionParameter Name="mesF" SessionField="sMES_FINAL" Type="Byte" />
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                <asp:SessionParameter Name="idDepto" SessionField="sDEPTO" Type="Int16" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerAgendasConnectionString %>" SelectCommand="AnaliseMes.vBuscaQuebraGrupo_Subgrupo_Item" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="anoI" SessionField="sANO_INICIAL" Type="Int16" />
                                <asp:SessionParameter Name="anoF" SessionField="sANO_FINAL" Type="Int16" />
                                <asp:SessionParameter Name="mesI" SessionField="sMES_INICIAL" Type="Byte" />
                                <asp:SessionParameter Name="mesF" SessionField="sMES_FINAL" Type="Byte" />
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Int16" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>
            <table cellspacing="1" class="auto-style1">
            </table>
<br />
        </ContentTemplate>
    </asp:UpdatePanel>
    <uc1:wucBotaoExcel runat="server" ID="wucBotaoExcel" CallGridViewID="ASPxGridView1" />
</asp:Content>

