<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Diferencas_Vendas.aspx.vb" Inherits="MemberPages_Manutencao_Diferencas_Vendas" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divAno {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divMes {            
            float: left;
            margin-left: 10px;
        }

        #divStatusAtualiza{
            float: left;
            margin-left: 10px;
            margin-top: 3px;
        }

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
        }

        #divBotaoExcel {            
            float: left;
            margin-left: 10px;
        }

        #divSize {            
            float: left;           
        }

        #divDados {
            clear: both;
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

    <div id="divStatusAtualiza">
        <dx:ASPxCheckBox ID="chkStatusAtualiza" runat="server" Theme="Mulberry" ClientInstanceName="chkStatusAtualiza" Checked="false" Text="Reprocessa Mês Selecionado" AutoPostBack="false" ></dx:ASPxCheckBox>
    </div>


    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {
cbPanel.PerformCallback();
	chkStatusAtualiza.SetChecked(false);
}" />
        </dx:ASPxButton>
    </div>

    <div id="divBotaoExcel">
        <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="grid" />
    </div>

    <div id="divSize">
        <uc1:wucSize runat="server" ID="cboSize" />
    </div>



    <div id="divDados">
                <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis"  Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
<Images>
<LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
</Images>

<LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
            <PanelCollection>
                <dx:PanelContent>
                    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsDados" AutoGenerateColumns="False" Width="100%">
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
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difItem" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="v5_Dif_v1_v4" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="v7_Dif_v4_v6" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="v9_Dif_v4_v8" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="v11_Dif_v10_v6" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="v13_Dif_v12_v8" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="v15_Dif_v14_v10" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="v17_Dif_v16_v12" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="v19_Dif_v18_v14" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="v21_Dif_v20_v16" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="v23_Dif_v22_v18" SummaryType="Sum" />
                        </TotalSummary>
                        <Columns>
                            <dx:GridViewDataDateColumn FieldName="FilialDesc" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="150px" Caption="Filial" FixedStyle="Left">
                                <HeaderStyle BackColor="Silver" ForeColor="White" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataDateColumn FieldName="Ano" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="50px" FixedStyle="Left">
                                <HeaderStyle BackColor="Silver" ForeColor="White" />
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn FieldName="Mes" ShowInCustomizationForm="True" VisibleIndex="1" Width="40px" ReadOnly="True" FixedStyle="Left">
                                <HeaderStyle BackColor="Silver" ForeColor="White" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Atualização" ShowInCustomizationForm="True" VisibleIndex="12">
                                <HeaderStyle BackColor="#3399FF" ForeColor="White" />
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Dia" FieldName="Atulizacao_Dia" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:dd/MM/yyyy}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Hora" FieldName="Atualizacao_hora" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:t}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Subgrupo" ShowInCustomizationForm="True" VisibleIndex="7">
                                <HeaderStyle Font-Bold="True" />
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Dia &lt;br&gt; 4" FieldName="v4_DW_dbo_Dia_Sub" ShowInCustomizationForm="True" VisibleIndex="0" ToolTip="Origem: DW.dbo.Fact_Venda_Subgrupo_?">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Diferença &lt;br&gt;  ( 4 - 2 ) " FieldName="v5_Dif_v1_v4" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Mes &lt;br&gt; 6" FieldName="v6_DW_dbo_Mes_Sub" ShowInCustomizationForm="True" VisibleIndex="2" ToolTip="Origem: DW.Mes.Fact_Venda_Subgrupo_?">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Diferença &lt;br&gt;  ( 6 - 4 ) " FieldName="v7_Dif_v4_v6" ShowInCustomizationForm="True" VisibleIndex="3">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Grupo" ShowInCustomizationForm="True" VisibleIndex="8">
                                <HeaderStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Dia &lt;br&gt; 8" FieldName="v8_DW_dbo_Dia_Grupo" ShowInCustomizationForm="True" ToolTip="Origem: DW.dbo.Fact_Venda_Grupo_?" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Diferença &lt;br&gt;  ( 8 - 4 ) " FieldName="v9_Dif_v4_v8" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Mes &lt;br&gt; 10" FieldName="v10_DW_dbo_Mes_Grupo" ShowInCustomizationForm="True" ToolTip="Origem: DW.Mes.Fact_Venda_Grupo_?" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Diferença &lt;br&gt;  ( 10 - 6 ) " FieldName="v11_Dif_v10_v6" ShowInCustomizationForm="True" VisibleIndex="3">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Seção " ShowInCustomizationForm="True" VisibleIndex="9">
                                <HeaderStyle Font-Bold="True" />
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Dia &lt;br&gt; 12" FieldName="v12_DW_dbo_Dia_Secao" ShowInCustomizationForm="True" ToolTip="Origem: DW.dbo.Fact_Venda_Secao_?" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Diferença &lt;br&gt;  ( 12 - 8 ) " FieldName="v13_Dif_v12_v8" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Mes &lt;br&gt; 14" FieldName="v14_DW_dbo_Mes_Secao" ShowInCustomizationForm="True" ToolTip="Origem: DW.Mes.Fact_Venda_Secao_?" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Diferença &lt;br&gt;  ( 14 - 10 ) " FieldName="v15_Dif_v14_v10" ShowInCustomizationForm="True" VisibleIndex="3">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Departamento" ShowInCustomizationForm="True" VisibleIndex="10">
                                <HeaderStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Dia &lt;br&gt; 16" FieldName="v16_DW_dbo_Dia_Depto" ShowInCustomizationForm="True" ToolTip="Origem: DW.dbo.Fact_Venda_Depto_?" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Diferença &lt;br&gt;  ( 16 - 12 ) " FieldName="v17_Dif_v16_v12" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Mes &lt;br&gt; 18" FieldName="v18_DW_dbo_Mes_Depto" ShowInCustomizationForm="True" ToolTip="Origem: DW.Mes.Fact_Venda_Depto_?" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Diferença &lt;br&gt;  ( 18 - 14 ) " FieldName="v19_Dif_v18_v14" ShowInCustomizationForm="True" VisibleIndex="3">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Total" ShowInCustomizationForm="True" VisibleIndex="11">
                                <HeaderStyle Font-Bold="True" />
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Dia &lt;br&gt; 20" FieldName="v20_DW_dbo_Dia_Total" ShowInCustomizationForm="True" ToolTip="Origem: DW.dbo.Fact_Venda_Total_?" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Diferença &lt;br&gt;  ( 20 - 16 ) " FieldName="v21_Dif_v20_v16" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Mes &lt;br&gt; 22" FieldName="v22_DW_dbo_Mes_Total" ShowInCustomizationForm="True" ToolTip="Origem: DW.Mes.Fact_Venda_Total_?" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Diferença &lt;br&gt;  ( 22 - 18 ) " FieldName="v23_Dif_v22_v18" ShowInCustomizationForm="True" VisibleIndex="3">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Item" ShowInCustomizationForm="True" VisibleIndex="3">
                                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="gerVendaItem &lt;br&gt; 1" FieldName="gerVendaItem" FixedStyle="Left" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Origem: gerVendaItem.dbo.tblLoja_?" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="DW Fact_Item &lt;br&gt; 2" FieldName="DW_Fact" FixedStyle="Left" ShowInCustomizationForm="True" ToolTip="Origem: DW.dbo.Fact_Store?" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Diferença &lt;br&gt; ( 2 - 1 )" FieldName="difItem" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                         <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                        <Settings HorizontalScrollBarMode="Auto" ShowFooter="True" ShowTitlePanel="True" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" />
                        <SettingsLoadingPanel Text="Atualizando&amp;hellip;" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#F3F3F3">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF66" ForeColor="Blue">
                            </FocusedRow>
                            <Footer Font-Bold="True">
                            </Footer>
                            <TitlePanel Font-Size="X-Large">
                            </TitlePanel>
                        </Styles>
                    </dx:ASPxGridView>                    
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerTempConnectionString %>" SelectCommand="usp_ConsultarDiferencasVendas" SelectCommandType="StoredProcedure" >
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                            <asp:SessionParameter Name="idAtualizar" SessionField="sID_ATUALIZAR" Type="Byte" DefaultValue="0" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>

    <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="Database: gerTemp <br> Stored Procedure: dbo.usp_ConsultarDiferencasVendas" Anotacao2="Atualização Automática as 06:00 pelo job TESTE." />

</asp:Content>

