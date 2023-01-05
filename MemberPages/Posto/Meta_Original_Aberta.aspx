<%@ Page Title="Meta Original Aberta dos Postos" Language="VB" MasterPageFile="~/MemberPages/SiteVendasPostos.master" AutoEventWireup="false" CodeFile="Meta_Original_Aberta.aspx.vb" Inherits="MemberPages_Posto_Meta_Original_Aberta" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>



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

      
        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divAno">
        <uc1:wucAno runat="server" ID="cboAno" />
    </div>
    

    <div id="divMes">
        <uc1:wuciListaMes runat="server" ID="cboMes" Visible_Ano="true"  />
    </div>
    
    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

    <div id="divDados">
	        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis"  Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
<Images>
<LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
</Images>

<LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
            <PanelCollection>
                <dx:PanelContent>
                  
                    <dx:ASPxGridView ID="grid" DataSourceID="dsDados" runat="server" AutoGenerateColumns="False" KeyFieldName="idFilial" Theme="SoftOrange">
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>

                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrConveniencia" SummaryType="Sum"  />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLavagem" SummaryType="Sum"  />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrTrocaOleo" SummaryType="Sum"  />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrTotal" SummaryType="Sum"  />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Volume" SummaryType="Sum"  />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrCombustivel" SummaryType="Sum"  />
                    </TotalSummary>

                        <Toolbars>
                            <dx:GridViewToolbar EnableAdaptivity="true">
                                <Items>
                                    <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                                    <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                                    <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                                </Items>
                            </dx:GridViewToolbar>
                        </Toolbars>


                        <Settings ShowFooter="True" />
                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsResizing ColumnResizeMode="Control" />
                        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>

                        <Columns>
                            <dx:GridViewDataTextColumn Caption="Postos" FieldName="descFilial" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="0" Width="200px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Conveniência" FieldName="vlrConveniencia" ShowInCustomizationForm="True" VisibleIndex="4">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Lavagem" FieldName="vlrLavagem" ShowInCustomizationForm="True" VisibleIndex="5">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Troca de Óleo" FieldName="vlrTrocaOleo" ShowInCustomizationForm="True" VisibleIndex="6">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Total" FieldName="vlrTotal" ShowInCustomizationForm="True" ToolTip="Soma de todos as Metas (Combustiveis em R$ + Conveniência + Lavagem + Troca de Óleo)" VisibleIndex="7">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Combustivel" ShowInCustomizationForm="True" VisibleIndex="1">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Litragem" FieldName="Volume" ShowInCustomizationForm="True" ToolTip="Meta de Combustivel por Litragem" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrCombustivel" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                        </Columns>
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#E6F2FF"></AlternatingRow>
                            <Footer Font-Bold="true" ></Footer>
                            	<FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>

                        </Styles>
                    </dx:ASPxGridView>                       
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerMetasConnectionString %>" SelectCommand="Posto.usp_Meta_Venda_Original_Aberta" SelectCommandType="StoredProcedure">
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


