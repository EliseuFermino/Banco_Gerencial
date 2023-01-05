<%@ Page Title="Projeção de Vendas" Language="VB" MasterPageFile="~/MemberPages/SiteVendas.master" AutoEventWireup="false" CodeFile="ProjecaoVendasAno.aspx.vb" Inherits="MemberPages_Gerencial_ProjecaoVendasAno" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>



<%@ Register src="../../Controles/wucAnoMes.ascx" tagname="wucAnoMes" tagprefix="uc1" %>

<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <table cellspacing="1" class="style1">
        <tr>
            <td>
                <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" 
                    AutoGenerateColumns="False"                     
                    KeyFieldName="idFilial" Width="1100px" 
                    Theme="SoftOrange" EnableTheming="True" DataSourceID="SqlDataSource1">

                    <Toolbars>
                <dxwgv:GridViewToolbar EnableAdaptivity="true">
                    <Items>
                        <dxwgv:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                        <dxwgv:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                        <dxwgv:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                    </Items>
                </dxwgv:GridViewToolbar>
            </Toolbars>

                    <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                    <Styles >
                        <Header ImageSpacing="10px" SortingImageSpacing="10px" HorizontalAlign="Center" 
                            Font-Size="Small">
                        </Header>
                        <FocusedRow BackColor="#CCFFCC" ForeColor="#0066FF"> </FocusedRow>
                        <Row Font-Size="Small">
                        </Row>
                        <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>

                        <Footer Font-Bold="True" Font-Size="Small">
                        </Footer>

                        <TitlePanel Font-Size="Large">
                        </TitlePanel>

                    </Styles>
                    <SettingsPager Mode="ShowAllRecords" ShowDefaultImages="False">
                        <AllButton Text="All">
                        </AllButton>
                        <NextPageButton Text="Next &gt;">
                        </NextPageButton>
                        <PrevPageButton Text="&lt; Prev">
                        </PrevPageButton>
                    </SettingsPager>
                    <TotalSummary>
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAA" 
                            SummaryType="Custom" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta" 
                            SummaryType="Custom" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReal" 
                            SummaryType="Custom" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingRM" 
                            SummaryType="Custom" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingAA" 
                            SummaryType="Custom" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescRM" 
                            SummaryType="Custom" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescAA" 
                            SummaryType="Custom" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrProjecaoAA" SummaryType="Custom" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOri" SummaryType="Custom" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difMeta" SummaryType="Custom" />
                    </TotalSummary>
                  
                    <SettingsText Title="Projeção de Vendas - Agosto/2012" />
                    <Columns>
                        <dxwgv:GridViewBandColumn Caption="Projeção s/ Atingimento Atual" 
                            VisibleIndex="10">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Projeção" FieldName="vlrProjecaoAA" 
                                    ToolTip="Projeção de vendas otimista. Meta de venda mais o percentual de atingimento das vendas sobre a meta até o dia de ontem." 
                                    VisibleIndex="0" Width="110px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle BackColor="#FF9900" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="% Ating" FieldName="percAtingAA" 
                                    ToolTip="Percentual de atingimento das vendas sobre a meta até o dia de ontem (% de atingimento que esta no Ranking de Vendas)" 
                                    VisibleIndex="1" Width="60px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle BackColor="#FF9900" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescAA" 
                                    ToolTip="&quot;Proj Otimista&quot; em relação a &quot;Real AA&quot;" 
                                    VisibleIndex="2" Width="70px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle BackColor="#FF9900" />
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <HeaderStyle BackColor="#FFE7C1" ForeColor="#666666" HorizontalAlign="Center" 
                                Font-Bold="True" />
                        </dxwgv:GridViewBandColumn>
                        <dxwgv:GridViewBandColumn Caption="Realizado + Meta" VisibleIndex="3">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Projeção" FieldName="vlrReal" 
                                    ToolTip="Projeção de vendas realista. Venda realizada até o dia de ontem mais a meta de venda dos dias que faltam para fechar o ano." 
                                    VisibleIndex="0" Width="110px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle BackColor="#009933" ForeColor="White" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="% Ating." FieldName="percAtingRM" 
                                    ToolTip="&quot;Proj Realista&quot; sobre &quot;Meta&quot;" VisibleIndex="1" 
                                    Width="60px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle BackColor="#009933" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescRM" 
                                    ToolTip=" &quot;Proj Realista&quot; em relação a &quot;Real AA&quot;" 
                                    VisibleIndex="2" Width="70px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle BackColor="#009933" ForeColor="White" />
                                    <CellStyle>
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                    <FooterCellStyle>
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </FooterCellStyle>
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <HeaderStyle BackColor="#88FFAE" ForeColor="#666666" HorizontalAlign="Center" 
                                Font-Bold="True" />
                        </dxwgv:GridViewBandColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Filial" FieldName="idFilial" 
                            VisibleIndex="0" Width="50px" Visible="False" FixedStyle="Left">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Descrição" FieldName="descFilial" 
                            VisibleIndex="1" Width="160px" FixedStyle="Left">
                            <CellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                            </CellStyle>
                            <FooterCellStyle>
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                            </FooterCellStyle>
                        </dxwgv:GridViewDataTextColumn>
                         <dxwgv:GridViewDataTextColumn FieldName="vlrRealAA" VisibleIndex="1" 
                            Caption="Real AA" ToolTip="Venda realizado do ano anterior" Width="120px">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                             <HeaderStyle BackColor="#0066FF" ForeColor="White" />
                             <CellStyle ForeColor="Blue">
                                 <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                             </CellStyle>
                             <FooterCellStyle ForeColor="Blue">
                                 <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                             </FooterCellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewBandColumn Caption="Meta" VisibleIndex="2" Name="bandMeta">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Revista" FieldName="vlrMeta" ToolTip="Meta de venda revista" VisibleIndex="1" Width="110px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <CellStyle ForeColor="#009900">
                                        <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                    </CellStyle>
                                    <FooterCellStyle ForeColor="#009900">
                                        <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                    </FooterCellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Original" FieldName="vlrOri" VisibleIndex="0" Width="110px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <CellStyle ForeColor="#993300">
                                    </CellStyle>
                                    <FooterCellStyle ForeColor="#993300">
                                    </FooterCellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Diferença" FieldName="difMeta" VisibleIndex="2" Width="90px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <CellStyle>
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                    <FooterCellStyle>
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </FooterCellStyle>
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                        </dxwgv:GridViewBandColumn>
                    </Columns>
                    <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" FileName="Projeção de Vendas Ano"></SettingsExport>
                    <Settings ShowTitlePanel="True" ShowVerticalScrollBar="True" 
                        VerticalScrollableHeight="450" ShowFooter="True" HorizontalScrollBarMode="Auto" />
                    <StylesEditors>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                </dxwgv:ASPxGridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" 
                    SelectCommand="SELECT * FROM viewProjecaoDeVendasPorFilial_Ano">
                </asp:SqlDataSource>
               
                <br />
            </td>
        </tr>       
    </table> 
    
     <br />
    <uc1:wucObsPrograma runat="server" ID="lblObs" />
    
</asp:Content>


