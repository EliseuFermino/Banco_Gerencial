<%@ Page Title="Comparativo Crescimento Item" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="AnaliseCompCrescItem.aspx.vb" Inherits="MemberPages_SLV_AnaliseCompCrescItem" %>

<%@ OutputCache Duration="42000" VaryByParam="none" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>
<%@ Register Src="~/Controles/wucListaSecao.ascx" TagPrefix="uc1" TagName="wucListaSecao" %>
<%@ Register Src="~/Controles/wucObsPrograma.ascx" TagPrefix="uc1" TagName="wucObsPrograma" %>







<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >


        #divDia {
             float: left;
            margin-left: 5px;        
        }

        #divFilial {
             float: left;
            margin-left: 5px;       
            margin-top: 2px; 
        }

        #divSecao {
            clear:both ;
             float: left;
            margin-left: 5px;  
            padding-top: 3px;     
        }

        #divTodosItens {
             float: left;
            margin-left: 10px;  
            margin-Top: 10px;     
        }

        #divMesmosItens {
             float: left;
            margin-left: 10px;
             margin-Top: 10px;        
        }

        #divBotaoAtualizar {
             float: left;
            margin-left: 10px;   
            margin-top: 3px;     
        }

        #divSize {
             float: left;
            margin-left: 10px;       
        }
         

        #divDados {
            clear :both ;
             float: left;
            margin-left: 5px;  
            padding-right: 5px;
            margin-top: 5px;  
            width: 100%;   
        }

    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


    <div id="divDia">
        <uc1:wucListaDiaIniFin runat="server" ID="cboDia"  />
    </div>

    <div id="divFilial">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" Theme ="MetropolisBlue" AutoPostBack ="False" Height="30px" >
            <ClientSideEvents Click="function(s, e) {
	cbPanel.PerformCallback();
}" />
        </dx:ASPxButton>
    </div>

    <div id="divSize">
        <uc1:wucSize runat="server" ID="cboSize" />
    </div>
    

    <div id="divSecao">
        <uc1:wucListaSecao runat="server" ID="cboSecao" />
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




    <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="100%" ClientInstanceName ="cbPanel" Theme ="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando" LoadingPanelStyle-VerticalAlign="Bottom"  >
