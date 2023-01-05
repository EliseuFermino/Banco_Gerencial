<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="MetaAgenda23Mes.aspx.vb" Inherits="MemberPages_Replanejamento_MetaAgenda23Mes" %>

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


    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
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
                    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsDados" AutoGenerateColumns="False" KeyFieldName="idGrupo" Width="100%">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaVenda" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaVendaMA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaAgenda23" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaAgenda23MA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealVenda" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealVenda_M1" SummaryType="Sum" />                            
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealVenda_M2" SummaryType="Sum" /> 
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealVenda_M3" SummaryType="Sum" /> 
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealVenda_M4" SummaryType="Sum" /> 
                                                      
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAg23_2014" SummaryType="Sum" /> 
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAg23_2015" SummaryType="Sum" /> 
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAg23_2016" SummaryType="Sum" /> 

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealVenda2014" SummaryType="Sum" /> 
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealVenda2015" SummaryType="Sum" /> 
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealVenda2016" SummaryType="Sum" /> 
                            
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAgenda23" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAg23_M4" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAg23_M3" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAg23_M2" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAg23_M1" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAg23Media" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAcumAtual" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAg23AcumAtual" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMetaAgenda23" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMetaAgenda23MA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealAgenda23" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealAgenda23_M1" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealAgenda23_M2" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealAgenda23_M3" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealAgenda23_M4" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPerc" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPercMA" SummaryType="Custom" />
                            

                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealAg23_2014" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealAg23_2015" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealAg23_2016" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealAgenda23_Acum" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealAgenda23_Media" SummaryType="Custom" />
                            
                                                        
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

                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="nomeFilial" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="0" Width="200px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Realizado Último 4 Meses" ShowInCustomizationForm="True" VisibleIndex="2">
                                <Columns>
                                    <dx:GridViewBandColumn Caption="M4" ShowInCustomizationForm="True" VisibleIndex="0" Name="band_M4">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrRealAg23_M4" ShowInCustomizationForm="True" VisibleIndex="0" Caption="vlr. Ag. 23">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="% Ag. 23" FieldName="percRealAgenda23_M4" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="M3" ShowInCustomizationForm="True" VisibleIndex="1" Name="band_M3">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrRealAg23_M3" ShowInCustomizationForm="True" VisibleIndex="0" Caption="vlr. Ag. 23">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="% Ag. 23" FieldName="percRealAgenda23_M3" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="M2" ShowInCustomizationForm="True" VisibleIndex="2" Name="band_M2">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrRealAg23_M2" ShowInCustomizationForm="True" VisibleIndex="0" Caption="vlr. Ag. 23">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="% Ag. 23" FieldName="percRealAgenda23_M2" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="M1" ShowInCustomizationForm="True" VisibleIndex="3" Name="band_M1">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrRealAg23_M1" ShowInCustomizationForm="True" VisibleIndex="0" Caption="vlr. Ag. 23">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="% Ag. 23 &lt;br&gt; (4)" FieldName="percRealAgenda23_M1" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="vlr Meta" FieldName="vlrMetaAgenda23MA" ShowInCustomizationForm="True" VisibleIndex="2" Width="90px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#009900" ForeColor="White" />
                                                <CellStyle ForeColor="#009900">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="#009900">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="% Meta &lt;br&gt; (3)" FieldName="percMetaAgenda23MA" ShowInCustomizationForm="True" VisibleIndex="3" Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#009900" ForeColor="White" />
                                                <CellStyle ForeColor="#009900">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="#009900">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="Dif. % &lt;br&gt; (3) - (4)" FieldName="difPercMA" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="4" Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Red" ForeColor="White" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Média - 4 Meses" ShowInCustomizationForm="True" VisibleIndex="6" Name="bandMedia">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Media" FieldName="vlrRealAg23Media" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="1" Caption="% Media" FieldName="percRealAgenda23_Media" Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Acumulado dos 4 Meses" Name="bandAcum" ShowInCustomizationForm="True" VisibleIndex="5">
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Vendas" FieldName="vlrRealAcumAtual" ShowInCustomizationForm="True" VisibleIndex="0">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="vlr. Agenda 23" FieldName="vlrRealAg23AcumAtual" ShowInCustomizationForm="True" VisibleIndex="1">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="% Ag. 23" FieldName="percRealAgenda23_Acum" ShowInCustomizationForm="True" VisibleIndex="2" Width="65px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Meta" ShowInCustomizationForm="True" VisibleIndex="4" Name="bandMeta">
                                <HeaderStyle BackColor="#009900" ForeColor="White" />
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrMetaVenda" ShowInCustomizationForm="True" VisibleIndex="1" Width="100px" Visible="False">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="#009900" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="VendaMA" FieldName="vlrMetaVendaMA" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewBandColumn Name="band_atual_meta" ShowInCustomizationForm="True" VisibleIndex="4">
                                        <HeaderStyle BackColor="#009900" ForeColor="White" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="Agenda 23" FieldName="vlrMetaAgenda23" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#009900" ForeColor="White" />
                                                <CellStyle ForeColor="#009900">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="#009900">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="% Ag23 &lt;br&gt; (1)" FieldName="percMetaAgenda23" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#009900" ForeColor="White" />
                                                <CellStyle ForeColor="#009900">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="#009900">
                                                </FooterCellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn Caption="Dif. % &lt;br&gt; (1) - (2)" FieldName="difPerc" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="5" Width="70px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <HeaderStyle BackColor="Red" ForeColor="White" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Realizado" Name="bandRealizado" ShowInCustomizationForm="True" VisibleIndex="3">
                                <HeaderStyle BackColor="#0066FF" ForeColor="White" />
                                <Columns>
                                    <dx:GridViewBandColumn Name="band_Atual" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <HeaderStyle BackColor="#0066FF" ForeColor="White" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="vlr. Ag. 23" FieldName="vlrRealAgenda23" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#0066FF" ForeColor="White" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn Caption="% Ag. 23 (2)" FieldName="percRealAgenda23" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="#0066FF" ForeColor="White" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                    <dx:GridViewBandColumn Caption="Venda" ShowInCustomizationForm="True" Visible="False" VisibleIndex="8">
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="vlrRealVenda_M1" ShowInCustomizationForm="True" Visible="False" VisibleIndex="6">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="vlrRealVenda_M2" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="vlrRealVenda_M3" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="vlrRealVenda_M4" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="vlrRealVenda2014" ShowInCustomizationForm="True" Visible="False" VisibleIndex="3">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="vlrRealVenda2015" ShowInCustomizationForm="True" Visible="False" VisibleIndex="4">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="vlrRealVenda2016" ShowInCustomizationForm="True" Visible="False" VisibleIndex="5">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                    </dx:GridViewBandColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Anos Anteriores" ShowInCustomizationForm="True" VisibleIndex="1">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="% &lt;br&gt; 2014" FieldName="percRealAg23_2014" ShowInCustomizationForm="True" VisibleIndex="0" Width="65px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="Blue">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% &lt;br&gt; 2015" FieldName="percRealAg23_2015" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="Blue">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% &lt;br&gt; 2016" FieldName="percRealAg23_2016" ShowInCustomizationForm="True" VisibleIndex="2" Width="65px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="Blue">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Auto" ShowFooter="True" ShowTitlePanel="True" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" />
                        <SettingsLoadingPanel Text="Atualizando&amp;hellip;" />
                         <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#F3F3F3">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF66" ForeColor="Blue">
                            </FocusedRow>
                            <Footer Font-Bold="True">
                            </Footer>
                        </Styles>
                    </dx:ASPxGridView>                    
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerMetasConnectionString %>" SelectCommand="usp_MetaAgenda23_Mes" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>

    <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="Database: gerMetas" Anotacao2="Stored Procedure: usp_MetaAgenda23_Mes" />
</asp:Content>

