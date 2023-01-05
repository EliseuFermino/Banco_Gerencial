<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="AnaliseFornecedor_SLV.aspx.vb" Inherits="MemberPages_SLV_Fornecedor_AnaliseFornecedor_SLV" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>








<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucMercadologicoNew.ascx" TagPrefix="uc1" TagName="wucMercadologicoNew" %>





<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #ShowButton {
            float: left;
            margin-left: 2px;
            width: 115px;  
            padding-top: 2px;                      
        }

        #divPeriodo {            
            float: left;    
            padding-top: 5px;        
        }

        #divBotaoAtualizar {
            float: left;
            margin-left: 5px;
            padding-top: 2px;  
        }

        #divFixarCabecalho {
            float: left;
            margin-left: 5px;
            padding-top: 3px; 
        }

        #divExcel {
            float: left;
            margin-left: 15px;
            padding-top: 1px; 
        }

        #divDados {
            clear: both;
            float: left;  
            margin-left: 2px; 
            margin-top: 5px;        
        }


    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <div id="ShowButton" >
        <uc1:wucMercadologicoNew runat="server" ID="cboMercadologico" />
    </div>

    <div id="divPeriodo">
        <uc1:wucListaDiaIniFin runat="server" ID="cboDia" />
    </div>
    

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme ="Metropolis">
            <ClientSideEvents Click="function(s, e) {
	cbPanelGrid.PerformCallback();
}" />
        </dx:ASPxButton>
    </div>

    <div id="divFixarCabecalho">
        <dx:ASPxCheckBox ID="chkFixarCabecalho" runat="server" Theme ="DevEx" Text ="Fixar cabeçalho" Checked="True" CheckState="Checked">
            <ClientSideEvents CheckedChanged="function(s, e) {
	cbPanelGrid.PerformCallback();
}" />
        </dx:ASPxCheckBox>
    </div>

    <div id="divExcel">
        <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="grid" />
    </div>

    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cbPanelGrid" runat="server" Width="900px" ClientInstanceName ="cbPanelGrid" Theme ="Metropolis" SettingsLoadingPanel-Text ="Atualizando...">
            <PanelCollection>
                <dx:PanelContent ID="PanelContent1"  runat="server" SupportsDisabledAttributes="both">
                    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" Width="1000px" Visible="False" KeyFieldName="idFornecedor">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAT" SummaryType="Sum" />


                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercialAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercialAT" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAT" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroSellOutAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroSellOutAT" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroCheioAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroCheioAT" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difValor" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />
                        </TotalSummary>
                        <Columns>
                            <dx:GridViewBandColumn Caption="Lucro PDV" ShowInCustomizationForm="True" VisibleIndex="6" Name="bandLucroPDV">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="vlrLucroComercialAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrLucroComercialAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescLucroComercial" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn Caption="Código" FieldName="idFornecedor" ShowInCustomizationForm="True" VisibleIndex="0" Width="80px" FixedStyle="Left">
                                <CellStyle HorizontalAlign="Right">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="nomeFornecedor" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="1" Width="150px">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
<dx:GridViewBandColumn ShowInCustomizationForm="True" Caption="% Participação" VisibleIndex="3" FixedStyle="Left"><Columns>
<dx:GridViewDataTextColumn FieldName="percPartAA" ShowInCustomizationForm="True" Width="50px" VisibleIndex="0">
<PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
</dx:GridViewDataTextColumn>
<dx:GridViewDataTextColumn FieldName="percPartAT" ShowInCustomizationForm="True" Width="50px" VisibleIndex="1">
<PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
</dx:GridViewDataTextColumn>
</Columns>
</dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Volume" ShowInCustomizationForm="True" VisibleIndex="4">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="QtdeAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="QtdeAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescQtde" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Vendas R$" ShowInCustomizationForm="True" VisibleIndex="5">
                                <Columns>                                    
                                    <dx:GridViewDataTextColumn Caption="2013" FieldName="vlrVendaAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="vlrVendaAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescVenda" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Posição Ranking" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="2">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="2013" FieldName="posRnkAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle Font-Bold="True" HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="posRnkAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn ShowInCustomizationForm="True" VisibleIndex="7" Caption="Lucro do Sell-Out">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="vlrLucroSellOutAA" ShowInCustomizationForm="True" VisibleIndex="0">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrLucroSellOutAT" ShowInCustomizationForm="True" VisibleIndex="1">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescLucroSellOut" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Lucro Final" ShowInCustomizationForm="True" VisibleIndex="8">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="vlrLucroCheioAT" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="vlrLucroCheioAA" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Perc" FieldName="percMargemCheiaAA" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                        </Columns>
                        <SettingsBehavior ColumnResizeMode="Control" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings ShowFooter="True" VerticalScrollableHeight="450" HorizontalScrollBarMode="Visible" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="WhiteSmoke">
                            </AlternatingRow>
                            <Footer Font-Bold="True">
                            </Footer>
                        </Styles>
                    </dx:ASPxGridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaFornecedoresSLVConnectionString %>" SelectCommand="dbo.usp_AnaliseFornecedor_SLV" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter DbType="Date" Name="DiaInicial" SessionField="sDIA_INICIAL" />
                            <asp:SessionParameter DbType="Date" Name="DiaFinal" SessionField="sDIA_FINAL" />                            
                            <asp:SessionParameter Name="Mercadologico" SessionField="sMERCADOLOGICO" Type="Int16" />
                            <asp:SessionParameter Name="CNPJ" SessionField="sCNPJ" Type="Byte" />
                            <asp:SessionParameter Name="Opcao" SessionField="sOPCAO" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:Label ID="lblError" runat="server" Text="" ForeColor ="Red" ></asp:Label>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>

    
</asp:Content>