<LoadingPanelStyle VerticalAlign="Bottom"></LoadingPanelStyle>
        <PanelCollection>
            <dx:PanelContent ID="PanelContent1" runat="server" SupportsDisabledAttributes="both">

                <div id="divDados">
                    <dx:ASPxGridView ID="grid" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False" KeyFieldName="CodProduto" Width="100%" Visible="False" >
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

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="pesoAT" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="pesoAA" SummaryType="Sum" />
                            
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdVendasAT" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="VendaAT" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="ImpostosAT" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="ImpostosAA" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroSellOutAT" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroSellOutAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroCheioAT" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroCheioAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroComercialAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroComercialAT" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeEstoque" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrEstoque" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeTrocas" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrCAI_AA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrCAI_AT" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMAI_AA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMAI_AT" SummaryType="Sum" />


                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescVolume" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescPeso" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoMedioAA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoMedioAT" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Inflacao" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescReal" SummaryType="Custom" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemComercialAA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemComercialAT" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemCheioAA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemCheioAT" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSellOutAA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSellOutAT" SummaryType="Custom" />

                             <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPercMargemComercial" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPercMargemSellOut" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difPercMargemCheio" SummaryType="Custom" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numClientesAA" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numClientesAT" SummaryType="Sum" />
                             <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difClientes" SummaryType="Sum" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescImpostos" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescLucroComercial" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescLucroSellOut" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescLucroCheio" SummaryType="Custom" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCAI_AA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCAI_AT" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMAI_AA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMAI_AT" SummaryType="Custom" />

                        </TotalSummary>
                        <Columns>
                            <%--Band Produto - VisibleIndex="0" --%>
                            
                            <%--Band Ranking - VisibleIndex="1"--%> 

                            <%--Band Participação - VisibleIndex="2"--%> 

                            <%--Band Quantidade - VisibleIndex="3"--%>


                            <%--Band Quantidade - VisibleIndex="3"--%>

                            <%--Band Vendas - VisibleIndex="4"--%>

                            <%--Band Impostos - VisibleIndex="5"--%>



                            <%--Band Lucro PDV - VisibleIndex="6"--%>

                            <%--Band Lucro Sell-Out - VisibleIndex="7"--%>

                            <%--Band Lucro Cheio - VisibleIndex="8"--%>


                            <%--Band % Margem Comercial - VisibleIndex="9"--%>

                            <%--Band  % Margem Sell-Out - VisibleIndex="10"--%>

                            <%--Band  % Margem Cheio - VisibleIndex="11"--%>



                            <%--Band Clientes - VisibleIndex="12"--%>

                            <%--Band Preço Médio - VisibleIndex="13"--%>

                            <%--Band Mercadológico - VisibleIndex="14"--%>


                            

                            <%--Band Fornecedor - VisibleIndex="15"--%>

                            <%--Band Comprador - VisibleIndex="16"--%>

                            <%--Sistematica - VisibleIndex="17"--%>

                            <%--Sistematica - VisibleIndex="18"--%>




                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" Visible="False" VisibleIndex="0" ShowClearFilterButton="True"/>

                            <dx:GridViewBandColumn Caption="Produto" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="0">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Código" FieldName="CodProduto" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="0" Width="70px" ToolTip="Código Host do Produto">
                                        <Settings AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nome do Produto" FieldName="nomeProduto" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="1" Width="150px" ToolTip="Descrição do Produto">
                                        <Settings AutoFilterCondition="Contains" />
                                        <CellStyle Wrap="False">                                           
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Status" FieldName="Ativo" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="2" Width="100px">
                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                    <CellStyle Wrap="False" HorizontalAlign="Center" >
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </CellStyle>
                                    <FooterCellStyle>
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </FooterCellStyle>
                                    <GroupFooterCellStyle>
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </GroupFooterCellStyle>
                                </dx:GridViewDataTextColumn>

                                </Columns>
                            </dx:GridViewBandColumn> 

                                    <dx:GridViewDataTextColumn Caption="Inclusão" FieldName="DataInclusao" ShowInCustomizationForm="True" VisibleIndex="2" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="&nbsp;{0:dd/MM/yyyy}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                            
                            <dx:GridViewBandColumn Caption="Ranking" VisibleIndex="1">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="2013" FieldName="rnkAA" VisibleIndex="0" Width="50px" ToolTip="Posição no Ranking pela Venda do ano passado.">
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="rnkAT" VisibleIndex="1" Width="50px" ToolTip="Posição no Ranking pela Venda deste ano." SortIndex="0" SortOrder="Ascending">
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>  

                            <dx:GridViewBandColumn Caption="% de Participação" ShowInCustomizationForm="True" VisibleIndex="2">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Individual" FieldName="percPartInd" ShowInCustomizationForm="True" ToolTip="Percentual de Participação de cada produto no Total - Ano Atual" VisibleIndex="0" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Acumulado" FieldName="percPartAcu" ShowInCustomizationForm="True" ToolTip="Soma acumulatico do % de Participação Individual - Ano Atual" VisibleIndex="1" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="True" HeaderFilterMode="CheckedList" ShowFilterRowMenu="True" ShowFilterRowMenuLikeItem="True" ShowInFilterControl="True" AutoFilterCondition="LessOrEqual" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>  

                            <dx:GridViewBandColumn Caption="Peso / Unidade / Litro" Name="bandAnoAnteriorPeso" ShowInCustomizationForm="True" VisibleIndex="3">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="pesoAA" ShowInCustomizationForm="True" ToolTip="Peso Vendido no período selecionado" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="pesoAT" ShowInCustomizationForm="True" ToolTip="Peso Vendida no período selecionado" VisibleIndex="1" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc." FieldName="percCrescPeso" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento entre o Peso do Ano Atual sobre o Peso do Ano Anterior" VisibleIndex="3" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn> 


                            <dx:GridViewBandColumn Caption="Volume" Name="bandAnoAnterior" ShowInCustomizationForm="True" VisibleIndex="3">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="QtdVendasAA" ShowInCustomizationForm="True" ToolTip="Quantidade Vendida no período selecionado" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="QtdVendasAT" ShowInCustomizationForm="True" ToolTip="Quantidade Vendida no período selecionado" VisibleIndex="1" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc." FieldName="percCrescVolume" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento entre o Volume do Ano Atual sobre o Volume do Ano Anterior" VisibleIndex="3" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn> 

                            <dx:GridViewBandColumn Caption="Vendas" Name="bandAnoAtual" ShowInCustomizationForm="True" VisibleIndex="4">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="VendaAA" ShowInCustomizationForm="True" ToolTip="Valor da Venda no período selecionado." VisibleIndex="1" Width="100px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="VendaAT" ShowInCustomizationForm="True" ToolTip="Valor da Venda no período selecionado." VisibleIndex="1" Width="100px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc." FieldName="percCresc" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento entre a Venda do Ano Atual sobre a Venda do Ano Anterior" VisibleIndex="3" Width="80px">
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
                                </Columns>
                            </dx:GridViewBandColumn> 

                            <dx:GridViewBandColumn Caption="Impostos" Name="bandImpostos" ShowInCustomizationForm="True" VisibleIndex="5">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="ImpostosAA" ShowInCustomizationForm="True" ToolTip="Valor do Impostos de Frente de Caixa no período selecionado." VisibleIndex="0" Width="85px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="ImpostosAT" ShowInCustomizationForm="True" ToolTip="Valor do Impostos de Frente de Caixa no período selecionado." VisibleIndex="1" Width="85px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc." FieldName="percCrescImpostos" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento entre o Impostos do Ano Atual sobre o Impostos do Ano Anterior" VisibleIndex="3" Width="65px">
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
                                </Columns>
                            </dx:GridViewBandColumn> 



                            <dx:GridViewBandColumn Caption="Lucro PDV" Name="bandLucroPDV" ShowInCustomizationForm="True" VisibleIndex="6">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="LucroComercialAA" ShowInCustomizationForm="True" ToolTip="Valor do Lucro de Frente de Caixa no período selecionado." VisibleIndex="0" Width="85px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="LucroComercialAT" ShowInCustomizationForm="True" ToolTip="Valor do Lucro de Frente de Caixa no período selecionado." VisibleIndex="1" Width="85px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc." FieldName="percCrescLucroComercial" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento entre o Lucro de Frente de Caixa do Ano Atual sobre o Lucro de Frente de Caixa do Ano Anterior" VisibleIndex="3" Width="65px">
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
                                </Columns>
                            </dx:GridViewBandColumn> 

                            <dx:GridViewBandColumn Caption="Lucro Sell-Out" Name="bandLucroSellOut" ShowInCustomizationForm="True" VisibleIndex="7">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="LucroSellOutAA" ShowInCustomizationForm="True" ToolTip="Valor do Sell-Out que passou na Frente de Caixa no período selecionado." VisibleIndex="0" Width="85px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="LucroSellOutAT" ShowInCustomizationForm="True" ToolTip="Valor do Sell-Out que passou na Frente de Caixa no período selecionado." VisibleIndex="1" Width="85px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc." FieldName="percCrescLucroSellOut" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento entre o Sell-Out que passou na Frente de Caixa do Ano Atual sobre o Sell-Out que passou na Frente de Caixa do Ano Anterior" VisibleIndex="3" Width="65px">
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
                                </Columns>
                            </dx:GridViewBandColumn> 

                            <dx:GridViewBandColumn Caption="Lucro Cheio" Name="bandLucroCheio" ShowInCustomizationForm="True" VisibleIndex="8">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="LucroCheioAA" ShowInCustomizationForm="True" ToolTip="Valor do Lucro de Frente de Caixa + Sell-Out que passou na Frente de Caixa no período selecionado." VisibleIndex="0" Width="85px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="LucroCheioAT" ShowInCustomizationForm="True" ToolTip="Valor do Lucro de Frente de Caixa + Sell-Out que passou na Frente de Caixa no período selecionado." VisibleIndex="1" Width="85px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc." FieldName="percCrescLucroCheio" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento entre do Lucro de Frente de Caixa + Sell-Out que passou na Frente de Caixa do Ano Atual sobre do Lucro de Frente de Caixa + Sell-Out que passou na Frente de Caixa do Ano Anterior" VisibleIndex="3" Width="65px">
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
                                </Columns>
                            </dx:GridViewBandColumn> 


                            <dx:GridViewBandColumn Caption="% Margem PDV" Name="bandPercentualMargemPDV" ShowInCustomizationForm="True" VisibleIndex="9">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="percMargemComercialAA" ShowInCustomizationForm="True" ToolTip="Percentual de Margem que passou na Frente de Caixa no período selecionado." VisibleIndex="0" Width="85px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="percMargemComercialAT" ShowInCustomizationForm="True" ToolTip="Percentual de Margem de Frente de Caixa que passou na Frente de Caixa no período selecionado." VisibleIndex="1" Width="85px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Dif." FieldName="difPercMargemComercial" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Diferença entre o Percentual de Margem do Ano Atual e o Percentual de Margem do Ano Anterior" VisibleIndex="3" Width="65px">
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
                                </Columns>
                            </dx:GridViewBandColumn> 

                            <dx:GridViewBandColumn Caption="% Margem Sell-Out" Name="bandPercentualMArgemPDV" ShowInCustomizationForm="True" VisibleIndex="10">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="percMargemSellOutAA" ShowInCustomizationForm="True" ToolTip="Percentual de Margem do Sell-Out que passou na Frente de Caixa no período selecionado." VisibleIndex="0" Width="85px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="percMargemSellOutAT" ShowInCustomizationForm="True" ToolTip="Percentual de Margem do Sell_Out que passou na Frente de Caixa que passou na Frente de Caixa no período selecionado." VisibleIndex="1" Width="85px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Dif." FieldName="difPercMargemSellOut" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Diferença entre o Percentual de Margem do Sell-Out do Ano Atual e o Percentual de Margem do Sell-Out do Ano Anterior" VisibleIndex="3" Width="65px">
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
                                </Columns>
                            </dx:GridViewBandColumn> 

                            <dx:GridViewBandColumn Caption="% Margem Final" Name="bandPercentualMargemFinal" ShowInCustomizationForm="True" VisibleIndex="11">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="percMargemCheioAA" ShowInCustomizationForm="True" ToolTip="Percentual de Margem do Sell-Out + Percentual da Frente de Caixa no período selecionado." VisibleIndex="0" Width="85px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="percMargemCheioAT" ShowInCustomizationForm="True" ToolTip="Percentual de Margem do Sell-Out + Percentual da Frente de Caixa que passou na Frente de Caixa no período selecionado." VisibleIndex="1" Width="85px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Dif." FieldName="difPercMargemCheio" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Diferença entre o Percentual de Margem do Sell-Out + Percentual da Frente de Caixa do Ano Atual e o Percentual de Margem do Sell-Out + Percentual da Frente de Caixa do Ano Anterior" VisibleIndex="3" Width="65px">
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
                                </Columns>
                            </dx:GridViewBandColumn> 


                            <dx:GridViewBandColumn Caption="CAI" Name="bandCAI" VisibleIndex="11">

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


                            <dx:GridViewBandColumn Caption="MAI" Name="bandMAI" VisibleIndex="12">

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


                            <dx:GridViewBandColumn Caption="Número de Clientes" ShowInCustomizationForm="True" VisibleIndex="12">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="numClientesAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="numClientesAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difClientes" ShowInCustomizationForm="True" VisibleIndex="2" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn> 

                            <dx:GridViewBandColumn Caption="Preço Médio" ShowInCustomizationForm="True" ToolTip="Quadrante do Preço Médio" VisibleIndex="13">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="2013" FieldName="precoMedioAA" ShowInCustomizationForm="True" ToolTip="Preço Médio do Produto no período selecionado" VisibleIndex="0" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="precoMedioAT" ShowInCustomizationForm="True" ToolTip="Preço Médio do Produto no período selecionado" VisibleIndex="1" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Inflação Interna" FieldName="Inflacao" ShowInCustomizationForm="True" VisibleIndex="2" Width="100px">
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
                                    <dx:GridViewDataTextColumn Caption="% Cresc. Real" FieldName="percCrescReal" ShowInCustomizationForm="True" ToolTip="Percentual do Crescimento Real (Inflação Interna menos Crescimento em R$)" VisibleIndex="3" Width="90px">
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
<dx:GridViewBandColumn ShowInCustomizationForm="True" Caption="Estoque em " VisibleIndex="14" Name="bandEstoque"><Columns>
    <dx:GridViewDataTextColumn FieldName="QtdeEstoque" ShowInCustomizationForm="True" Width="90px" Caption="Qtde" VisibleIndex="0">
        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
        </PropertiesTextEdit>
    </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="vlrEstoque" FieldName="vlrEstoque" ShowInCustomizationForm="True" VisibleIndex="2" Width="100px">
            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
            </PropertiesTextEdit>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="Custo Condor" FieldName="vlrCustoCondor" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
            </PropertiesTextEdit>
        </dx:GridViewDataTextColumn>
        <dx:GridViewDataTextColumn Caption="nas Trocas" FieldName="QtdeTrocas" ShowInCustomizationForm="True" VisibleIndex="3" Width="80px">
            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
            </PropertiesTextEdit>
        </dx:GridViewDataTextColumn>
    </Columns>
    <HeaderStyle BackColor="#003366" ForeColor="White" />
