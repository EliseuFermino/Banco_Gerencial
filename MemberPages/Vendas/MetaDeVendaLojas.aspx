<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/SiteVendas.master" AutoEventWireup="false" CodeFile="MetaDeVendaLojas.aspx.vb" Inherits="Ranking_MetaDeVenda" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>



<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc3" %>

<%@ Register src="../../Controles/wucFixarCabecalho.ascx" tagname="wucFixarCabecalho" tagprefix="uc1" %>

<%@ Register src="../../Controles/DescricaoAtualizaro.ascx" tagname="DescricaoAtualizaro" tagprefix="uc2" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>


<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
    <style type="text/css">
        .style6
        {
            width: 100%;
        }
        .style7
        {
            width: 694px;
        }
.dxgvControl_Office2003_Blue,
.dxgvDisabled_Office2003_Blue
{
	border: solid 1px #4f93e3;
	font: 9pt Tahoma;
	background-color: White;
	color: Black;
	cursor: default;
}

.dxgvTitlePanel_Office2003_Blue,
.dxgvTable_Office2003_Blue caption
{
	color: White;
	font-weight:bold;
	padding:3px;
	text-align:center;	
	border-bottom: solid 1px #4f93e3;
	background: #0f439d url('../App_Themes/Office2003%20Blue/GridView/gvTitleBack.gif') repeat-x center top;
        }

