<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/SiteVendas.master" AutoEventWireup="false" CodeFile="RankingMes_OLD.aspx.vb" Inherits="MemberPages_Vendas_RankingMes_OLD" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>






<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>
<%@ Register src="../../Controles/wucFixarCabecalho.ascx" tagname="wucFixarCabecalho" tagprefix="uc2" %>

<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc4" %>

<%@ Register assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>


<%@ Register src="../../Controles/wucSize.ascx" tagname="wucSize" tagprefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
 

    <style type ="text/css" >

        #divAno {
            float: left;
        }

        #divMes {
            float: left;
            margin-left: 5px;
        }

        #divBotaoAtualizar {
           float: left; 
           margin-left: 7px;
           margin-top: 3px;
           padding-top: 5px;
           padding-left: 5px;
        }
        
        #divSize {
            float: left; 
             margin-left: 7px;
            width: 162px;
        }

        #divCabecalho {
            float: left; 
             margin-left: 3px;
        }

        #divDados {
            clear: both;
            float: left;
            width: 100%;
            padding-right: 3px;
        }

         #divKPI {
            clear: both;
            float: left;
            margin-bottom: 5px;
        }



    </style>
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">



    <div id="divAno" class="BGC_myBorder">
        <uc1:wucAno ID="cboAno" runat="server" />
    </div>

    <div id="divMes">
        <uc4:wuciListaMes ID="cboMes" runat="server" />
    </div>

    <div id="divBotaoAtualizar"  class="BGC_myBorder">
        <dx:aspxbutton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="false" Theme ="MetropolisBlue">
            <ClientSideEvents Click="function(s, e) {
	cbPanel.PerformCallback();
}" />
        </dx:aspxbutton>
    </div>

    <div id="divSize">
            
        <uc3:wucSize ID="cboSize" runat="server" />
       
    </div>

    <div id="divCabecalho">
        <uc2:wucFixarCabecalho ID="chkFixarCabecalho" runat="server" />
    </div>


    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="100%" ClientInstanceName ="cbPanel" Theme ="Metropolis"  Images-LoadingPanel-AlternateText="Atualizando">
<Images>
<LoadingPanel AlternateText="Atualizando"></LoadingPanel>
</Images>

