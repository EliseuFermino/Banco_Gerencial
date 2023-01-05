<%@ Page Title="Semana - Análise de Vendas por Seção" Language="VB" MasterPageFile="~/MemberPages/SiteVendas.master" AutoEventWireup="false" CodeFile="AnaliseVenda_porSecaoSemana.aspx.vb" Inherits="MemberPages_SLV_AnaliseVenda_PorSecaoSemana" %>

<%@ Register src="../../Controles/wucListaDiaIniFin.ascx" tagname="wucListaDiaIniFin" tagprefix="uc1" %>
<%@ Register src="../../Controles/wucBotaoAtualizar.ascx" tagname="wucBotaoAtualizar" tagprefix="uc2" %>

<%@ Register src="../../Controles/wuciListaLojasComApoio.ascx" tagname="wuciListaLojasComApoio" tagprefix="uc3" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<%@ Register assembly="DevExpress.Web.ASPxPivotGrid.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxPivotGrid" tagprefix="dx" %>


<%@ Register src="../../Controles/wucBotaoExcel.ascx" tagname="wucBotaoExcel" tagprefix="uc4" %>

<%@ Register src="../../Controles/wucListaSecao.ascx" tagname="wucListaSecao" tagprefix="uc5" %>

<%@ Register src="../../Controles/wuciListaSemana.ascx" tagname="wuciListaSemana" tagprefix="uc6" %>

