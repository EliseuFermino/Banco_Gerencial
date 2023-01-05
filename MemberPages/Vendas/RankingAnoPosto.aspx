<%@ Page Title="Ranking Anual" Language="VB" MasterPageFile= "~/MemberPages/SiteVendas.master"  AutoEventWireup="false" CodeFile="RankingAnoPosto.aspx.vb" Inherits="MemberPages_RankingAnoPosto" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>







<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>
<%@ Register src="../../Controles/wucFixarCabecalho.ascx" tagname="wucFixarCabecalho" tagprefix="uc2" %>
<%@ Register Src="~/Controles/wuc_KPI_Secao_Depto.ascx" TagPrefix="uc1" TagName="wuc_KPI_Secao_Depto" %>

<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc4" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>


<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type="text/css">

        #divAno {
            float: left;
            margin-left: 2px
        }

        #divFixarCabecalho {
            float: left;
            margin-left: 12px
        }

        #divAnoAnterior {
            float: left;
            margin-left: 12px
        }

        #divMetaMes {
            float: left;
            margin-left: 12px
        }

        #divBotaoAtualizar {
            float: left;
            margin-left: 12px
        }

        #divDados {
            clear:both ;
            float: left;
        }

        #divKPI {
            clear: both;
            float: left;
            margin-bottom: 5px;
        }

    </style>

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">



    <div id="divAno">
        <uc1:wucAno ID="cboAno" runat="server" />
    </div>

    <div id="divFixarCabecalho">
        <uc2:wucFixarCabecalho ID="chkFixarCabecalho" runat="server" />
    </div>

    <div id="divAnoAnterior">
        <dxe:ASPxCheckBox ID="chkAnoAnterior" runat="server" AutoPostBack="True" Text="Exibir 2009" Theme="DevEx">
        </dxe:ASPxCheckBox>
    </div>  

    <div id="divBotaoAtualizar">
        <dxe:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dxe:ASPxButton>
    </div>




    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis"  Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
<Images>
<LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
</Images>

<LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
            <PanelCollection>
                <dx:PanelContent>
                  
            <table>

            <tr>
                <td>
                    <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" 
                        AutoGenerateColumns="False" 
                        CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                        CssPostfix="Office2003_Blue" DataSourceID="dsSuper" KeyFieldName="idFilial" 
                        Theme="SoftOrange">
                        <SettingsBehavior AllowFocusedRow="True" />
                        <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                            CssPostfix="Office2003_Blue">
                            <Header ImageSpacing="5px" SortingImageSpacing="5px"></Header>                            
                            <Footer Font-Bold="True">
                            </Footer>
                            <LoadingPanel ImageSpacing="10px"></LoadingPanel>
                            <FocusedRow BackColor="#66ffff" ForeColor="#0066FF" Font-Bold="true"> </FocusedRow>
                            <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                        </Styles>
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <SettingsText EmptyDataRow="Não informações atualizadas financeiras para este período." />
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

                        <Toolbars>
                            <dx:GridViewToolbar EnableAdaptivity="true">
                                <Items>
                                    <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                                    <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                                    <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                                </Items>
                            </dx:GridViewToolbar>
                        </Toolbars>

                        <TotalSummary>
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta" 
                                SummaryType="Sum" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRea" 
                                SummaryType="Sum" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMA" 
                                SummaryType="Sum" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA1" 
                                SummaryType="Sum" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA2" 
                                SummaryType="Sum" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA3" 
                                SummaryType="Sum" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealMeta" 
                                SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMA" 
                                SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealAA1" 
                                SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealAA3" 
                                SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealAA2" 
                                SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaAnual" 
                                SummaryType="Sum" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_MetaAnual" 
                                SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargMeta" 
                                SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargReal" 
                                SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemDif" 
                                SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_vlrRea" SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargCheia" SummaryType="Custom" />
                         
                        </TotalSummary>
                        <Columns>
                            <dxwgv:GridViewBandColumn Caption="Meta Mês" ToolTip="Meta mensal e quanto que falta para atingir a meta do mês." 
                                VisibleIndex="5" Name="bandMetaMes" Visible="True">
                                <Columns>
                                    <dxwgv:GridViewDataTextColumn Caption="Previsao" FieldName="vlrMetaAnual" 
                                        VisibleIndex="0" Width="120px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <CellStyle ForeColor="#009900">
                                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="#009900">
                                        </FooterCellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="% Final" FieldName="percCresc_MetaAnual" 
                                        VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle HorizontalAlign="Center" />
                            </dxwgv:GridViewBandColumn>
                            <dxwgv:GridViewBandColumn Caption="Atingimento e Crescimento" VisibleIndex="4">
                                <Columns>
                                    <dxwgv:GridViewDataTextColumn Caption="% Prev" FieldName="percCresc_RealMeta" 
                                        ToolTip="% de crescimento. Meta sobre o  Realizado" VisibleIndex="0" 
                                        Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <EditCellStyle>
                                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </EditCellStyle>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <CellStyle ForeColor="Blue">
                                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="Blue">
                                        </FooterCellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="2011" FieldName="percCresc_RealAA1" 
                                        VisibleIndex="2" Width="60px" Name="bandCrescAA1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="2010" FieldName="percCresc_RealAA2" 
                                        VisibleIndex="3" Width="60px" Name="bandCrescAA2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="2009" FieldName="percCresc_RealAA3" 
                                        VisibleIndex="4" Width="60px" 
                                        Visible="False" Name="bandCrescAA3">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                            </dxwgv:GridViewBandColumn>
                            <dxwgv:GridViewBandColumn Caption="Anos Anteriores" VisibleIndex="3">
                                <Columns>
                                    <dxwgv:GridViewDataTextColumn Caption="2011" FieldName="vlrAA1" 
                                        VisibleIndex="0" Width="110px" Name="bandAA1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="2010" FieldName="vlrAA2" 
                                        VisibleIndex="1" Width="110px" Name="bandAA2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="2009" FieldName="vlrAA3" 
                                        VisibleIndex="2" Width="110px" 
                                        Visible="False" Name="bandAA3">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle HorizontalAlign="Center" />
                            </dxwgv:GridViewBandColumn>
                            <dxwgv:GridViewBandColumn Caption="Ano 2012" VisibleIndex="2" Name="bandAtual">
                                <Columns>
                                    <dxwgv:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta" 
                                        VisibleIndex="0" Width="110px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <CellStyle ForeColor="#009900">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="#009900">
                                        </FooterCellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Realizado" FieldName="vlrRea" 
                                        VisibleIndex="1" Width="110px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="Blue">
                                        </FooterCellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="% Part" FieldName="percPart_vlrRea" 
                                        ToolTip="% de participação da venda da filial sobre o total da venda da empresa." 
                                        VisibleIndex="2" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </dxwgv:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle HorizontalAlign="Center" />
                            </dxwgv:GridViewBandColumn>
                            <dxwgv:GridViewDataTextColumn Caption="#" FieldName="idFilial" VisibleIndex="0" 
                                Width="30px" Visible="False">
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Filial" FieldName="FilialLista" 
                                VisibleIndex="1" Width="150px">
                                <HeaderStyle HorizontalAlign="Center" />
                                <CellStyle Wrap="False">
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewBandColumn Caption="Margem" VisibleIndex="14">
                                <Columns>
                                    <dxwgv:GridViewDataTextColumn Caption="Meta" FieldName="percMargMeta" 
                                        VisibleIndex="0" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <CellStyle ForeColor="#009900">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="#009900">
                                        </FooterCellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Real" FieldName="percMargReal" 
                                        VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="Blue">
                                        </FooterCellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Dif." FieldName="percMargemDif" 
                                        VisibleIndex="2" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </dxwgv:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Real c/ SellOut" FieldName="percMargCheia" ShowInCustomizationForm="True" VisibleIndex="3" Width="100px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="#003399" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle HorizontalAlign="Center" />
                            </dxwgv:GridViewBandColumn>
                        </Columns>
                        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                        <Settings ShowTitlePanel="True" ShowVerticalScrollBar="True" 
                            VerticalScrollableHeight="400" ShowFooter="True" />
                        <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                    </dxwgv:ASPxGridView>

                        <asp:SqlDataSource ID="dsSuper" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerVendasConnectionString %>" 
                        
                        
                        SelectCommand="Ano.uspBuscarRankingAnoPosto" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />                            
                        </SelectParameters>

                    </asp:SqlDataSource> 
                        
   
                </td>
            </tr>

             
                               
        </table>

                               


                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>
    


</asp:Content>

