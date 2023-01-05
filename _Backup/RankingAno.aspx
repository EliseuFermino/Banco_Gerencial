<%@ Page Title="Ranking Anual" Language="VB" MasterPageFile= "~/MemberPages/SiteVendas.master"  AutoEventWireup="false" CodeFile="RankingAno.aspx.vb" Inherits="MemberPages_RankingAno" %>

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

    <div id="divKPI">
        <uc1:wuc_KPI_Secao_Depto runat="server" ID="KPI" />
    </div>

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

    <div id="divMetaMes">
        <dxe:ASPxCheckBox ID="chkMetaMes" runat="server" AutoPostBack="True" Text="Exibir Meta Ano" Theme="DevEx">
        </dxe:ASPxCheckBox>
    </div>    

    <div id="divBotaoAtualizar">
        <dxe:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dxe:ASPxButton>
    </div>




    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis"  Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
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
                                SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRea" 
                                SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMA" 
                                SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA1" 
                                SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA2" 
                                SummaryType="Custom" />
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA3" 
                                SummaryType="Custom" />
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
                                SummaryType="Custom" />
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
                                VisibleIndex="5" Name="bandMetaMes" Visible="False">
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
                            VerticalScrollableHeight="400" ShowFooter="False" />
                        <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                    </dxwgv:ASPxGridView>

                        <asp:SqlDataSource ID="dsSuper" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerVendasConnectionString %>" 
                        
                        
                        SelectCommand="Ano.uspBuscarRankingAno" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />                            
                        </SelectParameters>

                    </asp:SqlDataSource> 
                        
   
                </td>
            </tr>

                <tr>
                    <td>
                        <div id="div2" runat="server" style="color:gray; font-size :26px; text-align:center; padding-top: 20px">Venda Por Seção Acumulado</div>
                    </td>
                </tr>

                <tr>
                    <td>
                    
                        <div>
            <dxwgv:ASPxGridView ID="gridSecao" runat="server" DataSourceID="dsSecao" AutoGenerateColumns="False" 
                            EnableTheming="True" Theme="SoftOrange" KeyFieldName="idSecao" Width="1010px">

                <TotalSummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde_AA" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda_AA" SummaryType="Custom" />      
                                      
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde_AT" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda_AT" SummaryType="Custom" />                                         
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem_AA" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem_AT" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_AA" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_AT" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Venda" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Qtde" SummaryType="Custom" />                  
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem_meta" SummaryType="Custom" />                                                                          
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroFinal_AT" SummaryType="Custom" />                                         
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinal_AT" SummaryType="Custom" />                             
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinal_AA" SummaryType="Custom" />                                    
                                            
                            </TotalSummary>

                    <Columns>                  

                                <dx:GridViewBandColumn Caption="Volume" Name="bandVolume" 
                                    ToolTip="Exibe informações de Volume" VisibleIndex="2" 
                                    Visible="True">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="2015" FieldName="Qtde_AA" 
                                            ToolTip="Volume do Ano Anterior (mesmo período)" VisibleIndex="0" 
                                            Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="#663300">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#5B2E00">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="2016" FieldName="Qtde_AT" 
                                            ToolTip="Volume vendida do período selecionado" 
                                            VisibleIndex="1" Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc_Qtde" ToolTip="Percentual de crescimento de Quantidade entre periodo atual e periodo do ano anterior" 
                                            VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewBandColumn>

                                <dx:GridViewBandColumn Caption="Venda" Name="bandVenda" 
                                    ToolTip="Exibe informações de Volume" VisibleIndex="3" 
                                    Visible="True">
                                    <Columns>

                                        <dx:GridViewDataTextColumn Caption="2015" FieldName="vlrVenda_AA" 
                                            ToolTip="Valor da venda do ano anterior (mesmo período)" VisibleIndex="0" 
                                            Width="110px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="#5B2E00">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#5B2E00">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="2016" FieldName="vlrVenda_AT" 
                                            ToolTip="Valor de venda do período selecionado" 
                                            VisibleIndex="1" Width="110px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <HeaderStyle  HorizontalAlign="Center" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc_Venda" 
                                            ToolTip="Percentual de crescimento de Venda entre periodo atual e periodo do ano anterior" VisibleIndex="3" 
                                            Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewBandColumn>

                                <dx:GridViewBandColumn Caption="% Margem Final" Name="bandMargem" 
                                    ToolTip="Exibe informações de Volume" VisibleIndex="4" 
                                    Visible="True">
                                    <Columns>
                                                    
                                        <dx:GridViewDataTextColumn Caption="2015" FieldName="percMargemFinal_AA" ShowInCustomizationForm="True" VisibleIndex="0" Width="65px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle  />
                                            <CellStyle ForeColor="#996600">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#996600">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="2016" FieldName="percMargemFinal_AT" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Final" VisibleIndex="1" Width="65px" >
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle  />
                                            <CellStyle ForeColor="#0984FF">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#0984FF">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewBandColumn>

                                <dx:GridViewBandColumn Caption="Participação Total" Name="bandParticipacaoTotal" 
                                    ToolTip="Exibe informações de Volume" VisibleIndex="5" 
                                    Visible="True">
                                    <Columns>

                                        <dx:GridViewDataTextColumn Caption="2015" FieldName="percPart_AA" ShowInCustomizationForm="True" ToolTip="Percentual de participação da venda da seção sobre a venda total" VisibleIndex="0" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="#5B2E00">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#5B2E00">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="2016" FieldName="percPart_AT" ShowInCustomizationForm="True" ToolTip="Percentual de participação da venda da seção sobre a venda total" VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewBandColumn>
                                                    
                                <dx:GridViewBandColumn Caption="Participação Depto" Name="bandParticipacaoDepto" 
                                    ToolTip="Exibe informações de Volume" VisibleIndex="6" 
                                    Visible="True">
                                    <Columns>

                                        <dx:GridViewDataTextColumn Caption="2015" FieldName="percPartDepto_AA" ShowInCustomizationForm="True" ToolTip="Percentual de participação da venda da seção sobre a venda do Departamento" VisibleIndex="0" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle  />
                                            <CellStyle ForeColor="#5B2E00">
                                                            
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#5B2E00">
                                                            
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>

                                        <dx:GridViewDataTextColumn Caption="2016" FieldName="percPartDepto_AT" ShowInCustomizationForm="True" ToolTip="Percentual de participação da venda da seção sobre a venda do Departamento" VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle  HorizontalAlign="Center" />
                                            <CellStyle ForeColor="Blue">                                                           
                                            </CellStyle>
                                            <FooterCellStyle>                                                            
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>

                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewBandColumn>
                                            
                                            
                                <dx:GridViewDataTextColumn FieldName="descId" VisibleIndex="1" 
                                    Caption="Seção / Departamento" Width="200px" FixedStyle="Left">
                                    <Settings AutoFilterCondition="Contains" />
                                    <CellStyle Wrap="False">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                    <FooterCellStyle>
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </FooterCellStyle>
                                </dx:GridViewDataTextColumn>




                                <dx:GridViewDataTextColumn Caption="Código" FieldName="idSecao" FixedStyle="Left" ShowInCustomizationForm="True" ToolTip="Código do produto" VisibleIndex="0" Width="70px" Visible="False">
                                </dx:GridViewDataTextColumn>

                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                            <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                            <Styles>
	                            <FocusedRow BackColor="#FFFF99" ForeColor="#3366FF" Font-Bold="True"> </FocusedRow>
	                                <Header HorizontalAlign="Center" Font-Size="Small">
                                </Header>
	                                <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                <Cell Font-Size="Small">
                                </Cell>
                                <Footer Font-Bold="True">
                                </Footer>
                            </Styles>                                        
                            <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="400" 
                                ShowFooter="True" ShowHorizontalScrollBar="True" />
                            <SettingsText EmptyDataRow="Não há informações disponiveis ainda para esse período e seção" 
                                />


            </dxwgv:ASPxGridView>
        </div>
                        <asp:SqlDataSource ID="dsSecao" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Vendas_Dia.SLV004" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="DiaInicial_AT" SessionField="sDATA_INICIAL" DbType="Date" />
                                <asp:SessionParameter DbType="Date" Name="DiaFinal_AT" SessionField="sDATA_FINAL" />
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                <asp:SessionParameter Name="MesmosDias" SessionField="sMESMOSDIAS" Type="Byte" />
                                <asp:SessionParameter Name="idTipoLista" SessionField="sTIPOLISTA" Type="Byte" DefaultValue="0" />
                                <asp:SessionParameter Name="Matricula" SessionField="sMATRICULA" Type="String" DefaultValue="0" />
                                <asp:SessionParameter Name="MesAnterior" SessionField="sMES_ANTERIOR" Type="Byte" DefaultValue="1" />
                                <asp:SessionParameter Name="Unidade" SessionField="sUNIDADE" Type="Byte" DefaultValue="3" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </td>
                </tr>