.dxgvTable_Office2003_Blue
{
	background-color: transparent;
	border:0;
	border-collapse: separate !important;
	overflow:hidden;
	font: 9pt Tahoma;
	color: Black;
}
.dxgvDataRowAlt_Office2003_Blue
{
	background-color: #edf5ff;
}
.dxgvFooter_Office2003_Blue
{	
	background-color: #94B6E8;
	white-space: nowrap;
}
    .auto-style3 {
        width: 100px;
        float: left;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="style1">
        <tr>
            <td>
                <table cellspacing="1" class="style6">
                    <tr>
                        <td align="left" class="style7" valign="top">
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <Triggers >
                                     <asp:PostBackTrigger ControlID="btnExportar" /> 
                                </Triggers>
                                <ContentTemplate>
                                    <table cellspacing="1" class="style6">
                                        <tr>

                                            <td class="auto-style3">
                                                <dxe:ASPxRadioButton ID="chkAno" runat="server" Text="Ano" GroupName="grp" Checked="true" AutoPostBack="True" ></dxe:ASPxRadioButton>                                                
                                            </td>
                                            <td class="auto-style3">
                                                <dxe:ASPxRadioButton ID="chkMes" runat="server" Text="Mes" GroupName="grp" AutoPostBack="True"></dxe:ASPxRadioButton>
                                            </td>

                                            <td class="auto-style3">
                                                <uc3:wucAno ID="cboAno" runat="server" />
                                            </td>
                                            <td class="auto-style3">
                                                <uc1:wuciListaMes runat="server" ID="cboMes" />
                                            </td>
                                            <td>
                                                <uc1:wucFixarCabecalho ID="chkFixarCabecalho" runat="server" />
                                            </td>
                                            <td>
                                                <dxe:ASPxButton ID="btnExportar" runat="server" 
                                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                                    Text="Exportar Excel" Theme="DevEx" Width="150px">
                                                </dxe:ASPxButton>
                                                <dxwgv:ASPxGridViewExporter ID="ExporterExcel1" runat="server" 
                                                    GridViewID="gridMaster">
                                                </dxwgv:ASPxGridViewExporter>
                                            </td>
                                        </tr>
                                    </table>
                                    <table class="style6">
                                        <tr>
                                            <td>
                                                <dxwgv:ASPxGridView ID="gridMaster" runat="server" AutoGenerateColumns="False" 
                                                    ClientInstanceName="master" 
                                                    CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                                    CssPostfix="Office2003_Blue" DataSourceID="dsMaster" KeyFieldName="Mes" 
                                                    Width="980px" EnableTheming="True" Theme="DevEx">
                                                    <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                                    <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                                        CssPostfix="Office2003_Blue">
                                                        <Header ImageSpacing="5px" SortingImageSpacing="5px" HorizontalAlign="Center">
                                                        </Header>
                                                        <AlternatingRow BackColor="#F3F3F3">
                                                        </AlternatingRow>
                                                        <FocusedRow Font-Bold="True">
                                                        </FocusedRow>
                                                        <Footer BackColor="#E4E4E4" Font-Bold="True">
                                                        </Footer>
                                                        <LoadingPanel ImageSpacing="10px">
                                                        </LoadingPanel>
                                                        <TitlePanel Font-Size="Medium">
                                                        </TitlePanel>
                                                    </Styles>
                                                    <SettingsPager Mode="ShowAllRecords">
                                                    </SettingsPager>
                                                    <TotalSummary>
                                                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOri" 
                                                            ShowInGroupFooterColumn="Original" SummaryType="Sum" />
                                                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRev" 
                                                            ShowInGroupFooterColumn="Revista" SummaryType="Sum" />
                                                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReaAA" SummaryType="Sum" />
                                                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRea" 
                                                            ShowInGroupFooterColumn="Realizado" SummaryType="Sum" />
                                                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="DifRevOri" 
                                                            ShowInGroupFooterColumn="Dif. " SummaryType="Sum" />
                                                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingOri" SummaryType="Custom" />
                                                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingRev" SummaryType="Custom" />
                                                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingRea" SummaryType="Custom" />
                                                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDifRea" SummaryType="Sum" />
                                                    </TotalSummary>
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
                                                    <SettingsText Title="Meta de Vendas 2011 - Lojas" />
                                                    <Columns>
                                                        <dxwgv:GridViewDataTextColumn Caption="Descrição" FieldName="descMes" 
                                                            ToolTip="Descrição do mês" VisibleIndex="0" Width="130px">
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <CellStyle Wrap="False">
                                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                            </CellStyle>
                                                            <FooterCellStyle>
                                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                            </FooterCellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewBandColumn Caption="Meta 2014" Name="bandMeta" ShowInCustomizationForm="True" VisibleIndex="1">
                                                            <Columns>
                                                                <dxwgv:GridViewDataTextColumn Caption="Original" FieldName="vlrOri" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Meta de Venda Original da Empresa" VisibleIndex="0" Width="110px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle ForeColor="#FF6600">
                                                                    </CellStyle>
                                                                    <FooterCellStyle Font-Bold="True" ForeColor="#FF6600">
                                                                    </FooterCellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Revista" FieldName="vlrRev" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Meta de Venda Revisada da Empresa" VisibleIndex="1" Width="110px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle ForeColor="#009900">
                                                                    </CellStyle>
                                                                    <FooterCellStyle Font-Bold="True" ForeColor="#009900">
                                                                    </FooterCellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Diferença" FieldName="DifRevOri" ShowInCustomizationForm="True" ToolTip="Diferença entre Revista e Original." VisibleIndex="2" Width="95px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle>
                                                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                    </CellStyle>
                                                                    <FooterCellStyle Font-Bold="True">
                                                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                    </FooterCellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                            </Columns>
                                                        </dxwgv:GridViewBandColumn>
                                                        <dxwgv:GridViewBandColumn Caption="Venda Realizada" ShowInCustomizationForm="True" VisibleIndex="4">
                                                            <Columns>
                                                                <dxwgv:GridViewDataTextColumn Caption="2013" FieldName="vlrReaAA" Name="vlrReaAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="110px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <CellStyle ForeColor="#996633">
                                                                    </CellStyle>
                                                                    <FooterCellStyle Font-Bold="True" ForeColor="#996633">
                                                                    </FooterCellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="2014" FieldName="vlrRea" Name="vlrRea" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Venda Realizada do BDT. As vezes pode demorar até 4 dias para a tesouraria central fechar o BDT." VisibleIndex="1" Width="110px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle ForeColor="Blue">
                                                                    </CellStyle>
                                                                    <FooterCellStyle Font-Bold="True" ForeColor="Blue">
                                                                    </FooterCellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Diferença" FieldName="vlrDifRea" ToolTip="Diferença de vendas entre o ano anterior e o ano atual" VisibleIndex="2" Width="110px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <CellStyle>
                                                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                    </CellStyle>
                                                                    <FooterCellStyle>
                                                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                    </FooterCellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                            </Columns>
                                                        </dxwgv:GridViewBandColumn>
                                                        <dxwgv:GridViewBandColumn Caption="Atingimento" ShowInCustomizationForm="True" VisibleIndex="6">
                                                            <Columns>
                                                                <dxwgv:GridViewDataTextColumn Caption="% Ori." FieldName="percAtingOri" ShowInCustomizationForm="True" ToolTip="% de atingimento. Realizado sobre Original" VisibleIndex="0" Width="60px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <FooterCellStyle Font-Bold="True">
                                                                    </FooterCellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="% Rev." FieldName="percAtingRev" ShowInCustomizationForm="True" ToolTip="% de atingimento. Realizado sobre Revista" VisibleIndex="1" Width="60px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <FooterCellStyle Font-Bold="True">
                                                                    </FooterCellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="% AA" FieldName="percAtingRea" ShowInCustomizationForm="True" VisibleIndex="2" Width="60px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <FooterCellStyle Font-Bold="True">
                                                                    </FooterCellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                            </Columns>
                                                        </dxwgv:GridViewBandColumn>
                                                    </Columns>
                                                    <Settings ShowFooter="True" ShowTitlePanel="True" 
                                                        VerticalScrollableHeight="400" ShowVerticalScrollBar="True" />
                                                    <StylesEditors>
                                                        <ProgressBar Height="25px">
                                                        </ProgressBar>
                                                    </StylesEditors>
                                                    <SettingsDetail ShowDetailRow="True" ShowDetailButtons="False" />
                                                </dxwgv:ASPxGridView>
                                                <asp:SqlDataSource ID="dsMaster" runat="server" 
                                                    ConnectionString="<%$ ConnectionStrings:gerMetasConnectionString %>" 
                                                    SelectCommand="Analises.uspBuscarMetaDeVendaLoja" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="Ano" SessionField="sAno" />
                                                        <asp:SessionParameter Name="Mes" SessionField="sMes" />
                                                        <asp:SessionParameter Name="sAnoMes" SessionField="sAnoMes" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </td>
                                        </tr>
                                    </table>
                                    <uc2:DescricaoAtualizaro ID="labelSource" runat="server" />
                                    <br />
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                        <td valign="top">
                            
                            <br />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</asp:Content>

