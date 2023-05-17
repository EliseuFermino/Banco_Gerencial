<%@ Page Title="Comparativo Crescimento Item" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="ComparativoCrescimentoItem.aspx.vb" Inherits="MemberPages_SLV_Item_ComparativoCrescimentoItem" ViewStateEncryptionMode="Never" %>

<%@ OutputCache Duration="42000" VaryByParam="none" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>


<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

        #divDia {
            clear: both;
            float: left;
            margin-left: 5px;   
            margin-top : 3px;  
        
        }

        #divFilial {
             float: left;
            margin-left: 5px;       
            margin-top: 2px; 
        }

        #divTodosItens {
             float: left;
            margin-left: 10px;       
        }

        #divMesmosItens {
             float: left;
            margin-left: 10px;       
        }

        #divOcultarAnoAnterior {
            float: left;
            margin-left: 10px;  
        }

        #divBotaoAtualizar {
             float: left;
            margin-left: 10px;       
        }

        #divSize {
             float: left;
            margin-left: -10px;       
        }

        #divDados {
            clear :both ;
             float: left;
            margin-left: 5px;  
            padding-right: 5px;
            width: 100%;     
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


    <div id="divDia">
        <uc1:wucListaDiaIniFin runat="server" ID="cboDia" />
    </div>

    <div id="divFilial">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
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

    <div id="divOcultarAnoAnterior">        
        <dx:ASPxCheckBox ID="chkOcultarAnoAnterior" runat="server" Text="Ocultar Ano Anterior" Theme="DevEx" >
            <ClientSideEvents CheckedChanged="function(s, e) {
                Grid.Refresh();	
                }" />
        </dx:ASPxCheckBox>
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" Theme ="Metropolis" AutoPostBack ="False" Height="15px" >
            <ClientSideEvents Click="function(s, e) {
	cbPanel.PerformCallback();
}" />
        </dx:ASPxButton>
    </div>

    <div id="divSize">
        <uc1:wucSize runat="server" ID="cboSize" AutoPostBack="false"  />
    </div>



    <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="100%" ClientInstanceName ="cbPanel" Theme ="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando" LoadingPanelStyle-VerticalAlign="Bottom"  >
<SettingsLoadingPanel Text="Aguarde. Atualizando"></SettingsLoadingPanel>

<Styles>
<LoadingPanel VerticalAlign="Bottom"></LoadingPanel>
</Styles>