<%-- -----------------------------------------------------------------------------------------------------%>

                <tr>
                    <td>
                        <div id="divTitulo_ItensMaisVendidos" runat="server" style="color:gray; font-size :26px; text-align:center; padding-top: 20px">Top 20 - Itens Mais Vendidos na Empresa</div>
                    </td>
                </tr>
                <tr>
                    <td>
<%--                        <dx:ASPxGridView ID="gridItensMaisVendidos" runat="server" DataSourceID="dsItensMaisVendidos" AutoGenerateColumns="False" Width="1000px" KeyFieldName="CodProduto">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Código" FieldName="CodProduto" ShowInCustomizationForm="True" ToolTip="Código do produto" VisibleIndex="1" Width="70px">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Vendas" ShowInCustomizationForm="True" VisibleIndex="3">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendas" ShowInCustomizationForm="True" ToolTip="Volume ou quantidade dos itens vendidos" VisibleIndex="0" Width="85px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="Venda" ShowInCustomizationForm="True" ToolTip="Valor da venda de cada item" VisibleIndex="1" Width="85px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#CCCCCC" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Margem Praticada" ShowInCustomizationForm="True" VisibleIndex="4">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="LucroComercial" ShowInCustomizationForm="True" ToolTip="Valor do Lucro Praticado" VisibleIndex="0" Width="85px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percMargem" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Praticada" VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="Nº Cliente" FieldName="numCliente" ShowInCustomizationForm="True" ToolTip="Número de clientes que compraram o item." VisibleIndex="12" Width="80px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Sell Out" ShowInCustomizationForm="True" VisibleIndex="6">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="LucroSellOut" ShowInCustomizationForm="True" ToolTip="Valor do Sell Out" VisibleIndex="0" Width="85px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemSellOut" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual do Sell Out" VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="Descrição do produto" FieldName="nomeProduto" ShowInCustomizationForm="True" ToolTip="Nome do produto" VisibleIndex="2" Width="220px">
                                    <CellStyle Wrap="False">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Margem Final" ShowInCustomizationForm="True" VisibleIndex="10">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrLucroFinal" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Valor do Lucro Final (Lucro Praticado + Lucro Sell Out)" VisibleIndex="0" Width="85px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemFinal" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Final " VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="Nº" FieldName="rnk" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Posição no Top 20" VisibleIndex="0" Width="30px">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <AlternatingRow BackColor="#F2F2F2">
                                </AlternatingRow>
                                <FocusedRow BackColor="#FFFF99" ForeColor="#3366FF">
                                </FocusedRow>
                            </Styles>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="dsItensMaisVendidos" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemAnoConnectionString %>" SelectCommand="dbo.uspBuscar_Venda_ItemMaisVendido_Top10_Empresa_Ano" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />                                
                            </SelectParameters>
                        </asp:SqlDataSource>--%>
                    </td>
                </tr>

                <tr>
                    <td>
                        <div id="divTitulo_ItensMenosVendidos" runat="server" style="color:gray; font-size :26px; text-align:center; padding-top: 20px">Top 20 - Volume Mais Vendido na Empresa</div>
                    </td>
                </tr>

                <tr>
                    <td>
