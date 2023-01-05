<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="AnaliseVendaPorFornecedor1.aspx.vb" Inherits="MemberPages_SLV_Fornecedor_AnaliseVendaPorFornecedor1" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>








<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucFornecedor.ascx" TagPrefix="uc1" TagName="wucFornecedor" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>







<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

    <style type ="text/css" >

       

        #divFornecedor {            
            float: left;
            margin-left: 10px;
            width: 560px;
            padding-top: 2px;
        }

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
        
        #divExcel {
            float: left;
            margin-left: 15px;
            padding-top: 1px; 
        }

        #divSize {
            float: left;
            margin-left: 15px;
            padding-top: 4px; 
        }

        #divCNPJ_Principal { 
           clear: both;   
           float: left;                                
           padding-left: 2px;   
           padding-top: 7px;                                      
        }

        #divFixarCabecalho {
            float: left;
            margin-left: 20px;
            padding-top: 7px; 
        }

        #divDados {
            clear: both;
            float: left;  
            margin-left: 2px; 
            margin-top: 1px;        
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



    <div id="ShowButton" >
        <dx:ASPxButton ID="btnShowButton" runat="server" Text="Mercadologico" AutoPostBack="false" Width="50px"
            Theme="SoftOrange" ClientInstanceName="meuBotao" ClientSideEvents-Click="function(s, e) { MudarTextoBotao(); }">
        </dx:ASPxButton>
    </div>

    <div id="divPeriodo">
        <uc1:wucListaDiaIniFin runat="server" ID="cboDia" />
    </div>   
    
    <div id="divFornecedor">       
        <uc1:wucFornecedor runat="server" ID="txtFornecedor" />
    </div>
     

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme ="Metropolis">
            <ClientSideEvents Click="function(s, e) {
	cbPanelGrid.PerformCallback();
}" />
        </dx:ASPxButton>
    </div>




    <div id="divCNPJ_Principal">
            <dx:ASPxCheckBox ID="chkCNPJ_Principal" runat="server" Text ="Base CNPJ" Theme ="DevEx" CheckState="Unchecked">
                <ClientSideEvents CheckedChanged="function(s, e) {
	cbPanelGrid.PerformCallback();
}" />
            </dx:ASPxCheckBox>
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

    <div id="divSize">
        <uc1:wucSize runat="server" ID="cboSize" />
    </div>





    <div id="divDados">
        <dx:ASPxCallbackPanel ID="cbPanelGrid" runat="server" Width="900px" ClientInstanceName ="cbPanelGrid" Theme ="Metropolis" SettingsLoadingPanel-Text ="Atualizando...">
            <PanelCollection>
                <dx:PanelContent ID="PanelContent1"  runat="server" SupportsDisabledAttributes="both">

                    <dx:ASPxGridView ID="grid" runat="server" 
                        DataSourceID="SqlDataSource1" AutoGenerateColumns="False" 
                        EnableTheming="True" Theme="Default" Width="1000px" 
                        KeyFieldName="idFilial" Visible="False" ClientInstanceName="grid">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAT" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeAT" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescQtde" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAT" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargem" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSellOutAA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSellOutAT" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargemSellOut" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescLucro" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numClienteAA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numClienteAT" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescCliente" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difCliente" SummaryType="Custom" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroAA" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroAT" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescVlrLucro" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difVlrLucro" SummaryType="Custom" />

                        </TotalSummary>
                        <Columns>                                           
                            <dx:GridViewBandColumn Caption="Volume" ShowInCustomizationForm="True" VisibleIndex="1">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Ano Anterior" FieldName="QtdeAA" ShowInCustomizationForm="True" ToolTip="Quantidade do Ano Anterior (mesmo período)" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Ano Atual" FieldName="QtdeAT" ShowInCustomizationForm="True" ToolTip="Quantidade vendida do período selecionado" VisibleIndex="1" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescQtde" ShowInCustomizationForm="True" VisibleIndex="2" Width="65px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Nº Clientes" ShowInCustomizationForm="True" ToolTip="Números de Clientes" VisibleIndex="13">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="numClienteAA" ShowInCustomizationForm="True" ToolTip="Número de clientes que compraram produtos deste fornecedor nesse período" VisibleIndex="0" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="numClienteAT" ShowInCustomizationForm="True" ToolTip="Número de clientes que compraram produtos deste fornecedor nesse período" VisibleIndex="1" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Dif." FieldName="difCliente" ShowInCustomizationForm="True" ToolTip="Diferença entre o número de clientes" VisibleIndex="2" Width="70px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescCliente" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento do número de clientes entre esse ano e o ano passado." VisibleIndex="3" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Lucro" ShowInCustomizationForm="True" VisibleIndex="3">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="2014" FieldName="vlrLucroAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="2015" FieldName="vlrLucroAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Dif" FieldName="difVlrLucro" ShowInCustomizationForm="True" ToolTip="Diferença do lucro entre o ano atual e o ano passado" VisibleIndex="2" Width="80px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescVlrLucro" ShowInCustomizationForm="True" VisibleIndex="3" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewDataTextColumn FieldName="descFilial" VisibleIndex="0" 
                                Caption="Filial" Width="140px" FixedStyle="Left">
                                <CellStyle Wrap="False">
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                </CellStyle>
                                <FooterCellStyle>
                                    <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                </FooterCellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewBandColumn Caption="Vendas (R$)" ShowInCustomizationForm="True" VisibleIndex="2">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Ano Anterior" FieldName="vlrVendaAA" ShowInCustomizationForm="True" ToolTip="Valor da venda do ano anterior (mesmo período)" VisibleIndex="0" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Ano Atual" FieldName="vlrVendaAT" ShowInCustomizationForm="True" ToolTip="Valor de venda do período selecionado" VisibleIndex="1" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc" ShowInCustomizationForm="True" ToolTip="Percentual de crescimento entre periodo atual e periodo do ano anterior" VisibleIndex="2" Width="65px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="% Cresc Filial" FieldName="percCrescLucro" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento Venda Total da Filial" VisibleIndex="3" Width="90px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n02}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <HeaderStyle BackColor="#009900" />
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                            <dx:GridViewBandColumn Caption="Margem " ShowInCustomizationForm="True" VisibleIndex="4" Name="bandMargem">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Ano Anterior" FieldName="percMargemAA" ShowInCustomizationForm="True" ToolTip="Percentual de margem do ano anterior (mesmo período)" VisibleIndex="0" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Ano Atual" FieldName="percMargemAT" ShowInCustomizationForm="True" ToolTip="Percentual de margem do período selecionado" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle ForeColor="Blue">
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Dif." FieldName="difMargem" ShowInCustomizationForm="True" ToolTip="Diferença entre a margem deste ano com a do ano passado." VisibleIndex="2" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <CellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </CellStyle>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                                           
                            <dx:GridViewBandColumn Caption="Margem com SellOut" Name="bandMargemComSellOut" ShowInCustomizationForm="True" VisibleIndex="12">
                                <Columns>
                                    <dx:GridViewDataTextColumn Caption="Ano Anterior" FieldName="percMargemSellOutAA" ShowInCustomizationForm="True" VisibleIndex="0" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Ano Atual" FieldName="percMargemSellOutAT" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <FooterCellStyle>
                                            <BorderRight BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" />
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn Caption="Dif." FieldName="difMargemSellOut" ShowInCustomizationForm="True" ToolTip="Diferença entre a margem com Sell-Out deste ano com a do ano passado." VisibleIndex="2" Width="50px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>
                                           
                            <dx:GridViewDataTextColumn FieldName="Tipo" SortIndex="0" SortOrder="Ascending" 
                                VisibleIndex="5" Visible="False">
                            </dx:GridViewDataTextColumn>
                                           
                            <dx:GridViewDataTextColumn FieldName="idFilial" SortIndex="1" 
                                SortOrder="Ascending" VisibleIndex="15" Visible="False">
                            </dx:GridViewDataTextColumn>
                                           
                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Styles>
	                        <FocusedRow BackColor="Yellow" ForeColor="#333333"> </FocusedRow>
	                            <Header HorizontalAlign="Center">
                            </Header>
	                            <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                            <Footer Font-Bold="True" BackColor="#AAFFAA">
                            </Footer>
                        </Styles>                                       
                        <Settings VerticalScrollableHeight="400" VerticalScrollBarMode="Visible" HorizontalScrollBarMode="Visible" ShowFooter="True" />
                        <SettingsText EmptyDataRow="Não há informações disponiveis ainda para esse período e fornecedor"                                             />
                    </dx:ASPxGridView>

                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerVendaFornecedoresSLVConnectionString %>" 
                        SelectCommand="uspBuscarAnaliseVendaFornecedor" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="idFornecedor" SessionField="sFORNECEDOR" Type="Int32" />
                            <asp:SessionParameter DbType="Date" Name="DiaInicial" SessionField="sDIA_INICIAL" />
                            <asp:SessionParameter DbType="Date" Name="DiaFinal" SessionField="sDIA_FINAL" />                            
                            <asp:SessionParameter Name="BaseCNPJ" SessionField="sBASE_CNPJ" Type="Boolean" />
                            <asp:SessionParameter Name="TipoMercadologico" SessionField="sTIPO" Type="Byte" />
                            <asp:SessionParameter Name="Mercadologico" SessionField="sMERCADOLOGICO" Type="Int16" />
                        </SelectParameters>
                    </asp:SqlDataSource>


                    <asp:Label ID="lblError" runat="server" Text="" ForeColor ="Red" ></asp:Label>
                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>
    </div>


   <%-- AQUI COMEÇA A CAIXA DE DIALOGO.--%>
    <dx:ASPxPopupControl ID="popMercadologico" runat="server" LoadContentViaCallback="OnFirstShow" Theme="Metropolis"
                                PopupElementID="ShowButton" PopupVerticalAlign="Below" PopupHorizontalAlign="LeftSides" AllowDragging="True"
                          ShowHeader="true" ShowCloseButton="true" Width="900px" Height="50px" 
                         HeaderText="Updatable content" ClientInstanceName="ClientPopupControl" ShowRefreshButton="True" SettingsLoadingPanel-Text="Aguarde. Atualizando&amp;hellip;" SettingsLoadingPanel-Enabled="True">
        <HeaderTemplate>      
        </HeaderTemplate>

        <ContentCollection>
            <dx:PopupControlContentControl ID="PopupControlContentControl" runat="server">
  <%--              <div style="vertical-align:middle">
                    The content of this popup control is relevant to: <b> <%= DateTime.Now.ToLongTimeString() %></b>
                     <asp:Label ID="lblDados" runat="server" Text="Label"></asp:Label>
                </div>--%>

                    <dx:ASPxCallbackPanel ID="cbPanelMercadologico" runat="server" Width="900px" Theme="Metropolis" ClientInstanceName="cbPanelMercadologico" SettingsLoadingPanel-Text ="Atualizando..." >
                        <PanelCollection>
                            <dx:PanelContent ID="PanelContent2"  runat="server" SupportsDisabledAttributes="both">

                                <div id="divMercadologico_Total">
                                    <dx:ASPxRadioButton ID="rdTotal" runat="server" Text="Total" GroupName="rdMercadologico" Checked="True" ClientInstanceName="rdTotal" Theme="Metropolis" ToolTip="Exibe a venda de todos os departamentos" TextSpacing="2">
                                         <ClientSideEvents CheckedChanged="function(s, e) {
	
	cbPanelMercadologico.PerformCallback();
}" />
                                    </dx:ASPxRadioButton>
                                </div>

                                <div id="divMercadologico_Departamento">
                                    <dx:ASPxRadioButton ID="rdDepartamento" runat="server" Text="Departamento" GroupName="rdMercadologico" ClientInstanceName="rdDepartamento" Theme="Metropolis" ToolTip="Exibe a venda de todas as seções do departamento selecionado" AutoPostBack="False">
                                        <ClientSideEvents CheckedChanged="function(s, e) {
	
	cbPanelMercadologico.PerformCallback();
}" />
                                    </dx:ASPxRadioButton>
                                </div>

                                <div id="divMercadologico_Secao">
                                    <dx:ASPxRadioButton ID="rdSecao" runat="server" Text="Seção" GroupName="rdMercadologico" ClientInstanceName="rdSecao" Theme="Metropolis" ToolTip="Exibe a venda de todos os grupos de familia da seção selecionada" AutoPostBack="False">
                                        <ClientSideEvents CheckedChanged="function(s, e) {
	cbPanelMercadologico.PerformCallback();
}" />
                                    </dx:ASPxRadioButton>

                                </div>

                                <div id="divMercadologico_Grupo">
                                    <dx:ASPxRadioButton ID="rdGrupo" runat="server" Text="Grupo" GroupName="rdMercadologico" ClientInstanceName="rdGrupo" Theme="Metropolis" ToolTip="Exibe a venda de todas os familias do grupo selecionado" AutoPostBack="False" Width="59px">
                                        <ClientSideEvents CheckedChanged="function(s, e) {

	cbPanelMercadologico.PerformCallback();

	
}" />
                                    </dx:ASPxRadioButton>
                                </div>

                                <div id="divMercadologico_Subgrupo">
                                    <dx:ASPxRadioButton ID="rdSubgrupo" runat="server" Text="Familia" GroupName="rdMercadologico" ClientInstanceName="rdSubgrupo" Theme="Metropolis" ToolTip="Exibe a venda de todos os itens da familia selecionada" AutoPostBack="False">
                                        <ClientSideEvents CheckedChanged="function(s, e) {
	cbPanelMercadologico.PerformCallback();
}" />
                                    </dx:ASPxRadioButton>
                                </div>

                                <div id="divLista_Departamento" >
                                    <dx:ASPxListBox ID="cblDepartamento" runat="server" ValueType="System.Int32" ClientInstanceName="cblDepartamento" DataSourceID="dsListaDepartamento" TextField="ListaReduzida" ValidateRequestMode="Disabled" ValueField="idDepto" ViewStateMode="Disabled" EnableTheming="True" Height="145px" Theme="Office2010Black" Visible="False" Width="160px">
                                        <Columns>
                                            <dx:ListBoxColumn Caption="Departamento" FieldName="ListaReduzida" />
                                        </Columns>
                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {	
	cbPanelMercadologico.PerformCallback();
}" />
                                    </dx:ASPxListBox>               

                                    <asp:SqlDataSource ID="dsListaDepartamento" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" 
                                        SelectCommand="Cadastros.uspCboDepartamento" SelectCommandType="StoredProcedure">
                                    </asp:SqlDataSource>
                                </div>

                                <div id="divLista_Secao" >
                                    <dx:ASPxListBox ID="cblSecao" runat="server" ValueType="System.Int32" ClientInstanceName="cblSecao" DataSourceID="dsListaSecao" EnableTheming="True" Height="145px" TextField="ListaReduzida" Theme="Office2010Black" ValidateRequestMode="Disabled" ValueField="idSecao" ViewStateMode="Disabled" Visible="False" Width="160px">
                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {	
	cbPanelMercadologico.PerformCallback()
}" />
                                            <Columns>                                                
                                                <dx:ListBoxColumn FieldName="ListaReduzida" Caption="Seção" />
                                            </Columns>
                                    </dx:ASPxListBox>
                                    <asp:SqlDataSource ID="dsListaSecao" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" 
                                        SelectCommand="Cadastros.uspCboSecaoFiltro_IN" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="cblDepartamento" Name="idDepto" PropertyName="Value" Type="Byte" />
                                            <asp:SessionParameter Name="Usuario" SessionField="sUSUARIO" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>

                                <div id="divLista_Grupo" >
                                    <dx:ASPxListBox ID="cblGrupo" runat="server" ValueType="System.Int32" ClientInstanceName="cblGrupo" DataSourceID="dsListaGrupo" EnableTheming="True" Height="145px" TextField="ListaReduzida" Theme="Office2010Black" ValidateRequestMode="Disabled" ValueField="idGrupo" ViewStateMode="Disabled" Visible="False" Width="160px">
                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {cbPanelMercadologico.PerformCallback()}" />
                                            <Columns>                                                
                                                <dx:ListBoxColumn FieldName="ListaReduzida" Caption="Grupo" />
                                            </Columns>
                                    </dx:ASPxListBox>
                                    <asp:SqlDataSource ID="dsListaGrupo" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" 
                                        SelectCommand="Cadastros.uspCboGrupoFiltro_IN" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="cblSecao" Name="idSecao" PropertyName="Value" Type="Byte" />
                                            <asp:SessionParameter Name="Usuario" SessionField="sUSUARIO" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>

                                <div id="divLista_Subgrupo">
                                    <dx:ASPxListBox ID="cblsubgrupo" runat="server" ValueType="System.Int32" ClientInstanceName="cblSubgrupo" DataSourceID="dsListaSubgrupo" EnableTheming="True" Height="145px" TextField="ListaReduzida" Theme="Office2010Black" ValidateRequestMode="Disabled" ValueField="idSubgrupo" ViewStateMode="Disabled" Visible="False" Width="160px">
                                        <ClientSideEvents SelectedIndexChanged="function(s, e) {cbPanelMercadologico.PerformCallback()}" />
                                            <Columns>                                                
                                                <dx:ListBoxColumn FieldName="ListaReduzida" Caption="Familia" />
                                            </Columns>
                                    </dx:ASPxListBox>
                                    <asp:SqlDataSource ID="dsListaSubgrupo" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:DW_Condor_One_ConnectionString %>" 
                                        SelectCommand="Cadastros.uspCboSubgrupoFiltro_IN" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="cblGrupo" Name="idGrupo" PropertyName="Value" Type="Int16" />
                                            <asp:SessionParameter Name="Usuario" SessionField="sUSUARIO" Type="String" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </div>


                                
                            </dx:PanelContent>
                        </PanelCollection>
                    </dx:ASPxCallbackPanel>
                
            </dx:PopupControlContentControl>
        </ContentCollection>

    </dx:ASPxPopupControl>

    
</asp:Content>


