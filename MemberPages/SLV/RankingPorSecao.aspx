<%@ Page Title="Ranking por Seção" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="RankingPorSecao.aspx.vb" Inherits="MemberPages_SLV_RankingPorSecao" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>


<%@ Register src="../../Controles/wucListaLojasComCorporacao.ascx" tagname="wucListaLojasComCorporacao" tagprefix="uc2" %>
<%@ Register Src="~/Controles/wucMercadologicoNew.ascx" TagPrefix="uc1" TagName="wucMercadologicoNew" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #ShowButton {
            float: left;
            margin-left: 2px;               
        }

        #divPeriodo {            
            float: left;   
               
        }

        #divBotaoAtualizar {
            float: left;
            margin-left: 5px;
            padding-top: 5px;  
            padding-left: 5px;
        }

        #divFixarCabecalho {
            float: left;
            margin-left: 5px;
            padding-top: 6px; 
        }


        #divDados {
            clear: both;
            float: left;  
            margin-left: 2px; 
            margin-top: 5px;  
            padding-right: 3px;   
            width: 100%;   
        }

        #divMercadologico_Total {
            float: left;           
        }

        #divMercadologico_Departamento {
            float: left;
            margin-left: 15px;
        }

        #divMercadologico_Secao {
            float: left;
            margin-left: 15px;
        }

        #divMercadologico_Grupo {
            float: left;
            margin-left: 15px;
        }

        #divMercadologico_Subgrupo {
            float: left;
            margin-left: 15px;
        }

        #divLista_Departamento {
            clear: both;
            float: left;
        }

        #divLista_Secao {            
            float: left;
            padding-left: 5px;
        }

        #divLista_Grupo {            
            float: left;
            padding-left: 5px;
        }

        #divLista_Subgrupo {            
            float: left;
            padding-left: 5px;
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="ShowButton" class="BGC_myBorder" >
        <uc1:wucMercadologicoNew runat="server" ID="cboMercadologico" />
    </div>

    <div id="divPeriodo" class="BGC_myBorder">
        <uc1:wucListaDiaIniFin runat="server" ID="cboDia" />
    </div>
    

    <div id="divBotaoAtualizar" class="BGC_myBorder">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme ="MetropolisBlue">
            <ClientSideEvents Click="function(s, e) {
	cbPanel.PerformCallback();
}" />
        </dx:ASPxButton>
    </div>

    <div id="divFixarCabecalho">
        <dx:ASPxCheckBox ID="chkFixarCabecalho" runat="server" Theme ="DevEx" Text ="Fixar cabeçalho" Checked="True" CheckState="Checked">
            <ClientSideEvents CheckedChanged="function(s, e) {
	cbPanel.PerformCallback();
}" />
        </dx:ASPxCheckBox>
    </div>
    
    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="100%" ClientInstanceName ="cbPanel" Theme ="Metropolis" SettingsLoadingPanel-Text ="Atualizando...">
