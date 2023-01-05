<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/SiteVendas.master" AutoEventWireup="false" CodeFile="VendaAcompanhamento_LORD.aspx.vb" Inherits="MemberPages_Vendas_VendaAcompanhamento_LORD" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


    <div id="divBotaoAtualizar">
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis" >
                <ClientSideEvents Click="function(s, e) {	cbPanel.PerformCallback();}" />
            </dx:ASPxButton>
        </div>    

    <br />

    <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde&amp;hellip;">
<SettingsLoadingPanel Text="Aguarde&amp;hellip;"></SettingsLoadingPanel>

                <ClientSideEvents EndCallback="function(s, e) {
		
}" />
                <PanelCollection>
                    <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttributes="both">


                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" 
                    AutoGenerateColumns="False" EnableTheming="True" KeyFieldName="Descricao" 
                    Theme="SoftOrange" style="margin-bottom: 0px" DataSourceID="dsVendaLoja" Width="100%">
                    <TotalSummary>
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealAA" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percDifCresc" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrSugestaoVenda" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaVenda" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealVenda" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAting" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numClientes" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMetaMargem" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargem" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargemSellOut" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargem" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="NumClientes" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaMargem" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMargem" SummaryType="Custom" />

                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealVendaClube" SummaryType="Custom" />
                                
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difLucro" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingLucro" SummaryType="Custom" />                            
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaFunc" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:c}" FieldName="vlrTicketMedio" SummaryType="Custom" />

                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargemClube" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargemSellOutClube" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numClientesClube" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:c}" FieldName="vlrTicketMedioClube" SummaryType="Custom" />

                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaCheckout" 
                            SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaMetragem" 
                            SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRealMargemSellOutKit" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percRealMargemSellOutKit" SummaryType="Custom" />
                    </TotalSummary>
                    <GroupSummary>
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrSugestao" 
                            ShowInGroupFooterColumn="vlrSugestao" SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaVenda" 
                            ShowInGroupFooterColumn="vlrMetaVenda" SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" 
                            ShowInGroupFooterColumn="vlrVenda" SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaLucro" 
                            ShowInGroupFooterColumn="vlrMetaLucro" SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargem" 
                            ShowInGroupFooterColumn="vlrMargem" SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difLucro" 
                            ShowInGroupFooterColumn="difLucro" SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="NumClientes" 
                            ShowInGroupFooterColumn="NumClientes" SummaryType="Sum" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAting" 
                            ShowInGroupFooterColumn="percAting" SummaryType="Custom" />
                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingLucro" 
                            ShowInGroupFooterColumn="percAtingLucro" SummaryType="Custom" />
                    </GroupSummary>
                    <EditFormLayoutProperties ColCount="1">
                    </EditFormLayoutProperties>
                    <Columns>
                        <dx:GridViewBandColumn Caption="Estatísticas - valor médio" VisibleIndex="8" 
                            Name="bandEstatisticas" Visible="False">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Func." FieldName="vlrVendaFunc" 
                                    ToolTip="Valor médio de vendas por funcionários." VisibleIndex="0">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Right"></CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Ticket" FieldName="vlrTicketMedio" 
                                    ToolTip="Valor do ticket médio" VisibleIndex="1">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Right"></CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Check" FieldName="vlrVendaCheckout" ToolTip="Valor médio de vendas por check-out." 
                                    VisibleIndex="2">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EnableFocusedStyle="False"></PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Right"></CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="M2" FieldName="vlrVendaMetragem" ToolTip="Valor da venda por metro quadrado" 
                                    VisibleIndex="3">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Right"></CellStyle>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
                        </dx:GridViewBandColumn>
                        <dx:GridViewBandColumn Caption="% Margem PDV" VisibleIndex="5">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Meta " FieldName="percMetaMargem" 
                                    VisibleIndex="0">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" BackColor="#009900" ForeColor="White" />
                                    <CellStyle ForeColor="#009900">
                                    </CellStyle>
                                    <FooterCellStyle ForeColor="#009900">
                                    </FooterCellStyle>
                                    <GroupFooterCellStyle ForeColor="#009900">
                                    </GroupFooterCellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Real" FieldName="percRealMargem" 
                                    VisibleIndex="1">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" BackColor="#003399" ForeColor="White" />
                                    <CellStyle ForeColor="Blue">
                                    </CellStyle>
                                    <FooterCellStyle ForeColor="Blue">
                                    </FooterCellStyle>
                                    <GroupFooterCellStyle ForeColor="#009900">
                                    </GroupFooterCellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn 
                                    UnboundType="Decimal" VisibleIndex="2" Caption="Dif." 
                                    FieldName="difMargem">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle>
                                        <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Sell Out &lt;br&gt; Kit" FieldName="percRealMargemSellOutKit" VisibleIndex="4">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <CellStyle>
                                        <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
                        </dx:GridViewBandColumn>
                        <dx:GridViewBandColumn Caption="Ano Anterior" VisibleIndex="1">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Real" FieldName="vlrRealAA" ToolTip="Venda do Ano Anterior (mesmo dia da semana)" VisibleIndex="0">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="% de&lt;br&gt;Cresc" FieldName="percDifCresc" VisibleIndex="1" MinWidth="60" Width="80px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:GridViewBandColumn>
                        <dx:GridViewDataTextColumn Caption="Desc." FieldName="Descricao" 
                            VisibleIndex="0" FixedStyle="Left">
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle HorizontalAlign="Left" Wrap="False">
                                <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewBandColumn Caption="Invisivel" Visible="False" VisibleIndex="16">
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="idFilial" ReadOnly="True" 
                                    VisibleIndex="0">
                                </dx:GridViewDataTextColumn>
                            </Columns>
                        </dx:GridViewBandColumn>
                        <dx:GridViewBandColumn Caption="Vendas Financeiras" VisibleIndex="2" 
                            ToolTip="Grupo de vendas financeiras que compreende: Sugestão, Meta, Realizado e Percentual de Atingimento da Venda Realizada sobre a Meta de Venda.">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Sugestão" FieldName="vlrSugestaoVenda" 
                                    VisibleIndex="2" 
                                    ToolTip="Sugestão de vendas calculada com base no hitórico do ano anterior da loja">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle ForeColor="#996600">
                                    </CellStyle>
                                    <FooterCellStyle ForeColor="#996600">
                                    </FooterCellStyle>
                                    <GroupFooterCellStyle ForeColor="#996600">
                                    </GroupFooterCellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMetaVenda" 
                                    VisibleIndex="3" 
                                    ToolTip="Valor da meta revista de venda que foi replanejada.">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" BackColor="#009900" ForeColor="White" />
                                    <CellStyle ForeColor="#009900">
                                    </CellStyle>
                                    <FooterCellStyle ForeColor="#009900">
                                    </FooterCellStyle>
                                    <GroupFooterCellStyle ForeColor="#009900">
                                    </GroupFooterCellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Real" FieldName="vlrRealVenda" 
                                    VisibleIndex="4" ToolTip="Valor da venda realizada.">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" BackColor="#003399" ForeColor="White" />
                                    <CellStyle ForeColor="Blue">
                                    </CellStyle>
                                    <FooterCellStyle ForeColor="Blue">
                                    </FooterCellStyle>
                                    <GroupFooterCellStyle ForeColor="Blue">
                                    </GroupFooterCellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Concluido" FieldName="idStatusAtingMeta_100" ToolTip="Indicador se a Meta de Venda foi atingida."  VisibleIndex="5">
                                       <DataItemTemplate>
                                            <dx:ASPxProgressBar ID="pb" runat="server" Height="21px" OnDataBound="pb_DataBound" Theme="SoftOrange" 
                                                Value='<%#Eval("idStatusAtingMeta_100")%>' Width="80px" DisplayFormatString=" 0.0" >
                                            </dx:ASPxProgressBar>
                                        </DataItemTemplate>                                   
                                    
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="%&lt;br&gt;Atingimento" FieldName="percAting" 
                                    ToolTip="Percentual de atingimento (meta x realizado)" VisibleIndex="6" UnboundType="Decimal">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle>
                                        <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                    </CellStyle>
                                    <FooterCellStyle>
                                        <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                    </FooterCellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Nº de &lt;br&gt; Clientes" FieldName="numClientes" ToolTip="Número de clientes que passou na loja." VisibleIndex="7">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle Wrap="True" HorizontalAlign="Center" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Ticket &lt;br&gt; Médio" FieldName="vlrTicketMedio" ToolTip="Valor do Ticket Médio" UnboundType="Decimal" VisibleIndex="9">
                                    <PropertiesTextEdit DisplayFormatString="{0:c}">
                                    </PropertiesTextEdit>
                                    <CellStyle>
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                    <FooterCellStyle>
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </FooterCellStyle>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <HeaderStyle HorizontalAlign="Center" Font-Bold="True" />
                        </dx:GridViewBandColumn>
                        <dx:GridViewBandColumn Caption="Venda Clube" VisibleIndex="3" 
                                
                            ToolTip="Vendas do Clube Condor" 
                            Name="bcVendaClube">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Real" FieldName="vlrRealVendaClube" 
                                    VisibleIndex="0">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle BackColor="#3399FF" ForeColor="White" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="% Marg &lt;br&gt; PDV" FieldName="percRealMargemClube" ToolTip="Percentual de Margem do PDV" VisibleIndex="1">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle BackColor="#3399FF" ForeColor="White" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="% Marg &lt;br&gt; c/ Sellout" FieldName="percRealMargemSellOutClube" ToolTip="Percentual de Margem com Sell-Out" VisibleIndex="2">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle BackColor="#3399FF" ForeColor="White" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Nº de &lt;br&gt; Clientes" FieldName="numClientesClube" ToolTip="Numero de Clientes" VisibleIndex="3">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                    </PropertiesTextEdit>
                                    <HeaderStyle BackColor="#3399FF" ForeColor="White" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Ticket &lt;br&gt; Médio" FieldName="vlrTicketMedioClube" ToolTip="Valor do Ticket Médio do Clube" VisibleIndex="4">
                                    <PropertiesTextEdit DisplayFormatString="{0:c}">
                                    </PropertiesTextEdit>
                                    <HeaderStyle BackColor="#3399FF" ForeColor="White" />
                                    <CellStyle>
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                    <FooterCellStyle>
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </FooterCellStyle>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <HeaderStyle BackColor="#3399FF" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                        </dx:GridViewBandColumn>
                        <dx:GridViewBandColumn Caption="Lucro" Name="bandLucratividade" ToolTip="Grupo de Lucratividade, exibe o quanto de meta de lucro a loja teve dia por dia. Exibe as colunas de Meta, Realizado, Diferença entre a Meta e o Realizado e o Percentual de Atingimento (Realizado dividido pela Meta)" VisibleIndex="4">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="PDV" FieldName="vlrRealMargem" ToolTip="Valor do realizado do lucro" VisibleIndex="1">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle ForeColor="Blue">
                                    </CellStyle>
                                    <FooterCellStyle ForeColor="Blue">
                                    </FooterCellStyle>
                                    <GroupFooterCellStyle ForeColor="Blue">
                                    </GroupFooterCellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMetaMargem" ToolTip="Valor da meta de lucro" VisibleIndex="0">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle ForeColor="#009900">
                                    </CellStyle>
                                    <FooterCellStyle ForeColor="#009900">
                                    </FooterCellStyle>
                                    <GroupFooterCellStyle ForeColor="#009900">
                                    </GroupFooterCellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="%" FieldName="percAtingLucro" ToolTip="Percentual de atingimento do lucro (Realizado dividido pela Meta)" VisibleIndex="3">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Right">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Dif." FieldName="difLucro" ToolTip="Valor da diferença entre a Meta de Lucro e o Realizado do Lucro." UnboundType="Decimal" VisibleIndex="2">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle HorizontalAlign="Right">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Sell Out &lt;br&gt; Kit" FieldName="vlrRealMargemSellOutKit" VisibleIndex="4">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <CellStyle>
                                        <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" />
                        </dx:GridViewBandColumn>
                        <dx:GridViewBandColumn Caption="% Margem Final" VisibleIndex="6">
                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Meta" FieldName="percMetaMargemFinal" ToolTip="Meta" VisibleIndex="0">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle BackColor="#009900" ForeColor="White" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Real" FieldName="percRealMargemSellOut" ToolTip="Margem com Sell-Out" VisibleIndex="1">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle BackColor="#003399" ForeColor="White" HorizontalAlign="Center" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Dif." FieldName="difMargemFinal" VisibleIndex="2">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <HeaderStyle BackColor="#666666" />
                        </dx:GridViewBandColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                    <SettingsAdaptivity AdaptivityMode="HideDataCells">
                        <AdaptiveDetailLayoutProperties ColCount="1">
                        </AdaptiveDetailLayoutProperties>
                    </SettingsAdaptivity>
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                    <Settings VerticalScrollableHeight="430" 
                        ShowGroupFooter="VisibleAlways" ShowVerticalScrollBar="True" 
                        ShowFooter="False" HorizontalScrollBarMode="Visible" />
                    <SettingsDataSecurity AllowEdit="False" AllowInsert="False" />
                    <SettingsText EmptyDataRow="Não há vendas realizadas para este dia." />
                    <FormatConditions>
                        <dx:GridViewFormatConditionIconSet FieldName="percDifCresc" Format="PositiveNegativeArrowsColored" ShowInColumn="% de&lt;br&gt;Cresc" />

                    </FormatConditions>
                    <Styles>
	                    <FocusedRow BackColor="#66ffff" ForeColor="#0066FF" Font-Bold="true"> </FocusedRow>
	                    <Header HorizontalAlign="Center">
                        </Header>
	                    <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                        <Footer Font-Bold="True">
                        </Footer>
                    </Styles>

                </dx:ASPxGridView>

                <asp:SqlDataSource ID="dsVendaLoja" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                    SelectCommand="Vendas.uspBuscarVendaAcompanhamento" 
                    SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:SessionParameter Name="dia" SessionField="sDIA" DbType="Date" />
                                
                    </SelectParameters>
                </asp:SqlDataSource>


                    </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>

</asp:Content>