<LoadingPanelStyle VerticalAlign="Bottom"></LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttributes="both">

                <div id="divDados">
                    <dx:ASPxGridView ID="grid" runat="server" ClientInstanceName="grid" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" KeyFieldName="CodProduto" Width="100%">
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
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdVendasAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="VendaAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroSellOutAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroCheiaAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdVendasAT" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="VendaAT" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroSellOutAT" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroCheiaAT" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroAT" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrImpostoAT" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrImpostoAA" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeEstoque" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrEstoque" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeTrocas" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrCAI_AA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrCAI_AT" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMAI_AA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMAI_AT" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAT" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescVolume" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoMedioAA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoMedioAT" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Inflacao" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescReal" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemCheiaAA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemCheiaAT" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSellOutAA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSellOutAT" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCAI_AA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCAI_AT" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMAI_AA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMAI_AT" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percImpostos_AA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percImpostos_AT" SummaryType="Custom" />
                        </TotalSummary>

                        <Columns>

                            <dx:GridViewBandColumn Caption="Produto" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="0">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Código" FieldName="CodProduto" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="0" Width="85px" ToolTip="Código Host do Produto">
                                        <Settings AutoFilterCondition="Contains" ShowFilterRowMenu="True" ShowFilterRowMenuLikeItem="True" ShowInFilterControl="True" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Inclusão" FieldName="DataInclusao" ShowInCustomizationForm="True" ToolTip="Dia de Inclusão do SKU na rede." VisibleIndex="2" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="&nbsp;{0:dd/MM/yyyy} " EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nome do Produto" FieldName="nomeProduto" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="1" Width="160px" ToolTip="Descrição do Produto">
                                        <Settings AutoFilterCondition="Contains" AllowAutoFilter="True" ShowFilterRowMenu="True" ShowFilterRowMenuLikeItem="True" ShowInFilterControl="True" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn> <%--Band Produto - VisibleIndex="0"--%>

                            <dx:GridViewBandColumn Caption="Ranking" VisibleIndex="1">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="2013" FieldName="rnkAA" VisibleIndex="0" Width="50px" ToolTip="Posição no Ranking pela Venda deste ano.">
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="rnkAT" VisibleIndex="1" Width="50px" ToolTip="Posição no Ranking pela Venda deste ano.">
                                        <Settings AutoFilterCondition="LessOrEqual" />
                                        <CellStyle ForeColor="Blue" HorizontalAlign="Center">
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns> 
                            </dx:GridViewBandColumn> <%--Band Ranking - VisibleIndex="1"--%>

                            <dx:GridViewBandColumn Caption="Volume" Name="bandVolume" VisibleIndex="2">

                                <Columns>

                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="QtdVendasAA" VisibleIndex="0" Width="90px" ToolTip="Quantidade Vendida no período selecionado">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AutoFilterCondition="Greater" />
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="QtdVendasAT" VisibleIndex="1" Width="90px" ToolTip="Quantidade Vendida no período selecionado">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescVolume" VisibleIndex="2" Width="80px" ToolTip="Percentual de Crescimento entre o Volume do Ano Atual sobre o Volume do Ano Anterior">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />                                        
                                    </dx:GridViewDataTextColumn>
                                    
                                </Columns>
                            </dx:GridViewBandColumn> <%--Band Volume - VisibleIndex="2"--%>

                            <dx:GridViewBandColumn Caption="Venda em R$" Name="bandVendas" VisibleIndex="3">

                                <Columns>

                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="VendaAA" VisibleIndex="0" Width="100px" ToolTip="Valor da Venda no período selecionado.">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />                                       
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="VendaAT" VisibleIndex="1" Width="100px" ToolTip="Valor da Venda no período selecionado.">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>                                        
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Width="80px" ToolTip="Percentual de Crescimento entre a Venda do Ano Atual sobre a Venda do Ano Anterior">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />                                        
                                    </dx:GridViewDataTextColumn>

                                </Columns>

                            </dx:GridViewBandColumn> <%--Band Venda- VisibleIndex="3"--%>

                            <dx:GridViewBandColumn Caption="Impostos em R$" Name="bandImpostos" VisibleIndex="4">

                                <Columns>

                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="vlrImpostoAA" VisibleIndex="0" Width="100px" ToolTip="Valor do Imposto no período selecionado.">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />                                       
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="vlrImpostoAT" VisibleIndex="1" Width="100px" ToolTip="Valor do Imposto no período selecionado.">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />                                                                           
                                    </dx:GridViewDataTextColumn>                               

                                </Columns>

                            </dx:GridViewBandColumn> <%--Band Venda- VisibleIndex="3"--%>


                            <dx:GridViewBandColumn Caption="Lucro PDV" Name="bandLucroPDV" VisibleIndex="5"> 

                                <Columns>

                                        <dx:GridViewDataTextColumn Caption="2014" FieldName="LucroAA" ShowInCustomizationForm="True" ToolTip="Lucro PDV (Frente de Caixa)" VisibleIndex="0" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>

                                        <dx:GridViewDataTextColumn Caption="2015" FieldName="LucroAT" ShowInCustomizationForm="True" ToolTip="Lucro PDV (Frente de Caixa)" VisibleIndex="1" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AutoFilterCondition="Less" />
                                        </dx:GridViewDataTextColumn>
                                    
                                </Columns>

                            </dx:GridViewBandColumn> <%--Band Lucro PDV- VisibleIndex="4"--%>

                            <dx:GridViewBandColumn Caption="Lucro Sell-Out" Name="bandLucroSellOut" VisibleIndex="6">

                                <Columns>

                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="LucroSellOutAA" ShowInCustomizationForm="True" ToolTip="Lucro do Sell-Out" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="LucroSellOutAT" ShowInCustomizationForm="True" ToolTip="Lucro do Sell-Out" VisibleIndex="1" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>

                                </Columns>

                            </dx:GridViewBandColumn> <%--Band Lucro Sell-Out VisibleIndex="5"--%>

                            <dx:GridViewBandColumn Caption="Lucro Cheio" Name="bandLucroCheio" VisibleIndex="7">

                                <Columns>

                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="LucroCheiaAA" ShowInCustomizationForm="True" ToolTip="Lucro com Sell-Out" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                                                        
                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="LucroCheiaAT" ShowInCustomizationForm="True" ToolTip="Lucro PDV + Lucro Sell-Out" VisibleIndex="1" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                
                                </Columns>

                            </dx:GridViewBandColumn> <%--Band Lucro Cheio - VisibleIndex="6"--%>

                            <dx:GridViewBandColumn Caption="% Margem PDV" Name="bandMargemPDV" VisibleIndex="8">

                                <Columns>

                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="percMargemAA" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual Margem da Frente de Caixa" VisibleIndex="0" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="percMargemAT" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual Margem da Frente de Caixa" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AutoFilterCondition="Less" />
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>

                                </Columns>

                            </dx:GridViewBandColumn> <%--Band % Margem PDV - VisibleIndex="7"--%>

                            <dx:GridViewBandColumn Caption="% Margem Sell-Out" Name="bandMargemSellOut" VisibleIndex="9">

                                <Columns>

                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="percMargemSellOutAA" ShowInCustomizationForm="True" ToolTip="Percentual Margem do Sell-Out" VisibleIndex="0" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="percMargemSellOutAT" ShowInCustomizationForm="True" ToolTip="Percentual Margem do Sell-Out" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    
                                </Columns>

                            </dx:GridViewBandColumn> <%--Band % Margem Sell_out - VisibleIndex="8"--%>

                            <dx:GridViewBandColumn Caption="% Margem Final" Name="badMargemFinal" VisibleIndex="10">

                                <Columns>

                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="percMargemCheiaAA" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual Margem PDV + Sell-Out" VisibleIndex="0" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />                                        
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="percMargemCheiaAT" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual Margem PDV + Sell-Out" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />                                        
                                    </dx:GridViewDataTextColumn>
                                    
                                </Columns>

                            </dx:GridViewBandColumn> <%--Band % Margem Total - VisibleIndex="9"--%>

                            <dx:GridViewBandColumn Caption="% Impostos" Name="badMargemImpostos" VisibleIndex="11">

                                <Columns>

                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="percImpostos_AA" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual de Impostos de Vendas" VisibleIndex="0" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />                                        
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="percImpostos_AT" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual de Impostos de Vendas" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />                                        
                                    </dx:GridViewDataTextColumn>
                                    
                                </Columns>

                            </dx:GridViewBandColumn> <%--Band % Impostos - VisibleIndex="10"--%>
                        
                            <dx:GridViewBandColumn Caption="CAI" Name="bandCAI" VisibleIndex="12">

                                <Columns>

                                    <dx:GridViewDataTextColumn Caption="2017" FieldName="vlrCAI_AA" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Valor do CAI do Período do Ano Passado" VisibleIndex="0" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />                                        
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percCAI_AA" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual do CAI do Período do Ano Passado" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />                                        
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="2018" FieldName="vlrCAI_AT" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Valor do CAI do Período Atual" VisibleIndex="3" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />                                        
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percCAI_AT" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual do CAI do Período Atual" VisibleIndex="4" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />                                        
                                    </dx:GridViewDataTextColumn>
                                    
                                </Columns>

                            </dx:GridViewBandColumn> <%--Band CAI - VisibleIndex="11"--%>


                            <dx:GridViewBandColumn Caption="MAI" Name="bandMAI" VisibleIndex="13">

                                <Columns>

                                    <dx:GridViewDataTextColumn Caption="2017" FieldName="vlrMAI_AA" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Valor do MAI do Período do Ano Passado" VisibleIndex="0" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />                                        
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percMAI_AA" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual do MAI do Período do Ano Passado" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />                                        
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="2018" FieldName="vlrMAI_AT" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Valor do MAI do Período Atual" VisibleIndex="3" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />                                        
                                    </dx:GridViewDataTextColumn>

                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percMAI_AT" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual do MAI do Período Atual" VisibleIndex="4" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />                                        
                                    </dx:GridViewDataTextColumn>
                                    
                                </Columns>

                            </dx:GridViewBandColumn> <%--Band MAI - VisibleIndex="12"--%>


                            <dx:GridViewBandColumn Caption="Preço Médio" Name="bandPrecoMedio" ToolTip="Quadrante do Preço Médio" VisibleIndex="14">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="2013" FieldName="precoMedioAA" VisibleIndex="0" Width="70px" ToolTip="Preço Médio do Produto no período selecionado">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="precoMedioAT" VisibleIndex="1" Width="70px" ToolTip="Preço Médio do Produto no período selecionado">
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
                            </dx:GridViewBandColumn> <%--Band Preco Medio - VisibleIndex="13"--%>

                            <dx:GridViewBandColumn ShowInCustomizationForm="True" Caption="Estoque em " VisibleIndex="15" Name="bandEstoque"><Columns>