<%--                        <dx:ASPxGridView ID="gridItensMenosVendidos" runat="server" DataSourceID="dsItensMenosVendidos" AutoGenerateColumns="False" Width="1000px" KeyFieldName="CodProduto">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Código" FieldName="CodProduto" ShowInCustomizationForm="True" ToolTip="Código do produto" VisibleIndex="1" Width="70px">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Vendas" ShowInCustomizationForm="True" VisibleIndex="3">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendas" ShowInCustomizationForm="True" ToolTip="Volume ou quantidade dos itens vendidos" VisibleIndex="0" Width="85px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#CCCCCC" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="Venda" ShowInCustomizationForm="True" ToolTip="Valor da venda de cada item" VisibleIndex="1" Width="85px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Margem Praticada" ShowInCustomizationForm="True" VisibleIndex="4">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="LucroComercial" ShowInCustomizationForm="True" ToolTip="Valor do Lucro Praticado" VisibleIndex="0" Width="85px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percMargem" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Praticada" VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="Nº Cliente" FieldName="numCliente" ShowInCustomizationForm="True" ToolTip="Número de clientes que compraram o item." VisibleIndex="12" Width="80px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Sell Out" ShowInCustomizationForm="True" VisibleIndex="6">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="LucroSellOut" ShowInCustomizationForm="True" ToolTip="Valor do Sell Out" VisibleIndex="0" Width="85px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemSellOut" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual do Sell Out" VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="Descrição do produto" FieldName="nomeProduto" ShowInCustomizationForm="True" ToolTip="Nome do produto" VisibleIndex="2" Width="220px">
                                    <CellStyle Wrap="False">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Margem Final" ShowInCustomizationForm="True" VisibleIndex="10">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrLucroFinal" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Valor do Lucro Final (Lucro Praticado + Lucro Sell Out)" VisibleIndex="0" Width="85px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemFinal" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Final " VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="Nº" FieldName="rnk" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Posição no Top 20" VisibleIndex="0" Width="30px">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <AlternatingRow BackColor="#F2F2F2">
                                </AlternatingRow>
                                <FocusedRow BackColor="#FFFF99" ForeColor="#3366FF">
                                </FocusedRow>
                            </Styles>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="dsItensMenosVendidos" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemAnoConnectionString %>" SelectCommand="uspBuscar_Venda_ItemMenosVendido_Top10_Empresa_Ano" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />                                
                            </SelectParameters>
                        </asp:SqlDataSource>--%>
                    </td>
                </tr>

                <tr>
                    <td>
                        <div id="div1" runat="server" style="color:gray; font-size :26px; text-align:center; padding-top: 20px">Top 20 - Lucro dos Itens Mais Vendidos na Empresa</div>
                    </td>
                </tr>
                <tr>
                    <td>
