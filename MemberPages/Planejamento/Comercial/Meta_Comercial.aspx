<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Meta_Comercial.aspx.vb" Inherits="MemberPages_Planejamento_Comercial_Meta_Comercial" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wuciListaMesPeriodo.ascx" TagPrefix="uc1" TagName="wuciListaMesPeriodo" %>
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
            margin-left: 5px;
        }

        #divBotaoAtualizar {            
            float: left;
            margin-left: 5px;
            padding-left: 4px;
            padding-top: 6px;
        }


        #divSize {            
            float: left;   
            padding-top: 2px;  
            margin-left: 5px;      
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
            margin-right: 2px;
            margin-top: 2px;
            width: 100%;
        }

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divAno" class="BGC_myBorder ">
        <uc1:wucAno runat="server" ID="cboAno" />
    </div>

    <div id="divMes">
        <uc1:wuciListaMes runat="server" ID="cboMes" />
    </div>


    <div id="divBotaoAtualizar" class="BGC_myBorder ">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="MetropolisBlue">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

    <div id="divSize" class="BGC_myBorder ">
        <uc1:wucSize runat="server" ID="cboSize" />
    </div>

    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
<SettingsLoadingPanel Text="Aguarde. Atualizando"></SettingsLoadingPanel>
            <PanelCollection>
                <dx:PanelContent>
                    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="dsDados" AutoGenerateColumns="False" KeyFieldName="idSecao" Width="100%"  Theme="SoftOrange">
                        <Toolbars>
                            <dx:GridViewToolbar EnableAdaptivity="true">
                                <Items>
                                    <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar Excel - XLS" />
                                    <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar Excel - XLSX" />
                                    <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar CSV" />
                                </Items>
                            </dx:GridViewToolbar>
                        </Toolbars>
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaVenda" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difVendas" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargem" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotal" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difLucro" SummaryType="Sum" />

                           
                      
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difSellOut" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingVendas" SummaryType="Custom" /> 
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingLucro" SummaryType="Custom" />                             
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinal" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPercMargem" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingMetaVenda" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingMetaLucro" SummaryType="Custom" />
                          
                        </TotalSummary>
                        <GroupSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaVenda" ShowInGroupFooterColumn="vlrMetaVenda" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" ShowInGroupFooterColumn="vlrVenda" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difVendas" ShowInGroupFooterColumn="difVendas" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargem" ShowInGroupFooterColumn="vlrMargem" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotal" ShowInGroupFooterColumn="vlrLucroTotal"  SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difLucro" ShowInGroupFooterColumn="difLucro" SummaryType="Sum" />

                   
                          
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difSellOut" ShowInGroupFooterColumn="difSellOut" SummaryType="Sum" />

                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingVendas" ShowInGroupFooterColumn="percAtingVendas" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingLucro" ShowInGroupFooterColumn="percAtingLucro" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" ShowInGroupFooterColumn="percMargem" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinal" ShowInGroupFooterColumn="percMargemFinal"  SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPercMargem" ShowInGroupFooterColumn="difPercMargem"  SummaryType="Custom" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingMetaVenda" ShowInGroupFooterColumn="percAtingMetaVenda"  SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingMetaLucro" ShowInGroupFooterColumn="percAtingMetaLucro"  SummaryType="Custom" />
                         
                            
                        </GroupSummary>

                        <Columns>
                            <dx:GridViewBandColumn Caption="Lucro Final" ShowInCustomizationForm="True" VisibleIndex="6">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMargem" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Valor do Lucro Final - (PDV + SellOut)" VisibleIndex="0" Width="100px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="#009900">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="#009900">
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                        <GroupFooterCellStyle ForeColor="#009900">
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </GroupFooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrLucroTotal" ShowInCustomizationForm="True" VisibleIndex="1" Width="100px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="Blue">
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                        <GroupFooterCellStyle ForeColor="Blue">
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </GroupFooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difLucro" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="2" Width="100px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                        <GroupFooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </GroupFooterCellStyle>
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn VisibleIndex ="3" Caption="Atingimento"  >
                                        <DataItemTemplate>
                                        <dx:ASPxProgressBar ID="pb" runat="server" Height="21px" OnDataBound="pb_DataBound" Theme="SoftOrange" 
                                                        Value='<%#Eval("percAtingLucro")%>' Width="80px" DisplayFormatString=" 0.0" >

                                        </dx:ASPxProgressBar>                                                
                                    </DataItemTemplate>                                      

                                    </dx:GridViewDataTextColumn>


                                    <dx:GridViewDataTextColumn Caption="% Ating" FieldName="percAtingMetaLucro" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="4" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>


                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="% Margem Final" ShowInCustomizationForm="True" VisibleIndex="7">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Meta" FieldName="percMargem" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Final - (PDV + SellOut)" VisibleIndex="0" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="#009900">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="#009900">
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                        <GroupFooterCellStyle ForeColor="#009900">
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </GroupFooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Realizado" FieldName="percMargemFinal" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="Blue">
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                        <GroupFooterCellStyle ForeColor="Blue">
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </GroupFooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difPercMargem" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="2" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn FieldName="Ano" ShowInCustomizationForm="True" VisibleIndex="8" Width="80px">
                          
                            </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="descProdutoDeptoLista" ShowInCustomizationForm="True" Caption="Departmento" VisibleIndex="0" ToolTip="Departamento" FixedStyle="Left" GroupIndex="0" SortIndex="0" SortOrder="Ascending" Width="100px">
</dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="descProdutoSecaoLista" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Seção" FixedStyle="Left" Width="200px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="idSecao" ShowInCustomizationForm="True" VisibleIndex="10" SortIndex="1" SortOrder="Ascending" Visible="False">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Comprador" FieldName="nomComprador" ShowInCustomizationForm="True" VisibleIndex="2" FixedStyle="Left" Width="100px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Gestor" FieldName="nomGestor" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" FixedStyle="Left" Width="100px">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Venda" ShowInCustomizationForm="True" VisibleIndex="4">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMetaVenda" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="110px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="#009900">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="#009900">
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                        <GroupFooterCellStyle ForeColor="#009900">
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </GroupFooterCellStyle>
                                    </dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="vlrVenda" ShowInCustomizationForm="True" Caption="Realizado" VisibleIndex="1" Width="110px">
<PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
    <CellStyle ForeColor="Blue">
    </CellStyle>
    <FooterCellStyle ForeColor="Blue">
        <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
    </FooterCellStyle>
    <GroupFooterCellStyle ForeColor="Blue">
        <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
    </GroupFooterCellStyle>
</dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difVendas" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="2" Width="100px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                        <GroupFooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </GroupFooterCellStyle>
                                    </dx:GridViewDataTextColumn>

                                     <dx:GridViewDataTextColumn VisibleIndex ="3" Caption="Atingimento"  >
                                        <DataItemTemplate>
                                            <dx:ASPxProgressBar ID="pb" runat="server" Height="21px" OnDataBound="pb_DataBound" Theme="SoftOrange" 
                                                            Value='<%#Eval("percAtingVendas")%>' Width="80px" DisplayFormatString=" 0.0" >

                                            </dx:ASPxProgressBar>                                                
                                        </DataItemTemplate>                                      

                                    </dx:GridViewDataTextColumn>



                                    <dx:GridViewDataTextColumn Caption="% Ating" FieldName="percAtingMetaVenda" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="4" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>



                                </Columns>
                            </dx:GridViewBandColumn>

                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" AutoExpandAllGroups="True" AllowEllipsisInText="True" />
<SettingsAdaptivity AdaptivityMode="HideDataCellsWindowLimit" HideDataCellsAtWindowInnerWidth="780" AllowOnlyOneAdaptiveDetailExpanded="true" AdaptiveDetailColumnCount="2"></SettingsAdaptivity>

                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings HorizontalScrollBarMode="Visible" ShowFooter="True" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" ShowGroupFooter="VisibleAlways" ShowGroupPanel="True" />
                        <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
                        <SettingsLoadingPanel Text="Atualizando&amp;hellip;" />
                        <SettingsResizing ColumnResizeMode="Control" />
                        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" FileName="Meta Comercial" Landscape="true"  ></SettingsExport>
                        <FormatConditions>
                            <dx:GridViewFormatConditionIconSet FieldName="percAtingMetaVenda" Format="PositiveNegativeArrowsColored" />
                            <dx:GridViewFormatConditionIconSet FieldName="difPercMargem" Format="PositiveNegativeArrowsColored" />
                            <dx:GridViewFormatConditionIconSet FieldName="percAtingMetaLucro" Format="PositiveNegativeArrowsColored" />
                        </FormatConditions>
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#EFEFEF">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF66" ForeColor="Blue">
                            </FocusedRow>
                            <Footer Font-Bold="True" BackColor="#CCCCCC">
                            </Footer>
                            <GroupFooter Font-Bold="True">
                            </GroupFooter>
                        </Styles>
                    </dx:ASPxGridView>                    
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerBIConnectionString %>" SelectCommand="Comercial.usp_Buscar_Meta_Comercial" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                            <asp:SessionParameter Name="Mes_Final" SessionField="sMES_FINAL" Type="Byte" />
                            <asp:SessionParameter Name="idTipoLista" SessionField="sTIPO_LISTA" Type="Byte" DefaultValue="0" />
                            <asp:SessionParameter Name="Matricula" SessionField="sMATRICULA" Type="String" DefaultValue="0" />                            
                        </SelectParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>

    <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="BANCO: 225 - gerBI" Anotacao2="StoredProcedure: Comercial.usp_Buscar_Meta_Comercial" />


</asp:Content>


