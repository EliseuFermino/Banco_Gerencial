<%@ Page Title="Analise Meta de Venda, Lucro e Margem do Comercial" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Analise_Venda_Lucro_Margem_Comercial.aspx.vb" Inherits="MemberPages_Planejamento_Comercial_Analise_Venda_Lucro_Margem_Comercial" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wucListaSecao.ascx" TagPrefix="uc1" TagName="wucListaSecao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >
        
        #divAno{
            clear:both;
            float: left;
            
        }

        #divMes {
            float: left
        }

        #divSecao{
            float: left
        }

        #divSize {            
            float: left;   
            padding-top: 6px;        
        }

        #divDados{
            clear: both;
            float: left;
            margin-top: 3px;
        }

        #divGrid
        {
            clear: both ;
            float: left;
            margin-top: 5px;
            width: 100%;
        }

        #divBotaoAtualizar {
            float: left;
            margin-left: 10px;
            margin-top: 3px;
            padding-top: 5px;
            padding-left: 2px;
        }

        #divExibirHistorico {
            float: left;
            margin-left: 10px;
            margin-top: 3px;
            padding-top: 5px;
            padding-left: 2px;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divAno" class="BGC_myBorder">
        <uc1:wucAno runat="server" ID="cboAno" />
    </div>

    <div id="divMes">
        <uc1:wuciListaMes runat="server" ID="cboMes" />
    </div>

    <div id="divSecao" class="BGC_myBorder">
        <uc1:wucListaSecao runat="server" ID="cboSecao" />
    </div>

    <div id="divSize" class="BGC_myBorder ">
        <uc1:wucSize runat="server" ID="cboSize"  CallSize="100"/>
    </div>

    <div id="divBotaoAtualizar" class="BGC_myBorder">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="false" Theme="MetropolisBlue"  >
            <ClientSideEvents Click="function(s, e) {
      cbPanel.PerformCallback();
}" />
        </dx:ASPxButton>
    </div>

    <div id="divExibirHistorico">
        <dx:ASPxCheckBox ID="chkExibirHistorico" Text="Exibir os Últimos Três Meses de Histórico"  runat="server" Theme="DevEx" CheckState="Unchecked" >
            <ClientSideEvents CheckedChanged="function(s, e) {
	cbPanel.PerformCallback();
}" />
        </dx:ASPxCheckBox>
    </div>


<div id="divGrid">

    <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="100%" ClientInstanceName="cbPanel"  Images-LoadingPanel-AlternateText="Aguarde. Atualizando" >
        <Images>
        <LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
        </Images>

<LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
        <PanelCollection>
            <dx:PanelContent>

                
                    <dx:ASPxGridView ID="gridDados" runat="server"  AutoGenerateColumns="False"  DataSourceID="SqlDataSource1" Width="100%" EnableTheming="True" Theme="SoftOrange" ClientInstanceName="gridDados" KeyFieldName="idFilial" Visible="false"   >
                        