<%--                        <dx:ASPxGridView ID="gridItensMaisVendidosLucro" runat="server" DataSourceID="dsItensMaisVendidosLucro" AutoGenerateColumns="False" Width="1000px" KeyFieldName="CodProduto">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Código" FieldName="CodProduto" ShowInCustomizationForm="True" ToolTip="Código do produto" VisibleIndex="1" Width="70px">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Vendas" ShowInCustomizationForm="True" VisibleIndex="3">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendas" ShowInCustomizationForm="True" ToolTip="Volume ou quantidade dos itens vendidos" VisibleIndex="0" Width="85px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="Venda" ShowInCustomizationForm="True" ToolTip="Valor da venda de cada item" VisibleIndex="1" Width="85px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Margem Praticada" ShowInCustomizationForm="True" VisibleIndex="4">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="LucroComercial" ShowInCustomizationForm="True" ToolTip="Valor do Lucro Praticado" VisibleIndex="0" Width="85px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percMargem" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Praticada" VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="Nº Cliente" FieldName="numCliente" ShowInCustomizationForm="True" ToolTip="Número de clientes que compraram o item." VisibleIndex="12" Width="80px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Sell Out" ShowInCustomizationForm="True" VisibleIndex="6">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="LucroSellOut" ShowInCustomizationForm="True" ToolTip="Valor do Sell Out" VisibleIndex="0" Width="85px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemSellOut" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual do Sell Out" VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="Descrição do produto" FieldName="nomeProduto" ShowInCustomizationForm="True" ToolTip="Nome do produto" VisibleIndex="2" Width="220px">
                                    <CellStyle Wrap="False">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Margem Final" ShowInCustomizationForm="True" VisibleIndex="10">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrLucroFinal" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Valor do Lucro Final (Lucro Praticado + Lucro Sell Out)" VisibleIndex="0" Width="85px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#CCCCCC" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemFinal" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Final " VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="Nº" FieldName="rnk" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Posição no Top 20" VisibleIndex="0" Width="30px">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <AlternatingRow BackColor="#F2F2F2">
                                </AlternatingRow>
                                <FocusedRow BackColor="#FFFF99" ForeColor="#3366FF">
                                </FocusedRow>
                            </Styles>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="dsItensMaisVendidosLucro" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemAnoConnectionString %>" SelectCommand="dbo.uspBuscar_Lucro_ItemMaisVendido_Top10_Empresa_Ano" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />                              
                            </SelectParameters>
                        </asp:SqlDataSource>--%>
                    </td>
                </tr>

