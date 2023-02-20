<%@ Page Title="Ranking de Vendas Mensal" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="RankingMes.aspx.vb" Inherits="MemberPages_Vendas_RankingMes" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc4" %>
<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>
<%@ Register src="../../Controles/wucSize.ascx" tagname="wucSize" tagprefix="uc3" %>
<%@ Register Src="~/Controles/wucAno_2_Anos.ascx" TagPrefix="uc1" TagName="wucAno_2_Anos" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <link href="~/css/Banco_Gerencial/Banco_Gerencial.css" rel="stylesheet" />

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
                        
                    <div id="divRankingMensal_Total" >

                        <dx:ASPxGridView ID="gridTotalizador" runat="server" ClientInstanceName="gridTotalizador" 
                            AutoGenerateColumns="False" 
                             DataSourceID="dsSuperTotalizador" KeyFieldName="idFilial" 
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

                                <dx:GridViewBandColumn Caption="Anos Anteriores" VisibleIndex="4">
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

                                <dx:GridViewBandColumn Caption="Ano 2012" VisibleIndex="3" Name="bandAtual">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta" 
                                            VisibleIndex="0" Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center"  BackColor="Green"  ForeColor ="White"/>
                                            <CellStyle ForeColor="#009900">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#009900">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>

                                        <dx:GridViewDataTextColumn Caption="Sem Delivery" FieldName="vlrVendaSemDelivery" 
                                            VisibleIndex="1" Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center"  BackColor="Blue"  ForeColor ="White"/>
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>

                                         <dx:GridViewDataTextColumn Caption="Delivery" FieldName="vlrVendaDelivery" 
                                            VisibleIndex="2" Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="Blue"  ForeColor ="White"/>
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>

                                        <dx:GridViewDataTextColumn Caption="Total" FieldName="vlrRea" 
                                            VisibleIndex="3" Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center"  BackColor="Blue"  ForeColor ="White" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>

                                        <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_vlrRea" 
                                            ToolTip="% de participação da venda da filial sobre o total da venda da empresa." 
                                            VisibleIndex="4" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewDataTextColumn>

                                        <dx:GridViewDataTextColumn Caption="Mês Anterior" FieldName="vlrMA" 
                                            VisibleIndex="5" Width="100px">
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

                                <dx:GridViewBandColumn Caption="Margem Final" ShowInCustomizationForm="True" VisibleIndex="2">
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

                                <dx:GridViewBandColumn Caption="Ano" VisibleIndex="1" Name="bandAtual">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta" 
                                            VisibleIndex="0" Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center"  BackColor="Green"  ForeColor ="White"/>
                                            <CellStyle ForeColor="#009900">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#009900">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>                                        

                                        <dx:GridViewDataTextColumn Caption="Total" FieldName="vlrRea" 
                                            VisibleIndex="3" Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center"  BackColor="Blue"  ForeColor ="White" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewBandColumn>

                            </Columns>
                             <SettingsResizing ColumnResizeMode="Control" />
                             <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                            <Settings ShowTitlePanel="True" ShowVerticalScrollBar="True" 
                                VerticalScrollableHeight="125" ShowFooter="False" HorizontalScrollBarMode="Visible" />
                            <StylesEditors>
                                <ProgressBar Height="25px">
                                </ProgressBar>
                            </StylesEditors>
                        </dx:ASPxGridView>

                        <asp:SqlDataSource ID="dsSuperTotalizador" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:gerVendasConnectionString %>"                         
                        
                            SelectCommand="Mes.uspBuscarRankingMes_Totalizador" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>


                    </div>

                    <br />

                    <div id="divRankingMensal" class="Separacao">

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

                                <dx:GridViewBandColumn Caption="Anos Anteriores" VisibleIndex="4">
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

                                <dx:GridViewBandColumn Caption="Ano 2012" VisibleIndex="3" Name="bandAtual">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta" 
                                            VisibleIndex="0" Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center"  BackColor="Green"  ForeColor ="White"/>
                                            <CellStyle ForeColor="#009900">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#009900">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>

                                        <dx:GridViewDataTextColumn Caption="Sem Delivery" FieldName="vlrVendaSemDelivery" 
                                            VisibleIndex="1" Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center"  BackColor="Blue"  ForeColor ="White"/>
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>

                                         <dx:GridViewDataTextColumn Caption="Delivery" FieldName="vlrVendaDelivery" 
                                            VisibleIndex="2" Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" BackColor="Blue"  ForeColor ="White"/>
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>

                                        <dx:GridViewDataTextColumn Caption="Total" FieldName="vlrRea" 
                                            VisibleIndex="3" Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center"  BackColor="Blue"  ForeColor ="White" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>

                                        <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_vlrRea" 
                                            ToolTip="% de participação da venda da filial sobre o total da venda da empresa." 
                                            VisibleIndex="4" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dx:GridViewDataTextColumn>

                                        <dx:GridViewDataTextColumn Caption="Mês Anterior" FieldName="vlrMA" 
                                            VisibleIndex="5" Width="100px">
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

                                <dx:GridViewBandColumn Caption="Margem Final" ShowInCustomizationForm="True" VisibleIndex="2">
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

                                <dx:GridViewBandColumn Caption="Ano" VisibleIndex="1" Name="bandAtual">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta" 
                                            VisibleIndex="0" Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center"  BackColor="Green"  ForeColor ="White"/>
                                            <CellStyle ForeColor="#009900">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#009900">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>                                        

                                        <dx:GridViewDataTextColumn Caption="Total" FieldName="vlrRea" 
                                            VisibleIndex="3" Width="100px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center"  BackColor="Blue"  ForeColor ="White" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewBandColumn>

                            </Columns>

                             <SettingsResizing ColumnResizeMode="Control" />
                             <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                            <Settings ShowTitlePanel="True" ShowVerticalScrollBar="True" 
                                VerticalScrollableHeight="400" ShowFooter="False" HorizontalScrollBarMode="Visible" />
                            <StylesEditors>
                                <ProgressBar Height="25px">
                                </ProgressBar>
                            </StylesEditors>
                        </dx:ASPxGridView>

                        <asp:SqlDataSource ID="dsSuper" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:gerVendasConnectionString %>"                         
                        
                            SelectCommand="Mes.uspBuscarRankingMes" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        
                    </div>



                    <%-- ---------------------------------- DADOS REGIONAL-- -----------------------------%>

                    <div id="divTitulo_Regional" runat="server" style="color:gray; font-size :26px; text-align:center; padding-top: 20px">Ranking de Vendas por Regional</div>
                                        

                    <div id="divGridRegional">
                        <dx:ASPxGridView ID="gridRegional" runat="server" ClientInstanceName="gridRegional" 
                            AutoGenerateColumns="False" 
                             
                             DataSourceID="dsRegional" KeyFieldName="idFilial" 
                            Theme="SoftOrange" Width="100%">
                            <SettingsBehavior AllowFocusedRow="True" />
                            <Styles >
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

                            <Toolbars>
                                <dx:GridViewToolbar EnableAdaptivity="true">
                                    <Items>
                                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                                    </Items>
                                </dx:GridViewToolbar>
                            </Toolbars>

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
                                    VisibleIndex="2" Width="130px" FixedStyle="Left" SortIndex="1" SortOrder="Ascending">
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
                            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
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



                    <%--TOP 10 - VENDA ITEM --%>
                    
                    <div id="divTitulo_ItensMaisVendidos" runat="server" style="color:gray; font-size :26px; text-align:center; padding-top: 20px">Top 50 - Itens Mais Vendidos na Empresa</div>
                    <div class="divDados ">

                        <dx:ASPxGridView ID="gridItensMaisVendidos" runat="server" AutoGenerateColumns="False" DataSourceID="dsItensMaisVendidos" Width="100%" >
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


                    <%--TOP 10  -  VOLUME DOS ITENS MAIS VENDIDOS--%>

                    <div id="divTitulo_ItensVolumeMaisVendidos" runat="server" style="color:gray; font-size :26px; text-align:center; padding-top: 20px">Top 50 - Volume Mais Vendido na Empresa</div>
                    <div class="divDados">
                        <dx:ASPxGridView ID="gridItensVolumeMaisVendidos" runat="server" DataSourceID="dsItensVolumeMaisVendidos" AutoGenerateColumns="False" Width="100%">
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



                    <asp:Label ID="lblError" runat="server" Text="TESTE" ForeColor="Red" Font-Size="Large" Visible="False"></asp:Label>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>  

    </div> 

</asp:Content>

