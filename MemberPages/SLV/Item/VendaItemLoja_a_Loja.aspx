<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="VendaItemLoja_a_Loja.aspx.vb" Inherits="MemberPages_SLV_Item_VendaItemLoja_a_Loja" %>


<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>





<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>
<%@ Register Src="~/Controles/wucProdutoEncontra.ascx" TagPrefix="uc1" TagName="wucProdutoEncontra" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divPeriodo {
            clear: both;
            float: left;
            margin-left: 2px;
            margin-top: 5px;
        }        

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
             margin-top: 12px;
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
            margin-top: 3px;
            width: 100%;
        }

        #divSize {            
            float: left;    
            margin-left: 15px;  
             margin-top: 7px;     
        }

        #divBotaoExcel {            
            float: left;
            margin-left: 10px;
            margin-top: 2px;
        }

        #divQuadrante {            
            margin-top: 8px;            
            width: 600px;
            line-break:normal
        }

        #divProdutos {
            margin-top: 2px;
            float:left;
            width: 530px;
        }


    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divProdutos">
        <uc1:wucProdutoEncontra runat="server" ID="cboProduto" />
    </div>

    <div id="divQuadrante">
    
        <div id="divPeriodo">
            <uc1:wucListaDiaIniFin runat="server" ID="cboPeriodo" />
        </div>

        <div id="divBotaoAtualizar">
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis" Height="15px">
                <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
            </dx:ASPxButton>
        </div>

        <div id="divSize">
            <uc1:wucSize runat="server" ID="cboSize" />
        </div>

        <asp:Button ID="btnAtualiza" runat="server" Text="Button" Visible="false"  />

</div>



    

    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