<SettingsLoadingPanel Text="Atualizando..."></SettingsLoadingPanel>
            <PanelCollection>
                <dx:PanelContent  runat="server" SupportsDisabledAttributes="both">

                    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" Width="100%" Visible="False" KeyFieldName="idFilial" EnableTheming="True" Theme="Mulberry">
                        <Toolbars>
                            <dx:GridViewToolbar EnableAdaptivity="true">
                                <Items>
                                    <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                                    <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                                    <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação"  />
                                </Items>
                            </dx:GridViewToolbar>
                        </Toolbars>
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAT" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numClienteAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numClienteAT" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numClienteAA_Clube" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numClienteAT_Clube" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difValorClientes" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difValorClientes_Clube" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difValor" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescClientes" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescClientes_Clube" SummaryType="Custom" />
                        </TotalSummary>
                        <Columns>
                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" Visible="False" VisibleIndex="0"/>
                            <dx:GridViewBandColumn Caption="Evolução 2014 x 2013" ShowInCustomizationForm="True" VisibleIndex="7" Name="bandComparacao">
                                <HeaderStyle BackColor="#999999" ForeColor="White" />
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Em R$" FieldName="difValor" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Em %" FieldName="percCresc" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Número de Clientes" ShowInCustomizationForm="True" VisibleIndex="8">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="numClienteAA" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="numClienteAT" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="2" Caption="Dif." FieldName="difValorClientes" ToolTip="Diferença entre o Número de Clientes do ano passado e este ano">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescClientes" ShowInCustomizationForm="True" ToolTip="Percentua de Crescimento no Número de Clientes entre esse ano e o ano passado" VisibleIndex="3">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn Caption="idFilial" FieldName="idFilial" ShowInCustomizationForm="True" VisibleIndex="1" Width="50px" Visible="False">
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Lojas" FieldName="descFilial" ShowInCustomizationForm="True" VisibleIndex="2">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                <SettingsHeaderFilter Mode="CheckedList">
                                </SettingsHeaderFilter>
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Vendas R$" ShowInCustomizationForm="True" VisibleIndex="4" Name="bandVendas" Visible="False">
                                <HeaderStyle BackColor="#3399FF" ForeColor="White" />
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="2013" FieldName="vlrVendaAA" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                        <HeaderStyle BackColor="#3399FF" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="vlrVendaAT" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                        <HeaderStyle BackColor="#3399FF" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Posição Ranking" ShowInCustomizationForm="True" VisibleIndex="5">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="2013" FieldName="posRnkAA" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="True" AutoFilterCondition="NotEqual" AllowHeaderFilter="False" />
                                        <CellStyle Font-Bold="True" HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="posRnkAT" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" AutoFilterCondition="NotEqual" AllowHeaderFilter="False" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn Caption="Comparação Evolução Rank. Ano 2014" FieldName="comparacao" ShowInCustomizationForm="True" VisibleIndex="6">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                <HeaderStyle Wrap="True" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Número de Clientes - Clube" ShowInCustomizationForm="True" VisibleIndex="9">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="numClienteAA_Clube" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EnableFocusedStyle="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="numClienteAT_Clube" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EnableFocusedStyle="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Dif" FieldName="difValorClientes_Clube" ShowInCustomizationForm="True" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EnableFocusedStyle="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescClientes_Clube" ShowInCustomizationForm="True" VisibleIndex="3">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn Caption="Ano de &lt;br&gt; Abertura" FieldName="AnoAbertura" ShowInCustomizationForm="True" VisibleIndex="3">
                                <Settings AllowAutoFilter="False" />
                                <SettingsHeaderFilter Mode="CheckedList">
                                </SettingsHeaderFilter>
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                          <SettingsResizing ColumnResizeMode="Control" />
                        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                          <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                        <Settings ShowFooter="True" VerticalScrollableHeight="400" ShowHeaderFilterButton="True" />
                        <Styles>
                            <Header HorizontalAlign="Center" Font-Bold="False" ForeColor="Black">
                            </Header>
                            <AlternatingRow BackColor="#DFDFDF">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF66" ForeColor="Blue">
                            </FocusedRow>
                            <Footer Font-Bold="False">
                            </Footer>
                            <HeaderPanel ForeColor="#333333">
                            </HeaderPanel>
                            <TitlePanel Font-Size="Large">
                            </TitlePanel>
                        </Styles>
                        <Templates>
                            <DetailRow>
                                <dx:ASPxGridView ID="gridDetail" runat="server" AutoGenerateColumns="False" DataSourceID="dsDetail" EnableTheming="True" OnBeforePerformDataSelect="gridDetail_BeforePerformDataSelect" OnHtmlDataCellPrepared="gridDetail_HtmlDataCellPrepared" OnHtmlRowPrepared="gridDetail_HtmlRowPrepared1" Theme="Office2010Black" Width="650px"  OnLoad="gridDetail_Load" >
                                    <Columns>
                                        <dx:GridViewBandColumn Caption="Clientes" Name="bandCliente" VisibleIndex="2">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="2014" FieldName="numClienteAA" VisibleIndex="0" Width="80px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="2015" FieldName="numClienteAT" VisibleIndex="1" Width="80px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difClientes" VisibleIndex="2" Width="70px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescClientes" VisibleIndex="3" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:GridViewBandColumn>
                                        <dx:GridViewBandColumn Caption="Vendas" Name="bandVenda" VisibleIndex="1">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="2014" FieldName="vlrVendaAA" VisibleIndex="0" Width="90px" Name="fVendaAtual">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="2015" FieldName="vlrVendaAT" VisibleIndex="1" Width="90px" Name="fVendaAnterior">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difVendas" VisibleIndex="2" Width="80px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescVenda" VisibleIndex="3" Width="60px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <CellStyle>
                                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:GridViewBandColumn>
                                        <dx:GridViewDataTextColumn Caption="Seção / Departamento" FieldName="descSecao" VisibleIndex="0" Width="200px">
                                            <CellStyle Wrap="False">
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                    <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                    <SettingsPager Mode="ShowAllRecords">
                                    </SettingsPager>
                                  
                                    <Settings VerticalScrollBarMode="Visible" VerticalScrollableHeight="325" />
                                    <Styles>
                                        <Header HorizontalAlign="Center">
                                        </Header>
                                        <AlternatingRow BackColor="#F3F3F3">
                                        </AlternatingRow>
                                    </Styles>
                                </dx:ASPxGridView>
                                <asp:SqlDataSource ID="dsDetail" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.usp_RankingPorSecaoLoja" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter DbType="Date" Name="DiaInicialAT" SessionField="sDIA_INICIAL" />
                                        <asp:SessionParameter DbType="Date" Name="DiaFinalAT" SessionField="sDIA_FINAL" />
                                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                                        <asp:SessionParameter Name="idMesmosDias" SessionField="sMESMOS" Type="Byte" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </DetailRow>
                        </Templates>
                    </dx:ASPxGridView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.usp_RankingPorSecao" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter DbType="Date" Name="DiaInicial" SessionField="sDIA_INICIAL" />
                            <asp:SessionParameter DbType="Date" Name="DiaFinal" SessionField="sDIA_FINAL" />
                            <asp:SessionParameter Name="idTipo" SessionField="sOPCAO" Type="Byte" />
                            <asp:SessionParameter Name="idMercadologico" SessionField="sMERCADOLOGICO" Type="Int16" />
                            <asp:SessionParameter Name="idMesmosDias" SessionField="sMESMOS" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:Label ID="lblError" runat="server" Text="" ForeColor ="Red" ></asp:Label>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>
    
</asp:Content>