<%-----------------------------------------------------------------------------------------------------------------------------------------%>
                <tr>
                    <td>
                        <div id="divTitulo_GraficoCidade" runat="server" style="color:gray; font-size :26px; text-align:center; padding-top: 20px">Gráfico por Cidade - Venda e Participação</div>
                    </td>
                </tr>

                <tr>
                    <td>
<%--                        <dxchartsui:webchartcontrol ID="grafParticipacaoCidade" runat="server" DataSourceID="dsGraficoParticipacaoCidade" Height="235px" Width="1000px" BackColor="Transparent">
                            <borderoptions Color="192, 192, 192" />
                            <diagramserializable>
                                <cc1:xydiagram>
                                    <axisx visibleinpanesserializable="-1">
                                        <range sidemarginsenabled="True" />
                                    </axisx>
                                    <axisy visible="False" visibleinpanesserializable="-1">
                                        <range sidemarginsenabled="True" />
                                        <gridlines visible="False">
                                        </gridlines>
                                    </axisy>
                                    <defaultpane backcolor="Transparent" bordervisible="False">
                                    </defaultpane>
                                </cc1:XYDiagram>
                            </diagramserializable>
                            <fillstyle>
                                <optionsserializable>
                                    <cc1:solidfilloptions />
                                </optionsserializable>
                            </fillstyle>
           
                            <seriesserializable>
                                <cc1:series ArgumentDataMember="Cidade" ArgumentScaleType="Qualitative" LabelsVisibility="True" Name="Series 1" SeriesPointsSorting="Descending" SeriesPointsSortingKey="Value_1" SynchronizePointOptions="False" ValueDataMembersSerializable="vlrVendaCidade">
                                    <viewserializable>
                                        <cc1:sidebysidebarseriesview ColorEach="True">
                                        </cc1:SideBySideBarSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:sidebysidebarserieslabel LineVisible="True">
                                            <fillstyle>
                                                <optionsserializable>
                                                    <cc1:solidfilloptions />
                                                </optionsserializable>
                                            </fillstyle>
                                            <pointoptionsserializable>
                                                <cc1:pointoptions>
                                                    <valuenumericoptions format="Currency" precision="0" />
                                                </cc1:PointOptions>
                                            </pointoptionsserializable>
                                        </cc1:SideBySideBarSeriesLabel>
                                    </labelserializable>
                                    <legendpointoptionsserializable>
                                        <cc1:pointoptions PointView="Argument">
                                            <valuenumericoptions format="Percent" />
                                        </cc1:PointOptions>
                                    </legendpointoptionsserializable>
                                </cc1:Series>
                            </seriesserializable>
                            <seriestemplate>
                                <viewserializable>
                                    <cc1:sidebysidebarseriesview>
                                    </cc1:SideBySideBarSeriesView>
                                </viewserializable>
                                <labelserializable>
                                    <cc1:sidebysidebarserieslabel LineVisible="True">
                                        <fillstyle>
                                            <optionsserializable>
                                                <cc1:solidfilloptions />
                                            </optionsserializable>
                                        </fillstyle>
                                        <pointoptionsserializable>
                                            <cc1:pointoptions>
                                            </cc1:PointOptions>
                                        </pointoptionsserializable>
                                    </cc1:SideBySideBarSeriesLabel>
                                </labelserializable>
                                <legendpointoptionsserializable>
                                    <cc1:pointoptions>
                                    </cc1:PointOptions>
                                </legendpointoptionsserializable>
                            </seriestemplate>
                            <titles>
                                <cc1:charttitle Indent="0" Text="Vendas por Cidade" />
                            </titles>
                            <crosshairoptions>
                                <commonlabelpositionserializable>
                                    <cc1:crosshairmouseposition />
                                </commonlabelpositionserializable>
                            </crosshairoptions>
                            <tooltipoptions>
                                <tooltippositionserializable>
                                    <cc1:tooltipmouseposition />
                                </tooltippositionserializable>
                            </tooltipoptions>
                        </dxchartsui:WebChartControl>
                        <asp:SqlDataSource ID="dsGraficoParticipacaoCidade" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="Gerencial.uspBuscarGraficoParticipacao_Cidade_Ano" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />                               
                            </SelectParameters>
                        </asp:SqlDataSource>--%>
                    </td>
                </tr>

                <tr>
                    <td>                   