<SettingsLoadingPanel Text="Aguarde. Atualizando"></SettingsLoadingPanel>
            <PanelCollection>
                <dx:PanelContent>

                    <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="dsDados" KeyFieldName="Descricao" Width="100%" Visible="false">
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
                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" Visible="False" VisibleIndex="0" ShowClearFilterButton="True"/>
                            <dx:GridViewDataTextColumn FieldName="Descricao" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Filial" Width="180px" FixedStyle="Left">
                                <Settings AllowAutoFilter="False" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="vlrLucroComercial" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4" Caption="Lucro" Width="90px">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="percMargem" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5" Caption="% Marg PDV" Width="80px" ToolTip="Percentual Margem PDV">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="PrecoMedio" ShowInCustomizationForm="True" VisibleIndex="6" Caption="Preço Médio" Width="90px" ToolTip="Preço Médio">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                                <HeaderStyle BackColor="#009900" ForeColor="White" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="numCliente" ShowInCustomizationForm="True" VisibleIndex="7" Caption="nº Clientes" Width="80px" ToolTip="Número de Clientes">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewBandColumn Caption="Sell-Out KIT" ShowInCustomizationForm="True" VisibleIndex="10">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Valor" FieldName="LucroSellOut_Kit" ShowInCustomizationForm="True" ToolTip="Valor do Sell-Out Kit" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#CCFF99" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemSOK" ShowInCustomizationForm="True" ToolTip="Percentual do Sell_out Kit" VisibleIndex="1" Width="85px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#CCFF99" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle BackColor="#CCFF99" />
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Sell-Out" ShowInCustomizationForm="True" VisibleIndex="9">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Valor" FieldName="LucroSellOut" ShowInCustomizationForm="True" ToolTip="Valor Sell-Out" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n02}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#FFCC99" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% " FieldName="percMargemSO" ShowInCustomizationForm="True" ToolTip="Percentual Sell-Out" VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#FFCC99" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle BackColor="#FFCC99" />
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Lucro Final" ShowInCustomizationForm="True" VisibleIndex="11">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrLucroFinal" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EnableFocusedStyle="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#82C0FF" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% " FieldName="percMargemFinal" ShowInCustomizationForm="True" ToolTip="Percentual Margem Final" UnboundType="Decimal" VisibleIndex="1" Width="85px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="#82C0FF" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle BackColor="#82C0FF" />
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn Caption="Estoque Qtde" FieldName="Estoque_Qtde" ShowInCustomizationForm="True" VisibleIndex="8" Width="110px">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" />
                                <HeaderStyle BackColor="#CC3300" ForeColor="White" />
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn FieldName="descSuperHiper" ShowInCustomizationForm="True" VisibleIndex="14" Caption="Tipo Loja" Width="180px" >
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn FieldName="Cidade" ShowInCustomizationForm="True" VisibleIndex="15" Caption="Cidade" Width="180px" >
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn FieldName="Regiao" ShowInCustomizationForm="True" VisibleIndex="16" Caption="Região" Width="180px" >
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataTextColumn FieldName="descRegional" ShowInCustomizationForm="True" VisibleIndex="17" Caption="Regional" Width="180px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewBandColumn Caption="Volume (Quantidade)" ShowInCustomizationForm="True" VisibleIndex="2">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Volume AT" FieldName="QtdVendas" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="100px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n3}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Volume AA" FieldName="QtdVendasAA" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n3}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescQtde" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Vendas" ShowInCustomizationForm="True" VisibleIndex="3">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Venda AA" FieldName="vlrVendasAA" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Venda AT" FieldName="vlrVendas" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="105px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle ForeColor="#3333CC">
                                        </CellStyle>
                                        <FooterCellStyle ForeColor="#3333CC">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>

                            <dx:GridViewBandColumn Caption="Perdas - Volume" ShowInCustomizationForm="True" VisibleIndex="13">
                                <HeaderStyle BackColor="#FF9797" />
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Agenda 51" FieldName="QtdeAgenda51" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Agenda 52" FieldName="QtdeAgenda52" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Divergência" FieldName="QtdeDivergencia" ShowInCustomizationForm="True" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Agenda 23" FieldName="QtdeAgenda23" ShowInCustomizationForm="True" VisibleIndex="3">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Total Perda" FieldName="QtdeTotalPerda" ShowInCustomizationForm="True" VisibleIndex="4">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Perdas - Valor" ShowInCustomizationForm="True" VisibleIndex="12">
                                <HeaderStyle BackColor="#D70000" ForeColor="White" />
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Agenda 51" FieldName="vlrAgenda51" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Agenda 52" FieldName="vlrAgenda52" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Divergência" FieldName="vlrDivergencia" ShowInCustomizationForm="True" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Agenda 23" FieldName="vlrAgenda23" ShowInCustomizationForm="True" VisibleIndex="3">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Total Perda" FieldName="vlrTotalPerda" ShowInCustomizationForm="True" VisibleIndex="5">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percQuebra_Vlr" ShowInCustomizationForm="True" VisibleIndex="6">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percAg23_Vlr" ShowInCustomizationForm="True" VisibleIndex="4">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>

                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                        <Settings VerticalScrollableHeight="550" VerticalScrollBarMode="Visible" HorizontalScrollBarMode="Visible" ShowFilterRow="True" ShowGroupPanel="True" ShowFooter="True" />
                        <SettingsText EmptyDataRow="Nenhuma informação disponivel." GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n3}" FieldName="QtdVendasAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n3}" FieldName="QtdVendas" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrVendasAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrVendas" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrLucroComercial" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numCliente" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="LucroSellOut" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="LucroSellOut_Kit" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrLucroFinal" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescQtde" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="PrecoMedio" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSO" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinal" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSOK" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Estoque_Qtde" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAgenda51" SummaryType="Sum" />
	                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAgenda52" SummaryType="Sum" />
	                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAgenda23" SummaryType="Sum" />
	                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeDivergencia" SummaryType="Sum" />
	                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeTotalPerda" SummaryType="Sum" />

	                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAgenda51" SummaryType="Sum" />
	                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAgenda52" SummaryType="Sum" />
	                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAgenda23" SummaryType="Sum" />
	                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrDivergencia" SummaryType="Sum" />
	                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrTotalPerda" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percQuebra_Vlr" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAg23_Vlr" SummaryType="Custom" />
                            

                        </TotalSummary>
                        <FormatConditions>
                            <dx:GridViewFormatConditionIconSet FieldName="percCresc" Format="PositiveNegativeArrowsColored" />
                            <dx:GridViewFormatConditionIconSet FieldName="percCrescQtde" Format="PositiveNegativeArrowsColored" />
                        </FormatConditions>
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#EEEEEE">
                            </AlternatingRow>
                            <FocusedRow BackColor="Yellow" Font-Bold="True" ForeColor="Blue">
                            </FocusedRow>
                            <Footer Font-Bold="True">
                            </Footer>
                        </Styles>
                    </dx:ASPxGridView>
                  
                 <%--Arraste seu controle aqui --%>                         
                    
		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" SelectCommand="uspBuscarVendaItemLoja_a_Loja" SelectCommandType="StoredProcedure" EnableCaching="False" >
                        <SelectParameters>
                            <asp:SessionParameter Name="idProduto" SessionField="sPRODUTO" Type="Int32" />
                            <asp:SessionParameter Name="DiaInicial" SessionField="sDIA_INICIAL" DbType="Date" />
                            <asp:SessionParameter Name="DiaFinal" SessionField="sDIA_FINAL" DbType="Date" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:Label ID="lblInfo" runat="server" Text="" ForeColor="Red"></asp:Label>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>



    <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="Database: gerVendaItem" Anotacao2="dbo.uspBuscarVendaItemLoja_a_Loja" />

</asp:Content>


