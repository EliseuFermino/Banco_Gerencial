<%@ Page Title="Comparativo Crescimento Item" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="ComparativoCrescimentoSecao.aspx.vb" Inherits="MemberPages_SLV_Item_ComparativoCrescimentoSecao" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>






<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divAno {
            float: left;
            margin-left: 2px;
        }

        #divMesInicial {
             float: left;
            margin-left: 10px;       
        }

        #divMesFinal {
             float: left;
            margin-left: 10px;       
        }

        #divTodosItens {
             float: left;
            margin-left: 10px;       
        }

        #divMesmosItens {
             float: left;
            margin-left: 10px;       
        }

        #divBotaoAtualizar {
             float: left;
            margin-left: 10px;       
        }

        #divSize {
             float: left;
            margin-left: 10px;       
        }

        #divExcel {
             float: left;
            margin-left: 20px;       
        }

        #divDados {
            clear :both ;
             float: left;
            margin-left: 10px;       
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="divAno">
        <uc1:wucAno runat="server" ID="cboAno" />
    </div>

    <div id="divMesInicial">
        <uc1:wuciListaMes runat="server" ID="cboMesInicial" LabelDescMes ="Mês Inicial" />
    </div>

    <div id="divMesFinal">
        <uc1:wuciListaMes runat="server" ID="cboMesFinal" LabelDescMes="Mês Final" />
    </div>

    <div id="divTodosItens">
        <dx:ASPxRadioButton ID="rndTodosItens" runat="server" Text="Todos Itens" Theme="DevEx" GroupName="myGroup" Checked="True" >
        </dx:ASPxRadioButton>
    </div>

    <div id="divMesmosItens">
        <dx:ASPxRadioButton ID="rndMesmosItens" runat="server" Text="Mesmos Itens" Theme="DevEx"  GroupName="myGroup">
            <ClientSideEvents CheckedChanged="function(s, e) {
		
}" />
        </dx:ASPxRadioButton>
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" Theme ="Metropolis" AutoPostBack ="False" >
            <ClientSideEvents Click="function(s, e) {
	cbPanel.PerformCallback();
}" />
        </dx:ASPxButton>
    </div>

    <div id="divSize">
        <uc1:wucSize runat="server" ID="cboSize" />
    </div>

    <div id="divExcel">
        <uc1:wucBotaoExcel runat="server" ID="wucBotaoExcel" CallGridViewID ="grid" />
    </div>

    <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="1020px" ClientInstanceName ="cbPanel" Theme ="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando" LoadingPanelStyle-VerticalAlign="Bottom"  >
<LoadingPanelStyle VerticalAlign="Bottom"></LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttributes="both">

                <div id="divDados">
                    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" KeyFieldName="idProdutoSecao" Width="1020px">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdVendasAA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="VendaAA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroAA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdVendasAT" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="VendaAT" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroAT" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAT" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescVolume" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoMedioAA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoMedioAT" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Inflacao" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescReal" SummaryType="Custom" />
                        </TotalSummary>
                        <Columns>
                            <dx:GridViewBandColumn Caption="Produto" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="0">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Código" FieldName="idProdutoSecao" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px" Visible="False">
                                        <Settings AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nome do Produto" FieldName="nomeProduto" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="1" Width="150px">
                                        <Settings AutoFilterCondition="Contains" />
                                        <CellStyle Wrap="False">
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="2014" Name="bandAnoAtual" VisibleIndex="3">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendasAT" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="VendaAT" VisibleIndex="1" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Margem" FieldName="percMargemAT" ReadOnly="True" VisibleIndex="3" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle ForeColor="Blue">
                                            <BorderRight BorderColor="Gray" BorderStyle="Double" BorderWidth="2px" />
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="LucroAT" ShowInCustomizationForm="True" ToolTip="Lucro com Sell-Out" VisibleIndex="2" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="2013" Name="bandAnoAnterior" VisibleIndex="2">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendasAA" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="VendaAA" VisibleIndex="1" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Margem" FieldName="percMargemAA" ReadOnly="True" VisibleIndex="3" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="LucroAA" ShowInCustomizationForm="True" ToolTip="Lucro com Sell-Out" VisibleIndex="2" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="% de Crescimento" VisibleIndex="4">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="percCresc" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Volume" FieldName="percCrescVolume" VisibleIndex="0" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Preço Médio" VisibleIndex="5">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="2013" FieldName="precoMedioAA" VisibleIndex="0" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="precoMedioAT" VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Inflação Interna" FieldName="Inflacao" VisibleIndex="2" Width="100px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="Silver" />
                                        <CellStyle Font-Bold="True">
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc. Real" FieldName="percCrescReal" ToolTip="Percentual do Crescimento Real (Inflação Interna menos Crescimento em R$)" VisibleIndex="3" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <HeaderStyle BackColor="Silver" />
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager PageSize="20" Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings ShowGroupPanel="True" HorizontalScrollBarMode="Visible" ShowFooter="True" VerticalScrollableHeight="400" VerticalScrollBarMode="Visible" />
                        <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
                        <SettingsLoadingPanel Text="Atualizando&amp;hellip;" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#F2F2F2">
                            </AlternatingRow>
                            <FocusedRow BackColor="#FFFF99" ForeColor="#3366FF">
                            </FocusedRow>
                            <Footer Font-Bold="True">
                            </Footer>
                        </Styles>
                    </dx:ASPxGridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemMesConnectionString %>" SelectCommand="Analises.usp_ComparativoCrescimentoSecao" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            <asp:SessionParameter Name="MesInicial" SessionField="sMES_INICIAL" Type="Byte" />
                            <asp:SessionParameter Name="MesFinal" SessionField="sMES_FINAL" Type="Byte" />
                            <asp:SessionParameter Name="MesmosItens" SessionField="sITENS" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>

            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>

</asp:Content>