<LoadingPanelImage AlternateText="Atualizando"></LoadingPanelImage>
            <PanelCollection>
                <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttributes="both">

                    <div id="divRankingMensal">
                        <dx:ASPxGridView ID="ASPxGridView1" runat="server" ClientInstanceName="ASPxGridView1" 
                            AutoGenerateColumns="False" 
                            CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                            CssPostfix="Office2003_Blue" DataSourceID="dsSuper" KeyFieldName="idFilial" 
                            Theme="SoftOrange" Width="100%">

                            <EditFormLayoutProperties ColCount="1"></EditFormLayoutProperties>
                            <SettingsAdaptivity>
                            <AdaptiveDetailLayoutProperties ColCount="1"></AdaptiveDetailLayoutProperties>
                            </SettingsAdaptivity>

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
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRea" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMA" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA1" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA2" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA3" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealMeta" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMA" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealAA1" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealAA3" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealAA2" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaAnual" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_MetaAnual" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargMeta" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargReal" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargCheia" SummaryType="Custom" />
                                
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemDif" 
                                    SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_vlrRea" 
                                    SummaryType="Custom" />
                            </TotalSummary>
                            <Columns>
                                <dx:GridViewBandColumn Caption="Meta Mês" ToolTip="Meta mensal e quanto que falta para atingir a meta do mês." 
                                    VisibleIndex="5" Name="bandMetaMes">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Previsao" FieldName="vlrMetaAnual" 
                                            VisibleIndex="0" Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="#009900">
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#009900">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Final" FieldName="percCresc_MetaAnual" 
                                            VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Atingimento e Crescimento" VisibleIndex="4">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="% Prev" FieldName="percCresc_RealMeta" 
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
                                        </dx:GridViewDataTextColumn>

                                        <dx:GridViewDataCheckColumn Caption="Status" FieldName="idStatusAting" ToolTip="Indicador se a Meta de Venda foi atingida." VisibleIndex="1" Width="45px">
                                            <PropertiesCheckEdit>
                                                <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                                </DisplayImageChecked>
                                                <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                                </DisplayImageUnchecked>
                                                <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                                </DisplayImageUndefined>
                                                <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                                </DisplayImageGrayed>
                                            </PropertiesCheckEdit>
                                                                                 
                                        </dx:GridViewDataCheckColumn>


                                        <dx:GridViewDataTextColumn Caption="2011" FieldName="percCresc_RealAA1" 
                                            VisibleIndex="3" Width="60px" Name="bandCrescAA1">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="2010" FieldName="percCresc_RealAA2" 
                                            VisibleIndex="4" Width="60px" Name="bandCrescAA2">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="2009" FieldName="percCresc_RealAA3" 
                                            VisibleIndex="5" Width="60px" Name="bandCrescAA3">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% MA" 
                                            ToolTip="Percentual de Crescimento do Mês Anterior" VisibleIndex="2" 
                                            Width="60px" FieldName="percMA">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Anos Anteriores" VisibleIndex="3">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="2011" FieldName="vlrAA1" 
                                            VisibleIndex="0" Width="110px" Name="bandAA1">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="2010" FieldName="vlrAA2" 
                                            VisibleIndex="1" Width="110px" Name="bandAA2">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="2009" FieldName="vlrAA3" 
                                            VisibleIndex="2" Width="110px" Name="bandAA3">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Ano 2012" VisibleIndex="2" Name="bandAtual">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta" 
                                            VisibleIndex="0" Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="#009900">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#009900">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrRea" 
                                            VisibleIndex="1" Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_vlrRea" 
                                            ToolTip="% de participação da venda da filial sobre o total da venda da empresa." 
                                            VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Mês Anterior" FieldName="vlrMA" 
                                            VisibleIndex="3" Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="ID" FieldName="idFilial" VisibleIndex="0" 
                                    Width="30px" Visible="False" FixedStyle="Left">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Filial" FieldName="FilialLista" 
                                    VisibleIndex="1" Width="130px" FixedStyle="Left">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle Wrap="False">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Margem PDV" VisibleIndex="12">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="percMargMeta" 
                                            VisibleIndex="0" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="#009900">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#009900">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Real" FieldName="percMargReal" 
                                            VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Dif." FieldName="percMargemDif" 
                                            VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Margem Final" ShowInCustomizationForm="True" VisibleIndex="14">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="percMargMetaFinal" ShowInCustomizationForm="True" VisibleIndex="0" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Real " FieldName="percMargCheia" ShowInCustomizationForm="True" ToolTip="Percentual de Margem com SellOut" VisibleIndex="1" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#003399" ForeColor="White" HorizontalAlign="Center" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Dif." FieldName="percMargMetaFinalDif" ShowInCustomizationForm="True" VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle BackColor="Gray" ForeColor="White" HorizontalAlign="Center" />
                                </dx:GridViewBandColumn>
                            </Columns>
                             <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                            <Settings ShowTitlePanel="True" ShowVerticalScrollBar="True" 
                                VerticalScrollableHeight="400" ShowFooter="False" HorizontalScrollBarMode="Visible" />
                            <StylesEditors>
                                <ProgressBar Height="25px">
                                </ProgressBar>
                            </StylesEditors>
                        </dx:ASPxGridView>
                    </div>

                            <asp:SqlDataSource ID="dsSuper" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:gerVendasConnectionString %>"                         
                        
                                SelectCommand="Mes.uspBuscarRankingMes" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                    <br />

                    <div id="div3" runat="server" style="color:gray; font-size :26px; text-align:center; padding-top: 20px"><span><uc3:wucSize ID="cboSizeRegional" runat="server" CallSize="100" /></span>Venda Por Regional Acumulado</div>
                    <div id="divGridRegional">
                        <dx:ASPxGridView ID="gridRegional" runat="server" ClientInstanceName="gridRegional" 
                            AutoGenerateColumns="False" 
                            CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                            CssPostfix="Office2003_Blue" DataSourceID="dsRegional" KeyFieldName="idFilial" 
                            Theme="SoftOrange" Width="1000px">
                            <SettingsBehavior AllowFocusedRow="True" />
                            <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                                CssPostfix="Office2003_Blue">
                                <Header ImageSpacing="5px" SortingImageSpacing="5px"></Header>                            
                                <Footer Font-Bold="True">
                                </Footer>
                                <LoadingPanel ImageSpacing="10px"></LoadingPanel>
                                <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
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
                            <TotalSummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRea" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMA"  SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA1" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA2" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA3" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaAnual" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargMeta" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargReal" SummaryType="Sum" />
                                
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealMeta" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMA"  SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealAA1" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealAA3" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealAA2" SummaryType="Custom" />
                                
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_MetaAnual" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargMeta" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargReal" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemDif" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_vlrRea" SummaryType="Sum" />
                            </TotalSummary>
                            <GroupSummary>
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta" ShowInGroupFooterColumn="vlrMeta" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRea" ShowInGroupFooterColumn="vlrRea" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA1" ShowInGroupFooterColumn="vlrAA1" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA2" ShowInGroupFooterColumn="vlrAA2" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA3" ShowInGroupFooterColumn="vlrAA3" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaAnual" ShowInGroupFooterColumn="vlrMetaAnual" SummaryType="Sum" />
                                 <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargMeta" ShowInGroupFooterColumn="vlrMargMeta" SummaryType="Sum" />
                                 <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargReal" ShowInGroupFooterColumn="vlrMargReal" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMA" ShowInGroupFooterColumn="vlrMA" SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="percPart_vlrRea" ShowInGroupFooterColumn="percPart_vlrRea" SummaryType="Sum" />

                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealMeta" ShowInGroupFooterColumn="percCresc_RealMeta" SummaryType="Custom" />
                                 <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMA" ShowInGroupFooterColumn="percMA" SummaryType="Custom" />
                                 <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealAA1" ShowInGroupFooterColumn="percCresc_RealAA1" SummaryType="Custom" />
                                 <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealAA2" ShowInGroupFooterColumn="percCresc_RealAA2" SummaryType="Custom" />
                                 <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealAA3" ShowInGroupFooterColumn="percCresc_RealAA3" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_MetaAnual" ShowInGroupFooterColumn="percCresc_MetaAnual" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargMeta" ShowInGroupFooterColumn="percMargMeta" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargReal" ShowInGroupFooterColumn="percMargReal" SummaryType="Custom" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemDif" ShowInGroupFooterColumn="percMargemDif" SummaryType="Custom" />

                            </GroupSummary>
                            <Columns>
                                <dx:GridViewBandColumn Caption="Meta Mês" ToolTip="Meta mensal e quanto que falta para atingir a meta do mês." 
                                    VisibleIndex="6" Name="bandMetaMes">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Previsao" FieldName="vlrMetaAnual" 
                                            VisibleIndex="0" Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="#009900">
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#009900">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Final" FieldName="percCresc_MetaAnual" 
                                            VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Atingimento e Crescimento" VisibleIndex="5">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="% Prev" FieldName="percCresc_RealMeta" 
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
                                        </dx:GridViewDataTextColumn>

                                        <dx:GridViewDataCheckColumn Caption="Status" FieldName="idStatusAting" ToolTip="Indicador se a Meta de Venda foi atingida." VisibleIndex="1" Width="45px">
                                            <PropertiesCheckEdit>
                                                <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                                </DisplayImageChecked>
                                                <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                                </DisplayImageUnchecked>
                                                <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                                </DisplayImageUndefined>
                                                <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                                </DisplayImageGrayed>
                                            </PropertiesCheckEdit>
                                                                                 
                                        </dx:GridViewDataCheckColumn>

                                        <dx:GridViewDataTextColumn Caption="2011" FieldName="percCresc_RealAA1" 
                                            VisibleIndex="3" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="2010" FieldName="percCresc_RealAA2" 
                                            VisibleIndex="4" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="2009" FieldName="percCresc_RealAA3" 
                                            VisibleIndex="5" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% MA" 
                                            ToolTip="Percentual de Crescimento do Mês Anterior" VisibleIndex="2" 
                                            Width="60px" FieldName="percMA">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Anos Anteriores" VisibleIndex="4">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="2011" FieldName="vlrAA1" 
                                            VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="2010" FieldName="vlrAA2" 
                                            VisibleIndex="1" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="2009" FieldName="vlrAA3" 
                                            VisibleIndex="2" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Ano 2012" VisibleIndex="3" Name="bandAtual">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta" 
                                            VisibleIndex="0" Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="#009900">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#009900">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrRea" 
                                            VisibleIndex="1" Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_vlrRea" 
                                            ToolTip="% de participação da venda da filial sobre o total da venda da empresa." 
                                            VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Mês Anterior" FieldName="vlrMA" 
                                            VisibleIndex="3" Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="Regional" FieldName="nomeRegional" VisibleIndex="0" GroupIndex="0" SortIndex="0" SortOrder="Ascending">
                                </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="idFilial" ShowInCustomizationForm="True" FixedStyle="Left" Width="30px" Caption="ID" VisibleIndex="1" Visible="False">
</dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Filial" FieldName="FilialLista" 
                                    VisibleIndex="2" Width="130px" FixedStyle="Left">
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle Wrap="False">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Margem" VisibleIndex="12">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="percMargMeta" 
                                            VisibleIndex="0" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="#009900">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#009900">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Real" FieldName="percMargReal" 
                                            VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Dif." FieldName="percMargemDif" 
                                            VisibleIndex="2" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn ShowInCustomizationForm="True" VisibleIndex="14" Visible="false" >
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="vlrMargMeta" ShowInCustomizationForm="True" VisibleIndex="0"></dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="vlrMargReal" ShowInCustomizationForm="True" VisibleIndex="1"></dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                            </Columns>
                            <Settings ShowTitlePanel="True" ShowVerticalScrollBar="True" 
                                VerticalScrollableHeight="400" ShowFooter="True" HorizontalScrollBarMode="Visible" ShowGroupFooter="VisibleAlways" />
                            <StylesEditors>
                                <ProgressBar Height="25px">
                                </ProgressBar>
                            </StylesEditors>
                        </dx:ASPxGridView>
                    </div>

                        <asp:SqlDataSource ID="dsRegional" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:gerVendasConnectionString %>" 
                        
                        
                            SelectCommand="Mes.uspBuscarRankingMesRegional" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    <uc1:wucBotaoExcel runat="server" ID="wucBotaoExcel2" CallGridViewID="gridRegional" GuiaNome="Ranking Regional" />
                    <br />

                    <div id="div1" runat="server" style="color:gray; font-size :26px; text-align:center; padding-top: 20px"><span><uc3:wucSize ID="cboSizeSecao" runat="server" CallSize="100" /></span>Venda Por Seção Acumulado</div>
                        <div>
            <dx:ASPxGridView ID="gridSecao" runat="server" DataSourceID="dsSecao" AutoGenerateColumns="False" 
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
                                            
