<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="RankingMesPosto.aspx.vb" Inherits="MemberPages_Vendas_RankingMesPosto" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc4" %>
<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>
<%@ Register src="../../Controles/wucSize.ascx" tagname="wucSize" tagprefix="uc3" %>
<%@ Register Src="~/Controles/wucAno_2_Anos.ascx" TagPrefix="uc1" TagName="wucAno_2_Anos" %>



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

        .divDados {
            clear: both;
            float: left;
            width: 100%;
            padding-right: 3px;
            padding-top: 5px;
            padding-bottom: 5px;
        }        

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divAno" class="BGC_myBorder">
        <uc1:wucAno_2_Anos runat="server" ID="cboAno" AutoPostBack="false"  />
    </div>
 
    <div id="divMes">
        <uc4:wuciListaMes ID="cboMes" runat="server" AutoPostBack="false" />
    </div>



<div id="divBotaoAtualizar"  class="BGC_myBorder">
    <dx:aspxbutton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="false" Theme ="MetropolisBlue">
        <ClientSideEvents Click="function(s, e) {
cbPanel.PerformCallback();
}" />
        </dx:aspxbutton>
    </div>
    

    <div class="divDados">

   <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis"  Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
        <SettingsLoadingPanel Text="Aguarde&amp;hellip;"></SettingsLoadingPanel>  

<Images>
<LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
</Images>

<LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
            <PanelCollection>
                <dx:PanelContent runat="server" SupportsDisabledAttributes="both">
                        
                    

                    <div id="divRankingMensal">
                        <dx:ASPxGridView ID="ASPxGridView1" runat="server" ClientInstanceName="ASPxGridView1" 
                            AutoGenerateColumns="False" 
                             DataSourceID="dsSuper" KeyFieldName="idFilial" 
                            Theme="SoftOrange" Width="100%">

                            <EditFormLayoutProperties ColCount="1"></EditFormLayoutProperties>
                            <SettingsAdaptivity>
                            <AdaptiveDetailLayoutProperties ColCount="1"></AdaptiveDetailLayoutProperties>
                            </SettingsAdaptivity>

                            <SettingsBehavior AllowFocusedRow="True" />
                            <Styles >
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
                                    SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRea" 
                                    SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMA" 
                                    SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA1" 
                                    SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA2" 
                                    SummaryType="Sum" />
                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA3" 
                                    SummaryType="Sum" />
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
                                    SummaryType="Sum" />
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
                             <SettingsResizing ColumnResizeMode="Control" />
                             <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                            <Settings ShowTitlePanel="True" ShowVerticalScrollBar="True" 
                                VerticalScrollableHeight="400" ShowFooter="True" HorizontalScrollBarMode="Visible" />
                            <StylesEditors>
                                <ProgressBar Height="25px">
                                </ProgressBar>
                            </StylesEditors>
                        </dx:ASPxGridView>
                    </div>

                    <asp:SqlDataSource ID="dsSuper" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerVendasConnectionString %>"                         
                        
                        SelectCommand="Mes.uspBuscarRankingMesPosto" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
       </dx:ASPxCallbackPanel>
    </div> 

</asp:Content>