<%@ Register src="../../Controles/wucOpcoesSLV.ascx" tagname="wucOpcoesSLV" tagprefix="uc7" %>
<%@ Register Src="~/Controles/wucOpcoesSLV.ascx" TagPrefix="uc1" TagName="wucOpcoesSLV" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <table cellspacing="1" style="width: 845px">
        <tr>
            <td>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <Triggers >
                         <asp:PostBackTrigger ControlID="btnExcel" /> 
                    </Triggers>
                    <ContentTemplate>
                        <table cellspacing="1" style="width: 1008px">
                            <tr>
                                <td style="width :100px">
                                    <uc5:wucListaSecao ID="cboSecao" runat="server" />
                                </td>
                                <td style="width :350px; padding-left :10px">
                                    <uc1:wucListaDiaIniFin ID="cboDia" runat="server" />
                                </td>
                                <td style="text-align: left">
                                    <uc6:wuciListaSemana ID="cboSemana" runat="server" />
                                </td>
                                <td>
                                    <uc2:wucBotaoAtualizar ID="btnAtualizar" runat="server" />
                                </td>
                                <td>

                                    <dx:ASPxCheckBox ID="chkCabecalho" runat="server" AutoPostBack="True" 
                                        Checked="True" CheckState="Checked" Text="Fixar cabeçalho">
                                    </dx:ASPxCheckBox>

                                </td>
                                <td>
                                    <uc4:wucBotaoExcel ID="btnExcel" runat="server" />
                                </td>
                            </tr>
                            <table>
                                <tr>
                                    <td>
                                        <uc1:wucOpcoesSLV ID="wucOpcoesSLV" runat="server" />
                                    </td>
                                </tr>
                            </table>
                            <tr>
                                
                            </tr>
                        </table>
                        <table cellspacing="1" >
                            <tr>
                                <td>
                                   <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" 
                                        EnableTheming="True" Theme="SoftOrange" Width="1100px" 
                                        KeyFieldName="idFilial" Visible="False" DataSourceID="SqlDataSource1">

                                       <TotalSummary>
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartAA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargemAA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartAT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargemAT" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAT" SummaryType="Custom" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescQtde" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescLucro" SummaryType="Custom" />

                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingMetaVlr" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargemMeta" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemMeta" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPercMargem" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAg23Meta" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingAg23" SummaryType="Custom" />

                                           <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeMA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaMA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percPartMA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargemMA" SummaryType="Custom" />
                                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemMA" SummaryType="Custom" />
                                        
                                        </TotalSummary>

                                        <Columns>                                           

                         <%--Dados Ano Anterior--%>

                         <%--Dados Mês Anterior--%>
                                 
                               <%--% Dados Ano Atual--%>

                                <%--% Crescimento--%>
                                                                                     
                                <%--Meta--%>
                                            <dx:GridViewDataTextColumn FieldName="descFilial" VisibleIndex="0" 
                                                Caption="Filial" Width="150px" FixedStyle="Left">
                                                <CellStyle Wrap="False">
                                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewBandColumn Caption="Ano Anterior" Name="bandAnoAnterior" Visible="False" VisibleIndex="1">


                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeAA" ShowInCustomizationForm="True" ToolTip="Quantidade do Ano Anterior (mesmo período)" VisibleIndex="0" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVendaAA" ShowInCustomizationForm="True" ToolTip="Valor da venda do ano anterior (mesmo período)" VisibleIndex="1" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPartAA" ShowInCustomizationForm="True" ToolTip="Percentual de participação da venda da seção sobre a venda total" VisibleIndex="2" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrMargemAA" ShowInCustomizationForm="True" ToolTip="Valor do lucro do ano anterior (mesmo período)" VisibleIndex="3" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargemAA" ShowInCustomizationForm="True" ToolTip="Percentual de margem do ano anterior (mesmo período)" VisibleIndex="4" Width="60px" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#CC9900" HorizontalAlign="Center" />
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Crescimento em %" Name="bandCrescimento" VisibleIndex="18">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeAT" ShowInCustomizationForm="True" ToolTip="Quantidade vendida do período selecionado" VisibleIndex="0" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrVendaAT" ShowInCustomizationForm="True" ToolTip="Valor de venda do período selecionado" VisibleIndex="1" Width="90px">
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPartAT" ShowInCustomizationForm="True" ToolTip="Percentual de participação da venda da seção sobre a venda total" VisibleIndex="2" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="vlrMargemAT" ShowInCustomizationForm="True" ToolTip="Valor do lucro do período selecionado" VisibleIndex="3" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargemAT" ShowInCustomizationForm="True" ToolTip="Percentual de margem do período selecionado" VisibleIndex="4" Width="60px" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#3399FF" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="Blue">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                        <FooterCellStyle ForeColor="Blue">
                                                        </FooterCellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Atual" Name="bandAnoAtual" VisibleIndex="15">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="percCresc" ShowInCustomizationForm="True" ToolTip="Percentual de crescimento de Venda entre periodo atual e periodo do ano anterior" VisibleIndex="0" Width="60px" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Volume" FieldName="percCrescQtde" ShowInCustomizationForm="True" ToolTip="Percentual de crescimento de Quantidade entre periodo atual e periodo do ano anterior" VisibleIndex="1" Width="60px" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Lucro" FieldName="percCrescLucro" ShowInCustomizationForm="True" ToolTip="Percentual de crescimento de Lucro entre periodo atual e periodo do ano anterior" VisibleIndex="2" Width="60px" UnboundType="Decimal">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <CellStyle>
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                            <dx:GridViewBandColumn Caption="Meta" Name="bandMeta" VisibleIndex="20">
                                                <Columns>
                                                    <dx:GridViewDataTextColumn Caption="Venda" FieldName="vlrMeta" ShowInCustomizationForm="True" ToolTip="Valor de meta de venda do período selecionado" VisibleIndex="0" Width="90px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" HorizontalAlign="Center" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Marg" FieldName="percMargemMeta" ShowInCustomizationForm="True" ToolTip="Percentual de meta de margem do período selecionado" VisibleIndex="1" Width="60px">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <HeaderStyle BackColor="#009900" HorizontalAlign="Center" />
                                                        <CellStyle ForeColor="#009900">
                                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                            </dx:GridViewBandColumn>
                                           
                                            <dx:GridViewDataTextColumn FieldName="Tipo" SortIndex="0" SortOrder="Ascending" 
                                                VisibleIndex="22" Visible="False">
                                            </dx:GridViewDataTextColumn>
                                           
                                            <dx:GridViewDataTextColumn FieldName="idFilial" SortIndex="1" 
                                                SortOrder="Ascending" VisibleIndex="23" Visible="False">
                                            </dx:GridViewDataTextColumn>
                                           
                                        </Columns>
                                        <SettingsBehavior AllowFocusedRow="True" />
                                        <SettingsPager Mode="ShowAllRecords">
                                        </SettingsPager>
                                        <Styles>
	                                        <FocusedRow BackColor="#CCFFFF" ForeColor="#333333"> </FocusedRow>
	                                        	<Header HorizontalAlign="Center">
                                            </Header>
	                                        	<AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                            <Footer Font-Bold="True">
                                            </Footer>
                                        </Styles>                                        
                                         <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="400" 
                                            ShowFooter="True" ShowHorizontalScrollBar="True" HorizontalScrollBarMode="Auto" />
                                        <SettingsText EmptyDataRow="Não há informações disponiveis ainda para esse período e seção" />  
                                            
                                    </dx:ASPxGridView>
                                </td>
                            </tr>
                        </table>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                            SelectCommand="SLV.AtualizarAnaliseVendaSecao_porSecao_PorDiaSemana_Buscar" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Usuario" SessionField="sUSUARIO" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
<br />
                        <br />
                    </ContentTemplate>
                </asp:UpdatePanel>
                <br />
            </td>
        </tr>
    </table>

</asp:Content>