<dx:ASPxSummaryItem SummaryType="Custom" FieldName="Qtde_AA" DisplayFormat="{0:n0}"></dx:ASPxSummaryItem>
<dx:ASPxSummaryItem SummaryType="Custom" FieldName="vlrVenda_AA" DisplayFormat="{0:n0}"></dx:ASPxSummaryItem>
<dx:ASPxSummaryItem SummaryType="Custom" FieldName="Qtde_AT" DisplayFormat="{0:n0}"></dx:ASPxSummaryItem>
<dx:ASPxSummaryItem SummaryType="Custom" FieldName="vlrVenda_AT" DisplayFormat="{0:n0}"></dx:ASPxSummaryItem>
<dx:ASPxSummaryItem SummaryType="Custom" FieldName="percMargem_AA" DisplayFormat="{0:n2}"></dx:ASPxSummaryItem>
<dx:ASPxSummaryItem SummaryType="Custom" FieldName="percMargem_AT" DisplayFormat="{0:n2}"></dx:ASPxSummaryItem>
<dx:ASPxSummaryItem SummaryType="Custom" FieldName="percPart_AA" DisplayFormat="{0:n2}"></dx:ASPxSummaryItem>
<dx:ASPxSummaryItem SummaryType="Custom" FieldName="percPart_AT" DisplayFormat="{0:n2}"></dx:ASPxSummaryItem>
<dx:ASPxSummaryItem SummaryType="Custom" FieldName="percCresc_Venda" DisplayFormat="{0:n2}"></dx:ASPxSummaryItem>
<dx:ASPxSummaryItem SummaryType="Custom" FieldName="percCresc_Qtde" DisplayFormat="{0:n2}"></dx:ASPxSummaryItem>
<dx:ASPxSummaryItem SummaryType="Custom" FieldName="percMargem_meta" DisplayFormat="{0:n2}"></dx:ASPxSummaryItem>
<dx:ASPxSummaryItem SummaryType="Custom" FieldName="vlrLucroFinal_AT" DisplayFormat="{0:n0}"></dx:ASPxSummaryItem>
<dx:ASPxSummaryItem SummaryType="Custom" FieldName="percMargemFinal_AT" DisplayFormat="{0:n2}"></dx:ASPxSummaryItem>
<dx:ASPxSummaryItem SummaryType="Custom" FieldName="percMargemFinal_AA" DisplayFormat="{0:n2}"></dx:ASPxSummaryItem>
                                            
                            </TotalSummary>

                    <Columns>                  

                                <dx:GridViewBandColumn Caption="Volume" Name="bandVolume" 
                                    ToolTip="Exibe informações de Volume" VisibleIndex="2" 
                                    Visible="True">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="2015" FieldName="Qtde_AA" 
                                            ToolTip="Volume do Ano Anterior (mesmo período)" VisibleIndex="0" 
                                            Width="90px">
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
                                            VisibleIndex="1" Width="90px">
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
                                            Width="100px">
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
                                            VisibleIndex="1" Width="100px">
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
                                                    
                                        <dx:GridViewDataTextColumn Caption="2015" FieldName="percMargemFinal_AA" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle  />
                                            <CellStyle ForeColor="#996600">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#996600">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="2016" FieldName="percMargemFinal_AT" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Final" VisibleIndex="1" Width="70px" >
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

