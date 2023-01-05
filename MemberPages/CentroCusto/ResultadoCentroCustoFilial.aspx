<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="ResultadoCentroCustoFilial.aspx.vb" Inherits="MemberPages_CentroCusto_ResultaCentroCustoFilial" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divAno {
            float: left;
            margin-left: 2px;
        }

        #divMes {
            float: left;
            margin-left: 5px;
        }

        #divFilial {
            float: left;
            margin-left: 5px;
            margin-top: 2px;
        }

        #divAtualizar {
            float: left;
            margin-left: 5px;
        }

        #divSize {
            float: left;
            margin-left: 5px;
        }

        #divDados {
            clear:both;
            float: left;
            margin-left: 2px;
            width: 100%;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divAno">
        <uc1:wucAno runat="server" ID="cboAno" />
    </div>

    <div id="divMes">
        <uc1:wuciListaMes runat="server" ID="cboMes" />
    </div>

    <div id="divFilial">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
    </div>

    <div id="divSize" >
        <uc1:wucSize runat="server" ID="cboSize" />
    </div>

    <div id="divAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" Theme="Metropolis" AutoPostBack="False">
            <ClientSideEvents Click="function(s, e) {
	cbPanel.PerformCallback();
}" />
        </dx:ASPxButton>
    </div>

    <div id="divDados">

        <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="100%" Theme="Metropolis" ClientInstanceName="cbPanel">
            <PanelCollection>
                <dx:PanelContent runat="server" SupportsDisabledAttributes="both">

                    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsGrid" AutoGenerateColumns="False" KeyFieldName="idSecao" Width="100%" EnableTheming="True" Theme="Moderno">

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
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrImposto" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percImposto" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrReceitaLiquida" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percReceitaLiquida" SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrCMV" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCMV" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargem" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrQuebra" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percQuebra" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargemOperacional" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemOperacional" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDespesa" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percDespesa" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrOperacaoComercial" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percOperacaoComercial" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucro" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percLucro" SummaryType="Custom" />
                        </TotalSummary>
                        <Columns>
                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                            </dx:GridViewCommandColumn>
                            <dx:GridViewBandColumn Caption="Impostos" ShowInCustomizationForm="True" VisibleIndex="4">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrImposto" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percImposto" ShowInCustomizationForm="True" ToolTip="Percentual do Imposto" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Venda" ShowInCustomizationForm="True" VisibleIndex="3">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVenda" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart" ShowInCustomizationForm="True" ToolTip="Percentual de participação da venda por seção sobre a venda total." VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Operação Comercial" ShowInCustomizationForm="True" VisibleIndex="9">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrOperacaoComercial" ShowInCustomizationForm="True" ToolTip="Valor das Operações Comerciais" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percOperacaoComercial" ShowInCustomizationForm="True" ToolTip="Percentual das Operações Comerciais" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Margem Operacional" ShowInCustomizationForm="True" VisibleIndex="10">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrMargemOperacional" ShowInCustomizationForm="True" ToolTip="Valor da Margem Operacional (Receita Liquida - CMV + Operações Comerciais)" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemOperacional" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Operacional " VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Despesas" ShowInCustomizationForm="True" VisibleIndex="11">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="R$" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px" FieldName="vlrDespesa">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px" FieldName="percDespesa">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn Caption="ID" FieldName="idSecao" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="1" Width="30px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Receita Liquida" ShowInCustomizationForm="True" VisibleIndex="5">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrReceitaLiquida" ShowInCustomizationForm="True" ToolTip="Venda - Impostos" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percReceitaLiquida" ShowInCustomizationForm="True" ToolTip="Percentual da Receita Liquida" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="CMV" ShowInCustomizationForm="True" VisibleIndex="6">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrCMV" ShowInCustomizationForm="True" ToolTip="Receita Liquida - Margem + Quebra" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percCMV" ShowInCustomizationForm="True" ToolTip="Percentual do CMV" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Margem" ShowInCustomizationForm="True" VisibleIndex="7">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrMargem" ShowInCustomizationForm="True" ToolTip="Valor de Margem (Lucro)" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percMargem" ShowInCustomizationForm="True" ToolTip="Percentual de Margem (Lucro)" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Quebra" ShowInCustomizationForm="True" VisibleIndex="8">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrQuebra" ShowInCustomizationForm="True" ToolTip="Valor de Quebra (Semestre)" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percQuebra" ShowInCustomizationForm="True" ToolTip="Percentual de Quebra (Semestre)" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn Caption="Seção" FieldName="descSecao" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="2" Width="200px">
                                <Settings AllowHeaderFilter="True" />
                                <SettingsHeaderFilter Mode="CheckedList">
                                </SettingsHeaderFilter>
                                <CellStyle Wrap="False">
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Lucro / Prejuizo" ShowInCustomizationForm="True" VisibleIndex="12">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrLucro" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percLucro" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                        <Settings HorizontalScrollBarMode="Visible" ShowFooter="True" VerticalScrollableHeight="400" VerticalScrollBarMode="Visible" />
                        <Styles>
                            <Header HorizontalAlign="Center" BackColor="#999999" ForeColor="White">
                            </Header>
                            <AlternatingRow BackColor="#E8E8E8">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF66" ForeColor="#0066FF">
                            </FocusedRow>
                            <Footer BackColor="#99FF99" Font-Bold="True" ForeColor="#333333">
                            </Footer>
                        </Styles>
                    </dx:ASPxGridView>

                    <asp:SqlDataSource ID="dsGrid" runat="server" ConnectionString="<%$ ConnectionStrings:SQL18_gerTran_SLV_ConnectionString %>" SelectCommand="Analises.uspResultadoCentroCustoFilial" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>

    </div>

    <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="Database: gerTran_SLV" Anotacao2="Stored Procedure: Analises.uspResultadoCentroCustoFilial " />

</asp:Content>

