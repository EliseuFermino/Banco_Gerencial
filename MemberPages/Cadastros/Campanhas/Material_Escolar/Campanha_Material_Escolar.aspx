<%@ Page Title="Material Escolar - Campanha" Language="VB" MasterPageFile="~/Site.master" AutoEventWireup="false" CodeFile="Campanha_Material_Escolar.aspx.vb" Inherits="Campanha_Material_Escolar" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts.Web" tagprefix="dx" %>

<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="dx" %>
<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

   
    <link href="../../../css/myCSS.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divAno" style="margin-left: 10px; margin-top: 5px;">
        <uc1:wucAno runat="server" ID="cboAno" />
             
    </div>
    
    <div class="Bloco">       


        <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" Theme="SoftOrange" Width="100%">
            <TabPages>

                <dx:TabPage Text="Participação">
                    <ContentCollection>
                        <dx:ContentControl runat="server">

    <dx:ASPxGridView ID="gridParticipacao" runat="server" AutoGenerateColumns="False" DataSourceID="dsParticipacao" EnableTheming="True" Theme="SoftOrange" Width="100%" KeyboardSupport="True" KeyFieldName="DateAbrev1">
        <SettingsPager Mode="ShowAllRecords">
        </SettingsPager>
        <Settings ShowFooter="True" ShowTitlePanel="True" VerticalScrollableHeight="450" VerticalScrollBarMode="Visible" HorizontalScrollBarMode="Auto" ShowGroupFooter="VisibleAlways" />
        <SettingsBehavior AllowFocusedRow="True" AutoExpandAllGroups="True" />
        <SettingsResizing ColumnResizeMode="Control" />
        <SettingsDataSecurity AllowEdit="False" AllowInsert="False" />
        <SettingsText HeaderFilterShowAll="Todos Grupos" />
        <Columns>
            <dx:GridViewCommandColumn Visible="False" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="-&gt; " FieldName="descSemana" ShowInCustomizationForm="True" VisibleIndex="1" Width="200px" FixedStyle="Left" ReadOnly="True" SortIndex="0" SortOrder="Ascending" GroupIndex="0">
                <Settings AllowHeaderFilter="False" AutoFilterCondition="Contains"  />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn Caption="Período" FieldName="DateAbrev1" ShowInCustomizationForm="True" VisibleIndex="2" Width="100px">
                <Settings AllowAutoFilter="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewBandColumn Caption="2017" ShowInCustomizationForm="True" VisibleIndex="3" Name="gridParticipacao_AA">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVendaAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPartVendaAA" ShowInCustomizationForm="True" ToolTip="Percentual de Atingimento" VisibleIndex="1" Width="75px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                        <CellStyle Font-Bold="False">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewBandColumn Caption="2018" ShowInCustomizationForm="True" VisibleIndex="4" Name="gridParticipacao_AT">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle ForeColor="#009900">
                        </CellStyle>
                        <FooterCellStyle ForeColor="#009900">
                        </FooterCellStyle>
                        <GroupFooterCellStyle ForeColor="#009900">
                        </GroupFooterCellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrVendaAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <CellStyle ForeColor="Blue">
                        </CellStyle>
                        <FooterCellStyle ForeColor="Blue">
                        </FooterCellStyle>
                        <GroupFooterCellStyle ForeColor="Blue">
                        </GroupFooterCellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Dif. M x R" FieldName="difMeta" ShowInCustomizationForm="True" VisibleIndex="2" Width="90px" ToolTip="Diferença Meta x Realizado">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <HeaderStyle BackColor="#009900" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="% Ating" FieldName="percAtingMeta" ShowInCustomizationForm="True" ToolTip="% de Atingimento de Meta" VisibleIndex="3" Width="65px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <HeaderStyle BackColor="#009900" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPartVendaAT" ShowInCustomizationForm="True" VisibleIndex="4" Width="65px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
                    
            
            <dx:GridViewBandColumn Caption="2017 x 2018" ShowInCustomizationForm="True" VisibleIndex="5" Name="gridParticipacao_Diferenca">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difVenda" ShowInCustomizationForm="True" ToolTip="Diferença entre o Ano de 2018 e 2017" VisibleIndex="0" Width="90px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="% Cresc." FieldName="percCresc" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
                    
            
            <dx:GridViewBandColumn Caption="Participação Acumulada" ShowInCustomizationForm="True" VisibleIndex="7">
                <HeaderStyle BackColor="Gray" />
                <Columns>
                    <dx:GridViewDataTextColumn Caption="2017" FieldName="running_percPartVendaAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="75px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <HeaderStyle BackColor="Gray" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="2018" FieldName="running_percPartVendaAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="75px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <HeaderStyle BackColor="Gray" />
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
                    
            
            <dx:GridViewBandColumn Caption="Venda Acumulada" ShowInCustomizationForm="True" VisibleIndex="6">
                <HeaderStyle BackColor="Gray" />
                <Columns>
                    <dx:GridViewDataTextColumn Caption="2017" FieldName="running_vlrVendaAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <HeaderStyle BackColor="Gray" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="2018" FieldName="running_vlrVendaAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <HeaderStyle BackColor="Gray" />
                        <CellStyle ForeColor="Blue">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="running_percCrescVenda" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento da Venda Acumulada" VisibleIndex="2" Width="70px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <HeaderStyle BackColor="Gray" />
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
                    
            
        </Columns>
        <TotalSummary>          
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAA" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAT" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difMeta" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartVendaAA" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartVendaAT" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingMeta" SummaryType="Custom" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difVenda" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />
        </TotalSummary>
      
        <GroupSummary>
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAA" ShowInGroupFooterColumn="vlrVendaAA" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAT" ShowInGroupFooterColumn="vlrVendaAT" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta" ShowInGroupFooterColumn="vlrMeta" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difMeta" ShowInGroupFooterColumn="difMeta" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartVendaAA" ShowInGroupFooterColumn="percPartVendaAA" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartVendaAT" ShowInGroupFooterColumn="percPartVendaAT" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingMeta" ShowInGroupFooterColumn="percAtingMeta" SummaryType="Custom" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difVenda" ShowInGroupFooterColumn="difVenda" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" ShowInGroupFooterColumn="percCresc" SummaryType="Custom" />
            
        </GroupSummary>
      
        <Styles>
            <Header HorizontalAlign="Center">
            </Header>
            <GroupRow BackColor="#FF8B3E" Font-Bold="False" ForeColor="White">
            </GroupRow>
            <AlternatingRow BackColor="#E1E1E1">
            </AlternatingRow>
            <FocusedRow BackColor="Yellow" ForeColor="Blue">
            </FocusedRow>
            <Footer Font-Bold="True" BackColor="#CCFF99">
            </Footer>
            <GroupFooter Font-Bold="True">
            </GroupFooter>
        </Styles>
    </dx:ASPxGridView>

    <asp:SqlDataSource ID="dsParticipacao" runat="server" ConnectionString="<%$ ConnectionStrings:gerTempConnectionString %>" SelectCommand="Campanhas.uspBuscar_Acompanhamento_Dia" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />                    
        </SelectParameters>
    </asp:SqlDataSource>


                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>

                <dx:TabPage Text="Comparativo por Categoria">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
      

    <dx:ASPxGridView ID="grid_Principal" runat="server" AutoGenerateColumns="False" DataSourceID="dsSubgrupo" EnableTheming="True" Theme="SoftOrange" Width="100%" KeyboardSupport="True" KeyFieldName="idProdutoSubgrupo">
        <SettingsPager Mode="ShowAllRecords">
        </SettingsPager>
        <Settings ShowFooter="True" ShowTitlePanel="True" VerticalScrollableHeight="450" VerticalScrollBarMode="Visible" HorizontalScrollBarMode="Auto" ShowFilterRow="True" ShowGroupPanel="True" />
        <SettingsBehavior AllowFocusedRow="True" />
        <SettingsResizing ColumnResizeMode="Control" />
        <SettingsText HeaderFilterShowAll="Todos Grupos" GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
        <Columns>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" Visible="False" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="Descrição" FieldName="descCategoria" ShowInCustomizationForm="True" VisibleIndex="2" Width="200px" FixedStyle="Left" ReadOnly="True">
                <Settings AllowHeaderFilter="False" AutoFilterCondition="Contains" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewBandColumn Caption="Volume" ShowInCustomizationForm="True" VisibleIndex="4">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="2017" FieldName="QtdeAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="2018" FieldName="QtdeAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difQtde" ShowInCustomizationForm="True" VisibleIndex="2" Width="75px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc_Qtde" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento" VisibleIndex="3" Width="65px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewBandColumn Caption="Vendas" ShowInCustomizationForm="True" VisibleIndex="5">
                <HeaderStyle BackColor="#3366FF" />
                <Columns>
                    <dx:GridViewDataTextColumn Caption="2017" FieldName="vlrVendaAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="2018" FieldName="vlrVendaAT" ShowInCustomizationForm="True" VisibleIndex="1" SortIndex="0" SortOrder="Descending" Width="90px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                        <CellStyle ForeColor="Blue">
                        </CellStyle>
                        <FooterCellStyle ForeColor="Blue">
                        </FooterCellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difVenda" ShowInCustomizationForm="True" VisibleIndex="2" Width="75px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc_Venda" ShowInCustomizationForm="True" VisibleIndex="3" Width="75px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewBandColumn Caption="Part. das Vendas" ShowInCustomizationForm="True" ToolTip="Participação das Vendas" VisibleIndex="7">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="2017" FieldName="percPart_VendasAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="2018" FieldName="percPart_VendasAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewBandColumn Caption="Lucro PDV" ShowInCustomizationForm="True" VisibleIndex="10">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="2017" FieldName="vlrLucroComercialAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="2018" FieldName="vlrLucroComercialAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difLucroPDV" ShowInCustomizationForm="True" VisibleIndex="2" Width="75px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc_LucroPDV" ShowInCustomizationForm="True" VisibleIndex="3" Width="65px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewBandColumn Caption="Lucro Final" ShowInCustomizationForm="True" VisibleIndex="11">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="2017" FieldName="vlrLucroTotalAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="2018" FieldName="vlrLucroTotalAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difLucroTotal" ShowInCustomizationForm="True" VisibleIndex="2" Width="75px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc_LucroTotal" ShowInCustomizationForm="True" VisibleIndex="3" Width="65px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewBandColumn Caption="Margem PDV" VisibleIndex="8">
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="percMargemPDV_AA" VisibleIndex="0" Caption="2017" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="percMargemPDV_AT" VisibleIndex="1" Caption="2018" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="difMargemPDV" UnboundType="Decimal" VisibleIndex="2" Caption="Diferença" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewBandColumn Caption="Margem Total" VisibleIndex="9">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="2017" FieldName="percMargemTotal_AA" VisibleIndex="0" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="2018" FieldName="percMargemTotal_AT" VisibleIndex="1" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difMargemTotal" UnboundType="Decimal" VisibleIndex="2" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewDataTextColumn Caption="Rank" FieldName="rnk" ShowInCustomizationForm="True" ToolTip="Ranking" VisibleIndex="3" Width="50px">
                <PropertiesTextEdit DisplayFormatString="{0:n0}º" EncodeHtml="False">
                </PropertiesTextEdit>
                <Settings AutoFilterCondition="Contains" AllowAutoFilter="False" />
                <CellStyle Font-Bold="True" HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Grupo" FieldName="descGrupo" VisibleIndex="1" Width="200px" FixedStyle="Left" ReadOnly="True">
                <Settings AllowHeaderFilter="True" AutoFilterCondition="Contains" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewBandColumn Caption="Preço Médio" VisibleIndex="6">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="2017" FieldName="precoMedioAA" UnboundType="Decimal" VisibleIndex="0" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="2018" FieldName="precoMedioAT" UnboundType="Decimal" VisibleIndex="1" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc_precoMedio" ToolTip="Percentual de Crescimento" UnboundType="Decimal" VisibleIndex="2" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
        </Columns>
        <TotalSummary>
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAA" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAT" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difQtde" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAA" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAT" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difVenda" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercialAA" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercialAT" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difLucroPDV" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotalAA" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotalAT" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difLucroTotal" SummaryType="Sum" />
                        
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_VendasAA" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_VendasAT" SummaryType="Sum" />            

            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Venda" SummaryType="Custom" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Qtde" SummaryType="Custom" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_LucroPDV" SummaryType="Custom" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_LucroTotal" SummaryType="Custom" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemPDV_AA" SummaryType="Custom" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemPDV_AT" SummaryType="Custom" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargemPDV" SummaryType="Custom" />

            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemTotal_AA" SummaryType="Custom" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemTotal_AT" SummaryType="Custom" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargemTotal" SummaryType="Custom" />

            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoMedioAA" SummaryType="Custom" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoMedioAT" SummaryType="Custom" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_precoMedio" SummaryType="Custom" />
            
        </TotalSummary>
        <FormatConditions>
            <dx:GridViewFormatConditionIconSet FieldName="percCresc_Venda" Format="PositiveNegativeArrowsColored" />
        </FormatConditions>
        <Styles>
            <Header HorizontalAlign="Center">
            </Header>
            <AlternatingRow BackColor="#E1E1E1">
            </AlternatingRow>
            <FocusedRow BackColor="Yellow" ForeColor="Blue">
            </FocusedRow>
            <Footer Font-Bold="True">
            </Footer>
        </Styles>
    </dx:ASPxGridView>

    <asp:SqlDataSource ID="dsSubgrupo" runat="server" ConnectionString="<%$ ConnectionStrings:gerTempConnectionString %>" SelectCommand="Campanhas.usp_Buscar_MaterialEscolar_Venda_Subgrupo" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />                    
        </SelectParameters>
    </asp:SqlDataSource>

    
                            
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>

                <dx:TabPage Text="Comparativo por Filial">
                    <ContentCollection>
                        <dx:ContentControl runat="server">

    <dx:ASPxGridView ID="grid_Filial" runat="server" AutoGenerateColumns="False" DataSourceID="dsFilial" EnableTheming="True" Theme="SoftOrange" Width="100%" KeyboardSupport="True" KeyFieldName="idFilial">
        <SettingsPager Mode="ShowAllRecords">
        </SettingsPager>
        <Settings ShowFooter="True" ShowTitlePanel="True" VerticalScrollableHeight="450" VerticalScrollBarMode="Visible" HorizontalScrollBarMode="Auto" ShowFilterRow="True" />
        <SettingsBehavior AllowFocusedRow="True" />
        <SettingsResizing ColumnResizeMode="Control" />
        <SettingsText HeaderFilterShowAll="Todos Grupos" />
        <Columns>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" Visible="False" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="Descrição" FieldName="descFilial" ShowInCustomizationForm="True" VisibleIndex="2" Width="200px" FixedStyle="Left" ReadOnly="True">
                <Settings AllowHeaderFilter="False" AutoFilterCondition="Contains" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewBandColumn Caption="Volume" ShowInCustomizationForm="True" VisibleIndex="4">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="2017" FieldName="QtdeAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="2018" FieldName="QtdeAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difQtde" ShowInCustomizationForm="True" VisibleIndex="2" Width="75px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc_Qtde" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento" VisibleIndex="3" Width="65px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewBandColumn Caption="Vendas" ShowInCustomizationForm="True" VisibleIndex="5">
                <HeaderStyle BackColor="#3366FF" />
                <Columns>
                    <dx:GridViewDataTextColumn Caption="2017" FieldName="vlrVendaAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="2018" FieldName="vlrVendaAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                        <CellStyle ForeColor="Blue">
                        </CellStyle>
                        <FooterCellStyle ForeColor="Blue">
                        </FooterCellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difVenda" ShowInCustomizationForm="True" VisibleIndex="2" Width="75px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc_Venda" ShowInCustomizationForm="True" VisibleIndex="3" SortIndex="0" SortOrder="Ascending" Width="75px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewBandColumn Caption="Part. das Vendas" ShowInCustomizationForm="True" ToolTip="Participação das Vendas" VisibleIndex="7">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="2017" FieldName="percPart_VendasAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="2018" FieldName="percPart_VendasAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewBandColumn Caption="Lucro PDV" ShowInCustomizationForm="True" VisibleIndex="10">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="2017" FieldName="vlrLucroComercialAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="2018" FieldName="vlrLucroComercialAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difLucroPDV" ShowInCustomizationForm="True" VisibleIndex="2" Width="75px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc_LucroPDV" ShowInCustomizationForm="True" VisibleIndex="3" Width="65px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewBandColumn Caption="Lucro Final" ShowInCustomizationForm="True" VisibleIndex="11">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="2017" FieldName="vlrLucroTotalAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="2018" FieldName="vlrLucroTotalAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difLucroTotal" ShowInCustomizationForm="True" VisibleIndex="2" Width="75px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc_LucroTotal" ShowInCustomizationForm="True" VisibleIndex="3" Width="65px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewBandColumn Caption="Margem PDV" VisibleIndex="8">
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="percMargemPDV_AA" VisibleIndex="0" Caption="2017" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="percMargemPDV_AT" VisibleIndex="1" Caption="2018" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="difMargemPDV" UnboundType="Decimal" VisibleIndex="2" Caption="Diferença" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewBandColumn Caption="Margem Total" VisibleIndex="9">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="2017" FieldName="percMargemTotal_AA" VisibleIndex="0" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="2018" FieldName="percMargemTotal_AT" VisibleIndex="1" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difMargemTotal" UnboundType="Decimal" VisibleIndex="2" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewDataTextColumn Caption="Rank" FieldName="rnk" ShowInCustomizationForm="True" ToolTip="Ranking" VisibleIndex="3" Width="50px">
                <PropertiesTextEdit DisplayFormatString="{0:n0}º" EncodeHtml="False">
                </PropertiesTextEdit>
                <Settings AutoFilterCondition="Contains" AllowAutoFilter="False" />
                <CellStyle Font-Bold="True" HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewBandColumn Caption="Preço Médio" VisibleIndex="6">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="2017" FieldName="precoMedioAA" UnboundType="Decimal" VisibleIndex="0" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="2018" FieldName="precoMedioAT" UnboundType="Decimal" VisibleIndex="1" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc_precoMedio" ToolTip="Percentual de Crescimento" UnboundType="Decimal" VisibleIndex="2" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
        </Columns>
        <TotalSummary>
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAA" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAT" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difQtde" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAA" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAT" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difVenda" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercialAA" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercialAT" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difLucroPDV" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotalAA" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotalAT" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difLucroTotal" SummaryType="Sum" />
                        
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_VendasAA" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_VendasAT" SummaryType="Sum" />            

            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Venda" SummaryType="Custom" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Qtde" SummaryType="Custom" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_LucroPDV" SummaryType="Custom" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_LucroTotal" SummaryType="Custom" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemPDV_AA" SummaryType="Custom" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemPDV_AT" SummaryType="Custom" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargemPDV" SummaryType="Custom" />

            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemTotal_AA" SummaryType="Custom" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemTotal_AT" SummaryType="Custom" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargemTotal" SummaryType="Custom" />

            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoMedioAA" SummaryType="Custom" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoMedioAT" SummaryType="Custom" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_precoMedio" SummaryType="Custom" />
            
        </TotalSummary>
        <FormatConditions>
            <dx:GridViewFormatConditionIconSet FieldName="percCresc_Venda" Format="PositiveNegativeArrowsColored" />
        </FormatConditions>
        <Styles>
            <Header HorizontalAlign="Center">
            </Header>
            <AlternatingRow BackColor="#E1E1E1">
            </AlternatingRow>
            <FocusedRow BackColor="Yellow" ForeColor="Blue">
            </FocusedRow>
            <Footer Font-Bold="True">
            </Footer>
        </Styles>
    </dx:ASPxGridView>

    <asp:SqlDataSource ID="dsFilial" runat="server" ConnectionString="<%$ ConnectionStrings:gerTempConnectionString %>" SelectCommand="Campanhas.usp_Buscar_MaterialEscolar_Venda_porFilial" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />                    
        </SelectParameters>
    </asp:SqlDataSource>


                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>

                <dx:TabPage Text="Comparativo por Produto">
                    <ContentCollection>
                        <dx:ContentControl runat="server">
      

    <dx:ASPxGridView ID="grid_Item" runat="server" AutoGenerateColumns="False" DataSourceID="dsItem" EnableTheming="True" Theme="SoftOrange" Width="100%" KeyboardSupport="True" KeyFieldName="idProduto">
        <SettingsPager PageSize="21">
        </SettingsPager>
        <Settings ShowFooter="True" ShowTitlePanel="True" VerticalScrollableHeight="462" VerticalScrollBarMode="Visible" HorizontalScrollBarMode="Auto" ShowFilterRow="True" />
        <SettingsBehavior AllowFocusedRow="True" />
        <SettingsResizing ColumnResizeMode="Control" />
        <SettingsText HeaderFilterShowAll="Todos Grupos" GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
        <Columns>
            <dx:GridViewCommandColumn ShowClearFilterButton="True" Visible="False" VisibleIndex="0">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="Descrição" FieldName="descCategoria" ShowInCustomizationForm="True" VisibleIndex="13" Width="200px" ReadOnly="True">
                <Settings AllowHeaderFilter="True" AutoFilterCondition="Contains" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewBandColumn Caption="Volume" ShowInCustomizationForm="True" VisibleIndex="4">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="2017" FieldName="QtdeAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="2018" FieldName="QtdeAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difQtde" ShowInCustomizationForm="True" VisibleIndex="2" Width="75px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc_Qtde" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento" VisibleIndex="3" Width="65px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewBandColumn Caption="Vendas" ShowInCustomizationForm="True" VisibleIndex="5">
                <HeaderStyle BackColor="#3366FF" />
                <Columns>
                    <dx:GridViewDataTextColumn Caption="2017" FieldName="vlrVendaAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="2018" FieldName="vlrVendaAT" ShowInCustomizationForm="True" VisibleIndex="1" SortIndex="0" SortOrder="Descending" Width="90px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                        <CellStyle ForeColor="Blue">
                        </CellStyle>
                        <FooterCellStyle ForeColor="Blue">
                        </FooterCellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difVenda" ShowInCustomizationForm="True" VisibleIndex="2" Width="75px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc_Venda" ShowInCustomizationForm="True" VisibleIndex="3" Width="75px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewBandColumn Caption="Part. das Vendas" ShowInCustomizationForm="True" ToolTip="Participação das Vendas" VisibleIndex="7">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="2017" FieldName="percPart_VendasAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="2018" FieldName="percPart_VendasAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewBandColumn Caption="Lucro PDV" ShowInCustomizationForm="True" VisibleIndex="10">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="2017" FieldName="vlrLucroComercialAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="2018" FieldName="vlrLucroComercialAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difLucroPDV" ShowInCustomizationForm="True" VisibleIndex="2" Width="75px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc_LucroPDV" ShowInCustomizationForm="True" VisibleIndex="3" Width="65px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewBandColumn Caption="Lucro Final" ShowInCustomizationForm="True" VisibleIndex="11">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="2017" FieldName="vlrLucroTotalAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="2018" FieldName="vlrLucroTotalAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difLucroTotal" ShowInCustomizationForm="True" VisibleIndex="2" Width="75px">
                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc_LucroTotal" ShowInCustomizationForm="True" VisibleIndex="3" Width="65px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewBandColumn Caption="Margem PDV" VisibleIndex="8">
                <Columns>
                    <dx:GridViewDataTextColumn FieldName="percMargemPDV_AA" VisibleIndex="0" Caption="2017" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="percMargemPDV_AT" VisibleIndex="1" Caption="2018" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="difMargemPDV" UnboundType="Decimal" VisibleIndex="2" Caption="Diferença" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewBandColumn Caption="Margem Total" VisibleIndex="9">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="2017" FieldName="percMargemTotal_AA" VisibleIndex="0" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="2018" FieldName="percMargemTotal_AT" VisibleIndex="1" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difMargemTotal" UnboundType="Decimal" VisibleIndex="2" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewDataTextColumn Caption="Rank" FieldName="rnk" ShowInCustomizationForm="True" ToolTip="Ranking" VisibleIndex="3" Width="60px">
                <PropertiesTextEdit DisplayFormatString="{0:n0}º" EncodeHtml="False">
                </PropertiesTextEdit>
                <Settings AutoFilterCondition="Contains" AllowAutoFilter="False" />
                <CellStyle Font-Bold="True" HorizontalAlign="Center">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Grupo" FieldName="descGrupo" VisibleIndex="12" Width="200px" ReadOnly="True">
                <Settings AllowHeaderFilter="True" AutoFilterCondition="Contains" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewBandColumn Caption="Preço Médio" VisibleIndex="6">
                <Columns>
                    <dx:GridViewDataTextColumn Caption="2017" FieldName="precoMedioAA" UnboundType="Decimal" VisibleIndex="0" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="2018" FieldName="precoMedioAT" UnboundType="Decimal" VisibleIndex="1" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc_precoMedio" ToolTip="Percentual de Crescimento" UnboundType="Decimal" VisibleIndex="2" Width="60px">
                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                        </PropertiesTextEdit>
                        <Settings AllowAutoFilter="False" />
                    </dx:GridViewDataTextColumn>
                </Columns>
            </dx:GridViewBandColumn>
            <dx:GridViewDataTextColumn Caption="Nome do Produto" FieldName="nomeProduto" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="2" Width="200px">
                <Settings AutoFilterCondition="Contains" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Produto" FieldName="idProduto" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
        </Columns>
        <TotalSummary>
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAA" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAT" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difQtde" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAA" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAT" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difVenda" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercialAA" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercialAT" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difLucroPDV" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotalAA" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotalAT" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difLucroTotal" SummaryType="Sum" />
                        
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_VendasAA" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_VendasAT" SummaryType="Sum" />            

            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Venda" SummaryType="Custom" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_Qtde" SummaryType="Custom" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_LucroPDV" SummaryType="Custom" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_LucroTotal" SummaryType="Custom" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemPDV_AA" SummaryType="Custom" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemPDV_AT" SummaryType="Custom" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargemPDV" SummaryType="Custom" />

            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemTotal_AA" SummaryType="Custom" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemTotal_AT" SummaryType="Custom" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargemTotal" SummaryType="Custom" />

            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoMedioAA" SummaryType="Custom" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoMedioAT" SummaryType="Custom" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_precoMedio" SummaryType="Custom" />
            
        </TotalSummary>
        <FormatConditions>
            <dx:GridViewFormatConditionIconSet FieldName="percCresc_Venda" Format="PositiveNegativeArrowsColored" />
        </FormatConditions>
        <Styles>
            <Header HorizontalAlign="Center">
            </Header>
            <AlternatingRow BackColor="#E1E1E1">
            </AlternatingRow>
            <FocusedRow BackColor="Yellow" ForeColor="Blue">
            </FocusedRow>
            <Footer Font-Bold="True">
            </Footer>
        </Styles>
    </dx:ASPxGridView>

    <asp:SqlDataSource ID="dsItem" runat="server" ConnectionString="<%$ ConnectionStrings:gerTempConnectionString %>" SelectCommand="Campanhas.usp_Buscar_MaterialEscolar_Venda_Item" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />                    
        </SelectParameters>
    </asp:SqlDataSource>

    
                            
                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>
                
                <dx:TabPage Text="Meta x Realizado - por Filial">
                    <ContentCollection>
                        <dx:ContentControl runat="server">

    <dx:ASPxGridView ID="grid_Filial_Meta" runat="server" AutoGenerateColumns="False" DataSourceID="dsFilial_Meta" EnableTheming="True" Theme="SoftOrange" Width="100%" KeyboardSupport="True" KeyFieldName="idFilial">
        <SettingsPager Mode="ShowAllRecords">
        </SettingsPager>
        <Settings ShowFooter="True" ShowTitlePanel="True" VerticalScrollableHeight="450" VerticalScrollBarMode="Visible" HorizontalScrollBarMode="Auto" ShowFilterRow="True" ShowGroupPanel="True" />
        <SettingsBehavior AllowFocusedRow="True" />
        <SettingsResizing ColumnResizeMode="Control" />
        <SettingsDataSecurity AllowEdit="False" AllowInsert="False" />
        <SettingsText HeaderFilterShowAll="Todos Grupos" GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
        <Columns>
            <dx:GridViewCommandColumn Visible="False" VisibleIndex="0" ShowClearFilterButton="True">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="Filial" FieldName="descFilial" ShowInCustomizationForm="True" VisibleIndex="4" Width="200px" FixedStyle="Left" ReadOnly="True" SortIndex="0" SortOrder="Ascending">
                <Settings AllowHeaderFilter="False" AutoFilterCondition="Contains"  />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn Caption="2017" FieldName="vlrVendaAAF" ShowInCustomizationForm="True" VisibleIndex="5" Width="90px">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
                <Settings AllowAutoFilter="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrVendaAT" ShowInCustomizationForm="True" VisibleIndex="7" Width="90px">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
                <Settings AllowAutoFilter="False" />
                <CellStyle ForeColor="Blue" Font-Bold="False">
                </CellStyle>
                <FooterCellStyle ForeColor="Blue">
                </FooterCellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrVendaMeta" ShowInCustomizationForm="True" VisibleIndex="6" Width="90px">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
                <Settings AllowAutoFilter="False" />
                <CellStyle ForeColor="#336600" Font-Bold="False">
                </CellStyle>
                <FooterCellStyle ForeColor="#336600">
                </FooterCellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="% Ating" FieldName="percAting" ShowInCustomizationForm="True"  VisibleIndex="9" Width="75px" ToolTip="Percentual de Atingimento">
                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                </PropertiesTextEdit>
                <Settings AllowAutoFilter="False" />
                <CellStyle Font-Bold="True">
                </CellStyle>
            </dx:GridViewDataTextColumn>
                    
            
            <dx:GridViewDataProgressBarColumn FieldName="percChegada" Caption="Status" ShowInCustomizationForm="True" VisibleIndex="10">
                <Settings AllowAutoFilter="False" />
                <CellStyle Font-Bold="True">
                </CellStyle>
            </dx:GridViewDataProgressBarColumn>
                    
            
            <dx:GridViewDataTextColumn FieldName="Dif" ShowInCustomizationForm="True" Caption="Diferença" VisibleIndex="8">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
                <Settings AllowAutoFilter="False" />
            </dx:GridViewDataTextColumn>
                    
            
            <dx:GridViewDataTextColumn FieldName="Cidade" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="3" Width="150px">
                <Settings AllowAutoFilter="True" AllowHeaderFilter="True" AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Região" FieldName="descRegiao" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="2" Width="150px">
                <Settings AllowAutoFilter="True" AllowHeaderFilter="True" AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Regional" FieldName="descRegional" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="1" Width="150px">
                <Settings AllowAutoFilter="True" AllowHeaderFilter="True" AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                    
            
        </Columns>
        <TotalSummary>          
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAAF" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAT" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaMeta" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Dif" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAting" SummaryType="Custom" />   
        </TotalSummary>
        <FormatConditions>
            <dx:GridViewFormatConditionIconSet FieldName="percCresc_Venda" Format="PositiveNegativeArrowsColored" />
            <dx:GridViewFormatConditionIconSet FieldName="percAting" Format="PositiveNegativeTriangles" />
        </FormatConditions>
        <Styles>
            <Header HorizontalAlign="Center">
            </Header>
            <AlternatingRow BackColor="#E1E1E1">
            </AlternatingRow>
            <FocusedRow BackColor="Yellow" ForeColor="Blue">
            </FocusedRow>
            <Footer Font-Bold="True">
            </Footer>
        </Styles>
    </dx:ASPxGridView>

    <asp:SqlDataSource ID="dsFilial_Meta" runat="server" ConnectionString="<%$ ConnectionStrings:gerTempConnectionString %>" SelectCommand="Campanhas.usp_Buscar_MaterialEscolar_Venda_porFilial_Meta" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />                    
        </SelectParameters>
    </asp:SqlDataSource>


                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>

                <dx:TabPage Text="Meta x Realizado - por Categoria">
                    <ContentCollection>
                        <dx:ContentControl runat="server">

    <dx:ASPxGridView ID="grid_Principal_Meta" runat="server" AutoGenerateColumns="False" DataSourceID="dsSubgrupo_Meta" EnableTheming="True" Theme="SoftOrange" Width="100%" KeyboardSupport="True" KeyFieldName="idProdutoSubgrupo">
        <SettingsPager Mode="ShowAllRecords">
        </SettingsPager>
        <Settings ShowFooter="True" ShowTitlePanel="True" VerticalScrollableHeight="450" VerticalScrollBarMode="Visible" HorizontalScrollBarMode="Auto" ShowFilterRow="True" />
        <SettingsBehavior AllowFocusedRow="True" />
        <SettingsResizing ColumnResizeMode="Control" />
        <SettingsDataSecurity AllowEdit="False" AllowInsert="False" />
        <SettingsText HeaderFilterShowAll="Todos Grupos" GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
        <Columns>
            <dx:GridViewCommandColumn Visible="False" VisibleIndex="0" ShowClearFilterButton="True">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="Grupo" FieldName="descGrupo" ShowInCustomizationForm="True" VisibleIndex="1" Width="200px" FixedStyle="Left" ReadOnly="True">
                <Settings AllowHeaderFilter="True" AutoFilterCondition="Contains"  />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn Caption="2017" FieldName="vlrVendaAAF" ShowInCustomizationForm="True" VisibleIndex="3" Width="90px">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
                <Settings AllowAutoFilter="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrVendaAT" ShowInCustomizationForm="True" VisibleIndex="5" Width="90px">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
                <Settings AllowAutoFilter="False" />
                <CellStyle ForeColor="Blue">
                </CellStyle>
                <FooterCellStyle ForeColor="Blue">
                </FooterCellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrVendaMeta" ShowInCustomizationForm="True" VisibleIndex="4" Width="90px">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
                <Settings AllowAutoFilter="False" />
                <CellStyle ForeColor="#336600">
                </CellStyle>
                <FooterCellStyle ForeColor="#336600">
                </FooterCellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="% Ating" FieldName="percAting" ShowInCustomizationForm="True"  VisibleIndex="7" Width="75px" ToolTip="Percentual de Atingimento">
                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                </PropertiesTextEdit>
                <Settings AllowAutoFilter="False" />
                <CellStyle Font-Bold="True">
                </CellStyle>
            </dx:GridViewDataTextColumn>
                    
            
            <dx:GridViewDataProgressBarColumn FieldName="percChegada" Caption="Status" ShowInCustomizationForm="True" VisibleIndex="8">
                <Settings AllowAutoFilter="False" />
                <CellStyle Font-Bold="True">
                </CellStyle>
            </dx:GridViewDataProgressBarColumn>
                    
            
            <dx:GridViewDataTextColumn FieldName="Dif" ShowInCustomizationForm="True" Caption="Diferença" VisibleIndex="6">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
                <Settings AllowAutoFilter="False" />
            </dx:GridViewDataTextColumn>
                    
            
            <dx:GridViewDataTextColumn Caption="Categoria" FieldName="descCategoria" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="2" Width="200px">
                <Settings AutoFilterCondition="Contains" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
                    
            
        </Columns>
        <TotalSummary>          
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAAF" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAT" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaMeta" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Dif" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAting" SummaryType="Custom" />   
        </TotalSummary>
        <FormatConditions>
            <dx:GridViewFormatConditionIconSet FieldName="percCresc_Venda" Format="PositiveNegativeArrowsColored" />
            <dx:GridViewFormatConditionIconSet FieldName="percAting" Format="PositiveNegativeTriangles" />
        </FormatConditions>
        <Styles>
            <Header HorizontalAlign="Center">
            </Header>
            <AlternatingRow BackColor="#E1E1E1">
            </AlternatingRow>
            <FocusedRow BackColor="Yellow" ForeColor="Blue">
            </FocusedRow>
            <Footer Font-Bold="True">
            </Footer>
        </Styles>
    </dx:ASPxGridView>

    <asp:SqlDataSource ID="dsSubgrupo_Meta" runat="server" ConnectionString="<%$ ConnectionStrings:gerTempConnectionString %>" SelectCommand="Campanhas.usp_Buscar_MaterialEscolar_Venda_porSubgrupo_Meta" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />                    
        </SelectParameters>
    </asp:SqlDataSource>


                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>

                <dx:TabPage Text="Meta x Realizado - por Produto">
                    <ContentCollection>
                        <dx:ContentControl runat="server">

    <dx:ASPxGridView ID="grid_Produto_Meta" runat="server" AutoGenerateColumns="False" DataSourceID="dsItem_Meta" EnableTheming="True" Theme="SoftOrange" Width="100%" KeyboardSupport="True" KeyFieldName="idProduto">
        <SettingsPager PageSize="12">
        </SettingsPager>
        <Settings ShowFooter="True" ShowTitlePanel="True" VerticalScrollableHeight="450" VerticalScrollBarMode="Visible" HorizontalScrollBarMode="Auto" ShowFilterRow="True" />
        <SettingsBehavior AllowFocusedRow="True" />
        <SettingsResizing ColumnResizeMode="Control" />
        <SettingsDataSecurity AllowEdit="False" AllowInsert="False" />
        <SettingsText HeaderFilterShowAll="Todos Grupos" GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
        <Columns>
            <dx:GridViewCommandColumn Visible="False" VisibleIndex="0" ShowClearFilterButton="True">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="Grupo" FieldName="descGrupo" ShowInCustomizationForm="True" VisibleIndex="9" Width="200px" ReadOnly="True">
                <Settings AllowHeaderFilter="True" AutoFilterCondition="Contains"  />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>

            <dx:GridViewDataTextColumn Caption="2017" FieldName="vlrVendaAAF" ShowInCustomizationForm="True" VisibleIndex="3" Width="90px">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
                <Settings AllowAutoFilter="False" />
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrVendaAT" ShowInCustomizationForm="True" VisibleIndex="5" Width="90px">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
                <Settings AllowAutoFilter="False" />
                <CellStyle ForeColor="Blue">
                </CellStyle>
                <FooterCellStyle ForeColor="Blue">
                </FooterCellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrVendaMeta" ShowInCustomizationForm="True" VisibleIndex="4" Width="90px">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
                <Settings AllowAutoFilter="False" />
                <CellStyle ForeColor="#336600">
                </CellStyle>
                <FooterCellStyle ForeColor="#336600">
                </FooterCellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="% Ating" FieldName="percAting" ShowInCustomizationForm="True"  VisibleIndex="7" Width="75px" ToolTip="Percentual de Atingimento">
                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                </PropertiesTextEdit>
                <Settings AllowAutoFilter="False" />
                <CellStyle Font-Bold="True">
                </CellStyle>
            </dx:GridViewDataTextColumn>
                    
            
            <dx:GridViewDataProgressBarColumn FieldName="percChegada" Caption="Status" ShowInCustomizationForm="True" VisibleIndex="8">
                <Settings AllowAutoFilter="False" />
                <CellStyle Font-Bold="True">
                </CellStyle>
            </dx:GridViewDataProgressBarColumn>
                    
            
            <dx:GridViewDataTextColumn FieldName="Dif" ShowInCustomizationForm="True" Caption="Diferença" VisibleIndex="6">
                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                </PropertiesTextEdit>
                <Settings AllowAutoFilter="False" />
            </dx:GridViewDataTextColumn>
                    
            
            <dx:GridViewDataTextColumn Caption="Categoria" FieldName="descCategoria" ShowInCustomizationForm="True" VisibleIndex="10" Width="200px">
                <Settings AllowHeaderFilter="True" AutoFilterCondition="Contains" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
                    
            
            <dx:GridViewDataTextColumn Caption="Nome do Produto" FieldName="nomeProduto" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="2" Width="250px">
                <Settings AutoFilterCondition="Contains" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Produto" FieldName="idProduto" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                    
            
        </Columns>
        <TotalSummary>          
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAAF" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAT" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaMeta" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Dif" SummaryType="Sum" />
            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAting" SummaryType="Custom" />   
        </TotalSummary>
        <FormatConditions>
            <dx:GridViewFormatConditionIconSet FieldName="percCresc_Venda" Format="PositiveNegativeArrowsColored" />
            <dx:GridViewFormatConditionIconSet FieldName="percAting" Format="PositiveNegativeTriangles" />
        </FormatConditions>
        <Styles>
            <Header HorizontalAlign="Center">
            </Header>
            <AlternatingRow BackColor="#E1E1E1">
            </AlternatingRow>
            <FocusedRow BackColor="Yellow" ForeColor="Blue">
            </FocusedRow>
            <Footer Font-Bold="True">
            </Footer>
        </Styles>
    </dx:ASPxGridView>

    <asp:SqlDataSource ID="dsItem_Meta" runat="server" ConnectionString="<%$ ConnectionStrings:gerTempConnectionString %>" SelectCommand="Campanhas.usp_Buscar_MaterialEscolar_Venda_porItem_Meta" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />                    
        </SelectParameters>
    </asp:SqlDataSource>
        

                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>

                <dx:TabPage Text="Cadastro">
                    <TabImage Url="~/image/book-icon_24.png">
                    </TabImage>
                    <ContentCollection>
                        <dx:ContentControl runat="server">

    <dx:ASPxGridView ID="gridCadastro" runat="server" AutoGenerateColumns="False" DataSourceID="dsCadastro" EnableTheming="True" Theme="SoftOrange" Width="900px" KeyboardSupport="True" KeyFieldName="idProdutoSubgrupoAlternativo">
        <SettingsPager PageSize="12" Mode="ShowAllRecords">
        </SettingsPager>
        <Settings ShowFooter="True" ShowTitlePanel="True" VerticalScrollableHeight="450" VerticalScrollBarMode="Visible" HorizontalScrollBarMode="Auto" ShowFilterRow="True" />
        <SettingsBehavior AllowFocusedRow="True" />
        <SettingsResizing ColumnResizeMode="Control" />
        <SettingsDataSecurity AllowEdit="False" AllowInsert="False" />
        <SettingsText HeaderFilterShowAll="Todos Grupos" GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
        <Columns>
            <dx:GridViewCommandColumn Visible="False" VisibleIndex="0" ShowClearFilterButton="True">
            </dx:GridViewCommandColumn>
            <dx:GridViewDataTextColumn Caption="Familia" FieldName="idProdutoSubgrupoAlternativo" ShowInCustomizationForm="True" VisibleIndex="7" Width="85px" ReadOnly="True">
                <Settings AllowHeaderFilter="True" AutoFilterCondition="Contains"  />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>

            
            <dx:GridViewDataTextColumn Caption="Nome da Familia" FieldName="descProdutoSubgrupo" ShowInCustomizationForm="True" VisibleIndex="8" Width="250px">
                <Settings AllowHeaderFilter="True" AutoFilterCondition="Contains" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
                    
            
            <dx:GridViewDataTextColumn Caption="Nome do Grupo" FieldName="descProdutoGrupo" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="2" Width="250px">
                <Settings AutoFilterCondition="Contains" />
                <CellStyle Wrap="False">
                </CellStyle>
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Grupo" FieldName="idProdutoGrupoAlternativo" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                <Settings AutoFilterCondition="Contains" />
            </dx:GridViewDataTextColumn>
                    
            
            <dx:GridViewDataTextColumn Caption="GR" FieldName="idProdutoGrupo" ShowInCustomizationForm="True" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="SGR" FieldName="idProdutoSubgrupo" ShowInCustomizationForm="True" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
                    
            
        </Columns>
        <TotalSummary>          
            <dx:ASPxSummaryItem DisplayFormat="Total de Familias: {0:n0}" FieldName="idProdutoSubgrupo" SummaryType="Count" ShowInColumn="Nome da Familia" />             
        </TotalSummary>
        <FormatConditions>
            <dx:GridViewFormatConditionIconSet FieldName="percCresc_Venda" Format="PositiveNegativeArrowsColored" />
            <dx:GridViewFormatConditionIconSet FieldName="percAting" Format="PositiveNegativeTriangles" />
        </FormatConditions>
        <Styles>
            <Header HorizontalAlign="Center">
            </Header>
            <AlternatingRow BackColor="#E1E1E1">
            </AlternatingRow>
            <FocusedRow BackColor="Yellow" ForeColor="Blue">
            </FocusedRow>
            <Footer Font-Bold="True">
            </Footer>
        </Styles>
    </dx:ASPxGridView>

    <asp:SqlDataSource ID="dsCadastro" runat="server" ConnectionString="<%$ ConnectionStrings:gerCadastrosConnectionString %>" SelectCommand="Cad.Material_Escolar_Buscar_Categorias_Cadastradas" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />                    
        </SelectParameters>
    </asp:SqlDataSource>


                        </dx:ContentControl>
                    </ContentCollection>
                </dx:TabPage>



            </TabPages>
        </dx:ASPxPageControl>
    </div>


    <%--FILIAL--%>

        <div class="Bloco"  >    


    </div>


    <div class="Bloco">        
        <dx:WebChartControl ID="WebChartControl1" runat="server" CrosshairEnabled="True" Height="400px" Width="1000px" DataSourceID="dsGraph1">
            <DiagramSerializable>
                <dx:XYDiagram>
                    <axisx visibleinpanesserializable="-1">
                        <GridLines Visible="True">
                        </GridLines>
                    </axisx>
                    <axisy visibility="True" visibleinpanesserializable="-1">
                        <Tickmarks MinorVisible="False" Visible="False" />
                        <Label Visible="False">
                        </Label>
                        <GridLines Visible="False">
                        </GridLines>
                    </axisy>
                </dx:XYDiagram>
            </DiagramSerializable>