<dx:GridViewDataTextColumn FieldName="descId" ShowInCustomizationForm="True" FixedStyle="Left" Width="200px" Caption="Se&#231;&#227;o / Departamento" VisibleIndex="1">
<Settings AutoFilterCondition="Contains"></Settings>

<CellStyle Wrap="False">
<BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px"></BorderRight>
</CellStyle>

<FooterCellStyle>
<BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px"></BorderRight>
</FooterCellStyle>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="idSecao" ShowInCustomizationForm="True" FixedStyle="Left" Width="70px" Caption="C&#243;digo" ToolTip="C&#243;digo do produto" Visible="False" VisibleIndex="0"></dx:GridViewDataTextColumn>

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


            </dx:ASPxGridView>
        </div>
                        <asp:SqlDataSource ID="dsSecao" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Vendas_Dia.SLV004" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="DiaInicial_AT" SessionField="sDATA_INICIAL" DbType="Date" />
                                <asp:SessionParameter DbType="Date" Name="DiaFinal_AT" SessionField="sDATA_FINAL" />
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                <asp:SessionParameter Name="MesmosDias" SessionField="sMESMOSDIAS" Type="Byte" />
                                <asp:SessionParameter Name="idTipoLista" SessionField="sTIPO_LISTA" Type="Byte" DefaultValue="0" />
                                <asp:SessionParameter Name="Matricula" SessionField="sMATRICULA" Type="String" DefaultValue="0" />
                                <asp:SessionParameter Name="MesAnterior" SessionField="sMES_ANTERIOR" Type="Byte" DefaultValue="1" />

                            </SelectParameters>
                        </asp:SqlDataSource>

        <uc1:wucBotaoExcel runat="server" ID="wucBotaoExcel3" CallGridViewID="gridSecao" GuiaNome="Ranking por Seção" />

                    <div id="divTitulo_ItensMaisVendidos" runat="server" style="color:gray; font-size :26px; text-align:center; padding-top: 20px">Top 20 - Itens Mais Vendidos na Empresa</div>
                    <div id="divItensMaisVendidos">

                        <dx:ASPxGridView runat="server" AutoGenerateColumns="False" DataSourceID="dsItensMaisVendidos" Width="1000px" ID="gridItensMaisVendidos">
                            <Columns>
