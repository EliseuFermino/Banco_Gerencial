<%@ Page Title="Comprador - Ranking Mensal" Language="VB" MasterPageFile= "~/MemberPages/Site.master"  AutoEventWireup="false" CodeFile="RankingMesComprador_OLD.aspx.vb" Inherits="MemberPages_RankingMesComprador_OLD" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>



<%@ Register src="../../Controles/wucAno.ascx" tagname="wucAno" tagprefix="uc1" %>
<%@ Register src="../../Controles/wucFixarCabecalho.ascx" tagname="wucFixarCabecalho" tagprefix="uc2" %>

<%@ Register src="../../Controles/wuciListaMes.ascx" tagname="wuciListaMes" tagprefix="uc4" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" Runat="Server">

      

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
            <asp:PostBackTrigger ControlID="btnExcel" />
        </Triggers>
        <ContentTemplate>
                        
                 <table>
                <tr>
                     <td>          
                        <table class="auto-style1">
                            <tr>
                                <td style="width: 100%">
                                    <table class="auto-style1">
                                        <tr>
                                            <td style="width: 103px">
                                                <uc1:wucAno ID="cboAno" runat="server" />
                                            </td>
                                            <td style="width: 150px">
                                                <uc4:wuciListaMes ID="cboMes" runat="server" />
                                            </td>
                                            <td style="width: 134px">
                                                <uc2:wucFixarCabecalho ID="chkFixarCabecalho" runat="server" />
                                            </td>
                                            <td style="width: 155px">
                                                <dxe:ASPxCheckBox ID="chkAnoAnterior" runat="server" AutoPostBack="True" Text="Exibir 2009" Theme="DevEx">
                                                </dxe:ASPxCheckBox>
                                            </td>
                                            <td style="width: 131px">
                                                <dxe:ASPxCheckBox ID="chkMetaMes" runat="server" AutoPostBack="True" Text="Exibir Meta Mês" Theme="DevEx">
                                                </dxe:ASPxCheckBox>
                                            </td>
                                            <td style="width: 130px">
                                               <dxe:ASPxCheckBox ID="chkLucro" runat="server" AutoPostBack="True" Text="Exibir Lucro" Theme="DevEx">
                                                </dxe:ASPxCheckBox>
                                            </td>
                                            <td style="width: 150px">
                                                <uc1:wucSize runat="server" ID="wucSize" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td> 
                </tr>
                <tr>
                    <td>
                        <dxwgv:ASPxGridView ID="ASPxGridView1" runat="server" 
                            AutoGenerateColumns="False" 
                             DataSourceID="dsSuper" KeyFieldName="idComprador" 
                            Theme="SoftOrange" Width="100%">
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                            <Styles >
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
                                <dxwgv:GridViewBandColumn Caption="Meta Mês" ToolTip="Quadrante de Meta mensal e quanto que falta para atingir a meta do mês." 
                                    VisibleIndex="5" Name="bandMetaMes" Visible="False">
                                    <Columns>
                                        <dxwgv:GridViewDataTextColumn Caption="Previsao" FieldName="vlrMetaAnual" 
                                            VisibleIndex="0" Width="100px" ToolTip="Valor da meta do mês selecionado">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="#009900">
                                                <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#009900">
                                            </FooterCellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="% Final" FieldName="percCresc_MetaAnual" 
                                            VisibleIndex="1" Width="60px" ToolTip="Percentual de quanto falta para atingir a meta do mês.">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewBandColumn>
                                <dxwgv:GridViewBandColumn Caption="Atingimento e Crescimento" VisibleIndex="4" ToolTip="Quadrante de Atingimento e Crescimento">
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
                                            VisibleIndex="2" Width="60px" Name="bandCrescAA1" ToolTip="Percentual de Crescimento sobre o Ano Anterior">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="2010" FieldName="percCresc_RealAA2" 
                                            VisibleIndex="3" Width="60px" Name="bandCrescAA2" Visible="False" ToolTip="Percentual de Crescimento sobre o dois anos anteriores">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="2009" FieldName="percCresc_RealAA3" 
                                            VisibleIndex="4" Width="60px" 
                                            Visible="False" Name="bandCrescAA3" ToolTip="Percentual de Crescimento sobre o três anos anteriores">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="% MA" 
                                            ToolTip="Percentual de Crescimento sobre o Mês Anterior" VisibleIndex="1" 
                                            Width="60px" FieldName="percMA">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dxwgv:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                </dxwgv:GridViewBandColumn>
                                <dxwgv:GridViewBandColumn Caption="Ano Anterior" VisibleIndex="3" ToolTip="Quadrante dos Anos Anteriores">
                                    <Columns>
                                        <dxwgv:GridViewDataTextColumn Caption="2011" FieldName="vlrAA1" 
                                            VisibleIndex="0" Width="90px" Name="bandAA1" ToolTip="Valor da venda do ano anterior acumulado no mesmo período de dias.">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="2010" FieldName="vlrAA2" 
                                            VisibleIndex="1" Width="90px" Name="bandAA2" Visible="False" ToolTip="Valor da venda de dois anos anteriores acumulado no mesmo período de dias.">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="2009" FieldName="vlrAA3" 
                                            VisibleIndex="2" Width="90px" 
                                            Visible="False" Name="bandAA3" ToolTip="Valor da venda de três anos anteriores acumulado no mesmo período de dias.">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewBandColumn>
                                <dxwgv:GridViewBandColumn Caption="Ano 2012" VisibleIndex="2" Name="bandAtual" ToolTip="Quadrante do Ano Atual">
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
                                        <dxwgv:GridViewDataTextColumn Caption="Mês Anterior" FieldName="vlrMA" 
                                            VisibleIndex="3" Width="100px" ToolTip="Valor da venda do mês anterior acumulado no mesmo período de dias.">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewBandColumn>
                                <dxwgv:GridViewDataTextColumn Caption="ID" FieldName="idFilial" VisibleIndex="0" 
                                    Width="30px" Visible="False">
                                </dxwgv:GridViewDataTextColumn>
                                <dxwgv:GridViewDataTextColumn Caption="Comprador" FieldName="descComprador" 
                                    VisibleIndex="1" Width="90px" ToolTip="Nome do Comprador">
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
                                            VisibleIndex="1" Width="60px" ToolTip="Percentual de Margem Real">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle ForeColor="Blue">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="Blue">
                                            </FooterCellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="Dif." FieldName="percMargemDif" 
                                            VisibleIndex="2" Width="60px" ToolTip="Diferença entre o percentual de Margem Real e o percentual de Meta de Margem">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                            <HeaderStyle HorizontalAlign="Center" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                    </Columns>
                                    <HeaderStyle HorizontalAlign="Center" />
                                </dxwgv:GridViewBandColumn>
                                <dxwgv:GridViewBandColumn Caption="Lucro em R$ (Reais)" Name="bandLucro" VisibleIndex="13" Visible="False" ToolTip="Quadrante de Lucro">
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
                                <dxwgv:GridViewBandColumn Caption="SellOut" ToolTip="Quadrante do SellOut" VisibleIndex="7">
                                    <Columns>
                                        <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="LucroSellOut" ToolTip="Valor do SellOut no ano atual" VisibleIndex="0" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <HeaderStyle BackColor="Gray" />
                                            <CellStyle ForeColor="#575757">
                                            </CellStyle>
                                            <FooterCellStyle ForeColor="#575757">
                                            </FooterCellStyle>
                                        </dxwgv:GridViewDataTextColumn>
                                        <dxwgv:GridViewDataTextColumn Caption="%" FieldName="percMargemSellOut" ToolTip="Percentual de Margem com SellOut" VisibleIndex="1" Width="60px">
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
                            <Settings ShowTitlePanel="True"  ShowFooter="True" HorizontalScrollBarMode="Visible"  />
                            <StylesEditors>
                                <ProgressBar Height="25px">
                                </ProgressBar>
                            </StylesEditors>
                            <Templates>
                                <DetailRow>
                                    <dxwgv:ASPxGridView ID="ASPxGridView2" runat="server" AutoGenerateColumns="False" DataSourceID="dsDetail" EnableTheming="True" KeyFieldName="idSecao" OnBeforePerformDataSelect="ASPxGridView2_BeforePerformDataSelect" Theme="SoftOrange" OnCustomSummaryCalculate="ASPxGridView2_CustomSummaryCalculate" OnHtmlDataCellPrepared="ASPxGridView2_HtmlDataCellPrepared" OnHtmlFooterCellPrepared="ASPxGridView2_HtmlFooterCellPrepared" OnLoad="ASPxGridView2_Load" Width="950px" >
                                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                        <SettingsDetail ShowDetailRow="True" />
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
                                                    <dxwgv:GridViewDataTextColumn Caption="Previsao" FieldName="vlrMetaAnual" VisibleIndex="0" Width="100px" ToolTip="Valor da meta do mês selecionado">
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
                                                    <dxwgv:GridViewDataTextColumn Caption="2011" FieldName="percCresc_RealAA1" Name="bandCrescAA1" VisibleIndex="2" Width="60px" ToolTip="Percentual de Crescimento sobre o ano anterior">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="2010" FieldName="percCresc_RealAA2" Name="bandCrescAA2" VisibleIndex="3" Width="60px" ToolTip="Percentual de Crescimento sobre os dois anos anteriores" Visible="False">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="2009" FieldName="percCresc_RealAA3" Name="bandCrescAA3" Visible="False" VisibleIndex="4" Width="60px" ToolTip="Percentual de Crescimento sobre os três anos anteriores">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="% MA" FieldName="percMA" ToolTip="Percentual de Crescimento do Mês Anterior" VisibleIndex="1" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                        <EditCellStyle>
                                                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </EditCellStyle>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                            </dxwgv:GridViewBandColumn>
                                            <dxwgv:GridViewBandColumn Caption="Ano Anterior" VisibleIndex="3" ToolTip="Quadrante de Informações dos Anos Anteriores">
                                                <Columns>
                                                    <dxwgv:GridViewDataTextColumn Caption="2011" FieldName="vlrAA1" Name="bandAA1" VisibleIndex="0" Width="90px" ToolTip="Valor da venda do ano anterior acumulado no mesmo período de dias">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="2010" FieldName="vlrAA2" Name="bandAA2" VisibleIndex="1" Width="90px" ToolTip="Valor da venda de dois anos anteriores acumulado no mesmo período de dias" Visible="False">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="2009" FieldName="vlrAA3" Name="bandAA3" Visible="False" VisibleIndex="2" Width="90px" ToolTip="Valor da venda de trêss anos anteriores acumulado no mesmo período de dias">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dxwgv:GridViewBandColumn>
                                            <dxwgv:GridViewBandColumn Caption="Ano 2012" Name="bandAtual" VisibleIndex="2" ToolTip="Quadrante de Informações do Ano Atual">
                                                <Columns>
                                                    <dxwgv:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta" VisibleIndex="0" Width="90px" ToolTip="Valor da meta acumulada até o dia de ontem">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#009900">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#009900">
                                                        </FooterCellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="Realizado" FieldName="vlrRea" VisibleIndex="1" Width="90px" ToolTip="Valor do realizado acumulado até o dia de ontem">
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
                                                    <dxwgv:GridViewDataTextColumn Caption="Mês Anterior" FieldName="vlrMA" VisibleIndex="3" Width="100px" ToolTip="Valor da venda do mês anterior acumulado no mesmo período de dias.">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dxwgv:GridViewBandColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="ID" FieldName="idFilial" Visible="False" VisibleIndex="0" Width="30px">
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewDataTextColumn Caption="Seção" FieldName="descSecao" VisibleIndex="1" Width="130px" ToolTip="Nome da seção">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <CellStyle Wrap="False">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                            </dxwgv:GridViewDataTextColumn>
                                            <dxwgv:GridViewBandColumn Caption="Margem Praticada" VisibleIndex="6" ToolTip="Quadrante de Informações de Margem Praticada">
                                                <Columns>
                                                    <dxwgv:GridViewDataTextColumn Caption="Meta" FieldName="percMargMeta" VisibleIndex="0" Width="60px" ToolTip="Percentual de Meta de Margem">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#009900">
                                                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="#009900">
                                                        </FooterCellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="Real" FieldName="percMargReal" VisibleIndex="1" Width="60px" ToolTip="Percentual de Margem Real">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="Dif." FieldName="percMargemDif" VisibleIndex="2" Width="60px" ToolTip="Diferença entre o Percentual de Margem Real e o percentual de Meta de Margem">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                    </dxwgv:GridViewDataTextColumn>
                                                </Columns>
                                                <HeaderStyle HorizontalAlign="Center" />
                                            </dxwgv:GridViewBandColumn>
                                            <dxwgv:GridViewBandColumn Caption="Lucro em R$ (Reais)" Name="bandLucro" Visible="False" VisibleIndex="13" ToolTip="Quandrante de Informações do Lucro">
                                                <Columns>
                                                    <dxwgv:GridViewDataTextColumn Caption="2013" FieldName="vlrMargReal" VisibleIndex="0" Width="90px" ToolTip="Valor do lucro do ano atual">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                    </dxwgv:GridViewDataTextColumn>
                                                    <dxwgv:GridViewDataTextColumn Caption="2012" FieldName="vlrMargRealAA1" VisibleIndex="1" Width="90px" ToolTip="Valor do lucro do ano anterior">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                        <CellStyle ForeColor="Blue">
                                                            <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
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
                                                    <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="LucroSellOut" ToolTip="Valor do SellOut do período selecionado" VisibleIndex="0" Width="80px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
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
                                        <Settings ShowFooter="True" ShowTitlePanel="True" HorizontalScrollBarMode="Auto"  />
                                        <StylesEditors>
                                            <ProgressBar Height="25px">
                                            </ProgressBar>
                                        </StylesEditors>
                                        <Templates>
                                            <DetailRow>
                                                <dxwgv:ASPxGridView ID="gridFiliais" runat="server" AutoGenerateColumns="False" DataSourceID="dsFiliais" EnableTheming="True" KeyFieldName="descFilial" OnBeforePerformDataSelect="gridFiliais_BeforePerformDataSelect" Theme="Default" Width="900px" OnCustomSummaryCalculate="gridFiliais_CustomSummaryCalculate" OnHtmlDataCellPrepared="gridFiliais_HtmlDataCellPrepared" OnHtmlFooterCellPrepared="gridFiliais_HtmlFooterCellPrepared" OnLoad="gridFiliais_Load">
                                                    <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                                    <Styles>
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
                                                                <dxwgv:GridViewDataTextColumn Caption="Previsao" FieldName="vlrMetaAnual" VisibleIndex="0" Width="100px" ToolTip="Valor da meta do mês selecionado">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle ForeColor="#009900">
                                                                        <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                                    </CellStyle>
                                                                    <FooterCellStyle ForeColor="#009900">
                                                                    </FooterCellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="% Final" FieldName="percCresc_MetaAnual" VisibleIndex="1" Width="60px" ToolTip="Percentual de quanto falta para atingir a meta do mês">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
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
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <EditCellStyle>
                                                                        <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                                    </EditCellStyle>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle>
                                                                        <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                    </CellStyle>
                                                                    <FooterCellStyle ForeColor="Blue">
                                                                    </FooterCellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="2011" FieldName="percCresc_RealAA1" Name="bandCrescAA1" VisibleIndex="2" Width="60px" ToolTip="Percentual de Crescimento sobre o ano anterior">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="2010" FieldName="percCresc_RealAA2" Name="bandCrescAA2" VisibleIndex="3" Width="60px" ToolTip="Percentual de Crescimento sobre dois anos anteriores" Visible="False">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="2009" FieldName="percCresc_RealAA3" Name="bandCrescAA3" Visible="False" VisibleIndex="4" Width="60px" ToolTip="Percentual de Crescimento sobre três anos anteriores">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="% MA" FieldName="percMA" ToolTip="Percentual de Crescimento do Mês Anterior" VisibleIndex="1" Width="60px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle ForeColor="Blue">
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                            </Columns>
                                                            <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                                        </dxwgv:GridViewBandColumn>
                                                        <dxwgv:GridViewBandColumn Caption="Ano Anterior" VisibleIndex="3" ToolTip="Quadrante de Informações dos Anos Anteriores">
                                                            <Columns>
                                                                <dxwgv:GridViewDataTextColumn Caption="2011" FieldName="vlrAA1" Name="bandAA1" VisibleIndex="0" Width="80px" ToolTip="Valor da venda do ano anterior acumulado no mesmo periodo de dias">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="2010" FieldName="vlrAA2" Name="bandAA2" VisibleIndex="1" Width="80px" ToolTip="Valor da venda de dois anos anteriores acumulado no mesmo periodo de dias" Visible="False">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="2009" FieldName="vlrAA3" Name="bandAA3" Visible="False" VisibleIndex="2" Width="80px" ToolTip="Valor da venda de trêss anos anteriores acumulado no mesmo periodo de dias">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle>
                                                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                            </Columns>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                        </dxwgv:GridViewBandColumn>
                                                        <dxwgv:GridViewBandColumn Caption="Ano 2012" Name="bandAtual" VisibleIndex="2" ToolTip="Quadrante de Informações do Ano Atual">
                                                            <Columns>
                                                                <dxwgv:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta" VisibleIndex="0" Width="90px" ToolTip="Valor da meta acumulada até o dia de ontem">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle ForeColor="#009900">
                                                                    </CellStyle>
                                                                    <FooterCellStyle ForeColor="#009900">
                                                                    </FooterCellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Realizado" FieldName="vlrRea" VisibleIndex="1" Width="90px" ToolTip="Valor do realizado acumulado até o dia de ontem">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle ForeColor="Blue">
                                                                    </CellStyle>
                                                                    <FooterCellStyle ForeColor="Blue">
                                                                    </FooterCellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="% Part" FieldName="percPart_vlrRea" ToolTip="% de participação da venda da filial sobre o total da venda da empresa." VisibleIndex="2" Width="60px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Mês Anterior" FieldName="vlrMA" VisibleIndex="3" Width="100px" ToolTip="Valor da venda do mês anterior acumulado no mesmo período de dias.">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle>
                                                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                            </Columns>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                        </dxwgv:GridViewBandColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="ID" FieldName="idFilial" Visible="False" VisibleIndex="0" Width="30px" FixedStyle="Left">
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewDataTextColumn Caption="Filial" FieldName="descFilial" VisibleIndex="1" Width="130px" FixedStyle="Left" ToolTip="Nome da Filial">
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                            <CellStyle Wrap="False">
                                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                            </CellStyle>
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewBandColumn Caption="Margem Praticada" VisibleIndex="6" ToolTip="Quadrante de Informações de Margem Praticada">
                                                            <Columns>
                                                                <dxwgv:GridViewDataTextColumn Caption="Meta" FieldName="percMargMeta" VisibleIndex="0" Width="60px" ToolTip="Percentual de Meta de Margem ">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle ForeColor="#009900">
                                                                        <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                    </CellStyle>
                                                                    <FooterCellStyle ForeColor="#009900">
                                                                    </FooterCellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Real" FieldName="percMargReal" VisibleIndex="1" Width="60px" ToolTip="Percentual de Margem Real">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle>
                                                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                    </CellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="Dif." FieldName="percMargemDif" VisibleIndex="2" Width="60px" ToolTip="Diferença entre o Percentual da Margem Real e o percentual de Meta de Margem">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle ForeColor="Blue">
                                                                    </CellStyle>
                                                                    <FooterCellStyle ForeColor="Blue">
                                                                    </FooterCellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                            </Columns>
                                                            <HeaderStyle HorizontalAlign="Center" />
                                                        </dxwgv:GridViewBandColumn>
                                                        <dxwgv:GridViewBandColumn Caption="Lucro em R$ (Reais)" Name="bandLucro" Visible="False" VisibleIndex="13" ToolTip="Quadrante de Informações de Lucro">
                                                            <Columns>
                                                                <dxwgv:GridViewDataTextColumn Caption="2013" FieldName="vlrMargReal" VisibleIndex="0" Width="90px" ToolTip="Valor do lucro do ano atual">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <CellStyle ForeColor="Blue">
                                                                        <BorderLeft BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                    </CellStyle>
                                                                    <FooterCellStyle ForeColor="Blue">
                                                                    </FooterCellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="2012" FieldName="vlrMargRealAA1" VisibleIndex="1" Width="90px" ToolTip="Valor do lucro do ano anterior">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dxwgv:GridViewDataTextColumn>
                                                                <dxwgv:GridViewDataTextColumn Caption="2011" FieldName="vlrMargRealAA2" VisibleIndex="2" Width="90px" ToolTip="Valor do lucro de dois anos anteriores">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dxwgv:GridViewDataTextColumn>
                                                            </Columns>
                                                        </dxwgv:GridViewBandColumn>
                                                        <dxwgv:GridViewDataTextColumn FieldName="vlrMargMeta" Visible="False" VisibleIndex="8" Width="90px">
                                                        </dxwgv:GridViewDataTextColumn>
                                                        <dxwgv:GridViewBandColumn Caption="SellOut" ToolTip="Quadrante do SellOut" VisibleIndex="7">
                                                            <Columns>
                                                                <dxwgv:GridViewDataTextColumn Caption="R$" FieldName="LucroSellOut" ToolTip="Valor do SellOut do período selecionado" VisibleIndex="0" Width="80px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
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
                                                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                                                    </CellStyle>
                                                                    <FooterCellStyle ForeColor="#575757">
                                                                    </FooterCellStyle>
                                                                </dxwgv:GridViewDataTextColumn>
                                                            </Columns>
                                                            <HeaderStyle BackColor="Gray" ForeColor="White" />
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
                                                    <Settings ShowFooter="True" ShowTitlePanel="True" HorizontalScrollBarMode="Visible" VerticalScrollBarMode="Auto"  />
                                                    <StylesEditors>
                                                        <ProgressBar Height="25px">
                                                        </ProgressBar>
                                                    </StylesEditors>
                                                </dxwgv:ASPxGridView>
                                            </DetailRow>
                                        </Templates>
                                    </dxwgv:ASPxGridView>
                                </DetailRow>
                            </Templates>
                        </dxwgv:ASPxGridView>
                    </td>
                </tr>
            </table>

            
            <table cellspacing="1" class="style1">
                <tr>
                    <td>
                        <asp:SqlDataSource ID="dsSuper" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:gerVendasConnectionString %>" 
                        
                        
                            SelectCommand="Mes.uspBuscarRankingMesCompradorResumo" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
            </table>  
        </ContentTemplate>
    </asp:UpdatePanel>

    <%--Botão Excel--%>
    <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="ASPxGridView1" GuiaNome="Ranking por Comprador Mes" />

    <dxwgv:ASPxGridViewExporter ID="ExporterExcel1" runat="server" 
        GridViewID="ASPxGridView1">
    </dxwgv:ASPxGridViewExporter>

                    <asp:SqlDataSource ID="dsDetail" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:gerVendasConnectionString %>" 
                        
                        
                            SelectCommand="Mes.uspBuscarRankingMesComprador" SelectCommandType="StoredProcedure"><SelectParameters><asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" /><asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                            <asp:SessionParameter Name="idComprador" SessionField="sCOMPRADOR" Type="Int32" />
                        </SelectParameters>
                        </asp:SqlDataSource>

                    <asp:SqlDataSource ID="dsFiliais" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:gerVendasConnectionString %>" 
                        
                        
                            SelectCommand="Mes.uspBuscarRankingMesCompradorFilial" SelectCommandType="StoredProcedure"><SelectParameters><asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" /><asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                            <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Int32" />
                        </SelectParameters>
                        </asp:SqlDataSource>
                       
</asp:Content>


