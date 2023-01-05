<%@ Page Title="Comprador - Ranking Anual" Language="VB" MasterPageFile= "~/MemberPages/Site.master"  AutoEventWireup="false" CodeFile="RankingaAnoComprador.aspx.vb" Inherits="MemberPages_RankingAnoComprador" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>



<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>
<%@ Register src="../../Controles/wucFixarCabecalho.ascx" tagname="wucFixarCabecalho" tagprefix="uc2" %>

<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc4" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">  
        
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">    

    <div id="divAno" style="float:left">
         <uc1:wucAno ID="cboAno" runat="server" />
    </div>

    <div id="divBotaoAtualizar" style="float:left; margin-left: 10px; margin-top: 2px; height:25px">
        <dxe:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {
	cbPanel.PerformCallback();
}" />
        </dxe:ASPxButton>
    </div>

    <div id="divFixarCabecalho" style="float:left; margin-left: 20px">
         <dxe:ASPxCheckBox ID="chkFixarCabecalho" runat="server" Text="Fixar Cabeçalho" Theme="DevEx" CheckState="Unchecked">
            <ClientSideEvents CheckedChanged="function(s, e) {
	cbPanel.PerformCallback();
}" />
        </dxe:ASPxCheckBox>       
    </div>

    <div id="divCheckAnoAnterior" style="float:left; margin-left: 20px">
        <dxe:ASPxCheckBox ID="chkAnoAnterior" runat="server" Text="Exibir 2009" Theme="DevEx" CheckState="Unchecked">
            <ClientSideEvents CheckedChanged="function(s, e) {
	cbPanel.PerformCallback();
}" />
        </dxe:ASPxCheckBox>
    </div>

    <div id="divMetaMes" style="float:left; margin-left: 20px">
        <dxe:ASPxCheckBox ID="chkMetaMes" runat="server" Text="Exibir Meta Ano" Theme="DevEx" CheckState="Unchecked">
            <ClientSideEvents CheckedChanged="function(s, e) {
	cbPanel.PerformCallback();
}" />
        </dxe:ASPxCheckBox>
    </div>

    <div id="divLucro" style="float:left; margin-left: 20px">
        <dxe:ASPxCheckBox ID="chkLucro" runat="server" Text="Exibir Lucro" Theme="DevEx" CheckState="Unchecked">
            <ClientSideEvents CheckedChanged="function(s, e) {
	cbPanel.PerformCallback();
}" />
        </dxe:ASPxCheckBox>
    </div>

    <div id="divSize" style="float:left; margin-left: 20px">
            <asp:DropDownList ID="cboSize" runat="server" AutoPostBack="True">
                    <asp:ListItem Value="80">80%</asp:ListItem>
                    <asp:ListItem Value="90">90%</asp:ListItem>
                    <asp:ListItem Value="100">100%</asp:ListItem>                  
                    <asp:ListItem Value="110">110%</asp:ListItem>
                    <asp:ListItem Value="120">120%</asp:ListItem>
                    <asp:ListItem Value="130">130%</asp:ListItem>
                    <asp:ListItem Value="140">140%</asp:ListItem>
                    <asp:ListItem Value="150">150%</asp:ListItem>
                    <asp:ListItem Value="160">160%</asp:ListItem>
                    <asp:ListItem Value="170">170%</asp:ListItem>
                    <asp:ListItem Value="180">180%</asp:ListItem>
                    <asp:ListItem Value="190">190%</asp:ListItem>
                    <asp:ListItem Value="200">200%</asp:ListItem>
                </asp:DropDownList>        
    </div>

    <div id="divBotaoExcel" style="float:left; margin-left: 20px; margin-top: 2px; height:25px">
        <dxe:ASPxButton ID="btnExportar" runat="server" 
            CssFilePath="~/App_Themes/Aqua/{0}/styles.css" CssPostfix="Aqua" 
            Text="Exportar Excel" Width="120px" Theme="DevEx">
        </dxe:ASPxButton>
        <dxwgv:ASPxGridViewExporter ID="ExporterExcel1" runat="server" 
            GridViewID="ASPxGridView1">
        </dxwgv:ASPxGridViewExporter>
    </div>

    <div id="divDados" style="clear:both; float:left; margin-left: 2px">

        <dx:ASPxCallbackPanel ID="cbPanel" runat="server" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizado..." >
            <PanelCollection>
                <dx:PanelContent  runat="server" SupportsDisabledAttributes="both">

                    <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" 
                    AutoGenerateColumns="False" 
                    CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                    CssPostfix="Office2003_Blue" DataSourceID="dsSuper" KeyFieldName="idComprador" 
                    Theme="SoftOrange" Width="1000px">
                    <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                    <Styles CssFilePath="~/App_Themes/Office2003 Blue/{0}/styles.css" 
                        CssPostfix="Office2003_Blue">
                        <Header ImageSpacing="5px" SortingImageSpacing="5px" HorizontalAlign="Center"></Header>                            
                        <Footer Font-Bold="True">
                        </Footer>
                        <LoadingPanel ImageSpacing="10px"></LoadingPanel>
                        <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF"> </FocusedRow>
                        <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                    </Styles>
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                    <SettingsText EmptyDataRow="Não informações atualizadas financeiras para este período." />
                    <SettingsDetail ShowDetailRow="True" />
                    <Images ImageFolder="~/App_Themes/Office2003 Blue/{0}/">
                        <CollapsedButton Height="12px" 
                            Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                            Width="11px" />
                        <ExpandedButton Height="12px" 
                            Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" Width="11px" />
                        <DetailCollapsedButton Height="12px" 
                            Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" 
                            Width="11px" />
                        <DetailExpandedButton Height="12px" 
                            Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" Width="11px" />
                        <FilterRowButton Height="13px" Width="13px" />
                    </Images>
                    <TotalSummary>
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta" 
                            SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRea" 
                            SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMA" 
                            SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA1" 
                            SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA2" 
                            SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA3" 
                            SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealMeta" 
                            SummaryType="Custom" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMA" 
                            SummaryType="Custom" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealAA1" 
                            SummaryType="Custom" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealAA3" 
                            SummaryType="Custom" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealAA2" 
                            SummaryType="Custom" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaAnual" 
                            SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_MetaAnual" 
                            SummaryType="Custom" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_vlrRea" 
                            SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargReal" SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargReal" 
                            SummaryType="Custom" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargRealAA1" SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargRealAA2" SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAting" SummaryType="Custom" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargMeta" SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargMeta" 
                            SummaryType="Custom" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemDif" 
                            SummaryType="Custom" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroSellOut" SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSellOut" SummaryType="Custom" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargemSellOut" SummaryType="Custom" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargemFinal" SummaryType="Sum" />
                        <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinal" SummaryType="Custom" />
                    </TotalSummary>
                    <Columns>
                        <dxwgv:GridViewBandColumn Caption="Meta Mês" ToolTip="Quadrante de Informações de Meta mensal e quanto que falta para atingir a meta do mês." 
                            VisibleIndex="5" Name="bandMetaMes" Visible="False">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Previsao" FieldName="vlrMetaAnual" 
                                    VisibleIndex="0" Width="100px" ToolTip="Valor da meta anual do ano selecionado">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle ForeColor="#009900">
                                        <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                    <FooterCellStyle ForeColor="#009900">
                                    </FooterCellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="% Final" FieldName="percCresc_MetaAnual" 
                                    VisibleIndex="1" Width="60px" ToolTip="Percentual de quanto falta para atingir a meta do ano">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle>
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewBandColumn>
                        <dxwgv:GridViewBandColumn Caption="Atingimento e Crescimento" VisibleIndex="4" ToolTip="Quadrante de Informações de Atingimento e Crescimento">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="% Prev" FieldName="percCresc_RealMeta" 
                                    ToolTip="% de crescimento. Meta sobre o  Realizado" VisibleIndex="0" 
                                    Width="60px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                    <EditCellStyle>
                                        <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </EditCellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle ForeColor="Blue">
                                        <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                    <FooterCellStyle ForeColor="Blue">
                                    </FooterCellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="2011" FieldName="percCresc_RealAA1" 
                                    VisibleIndex="2" Width="60px" Name="bandCrescAA1" ToolTip="Percentual de crescimento sobre o ano anterior">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="2010" FieldName="percCresc_RealAA2" 
                                    VisibleIndex="3" Width="60px" Name="bandCrescAA2" ToolTip="Percentual de crescimento sobre dois anos anteriores" Visible="False">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="2009" FieldName="percCresc_RealAA3" 
                                    VisibleIndex="4" Width="60px" 
                                    Visible="False" Name="bandCrescAA3" ToolTip="Percentual de crescimento sobre três anos anteriores">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                        </dxwgv:GridViewBandColumn>
                        <dxwgv:GridViewBandColumn Caption="Ano Anterior" VisibleIndex="3" ToolTip="Quadrante de Informações dos Anos Anteriores">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="2011" FieldName="vlrAA1" 
                                    VisibleIndex="0" Width="100px" Name="bandAA1" ToolTip="Valor da venda do ano anterior acumulado no mesmo período de dias">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                    <EditCellStyle>
                                        <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </EditCellStyle>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle>
                                        <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="2010" FieldName="vlrAA2" 
                                    VisibleIndex="1" Width="90px" Name="bandAA2" ToolTip="Valor da venda de dois anos anteriores acumulado no mesmo período de dias" Visible="False">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="2009" FieldName="vlrAA3" 
                                    VisibleIndex="2" Width="90px" 
                                    Visible="False" Name="bandAA3" ToolTip="Valor da venda de três anos anteriores acumulado no mesmo período de dias">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle>
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewBandColumn>
                        <dxwgv:GridViewBandColumn Caption="Ano 2012" VisibleIndex="2" Name="bandAtual" ToolTip="Quadrante de Informações do Ano Atual">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta" 
                                    VisibleIndex="0" Width="100px" ToolTip="Valor da meta acumulada até o dia de ontem">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle ForeColor="#009900">
                                    </CellStyle>
                                    <FooterCellStyle ForeColor="#009900">
                                    </FooterCellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Realizado" FieldName="vlrRea" 
                                    VisibleIndex="1" Width="100px" ToolTip="Valor do realizado acumulado até o dia de ontem">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle ForeColor="Blue">
                                    </CellStyle>
                                    <FooterCellStyle ForeColor="Blue">
                                    </FooterCellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="% Part" FieldName="percPart_vlrRea" 
                                    ToolTip="% de participação da venda da filial sobre o total da venda da empresa." 
                                    VisibleIndex="2" Width="60px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewBandColumn>
                        <dxwgv:GridViewDataTextColumn Caption="ID" FieldName="idFilial" VisibleIndex="0" 
                            Width="30px" Visible="False">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewDataTextColumn Caption="Comprador" FieldName="descComprador" 
                            VisibleIndex="1" Width="130px" ToolTip="Nome do Comprador">
                            <HeaderStyle HorizontalAlign="Center" />
                            <CellStyle Wrap="False">
                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                            </CellStyle>
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewBandColumn Caption="Margem Praticada" VisibleIndex="6" ToolTip="Quadrante de Informações de Margem Praticada">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="Meta" FieldName="percMargMeta" 
                                    VisibleIndex="0" Width="60px" ToolTip="Percentual de Meta de Margem">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle ForeColor="#009900">
                                        <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </CellStyle>
                                    <FooterCellStyle ForeColor="#009900">
                                    </FooterCellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Real" FieldName="percMargReal" 
                                    VisibleIndex="1" Width="60px" ToolTip="Percentual de Margem Praticada">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle ForeColor="Blue">
                                    </CellStyle>
                                    <FooterCellStyle ForeColor="Blue">
                                    </FooterCellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Dif." FieldName="percMargemDif" 
                                    VisibleIndex="2" Width="60px" ToolTip="Diferença entre o percentual de Margem Praticada e o percentual de Meta de Margem">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <CellStyle>
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </CellStyle>
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <HeaderStyle HorizontalAlign="Center" />
                        </dxwgv:GridViewBandColumn>
                        <dxwgv:GridViewBandColumn Caption="Lucro em R$ (Reais)" Name="bandLucro" VisibleIndex="13" Visible="False" ToolTip="Quadrante de Informações do Lucro">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="2013" FieldName="vlrMargReal" VisibleIndex="0" Width="90px" ToolTip="Valor do lucro do ano atual">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                    <CellStyle ForeColor="Blue">
                                        <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </CellStyle>
                                    <FooterCellStyle ForeColor="Blue">
                                    </FooterCellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="2012" FieldName="vlrMargRealAA1" VisibleIndex="1" Width="90px" ToolTip="Valor do lucro do ano anterior">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="2011" FieldName="vlrMargRealAA2" VisibleIndex="2" Width="90px" ToolTip="Valor do lucro de dois anos anteriores">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                        </dxwgv:GridViewBandColumn>
                        <dxwgv:GridViewDataTextColumn FieldName="vlrMargMeta" Visible="False" VisibleIndex="8" Width="90px">
                        </dxwgv:GridViewDataTextColumn>
                        <dxwgv:GridViewBandColumn Caption="SellOut" ToolTip="Quadrante de Informações do SellOut" VisibleIndex="7">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="LucroSellOut" ToolTip="Valor do SellOut no período selecionado" VisibleIndex="0" Width="80px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                    <HeaderStyle BackColor="Gray" />
                                    <CellStyle ForeColor="#575757">
                                    </CellStyle>
                                    <FooterCellStyle ForeColor="#575757">
                                    </FooterCellStyle>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="%" FieldName="percMargemSellOut" ShowInCustomizationForm="True" ToolTip="Percentual de Margem com SellOut" VisibleIndex="1" Width="60px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle BackColor="Gray" />
                                    <CellStyle ForeColor="#575757">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </CellStyle>
                                    <FooterCellStyle ForeColor="#575757">
                                    </FooterCellStyle>
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                            <HeaderStyle BackColor="Gray" />
                        </dxwgv:GridViewBandColumn>
                        <dxwgv:GridViewBandColumn Caption="Margem Final" ToolTip="Quadrante de Informações de Margem Final" VisibleIndex="10">
                            <Columns>
                                <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="vlrMargemFinal" ToolTip="Valor da Margem Final = Valor da Margem Praticada + Valor do SellOut" VisibleIndex="0" Width="80px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="%" FieldName="percMargemFinal" ToolTip="Percentual da Margem Final = Percentual da Margem Praticada + Percentual do SellOut" VisibleIndex="1" Width="60px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dxwgv:GridViewDataTextColumn>
                            </Columns>
                        </dxwgv:GridViewBandColumn>
                    </Columns>
                    <Settings ShowTitlePanel="True" ShowVerticalScrollBar="True" ShowFooter="True" HorizontalScrollBarMode="Visible" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" />
                    <StylesEditors>
                        <ProgressBar Height="25px">
                        </ProgressBar>
                    </StylesEditors>
                    <Templates>
                        <DetailRow>
                            <dxwgv:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="dsDetail" EnableTheming="True" KeyFieldName="idSecao" OnBeforePerformDataSelect="ASPxGridView2_BeforePerformDataSelect" Theme="Default" OnCustomSummaryCalculate="ASPxGridView2_CustomSummaryCalculate" OnHtmlDataCellPrepared="ASPxGridView2_HtmlDataCellPrepared" OnHtmlFooterCellPrepared="ASPxGridView2_HtmlFooterCellPrepared" OnLoad="ASPxGridView2_Load" Width="910px" >
                                <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                <Styles >
                                    <Header HorizontalAlign="Center" ImageSpacing="5px" SortingImageSpacing="5px">
                                    </Header>
                                    <Footer Font-Bold="True">
                                    </Footer>
                                    <LoadingPanel ImageSpacing="10px">
                                    </LoadingPanel>
                                    <FocusedRow BackColor="#FFFFCC" ForeColor="#0066FF">
                                    </FocusedRow>
                                    <AlternatingRow BackColor="#EEEEEE">
                                    </AlternatingRow>
                                </Styles>
                                <SettingsPager Mode="ShowAllRecords">
                                </SettingsPager>
                                <SettingsText EmptyDataRow="Não informações atualizadas financeiras para este período." />
                                <SettingsDetail ShowDetailButtons="False" />
                                <Images >
                                    <CollapsedButton Height="12px" Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" Width="11px" />
                                    <ExpandedButton Height="12px" Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" Width="11px" />
                                    <DetailCollapsedButton Height="12px" Url="~/App_Themes/Office2003 Blue/GridView/gvCollapsedButton.png" Width="11px" />
                                    <DetailExpandedButton Height="12px" Url="~/App_Themes/Office2003 Blue/GridView/gvExpandedButton.png" Width="11px" />
                                    <FilterRowButton Height="13px" Width="13px" />
                                </Images>
                                <TotalSummary>
                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta" SummaryType="Sum" />
                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrRea" SummaryType="Sum" />
                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMA" SummaryType="Sum" />
                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA1" SummaryType="Sum" />
                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA2" SummaryType="Sum" />
                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA3" SummaryType="Sum" />
                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealMeta" SummaryType="Custom" />
                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMA" SummaryType="Custom" />
                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealAA1" SummaryType="Custom" />
                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealAA3" SummaryType="Custom" />
                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_RealAA2" SummaryType="Custom" />
                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaAnual" SummaryType="Sum" />
                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc_MetaAnual" SummaryType="Custom" />
                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPart_vlrRea" SummaryType="Sum" />
                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargReal" SummaryType="Sum" />
                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargReal" SummaryType="Custom" />
                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargRealAA1" SummaryType="Sum" />
                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargRealAA2" SummaryType="Sum" />
                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAting" SummaryType="Custom" />
                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargMeta" SummaryType="Sum" />
                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargMeta" SummaryType="Custom" />
                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemDif" SummaryType="Custom" />
                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroSellOut" SummaryType="Sum" />
                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSellOut" SummaryType="Custom" />
                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargemSellOut" SummaryType="Custom" />
                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargemFinal" SummaryType="Sum" />
                                    <dxwgv:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinal" SummaryType="Custom" />
                                </TotalSummary>
                                <Columns>
                                    <dxwgv:GridViewBandColumn Caption="Meta Mês" Name="bandMetaMes" ToolTip="Quadrante de Informações de Meta mensal e quanto que falta para atingir a meta do mês." Visible="False" VisibleIndex="5">
                                        <Columns>
                                            <dxwgv:GridViewDataTextColumn Caption="Previsao" FieldName="vlrMetaAnual" VisibleIndex="0" Width="100px" ToolTip="Valor da meta da seção do ano selecionado">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <CellStyle ForeColor="#009900">
                                                    <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="#009900">
                                                </FooterCellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="% Final" FieldName="percCresc_MetaAnual" VisibleIndex="1" Width="60px" ToolTip="Percentual de quanto falta para atingir a meta do mês">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <CellStyle>
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                        </Columns>
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </dxwgv:GridViewBandColumn>
                                    <dxwgv:GridViewBandColumn Caption="Atingimento e Crescimento" VisibleIndex="4" ToolTip="Quadrante de Informações de Atingimento e Crescimento">
                                        <Columns>
                                            <dxwgv:GridViewDataTextColumn Caption="% Prev" FieldName="percCresc_RealMeta" ToolTip="% de crescimento. Meta sobre o  Realizado" VisibleIndex="0" Width="60px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <CellStyle>
                                                    <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="2011" FieldName="percCresc_RealAA1" Name="bandCrescAA1" VisibleIndex="2" Width="60px" ToolTip="Percentual de crescimento sobre o ano anterior">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="2010" FieldName="percCresc_RealAA2" Name="bandCrescAA2" VisibleIndex="3" Width="60px" ToolTip="Percentual de crescimento sobre dois anos anteriores" Visible="False">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="2009" FieldName="percCresc_RealAA3" Name="bandCrescAA3" Visible="False" VisibleIndex="4" Width="60px" ToolTip="Percentual de crescimento sobre três anos anteriores">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dxwgv:GridViewDataTextColumn>
                                        </Columns>
                                        <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                    </dxwgv:GridViewBandColumn>
                                    <dxwgv:GridViewBandColumn Caption="Ano Anterior" VisibleIndex="3" ToolTip="Quadrante de Anos Anteriores">
                                        <Columns>
                                            <dxwgv:GridViewDataTextColumn Caption="2011" FieldName="vlrAA1" Name="bandAA1" VisibleIndex="0" Width="90px" ToolTip="Valor da venda do ano anterior acumulado no mesmo período de dias">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" />
                                                    <CellStyle>
                                                    <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="2010" FieldName="vlrAA2" Name="bandAA2" VisibleIndex="1" Width="90px" ToolTip="Valor da venda de dois anos anteriores acumulados no mesmo período de dias" Visible="False">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" />                                                       
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="2009" FieldName="vlrAA3" Name="bandAA3" Visible="False" VisibleIndex="2" Width="90px" ToolTip="Valor da venda de três anos anteriores acumulados no mesmo período de dias">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dxwgv:GridViewDataTextColumn>
                                        </Columns>
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </dxwgv:GridViewBandColumn>
                                    <dxwgv:GridViewBandColumn Caption="Ano 2012" Name="bandAtual" VisibleIndex="2" ToolTip="Quadrante do Ano Atual">
                                        <Columns>
                                            <dxwgv:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta" VisibleIndex="0" Width="90px" ToolTip="Valor da meta acumulada até o dia de ontem">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <CellStyle ForeColor="#009900">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="#009900">
                                                </FooterCellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="Realizado" FieldName="vlrRea" VisibleIndex="1" Width="90px" ToolTip="Valor realizado acumulado até o dia de ontem">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <CellStyle ForeColor="Blue">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="Blue">
                                                </FooterCellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="% Part" FieldName="percPart_vlrRea" ToolTip="% de participação da venda da filial sobre o total da venda da empresa." VisibleIndex="2" Width="60px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dxwgv:GridViewDataTextColumn>
                                        </Columns>
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </dxwgv:GridViewBandColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="ID" FieldName="idFilial" Visible="False" VisibleIndex="0" Width="30px">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewDataTextColumn Caption="Seção" FieldName="descSecao" VisibleIndex="1" Width="130px" FixedStyle="Left" ToolTip="Nome da seção">
                                        <HeaderStyle HorizontalAlign="Center" />
                                        <CellStyle Wrap="False">
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewBandColumn Caption="Margem Praticada" VisibleIndex="6" ToolTip="Quadrante de Informações da Margem Praticada">
                                        <Columns>
                                            <dxwgv:GridViewDataTextColumn Caption="Meta" FieldName="percMargMeta" VisibleIndex="0" Width="60px" ToolTip="Percentual da Meta de Margem">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <CellStyle ForeColor="#009900">
                                                    <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="#009900">
                                                </FooterCellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="Real" FieldName="percMargReal" VisibleIndex="1" Width="60px" ToolTip="Percentual Realizado da Margem Praticada">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="Dif." FieldName="percMargemDif" VisibleIndex="2" Width="60px" ToolTip="Diferença entre o percentual realizado de margem menos o percentual de meta de margem">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <CellStyle ForeColor="Blue">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="Blue">
                                                </FooterCellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                        </Columns>
                                        <HeaderStyle HorizontalAlign="Center" />
                                    </dxwgv:GridViewBandColumn>
                                    <dxwgv:GridViewBandColumn Caption="Lucro em R$ (Reais)" Name="bandLucro" Visible="False" VisibleIndex="13" ToolTip="Quadrante de Informações do Lucro">
                                        <Columns>
                                            <dxwgv:GridViewDataTextColumn Caption="2013" FieldName="vlrMargReal" VisibleIndex="0" Width="90px" ToolTip="Valor do lucro do ano atual">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                <CellStyle ForeColor="Blue">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="Blue">
                                                </FooterCellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="2012" FieldName="vlrMargRealAA1" VisibleIndex="1" Width="90px" ToolTip="Valor do lucro do ano anterior">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="2011" FieldName="vlrMargRealAA2" VisibleIndex="2" Width="90px" ToolTip="Valor do lucro de dois anos anteriores">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                <CellStyle>
                                                    <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                        </Columns>
                                    </dxwgv:GridViewBandColumn>
                                    <dxwgv:GridViewDataTextColumn FieldName="vlrMargMeta" Visible="False" VisibleIndex="8" Width="0px">
                                    </dxwgv:GridViewDataTextColumn>
                                    <dxwgv:GridViewBandColumn Caption="SellOut" ToolTip="Quadrante de Informações de SellOut" VisibleIndex="7">
                                        <Columns>
                                            <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="LucroSellOut" ToolTip="Valor do SellOut no periodo selecionado" VisibleIndex="0" Width="80px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                <HeaderStyle BackColor="Gray" ForeColor="White" />
                                                <CellStyle ForeColor="#575757">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="#575757">
                                                </FooterCellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="%" FieldName="percMargemSellOut" ShowInCustomizationForm="True" ToolTip="Percentual de Margem com SellOut" VisibleIndex="1" Width="60px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                                <HeaderStyle BackColor="Gray" ForeColor="White" />
                                                <CellStyle ForeColor="#575757">
                                                </CellStyle>
                                                <FooterCellStyle ForeColor="#575757">
                                                </FooterCellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                        </Columns>
                                        <HeaderStyle BackColor="Gray" ForeColor="White" />
                                    </dxwgv:GridViewBandColumn>
                                    <dxwgv:GridViewBandColumn Caption="Margem Final" ToolTip="Quadrante de Informações da Margem Final" VisibleIndex="10">
                                        <Columns>
                                            <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="vlrMargemFinal" ToolTip="Valor da Margem Final = Valor da Margem Praticada + Valor do SellOut" VisibleIndex="0" Width="90px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="%" FieldName="percMargemFinal" ToolTip="Percentual da Margem Final = Percentual da Margem Praticada + Percentual do SellOut" VisibleIndex="1" Width="60px">
                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                </PropertiesTextEdit>
                                            </dxwgv:GridViewDataTextColumn>
                                        </Columns>
                                    </dxwgv:GridViewBandColumn>
                                </Columns>
                                <Settings ShowFooter="True" ShowTitlePanel="True" HorizontalScrollBarMode="Visible" VerticalScrollBarMode="Auto" />
                                <StylesEditors>
                                    <ProgressBar Height="25px">
                                    </ProgressBar>
                                </StylesEditors>
                            </dxwgv:ASPxGridView>
                        </DetailRow>
                    </Templates>
                </dxwgv:ASPxGridView>

                    <asp:SqlDataSource ID="dsSuper" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:gerVendasConnectionString %>"                         
                        
                            SelectCommand="Ano.uspBuscarRankingCompradorResumo" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />                                
                            </SelectParameters>
                        </asp:SqlDataSource>

                    <asp:SqlDataSource ID="dsDetail" runat="server" 
                ConnectionString="<%$ ConnectionStrings:gerVendasConnectionString %>" 
                        
                        
                SelectCommand="Ano.uspBuscarRankingComprador" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />                               
                    <asp:SessionParameter Name="idComprador" SessionField="sCOMPRADOR" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>

    </div>

</asp:Content>