<dx:GridViewDataTextColumn FieldName="CodProduto" ShowInCustomizationForm="True" Width="70px" Caption="C&#243;digo" ToolTip="C&#243;digo do produto" VisibleIndex="1"></dx:GridViewDataTextColumn>
<dx:GridViewBandColumn ShowInCustomizationForm="True" Caption="Vendas" VisibleIndex="3"><Columns>
<dx:GridViewDataTextColumn FieldName="QtdVendas" ShowInCustomizationForm="True" Width="85px" Caption="Volume" ToolTip="Volume ou quantidade dos itens vendidos" VisibleIndex="0">
<PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="Venda" ShowInCustomizationForm="True" Width="85px" Caption="R$" ToolTip="Valor da venda de cada item" VisibleIndex="1">
<PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>

<HeaderStyle BackColor="#999999" />

<CellStyle>
<BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px"></BorderRight>
</CellStyle>
</dx:GridViewDataTextColumn>
</Columns>
</dx:GridViewBandColumn>
<dx:GridViewBandColumn ShowInCustomizationForm="True" Caption="Margem Praticada" VisibleIndex="4"><Columns>
<dx:GridViewDataTextColumn FieldName="LucroComercial" ShowInCustomizationForm="True" Width="85px" Caption="R$" ToolTip="Valor do Lucro Praticado" VisibleIndex="0">
<PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="percMargem" ReadOnly="True" ShowInCustomizationForm="True" Width="60px" Caption="%" ToolTip="Percentual da Margem Praticada" VisibleIndex="1">
<PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>

<CellStyle>
<BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px"></BorderRight>
</CellStyle>
</dx:GridViewDataTextColumn>
</Columns>
</dx:GridViewBandColumn>
<dx:GridViewDataTextColumn FieldName="numCliente" ShowInCustomizationForm="True" Width="80px" Caption="N&#186; Cliente" ToolTip="N&#250;mero de clientes que compraram o item." VisibleIndex="12">
<PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
</dx:GridViewDataTextColumn>
<dx:GridViewBandColumn ShowInCustomizationForm="True" Caption="Sell Out" VisibleIndex="6"><Columns>
<dx:GridViewDataTextColumn FieldName="LucroSellOut" ShowInCustomizationForm="True" Width="85px" Caption="R$" ToolTip="Valor do Sell Out" VisibleIndex="0">
<PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="percMargemSellOut" ReadOnly="True" ShowInCustomizationForm="True" Width="60px" Caption="%" ToolTip="Percentual do Sell Out" VisibleIndex="1">
<PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>

<CellStyle>
<BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px"></BorderRight>
</CellStyle>
</dx:GridViewDataTextColumn>
</Columns>
</dx:GridViewBandColumn>
<dx:GridViewDataTextColumn FieldName="nomeProduto" ShowInCustomizationForm="True" Width="220px" Caption="Descri&#231;&#227;o do produto" ToolTip="Nome do produto" VisibleIndex="2">
<CellStyle Wrap="False">
<BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px"></BorderRight>
</CellStyle>
</dx:GridViewDataTextColumn>
<dx:GridViewBandColumn ShowInCustomizationForm="True" Caption="Margem Final" VisibleIndex="10"><Columns>
<dx:GridViewDataTextColumn FieldName="vlrLucroFinal" ReadOnly="True" ShowInCustomizationForm="True" Width="85px" Caption="R$" ToolTip="Valor do Lucro Final (Lucro Praticado + Lucro Sell Out)" VisibleIndex="0">
<PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="percMargemFinal" ReadOnly="True" ShowInCustomizationForm="True" Width="60px" Caption="%" ToolTip="Percentual da Margem Final " VisibleIndex="1">
<PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>

<CellStyle>
<BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px"></BorderRight>
</CellStyle>
</dx:GridViewDataTextColumn>
</Columns>
</dx:GridViewBandColumn>
<dx:GridViewDataTextColumn FieldName="rnk" ReadOnly="True" ShowInCustomizationForm="True" Width="30px" Caption="N&#186;" ToolTip="Posi&#231;&#227;o no TOP 10" VisibleIndex="0"></dx:GridViewDataTextColumn>
</Columns>

<SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control"></SettingsBehavior>

<SettingsPager Mode="ShowAllRecords"></SettingsPager>

                            <Settings VerticalScrollableHeight="230" VerticalScrollBarMode="Visible" />

<Styles>
<Header HorizontalAlign="Center"></Header>

<AlternatingRow BackColor="#F2F2F2"></AlternatingRow>

<FocusedRow BackColor="#FFFF99" ForeColor="#3366FF"></FocusedRow>
</Styles>
</dx:ASPxGridView>


                    <asp:SqlDataSource ID="dsItensMaisVendidos" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemMesConnectionString %>" SelectCommand="dbo.uspBuscar_Venda_ItemMaisVendido_Top10_Empresa_Mes" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />                                
                                <asp:Parameter DefaultValue="99" Name="idFilial" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>


                    <div id="divTitulo_ItensVolumeMaisVendidos" runat="server" style="color:gray; font-size :26px; text-align:center; padding-top: 20px">Top 20 - Volume Mais Vendido na Empresa</div>
                    <div id="divVolumeMaisVendidos">
                        <dx:ASPxGridView ID="gridItensVolumeMaisVendidos" runat="server" DataSourceID="dsItensVolumeMaisVendidos" AutoGenerateColumns="False" Width="1000px">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Código" FieldName="CodProduto" ShowInCustomizationForm="True" ToolTip="Código do produto" VisibleIndex="1" Width="70px">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Vendas" ShowInCustomizationForm="True" VisibleIndex="3">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendas" ShowInCustomizationForm="True" ToolTip="Volume ou quantidade dos itens vendidos" VisibleIndex="0" Width="85px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#999999" />
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
                                <dx:GridViewDataTextColumn Caption="Nº" FieldName="rnk" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Posição no TOP 10" VisibleIndex="0" Width="30px">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Settings VerticalScrollableHeight="230" VerticalScrollBarMode="Visible" />
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <AlternatingRow BackColor="#F2F2F2">
                                </AlternatingRow>
                                <FocusedRow BackColor="#FFFF99" ForeColor="#3366FF">
                                </FocusedRow>
                            </Styles>
                        </dx:ASPxGridView>



                        <asp:SqlDataSource ID="dsItensVolumeMaisVendidos" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemMesConnectionString %>" SelectCommand="uspBuscar_Volume_ItemMaisVendido_Top10_Empresa_Mes" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                <asp:Parameter DefaultValue="99" Name="idFilial" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>


                    <div id="divTitulo_LucroMaisVendido" runat="server" style="color:gray; font-size :26px; text-align:center; padding-top: 20px">Top 20 - Lucro dos Itens Mais Vendidos na Empresa</div>
                    <div id="divItensMaisVendidosLucro">
                        <dx:ASPxGridView ID="gridItensMaisVendidosLucro" runat="server" DataSourceID="dsItensMaisVendidosLucro" AutoGenerateColumns="False" Width="1000px">
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
                                            <HeaderStyle BackColor="#999999" />
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
                                <dx:GridViewDataTextColumn Caption="Nº" FieldName="rnk" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Posição no TOP 10" VisibleIndex="0" Width="30px">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Settings VerticalScrollableHeight="230" VerticalScrollBarMode="Visible" />
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <AlternatingRow BackColor="#F2F2F2">
                                </AlternatingRow>
                                <FocusedRow BackColor="#FFFF99" ForeColor="#3366FF">
                                </FocusedRow>
                            </Styles>
                        </dx:ASPxGridView>





                        <asp:SqlDataSource ID="dsItensMaisVendidosLucro" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemMesConnectionString %>" SelectCommand="dbo.uspBuscar_Lucro_ItemMaisVendido_Top10_Empresa_Mes" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                <asp:Parameter DefaultValue="99" Name="idFilial" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </div>


                    <div id="divTitulo_ItemMenosVendido" runat="server" style="color:red; font-size :26px; text-align:center; padding-top: 20px">Top 20 - Itens Menos Vendidos na Empresa</div>
                    <div id="div2">
                        <dx:ASPxGridView ID="gridItemMenosVendidos" runat="server" DataSourceID="dsItensMenosVendidos" AutoGenerateColumns="False" Width="1000px">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Código" FieldName="CodProduto" ShowInCustomizationForm="True" ToolTip="Código do produto" VisibleIndex="1" Width="70px">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Vendas" ShowInCustomizationForm="True" VisibleIndex="3">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendas" ShowInCustomizationForm="True" ToolTip="Volume ou quantidade dos itens vendidos" VisibleIndex="0" Width="85px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="Venda" ShowInCustomizationForm="True" ToolTip="Valor da venda de cada item" VisibleIndex="1" Width="85px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="#999999" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Margem Praticada" ShowInCustomizationForm="True" VisibleIndex="4">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="LucroComercial" ShowInCustomizationForm="True" ToolTip="Valor do Lucro Praticado" VisibleIndex="0" Width="85px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
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
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
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
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
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
                                <dx:GridViewDataTextColumn Caption="Nº" FieldName="rnk" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Posição no TOP 10" VisibleIndex="0" Width="30px">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Settings VerticalScrollableHeight="230" VerticalScrollBarMode="Visible" />
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <AlternatingRow BackColor="#F2F2F2">
                                </AlternatingRow>
                                <FocusedRow BackColor="#FFFF99" ForeColor="#3366FF">
                                </FocusedRow>
                            </Styles>
                        </dx:ASPxGridView>



                        <asp:SqlDataSource ID="dsItensMenosVendidos" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemMesConnectionString %>" SelectCommand="dbo.uspBuscar_Venda_ItemMenosVendido_Top10_Empresa_Mes" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                <asp:Parameter DefaultValue="99" Name="idFilial" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                    </div>


                    <div id="divTitulo_GraficoCidade" runat="server" style="color:gray; font-size :26px; text-align:center; padding-top: 20px">Gráfico por Cidade - Venda e Participação</div>
                    <div id="divParticipacaoCidade">
                        <dxchartsui:webchartcontrol ID="grafParticipacaoCidade" runat="server" DataSourceID="dsGraficoParticipacaoCidade" Height="235px" Width="1000px" BackColor="Transparent">
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
                     