<Legend Name="Default Legend" alignmenthorizontal="Center" alignmentvertical="BottomOutside" horizontalindent="6" markersize="23, 16" maxverticalpercentage="8" textoffset="5"></Legend>
            <SeriesSerializable>
                <dx:Series ArgumentDataMember="descGrupo" LabelsVisibility="True" LegendText="Ano Anterior" Name="Ano Anterior" ValueDataMembersSerializable="1 - Ano Anterior">
                    <LabelSerializable>
                        <dx:SideBySideBarSeriesLabel Position="Top" ResolveOverlappingMode="Default" TextPattern="{V:n0}">
                        </dx:SideBySideBarSeriesLabel>
                    </LabelSerializable>
                </dx:Series>
                <dx:Series ArgumentDataMember="descGrupo" LabelsVisibility="True" LegendText="Ano Atual" Name="Ano Atual" ValueDataMembersSerializable="2 - Ano Atual">
                    <LabelSerializable>
                        <dx:SideBySideBarSeriesLabel Position="Top" ResolveOverlappingMode="Default" TextPattern="{V:n0}">
                            <FillStyle FillMode="Empty">
                            </FillStyle>
                        </dx:SideBySideBarSeriesLabel>
                    </LabelSerializable>
                </dx:Series>
            </SeriesSerializable>
            <Titles>
                <dx:ChartTitle Font="Tahoma, 12pt" Text="Período  -  Ano 2018:  de 01/01/2018 à 03/02/2018    -    Ano 2019: de 01/01/2019 à 03/02/2019" Visibility="True" />
            </Titles>
        </dx:WebChartControl>
        <asp:SqlDataSource ID="dsGraph1" runat="server" ConnectionString="<%$ ConnectionStrings:gerTempConnectionString %>" SelectCommand="Campanhas.usp_BuscarGraficos_Grupos" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />                    
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
        <asp:Label ID="lblEliseu" runat="server" Text="Label"></asp:Label>
    </div>

</asp:Content>

