<%@ Page Title="Ranking por Seção" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="VendaPorRegiao.aspx.vb" Inherits="MemberPages_SLV_VendaPorRegiao" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>


<%@ Register src="../../Controles/wucListaLojasComCorporacao.ascx" tagname="wucListaLojasComCorporacao" tagprefix="uc2" %>
<%@ Register Src="~/Controles/wucMercadologicoNew.ascx" TagPrefix="uc1" TagName="wucMercadologicoNew" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>





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
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaVenda" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difMetaVenda_Real" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_VendaMeta" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_VendaReal" SummaryType="Sum" />
                            
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescClientes" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescClientes_Clube" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="perc_Ating" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percConclusao" SummaryType="Custom" />
                            
                        </TotalSummary>

                        <GroupSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAA" ShowInGroupFooterColumn="vlrVendaAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAT" ShowInGroupFooterColumn="vlrVendaAT" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numClienteAA" ShowInGroupFooterColumn="numClienteAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numClienteAT" ShowInGroupFooterColumn="numClienteAT" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numClienteAA_Clube" ShowInGroupFooterColumn="numClienteAA_Clube" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numClienteAT_Clube" ShowInGroupFooterColumn="numClienteAT_Clube" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difValorClientes" ShowInGroupFooterColumn="difValorClientes" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difValorClientes_Clube" ShowInGroupFooterColumn="difValorClientes_Clube" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difValor" ShowInGroupFooterColumn="difValor" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaVenda" ShowInGroupFooterColumn="vlrMetaVenda" SummaryType="Sum" />                            
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difMetaVenda_Real" ShowInGroupFooterColumn="difMetaVenda_Real" SummaryType="Sum" />  
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_VendaMeta" ShowInGroupFooterColumn="percPart_VendaMeta" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_VendaReal" ShowInGroupFooterColumn="percPart_VendaReal" SummaryType="Sum" />                           

                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" ShowInGroupFooterColumn="percCresc" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescClientes" ShowInGroupFooterColumn="percCrescClientes" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescClientes_Clube" ShowInGroupFooterColumn="percCrescClientes_Clube" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="perc_Ating" ShowInGroupFooterColumn="perc_Ating" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percConclusao" ShowInGroupFooterColumn="percConclusao" SummaryType="Custom" />
                            
                        </GroupSummary>


                        <Columns>
                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                <FooterCellStyle BackColor="White">
                                </FooterCellStyle>
                                <GroupFooterCellStyle BackColor="White">
                                </GroupFooterCellStyle>
                            </dx:GridViewCommandColumn>
                            <dx:GridViewBandColumn Caption="Evolução 2014 x 2013" ShowInCustomizationForm="True" VisibleIndex="5" Name="bandComparacao">
                                <HeaderStyle BackColor="#3399FF" ForeColor="White" />
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Em R$" FieldName="difValor" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                        <HeaderStyle BackColor="#3399FF" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Em %" FieldName="percCresc" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                        <HeaderStyle BackColor="#3399FF" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Número de Clientes" ShowInCustomizationForm="True" VisibleIndex="6">
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
                                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescClientes" ShowInCustomizationForm="True" ToolTip="Percentua de Crescimento no Número de Clientes entre esse ano e o ano passado" VisibleIndex="3" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn Caption="idFilial" FieldName="idFilial" ShowInCustomizationForm="True" VisibleIndex="1" Width="50px" Visible="False">
                                <Settings AllowAutoFilter="False" />
                                <FooterCellStyle BackColor="White">
                                </FooterCellStyle>
                                <GroupFooterCellStyle BackColor="White">
                                </GroupFooterCellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Lojas" FieldName="descFilial" ShowInCustomizationForm="True" VisibleIndex="2" Width="200px" FixedStyle="Left">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                <SettingsHeaderFilter Mode="CheckedList">
                                </SettingsHeaderFilter>
                                <CellStyle Wrap="False">
                                </CellStyle>
                                <FooterCellStyle BackColor="White">
                                </FooterCellStyle>
                                <GroupFooterCellStyle BackColor="White">
                                </GroupFooterCellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Vendas R$" ShowInCustomizationForm="True" VisibleIndex="4" Name="bandVendas">
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
                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_VendaReal" ShowInCustomizationForm="True" ToolTip="Percentual de Participação da Venda Realizada  da Loja sobre o Total da Venda Realizada Empresa." VisibleIndex="3" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                        <HeaderStyle BackColor="#3399FF" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Posição Ranking" ShowInCustomizationForm="True" VisibleIndex="12">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="2013" FieldName="posRnkAA" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="True" AutoFilterCondition="NotEqual" AllowHeaderFilter="False" />
                                        <CellStyle Font-Bold="True" HorizontalAlign="Center">
                                        </CellStyle>
                                        <FooterCellStyle BackColor="White">
                                        </FooterCellStyle>
                                        <GroupFooterCellStyle BackColor="White">
                                        </GroupFooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="posRnkAT" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" AutoFilterCondition="NotEqual" AllowHeaderFilter="False" />
                                        <CellStyle HorizontalAlign="Center">
                                            <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                        </CellStyle>
                                        <FooterCellStyle BackColor="White">
                                        </FooterCellStyle>
                                        <GroupFooterCellStyle BackColor="White">
                                        </GroupFooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn Caption="Comparação Evolução Rank. Ano 2014" FieldName="comparacao" ShowInCustomizationForm="True" VisibleIndex="13">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                                <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                <HeaderStyle Wrap="True" />
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                                <FooterCellStyle BackColor="White">
                                </FooterCellStyle>
                                <GroupFooterCellStyle BackColor="White">
                                </GroupFooterCellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Número de Clientes - Clube" ShowInCustomizationForm="True" VisibleIndex="7">
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
                                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescClientes_Clube" ShowInCustomizationForm="True" VisibleIndex="3" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn Caption="Ano de &lt;br&gt; Abertura" FieldName="AnoAbertura" ShowInCustomizationForm="True" VisibleIndex="11">
                                <Settings AllowAutoFilter="False" />
                                <SettingsHeaderFilter Mode="CheckedList">
                                </SettingsHeaderFilter>
                                <CellStyle HorizontalAlign="Center">
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                </CellStyle>
                                <FooterCellStyle BackColor="White">
                                </FooterCellStyle>
                                <GroupFooterCellStyle BackColor="White">
                                </GroupFooterCellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Meta de Venda" ShowInCustomizationForm="True" VisibleIndex="3" Name="bandMetas">
                                <HeaderStyle BackColor="#009900" ForeColor="White" />
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrMetaVenda" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                        <HeaderStyle BackColor="#009900" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPart_VendaMeta" ShowInCustomizationForm="True" ToolTip="Percentual de Participação da Meta de Venda da Loja sobre o Total da Meta de Venda da Empresa." VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                        <HeaderStyle BackColor="#009900" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Dif Meta x Real" FieldName="difMetaVenda_Real" ShowInCustomizationForm="True" VisibleIndex="2">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                        <HeaderStyle BackColor="#009900" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Ating." FieldName="perc_Ating" ShowInCustomizationForm="True" VisibleIndex="3" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" AllowHeaderFilter="False" />
                                        <HeaderStyle BackColor="#009900" ForeColor="White" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="percConclusao" VisibleIndex="4" Caption="Concluido" Width="100px" >
                                        <Settings AllowHeaderFilter="False" AllowAutoFilter="False" />
                                        <DataItemTemplate>
                                            <dx:ASPxProgressBar ID="pb" runat="server" Height="21px" OnDataBound="pb_DataBound" Theme="SoftOrange" 
                                                Value='<%#Eval("percConclusao")%>' Width="80px" DisplayFormatString=" 0.0" >
                                            </dx:ASPxProgressBar>
                                        </DataItemTemplate>
                                        <HeaderStyle BackColor="#009900" ForeColor="White" />
                                        <CellStyle HorizontalAlign="Center">
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                        <FooterCellStyle HorizontalAlign="Center">
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn Caption="Região" FieldName="descRegiao" GroupIndex="0" ShowInCustomizationForm="True" SortIndex="0" SortOrder="Ascending" VisibleIndex="8" Width="200px">
                                <SettingsHeaderFilter Mode="CheckedList">
                                </SettingsHeaderFilter>
                                <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                <CellStyle>
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                </CellStyle>
                                <FooterCellStyle BackColor="White">
                                </FooterCellStyle>
                                <GroupFooterCellStyle BackColor="White">
                                </GroupFooterCellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Regional" FieldName="descRegional" ShowInCustomizationForm="True" VisibleIndex="9" Width="200px">
                                <SettingsHeaderFilter Mode="CheckedList">
                                </SettingsHeaderFilter>
                                <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                <CellStyle>
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                </CellStyle>
                                <FooterCellStyle BackColor="White">
                                </FooterCellStyle>
                                <GroupFooterCellStyle BackColor="White">
                                </GroupFooterCellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn Caption="Cidade" FieldName="Cidade" ShowInCustomizationForm="True" VisibleIndex="10" Width="200px">
                                <Settings AllowAutoFilter="True" AllowHeaderFilter="True" />
                                <SettingsHeaderFilter Mode="CheckedList">
                                </SettingsHeaderFilter>
                                <HeaderStyle BackColor="#FF6600" ForeColor="White" />
                                <CellStyle>
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                </CellStyle>
                                <FooterCellStyle BackColor="White">
                                </FooterCellStyle>
                                <GroupFooterCellStyle BackColor="White">
                                </GroupFooterCellStyle>
                            </dx:GridViewDataTextColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                          <SettingsResizing ColumnResizeMode="Control" />
                        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                          <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                        <Settings ShowFooter="True" VerticalScrollableHeight="400" ShowHeaderFilterButton="True" HorizontalScrollBarMode="Visible" ShowGroupFooter="VisibleAlways" ShowGroupPanel="True" />
                        <FormatConditions>
                            <dx:GridViewFormatConditionIconSet FieldName="perc_Ating" Format="PositiveNegativeTriangles" />
                            <dx:GridViewFormatConditionIconSet FieldName="percCresc" Format="PositiveNegativeArrowsColored" />
                        </FormatConditions>
                        <Styles>
                            <Header HorizontalAlign="Center" Font-Bold="False" ForeColor="Black">
                            </Header>
                            <AlternatingRow BackColor="#DFDFDF">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF66" ForeColor="Blue">
                            </FocusedRow>
                            <Footer Font-Bold="False" BackColor="#FFCC99">
                            </Footer>
                            <GroupFooter BackColor="#CCFFCC">
                            </GroupFooter>
                            <HeaderPanel ForeColor="#333333">
                            </HeaderPanel>
                            <TitlePanel Font-Size="Large">
                            </TitlePanel>
                        </Styles>
                    </dx:ASPxGridView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" SelectCommand="Analises.usp_VendasPorRegiao" SelectCommandType="StoredProcedure">
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

    <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="Servidor: 225  -  Banco: DW_Condor_One" Anotacao2="Stored Procedure: Analises.usp_VendasPorRegiao" />
    
</asp:Content>