<dx:GridViewDataTextColumn FieldName="QtdeEstoque" ShowInCustomizationForm="True" Width="90px" Caption="Qtde" VisibleIndex="0">
    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
    </PropertiesTextEdit>
    <Settings AllowAutoFilter="False" />
</dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn Caption="vlrEstoque" FieldName="vlrEstoque" ShowInCustomizationForm="True" VisibleIndex="2" Width="100px">
        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
        </PropertiesTextEdit>
        <Settings AllowAutoFilter="False" />
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn Caption="Custo Condor" FieldName="vlrCustoCondor" ShowInCustomizationForm="True" VisibleIndex="1" Width="85px">
        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
        </PropertiesTextEdit>
        <Settings AllowAutoFilter="False" />
    </dx:GridViewDataTextColumn>
    <dx:GridViewDataTextColumn Caption="nas Trocas" FieldName="QtdeTrocas" ShowInCustomizationForm="True" VisibleIndex="3" Width="80px">
        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
        </PropertiesTextEdit>
        <Settings AllowAutoFilter="False" />
    </dx:GridViewDataTextColumn>
</Columns>
    <HeaderStyle BackColor="#003366" ForeColor="White" />
</dx:GridViewBandColumn> <%--Band Estoque - VisibleIndex="14"--%>

                            <dx:GridViewBandColumn Caption="Mercadológico" ToolTip="Quadrante Mercadológico" VisibleIndex="16">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="Departamento" VisibleIndex="0" Width="90px">
                                        <Settings AutoFilterCondition="Contains" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Seção" FieldName="Secao" VisibleIndex="1" Width="100px">
                                        <Settings AutoFilterCondition="Contains" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Grupo" ShowInCustomizationForm="True" VisibleIndex="2" Width="100px">
                                        <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Subgrupo" ShowInCustomizationForm="True" VisibleIndex="3" Width="100px">
                                        <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                        <CellStyle Wrap="False">
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>


                                </Columns>
                            </dx:GridViewBandColumn> <%--Band Mercadológico - VisibleIndex="15"--%>

                            <dx:GridViewBandColumn Caption="Fornecedor" Name="bandFornecedor" ShowInCustomizationForm="True" ToolTip="Quadrante Fornecedor" VisibleIndex="17" >
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="ID" FieldName="idFornecedor" ShowInCustomizationForm="True" ToolTip="Código do Fornecedor" VisibleIndex="0" Width="80px">
                                        <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Descrição" FieldName="nomeFornecedor" ShowInCustomizationForm="True" ToolTip="Descrição do Fornecedor" VisibleIndex="1" Width="150px">
                                        <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="CGC Fornecedor Principal" FieldName="cgcPrincipal" ShowInCustomizationForm="True" ToolTip="CGC Fornecedor Principal" VisibleIndex="2" Width="80px">
                                        <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Fornecedor Principal" FieldName="NomeFornecedorPrincipal" ShowInCustomizationForm="True" ToolTip="Nome do Fornecedor Principal" VisibleIndex="3" Width="150px">
                                        <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn> <%--Band Fornecedor - VisibleIndex="16"--%>

                            <dx:GridViewDataTextColumn Caption="Comprador" FieldName="nomeCompradorAbrev" ShowInCustomizationForm="True" ToolTip="Nome do Comprador que compra o produto" VisibleIndex="18" Width="90px">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                            </dx:GridViewDataTextColumn> <%--Comprador - VisibleIndex="17"--%>

                            <dx:GridViewDataTextColumn Caption="Sistemática" FieldName="Sistematica" ShowInCustomizationForm="True" VisibleIndex="19" Width="70px">
                                <CellStyle HorizontalAlign="Center">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>  <%--Sistematica - VisibleIndex="18"--%>

                            <dx:GridViewDataTextColumn Caption="EAN" FieldName="EAN" ShowInCustomizationForm="True" VisibleIndex="20" Width="120px">
                                <CellStyle HorizontalAlign="Right">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>  <%--Sistematica - VisibleIndex="19"--%>


                            <dx:GridViewBandColumn Caption="Classificação Mercadológica ABC" Name="bandABC" ShowInCustomizationForm="True" VisibleIndex="21">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Depto" FieldName="Classif_Giro_Valor_Depto" ShowInCustomizationForm="True" ToolTip="Classificação do ABC com base nos produtos do Departamento." VisibleIndex="0" Width="60px">
                                        <HeaderStyle BackColor="#FFCC99" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Seção" FieldName="Classif_Giro_Valor_Secao" ShowInCustomizationForm="True" ToolTip="Classificação do ABC com base nos produtos da Seção." VisibleIndex="1" Width="60px">
                                        <HeaderStyle BackColor="#FFCC99" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Grupo" FieldName="Classif_Giro_Valor_Grupo" ShowInCustomizationForm="True" ToolTip="Classificação do ABC com base nos produtos do Grupo de Familia." VisibleIndex="2" Width="60px">
                                        <HeaderStyle BackColor="#FFCC99" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Subgrupo" FieldName="Classif_Giro_Valor_Subgrupo" ShowInCustomizationForm="True" ToolTip="Classificação do ABC com base nos produtos do Subgrupo de Familia." VisibleIndex="3" Width="75px">
                                        <HeaderStyle BackColor="#FFCC99" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                <HeaderStyle BackColor="#FFCC99" />
                            </dx:GridViewBandColumn> <%--Sistematica - VisibleIndex="20"--%>


                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager PageSize="17">
                        </SettingsPager>
                        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" ></SettingsExport>
                        <Settings ShowFilterRow="True" ShowGroupPanel="True" HorizontalScrollBarMode="Visible" ShowFooter="True" EnableFilterControlPopupMenuScrolling="True" ShowFilterBar="Visible" ShowFilterRowMenu="True" ShowFilterRowMenuLikeItem="True" />
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
<%--SelectCommand="Analises.usp_ComparativoCrescimentoItem" SelectCommandType="StoredProcedure" CacheExpirationPolicy="Sliding"  EnableCaching="False">--%>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" 
                        SelectCommand="Analises.usp_ComparativoCrescimentoItem" SelectCommandType="StoredProcedure" CacheExpirationPolicy="Sliding"  EnableCaching="True" >
                        <SelectParameters>                           
                            <asp:SessionParameter Name="DiaInicial" SessionField="sDIA_INICIAL" Type="DateTime" />
                            <asp:SessionParameter Name="DiaFinal" SessionField="sDIA_FINAL" Type="DateTime" />
                            <asp:SessionParameter Name="MesmosItens" SessionField="sITENS" Type="Byte" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="int16" />
                            <asp:SessionParameter Name="MesmosDias" SessionField="sMESMOS_DIAS" Type="Byte" />
                            <asp:SessionParameter Name="MesAnterior" SessionField="sMES_ANTERIOR" Type="Byte" />
                            <asp:SessionParameter Name="Tipo" SessionField="sTIPO" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>

            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>

    <br />
    <uc1:wucObsPrograma runat="server" ID="wucObsPrograma"  Anotacao1="Banco: gerVendaItem" Anotacao2="Stored procedure: Analises.usp_ComparativoCrescimentoItem"/>

</asp:Content>

