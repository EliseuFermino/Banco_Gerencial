<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="webDashAcompOnLine.aspx.vb" Inherits="MemberPages_SLV_webDashAcompOnLine" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxwgv" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dxe" %>
<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

     
    <link href="../../css/Dashboard.css" rel="stylesheet" />
    <link href="../../css/bootstrap.min.css" rel="stylesheet" />
    <%--<script src="../../Scripts/jquery-2.2.3.min.js"></script>--%>
    <script src="../../js/bootstrap.min.js"></script>
      <!-- Ionicons -->
    <link href="../../css/ionicons.min.css" rel="stylesheet" />
    <link href="../../assets/css/ace.min.css" rel="stylesheet" />


  <!-- Font Awesome -->    

    <link href="../../assets/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <%----------------------------------------------------------------------------------------------------------------------------------------------%>

    <div class="container-fluid">

    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
          Dashboard - Comercial
        <small>Consultas</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Principal</a></li>
        <li class="active">Dashboard</li>
      </ol>
        
    </section>
                

            <div class="row">
                
                <div class="col-md-12">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="glyphicon glyphicon-list-alt"></span> &nbsp Margem Negativa por Produto e por Filial</h4>

							<div class="widget-toolbar">
								<a href="#" data-action="collapse">
									<i class="ace-icon fa fa-chevron-up"></i>
								</a>

								<a href="#" data-action="close">
									<i class="ace-icon fa fa-times"></i>
								</a>
							</div>
						</div>

						<div class="widget-body">
							<div class="widget-main">	
                                
                                <%--------------	--%>						
                               
        <%-- ********************* L U C R O   N E G A T I V O ************************* --%>


            <div id="divBotao_PaneVendaItemLucroNegativo" >
                <dx:ASPxButton ID="btnAtualizar_ItemLucroNegativo" runat="server" Text="Atualizar" AutoPostBack="False" Theme="MetropolisBlue" Visible="False">
                    <ClientSideEvents Click="function(s, e) {cboPaneLucroItemNegativo.PerformCallback();}" />
                </dx:ASPxButton>
            </div>

            <dx:ASPxCallbackPanel ID="cboPaneLucroItemNegativo" runat="server" Width="100%" ClientInstanceName="cboPaneLucroItemNegativo" Theme="Metropolis" Images-LoadingPanel-AlternateText="Aguarde. Atualizando" >
            <Images>
                <LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
            </Images>

            <LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
          
                <PanelCollection>
                    <dx:PanelContent>   
                             
                         <div id="divTop30_Lucro_Negativo" class="Separacao_Separacao">

                          <dx:ASPxGridView ID="grid_Top30_Lucro_Negativo" ClientInstanceName="grid_Top30_Lucro_Negativo" runat="server" DataSourceID="ds_Top30_Lucro_Negativo" AutoGenerateColumns="False" Width="1150px" KeyFieldName="CodProduto">
                              <Toolbars>
                                <dx:GridViewToolbar EnableAdaptivity="true">
                                    <Items>
                                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                                    </Items>
                                </dx:GridViewToolbar>
                            </Toolbars>

                            <Columns>
                                <dx:GridViewCommandColumn VisibleIndex="0" ShowClearFilterButton="True"/>
                                <dx:GridViewDataTextColumn Caption="Código" FieldName="CodProduto" ToolTip="Código do produto" VisibleIndex="3" Width="70px">
                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Vendas" VisibleIndex="5">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendas" ToolTip="Volume ou quantidade dos itens vendidos" VisibleIndex="0" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="Venda" ToolTip="Valor da venda de cada item" VisibleIndex="1" Width="90px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle Font-Bold="True" ForeColor="Blue">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Preço Venda" FieldName="precoVenda" UnboundType="Decimal" VisibleIndex="2" Width="80px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Margem Praticada" VisibleIndex="6">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="LucroComercial" ToolTip="Valor do Lucro Praticado" VisibleIndex="0" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percMargem" ReadOnly="True" ToolTip="Percentual da Margem Praticada" VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="Nº Cliente" FieldName="numCliente" ToolTip="Número de clientes que compraram o item." VisibleIndex="12" Width="70px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <Settings AllowAutoFilter="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Sell Out" VisibleIndex="7">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="LucroSellOut" ToolTip="Valor do Sell Out" VisibleIndex="0" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemSellOut" ReadOnly="True" ToolTip="Percentual do Sell Out" VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="Descrição do produto" FieldName="nomeProduto" ToolTip="Nome do produto" VisibleIndex="4" Width="200px">
                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                    <CellStyle Wrap="False">
                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Sell Out - Kit" VisibleIndex="9">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="LucroSellOut_Kit" VisibleIndex="0" Width="70px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" VisibleIndex="1" Width="60px">
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewBandColumn Caption="Margem Final" ShowInCustomizationForm="True" VisibleIndex="10">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrLucroFinal" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Valor do Lucro Final (Lucro Praticado + Lucro Sell Out)" VisibleIndex="0" Width="70px" SortIndex="0" SortOrder="Ascending">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <HeaderStyle BackColor="#999999" />
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemFinal" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual da Margem Final " VisibleIndex="1" Width="60px">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <Settings AllowAutoFilter="False" />
                                            <CellStyle>
                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" />
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="Nº" FieldName="rnk" ReadOnly="True" ToolTip="Posição no TOP 10" VisibleIndex="2" Width="30px">
                                    <Settings AllowAutoFilter="False" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Filial" FieldName="FilialDesc" ShowInCustomizationForm="True" ToolTip="Descrição da Filial" VisibleIndex="1" Width="200px">
                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                              <SettingsPager Mode="ShowAllRecords">
                              </SettingsPager>
                            <Settings VerticalScrollableHeight="460" VerticalScrollBarMode="Visible" ShowTitlePanel="True" ShowFilterRow="True" ShowFooter="True" />
                            <SettingsText Title="Todos Itens com Lucro Negativo na Empresa" />
                              <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                              <TotalSummary>
                                  <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdVendas" SummaryType="Sum" />
                                  <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Venda" SummaryType="Sum" />
                                  <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="precoVenda" SummaryType="Average" />
                                  <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroComercial" SummaryType="Sum" />
                                  <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroSellOut" SummaryType="Sum" />
                                  <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="LucroSellOut_Kit" SummaryType="Sum" />
                                  <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroFinal" SummaryType="Sum" />
                                  <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numCliente" SummaryType="Sum" />
                                  <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargem" SummaryType="Custom" />
                                  <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemSellOut" SummaryType="Custom" />
                                  <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinal" SummaryType="Custom" />
                              </TotalSummary>
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <AlternatingRow BackColor="#F2F2F2">
                                </AlternatingRow>
                                <FocusedRow BackColor="#FFFF99" ForeColor="#3366FF">
                                </FocusedRow>
                                <TitlePanel BackColor="#660066" ForeColor="White" Font-Size="X-Large">
                                </TitlePanel>
                            </Styles>
                        </dx:ASPxGridView>

                        <asp:SqlDataSource ID="ds_Top30_Lucro_Negativo" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" SelectCommand="Dia.uspBuscar_Lucro_Negativo" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                                <asp:SessionParameter DbType="Int16" DefaultValue="99" Name="idFilial" SessionField="sFILIAL_LUCRO_NEGATIVO" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                
                    </div>

                     </dx:PanelContent>
                </PanelCollection>
            </dx:ASPxCallbackPanel>
               

                                
                                <%--------------	--%>		
                                					
							</div>
						</div>
					</div>
				</div><!-- /.span -->

              
           </div>   