<%--                       <dxchartsui:WebChartControl ID="grafPaticipacaoCidade_Percentual" runat="server" DataSourceID="dsGraficoParticipacaoCidade" Height="235px" Width="1000px" BackColor="Transparent">
                        <borderoptions Color="192, 192, 192" />
                        <diagramserializable>
                            <cc1:XYDiagram>
                                <axisx visibleinpanesserializable="-1">
                                    <range sidemarginsenabled="True" />
                                </axisx>
                                <axisy visible="False" visibleinpanesserializable="-1">
                                    <range sidemarginsenabled="True" />
                                    <gridlines visible="False">
                                    </gridlines>
                                </axisy>
                                <defaultpane backcolor="Transparent" bordervisible="False">
                                </defaultpane>
                            </cc1:XYDiagram>
                        </diagramserializable>
                        <fillstyle>
                            <optionsserializable>
                                <cc1:SolidFillOptions />
                            </optionsserializable>
                        </fillstyle>
                   
                        <seriesserializable>
                            <cc1:Series ArgumentDataMember="Cidade" ArgumentScaleType="Qualitative" LabelsVisibility="True" Name="Series 1" SeriesPointsSorting="Descending" SeriesPointsSortingKey="Value_1" SynchronizePointOptions="False" ValueDataMembersSerializable="percPartCidade">
                                <viewserializable>
                                    <cc1:SideBySideBarSeriesView ColorEach="True">
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
                                                <valuenumericoptions format="Number" />
                                            </cc1:PointOptions>
                                        </pointoptionsserializable>
                                    </cc1:SideBySideBarSeriesLabel>
                                </labelserializable>
                                <legendpointoptionsserializable>
                                    <cc1:PointOptions PointView="Argument">
                                        <valuenumericoptions format="Percent" />
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
                               <cc1:ChartTitle Text="Participação de Vendas por Cidade" />
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
                    </dxchartsui:WebChartControl>--%>
                     </td>
                </tr>

                <tr>
                    <td>
                        <div id="divTitulo_GraficoRegiao" runat="server" style="color:gray; font-size :26px; text-align:center; padding-top : 20px">Gráfico por Região - Venda e Participação</div>
                    </td>
                </tr>

                <tr>
                    <td>