<Legend Name="Default Legend"></Legend>
                     
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
                        <asp:SqlDataSource ID="dsGraficoParticipacaoCidade" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="Gerencial.uspBuscarGraficoParticipacao_Cidade_Mes" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>

                    <div id="divPaticipacaoCidade_Percentual">
                       <dxchartsui:WebChartControl ID="grafPaticipacaoCidade_Percentual" runat="server" DataSourceID="dsGraficoParticipacaoCidade" Height="235px" Width="1000px" BackColor="Transparent">
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
            
<Legend Name="Default Legend"></Legend>
            
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
                    </dxchartsui:WebChartControl>
                    </div>



                    <div id="divTitulo_GraficoRegiao" runat="server" style="color:gray; font-size :26px; text-align:center; padding-top : 20px">Gráfico por Região - Venda e Participação</div>
                    <div id="divParticipacaoRegia">
                        <dxchartsui:WebChartControl ID="grafParticipacaoRegiao" runat="server" DataSourceID="dsGraficoParticipacaoRegiao" Height="235px" Width="1000px" BackColor="Transparent">
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
                          
<Legend Name="Default Legend"></Legend>
                          
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
                        <asp:SqlDataSource ID="dsGraficoParticipacaoRegiao" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="Gerencial.uspBuscarGraficoParticipacao_Regiao_Mes" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>


                    <div id="divPaticipacaoRegiao_Percentual">
                       <dxchartsui:WebChartControl ID="grafPaticipacaoRegiao_Percentual" runat="server" DataSourceID="dsGraficoParticipacaoRegiao" Height="235px" Width="1000px" BackColor="Transparent">
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
                       
<Legend Name="Default Legend"></Legend>
                       
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
                    </dxchartsui:WebChartControl>

                    </div>

                    <asp:Label ID="lblOBS" runat="server" Text="TESTE"></asp:Label>


                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>




 

</asp:Content>


