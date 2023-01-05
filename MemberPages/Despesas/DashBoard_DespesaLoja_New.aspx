<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="DashBoard_DespesaLoja_New.aspx.vb" Inherits="MemberPages_Despesas_DashBoard_DespesaLoja_New" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>


<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMesPeriodo.ascx" TagPrefix="uc1" TagName="wuciListaMesPeriodo" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
  
      <style type="text/css" >
        

        #Ano {
            clear: both;
            float: left;
            margin-top: 3px;
        }

        #Periodo {
            float: left;
            margin-left: 2px;
            padding-top: 4px;          
        }

        #divBotaoAtualizar {
            float: left;
            margin-left: 5px;            
            padding-top: 6px;
            padding-left: 3px;
        }

        #FixarCabecalho {
            float: left;
            margin-left: 5px; 
            padding-top: 6px;                     
        }

        #ShowButton {
            float: left;
            margin-left: 5px;             
            padding-top: 6px;  
            padding-left: 5px;                    
        }

        #divSize {
            float: left;  
            padding-top: 6px;
            padding-left: -10px;                                     
        }

        #Grupo {
            float: left;
            margin-left: 2px;                     
        }

        #CheckSubgrupo {
            float: left;
            margin-left: 2px;                     
        }

        #Subgrupo {
            float: left;
            margin-left: 2px;                     
        }

        #gridPrincipal {
            clear:both ;
            float: left;            
            padding-top: 2px;   
            width: 100%;
            margin-left: 2px;                  
        }


    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
        <div id="Ano" class="BGC_myBorder ">
            <uc1:wucAno runat="server" ID="cboAno" />
        </div>

        <div id="Periodo" class="BGC_myBorder"> 
            <uc1:wuciListaMesPeriodo runat="server" ID="cboMes" />
        </div>

        <div id="Filial" class="BGC_Filial BGC_myBorder">
            <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilialNew" />
        </div>

        <div id="divBotaoAtualizar" class="BGC_myBorder ">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="MetropolisBlue">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
        </div>

        <div id="FixarCabecalho" class="BGC_myBorder">
            <dx:ASPxCheckBox ID="chkFixarCabecalho" runat="server" Text="Fixar Cabeçalho" Checked="true" AutoPostBack="True"></dx:ASPxCheckBox>
        </div>

        <div id="ShowButton" class="BGC_myBorder " >
            <dx:ASPxButton ID="btnShowButton" runat="server" Text="Ver Loja a Loja" AutoPostBack="false" 
                Theme="SoftOrange" ClientInstanceName="meuBotao" ClientSideEvents-Click="function(s, e) { MudarTextoBotao(); }">
            </dx:ASPxButton>
        </div>
    
        <div id="divSize" class="BGC_myBorder ">
            <uc1:wucSize runat="server" ID="cboSize" />
        </div>
    
        <div id="gridPrincipal">
            <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="100%" ClientInstanceName="cbPanel">
                <PanelCollection>
                    <dx:PanelContent runat="server" SupportsDisabledAttributes="both">
                                        
                            <dx:ASPxGridView ID="gridGrupoMes" runat="server" 
                                AutoGenerateColumns="False" DataSourceID="dsGrupoMes" EnableTheming="True" 
                                KeyFieldName="idGrupo" Theme="Default" width="100%">
                                <Toolbars>
                <dx:GridViewToolbar EnableAdaptivity="true" >
                    <Items>
                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
                                <TotalSummary>
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAA" 
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRev" 
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReal" 
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difVlrRev" 
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealAA" 
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRev" 
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percReal" 
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPercRev" 
                                        SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMA" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMA" SummaryType="Custom" />
                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescMA" SummaryType="Custom" />
                                </TotalSummary>
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="idGrupo" ToolTip="ID do grupo" Visible="false" 
                                        VisibleIndex="1" Caption="ID" Width="30px">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Descrição" FieldName="descConta" 
                                        VisibleIndex="0" Width="150px" ToolTip="Descrição do grupo." FixedStyle="Left">
                                        <CellStyle Wrap="False">
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewBandColumn Caption="Ano Atual" VisibleIndex="4" ToolTip="Este quadro exibe informações do ano atual.">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrRev" 
                                                VisibleIndex="0" Width="100px" ToolTip="Valor de meta revista de despesa do ano atual.">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <CellStyle ForeColor="#009900">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="#009900">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="%" FieldName="percRev" VisibleIndex="1" 
                                                Width="60px" ToolTip="Percentual de meta revista do ano atual.">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <CellStyle ForeColor="#009900">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="#009900">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrReal" 
                                                VisibleIndex="2" Width="100px" ToolTip="Valor realizado do ano atual.">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <CellStyle ForeColor="Blue">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="Blue">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="%" FieldName="percReal" VisibleIndex="3" 
                                                Width="60px" ToolTip="Percentual realizado do ano atual.">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <CellStyle ForeColor="Blue">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="Blue">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Ano Anterior (AA)" VisibleIndex="2" ToolTip="Este quadro exibe informações do ano anterior.">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrRealAA" 
                                                VisibleIndex="0" Width="100px" ToolTip="Valor realizado do ano anterior.">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="%" FieldName="percRealAA" 
                                                VisibleIndex="1" Width="60px" ToolTip="Percentual realizado do ano anterior.">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                                <FooterCellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Diferenças" VisibleIndex="5" ToolTip="Este quadro exibe informações de diferença entre meta versus realizado e percentual de crescimento.">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Valor" FieldName="difVlrRev" 
                                                VisibleIndex="0" Width="90px" ToolTip="Diferença entre valor de realizado x meta.">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <CellStyle Font-Bold="True">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="%" FieldName="difPercRev" 
                                                VisibleIndex="1" Width="60px" ToolTip="Diferença entre percentual de realizado x meta.">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <CellStyle Font-Bold="True">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                                <FooterCellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Mês Anterior (MA)" Name="bandMesAnterior" ToolTip="Este quadro exibe informações do mês anterior." VisibleIndex="3">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrRealMA" ToolTip="Valor realizado do mês anterior. Quando o mês de janeiro estiver selecionado será exibido o mês de Dezembro do ano anterior." VisibleIndex="0" Width="100px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="%" FieldName="percRealMA" ToolTip="Percentual realizado do mês anterior. Quando o mês de janeiro estiver selecionado será exibido o mês de Dezembro do ano anterior." VisibleIndex="1" Width="60px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                                <FooterCellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Crescimento" Name="bandCrescimento" ToolTip="Exibe informações sobre o crescimento do mês anterior e ano anterior." VisibleIndex="7">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="% AA" FieldName="percCresc" ToolTip="Percentual de crescimento sobre o ano anterior" VisibleIndex="0" Width="80px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="% MA" FieldName="percCrescMA" ToolTip="Percentual de crescimento sobre o mês anterior" VisibleIndex="1" Width="80px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="6">
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                <SettingsPager Mode="ShowAllRecords" />
                                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" ></SettingsExport>
                                <Styles>
                                    <Header HorizontalAlign="Center"></Header>                                
	                                <FocusedRow BackColor="#ffdd55" ForeColor="Black" ></FocusedRow>
	                                <AlternatingRow BackColor="#E6F2FF"></AlternatingRow>
                                    <Footer Font-Bold="True"></Footer>
                                </Styles>
                                <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="420" ShowFooter="True" HorizontalScrollBarMode="Visible" />
                                <SettingsDetail ShowDetailRow="True" />

                                <Templates>
                                    <DetailRow>
                                        <dx:ASPxGridView ID="gridSub" runat="server" AutoGenerateColumns="False" 
                                            DataSourceID="dsDetail" EnableTheming="True" KeyFieldName="idSubgrupo" 
                                            OnBeforePerformDataSelect="gridSub_BeforePerformDataSelect" 
                                            OnCustomSummaryCalculate="gridSub_CustomSummaryCalculate" 
                                            OnHtmlDataCellPrepared="gridSub_HtmlDataCellPrepared" 
                                            Theme="Default" Width="100%" OnLoad="gridSub_Load">
                                            <TotalSummary>
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAA" 
                                                    SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRev" 
                                                    SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReal" 
                                                    SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difVlrRev" 
                                                    SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealAA" 
                                                    SummaryType="Custom" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRev" 
                                                    SummaryType="Custom" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percReal" 
                                                    SummaryType="Custom" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPercRev" 
                                                    SummaryType="Custom" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMA" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMA" SummaryType="Custom" />
                                            </TotalSummary>
                                            <Columns>
                                                <dx:GridViewBandColumn Caption="Mês Anterior" VisibleIndex="3" Name="bandMesAnterior">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrRealMA" VisibleIndex="0" Width="80px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <CellStyle>
                                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percRealMA" VisibleIndex="1" Width="50px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:GridViewBandColumn>
                                                <dx:GridViewDataTextColumn Caption="ID" FieldName="idSubgrupo" VisibleIndex="0" 
                                                    Width="30px">
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewBandColumn Caption="Ano Anterior" VisibleIndex="2">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrRealAA" 
                                                            VisibleIndex="0" Width="80px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <CellStyle>
                                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percRealAA" 
                                                            VisibleIndex="1" Width="50px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:GridViewBandColumn>
                                                <dx:GridViewDataTextColumn Caption="Descrição - Subgrupo" 
                                                    FieldName="descConta" VisibleIndex="1" Width="100px">
                                                    <CellStyle Wrap="False">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewBandColumn Caption="Ano Atual" VisibleIndex="4">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrRev" 
                                                            VisibleIndex="0" Width="80px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <CellStyle ForeColor="#009900">
                                                            </CellStyle>
                                                            <FooterCellStyle ForeColor="#009900">
                                                            </FooterCellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percRev" VisibleIndex="1" 
                                                            Width="50px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <CellStyle ForeColor="#009900">
                                                            </CellStyle>
                                                            <FooterCellStyle ForeColor="#009900">
                                                            </FooterCellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrReal" 
                                                            VisibleIndex="2" Width="80px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <CellStyle ForeColor="Blue">
                                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                            </CellStyle>
                                                            <FooterCellStyle ForeColor="Blue">
                                                            </FooterCellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percReal" VisibleIndex="3" 
                                                            Width="50px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <CellStyle ForeColor="Blue">
                                                            </CellStyle>
                                                            <FooterCellStyle ForeColor="Blue">
                                                            </FooterCellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:GridViewBandColumn>
                                                <dx:GridViewBandColumn Caption="Diferenças" VisibleIndex="7">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="Valor" FieldName="difVlrRev" 
                                                            VisibleIndex="0" Width="80px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <CellStyle>
                                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="%" FieldName="difPercRev" 
                                                            VisibleIndex="1" Width="50px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:GridViewBandColumn>
                                            </Columns>
                                            <SettingsBehavior AllowFocusedRow="True" />
                                            <Templates>
                                                <DetailRow>
                                                    <div style="color:white">Nivel 3</div>
                                                    <dx:ASPxGridView ID="gridN3" runat="server" AutoGenerateColumns="False" DataSourceID="dsN3" EnableTheming="True" KeyFieldName="idN3" OnBeforePerformDataSelect="gridN3_BeforePerformDataSelect" OnCustomSummaryCalculate="gridN3_CustomSummaryCalculate" OnHtmlDataCellPrepared="gridN3_HtmlDataCellPrepared" OnLoad="gridN3_Load" Theme="Default" Width="100%" OnSummaryDisplayText="gridN3_SummaryDisplayText">
                                                        <TotalSummary>
                                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAA" SummaryType="Sum" />
                                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRev" SummaryType="Sum" />
                                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReal" SummaryType="Sum" />
                                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difVlrRev" SummaryType="Sum" />
                                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealAA" SummaryType="Custom" />
                                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRev" SummaryType="Custom" />
                                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percReal" SummaryType="Custom" />
                                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPercRev" SummaryType="Custom" />
                                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMA" SummaryType="Sum" />
                                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMA" SummaryType="Custom" />
                                                        </TotalSummary>
                                                        <Columns>
                                                            <dx:GridViewBandColumn Caption="Mês Anterior" Name="bandMesAnterior" VisibleIndex="3">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrRealMA" VisibleIndex="0" Width="80px">
                                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                        </PropertiesTextEdit>
                                                                        <CellStyle>
                                                                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                        </CellStyle>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percRealMA" VisibleIndex="1" Width="50px">
                                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                        </PropertiesTextEdit>
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewDataTextColumn Caption="ID" FieldName="idN3" VisibleIndex="0" Width="30px">
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="Ano Anterior" VisibleIndex="2">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrRealAA" VisibleIndex="0" Width="80px">
                                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                        </PropertiesTextEdit>
                                                                        <CellStyle>
                                                                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                        </CellStyle>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percRealAA" VisibleIndex="1" Width="50px">
                                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                        </PropertiesTextEdit>
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewDataTextColumn Caption="Descrição - Nivel 3" FieldName="descConta" VisibleIndex="1" Width="100px">
                                                                <CellStyle Wrap="False">
                                                                </CellStyle>
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="Ano Atual" VisibleIndex="4">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrRev" VisibleIndex="0" Width="80px">
                                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                        </PropertiesTextEdit>
                                                                        <CellStyle ForeColor="#009900">
                                                                        </CellStyle>
                                                                        <FooterCellStyle ForeColor="#009900">
                                                                        </FooterCellStyle>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percRev" VisibleIndex="1" Width="50px">
                                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                        </PropertiesTextEdit>
                                                                        <CellStyle ForeColor="#009900">
                                                                        </CellStyle>
                                                                        <FooterCellStyle ForeColor="#009900">
                                                                        </FooterCellStyle>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrReal" VisibleIndex="2" Width="80px">
                                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                        </PropertiesTextEdit>
                                                                        <CellStyle ForeColor="Blue">
                                                                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                        </CellStyle>
                                                                        <FooterCellStyle ForeColor="Blue">
                                                                        </FooterCellStyle>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percReal" VisibleIndex="3" Width="50px">
                                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                        </PropertiesTextEdit>
                                                                        <CellStyle ForeColor="Blue">
                                                                        </CellStyle>
                                                                        <FooterCellStyle ForeColor="Blue">
                                                                        </FooterCellStyle>
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="Diferenças" VisibleIndex="7">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="Valor" FieldName="difVlrRev" VisibleIndex="0" Width="80px">
                                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                        </PropertiesTextEdit>
                                                                        <CellStyle>
                                                                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                        </CellStyle>
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="difPercRev" VisibleIndex="1" Width="50px">
                                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                        </PropertiesTextEdit>
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                        </Columns>
                                                        <SettingsBehavior AllowFocusedRow="True" />
                                                        <SettingsPager Mode="ShowAllRecords">
                                                        </SettingsPager>
                                                        <Settings ShowFooter="True" />
                                                        <SettingsDetail ShowDetailRow="True" />
                                                        <Styles>
                                                            <Header HorizontalAlign="Center">
                                                            </Header>
                                                            <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF">
                                                            </FocusedRow>
                                                            <AlternatingRow BackColor="#EEEEEE">
                                                            </AlternatingRow>
                                                        </Styles>
                                                        <Templates>
                                                            <DetailRow>
                                                                <div style="color:white">Nivel Nota</div>
                                                                <dx:ASPxGridView ID="gridNota" runat="server" AutoGenerateColumns="False" DataSourceID="dsdNota" KeyFieldName="CODIGO" OnBeforePerformDataSelect="gridNota_BeforePerformDataSelect" Theme="Default" Width="100%">
                                                                    <TotalSummary>
                                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="VALOR" SummaryType="Sum" />
                                                                    </TotalSummary>
                                                                    <GroupSummary>
                                                                        <dx:ASPxSummaryItem DisplayFormat="Total: {0:n0}" FieldName="VALOR" ShowInGroupFooterColumn="VALOR" SummaryType="Sum" />
                                                                    </GroupSummary>
                                                                    <Columns>
                                                                        <dx:GridViewCommandColumn ShowClearFilterButton="True" Visible="False" VisibleIndex="0" />
                                                                        <dx:GridViewDataTextColumn FieldName="CODIGO" VisibleIndex="1" Caption="ID" Width="40px">
                                                                            <Settings AutoFilterCondition="Contains" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="AGENDA" VisibleIndex="5" Caption="Agenda" Width="50px">
                                                                            <Settings AutoFilterCondition="Contains" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Descrição da Despesa" FieldName="Descric" ReadOnly="True" VisibleIndex="6">
                                                                            <Settings AutoFilterCondition="Contains" />
                                                                            <CellStyle Wrap="False">
                                                                            </CellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="NOTA" VisibleIndex="7" Caption="Doc / NF" Width="100px">
                                                                            <Settings AutoFilterCondition="Contains" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn FieldName="Observacao" ReadOnly="True" VisibleIndex="8">
                                                                            <Settings AutoFilterCondition="Contains" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataDateColumn Caption="Data" FieldName="DATA" VisibleIndex="10" Width="90px">
                                                                        </dx:GridViewDataDateColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Valor" FieldName="VALOR" VisibleIndex="11" Width="80px">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AutoFilterCondition="Contains" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Centro Custo" FieldName="CCusto" ReadOnly="True" VisibleIndex="12">
                                                                            <Settings AutoFilterCondition="Contains" />
                                                                            <CellStyle Wrap="False">
                                                                            </CellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                    <SettingsBehavior AllowFocusedRow="True" />
                                                                    <Templates>
                                                                        <DetailRow>
                                                                            <dx:ASPxGridView ID="gridNota0" runat="server" AutoGenerateColumns="False" DataSourceID="dsdNota" KeyFieldName="CODIGO" OnBeforePerformDataSelect="gridNota_BeforePerformDataSelect" Theme="Default">
                                                                                <TotalSummary>
                                                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="VALOR" SummaryType="Sum" />
                                                                                </TotalSummary>
                                                                                <GroupSummary>
                                                                                    <dx:ASPxSummaryItem DisplayFormat="Total: {0:n0}" FieldName="VALOR" ShowInGroupFooterColumn="VALOR" SummaryType="Sum" />
                                                                                </GroupSummary>
                                                                                <Columns>
                                                                                    <dx:GridViewCommandColumn ShowClearFilterButton="True" Visible="False" VisibleIndex="0" />
                                                                                    <dx:GridViewDataTextColumn FieldName="CODIGO" VisibleIndex="1">
                                                                                        <Settings AutoFilterCondition="Contains" />
                                                                                    </dx:GridViewDataTextColumn>
                                                                                    <dx:GridViewDataTextColumn FieldName="AGENDA" VisibleIndex="5">
                                                                                        <Settings AutoFilterCondition="Contains" />
                                                                                    </dx:GridViewDataTextColumn>
                                                                                    <dx:GridViewDataTextColumn Caption="Descrição da Despesa" FieldName="Descric" ReadOnly="True" VisibleIndex="6">
                                                                                        <Settings AutoFilterCondition="Contains" />
                                                                                        <CellStyle Wrap="False">
                                                                                        </CellStyle>
                                                                                    </dx:GridViewDataTextColumn>
                                                                                    <dx:GridViewDataTextColumn FieldName="NOTA" VisibleIndex="7">
                                                                                        <Settings AutoFilterCondition="Contains" />
                                                                                    </dx:GridViewDataTextColumn>
                                                                                    <dx:GridViewDataTextColumn FieldName="Observacao" ReadOnly="True" VisibleIndex="8">
                                                                                        <Settings AutoFilterCondition="Contains" />
                                                                                    </dx:GridViewDataTextColumn>
                                                                                    <dx:GridViewDataDateColumn Caption="Data" FieldName="DATA" VisibleIndex="10">
                                                                                    </dx:GridViewDataDateColumn>
                                                                                    <dx:GridViewDataTextColumn Caption="Valor" FieldName="VALOR" VisibleIndex="11">
                                                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                                        </PropertiesTextEdit>
                                                                                        <Settings AutoFilterCondition="Contains" />
                                                                                    </dx:GridViewDataTextColumn>
                                                                                    <dx:GridViewDataTextColumn Caption="Centro Custo" FieldName="CCusto" ReadOnly="True" VisibleIndex="12">
                                                                                        <Settings AutoFilterCondition="Contains" />
                                                                                        <CellStyle Wrap="False">
                                                                                        </CellStyle>
                                                                                    </dx:GridViewDataTextColumn>
                                                                                </Columns>
                                                                                <SettingsBehavior AllowFocusedRow="True" />
                                                                                <SettingsPager Mode="ShowAllRecords">
                                                                                </SettingsPager>
                                                                                <Settings ShowFilterRow="True" ShowFooter="True" ShowGroupFooter="VisibleAlways" ShowGroupPanel="True" />
                                                                                <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
                                                                                <Styles>
                                                                                    <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF">
                                                                                    </FocusedRow>
                                                                                    <AlternatingRow BackColor="#EEEEEE">
                                                                                    </AlternatingRow>
                                                                                </Styles>
                                                                            </dx:ASPxGridView>
                                                                        </DetailRow>
                                                                    </Templates>
                                                                    <SettingsPager Mode="ShowAllRecords">
                                                                    </SettingsPager>
                                                                    <Settings ShowFilterRow="True" ShowFooter="True" ShowGroupFooter="VisibleAlways" ShowGroupPanel="True" />
                                                                    <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
                                                                    <Styles>
                                                                        <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF">
                                                                        </FocusedRow>
                                                                        <AlternatingRow BackColor="#EEEEEE">
                                                                        </AlternatingRow>
                                                                    </Styles>
                                                                    <Paddings PaddingTop="10px" />
                                                                </dx:ASPxGridView>
                                                                <uc1:wucBotaoExcel ID="WucBotaoExcel1" runat="server" CallGridViewID="gridNota" GuiaNome="Despesa Analitica" />
                                                            </DetailRow>
                                                        </Templates>
                                                    </dx:ASPxGridView>
                                                </DetailRow>
                                            </Templates>
                                            <SettingsPager Mode="ShowAllRecords">
                                            </SettingsPager>
                                            <Settings ShowFooter="True" />
                                            <SettingsDetail ShowDetailRow="True" />
                                            <Styles>
                                                <Header HorizontalAlign="Center"></Header>
	                                            <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
	                                            <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>     
                                            </Styles>
                                        </dx:ASPxGridView>
                                        <uc1:wucBotaoExcel runat="server" ID="WucBotaoExcel1" CallGridViewID="gridSub" GuiaNome="Despesa por Subgrupo"  />
                                    </DetailRow>
                                              
                                </Templates>
                            </dx:ASPxGridView>

                            <%--DataSources--%>
                            <asp:SqlDataSource ID="dsGrupoMes" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:gerDespesasConnectionString %>" 
                            
                                SelectCommand="DW.uspBuscarGrupo" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                   
                            <asp:SqlDataSource ID="dsDetail" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:gerDespesasConnectionString %>" 
                                SelectCommand="DW.uspBuscarSubgrupo" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Ano" SessionField="sANO" />
                                    <asp:SessionParameter Name="Mes" SessionField="sMES" />
                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" />
                                    <asp:SessionParameter Name="idGrupo" SessionField="sGRUPO" />
                                </SelectParameters>
                            </asp:SqlDataSource>    
                        
                           <asp:SqlDataSource ID="dsN3" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:gerDespesasConnectionString %>" 
                                SelectCommand="DW.uspBuscarDespesasN3" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Ano" SessionField="sANO" />
                                    <asp:SessionParameter Name="Mes" SessionField="sMES" />
                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" />
                                    <asp:SessionParameter Name="idSubgrupo" SessionField="sSUBGRUPO" />
                                </SelectParameters>
                            </asp:SqlDataSource>                  
                   
                            <asp:SqlDataSource ID="dsdNota" runat="server" 
                                ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="Despesas.uspBuscarDespesasAnaliticas" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Ano" SessionField="sANO" />
                                    <asp:SessionParameter Name="Mes" SessionField="sMES" />
                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" />
                                    <asp:SessionParameter Name="idN3" SessionField="sN3" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                        <asp:Label ID="lblError" runat="server" Text="TESTE"></asp:Label>
                    
                    </dx:PanelContent>

                    

                </PanelCollection>
            </dx:ASPxCallbackPanel>
        </div>

   
    
                    <div id="divGrafico24Meses_UltimaLinha">
                                <dxchartsui:WebChartControl ID="GraficoBuscarConta_TodosAnosMes" runat="server" DataSourceID="dsBuscarConta_TodosAnosMes" Height="400px" Width="1020px" BackColor="Transparent" Visible="False" CrosshairEnabled="True">
                                    <borderoptions color="Silver" />
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="-1">
                                                <label angle="90">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                            </axisx>
                                            <axisy visibleinpanesserializable="-1" visible="False">
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                            <defaultpane backcolor="Transparent" bordervisible="False">
                                            </defaultpane>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
                    <FillStyle><OptionsSerializable>
                    <cc1:SolidFillOptions></cc1:SolidFillOptions>
                    </OptionsSerializable>
                    </FillStyle>

                                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="10">
                                        <margins bottom="0" />
                                    </legend>

                                    <seriesserializable>
                                        <cc1:Series ArgumentDataMember="Ano" Name="Meta" ValueDataMembersSerializable="percMeta" LabelsVisibility="True">
                                            <viewserializable>
                                                <cc1:SplineAreaSeriesView Color="119, 128, 255, 128" MarkerVisibility="True" Transparency="136">
                                                    <markeroptions size="5" BorderVisible="True">
                                                    </markeroptions>
                                                </cc1:SplineAreaSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="False" Angle="90" TextOrientation="BottomToTop">
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
                                                </cc1:PointSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Number" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="Ano" ArgumentScaleType="Qualitative" Name="Realizado" ValueDataMembersSerializable="percReal" LabelsVisibility="True">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Color="175, 30, 144, 255" Transparency="80">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Position="BottomInside">
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
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Number" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                    </seriesserializable>

                    <SeriesTemplate><ViewSerializable>
                    <cc1:SideBySideBarSeriesView></cc1:SideBySideBarSeriesView>
                    </ViewSerializable>
                    <LabelSerializable>
                    <cc1:SideBySideBarSeriesLabel LineVisible="True">
                    <FillStyle><OptionsSerializable>
                    <cc1:SolidFillOptions></cc1:SolidFillOptions>
                    </OptionsSerializable>
                    </FillStyle>
                    <PointOptionsSerializable>
                    <cc1:PointOptions></cc1:PointOptions>
                    </PointOptionsSerializable>
                    </cc1:SideBySideBarSeriesLabel>
                    </LabelSerializable>
                    <LegendPointOptionsSerializable>
                    <cc1:PointOptions></cc1:PointOptions>
                    </LegendPointOptionsSerializable>
                    </SeriesTemplate>

                    <CrosshairOptions><CommonLabelPositionSerializable>
                    <cc1:CrosshairMousePosition></cc1:CrosshairMousePosition>
                    </CommonLabelPositionSerializable>
                    </CrosshairOptions>

                    <ToolTipOptions><ToolTipPositionSerializable>
                    <cc1:ToolTipMousePosition></cc1:ToolTipMousePosition>
                    </ToolTipPositionSerializable>
                    </ToolTipOptions>
                                </dxchartsui:WebChartControl>
                                <asp:SqlDataSource ID="dsBuscarConta_TodosAnosMes" runat="server" ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" SelectCommand="Despesas.uspBuscarConta_TodosAnosMes" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                                        <asp:Parameter DefaultValue="14" Name="idGrupo" Type="Int16" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                        </div>
       
    
    <dx:ASPxPopupControl ID="PopupControl" runat="server" LoadContentViaCallback="OnFirstShow" Theme="Metropolis"
                                PopupElementID="ShowButton" PopupVerticalAlign="Below" PopupHorizontalAlign="WindowCenter" AllowDragging="True"
                          ShowHeader="true" ShowCloseButton="true" Width="900px" Height="115px" 
                         HeaderText="Updatable content" ClientInstanceName="ClientPopupControl" ShowRefreshButton="True" SettingsLoadingPanel-Text="Aguarde. Atualizando&amp;hellip;" SettingsLoadingPanel-Enabled="True">
        <HeaderTemplate>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div id="Grupo" >
                        <dx:ASPxComboBox ID="cboGrupo" runat="server" DataSourceID="dsSecao" TextField="GrupoDesc" ValueField="idGrupo" DropDownRows="15"
                            AutoPostBack="false" ClientSideEvents-ValueChanged="function(s, e) { ClientPopupControl.PerformCallback(); }" >
                        </dx:ASPxComboBox>
                        <asp:SqlDataSource ID="dsSecao" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                            SelectCommand="SELECT idGrupo, GrupoDesc FROM Cadastros.tblCategoriaLinha WHERE idCat = 7 ORDER BY Ordem">
                        </asp:SqlDataSource>
                    </div>
                    <div id="CheckSubgrupo">
                        <dx:ASPxCheckBox ID="chkSubgrupo" runat="server" Checked="false" Text="Sub-grupo" AutoPostBack="true" ></dx:ASPxCheckBox>
                    </div>

                    <div id="Subgrupo">
                        <dx:ASPxComboBox ID="cboSubgrupo" runat="server" DataSourceID="dsSubGrupo" TextField="SubGrupoDesc" ValueField="idSubgrupo" DropDownRows="15" AutoPostBack="false" 
                            ClientSideEvents-SelectedIndexChanged="function(s, e) { ClientPopupControl.PerformCallback(); }" >
                        </dx:ASPxComboBox>
                        <asp:SqlDataSource ID="dsSubGrupo" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="SELECT idSubgrupo, SubGrupoDesc FROM Cadastros.tblCategoriaLinhaDet WHERE (idGrupo = @Grupo) ORDER BY Ordem">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="cboGrupo" Name="Grupo" PropertyName="Value" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                       
                    </div>
                    
                </ContentTemplate>
            </asp:UpdatePanel>           
        </HeaderTemplate>

        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl" runat="server">
  <%--              <div style="vertical-align:middle">
                    The content of this popup control is relevant to: <b> <%= DateTime.Now.ToLongTimeString() %></b>
                     <asp:Label ID="lblDados" runat="server" Text="Label"></asp:Label>
                </div>--%>
                <div>
                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" AutoGenerateColumns="False" DataSourceID="dsDespesaTodasFiliais" Width="900px" KeyFieldName="idFilial">
                       <Columns>
            <dx:GridViewBandColumn Caption="Ano Anterior (AA)" ToolTip="Este quadro exibe informações do ano anterior" VisibleIndex="1">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrRealAA" ReadOnly="True" ToolTip="Valor realizado do ano anterior" VisibleIndex="0" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle>
                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="%" FieldName="percRealAA" ReadOnly="True" ToolTip="Percentual realizado do ano anterior" VisibleIndex="1" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewDataTextColumn FieldName="descConta" FixedStyle="Left" VisibleIndex="0" Caption="Descrição" Width="150px">
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewBandColumn Caption="Ano Atual" ToolTip="Este quadro exibe informações sobre o mês atual" VisibleIndex="3">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrRev" ReadOnly="True" ToolTip="Valor da meta revista de despesa do ano atual" VisibleIndex="0" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle>
                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="%" FieldName="percRev" ReadOnly="True" ToolTip="Percentual da meta revista de despesa do ano atual" VisibleIndex="1" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrReal" ReadOnly="True" ToolTip="Valor realizado do ano atual" VisibleIndex="2" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle>
                            <BorderLeft BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="%" FieldName="percReal" ReadOnly="True" ToolTip="Percentual realizado do ano atual" VisibleIndex="3" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewBandColumn Caption="Diferenças" ToolTip="Este quadro exibe informações de diferença entre meta versus realizado e percentual de crescimento." VisibleIndex="6">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Valor" FieldName="difVlrRev" ReadOnly="True" ToolTip="Diferença entre valor realizado x meta." VisibleIndex="0" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle>
                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="%" FieldName="difPercRev" ReadOnly="True" ToolTip="Diferença entre percentual realizado x meta." VisibleIndex="1" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewBandColumn Caption="Mês Anterior" ToolTip="Este quadro exibe informações sobre o mês anterior" VisibleIndex="2">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrRealMA" ReadOnly="True" ToolTip="Valor realizado do mês anterior. Quando o mês de janeiro estiver selecionado será exibido o mês de Dezembro do ano anterior." VisibleIndex="0" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle>
                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="%" FieldName="percRealMA" ReadOnly="True" ToolTip="Percentual realizado do mês anterior. Quando o mês de janeiro estiver selecionado será exibido o mês de Dezembro do ano anterior." VisibleIndex="1" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewBandColumn Caption="Crescimento" ToolTip="Este quadro exibe informações sobre o crescimento sobre o mês anterior e ano anterior" VisibleIndex="11">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="% AA" FieldName="percCresc" ReadOnly="True" ToolTip="Percentual de crescimento sobre o ano anterior" VisibleIndex="0" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle>
                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="% MA" FieldName="percCrescMA" ReadOnly="True" ToolTip="Percentual de crescimento sobre o mês anterior" VisibleIndex="1" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewBandColumn Caption="Indicadores" ToolTip="Este quadro exibe informações sobre indicadores." VisibleIndex="14">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Func" FieldName="indFunc" ReadOnly="True" ToolTip="Indcador por Funcionário" VisibleIndex="0" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle>
                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Metro" FieldName="indMet" ReadOnly="True" ToolTip="Indicador por metro quadrado de área de venda" VisibleIndex="1" Width="50px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
        </Columns>
                        <SettingsPager Mode="ShowAllRecords"></SettingsPager>
                        <Settings HorizontalScrollBarMode="Visible" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto"  />
                        <Styles>
	        <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
	        <Header HorizontalAlign="Center">
            </Header>
	        <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
            <HeaderPanel HorizontalAlign="Center">
            </HeaderPanel>
        </Styles>
                    </dx:ASPxGridView>

                         <asp:SqlDataSource ID="dsDespesaTodasFiliais" runat="server" ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" SelectCommand="Despesas.uspBuscarGrupo_TodasFiliais" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                <asp:SessionParameter Name="idGrupo"  SessionField="sGRUPO" Type="Int16" />
                                <asp:SessionParameter Name="idTipo" SessionField="sTIPO" Type="Byte"  />
                            </SelectParameters>
                        </asp:SqlDataSource>

                </div>
            </dx:PopupControlContentControl>
        </ContentCollection>

    </dx:ASPxPopupControl>

   <br />

    <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="Database: gerDespesas " Anotacao2="Stored Procedure: DW.uspBuscarGrupo" />

</asp:Content>