<%--                        <dxchartsui:WebChartControl ID="grafParticipacaoRegiao" runat="server" DataSourceID="dsGraficoParticipacaoRegiao" Height="235px" Width="1000px" BackColor="Transparent">
                            <borderoptions Color="192, 192, 192" />
                            <diagramserializable>
                                <cc1:XYDiagram>
                                    <axisx visibleinpanesserializable="-1">
                                        <range sidemarginsenabled="True" />
                                    </axisx>
                                    <axisy visible="False" visibleinpanesserializable="-1">
                                        <range sidemarginsenabled="True" />
                                        <gridlines visible="False">
                                        </gridlines>
                                    </axisy>
                                    <defaultpane backcolor="Transparent" bordervisible="False">
                                    </defaultpane>
                                </cc1:XYDiagram>
                            </diagramserializable>
                            <fillstyle>
                                <optionsserializable>
                                    <cc1:SolidFillOptions />
                                </optionsserializable>
                            </fillstyle>
                           
                            <seriesserializable>
                                <cc1:Series ArgumentDataMember="Cidade" ArgumentScaleType="Qualitative" LabelsVisibility="True" Name="Series 1" SeriesPointsSorting="Descending" SeriesPointsSortingKey="Value_1" SynchronizePointOptions="False" ValueDataMembersSerializable="vlrVendaCidade">
                                    <viewserializable>
                                        <cc1:SideBySideBarSeriesView ColorEach="True">
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
                                                    <valuenumericoptions format="Currency" precision="0" />
                                                </cc1:PointOptions>
                                            </pointoptionsserializable>
                                        </cc1:SideBySideBarSeriesLabel>
                                    </labelserializable>
                                    <legendpointoptionsserializable>
                                        <cc1:PointOptions PointView="Argument">
                                            <valuenumericoptions format="Percent" />
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
                                <cc1:ChartTitle Indent="0" Text="Vendas por Região" />
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
                        <asp:SqlDataSource ID="dsGraficoParticipacaoRegiao" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="Gerencial.uspBuscarGraficoParticipacao_Regiao_Ano" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />                               
                            </SelectParameters>
                        </asp:SqlDataSource>--%>
                    </td>
                </tr>

                <tr>
                    <td>                   
<%--                       <dxchartsui:WebChartControl ID="grafPaticipacaoRegiao_Percentual" runat="server" DataSourceID="dsGraficoParticipacaoRegiao" Height="235px" Width="1000px" BackColor="Transparent">
                        <borderoptions Color="192, 192, 192" />
                        <diagramserializable>
                            <cc1:XYDiagram>
                                <axisx visibleinpanesserializable="-1">
                                    <range sidemarginsenabled="True" />
                                </axisx>
                                <axisy visible="False" visibleinpanesserializable="-1">
                                    <range sidemarginsenabled="True" />
                                    <gridlines visible="False">
                                    </gridlines>
                                </axisy>
                                <defaultpane backcolor="Transparent" bordervisible="False">
                                </defaultpane>
                            </cc1:XYDiagram>
                        </diagramserializable>
                        <fillstyle>
                            <optionsserializable>
                                <cc1:SolidFillOptions />
                            </optionsserializable>
                        </fillstyle>
                 
                        <seriesserializable>
                            <cc1:Series ArgumentDataMember="Cidade" ArgumentScaleType="Qualitative" LabelsVisibility="True" Name="Series 1" SeriesPointsSorting="Descending" SeriesPointsSortingKey="Value_1" SynchronizePointOptions="False" ValueDataMembersSerializable="percPartCidade">
                                <viewserializable>
                                    <cc1:SideBySideBarSeriesView ColorEach="True">
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
                                                <valuenumericoptions format="Number" />
                                            </cc1:PointOptions>
                                        </pointoptionsserializable>
                                    </cc1:SideBySideBarSeriesLabel>
                                </labelserializable>
                                <legendpointoptionsserializable>
                                    <cc1:PointOptions PointView="Argument">
                                        <valuenumericoptions format="Percent" />
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
                               <cc1:ChartTitle Text="Participação de Vendas por Região" />
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
                    </dxchartsui:WebChartControl>--%>
                     </td>
                </tr>
                
        </table>

                     
                    


                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>
    


</asp:Content>

