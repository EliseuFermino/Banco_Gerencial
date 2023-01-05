<%@ Page Title="Venda Canal Delivery" Language="VB" MasterPageFile="~/MemberPages/SiteVendas.master" AutoEventWireup="false" CodeFile="VendaDelivery.aspx.vb" Inherits="MemberPages_Vendas_Delivery_VendaDelivery" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>
<%@ Register Src="~/Controles/wucLista_Filial_Empresa.ascx" TagPrefix="uc1" TagName="wucLista_Filial_Empresa" %>


<asp:Content ID="Content3" ContentPlaceHolderID="HeadContent" Runat="Server">
    
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
        
    <link href="../../../css/Dashboard.css" rel="stylesheet" />
    <link href="../../../css/bootstrap.min.css" rel="stylesheet" />
    <%--<script src="../../Scripts/jquery-2.2.3.min.js"></script>--%>
    <script src="../../../js/bootstrap.min.js"></script>
      <!-- Ionicons -->
    <link href="../../../css/ionicons.min.css" rel="stylesheet" />
    <link href="../../../assets/css/ace.min.css" rel="stylesheet" />

  <!-- Font Awesome -->    

    <link href="../../assets/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" />

   <script type ="text/javascript">

       function OnGridFocusedRowChanged() {
           grid.GetRowValues(grid.GetFocusedRowIndex(), 'idFilial;FilialDesc', OnGetRowValues);
       }

       function OnGetRowValues(values) {
           lblFilial.SetText(values[0]);

       }

   </script>

        <style type ="text/css" >

        /*#divPeriodo {
            clear: both;
            float: left;
            margin-left: 2px;          
        }        

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
             margin-top: 6px;
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
            padding-top: 7px;
        }*/     

   
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
<div class="container-fluid">

    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
            Delivery
        <small>Consultas</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Principal</a></li>
        <li class="active">Inicio</li>
      </ol>
        
    </section>    
              
    <div class="row">
                
        <div class="col-md-12">
		    <div class="widget-box">
			    <div class="widget-header">
				    <h4 class="widget-title"><span class="glyphicon glyphicon-list-alt"></span> &nbsp Venda Delivery - Loja a Loja do período selecionado</h4>

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
                            <div class="row">

                                <div class="col-md-3" style="padding-bottom: 5px;">
                                    <uc1:wucListaDiaIniFin runat="server" ID="cboPeriodo" />
                                </div>

                                <div class="col-md-2" style="padding-bottom: 5px;">
                                    <dx:ASPxRadioButton ID="chkTodasLojas" runat="server" GroupName="rnd"  AutoPostBack="false" Checked="True" Text="Todas as Lojas" Theme="Material"></dx:ASPxRadioButton>
                                </div>
                                
                                <div class="col-md-1" style="padding-bottom: 5px;">
                                    <dx:ASPxRadioButton ID="chkDelivery" runat="server" GroupName="rnd" AutoPostBack="false" Checked="false" Text="Delivery" Theme="Material"></dx:ASPxRadioButton>
                                </div>

                                <div class="col-md-1" style="padding-bottom: 5px;">
                                    <dx:ASPxRadioButton ID="chkRappi" runat="server" GroupName="rnd" AutoPostBack="false" Checked="false" Text="Rappi" Theme="Material"></dx:ASPxRadioButton>
                                </div>

                                <div class="col-md-2">
                                    <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
                                    <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback(); cbPanel_2.PerformCallback();}" />
                                </dx:ASPxButton>
                                </div> 
                            </div>
                                                                   

                       <div id="divDados">

                           <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis"  Images-LoadingPanel-AlternateText ="Aguarde. Atualizando">
                                <Images>
                                <LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
                                </Images>

                                <LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
                                    <PanelCollection>
                                        <dx:PanelContent>

                                            <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" ClientInstanceName="grid" DataSourceID="dsDados" Theme="SoftOrange" Width="100%" KeyFieldName="idFilial">
                                                <SettingsPager Mode="ShowAllRecords">
                                                </SettingsPager>
                                                <Settings ShowFilterRow="True" ShowFooter="True" VerticalScrollableHeight="400" VerticalScrollBarMode="Visible" HorizontalScrollBarMode="Visible" />
                                                <SettingsBehavior AllowFocusedRow="True" />

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
                                                    <dx:GridViewDataTextColumn Caption="Filial" FieldName="FilialDesc" ShowInCustomizationForm="True" VisibleIndex="1" FixedStyle="Left">
                                                        <CellStyle Wrap="False">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewBandColumn Caption="Vendas" ShowInCustomizationForm="True" VisibleIndex="3">
                                                        <HeaderStyle BackColor="#000099" />
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="Total " FieldName="vlrVendaTotal" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                </PropertiesTextEdit>
                                                                <Settings AllowAutoFilter="False" />
                                                                <HeaderStyle BackColor="#0066CC" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Sem Delivery" FieldName="Venda_Sem_Delivery" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                </PropertiesTextEdit>
                                                                <Settings AllowAutoFilter="False" />
                                                                <HeaderStyle BackColor="#0066CC" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Delivery" FieldName="vlrVenda" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" SortIndex="0" SortOrder="Descending">
                                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                </PropertiesTextEdit>
                                                                <Settings AllowAutoFilter="False" />
                                                                <HeaderStyle BackColor="#0066CC" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Rappi" FieldName="vlrVenda_Rappi" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                </PropertiesTextEdit>
                                                                <Settings AllowAutoFilter="False" />
                                                                <HeaderStyle BackColor="#0066CC" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewBandColumn Caption="Participação de Vendas" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="Delivery" FieldName="percPartVenda" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                        <PropertiesTextEdit DisplayFormatString="{0:n2} %" EncodeHtml="False">
                                                                        </PropertiesTextEdit>
                                                                        <Settings AllowAutoFilter="False" />
                                                                        <HeaderStyle BackColor="#0066CC" />
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="Rappi" FieldName="percPartVenda_Rappi" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentul de Participação de Vendas do Delivery sobre a Venda Total" VisibleIndex="1">
                                                                        <PropertiesTextEdit DisplayFormatString="{0:n2} %" EncodeHtml="False">
                                                                        </PropertiesTextEdit>
                                                                        <Settings AllowAutoFilter="False" />
                                                                        <HeaderStyle BackColor="#0066CC" />
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                                <HeaderStyle BackColor="#0066CC" />
                                                            </dx:GridViewBandColumn>
                                                        </Columns>
                                                    </dx:GridViewBandColumn>
                                                    <dx:GridViewBandColumn Caption="Lucro e Margem Total" ShowInCustomizationForm="True" VisibleIndex="5">
                                                        <Columns>
                                                            <dx:GridViewBandColumn Caption="Delivery" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrLucroTotal" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                        </PropertiesTextEdit>
                                                                        <Settings AllowAutoFilter="False" />
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemTotal" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                        </PropertiesTextEdit>
                                                                        <Settings AllowAutoFilter="False" />
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="Rappi" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrLucroTotal_Rappi" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                        </PropertiesTextEdit>
                                                                        <Settings AllowAutoFilter="False" />
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemTotal_Rappi" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                        </PropertiesTextEdit>
                                                                        <Settings AllowAutoFilter="False" />
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                        </Columns>
                                                    </dx:GridViewBandColumn>
                                                    <dx:GridViewBandColumn Caption="Lucro e Margem PDV" ShowInCustomizationForm="True" VisibleIndex="4">
                                                        <Columns>
                                                            <dx:GridViewBandColumn Caption="Delivery" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrLucroComercial" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                        </PropertiesTextEdit>
                                                                        <Settings AllowAutoFilter="False" />
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemPDV" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                        </PropertiesTextEdit>
                                                                        <Settings AllowAutoFilter="False" />
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                            <dx:GridViewBandColumn Caption="Rappi" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                <Columns>
                                                                    <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrLucroComercial_Rappi" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                        </PropertiesTextEdit>
                                                                        <Settings AllowAutoFilter="False" />
                                                                    </dx:GridViewDataTextColumn>
                                                                    <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemPDV_Rappi" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                        </PropertiesTextEdit>
                                                                        <Settings AllowAutoFilter="False" />
                                                                    </dx:GridViewDataTextColumn>
                                                                </Columns>
                                                            </dx:GridViewBandColumn>
                                                        </Columns>
                                                    </dx:GridViewBandColumn>
                                                    
                                                    <dx:GridViewBandColumn Caption="Volume" ShowInCustomizationForm="True" VisibleIndex="2">
                                                        <Columns>
                                                            <dx:GridViewDataTextColumn Caption="Sem Delivery" FieldName="QtdeSemDelivery" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                </PropertiesTextEdit>
                                                                <Settings AllowAutoFilter="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Delivery" FieldName="QtdVendasDelivery" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                </PropertiesTextEdit>
                                                                <Settings AllowAutoFilter="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Total" FieldName="QtdVendas" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                </PropertiesTextEdit>
                                                                <Settings AllowAutoFilter="False" />
                                                            </dx:GridViewDataTextColumn>
                                                            <dx:GridViewDataTextColumn Caption="Rappi" FieldName="Qtde_Rappi" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                </PropertiesTextEdit>
                                                                <Settings AllowAutoFilter="False" />
                                                            </dx:GridViewDataTextColumn>
                                                        </Columns>
                                                    </dx:GridViewBandColumn>
                                                </Columns>

                                                <ClientSideEvents FocusedRowChanged="function(s, e) { OnGridFocusedRowChanged(); }" />                            


                                                <TotalSummary>
                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaTotal" SummaryType="Sum" />
                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda_Rappi" SummaryType="Sum" />
                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Venda_Sem_Delivery" SummaryType="Sum" />                                                    
                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercial" SummaryType="Sum" />
                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroSellOut" SummaryType="Sum" />
                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotal" SummaryType="Sum" />
                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercial_Rappi" SummaryType="Sum" />
                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotal_Rappi" SummaryType="Sum" />

                                                    

                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeSemDelivery" SummaryType="Sum" />                                                    
                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdVendasDelivery" SummaryType="Sum" />
                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdVendas" SummaryType="Sum" />
                                                     <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde_Rappi" SummaryType="Sum" />

                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2} %" FieldName="percPartVenda" SummaryType="Custom"  />
                                                     <dx:ASPxSummaryItem DisplayFormat="{0:n2} %" FieldName="percPartVenda_Rappi" SummaryType="Custom"  />
                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemPDV" SummaryType="Custom"  />
                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemTotal" SummaryType="Custom"  />
                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemPDV_Rappi" SummaryType="Custom"  />
                                                    <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemTotal_Rappi" SummaryType="Custom"  />
                                                    
                                                </TotalSummary>
                                                <Styles>
                                                    <Header HorizontalAlign="Center">
                                                    </Header>
                                                    <AlternatingRow BackColor="#E1E1E1">
                                                    </AlternatingRow>
                                                    <FocusedRow BackColor="Yellow" ForeColor="Blue">
                                                    </FocusedRow>
                                                    <Cell Font-Size="Medium">
                                                    </Cell>
                                                    <Footer Font-Bold="True">
                                                    </Footer>

                                                </Styles>
                                                <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                                            </dx:ASPxGridView>                
                                                      
		                                    <asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" SelectCommand="dbo.usp_BuscarVendaDelivery_Dia_Lojas" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="DiaInicial" SessionField="sDIA_INICIAL" Type="DateTime"  />
                                                    <asp:SessionParameter Name="DiaFinal" SessionField="sDIA_FINAL" Type="DateTime"  />   
                                                    <asp:SessionParameter Name="todasLojas" SessionField="sTODAS_LOJAS" Type="Byte"  />                          
                                                </SelectParameters>
                                            </asp:SqlDataSource>

                                            <dx:ASPxLabel ID="lblFilial" runat="server" Text="LABEL" ClientInstanceName="lblFilial" ForeColor="Red" Visible ="false" ></dx:ASPxLabel>

                                    </dx:PanelContent>
                                </PanelCollection>
                           </dx:ASPxCallbackPanel>

                
                                    </div>
	
                                					
					</div>
				</div>
			</div>
		</div><!-- /.span -->
                                      
    </div>        
                    
    <div class="row">
                
        <div class="col-md-12">
			<div class="widget-box">
				<div class="widget-header">
					<h4 class="widget-title"><span class="glyphicon glyphicon-list-alt"></span> &nbsp Venda Delivery - Dia a Dia e Loja selecionada</h4>

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
                                                                                
                        <div class="row" >

                            <div class="col-md-3">
                                <uc1:wucLista_Filial_Empresa runat="server" ID="cboFilial" Visible_Empresa="false" AutoPostBack="false"  />
                            </div> 
                            <div class="col-md-1">
                                <dx:ASPxButton ID="btn2" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
                                <ClientSideEvents Click="function(s, e) {cbPanel_2.PerformCallback();}" />
                                </dx:ASPxButton>
                            </div> 
                        </div>      
                                        
                        <dx:ASPxCallbackPanel ID="cboPanel_2" runat="server" Width="100%" ClientInstanceName="cbPanel_2" Theme="Metropolis"  Images-LoadingPanel-AlternateText ="Aguarde. Atualizando">
                            <Images>
                            <LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
                            </Images>

                            <LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
                                <PanelCollection>
                                    <dx:PanelContent>                                                          

                                        <div class="row" >

                                            <div class="col-md-12">

                                                <dx:ASPxGridView ID="grid_Filial_Dia" runat="server" AutoGenerateColumns="False" DataSourceID="dsFilial_Dia" Theme="SoftOrange" Width="1000px">
                                                    <SettingsPager Mode="ShowAllRecords">
                                                    </SettingsPager>
                                                    <Settings ShowFilterRow="True" ShowFooter="True" VerticalScrollableHeight="400" VerticalScrollBarMode="Visible" ShowGroupPanel="True" />
                                                    <SettingsBehavior AllowFocusedRow="True" />
                                                    <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="Dia" FieldName="Dia" ShowInCustomizationForm="True" VisibleIndex="0" Width="100px" SortIndex="0" SortOrder="Ascending">
                                                            <PropertiesTextEdit DisplayFormatString="{0:dd/MM/yyyy} " EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewBandColumn Caption="Vendas" ShowInCustomizationForm="True" VisibleIndex="2">
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Venda Total " FieldName="vlrVendaTotal" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0" Width="100px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Venda Delivery" FieldName="vlrVenda" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="% Part. Vendas" FieldName="percPartVenda" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentul de Participação de Vendas do Delivery sobre a Venda Total" VisibleIndex="2">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2} %" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                        </dx:GridViewBandColumn>
                                                        <dx:GridViewDataTextColumn Caption="Desc. Dia" FieldName="nomeDiaSemana" ShowInCustomizationForm="True" VisibleIndex="1">
                                                            <Settings AllowAutoFilter="True" AllowHeaderFilter="True" AutoFilterCondition="Contains" />
                                                            <SettingsHeaderFilter Mode="CheckedList">
                                                            </SettingsHeaderFilter>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewBandColumn Caption="Lucro PDV" ShowInCustomizationForm="True" VisibleIndex="3">
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="R$ " FieldName="vlrLucroComercial" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="%" FieldName="percMargemPDV" ShowInCustomizationForm="True" VisibleIndex="1" Width="65px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                        </dx:GridViewBandColumn>
                                                        <dx:GridViewBandColumn Caption="Lucro Total" ShowInCustomizationForm="True" VisibleIndex="4">
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="R$" FieldName="vlrLucroTotal" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn ShowInCustomizationForm="True" VisibleIndex="1" Caption="%" FieldName="percMargemTotal" Width="65px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                        </dx:GridViewBandColumn>
                                                    </Columns>
                                                    <TotalSummary>
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaTotal" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercial" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrSellOut" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotal" SummaryType="Sum" />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n2} %" FieldName="percPartVenda" SummaryType="Custom"  />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemPDV" SummaryType="Custom"  />
                                                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemTotal" SummaryType="Custom"  />
                                                    </TotalSummary>
                                                    <Styles>
                                                        <Header HorizontalAlign="Center">
                                                        </Header>
                                                        <AlternatingRow BackColor="#E1E1E1">
                                                        </AlternatingRow>
                                                        <FocusedRow BackColor="Yellow" ForeColor="Blue">
                                                        </FocusedRow>
                                                        <Cell Font-Size="Medium">
                                                        </Cell>
                                                        <Footer Font-Bold="True" Font-Size="Medium">
                                                        </Footer>
                                                    </Styles>
                                                </dx:ASPxGridView>                              
                    
		                                        <asp:SqlDataSource ID="dsFilial_Dia" runat="server" ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" SelectCommand="dbo.usp_BuscarVendaDelivery_Dias_Loja_Unica" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="DiaInicial" SessionField="sDIA_INICIAL" Type="DateTime"  />
                                                        <asp:SessionParameter Name="DiaFinal" SessionField="sDIA_FINAL" Type="DateTime"  />                            
                                                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16"  /> 
                                                    </SelectParameters>
                                                </asp:SqlDataSource>

                                            </div> 
                
                                        </div>

                                </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxCallbackPanel>
                                                                        					
					</div>
				</div>
			</div>
		</div><!-- /.span -->

              
    </div>           
   

 </div> 


 

    <script src="../../../Scripts/jquery-2.2.3.min.js"></script>
    <script src="../../../js/bootstrap.min.js"></script>   
    <script src="../../../plugins/fastclick/fastclick.min.js"></script>   
    <script src="../../../dist/js/app.min.js"></script>
    <script src="../../../plugins/sparkline/jquery.sparkline.min.js"></script>

    <script src="../../../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="../../../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <script src="../../../plugins/slimScroll/jquery.slimscroll.min.js"></script>

    
    <script src="../../../dist/js/pages/dashboard2.js"></script>
    <script src="../../../dist/js/demo.js"></script>


        <script src="../../../assets/js/jquery-ui.custom.min.js"></script>
		<script src="../../../assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="../../../assets/js/chosen.jquery.min.js"></script>
		<script src="../../../assets/js/spinbox.min.js"></script>
		<script src="../../../assets/js/bootstrap-datepicker.min.js"></script>
		<script src="../../../assets/js/bootstrap-timepicker.min.js"></script>
		<script src="../../../assets/js/moment.min.js"></script>
		<script src="../../../assets/js/daterangepicker.min.js"></script>
		<script src="../../../assets/js/bootstrap-datetimepicker.min.js"></script>
		<script src="../../../assets/js/bootstrap-colorpicker.min.js"></script>
		<script src="../../../assets/js/jquery.knob.min.js"></script>
		<script src="../../../assets/js/autosize.min.js"></script>
		<script src="../../../assets/js/jquery.inputlimiter.min.js"></script>
		<script src="../../../assets/js/jquery.maskedinput.min.js"></script>
		<script src="../../../assets/js/bootstrap-tag.min.js"></script>

		<!-- ace scripts -->
		<script src="../../../assets/js/ace-elements.min.js"></script>
		<script src="../../../assets/js/ace.min.js"></script>

</asp:Content>