</dx:GridViewBandColumn>

                            <dx:GridViewBandColumn Caption="Mercadológico" VisibleIndex="15" ToolTip="Quadrante Mercadológico">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Familia" FieldName="Subgrupo" ShowInCustomizationForm="True" VisibleIndex="2" Width="100px">
                                        <Settings AutoFilterCondition="Contains" />
                                        <CellStyle Wrap="False">
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Grupo de Familia" FieldName="Grupo" ShowInCustomizationForm="True" VisibleIndex="1" Width="100px">
                                        <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn> 


                            

                            <dx:GridViewBandColumn Caption="Fornecedor" ShowInCustomizationForm="True" VisibleIndex="16" ToolTip="Quadrante Fornecedor">
                                <Columns>
                                    
                                    <dx:GridViewDataTextColumn Caption="ID" FieldName="idFornecedor" ShowInCustomizationForm="True" ToolTip="Código do Fornecedor" VisibleIndex="0" Width="80px">
                                        <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Descrição" FieldName="nomeFornecedor" ShowInCustomizationForm="True" ToolTip="Descrição do Fornecedor" VisibleIndex="1" Width="150px">
                                        <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="CGC Principal" FieldName="cgcPrincipal" ShowInCustomizationForm="True" VisibleIndex="2" Width="80px">
                                        <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Nome Fornecedor" FieldName="nomeFornecedorPrincipal" ShowInCustomizationForm="True" ToolTip="Nome Fornecedor Principal" VisibleIndex="3" Width="150px">
                                        <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                        <CellStyle Wrap="False">
                                        </CellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                                
                            </dx:GridViewBandColumn> 

                            <dx:GridViewDataTextColumn Caption="Comprador" FieldName="nomeComprador" ShowInCustomizationForm="True" ToolTip="Nome do Comprador que compra o produto" VisibleIndex="17" Width="80px">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                            </dx:GridViewDataTextColumn> 

                            <dx:GridViewDataTextColumn Caption="Sistemática" FieldName="Sistematica" ShowInCustomizationForm="True" ToolTip="Sistemática do produto" VisibleIndex="18" Width="80px">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                        <CellStyle HorizontalAlign="Center">
                                        </CellStyle>
                            </dx:GridViewDataTextColumn> 

                            <dx:GridViewDataTextColumn Caption="EAN" FieldName="EAN" ShowInCustomizationForm="True" ToolTip="Código EAN do produto" VisibleIndex="19" Width="110px">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                            </dx:GridViewDataTextColumn> 




                            <dx:GridViewBandColumn Caption="Classificação Mercadológica ABC" Name="bandABC" ShowInCustomizationForm="True" VisibleIndex="20">
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
                            </dx:GridViewBandColumn>




                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" AutoFilterRowInputDelay="600" />
                        <SettingsPager PageSize="14">
                        </SettingsPager>
                        <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG" ></SettingsExport>
                        <Settings ShowFilterRow="True" ShowGroupPanel="True" HorizontalScrollBarMode="Visible" ShowFooter="True" ShowFilterBar="Visible" />
                        <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" CommandClearFilter="Limpar" FilterBarClear="Limpar" />
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

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" SelectCommand="Analises.usp_AnaliseCompCrescItem" SelectCommandType="StoredProcedure"  >   <%--CacheExpirationPolicy="Absolute" EnableCaching="True"--%>
                        <SelectParameters>                           
                            <asp:SessionParameter Name="DiaInicial" SessionField="sDIA_INICIAL" Type="DateTime" />
                            <asp:SessionParameter Name="DiaFinal" SessionField="sDIA_FINAL" Type="DateTime" />
                            <asp:SessionParameter Name="MesmosItens" SessionField="sITENS" Type="Byte" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                            <asp:SessionParameter Name="MesmosDias" SessionField="sMESMOSDIAS" Type="Byte" />
                            <asp:SessionParameter Name="MesAnterior" SessionField="sMES_ANTERIOR" Type="Byte" />
                            <asp:SessionParameter Name="idSecao" SessionField="sSECAO" Type="Int16" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>

                <asp:Label ID="lblError" runat="server" Text="" ForeColor="red" Visible="true"></asp:Label>

            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>   

    <uc1:wucObsPrograma runat="server" ID="wucObsPrograma" Anotacao1="Database: gerVendaItem" Anotacao2="Analises.usp_AnaliseCompCrescItem" />

</asp:Content>