<EditFormLayoutProperties ColCount="1"></EditFormLayoutProperties>
<SettingsAdaptivity>
<AdaptiveDetailLayoutProperties ColCount="1"></AdaptiveDetailLayoutProperties>
</SettingsAdaptivity>

                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Settings HorizontalScrollBarMode="Visible" ShowFooter="True" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" ShowGroupFooter="VisibleAlways" />

                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" ></SettingsExport>


                            <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="nomeFilial"  Width="200px"  VisibleIndex="0" FixedStyle="Left">
                                <CellStyle Wrap="False">
                                </CellStyle>
                                <FooterCellStyle>
                                    <BorderRight BorderColor="#666666" BorderStyle="Solid" BorderWidth="2px" />
                                </FooterCellStyle>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewBandColumn Caption="Vendas" ShowInCustomizationForm="True" VisibleIndex="1">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="100px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percPart_RealAA" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px" Caption="% Part" ToolTip="Percentual de Participação da Venda do Ano Passado">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrMetaVenda" ShowInCustomizationForm="True" VisibleIndex="2" Width="100px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="#009900" ForeColor="White" />
                                        <CellStyle Font-Bold="True" ForeColor="#009900">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="#009900">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percPart_MetaVenda" ShowInCustomizationForm="True" VisibleIndex="3" Width="60px" Caption="% Part" ToolTip="Percentual de Participação da Meta de Venda">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percCresc_1" ShowInCustomizationForm="True" VisibleIndex="4" Width="70px" Caption="% Cresc" ToolTip="Percentual de Crescimento entre a Meta de Venda e o Realizado do Ano Passado. ">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="#666666" BorderStyle="Dashed" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrVendaProjetada" ShowInCustomizationForm="True" VisibleIndex="5" Width="100px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percPart_Projetada" ShowInCustomizationForm="True" VisibleIndex="6" Width="60px" Caption="% Part" ToolTip="Percentual de Participação da Venda Projetada do Mês Atual">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Lucro Final ( PDV + SellOut )" ShowInCustomizationForm="True" VisibleIndex="10">
                                <HeaderStyle BackColor="Silver" />
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="vlrLucroTotalAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="100px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrMetaLucroTotalAA" ShowInCustomizationForm="True" VisibleIndex="1" Width="100px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="#009900" ForeColor="White" />
                                        <CellStyle Font-Bold="True" ForeColor="#009900">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="#009900">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percCresc_Lucro" ShowInCustomizationForm="True" VisibleIndex="3" Width="70px" Caption="% Cresc" ToolTip="Percentual de Crescimento entre a Meta de Lucro e o Realizado do Ano Passado. ">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn FieldName="vlrLucroTotalMA" ShowInCustomizationForm="True" VisibleIndex="4" Width="100px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="#666666" BorderStyle="Solid" BorderWidth="2px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    
                              
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="% Margem" ShowInCustomizationForm="True" VisibleIndex="11">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="percMargemMeta" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="#009900" ForeColor="White" />
                                        <CellStyle Font-Bold="True" ForeColor="#009900">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="#009900">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percMargemMA" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percMargemAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>

                            

                            

                            <dx:GridViewBandColumn Caption="Histórico de Vendas" ShowInCustomizationForm="True" VisibleIndex="9">
                                <HeaderStyle BackColor="#3366FF" />
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealMA" ShowInCustomizationForm="True" VisibleIndex="0" Width="100px" Visible="False">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="#3366FF" />
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="Blue">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_RealMA" ShowInCustomizationForm="True" ToolTip="Percentual de Participação da Venda do Ultimo Mês Fechado" VisibleIndex="1" Width="60px" Visible="False">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="#3366FF" />
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="Blue">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealMA1" ShowInCustomizationForm="True" VisibleIndex="2" Width="100px" Visible="False">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="#3366FF" />
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="Blue">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_RealMA1" ShowInCustomizationForm="True" VisibleIndex="3" Width="60px" Visible="False">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="#3366FF" />
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="Blue">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealMA2" ShowInCustomizationForm="True" VisibleIndex="4" Width="100px" Visible="False">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="#3366FF" />
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="Blue">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_RealMA2" ShowInCustomizationForm="True" VisibleIndex="5" Width="60px" Visible="False">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="#3366FF" />
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="Blue">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrRealMAVG" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="6" Width="110px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="#3366FF" />
                                        <CellStyle ForeColor="#000099">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="#000099">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_RealMAVG" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="7" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="#3366FF" />
                                        <CellStyle ForeColor="#000099">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="#000099">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>

                            

                            

                        </Columns>

                       <Toolbars>
                                <dx:GridViewToolbar EnableAdaptivity="true" >
                                    <Items>
                                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" />
                                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX"  />
                                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV"  />
                                    </Items>
                                </dx:GridViewToolbar>
                            </Toolbars>
                        
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaVenda" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaProjetada" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMA1" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMA2" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMAVG" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotalAA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaLucroTotalAA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotalMA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_RealAA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_MetaVenda" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_Projetada" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_RealMA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_RealMA1" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_RealMA2" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_RealMAVG" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_1" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Lucro" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemMeta" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemMA" SummaryType="Custom" />
                        </TotalSummary>
                        <FormatConditions>
                            <dx:GridViewFormatConditionIconSet FieldName="percCresc_1" Format="PositiveNegativeArrowsColored" />
                            <dx:GridViewFormatConditionIconSet FieldName="percCresc_Lucro" Format="PositiveNegativeArrowsColored" />
                        </FormatConditions>
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#EBEBEB">
                            </AlternatingRow>
                            <FocusedRow BackColor="Yellow" ForeColor="Blue">
                            </FocusedRow>
                            <Footer Font-Bold="True">
                            </Footer>
                        </Styles>


                    </dx:ASPxGridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" SelectCommand="Comercial.usp_Analise_Meta_Venda_Lucro_Margem" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                            <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                <asp:Label ID="lblError" runat="server" Text="" Visible="true" ></asp:Label>

            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>
                
</div>

</asp:Content>