<%------------------------------------------------------------------------------------------------------------------------------------------------------%>

            <div class="row">
                
                <div class="col-md-4">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="glyphicon glyphicon-list-alt"></span> Margem Negativa - Deparamento 1 - Mercearia</h4>

							<div class="widget-toolbar">
								<a href="#" data-action="collapse">
									<i class="ace-icon fa fa-chevron-up"></i>
								</a>

								<a href="#" data-action="close">
									<i class="ace-icon fa fa-times"></i>
								</a>
							</div>
						</div>

						<div class="widget-body">
							<div class="widget-main">
								
                                                    <dxwgv:ASPxGridView ID="gridDepto1" runat="server" AutoGenerateColumns="False" 
                        CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" CssPostfix="PlasticBlue" 
                        DataSourceID="dsDepto1" Width="100%" Font-Size="Medium">
                        <Styles CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" 
                            CssPostfix="PlasticBlue">
                            <Header ImageSpacing="10px" SortingImageSpacing="10px" HorizontalAlign="Center"></Header>
                            <AlternatingRow BackColor="#E6F2FF"></AlternatingRow>
                            <FocusedRow BackColor="Yellow" ForeColor="#0066FF">
                            </FocusedRow>
                            <TitlePanel Font-Bold="True">
                            </TitlePanel>
                        </Styles>
                                                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsPager Mode="ShowAllRecords" ShowDefaultImages="False">
                            <AllButton Text="All">
                            </AllButton>
                            <NextPageButton Text="Next &gt;">
                            </NextPageButton>
                            <PrevPageButton Text="&lt; Prev">
                            </PrevPageButton>
                        </SettingsPager>
                        <Images ImageFolder="~/App_Themes/Plastic Blue/{0}/">
                            <CollapsedButton Height="10px" 
                                Url="~/App_Themes/Plastic Blue/GridView/gvCollapsedButton.png" Width="9px" />
                            <ExpandedButton Height="9px" 
                                Url="~/App_Themes/Plastic Blue/GridView/gvExpandedButton.png" Width="9px" />
                            <HeaderFilter Height="15px" 
                                Url="~/App_Themes/Plastic Blue/GridView/gvHeaderFilter.png" Width="13px" />
                            <HeaderActiveFilter Height="15px" 
                                Url="~/App_Themes/Plastic Blue/GridView/gvHeaderFilterActive.png" 
                                Width="13px" />
                            <HeaderSortDown Height="11px" 
                                Url="~/App_Themes/Plastic Blue/GridView/gvHeaderSortDown.png" Width="11px" />
                            <HeaderSortUp Height="11px" 
                                Url="~/App_Themes/Plastic Blue/GridView/gvHeaderSortUp.png" Width="11px" />
                            <FilterRowButton Height="13px" Width="13px" />
                            <CustomizationWindowClose Height="14px" Width="14px" />
                            <PopupEditFormWindowClose Height="14px" Width="14px" />
                            <FilterBuilderClose Height="14px" Width="14px" />
                        </Images>
                        <SettingsText Title="Mercearia" />
                        <Columns>
                            <dxwgv:GridViewDataTextColumn Caption="Descrição" FieldName="Descricao" 
                                VisibleIndex="1">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Venda" FieldName="vlrRealVenda" 
                                VisibleIndex="2">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="% Mgr PDV" FieldName="percRealMargem" 
                                SortIndex="0" SortOrder="Ascending" VisibleIndex="3">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="% Mgr Final" FieldName="percMargSelout" 
                                VisibleIndex="4">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Filial" FieldName="nomeFilial" 
                                VisibleIndex="0">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <Settings ShowTitlePanel="True" ShowVerticalScrollBar="True" 
                            VerticalScrollableHeight="150" />
                        <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                    </dxwgv:ASPxGridView>

                                                               		
							</div>
						</div>
					</div>
				</div><!-- /.span -->

                <div class="col-md-4">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="glyphicon glyphicon-list-alt"></span> Margem Negativa - Deparamento 2 - Perecíveis</h4>

							<div class="widget-toolbar">
								<a href="#" data-action="collapse">
									<i class="ace-icon fa fa-chevron-up"></i>
								</a>

								<a href="#" data-action="close">
									<i class="ace-icon fa fa-times"></i>
								</a>
							</div>
						</div>

						<div class="widget-body">
							<div class="widget-main">
								
                                                    <dxwgv:ASPxGridView ID="gridDepto2" runat="server" AutoGenerateColumns="False" 
                        CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" CssPostfix="PlasticBlue" 
                        DataSourceID="dsDepto2" Width="100%" Font-Size="Medium">
                        <Styles CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" 
                            CssPostfix="PlasticBlue">
                            <Header ImageSpacing="10px" SortingImageSpacing="10px" HorizontalAlign="Center"></Header>
                            <AlternatingRow BackColor="#E6F2FF"></AlternatingRow>
                            <FocusedRow BackColor="Yellow" ForeColor="#0066FF">
                            </FocusedRow>
                            <TitlePanel Font-Bold="True">
                            </TitlePanel>
                        </Styles>
                                                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsPager Mode="ShowAllRecords" ShowDefaultImages="False">
                            <AllButton Text="All">
                            </AllButton>
                            <NextPageButton Text="Next &gt;">
                            </NextPageButton>
                            <PrevPageButton Text="&lt; Prev">
                            </PrevPageButton>
                        </SettingsPager>
                        <Images ImageFolder="~/App_Themes/Plastic Blue/{0}/">
                            <CollapsedButton Height="10px" 
                                Url="~/App_Themes/Plastic Blue/GridView/gvCollapsedButton.png" Width="9px" />
                            <ExpandedButton Height="9px" 
                                Url="~/App_Themes/Plastic Blue/GridView/gvExpandedButton.png" Width="9px" />
                            <HeaderFilter Height="15px" 
                                Url="~/App_Themes/Plastic Blue/GridView/gvHeaderFilter.png" Width="13px" />
                            <HeaderActiveFilter Height="15px" 
                                Url="~/App_Themes/Plastic Blue/GridView/gvHeaderFilterActive.png" 
                                Width="13px" />
                            <HeaderSortDown Height="11px" 
                                Url="~/App_Themes/Plastic Blue/GridView/gvHeaderSortDown.png" Width="11px" />
                            <HeaderSortUp Height="11px" 
                                Url="~/App_Themes/Plastic Blue/GridView/gvHeaderSortUp.png" Width="11px" />
                            <FilterRowButton Height="13px" Width="13px" />
                            <CustomizationWindowClose Height="14px" Width="14px" />
                            <PopupEditFormWindowClose Height="14px" Width="14px" />
                            <FilterBuilderClose Height="14px" Width="14px" />
                        </Images>
                        <SettingsText Title="Perecíveis" />
                        <Columns>
                            <dxwgv:GridViewDataTextColumn Caption="Descrição" FieldName="Descricao" 
                                VisibleIndex="1">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Venda" FieldName="vlrRealVenda" 
                                VisibleIndex="2">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="% Mgr PDV" FieldName="percRealMargem" 
                                SortIndex="0" SortOrder="Ascending" VisibleIndex="3">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="% Mgr Final" FieldName="percMargSelout" 
                                VisibleIndex="4">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Filial" FieldName="nomeFilial" 
                                VisibleIndex="0">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <Settings ShowTitlePanel="True" ShowVerticalScrollBar="True" 
                            VerticalScrollableHeight="150" />
                        <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                    </dxwgv:ASPxGridView>

                               		
							</div>
						</div>
					</div>
				</div><!-- /.span -->

                <div class="col-md-4">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="glyphicon glyphicon-list-alt"></span> Margem Negativa - Deparamento 3 - Bazar</h4>

							<div class="widget-toolbar">
								<a href="#" data-action="collapse">
									<i class="ace-icon fa fa-chevron-up"></i>
								</a>

								<a href="#" data-action="close">
									<i class="ace-icon fa fa-times"></i>
								</a>
							</div>
						</div>

						<div class="widget-body">
							<div class="widget-main">
								
                                                    <dxwgv:ASPxGridView ID="gridDepto3" runat="server" AutoGenerateColumns="False" 
                        CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" CssPostfix="PlasticBlue" 
                        DataSourceID="dsDepto3" Width="100%" Font-Size="Medium">
                        <Styles CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" 
                            CssPostfix="PlasticBlue">
                            <Header ImageSpacing="10px" SortingImageSpacing="10px" HorizontalAlign="Center"></Header>
                            <AlternatingRow BackColor="#E6F2FF"></AlternatingRow>
                            <FocusedRow BackColor="Yellow" ForeColor="#0066FF">
                            </FocusedRow>
                            <TitlePanel Font-Bold="True" Font-Size="Large">
                            </TitlePanel>
                        </Styles>
                                                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsPager Mode="ShowAllRecords" ShowDefaultImages="False">
                            <AllButton Text="All">
                            </AllButton>
                            <NextPageButton Text="Next &gt;">
                            </NextPageButton>
                            <PrevPageButton Text="&lt; Prev">
                            </PrevPageButton>
                        </SettingsPager>
                        <Images ImageFolder="~/App_Themes/Plastic Blue/{0}/">
                            <CollapsedButton Height="10px" 
                                Url="~/App_Themes/Plastic Blue/GridView/gvCollapsedButton.png" Width="9px" />
                            <ExpandedButton Height="9px" 
                                Url="~/App_Themes/Plastic Blue/GridView/gvExpandedButton.png" Width="9px" />
                            <HeaderFilter Height="15px" 
                                Url="~/App_Themes/Plastic Blue/GridView/gvHeaderFilter.png" Width="13px" />
                            <HeaderActiveFilter Height="15px" 
                                Url="~/App_Themes/Plastic Blue/GridView/gvHeaderFilterActive.png" 
                                Width="13px" />
                            <HeaderSortDown Height="11px" 
                                Url="~/App_Themes/Plastic Blue/GridView/gvHeaderSortDown.png" Width="11px" />
                            <HeaderSortUp Height="11px" 
                                Url="~/App_Themes/Plastic Blue/GridView/gvHeaderSortUp.png" Width="11px" />
                            <FilterRowButton Height="13px" Width="13px" />
                            <CustomizationWindowClose Height="14px" Width="14px" />
                            <PopupEditFormWindowClose Height="14px" Width="14px" />
                            <FilterBuilderClose Height="14px" Width="14px" />
                        </Images>
                        <SettingsText Title="Bazar" />
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="Descricao" VisibleIndex="1" 
                                Caption="Descrição">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="vlrRealVenda" VisibleIndex="2" 
                                Caption="Venda">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="percRealMargem" VisibleIndex="3" 
                                Caption="% Mgr PDV" SortIndex="0" SortOrder="Ascending">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="percMargSelout" VisibleIndex="4" 
                                Caption="% Mgr Final">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="nomeFilial" VisibleIndex="0" 
                                Caption="Filial">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <Settings ShowTitlePanel="True" ShowVerticalScrollBar="True" 
                            VerticalScrollableHeight="147" />
                        <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                    </dxwgv:ASPxGridView>

                               		
							</div>
						</div>
					</div>
				</div><!-- /.span -->


              
           </div>   



            <div class="row">
                
                <div class="col-md-4">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="glyphicon glyphicon-list-alt"></span> Margem Negativa - Deparamento 4 - Textil</h4>

							<div class="widget-toolbar">
								<a href="#" data-action="collapse">
									<i class="ace-icon fa fa-chevron-up"></i>
								</a>

								<a href="#" data-action="close">
									<i class="ace-icon fa fa-times"></i>
								</a>
							</div>
						</div>

						<div class="widget-body">
							<div class="widget-main">
								
                                                    <dxwgv:ASPxGridView ID="gridDepto4" runat="server" AutoGenerateColumns="False" 
                        CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" CssPostfix="PlasticBlue" 
                        DataSourceID="dsDepto4" Width="100%" Font-Size="Medium">
                        <Styles CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" 
                            CssPostfix="PlasticBlue">
                            <Header ImageSpacing="10px" SortingImageSpacing="10px" HorizontalAlign="Center"></Header>
                            <AlternatingRow BackColor="#E6F2FF"></AlternatingRow>
                            <FocusedRow BackColor="Yellow" ForeColor="#0066FF">
                            </FocusedRow>
                            <TitlePanel Font-Bold="True">
                            </TitlePanel>
                        </Styles>
                                                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsPager Mode="ShowAllRecords" ShowDefaultImages="False">
                            <AllButton Text="All">
                            </AllButton>
                            <NextPageButton Text="Next &gt;">
                            </NextPageButton>
                            <PrevPageButton Text="&lt; Prev">
                            </PrevPageButton>
                        </SettingsPager>
                        <Images ImageFolder="~/App_Themes/Plastic Blue/{0}/">
                            <CollapsedButton Height="10px" 
                                Url="~/App_Themes/Plastic Blue/GridView/gvCollapsedButton.png" Width="9px" />
                            <ExpandedButton Height="9px" 
                                Url="~/App_Themes/Plastic Blue/GridView/gvExpandedButton.png" Width="9px" />
                            <HeaderFilter Height="15px" 
                                Url="~/App_Themes/Plastic Blue/GridView/gvHeaderFilter.png" Width="13px" />
                            <HeaderActiveFilter Height="15px" 
                                Url="~/App_Themes/Plastic Blue/GridView/gvHeaderFilterActive.png" 
                                Width="13px" />
                            <HeaderSortDown Height="11px" 
                                Url="~/App_Themes/Plastic Blue/GridView/gvHeaderSortDown.png" Width="11px" />
                            <HeaderSortUp Height="11px" 
                                Url="~/App_Themes/Plastic Blue/GridView/gvHeaderSortUp.png" Width="11px" />
                            <FilterRowButton Height="13px" Width="13px" />
                            <CustomizationWindowClose Height="14px" Width="14px" />
                            <PopupEditFormWindowClose Height="14px" Width="14px" />
                            <FilterBuilderClose Height="14px" Width="14px" />
                        </Images>
                        <SettingsText Title="Textil" />
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="Descricao" VisibleIndex="1" 
                                Caption="Descrição">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="vlrRealVenda" VisibleIndex="2" 
                                Caption="Venda">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="percRealMargem" VisibleIndex="3" 
                                Caption="% Mgr PDV" SortIndex="0" SortOrder="Ascending">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="percMargSelout" VisibleIndex="4" 
                                Caption="% Mgr Final">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="nomeFilial" VisibleIndex="0" 
                                Caption="Filial">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <Settings ShowTitlePanel="True" ShowVerticalScrollBar="True" 
                            VerticalScrollableHeight="150" />
                        <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                    </dxwgv:ASPxGridView>

                                                               		
							</div>
						</div>
					</div>
				</div><!-- /.span -->

                <div class="col-md-4">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="glyphicon glyphicon-list-alt"></span> Margem Negativa - Deparamento 5 - Eletrodomésticos</h4>

							<div class="widget-toolbar">
								<a href="#" data-action="collapse">
									<i class="ace-icon fa fa-chevron-up"></i>
								</a>

								<a href="#" data-action="close">
									<i class="ace-icon fa fa-times"></i>
								</a>
							</div>
						</div>

						<div class="widget-body">
							<div class="widget-main">
								
                                                    <dxwgv:ASPxGridView ID="gridDepto5" runat="server" AutoGenerateColumns="False" 
                        CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" CssPostfix="PlasticBlue" 
                        DataSourceID="dsDepto5" Width="100%" Font-Size="Medium">
                        <Styles CssFilePath="~/App_Themes/Plastic Blue/{0}/styles.css" 
                            CssPostfix="PlasticBlue">
                            <Header ImageSpacing="10px" SortingImageSpacing="10px" HorizontalAlign="Center"></Header>
                            <AlternatingRow BackColor="#E6F2FF"></AlternatingRow>
                            <FocusedRow BackColor="Yellow" ForeColor="#0066FF">
                            </FocusedRow>
                            <TitlePanel Font-Bold="True">
                            </TitlePanel>
                        </Styles>
                                                        <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsPager Mode="ShowAllRecords" ShowDefaultImages="False">
                            <AllButton Text="All">
                            </AllButton>
                            <NextPageButton Text="Next &gt;">
                            </NextPageButton>
                            <PrevPageButton Text="&lt; Prev">
                            </PrevPageButton>
                        </SettingsPager>
                        <Images ImageFolder="~/App_Themes/Plastic Blue/{0}/">
                            <CollapsedButton Height="10px" 
                                Url="~/App_Themes/Plastic Blue/GridView/gvCollapsedButton.png" Width="9px" />
                            <ExpandedButton Height="9px" 
                                Url="~/App_Themes/Plastic Blue/GridView/gvExpandedButton.png" Width="9px" />
                            <HeaderFilter Height="15px" 
                                Url="~/App_Themes/Plastic Blue/GridView/gvHeaderFilter.png" Width="13px" />
                            <HeaderActiveFilter Height="15px" 
                                Url="~/App_Themes/Plastic Blue/GridView/gvHeaderFilterActive.png" 
                                Width="13px" />
                            <HeaderSortDown Height="11px" 
                                Url="~/App_Themes/Plastic Blue/GridView/gvHeaderSortDown.png" Width="11px" />
                            <HeaderSortUp Height="11px" 
                                Url="~/App_Themes/Plastic Blue/GridView/gvHeaderSortUp.png" Width="11px" />
                            <FilterRowButton Height="13px" Width="13px" />
                            <CustomizationWindowClose Height="14px" Width="14px" />
                            <PopupEditFormWindowClose Height="14px" Width="14px" />
                            <FilterBuilderClose Height="14px" Width="14px" />
                        </Images>
                        <SettingsText Title="Eletro" />
                        <Columns>
                            <dxwgv:GridViewDataTextColumn FieldName="Descricao" VisibleIndex="1" 
                                Caption="Descrição">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="vlrRealVenda" VisibleIndex="2" 
                                Caption="Venda">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="percRealMargem" VisibleIndex="3" 
                                Caption="% Mgr PDV" SortIndex="0" SortOrder="Ascending">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="percMargSelout" VisibleIndex="4" 
                                Caption="% Mgr Final">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn FieldName="nomeFilial" VisibleIndex="0" 
                                Caption="Filial">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <Settings ShowTitlePanel="True" ShowVerticalScrollBar="True" 
                            VerticalScrollableHeight="150" />
                        <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                    </dxwgv:ASPxGridView>

                               		
							</div>
						</div>
					</div>
				</div><!-- /.span -->

                <div class="col-md-4">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="glyphicon glyphicon-list-alt"></span> Venda e Margem por Filial</h4>

							<div class="widget-toolbar">
								<a href="#" data-action="collapse">
									<i class="ace-icon fa fa-chevron-up"></i>
								</a>

								<a href="#" data-action="close">
									<i class="ace-icon fa fa-times"></i>
								</a>
							</div>
						</div>

						<div class="widget-body">
							<div class="widget-main">
								
                                                            <dxwgv:ASPxGridView ID="ASPxGridView2" runat="server" 
                        AutoGenerateColumns="False" CssFilePath="~/App_Themes/Red Wine/{0}/styles.css" 
                        CssPostfix="RedWine" DataSourceID="dsTotal" Width="100%" 
                        Font-Size="Medium">
                        <Styles CssFilePath="~/App_Themes/Red Wine/{0}/styles.css" CssPostfix="RedWine">
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#E6F2FF"></AlternatingRow>
                            <FocusedRow BackColor="Yellow" ForeColor="#0066FF">
                            </FocusedRow>
                            <TitlePanel Font-Bold="True" Font-Size="Large">
                            </TitlePanel>
                        </Styles>
                        <SettingsLoadingPanel Text="" />
                                                                <SettingsBehavior AllowFocusedRow="True" />
                        <SettingsPager Mode="ShowAllRecords">
                            <AllButton>
                                <Image Height="19px" Width="24px" />
                            </AllButton>
                            <FirstPageButton>
                                <Image Height="19px" Width="23px" />
                            </FirstPageButton>
                            <LastPageButton>
                                <Image Height="19px" Width="23px" />
                            </LastPageButton>
                            <NextPageButton>
                                <Image Height="19px" Width="19px" />
                            </NextPageButton>
                            <PrevPageButton>
                                <Image Height="19px" Width="19px" />
                            </PrevPageButton>
                        </SettingsPager>
                        <TotalSummary>
                            <dxwgv:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" 
                                SummaryType="Sum" />
                        </TotalSummary>
                        <Images ImageFolder="~/App_Themes/Red Wine/{0}/">
                            <CollapsedButton Height="15px" 
                                Url="~/App_Themes/Red Wine/GridView/gvCollapsedButton.png" Width="15px" />
                            <ExpandedButton Height="15px" 
                                Url="~/App_Themes/Red Wine/GridView/gvExpandedButton.png" Width="15px" />
                            <DetailCollapsedButton Height="12px" 
                                Url="~/App_Themes/Red Wine/GridView/gvDetailCollapsedButton.png" Width="11px" />
                            <DetailExpandedButton Height="12px" 
                                Url="~/App_Themes/Red Wine/GridView/gvDetailExpandedButton.png" Width="11px" />
                            <HeaderFilter Height="19px" 
                                Url="~/App_Themes/Red Wine/GridView/gvHeaderFilter.png" Width="19px" />
                            <HeaderActiveFilter Height="19px" 
                                Url="~/App_Themes/Red Wine/GridView/gvHeaderFilterActive.png" Width="19px" />
                            <HeaderSortDown Height="15px" 
                                Url="~/App_Themes/Red Wine/GridView/gvHeaderSortDown.png" Width="11px" />
                            <HeaderSortUp Height="15px" 
                                Url="~/App_Themes/Red Wine/GridView/gvHeaderSortUp.png" Width="11px" />
                            <FilterRowButton Height="13px" Width="13px" />
                            <CustomizationWindowClose Height="19px" Width="19px" />
                            <PopupEditFormWindowClose Height="19px" Width="19px" />                            
                            <FilterBuilderClose Height="19px" Width="19px" />
                        </Images>
                        <SettingsText Title="Venda Total" />
                        <Columns>
                            <dxwgv:GridViewDataTextColumn Caption="Filial" FieldName="FilialLista" 
                                VisibleIndex="0">
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="Venda" FieldName="vlrVenda" 
                                ReadOnly="True" VisibleIndex="1">
                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="% Mgr PDV" FieldName="percMarg" 
                                ReadOnly="True" SortIndex="0" SortOrder="Ascending" VisibleIndex="2">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                            <dxwgv:GridViewDataTextColumn Caption="% Mgr Final" FieldName="percMargSelout" 
                                ReadOnly="True" VisibleIndex="3">
                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                </PropertiesTextEdit>
                            </dxwgv:GridViewDataTextColumn>
                        </Columns>
                        <Settings ShowFooter="True" ShowTitlePanel="True" ShowVerticalScrollBar="True" 
                            VerticalScrollableHeight="115" />
                        <StylesEditors>
                            <ProgressBar Height="25px">
                            </ProgressBar>
                        </StylesEditors>
                        <ImagesEditors>
                            <CalendarFastNavPrevYear Height="19px" 
                                Url="~/App_Themes/Red Wine/Editors/edtCalendarFNPrevYear.png" Width="19px" />
                            <CalendarFastNavNextYear Height="19px" 
                                Url="~/App_Themes/Red Wine/Editors/edtCalendarFNNextYear.png" Width="19px" />
                            <DropDownEditDropDown Height="7px" 
                                Url="~/App_Themes/Red Wine/Editors/edtDropDown.png" 
                                UrlDisabled="~/App_Themes/Red Wine/Editors/edtDropDownDisabled.png" 
                                UrlHottracked="~/App_Themes/Red Wine/Editors/edtDropDownHottracked.png" 
                                Width="7px" />
                            <SpinEditIncrement Height="6px" 
                                Url="~/App_Themes/Red Wine/Editors/edtSpinEditIncrementImage.png" 
                                UrlDisabled="~/App_Themes/Red Wine/Editors/edtSpinEditIncrementDisabledImage.png" 
                                UrlHottracked="~/App_Themes/Red Wine/Editors/edtSpinEditIncrementHottrackedImage.png" 
                                Width="7px" />
                            <SpinEditDecrement Height="7px" 
                                Url="~/App_Themes/Red Wine/Editors/edtSpinEditDecrementImage.png" 
                                UrlDisabled="~/App_Themes/Red Wine/Editors/edtSpinEditDecrementDisabledImage.png" 
                                UrlHottracked="~/App_Themes/Red Wine/Editors/edtSpinEditDecrementHottrackedImage.png" 
                                Width="7px" />
                            <SpinEditLargeIncrement Height="9px" 
                                Url="~/App_Themes/Red Wine/Editors/edtSpinEditLargeIncImage.png" 
                                UrlDisabled="~/App_Themes/Red Wine/Editors/edtSpinEditLargeIncDisabledImage.png" 
                                UrlHottracked="~/App_Themes/Red Wine/Editors/edtSpinEditLargeIncHottrackedImage.png" 
                                Width="7px" />
                            <SpinEditLargeDecrement Height="9px" 
                                Url="~/App_Themes/Red Wine/Editors/edtSpinEditLargeDecImage.png" 
                                UrlDisabled="~/App_Themes/Red Wine/Editors/edtSpinEditLargeDecDisabledImage.png" 
                                UrlHottracked="~/App_Themes/Red Wine/Editors/edtSpinEditLargeDecHottrackedImage.png" 
                                Width="7px" />
                        </ImagesEditors>
                    </dxwgv:ASPxGridView>

                               		
							</div>
						</div>
					</div>
				</div><!-- /.span -->


              
           </div>   


        <asp:Label ID="lblError" runat="server" Text="Label"  ForeColor="Red" Visible="False"></asp:Label>


 </div> 


       
        <table cellspacing="1" class="style1">
            <tr>
                <td>
                    <asp:SqlDataSource ID="dsTotal" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                        SelectCommand="SELECT Cadastros.tblCadFiliais.FilialLista, SUM(Ranking.FlashVendaDepto.vlrVenda) AS vlrVenda, SUM(Ranking.FlashVendaDepto.vlrMargSelout) / SUM(Ranking.FlashVendaDepto.vlrVenda) * 100 AS percMargSelout, SUM(Ranking.FlashVendaDepto.vlrMargComl) / SUM(Ranking.FlashVendaDepto.vlrVenda) * 100 AS percMarg FROM Ranking.FlashVendaDepto INNER JOIN Cadastros.tblCadFiliais ON Ranking.FlashVendaDepto.idFilial = Cadastros.tblCadFiliais.Filial GROUP BY Ranking.FlashVendaDepto.idFilial, Ranking.FlashVendaDepto.Dia, Cadastros.tblCadFiliais.FilialLista HAVING (Ranking.FlashVendaDepto.Dia = @Dia)">
                        <SelectParameters>
                            <asp:SessionParameter Name="Dia" SessionField="sDIA" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:SqlDataSource ID="dsDepto1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                        SelectCommand="SELECT b.ListaReduzida AS Descricao, a.vlrVenda AS vlrRealVenda, a.percMarg AS percRealMargem, a.idFilial, percMargSelout , f.Descricao AS nomeFilial FROM Ranking.FlashVendaSecao AS a INNER JOIN Cadastros.tblCadSecao AS b ON a.idSecao = b.idSecao  Inner join gerKnowledge.Filial.ufn_ListaFilial() AS f ON a.idFilial = f.idFilial WHERE (a.idDepto = 1) AND (a.Dia = @Dia) AND a.percMarg < 0.0">
                        <SelectParameters>
                            <asp:SessionParameter Name="Dia" SessionField="sDIA" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:SqlDataSource ID="dsDepto2" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                        SelectCommand="SELECT b.ListaReduzida AS Descricao, a.vlrVenda AS vlrRealVenda, a.percMarg AS percRealMargem, a.idFilial, percMargSelout , f.Descricao AS nomeFilial FROM Ranking.FlashVendaSecao AS a INNER JOIN Cadastros.tblCadSecao AS b ON a.idSecao = b.idSecao  Inner join gerKnowledge.Filial.ufn_ListaFilial() AS f ON a.idFilial = f.idFilial WHERE (a.idDepto = 2) AND (a.Dia = @Dia) AND a.percMarg < 0.0">
                        <SelectParameters>
                            <asp:SessionParameter Name="Dia" SessionField="sDIA" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:SqlDataSource ID="dsDepto3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                        SelectCommand="SELECT b.ListaReduzida AS Descricao, a.vlrVenda AS vlrRealVenda, a.percMarg AS percRealMargem, a.idFilial, percMargSelout , f.Descricao AS nomeFilial FROM Ranking.FlashVendaSecao AS a INNER JOIN Cadastros.tblCadSecao AS b ON a.idSecao = b.idSecao  Inner join gerKnowledge.Filial.ufn_ListaFilial() AS f ON a.idFilial = f.idFilial WHERE (a.idDepto = 3) AND (a.Dia = @Dia) AND a.percMarg < 0.0">
                        <SelectParameters>
                            <asp:SessionParameter Name="Dia" SessionField="sDIA" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    <asp:SqlDataSource ID="dsDepto4" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                            SelectCommand="SELECT b.ListaReduzida AS Descricao, a.vlrVenda AS vlrRealVenda, a.percMarg AS percRealMargem, a.idFilial, percMargSelout , f.Descricao AS nomeFilial FROM Ranking.FlashVendaSecao AS a INNER JOIN Cadastros.tblCadSecao AS b ON a.idSecao = b.idSecao  Inner join gerKnowledge.Filial.ufn_ListaFilial() AS f ON a.idFilial = f.idFilial WHERE (a.idDepto = 4) AND (a.Dia = @Dia) AND a.percMarg < 0.0">
                            <SelectParameters>
                                <asp:SessionParameter Name="Dia" SessionField="sDIA" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                </td>
                <td>
                    <asp:SqlDataSource ID="dsDepto5" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" 
                        SelectCommand="SELECT b.ListaReduzida AS Descricao, a.vlrVenda AS vlrRealVenda, a.percMarg AS percRealMargem, a.idFilial, percMargSelout , f.Descricao AS nomeFilial FROM Ranking.FlashVendaSecao AS a INNER JOIN Cadastros.tblCadSecao AS b ON a.idSecao = b.idSecao  Inner join gerKnowledge.Filial.ufn_ListaFilial() AS f ON a.idFilial = f.idFilial WHERE (a.idDepto = 5) AND (a.Dia = @Dia) AND a.percMarg < 0.0">
                        <SelectParameters>
                            <asp:SessionParameter Name="Dia" SessionField="sDIA" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td>
                    &nbsp;</td>
                <td>
                     <asp:SqlDataSource ID="dsItem" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" SelectCommand="Dia.uspBuscar_Lucro_Negativo" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter DbType="Date" Name="Dia" SessionField="sDIA" />
                                <asp:SessionParameter DbType="Int16" DefaultValue="99" Name="idFilial" SessionField="sFILIAL" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                </td>
            </tr>
            </table>
        <br />
    </p>


    <script src="../../Scripts/jquery-2.2.3.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>   
    <script src="../../plugins/fastclick/fastclick.min.js"></script>   
    <script src="../../dist/js/app.min.js"></script>
    <script src="../../plugins/sparkline/jquery.sparkline.min.js"></script>

    <script src="../../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="../../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <script src="../../plugins/slimScroll/jquery.slimscroll.min.js"></script>

    
    <script src="../../dist/js/pages/dashboard2.js"></script>
    <script src="../../dist/js/demo.js"></script>


        <script src="../../assets/js/jquery-ui.custom.min.js"></script>
		<script src="../../assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="../../assets/js/chosen.jquery.min.js"></script>
		<script src="../../assets/js/spinbox.min.js"></script>
		<script src="../../assets/js/bootstrap-datepicker.min.js"></script>
		<script src="../../assets/js/bootstrap-timepicker.min.js"></script>
		<script src="../../assets/js/moment.min.js"></script>
		<script src="../../assets/js/daterangepicker.min.js"></script>
		<script src="../../assets/js/bootstrap-datetimepicker.min.js"></script>
		<script src="../../assets/js/bootstrap-colorpicker.min.js"></script>
		<script src="../../assets/js/jquery.knob.min.js"></script>
		<script src="../../assets/js/autosize.min.js"></script>
		<script src="../../assets/js/jquery.inputlimiter.min.js"></script>
		<script src="../../assets/js/jquery.maskedinput.min.js"></script>
		<script src="../../assets/js/bootstrap-tag.min.js"></script>

		<!-- ace scripts -->
		<script src="../../assets/js/ace-elements.min.js"></script>
		<script src="../../assets/js/ace.min.js"></script>

</asp:Content>

