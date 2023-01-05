<%@ Page Title="Projeção de Vendas dos Postos" Language="VB" MasterPageFile="~/MemberPages/SiteVendasPostos.master" AutoEventWireup="false" CodeFile="ProjecaoVendas.aspx.vb" Inherits="MemberPages_Gerencial_ProjecaoVendas" %>

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
                    KeyFieldName="idFilial" Width="980px" 
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


                    <SettingsBehavior AllowFocusedRow="True" />

                    


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
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="perCrescMeta" 
                            SummaryType="Custom" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" 
                            SummaryType="Custom" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="projAting" 
                            SummaryType="Custom" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAting" 
                            SummaryType="Custom" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="perCrescAting" 
                            SummaryType="Custom" />
                    </TotalSummary>
                  
                    <SettingsText Title="Projeção de Vendas - Agosto/2012" />
                    <Columns>
                        <dxwgv:GridViewBandColumn Caption="Projeção s/ Atingimento Atual" 
                            VisibleIndex="5">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Projeção" FieldName="projAting" 
                                    ShowInCustomizationForm="True" 
                                    ToolTip="Projeção de vendas otimista. Meta de venda mais o percentual de atingimento das vendas sobre a meta até o dia de ontem." 
                                    VisibleIndex="0">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle BackColor="#FF9900" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="% Ating" FieldName="percAting" 
                                    ShowInCustomizationForm="True" 
                                    ToolTip="Percentual de atingimento das vendas sobre a meta até o dia de ontem (% de atingimento que esta no Ranking de Vendas)" 
                                    VisibleIndex="1" Width="60px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle BackColor="#FF9900" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="% Cresc AA" FieldName="perCrescAting" 
                                    ShowInCustomizationForm="True" 
                                    ToolTip="&quot;Proj Otimista&quot; em relação a &quot;Real AA&quot;" 
                                    VisibleIndex="2">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle BackColor="#FF9900" />
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <HeaderStyle BackColor="#FFE7C1" ForeColor="#666666" HorizontalAlign="Center" 
                                Font-Bold="True" />
                        </dxwgv:GridViewBandColumn>
                        <dxwgv:GridViewBandColumn Caption="Realizado + Meta" VisibleIndex="4">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Projeção" FieldName="vlrReal" 
                                    ShowInCustomizationForm="True" 
                                    ToolTip="Projeção de vendas realista. Venda realizada até o dia de ontem mais a meta de venda dos dias que faltam para fechar o mês." 
                                    VisibleIndex="0">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle BackColor="#009933" ForeColor="White" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="% Ating." FieldName="perCrescMeta" 
                                    ShowInCustomizationForm="True" 
                                    ToolTip="&quot;Proj Realista&quot; sobre &quot;Meta&quot;" VisibleIndex="1" 
                                    Width="60px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle BackColor="#009933" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="% Cresc AA" FieldName="percCresc" 
                                    ShowInCustomizationForm="True" 
                                    ToolTip=" &quot;Proj Realista&quot; em relação a &quot;Real AA&quot;" 
                                    VisibleIndex="2">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle BackColor="#009933" ForeColor="White" />
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <HeaderStyle BackColor="#88FFAE" ForeColor="#666666" HorizontalAlign="Center" 
                                Font-Bold="True" />
                        </dxwgv:GridViewBandColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Filial" FieldName="idFilial" 
                            VisibleIndex="0" SortIndex="1" SortOrder="Ascending" Width="50px" Visible="False">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Descrição" FieldName="Descricao" 
                            VisibleIndex="1" Width="180px">
                        </dxwgv:GridViewDataTextColumn>
                         <dxwgv:GridViewDataTextColumn FieldName="vlrRealAA" VisibleIndex="2" 
                            Caption="Real AA" ToolTip="Venda realizado do ano anterior">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                             <CellStyle ForeColor="Blue">
                             </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta" 
                            VisibleIndex="3" ToolTip="Meta de venda revista">
                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <CellStyle ForeColor="#009900">
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="Tipo" 
                            VisibleIndex="11" SortIndex="0" SortOrder="Ascending" Visible ="false" >
                        </dxwgv:GridViewDataTextColumn>
                    </Columns>
                    <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" FileName="Projeção de Vendas Mês"></SettingsExport>
                    <Settings ShowTitlePanel="True" ShowVerticalScrollBar="True" 
                        VerticalScrollableHeight="450" ShowFooter="True" />
                    <StylesEditors>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                    
                </dxwgv:ASPxGridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" 
                    SelectCommand="usp_Buscar_Projecao_Vendas_Mes" SelectCommandType="StoredProcedure">
                </asp:SqlDataSource>
                
               
            </td>
        </tr>       
    </table>    

    <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="Servidor: 225 <br> Database: gerBI" Anotacao2="Stored Procedure: usp_Buscar_Projecao_Vendas_Mes" />

</asp:Content>


