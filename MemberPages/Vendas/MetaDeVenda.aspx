<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/SiteVendas.master" AutoEventWireup="false" CodeFile="MetaDeVenda.aspx.vb" Inherits="Ranking_MetaDeVenda" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register src="../../Controles/DescricaoAtualizaro.ascx" tagname="DescricaoAtualizaro" tagprefix="uc2" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>


<asp:Content ID="Content1" ContentPlaceHolderID="headContent" Runat="Server">
    <style type="text/css">
        .style4
        {
            width: 237px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="style1">
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <Triggers >
                        <asp:PostBackTrigger ControlID="btnExportar" />
                    </Triggers>
                    <ContentTemplate>
                        <table cellspacing="1" class="style4">
                            <tr>
                                <td>
                                
                                    <uc1:wucAno ID="cboAno" runat="server" />
                                
                                </td>
                                <td>
                                    &nbsp;</td>
                                <td>
                                    <dx:ASPxGridViewExporter ID="ExporterExcel1" runat="server">
                                    </dx:ASPxGridViewExporter>
                                    <dxe:ASPxButton ID="btnExportar" runat="server" 
                                        CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                        Text="Exportar Excel" Theme="DevEx" Width="150px">
                                    </dxe:ASPxButton>
                                </td>
                            </tr>
                        </table>
                        <table cellspacing="1" class="style4">
                            <tr>
                                <td>
                                    <dxwgv:ASPxGridView ID="gridMaster" runat="server" AutoGenerateColumns="False" 
                                        ClientInstanceName="master" 
                                        CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                        CssPostfix="Office2003_Blue" DataSourceID="dsMaster" KeyFieldName="Mes" 
                                        Width="500px" Theme="DevEx">
                                        <SettingsBehavior AllowFocusedRow="True" />
                                        <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                            CssPostfix="Office2003_Blue">
                                            <Header ImageSpacing="5px" SortingImageSpacing="5px" Font-Bold="False" HorizontalAlign="Center">
                                            </Header>
                                            <AlternatingRow BackColor="#F0F0F0">
                                            </AlternatingRow>
                                            <Footer BackColor="#DBDBDB">
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
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReal" 
                                                ShowInGroupFooterColumn="Realizado" SummaryType="Sum" />
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="DifRevOri" 
                                                ShowInGroupFooterColumn="Dif. " SummaryType="Sum" />
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" ShowInColumn="Dif. " 
                                                SummaryType="Custom" />
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAA" SummaryType="Sum" />
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percOri" SummaryType="Custom" />
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRev" SummaryType="Custom" />
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAA" SummaryType="Custom" />
                                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDifRea" SummaryType="Sum" />
                                        </TotalSummary>
                                        <Images ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                                            <FilterRowButton Height="13px" Width="13px" />
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
                                        </Images>
                                        <SettingsText Title="Meta de Vendas 2011 - Empresa" />
                                        <Columns>
                                            <dxwgv:GridViewDataTextColumn Caption="Mês" FieldName="Mes" 
                                                ToolTip="Mês da Venda da Empresa" VisibleIndex="0" Width="15px">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <CellStyle HorizontalAlign="Center">
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="Descrição" FieldName="DescMes" 
                                                ToolTip="Descrição do mês" VisibleIndex="1" Width="80px">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                                <FooterCellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </FooterCellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewBandColumn Caption="Venda Realizada" VisibleIndex="5">
                                                <Columns>
                                                    <dxwgv:GridViewDataTextColumn Caption="Realizado AA" FieldName="vlrRealAA" ToolTip="Realizado do Ano Anterior. Venda vem do BDT" VisibleIndex="0" Width="90px" Name="vlrReaAA">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                                        </PropertiesTextEdit>
                                                        <CellStyle ForeColor="#996633">
                                                        </CellStyle>
                                                        <FooterCellStyle Font-Bold="True" ForeColor="#996633">
                                                        </FooterCellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="Realizado" FieldName="vlrReal" ReadOnly="True" ToolTip="Venda Realizada da Empresa. Venda vem do BDT" VisibleIndex="1" Width="90px" Name="vlrRea">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle Font-Bold="True" ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="Diferença" FieldName="vlrDifRea" ToolTip="Diferença de venda entre ano atual e ano anterior" VisibleIndex="2" Width="110px">
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
                                            <dxwgv:GridViewBandColumn Caption="Atingimento" VisibleIndex="7">
                                                <Columns>
                                                    <dxwgv:GridViewDataTextColumn Caption="% Ori." FieldName="percOri" ToolTip="% de atingimento. Realizado sobre Original" VisibleIndex="0" Width="40px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle Font-Bold="False">
                                                        </CellStyle>
                                                        <FooterCellStyle Font-Bold="True">
                                                        </FooterCellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="% Rev." FieldName="percRev" ToolTip="% de atingimento. Realizado sobre Revista" VisibleIndex="1" Width="40px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle Font-Bold="False">
                                                        </CellStyle>
                                                        <FooterCellStyle Font-Bold="True">
                                                        </FooterCellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="% AA" FieldName="percAA" ToolTip="Percentual de Crescimento sobre o Ano Anterior" VisibleIndex="2" Width="40px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle Font-Bold="False">
                                                        </CellStyle>
                                                        <FooterCellStyle Font-Bold="True">
                                                        </FooterCellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                </Columns>
                                            </dxwgv:GridViewBandColumn>
                                            <dxwgv:GridViewBandColumn Caption="Meta" VisibleIndex="2" Name="bandMeta">
                                                <Columns>
                                                    <dxwgv:GridViewDataTextColumn Caption="Original" FieldName="vlrOri" ReadOnly="True" ToolTip="Meta de Venda Original da Empresa" VisibleIndex="0" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#FF6600">
                                                        </CellStyle>
                                                        <FooterCellStyle Font-Bold="True" ForeColor="#FF6600">
                                                        </FooterCellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="Revista" FieldName="vlrRev" ReadOnly="True" ToolTip="Meta de Venda Revisada da Empresa" VisibleIndex="1" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                        <FooterCellStyle Font-Bold="True" ForeColor="#009900">
                                                        </FooterCellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="Dif.  Rev x Ori" FieldName="DifRevOri" ToolTip="Diferença entre Revista e Original." VisibleIndex="2" Width="70px">
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
                                        </Columns>
                                        <Settings ShowFooter="True" ShowTitlePanel="True" />
                                        <StylesEditors>
                                            <ProgressBar Height="25px">
                                            </ProgressBar>
                                        </StylesEditors>
                                        <SettingsDetail ShowDetailRow="True" ShowDetailButtons="False" />
                                    </dxwgv:ASPxGridView>
                                    <asp:SqlDataSource ID="dsMaster" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" 
                                        SelectCommand="usp_Buscar_GrupoMetaRealizado" 
                                        SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="Ano" SessionField="sAno" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </td>
                            </tr>
                        </table>
                        
                        <br />
                    </ContentTemplate>
                </asp:UpdatePanel>
                <br />
            </td>
        </tr>
    </table>

    <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="Database: gerBI" Anotacao2="Stored Procedure: dbo.usp_Buscar_GrupoMetaRealizado" />

</asp:Content>

