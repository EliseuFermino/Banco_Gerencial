<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/SiteVendas.master" AutoEventWireup="false" CodeFile="MetaDeVendaRegional.aspx.vb" Inherits="Ranking_MetaDeVenda" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>

<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc2" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register src="../../Controles/DescricaoAtualizaro.ascx" tagname="DescricaoAtualizaro" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table class="style1">
        <tr>
            <td>
                <table cellspacing="1" class="style1">
                    <tr>
                        <td>
                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <Triggers >
                                    <asp:PostBackTrigger ControlID ="btnExportar" />
                                </Triggers>
                                <ContentTemplate>
                                    <table cellspacing="1" class="style1">
                                        <tr>
                                            <td>
                                                <uc2:wucAno ID="cboAno" runat="server" />
                                            </td>
                                            <td>
                                                <dxe:ASPxButton ID="btnExportar" runat="server" 
                                                    CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
                                                    Text="Exportar Excel" Theme="DevEx" Width="150px">
                                                </dxe:ASPxButton>
                                                <dx:ASPxGridViewExporter ID="ExporterExcel1" runat="server">
                                                </dx:ASPxGridViewExporter>
                                            </td>
                                            <td></td>
                                        </tr>
                                    </table>
                                    <table cellspacing="1" class="style1">
                                        <tr>
                                            <td>
                                                <dxwgv:ASPxGridView ID="gridMaster" runat="server" AutoGenerateColumns="False" 
                                                    ClientInstanceName="master" 
                                                    CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                                    CssPostfix="Office2003_Blue" DataSourceID="dsMaster" KeyFieldName="Mes" 
                                                    EnableTheming="True" Theme="DevEx">
                                                    <Templates>
                                                        <DetailRow>
                                                            <dxwgv:ASPxGridView ID="gridDetail" runat="server" AutoGenerateColumns="False" 
                                                                ClientInstanceName="detail" 
                                                                CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                                                CssPostfix="Office2003_Blue" DataSourceID="dsDetail" KeyFieldName="Mes" 
                                                                OnBeforePerformDataSelect="gridDetail_DataSelect" EnableTheming="True" 
                                                                OnHtmlDataCellPrepared="gridDetail_HtmlDataCellPrepared" Theme="DevEx">
                                                                <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                                                    CssPostfix="Office2003_Blue">
                                                                    <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                                    </Header>
                                                                    <AlternatingRow BackColor="#F0F0F0">
                                                                    </AlternatingRow>
                                                                    <LoadingPanel ImageSpacing="10px">
                                                                    </LoadingPanel>
                                                                </Styles>
                                                                <SettingsPager Mode="ShowAllRecords">
                                                                </SettingsPager>
                                                                <Settings ShowFooter="True" />
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
                                                                <TotalSummary>
                                                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOri" 
                                                                        SummaryType="Sum" />
                                                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRev" 
                                                                        SummaryType="Sum" />
                                                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRea" 
                                                                        SummaryType="Sum" />
                                                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDifRevOri" 
                                                                        SummaryType="Sum" />
                                                                </TotalSummary>
                                                                <Columns>
                                                                    <dxwgv:GridViewDataTextColumn Caption="Mês" FieldName="idFilial" ToolTip="Mês" 
                                                                        VisibleIndex="0">
                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                        <CellStyle HorizontalAlign="Center">
                                                                        </CellStyle>
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataTextColumn Caption="Descrição" FieldName="Descricao" 
                                                                        VisibleIndex="1">
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataTextColumn Caption="Original" FieldName="vlrOri" 
                                                                        VisibleIndex="2">
                                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                        </PropertiesTextEdit>
                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataTextColumn Caption="Revista" FieldName="vlrRev" 
                                                                        VisibleIndex="3">
                                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                        </PropertiesTextEdit>
                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                        <CellStyle ForeColor="#009900">
                                                                        </CellStyle>
                                                                        <FooterCellStyle ForeColor="#009900">
                                                                        </FooterCellStyle>
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataTextColumn Caption="Dif." FieldName="vlrDifRevOri" 
                                                                        ToolTip="Diferença entre Revista e Original." VisibleIndex="4">
                                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                        </PropertiesTextEdit>
                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataTextColumn Caption="Realizada" FieldName="vlrRea" 
                                                                        VisibleIndex="5">
                                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                        </PropertiesTextEdit>
                                                                        <CellStyle ForeColor="Blue">
                                                                        </CellStyle>
                                                                        <FooterCellStyle ForeColor="Blue">
                                                                        </FooterCellStyle>
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataTextColumn Caption="% Ori" FieldName="percReaOri" 
                                                                        ReadOnly="True" VisibleIndex="6">
                                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                        </PropertiesTextEdit>
                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataTextColumn Caption="% Rev" FieldName="percReaRev" 
                                                                        ReadOnly="True" VisibleIndex="7">
                                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                        </PropertiesTextEdit>
                                                                        <HeaderStyle HorizontalAlign="Center" />
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataTextColumn FieldName="Ano" Visible="False" VisibleIndex="7">
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                    <dxwgv:GridViewDataTextColumn FieldName="Mes" Visible="False" VisibleIndex="7">
                                                                    </dxwgv:GridViewDataTextColumn>
                                                                </Columns>
                                                                <StylesEditors>
                                                                    <ProgressBar Height="25px">
                                                                    </ProgressBar>
                                                                </StylesEditors>                                                               
                                                            </dxwgv:ASPxGridView>
                                                        </DetailRow>
                                                    </Templates>
                                                    <SettingsBehavior AllowFocusedRow="True" />
                                                    <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                                        CssPostfix="Office2003_Blue">
                                                        <Header ImageSpacing="5px" SortingImageSpacing="5px">
                                                        </Header>
                                                        <AlternatingRow BackColor="#F0F0F0">
                                                        </AlternatingRow>
                                                        <Footer Font-Bold="True">
                                                        </Footer>
                                                        <GroupFooter BackColor="#D2E9FF" Font-Bold="True">
                                                        </GroupFooter>
                                                        <LoadingPanel ImageSpacing="10px">
                                                        </LoadingPanel>
                                                    </Styles>
                                                    <SettingsPager Mode="ShowAllRecords">
                                                    </SettingsPager>
                                                    <GroupSummary>
                                                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOri" 
                                                            ShowInGroupFooterColumn="Original" SummaryType="Sum" />
                                                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRev" 
                                                            ShowInGroupFooterColumn="Revista" SummaryType="Sum" />
                                                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="DifRevOri" 
                                                            ShowInGroupFooterColumn="Dif. " SummaryType="Sum" />
                                                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRea" 
                                                            ShowInGroupFooterColumn="Realizado" SummaryType="Sum" />
                                                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percDifReaOri" 
                                                            ShowInGroupFooterColumn="% Ori." SummaryType="Average" />
                                                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percDifReaRev" 
                                                            ShowInGroupFooterColumn="% Rev." SummaryType="Average" />
                                                        <dxwgv:ASPxSummaryItem DisplayFormat="Total de Lojas: {0:n0}" FieldName="CodigoRegional" SummaryType="Count" />
                                                    </GroupSummary>
                                                    <TotalSummary>
                                                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOri" 
                                                            ShowInGroupFooterColumn="Original" SummaryType="Sum" />
                                                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRev" 
                                                            ShowInGroupFooterColumn="Revista" SummaryType="Sum" />
                                                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRea" 
                                                            ShowInGroupFooterColumn="Realizado" SummaryType="Sum" />
                                                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="DifRevOri" 
                                                            ShowInGroupFooterColumn="Dif. " SummaryType="Sum" />
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
                                                    <SettingsText GroupPanel="Arraste aqui um cabeçalho de uma coluna abaixo para agrupar." 
                                                        PopupEditFormCaption="Atualizando informações..." 
                                                        Title="Meta de Vendas 2011 - por Regional, Região e Super-Hiper" />
                                                    <Columns>
                                                        <dxwgv:GridViewDataTextColumn Caption="Filial" FieldName="Mes" 
                                                            ToolTip="Filiais" VisibleIndex="0">
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <CellStyle HorizontalAlign="Center">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Descrição" FieldName="descMes" 
                                                            ToolTip="Descrição do mês" VisibleIndex="1" Width="150px">
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <CellStyle Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Original" FieldName="vlrOri" 
                                                            ReadOnly="True" ToolTip="Meta de Venda Original da Empresa" VisibleIndex="2">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <FooterCellStyle Font-Bold="False">
                                                            </FooterCellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Revista" FieldName="vlrRev" 
                                                            ReadOnly="True" ToolTip="Meta de Venda Revisada da Empresa" VisibleIndex="3">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <CellStyle ForeColor="#009900">
                                                            </CellStyle>
                                                            <FooterCellStyle Font-Bold="False" ForeColor="#009900">
                                                            </FooterCellStyle>
                                                            <GroupFooterCellStyle ForeColor="#009900">
                                                            </GroupFooterCellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Dif. " FieldName="DifRevOri" 
                                                            ToolTip="Diferença entre Revista e Original." VisibleIndex="4">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Realizado" FieldName="vlrRea" 
                                                            ReadOnly="True" ToolTip="Venda Realizada da Empresa" VisibleIndex="5">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <CellStyle ForeColor="Blue">
                                                            </CellStyle>
                                                            <FooterCellStyle Font-Bold="False" ForeColor="Blue">
                                                            </FooterCellStyle>
                                                            <GroupFooterCellStyle ForeColor="Blue">
                                                            </GroupFooterCellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="Ano" Visible="False" VisibleIndex="5">
                                                            <FooterCellStyle Font-Bold="True">
                                                            </FooterCellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="% Ori." FieldName="percDifReaOri" 
                                                            ToolTip="% de atingimento. Realizado sobre Original" VisibleIndex="6">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="% Rev." FieldName="percDifReaRev" 
                                                            ToolTip="% de atingimento. Realizado sobre Revista" VisibleIndex="7">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Regional" FieldName="Regional" 
                                                            ToolTip="Vendas por Regional" VisibleIndex="8" GroupIndex="0" 
                                                            SortIndex="0" SortOrder="Ascending">
                                                            <CellStyle Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Região" FieldName="Regiao" ToolTip="Vendas por Região" 
                                                            VisibleIndex="9">
                                                            <CellStyle Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Tipo" FieldName="SuperHiper" 
                                                            ToolTip="(S) Supermercado ou (H) Hipermercado" VisibleIndex="10">
                                                            <CellStyle Wrap="False">
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                    </Columns>
                                                    <Settings ShowFooter="True" ShowGroupFooter="VisibleAlways" 
                                                        ShowGroupPanel="True" ShowTitlePanel="True" />
                                                    <StylesEditors>
                                                        <ProgressBar Height="25px">
                                                        </ProgressBar>
                                                    </StylesEditors>
                                                    <SettingsDetail ShowDetailRow="True" />
                                                </dxwgv:ASPxGridView>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:SqlDataSource ID="dsMaster" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" 
                                        
                                        SelectCommand="usp_BuscarMetaVendaRegional" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="Ano" SessionField="sANO" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                    <asp:SqlDataSource ID="dsDetail" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" 
                                        SelectCommand="SELECT a.Mes AS idFilial, b.descMes AS Descricao, a.vlrOri, a.vlrRev, a.vlrRev - a.vlrOri AS vlrDifRevOri, a.vlrReal AS 'vlrRea',  CASE WHEN ISNULL(a.vlrOri , 0) = 0 THEN 0 WHEN a.vlrReal = 0 THEN 0 ELSE CAST(a.vlrReal AS FLOAT) / CAST(a.vlrOri AS FLOAT) * 100 - 100 END AS 'percReaOri', CASE WHEN a.vlrReal = 0 THEN 0 WHEN a.vlrRev = 0 THEN 0 ELSE CAST(a.vlrReal AS FLOAT) / CAST(a.vlrRev AS FLOAT) * 100 - 100 END AS 'percReaRev', a.Ano, a.idFilial AS FilialFiltro    
                                                       FROM Resultados.tbl_Teorico_Mes_Lojas_Grupo AS a INNER JOIN gerCadastros.dbo.tblCadMes AS b
                                                       ON a.Mes = b.mes WHERE (a.Ano = @Ano) AND a.Mes BETWEEN 1 AND 12 AND (a.idFilial = @FILIAL) AND (a.idGrupo = 1) 
                                                        ORDER BY a.Mes">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="Ano" SessionField="sANO" />
                                            <asp:SessionParameter Name="FILIAL" SessionField="FILIAL" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                </table>
                <uc1:DescricaoAtualizaro ID="labelSource" runat="server" />
                <br />
            </td>
        </tr>
    </table>
</asp:Content>

