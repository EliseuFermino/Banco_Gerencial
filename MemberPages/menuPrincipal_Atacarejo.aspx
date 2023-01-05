<%@ Page Title="Menu Principal" Trace="false"  Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="menuPrincipal_Atacarejo.aspx.vb" Inherits="MemberPages_menuPrincipal_Atacarejo" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGauges" TagPrefix="dx" %>


<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Linear" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Circular" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.State" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Digital" tagprefix="dx" %>
    
<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>

<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>

<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>

<%@ Register src="../Controles/wuc_KPI_Secao_Depto.ascx" tagname="wuc_KPI_Secao_Depto" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">


    <link href="../css/Dashboard.css" rel="stylesheet" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <script src="../Scripts/jquery-2.2.3.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
      <!-- Ionicons -->
    <link href="../css/ionicons.min.css" rel="stylesheet" />
    <link href="../assets/css/ace.min.css" rel="stylesheet" />
    <link href="../css/Banco_Gerencial/Banco_Gerencial.css" rel="stylesheet" />


  <!-- Font Awesome -->    

    <link href="../assets/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" />

    <style type="text/css">
        .box {
          position: relative;
          border-radius: 3px;
          background: #ffffff;
          border-top: 3px solid #d2d6de;
          margin-bottom: 20px;
          width: 100%;
          box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
        }

.box-header:before,
.box-body:before,
.box-footer:before,
.box-header:after,
.box-body:after,
.box-footer:after {
  content: " ";
  display: table;
}
.box-header:after,
.box-body:after,
.box-footer:after {
  clear: both;
}
.box-header {
  color: #444;
  display: block;
  padding: 10px;
  position: relative;
}
.box-header.with-border {
  border-bottom: 1px solid #f4f4f4;
}
.collapsed-box .box-header.with-border {
  border-bottom: none;
}
.box-header > .fa,
.box-header > .glyphicon,
.box-header > .ion,
.box-header .box-title {
  display: inline-block;
  font-size: 18px;
  margin: 0;
  line-height: 1;
}
.box-header > .fa,
.box-header > .glyphicon,
.box-header > .ion {
  margin-right: 5px;
}
.box-header > .box-tools {
  position: absolute;
  right: 10px;
  top: 5px;
}
.box-header > .box-tools [data-toggle="tooltip"] {
  position: relative;
}
.box-header > .box-tools.pull-right .dropdown-menu {
  right: 0;
  left: auto;
}

.box.box-solid > .box-header .btn.btn-default {
  background: transparent;
}
.box.box-solid > .box-header .btn:hover,
.box.box-solid > .box-header a:hover {
  background: rgba(0, 0, 0, 0.1);
}
.box.box-solid.box-default {
  border: 1px solid #d2d6de;
}
.box.box-solid.box-default > .box-header {
  color: #444444;
  background: #d2d6de;
  background-color: #d2d6de;
}
.box.box-solid.box-default > .box-header a,
.box.box-solid.box-default > .box-header .btn {
  color: #444444;
}
.box.box-solid.box-primary {
  border: 1px solid #3c8dbc;
}
.box.box-solid.box-primary > .box-header {
  color: #ffffff;
  background: #3c8dbc;
  background-color: #3c8dbc;
}
.box.box-solid.box-primary > .box-header a,
.box.box-solid.box-primary > .box-header .btn {
  color: #ffffff;
}
.box.box-solid.box-info {
  border: 1px solid #00c0ef;
}
.box.box-solid.box-info > .box-header {
  color: #ffffff;
  background: #00c0ef;
  background-color: #00c0ef;
}
.box.box-solid.box-info > .box-header a,
.box.box-solid.box-info > .box-header .btn {
  color: #ffffff;
}
.box.box-solid.box-danger {
  border: 1px solid #dd4b39;
}
.box.box-solid.box-danger > .box-header {
  color: #ffffff;
  background: #dd4b39;
  background-color: #dd4b39;
}
.box.box-solid.box-danger > .box-header a,
.box.box-solid.box-danger > .box-header .btn {
  color: #ffffff;
}
.box.box-solid.box-warning {
  border: 1px solid #f39c12;
}
.box.box-solid.box-warning > .box-header {
  color: #ffffff;
  background: #f39c12;
  background-color: #f39c12;
}
.box.box-solid.box-warning > .box-header a,
.box.box-solid.box-warning > .box-header .btn {
  color: #ffffff;
}
.box.box-solid.box-success {
  border: 1px solid #00a65a;
}
.box.box-solid.box-success > .box-header {
  color: #ffffff;
  background: #00a65a;
  background-color: #00a65a;
}
.box.box-solid.box-success > .box-header a,
.box.box-solid.box-success > .box-header .btn {
  color: #ffffff;
}
.box.box-solid > .box-header > .box-tools .btn {
  border: 0;
  box-shadow: none;
}
.box.box-solid[class*='bg'] > .box-header {
  color: #fff;
}

.box-header > .fa,
.box-header > .glyphicon,
.box-header > .ion,
.box-header .box-title {
  display: inline-block;
  font-size: 18px;
  margin: 0;
  line-height: 1;
}

.box.collapsed-box .box-body,
.box.collapsed-box .box-footer {
  display: none;
}

.collapsed-box .box-header.with-border {
  border-bottom: none;
}

  .navbar-collapse .main-header .navbar-right {
    margin: 7.5px -15px;
  }

  .navbar-collapse.pull-left + .navbar-custom-menu {
    display: block;
    position: absolute;
    top: 0;
    right: 40px;
  }

.btn-box-tool {
  padding: 5px;
  font-size: 12px;
  background: transparent;
  color: #97a0b3;
}
.open .btn-box-tool,
.btn-box-tool:hover {
  color: #606c84;
}
.btn-box-tool.btn:active {
  box-shadow: none;
}

.content-header {
  position: relative;
  padding: 15px 15px 5px 15px;
}
.content-header > h1 {
  margin: 0;
  font-size: 24px;
}
.content-header > h1 > small {
  font-size: 15px;
  display: inline-block;
  padding-left: 4px;
  font-weight: 300;
}
.content-header > .breadcrumb {
  float: right;
  background: transparent;
  margin-top: 0;
  margin-bottom: 0;
  font-size: 12px;
  padding: 7px 5px;
  position: absolute;
  top: 15px;
  right: 10px;
  border-radius: 2px;
}
.content-header > .breadcrumb > li > a {
  color: #444;
  text-decoration: none;
  display: inline-block;
}
.content-header > .breadcrumb > li > a > .fa,
.content-header > .breadcrumb > li > a > .glyphicon,
.content-header > .breadcrumb > li > a > .ion {
  margin-right: 5px;
}
.content-header > .breadcrumb > li + li:before {
  content: '>\00a0';
}

         .divGrupoLegenda {
            clear: both;
            float: left;
            margin-left: 2px;
            font-weight: bold;
        }

        .divGrupo {            
            float: left;
            margin-left: 2px;
        }

        .divSubgrupoLegenda {           
            float: left;
            margin-left: 15px;
            font-weight: bold;
        }

        .divSubgrupo {           
            float: left;
            margin-left: 2px;
        }

        #divDadosNaoConforme {
            clear: both;
            float: left;
            margin-left: 2px;
        }

        #divFilial{
            clear: both;
            float: left;
            margin-left: 15px;
            padding: 2px 4px 4px 4px;
        }

         #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
            padding-left: 10px;
            padding-top: 5px;
        }

         #divPeridoGestor {
            clear:both;
            float: left;
            width: 600px ;
         }

          #divDiaInicial {
            clear:both;
            float: left;
            margin-left: 2px;
            padding-left: 2px;            
        }

        #divDiaFinal {
            float: left;
            margin-left: 10px;
            padding-left: 10px;            
        }

        #divBotaoAtualizarGestor {
             float: left;
            margin-left: 10px;
        }

        .rndSemana {
            float: left ;
        }



    </style>
       
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

        <dx:ASPxTimer ID="ASPxTimer1" runat="server" Interval="60000">
            <ClientSideEvents Tick="function(s, e) {  
        cbPanel.PerformCallback();  
    }" />  
        </dx:ASPxTimer>    
         
     

    <dx:ASPxPageControl ID="TabControl" runat="server" Width="100%" ActiveTabIndex="0" EnableHierarchyRecreation="True" Theme="SoftOrange" >
        <TabPages>

            <dx:TabPage Text="603 - JK" >
                
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl6" runat="server">                        

                        <div class="Condor_clear_both" style="margin-top: -8px; margin-bottom:-8px;  ">                                  
                                <uc1:wucListaDiaIniFin runat="server" ID="atcarejo_cboDia" />
                        </div>

                        <div class="Condor_float_left Condor_margin_left_10px" style="margin-top: 4px">
                            <dx:ASPxButton ID="btnAtualizar_Atacarejo" runat="server" Text="Atualizar" Theme="Metropolis" AutoPostBack="false" >
                                <ClientSideEvents Click="function(s, e) {
                                    cbPanelAtacarejo.PerformCallback();	
                                }" />
                            </dx:ASPxButton>
                        </div>

                        <dx:ASPxCallbackPanel ID="cbPanelAtacarejo" runat="server" Width="100%" ClientInstanceName="cbPanelAtacarejo" Theme="Metropolis"  Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
            <Images>
                <LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
            </Images>

            <LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>

                <PanelCollection>
                    <dx:PanelContent>  



                        <div class="container-fluid">

                            
                              <div class="row Quebra_Pagina_Row">                                  
                
                                        <div class="col-xs-12 col-sm-7">
					                        <div class="widget-box">
						                        <div class="widget-header" ><h6 class="widget-title"><span class="fa fa-desktop" ></span> &nbsp; Venda Total (PDV + Televendas)</h6>

                                                    <div class="widget-toolbar">
								                        <a href="#" data-action="collapse">
									                        <i class="ace-icon fa fa-chevron-up"></i>
								                        </a>

								                        <a href="#" data-action="close">
									                        <i class="ace-icon fa fa-times"></i>
								                        </a>
							                        </div>
						
						                        </div>

						                        <div class="widget-body" style="overflow-x:auto">
							                        <div class="widget-main">

                                                        <div style="margin-top:-15px">
                                                            <dx:ASPxCheckBox ID="Atacarejo_chkProjecao" runat="server" AutoPostBack="false" Text="Projetar Vendas" Checked="false" ForeColor="#009900"  
                                                                ToolTip="Preenche a Meta de Venda como Venda Realizada dentro do mês para projetar as vendas..." Theme="Material"  >
                                                                <ClientSideEvents CheckedChanged="function(s, e) {
Atacarejo_Grid_Vendas_Diarias.Refresh();	
}" />
                                                            </dx:ASPxCheckBox>
                                                        </div>
                                                        
								
                                                        <dx:ASPxGridView ID="Atacarejo_Grid_Vendas_Diarias" runat="server" ClientInstanceName="Atacarejo_Grid_Vendas_Diarias" AutoGenerateColumns="False" DataSourceID="Atacarejo_dsVendasDiarias" EnableTheming="True" Theme="Default" Width="100%" Font-Size="Small">

                                                            <SettingsPager Mode="ShowAllRecords">
                                                            </SettingsPager>
                                                            <Settings HorizontalScrollBarMode="Auto" ShowFooter="True" VerticalScrollableHeight="300" VerticalScrollBarMode="Auto" ShowFilterRow="True" />
                                                            <SettingsBehavior AllowFocusedRow="True" />
                                                            <SettingsResizing ColumnResizeMode="Control" />
                                                            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Dia" FieldName="nomeDiaSemanaDesc" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="0" SortIndex="0" SortOrder="Descending">
                                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendas" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewBandColumn Caption="Vendas" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta_Venda" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                            <CellStyle ForeColor="#009900">
                                                                            </CellStyle>
                                                                            <FooterCellStyle ForeColor="#009900">
                                                                            </FooterCellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrVenda" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                            <CellStyle ForeColor="Blue">
                                                                            </CellStyle>
                                                                            <FooterCellStyle ForeColor="Blue">
                                                                            </FooterCellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="% Ating" FieldName="percAtingimentoMeta" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Concluido" FieldName="idStatusAtingMeta_100" ToolTip="Indicador se a Meta de Venda foi atingida."  VisibleIndex="3">
                                                                               <Settings AllowAutoFilter="False" />
                                                                               <DataItemTemplate>
                                                                                    <dx:ASPxProgressBar ID="pb" runat="server" Height="21px" OnDataBound="pb_DataBound" Theme="Default"
                                                                                        Value='<%#Eval("idStatusAtingMeta_100")%>' Width="80px" DisplayFormatString=" 0.0" >
                                                                                    </dx:ASPxProgressBar>
                                                                                </DataItemTemplate>                                   
                                    
                                                                               <FooterCellStyle HorizontalAlign="Center">
                                                                               </FooterCellStyle>
                                    
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:GridViewBandColumn>
                                                                <dx:GridViewDataTextColumn Caption="Clientes" FieldName="numCliente" ShowInCustomizationForm="True" VisibleIndex="3" Width="70px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewBandColumn Caption="Lucro Final" ShowInCustomizationForm="True" VisibleIndex="5">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="Vlr." FieldName="vlrLucroTotal" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="% Marg " FieldName="percMargemFinal" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:GridViewBandColumn>
                                                                <dx:GridViewDataTextColumn Caption="Preço&lt;br&gt;Médio" FieldName="vlrPrecoMedio" ShowInCustomizationForm="True" VisibleIndex="6" Width="70px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Ticket &lt;br&gt; Médio" FieldName="TickeMedio" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:C}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewBandColumn Caption="CAI" ShowInCustomizationForm="True" VisibleIndex="7">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="Vlr" FieldName="vlrCAI" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Perc" FieldName="percCAI" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:GridViewBandColumn>
                                                                <dx:GridViewBandColumn Caption="Sell-Out" ShowInCustomizationForm="True" VisibleIndex="9">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="Vlr" FieldName="vlrSellOut" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Perc" FieldName="percSellOut" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:GridViewBandColumn>
                                                            </Columns>
                                                            <TotalSummary>
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdVendas" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta_Venda" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotal" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numCliente" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrCAI" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrSellOut" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingimentoMeta" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinal" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrPrecoMedio" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:C}" FieldName="TickeMedio" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}%" FieldName="idStatusAtingMeta_100" SummaryType="Custom" />                                                                 
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCAI" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percSellOut" SummaryType="Custom" />
                                                            </TotalSummary>
                                                            <Toolbars>
                                                                <dx:GridViewToolbar EnableAdaptivity="true">
                                                                    <Items>
                                                                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                                                                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                                                                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                                                                    </Items>
                                                                </dx:GridViewToolbar>
                                                            </Toolbars>
                                                            <FormatConditions>
                                                                <dx:GridViewFormatConditionIconSet FieldName="percAtingimentoMeta" Format="PositiveNegativeTriangles" ShowInColumn="% Ating" />
                                                            </FormatConditions>
                                                            <Styles>
                                                                <Header HorizontalAlign="Center" BackColor="#E1E1E1">
                                                                </Header>
                                                                <AlternatingRow BackColor="#F2F2F2">
                                                                </AlternatingRow>
                                                                <FocusedRow BackColor="Yellow" ForeColor="Black" >
                                                                </FocusedRow>
                                                                <Footer Font-Bold="True">
                                                                </Footer>
                                                            </Styles>

                                                        </dx:ASPxGridView>

                                                        <asp:SqlDataSource ID="Atacarejo_dsVendasDiarias" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" 
                                                            SelectCommand="Atacarejo.usp_Buscar_Vendas_Dia" 
                                                            SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                    <asp:SessionParameter Name="DiaInicial" SessionField="sDIA_INICIAL_ATACAREJO" Type="DateTime" />                                                                    
                                                                    <asp:SessionParameter Name="DiaFinal" SessionField="sDIA_FINAL_ATACAREJO" Type="DateTime" />  
                                                                    <asp:SessionParameter Name="Projecao" SessionField="sPROJECAO" Type="Byte" />                                                                    
                                                                </SelectParameters>
                                                        </asp:SqlDataSource>
                                								
							                        </div>
						                        </div>
					                        </div>
				                        </div><!-- /.span -->                                     

                                        <div class="col-xs-12 col-sm-5">
					                        <div class="widget-box">
						                        <div class="widget-header"><h6 class="widget-title"><span class="fa fa-desktop" ></span> &nbsp; Vendas Tele-Vendas</h6>

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
							                        <div class="widget-main" style="text-align:center">

                                                        <div style="padding-bottom:5px; padding-top:-4px; text-align:left ">
                                                            <dx:ASPxLabel ID="lblParticipacao_Atacarejo" runat="server" Text="O canal de Tele-vendas representa" Theme="Material" ForeColor="Blue"></dx:ASPxLabel>
                                                        </div>
                                                        
								
                                                         <dx:ASPxGridView ID="Atacarejo_Grid_Vendas_Diarias_Tele_Vendas" runat="server" ClientInstanceName="Atacarejo_Grid_Vendas_Diarias_Depto" AutoGenerateColumns="False" DataSourceID="Atacarejo_dsVendasDiarias_Tele_Vendas" EnableTheming="True" Theme="Default" Width="100%" Font-Size="Small">

                                                            <SettingsPager Mode="ShowAllRecords">
                                                            </SettingsPager>
                                                            <Settings HorizontalScrollBarMode="Auto" ShowFooter="True" VerticalScrollableHeight="347" VerticalScrollBarMode="Auto" ShowFilterRow="True" />
                                                            <SettingsBehavior AllowFocusedRow="True" />
                                                             <SettingsResizing ColumnResizeMode="Control" />
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Dia" FieldName="nomeDiaSemanaDesc" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="0" SortIndex="0" SortOrder="Descending" >
                                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                    <CellStyle Wrap="False" HorizontalAlign="Left">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendas" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewBandColumn Caption="Lucro Final" ShowInCustomizationForm="True" VisibleIndex="7">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="Vlr." FieldName="vlrLucroTotal" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="% Marg " FieldName="percMargemFinal" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:GridViewBandColumn>
                                                                <dx:GridViewDataTextColumn Caption="Preço&lt;br&gt;Médio" FieldName="vlrPrecoMedio" ShowInCustomizationForm="True" VisibleIndex="8" Width="70px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrVenda" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                    <CellStyle ForeColor="Blue">
                                                                    </CellStyle>
                                                                    <FooterCellStyle ForeColor="Blue">
                                                                    </FooterCellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <TotalSummary>
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdVendas" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotal" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinal" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrPrecoMedio" SummaryType="Custom" />
                                                            </TotalSummary>
                                                            <FormatConditions>
                                                                <dx:GridViewFormatConditionIconSet FieldName="percAtingimentoMeta" Format="PositiveNegativeTriangles" ShowInColumn="% Ating" />
                                                            </FormatConditions>
                                                            <Styles>
                                                                <Header HorizontalAlign="Center" BackColor="#E1E1E1">
                                                                </Header>
                                                                <AlternatingRow BackColor="#F2F2F2">
                                                                </AlternatingRow>
                                                                <FocusedRow BackColor="Yellow" ForeColor="Black" >
                                                                </FocusedRow>
                                                                <Footer Font-Bold="True">
                                                                </Footer>
                                                            </Styles>

                                                        </dx:ASPxGridView>

                                                        <asp:SqlDataSource ID="Atacarejo_dsVendasDiarias_Tele_Vendas" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" 
                                                            SelectCommand="dbo.usp_Buscar_Venda_NF" 
                                                            SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                    <asp:SessionParameter Name="DiaInicial" SessionField="sDIA_INICIAL_ATACAREJO" Type="DateTime" />                                                                    
                                                                    <asp:SessionParameter Name="DiaFinal" SessionField="sDIA_FINAL_ATACAREJO" Type="DateTime" />   
                                                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL_603" Type="Int16" DefaultValue ="603" />                                                                                                                                   
                                                                </SelectParameters>
                                                        </asp:SqlDataSource>

                                                     
                                								
							                        </div>
						                        </div>
					                        </div>
				                        </div><!-- /.span -->
                                  
                              </div> 

                            <hr />


                              <div class="row Quebra_Pagina_Row">
                
                                        <div class="col-xs-12 col-sm-12">
					                        <div class="widget-box">
						                        <div class="widget-header"><h6 class="widget-title"><span class="fa fa-desktop" ></span> &nbsp; Venda por Departamento - (PDV + Televendas)</h6>

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

                                                         <dx:ASPxGridView ID="Atacarejo_Grid_Vendas_Diarias_Depto" runat="server" ClientInstanceName="Atacarejo_Grid_Vendas_Diarias_Depto" AutoGenerateColumns="False" DataSourceID="Atacarejo_dsVendasDiarias_Depto" EnableTheming="True" Theme="Default" Width="100%" Font-Size="Small">

                                                            <SettingsPager Mode="ShowAllRecords">
                                                            </SettingsPager>
                                                            <Settings HorizontalScrollBarMode="Auto" ShowFooter="True" VerticalScrollableHeight="175" VerticalScrollBarMode="Auto" ShowFilterRow="True" />
                                                            <SettingsBehavior AllowFocusedRow="True" />
                                                             <SettingsResizing ColumnResizeMode="Control" />
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Departamentos" FieldName="nomeDiaSemanaDesc" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="0" Width="150px">
                                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                    <CellStyle Wrap="False">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewBandColumn Caption="Venda Total (PDV + Tele-Vendas)" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta_Venda" ShowInCustomizationForm="True" VisibleIndex="6" Visible="False">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                            <CellStyle ForeColor="#009900">
                                                                            </CellStyle>
                                                                            <FooterCellStyle ForeColor="#009900">
                                                                            </FooterCellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrVenda" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                            <CellStyle ForeColor="Blue">
                                                                            </CellStyle>
                                                                            <FooterCellStyle ForeColor="Blue">
                                                                            </FooterCellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="% Ating" FieldName="percAtingimentoMeta" ShowInCustomizationForm="True" VisibleIndex="7" Width="70px" Visible="False">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Concluido" FieldName="idStatusAtingMeta_100" ToolTip="Indicador se a Meta de Venda foi atingida."  VisibleIndex="8" Visible="False">
                                                                               <Settings AllowAutoFilter="False" />
                                                                               <DataItemTemplate>
                                                                                    <dx:ASPxProgressBar ID="pb" runat="server" Height="21px" OnDataBound="pb_DataBound" Theme="Default"
                                                                                        Value='<%#Eval("idStatusAtingMeta_100")%>' Width="80px" DisplayFormatString=" 0.0" >
                                                                                    </dx:ASPxProgressBar>
                                                                                </DataItemTemplate>                                   
                                    
                                                                               <FooterCellStyle HorizontalAlign="Center">
                                                                               </FooterCellStyle>
                                    
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendas" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Lucro PDV" FieldName="vlrLucroComercial" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="% Marg PDV" FieldName="percMargemPDV" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Lucro Final" FieldName="vlrLucroTotal" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="% Marg Final" FieldName="percMargemFinal" ShowInCustomizationForm="True" VisibleIndex="5" >
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:GridViewBandColumn>
                                                                <dx:GridViewDataTextColumn Caption="Clientes" FieldName="numCliente" ShowInCustomizationForm="True" VisibleIndex="5" Width="70px" Visible="False">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Preço&lt;br&gt;Médio" FieldName="vlrPrecoMedio" ShowInCustomizationForm="True" VisibleIndex="3" Width="70px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Ticket &lt;br&gt; Médio" FieldName="TickeMedio" ShowInCustomizationForm="True" VisibleIndex="6" Visible="False">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:C}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPartVendas" ShowInCustomizationForm="True" ToolTip="Percentual de Participação de cada Departamento em relação a Venda Total" VisibleIndex="2" Width="65px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewBandColumn Caption="Venda Tele-Vendas" ShowInCustomizationForm="True" VisibleIndex="8">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeNF" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrVendaNF" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Lucro Final" FieldName="vlrLucroFinalNF" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="% Marg Final" FieldName="percMargemFinalNF" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:GridViewBandColumn>
                                                                <dx:GridViewBandColumn Caption="Vendas" ShowInCustomizationForm="True" VisibleIndex="11">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde_Liq" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrVenda_Liq" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Lucro Final" FieldName="vlrLucroTotal_Liq" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="% Marg Final" FieldName="percMargemFinalNF_Liq" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:GridViewBandColumn>
                                                            </Columns>
                                                            <TotalSummary>
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdVendas" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta_Venda" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotal" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numCliente" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeNF" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaNF" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroFinalNF" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}%" FieldName="percPartVendas" SummaryType="Sum" />                                                                

                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde_Liq" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda_Liq" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotal_Liq" SummaryType="Sum" />

                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercial" SummaryType="Sum" />

                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingimentoMeta" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinal" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrPrecoMedio" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:C}" FieldName="TickeMedio" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}%" FieldName="idStatusAtingMeta_100" SummaryType="Custom" />                                                                 
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinalNF" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemPDV" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinalNF_Liq" SummaryType="Custom" />
                                                                

                                                            </TotalSummary>
                                                            <FormatConditions>
                                                                <dx:GridViewFormatConditionIconSet FieldName="percAtingimentoMeta" Format="PositiveNegativeTriangles" ShowInColumn="% Ating" />
                                                            </FormatConditions>
                                                            <Styles>
                                                                <Header HorizontalAlign="Center" BackColor="#E1E1E1">
                                                                </Header>
                                                                <AlternatingRow BackColor="#F2F2F2">
                                                                </AlternatingRow>
                                                                <FocusedRow BackColor="Yellow" ForeColor="Black" >
                                                                </FocusedRow>
                                                                <Footer Font-Bold="True">
                                                                </Footer>
                                                            </Styles>

                                                        </dx:ASPxGridView>

                                                        <asp:SqlDataSource ID="Atacarejo_dsVendasDiarias_Depto" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" 
                                                            SelectCommand="Atacarejo.usp_Buscar_Vendas_Dia_Departamento" 
                                                            SelectCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:DWConnectionString.ProviderName %>">
                                                            <SelectParameters>
                                                                    <asp:SessionParameter Name="DiaInicial" SessionField="sDIA_INICIAL_ATACAREJO" Type="DateTime" />                                                                    
                                                                    <asp:SessionParameter Name="DiaFinal" SessionField="sDIA_FINAL_ATACAREJO" Type="DateTime" />   
                                                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL_603" Type="Int16" DefaultValue ="603" />                                                                                                                                    
                                                                </SelectParameters>
                                                        </asp:SqlDataSource>

								
                                                       		
							                        </div>
						                        </div>
					                        </div>
				                        </div><!-- /.span -->

                                   </div> 

                                  <div class="row Quebra_Pagina_Row">

                                        <div class="col-xs-12 col-sm-12">
					                        <div class="widget-box">
						                        <div class="widget-header"><h6 class="widget-title"><span class="fa fa-desktop" ></span> &nbsp;Venda por Seção - (PDV + Televendas)</h6>

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
								
                                                         <dx:ASPxGridView ID="Atacarejo_Grid_Vendas_Diarias_Secao" runat="server" ClientInstanceName="Atacarejo_Grid_Vendas_Diarias_Secao" AutoGenerateColumns="False" DataSourceID="Atacarejo_dsVendasDiarias_Secao" EnableTheming="True" Theme="Default" Width="100%" Font-Size="Small">

                                                            <SettingsPager Mode="ShowAllRecords">
                                                            </SettingsPager>
                                                            <Settings HorizontalScrollBarMode="Auto" ShowFooter="True" VerticalScrollableHeight="175" VerticalScrollBarMode="Auto" ShowFilterRow="True" />
                                                            <SettingsBehavior AllowFocusedRow="True" />
                                                             <SettingsResizing ColumnResizeMode="Control" />
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Departamentos" FieldName="nomeDiaSemanaDesc" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="0" Width="150px">
                                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                    <CellStyle Wrap="False">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewBandColumn Caption="Venda Total (PDV + Tele-Vendas)" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta_Venda" ShowInCustomizationForm="True" VisibleIndex="6" Visible="False">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                            <CellStyle ForeColor="#009900">
                                                                            </CellStyle>
                                                                            <FooterCellStyle ForeColor="#009900">
                                                                            </FooterCellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrVenda" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                            <CellStyle ForeColor="Blue">
                                                                            </CellStyle>
                                                                            <FooterCellStyle ForeColor="Blue">
                                                                            </FooterCellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="% Ating" FieldName="percAtingimentoMeta" ShowInCustomizationForm="True" VisibleIndex="7" Width="70px" Visible="False">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Concluido" FieldName="idStatusAtingMeta_100" ToolTip="Indicador se a Meta de Venda foi atingida."  VisibleIndex="8" Visible="False">
                                                                               <Settings AllowAutoFilter="False" />
                                                                               <DataItemTemplate>
                                                                                    <dx:ASPxProgressBar ID="pb" runat="server" Height="21px" OnDataBound="pb_DataBound" Theme="Default"
                                                                                        Value='<%#Eval("idStatusAtingMeta_100")%>' Width="80px" DisplayFormatString=" 0.0" >
                                                                                    </dx:ASPxProgressBar>
                                                                                </DataItemTemplate>                                   
                                    
                                                                               <FooterCellStyle HorizontalAlign="Center">
                                                                               </FooterCellStyle>
                                    
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendas" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Lucro PDV" FieldName="vlrLucroComercial" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="% Marg PDV" FieldName="percMargemPDV" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Lucro Final" FieldName="vlrLucroTotal" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="% Marg Final" FieldName="percMargemFinal" ShowInCustomizationForm="True" VisibleIndex="5" >
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:GridViewBandColumn>
                                                                <dx:GridViewDataTextColumn Caption="Clientes" FieldName="numCliente" ShowInCustomizationForm="True" VisibleIndex="5" Width="70px" Visible="False">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Preço&lt;br&gt;Médio" FieldName="vlrPrecoMedio" ShowInCustomizationForm="True" VisibleIndex="3" Width="70px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Ticket &lt;br&gt; Médio" FieldName="TickeMedio" ShowInCustomizationForm="True" VisibleIndex="6" Visible="False">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:C}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPartVendas" ShowInCustomizationForm="True" ToolTip="Percentual de Participação de cada Departamento em relação a Venda Total" VisibleIndex="2" Width="65px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewBandColumn Caption="Venda Tele-Vendas" ShowInCustomizationForm="True" VisibleIndex="8">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeNF" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrVendaNF" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Lucro Final" FieldName="vlrLucroFinalNF" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="% Marg Final" FieldName="percMargemFinalNF" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:GridViewBandColumn>
                                                                <dx:GridViewBandColumn Caption="Vendas" ShowInCustomizationForm="True" VisibleIndex="11">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde_Liq" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrVenda_Liq" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Lucro Final" FieldName="vlrLucroTotal_Liq" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="% Marg Final" FieldName="percMargemFinalNF_Liq" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:GridViewBandColumn>
                                                            </Columns>
                                                            <TotalSummary>
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdVendas" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta_Venda" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotal" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numCliente" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeNF" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaNF" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroFinalNF" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}%" FieldName="percPartVendas" SummaryType="Sum" />                                                                

                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde_Liq" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda_Liq" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotal_Liq" SummaryType="Sum" />

                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercial" SummaryType="Sum" />

                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingimentoMeta" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinal" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrPrecoMedio" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:C}" FieldName="TickeMedio" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}%" FieldName="idStatusAtingMeta_100" SummaryType="Custom" />                                                                 
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinalNF" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemPDV" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinalNF_Liq" SummaryType="Custom" />
                                                                

                                                            </TotalSummary>
                                                            <FormatConditions>
                                                                <dx:GridViewFormatConditionIconSet FieldName="percAtingimentoMeta" Format="PositiveNegativeTriangles" ShowInColumn="% Ating" />
                                                            </FormatConditions>
                                                            <Styles>
                                                                <Header HorizontalAlign="Center" BackColor="#E1E1E1">
                                                                </Header>
                                                                <AlternatingRow BackColor="#F2F2F2">
                                                                </AlternatingRow>
                                                                <FocusedRow BackColor="Yellow" ForeColor="Black" >
                                                                </FocusedRow>
                                                                <Footer Font-Bold="True">
                                                                </Footer>
                                                            </Styles>

                                                        </dx:ASPxGridView>

                                                        <asp:SqlDataSource ID="Atacarejo_dsVendasDiarias_Secao" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" 
                                                            SelectCommand="Atacarejo.usp_Buscar_Vendas_Dia_Secao" 
                                                            SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                    <asp:SessionParameter Name="DiaInicial" SessionField="sDIA_INICIAL_ATACAREJO" Type="DateTime" />                                                                    
                                                                    <asp:SessionParameter Name="DiaFinal" SessionField="sDIA_FINAL_ATACAREJO" Type="DateTime" />     
                                                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL_603" Type="Int16" DefaultValue ="603" />                                                                                                                                     
                                                                </SelectParameters>
                                                        </asp:SqlDataSource>
                                           
                                								
							                        </div>
						                        </div>
					                        </div>
				                        </div><!-- /.span -->
                                                                    
                              </div> 

                                          

                            <hr />

                                 <div class="row Quebra_Pagina_Row">

                                     <div class="col-xs-12 col-sm-12">
					                    <div class="widget-box">
						                    <div class="widget-header"><h6 class="widget-title"><span class="fa fa-desktop" ></span> &nbsp; Venda por Item</h6>
						
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

                                                         <dx:ASPxGridView ID="Atacarejo_Grid_Vendas_Diarias_Item" runat="server" ClientInstanceName="Atacarejo_Grid_Vendas_Diarias_Item" AutoGenerateColumns="False" DataSourceID="Atacarejo_dsVendasDiarias_Item" EnableTheming="True" Theme="Default" Width="100%" Font-Size="Small">

                                                             <SettingsPager PageSize="20">
                                                             </SettingsPager>
                                                            <Settings HorizontalScrollBarMode="Auto" ShowFooter="True" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" ShowFilterRow="True" ShowGroupPanel="True" />
                                                            <SettingsBehavior AllowFocusedRow="True" />
                                                             <SettingsResizing ColumnResizeMode="Control" />
                                                             <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                                            <Columns>
                                                                <dx:GridViewBandColumn ShowInCustomizationForm="True" VisibleIndex="0" FixedStyle="Left">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="Produto" FieldName="idProduto" ShowInCustomizationForm="True" VisibleIndex="0" FixedStyle="Left">
                                                                            <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                            <CellStyle HorizontalAlign="Left" Wrap="False">
                                                                            </CellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Descrição do Produto" FieldName="nomeProduto" ShowInCustomizationForm="True" VisibleIndex="1" Width="250px">
                                                                            <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                            <CellStyle Wrap="False">
                                                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                                            </CellStyle>
                                                                            <FooterCellStyle>
                                                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                                            </FooterCellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:GridViewBandColumn>
                                                                <dx:GridViewBandColumn Caption="Venda Total (PDV + Tele-Vendas)" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdePDV" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrVendaPDV" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                            <CellStyle ForeColor="Blue">
                                                                                <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                                                            </CellStyle>
                                                                            <FooterCellStyle ForeColor="Blue">
                                                                            </FooterCellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Lucro Final" FieldName="vlrLucroTotalPDV" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="% Marg Final" FieldName="percMargemFinalPDV" ShowInCustomizationForm="True" VisibleIndex="5">
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
                                                                        <dx:GridViewDataTextColumn Caption="% Marg PDV" FieldName="percMargemComercial" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <CellStyle>
                                                                                <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                                                            </CellStyle>
                                                                            <FooterCellStyle>
                                                                                <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                                                            </FooterCellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Lucro PDV" FieldName="vlrLucroComercial" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:GridViewBandColumn>

                                                                <dx:GridViewBandColumn Caption="Venda Tele-Vendas" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeNF" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrVendaNF" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="True" AutoFilterCondition="GreaterOrEqual" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Lucro Final" FieldName="vlrLucroFinalNF" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="% Marg Final" FieldName="percMargemFinalNF" ShowInCustomizationForm="True" VisibleIndex="3">
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
                                                                <dx:GridViewBandColumn Caption="Venda PDV" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                    <HeaderStyle BackColor="#CCFFCC" />
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                            <HeaderStyle BackColor="#CCFFCC" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrVenda" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                            <HeaderStyle BackColor="#CCFFCC" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Lucro Final" FieldName="vlrLucroTotal" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                            <HeaderStyle BackColor="#CCFFCC" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="% Margem Final" FieldName="percMargemFinal" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                            <HeaderStyle BackColor="#CCFFCC" />
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:GridViewBandColumn>
                                                                <dx:GridViewBandColumn Caption="Mercadológico" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="Departamento" FieldName="Depto" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                            <CellStyle Wrap="False">
                                                                            </CellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Seção" FieldName="Secao" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                            <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                            <CellStyle Wrap="False">
                                                                            </CellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Grupo" FieldName="Grupo" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                            <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                            <CellStyle Wrap="False">
                                                                            </CellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Subgrupo" FieldName="Subgrupo" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                            <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                            <CellStyle Wrap="False">
                                                                            </CellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:GridViewBandColumn>
                                                            </Columns>
                                                            <TotalSummary>
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdePDV" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaPDV" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotalPDV" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinalPDV" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeNF" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaNF" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroFinalNF" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinalNF" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotal" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinal" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercial" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemComercial" SummaryType="Custom" />
                                                            </TotalSummary>
                                                            <FormatConditions>
                                                                <dx:GridViewFormatConditionIconSet FieldName="percAtingimentoMeta" Format="PositiveNegativeTriangles" ShowInColumn="% Ating" />
                                                            </FormatConditions>
                                                            <Styles>
                                                                <Header HorizontalAlign="Center" BackColor="#E1E1E1">
                                                                </Header>
                                                                <AlternatingRow BackColor="#F2F2F2">
                                                                </AlternatingRow>
                                                                <FocusedRow BackColor="Yellow" ForeColor="Black" >
                                                                </FocusedRow>
                                                                <Footer Font-Bold="True">
                                                                </Footer>
                                                            </Styles>

                                                        </dx:ASPxGridView>

                                                        <asp:SqlDataSource ID="Atacarejo_dsVendasDiarias_Item" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" 
                                                            SelectCommand="Atacarejo.usp_Buscar_Venda_Item" 
                                                            SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                    <asp:SessionParameter Name="DiaInicial" SessionField="sDIA_INICIAL_ATACAREJO" Type="DateTime" />                                                                    
                                                                    <asp:SessionParameter Name="DiaFinal" SessionField="sDIA_FINAL_ATACAREJO" Type="DateTime" />
                                                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL_603" Type="Int16" DefaultValue ="603" />                                                                                                                                       
                                                                </SelectParameters>
                                                        </asp:SqlDataSource>
                            
                                            
								
							</div>
						</div>
					</div>
				</div><!-- /.span -->

                                                                       
                                </div> 

                            <hr />

                                 <div class="row Quebra_Pagina_Row">

                                     <div class="col-xs-6 col-sm-6">
					                    <div class="widget-box">
						                    <div class="widget-header"><h6 class="widget-title"><span class="fa fa-desktop" ></span> &nbsp; Top 50 Produtos no período - Maior Venda</h6>
						
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

                                                         <dx:ASPxGridView ID="Atacarejo_Grid_Vendas_Diarias_Itens_Mais_Vendidos" runat="server" ClientInstanceName="Atacarejo_Grid_Vendas_Diarias_Itens_Mais_Vendidos" AutoGenerateColumns="False" DataSourceID="Atacarejo_dsVendasDiarias_ItemMiasVendidos" EnableTheming="True" Theme="Default" Width="100%" Font-Size="Small">

                                                             <SettingsPager PageSize="20" Mode="ShowAllRecords">
                                                             </SettingsPager>
                                                            <Settings HorizontalScrollBarMode="Auto" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" ShowFilterRow="True" />
                                                            <SettingsBehavior AllowFocusedRow="True" />
                                                             <SettingsResizing ColumnResizeMode="Control" />
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendas" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrVenda" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                    <CellStyle ForeColor="Blue">
                                                                    </CellStyle>
                                                                    <FooterCellStyle ForeColor="Blue">
                                                                    </FooterCellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Lucro Final" FieldName="vlrLucroTotal" ShowInCustomizationForm="True" VisibleIndex="5">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="% Marg Final" FieldName="percMargemFinal" ShowInCustomizationForm="True" VisibleIndex="6">
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
                                                                <dx:GridViewDataTextColumn Caption="Produto" FieldName="idProduto" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                    <CellStyle HorizontalAlign="Left" Wrap="False">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Descrição do Produto" FieldName="nomeProduto" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="2" Width="250px">
                                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                    <CellStyle Wrap="False">
                                                                    </CellStyle>
                                                                    <FooterCellStyle>
                                                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                                    </FooterCellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Rnk" FieldName="Ranking" FixedStyle="Left" ShowInCustomizationForm="True" ToolTip="Ranking" VisibleIndex="0" Width="50px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <FormatConditions>
                                                                <dx:GridViewFormatConditionIconSet FieldName="percAtingimentoMeta" Format="PositiveNegativeTriangles" ShowInColumn="% Ating" />
                                                            </FormatConditions>
                                                            <Styles>
                                                                <Header HorizontalAlign="Center" BackColor="#E1E1E1">
                                                                </Header>
                                                                <AlternatingRow BackColor="#F2F2F2">
                                                                </AlternatingRow>
                                                                <FocusedRow BackColor="Yellow" ForeColor="Black" >
                                                                </FocusedRow>
                                                                <Footer Font-Bold="True">
                                                                </Footer>
                                                            </Styles>

                                                        </dx:ASPxGridView>

                                                        <asp:SqlDataSource ID="Atacarejo_dsVendasDiarias_ItemMiasVendidos" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" 
                                                            SelectCommand="Atacarejo.usp_TOP_50_Vendas" 
                                                            SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                    <asp:SessionParameter Name="DiaInicial" SessionField="sDIA_INICIAL_ATACAREJO" Type="DateTime" />                                                                    
                                                                    <asp:SessionParameter Name="DiaFinal" SessionField="sDIA_FINAL_ATACAREJO" Type="DateTime" />  
                                                                 <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" DefaultValue ="603" />                                                                                                                                        
                                                                </SelectParameters>
                                                        </asp:SqlDataSource>
                            
                                            
								
							</div>
						</div>
					</div>
				</div><!-- /.span -->


                                     <div class="col-xs-6 col-sm-6">
					                    <div class="widget-box">
						                    <div class="widget-header"><h6 class="widget-title"><span class="fa fa-desktop" ></span> &nbsp; Top 50 Produtos no período - Menor Lucro </h6>
						
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

                                                         <dx:ASPxGridView ID="Atacarejo_Grid_Vendas_Diarias_Itens_Mais_Lucratividade" runat="server" ClientInstanceName="Atacarejo_Grid_Vendas_Diarias_Itens_Mais_Lucratividade" AutoGenerateColumns="False" DataSourceID="Atacarejo_ds_Vendas_Diarias_Itens_Mais_Lucratividade" EnableTheming="True" Theme="Default" Width="100%" Font-Size="Small">

                                                             <SettingsPager PageSize="20" Mode="ShowAllRecords">
                                                             </SettingsPager>
                                                            <Settings HorizontalScrollBarMode="Auto" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" ShowFilterRow="True" />
                                                            <SettingsBehavior AllowFocusedRow="True" />
                                                             <SettingsResizing ColumnResizeMode="Control" />
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendas" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrVenda" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                   
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Lucro Final" FieldName="vlrLucroTotal" ShowInCustomizationForm="True" VisibleIndex="5">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                     <CellStyle ForeColor="Blue">
                                                                    </CellStyle>
                                                                    <FooterCellStyle ForeColor="Blue">
                                                                    </FooterCellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="% Marg Final" FieldName="percMargemFinal" ShowInCustomizationForm="True" VisibleIndex="6">
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
                                                                <dx:GridViewDataTextColumn Caption="Produto" FieldName="idProduto" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                    <CellStyle HorizontalAlign="Left" Wrap="False">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Descrição do Produto" FieldName="nomeProduto" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="2" Width="250px">
                                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                    <CellStyle Wrap="False">
                                                                    </CellStyle>
                                                                    <FooterCellStyle>
                                                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                                    </FooterCellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Rnk" FieldName="Ranking" FixedStyle="Left" ShowInCustomizationForm="True" ToolTip="Ranking" VisibleIndex="0" Width="50px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <FormatConditions>
                                                                <dx:GridViewFormatConditionIconSet FieldName="percAtingimentoMeta" Format="PositiveNegativeTriangles" ShowInColumn="% Ating" />
                                                            </FormatConditions>
                                                            <Styles>
                                                                <Header HorizontalAlign="Center" BackColor="#E1E1E1">
                                                                </Header>
                                                                <AlternatingRow BackColor="#F2F2F2">
                                                                </AlternatingRow>
                                                                <FocusedRow BackColor="Yellow" ForeColor="Black" >
                                                                </FocusedRow>
                                                                <Footer Font-Bold="True">
                                                                </Footer>
                                                            </Styles>

                                                        </dx:ASPxGridView>

                                                        <asp:SqlDataSource ID="Atacarejo_ds_Vendas_Diarias_Itens_Mais_Lucratividade" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" 
                                                            SelectCommand="Atacarejo.usp_TOP_50_Lucratividade" 
                                                            SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                    <asp:SessionParameter Name="DiaInicial" SessionField="sDIA_INICIAL_ATACAREJO" Type="DateTime" />                                                                    
                                                                    <asp:SessionParameter Name="DiaFinal" SessionField="sDIA_FINAL_ATACAREJO" Type="DateTime" />    
                                                                 <asp:SessionParameter Name="idFilial" SessionField="sFILIAL_603" Type="Int16" DefaultValue ="603" />                                                                                                                                      
                                                                </SelectParameters>
                                                        </asp:SqlDataSource>
                            
                                            
								
							</div>
						</div>
					</div>
				</div><!-- /.span -->


                                                                       
                                </div> 



                        </div> 

                        </dx:PanelContent>
            </PanelCollection>

        </dx:ASPxCallbackPanel>   

                    </dx:ContentControl>
                </ContentCollection>

            </dx:TabPage>

            <dx:TabPage Text="604 - Colombo">
                
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl1" runat="server">                        

                        <div class="Condor_clear_both">                                  
                                <uc1:wucListaDiaIniFin runat="server" ID="atcarejo604_cboDia" />
                        </div>

                        <div class="Condor_float_left Condor_margin_left_10px" style="margin-top: -20px">
                            <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Atualizar" Theme="Metropolis" AutoPostBack="false" >
                                <ClientSideEvents Click="function(s, e) {
                                    cbPanelAtacarejo604.PerformCallback();	
                                }" />
                            </dx:ASPxButton>
                        </div>

         <dx:ASPxCallbackPanel ID="cbPanelAtacarejo604" runat="server" Width="100%" ClientInstanceName="cbPanelAtacarejo604" Theme="Metropolis"  Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
            <Images>
                <LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
            </Images>

            <LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>

                <PanelCollection>
                    <dx:PanelContent>  
                        
                        <div class="container-fluid">
                            
                              <div class="row Quebra_Pagina_Row">                                  
                
                                        <div class="col-xs-12 col-sm-7">
					                        <div class="widget-box">
						                        <div class="widget-header"><h6 class="widget-title"><span class="fa fa-desktop" ></span> &nbsp; Venda Total (PDV + Televendas)</h6>

                                                    <div class="widget-toolbar">
								                        <a href="#" data-action="collapse">
									                        <i class="ace-icon fa fa-chevron-up"></i>
								                        </a>

								                        <a href="#" data-action="close">
									                        <i class="ace-icon fa fa-times"></i>
								                        </a>
							                        </div>
						
						                        </div>

						                        <div class="widget-body" style="overflow-x:auto">
							                        <div class="widget-main">

                                                        <div style="margin-top:-15px">
                                                            <dx:ASPxCheckBox ID="ASPxCheckBox1" runat="server" AutoPostBack="false" Text="Projetar Vendas" Checked="false" ForeColor="#009900"  
                                                                ToolTip="Preenche a Meta de Venda como Venda Realizada dentro do mês para projetar as vendas..." Theme="Material"  >
                                                                <ClientSideEvents CheckedChanged="function(s, e) {
Atacarejo_Grid_Vendas_Diarias.Refresh();	
}" />
                                                            </dx:ASPxCheckBox>
                                                        </div>                                                        
								
                                                        <dx:ASPxGridView ID="Atacarejo_Grid_Vendas_Diarias_604" runat="server" ClientInstanceName="Atacarejo_Grid_Vendas_Diarias_604" AutoGenerateColumns="False" DataSourceID="Atacarejo_dsVendasDiarias_604" EnableTheming="True" Theme="Default" Width="100%" Font-Size="Small">

                                                            <SettingsPager Mode="ShowAllRecords">
                                                            </SettingsPager>
                                                            <Settings HorizontalScrollBarMode="Auto" ShowFooter="True" VerticalScrollableHeight="300" VerticalScrollBarMode="Auto" ShowFilterRow="True" />
                                                            <SettingsBehavior AllowFocusedRow="True" />
                                                            <SettingsResizing ColumnResizeMode="Control" />
                                                            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Dia" FieldName="nomeDiaSemanaDesc" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="0" SortIndex="0" SortOrder="Descending">
                                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendas" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewBandColumn Caption="Vendas" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta_Venda" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                            <CellStyle ForeColor="#009900">
                                                                            </CellStyle>
                                                                            <FooterCellStyle ForeColor="#009900">
                                                                            </FooterCellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrVenda" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                            <CellStyle ForeColor="Blue">
                                                                            </CellStyle>
                                                                            <FooterCellStyle ForeColor="Blue">
                                                                            </FooterCellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="% Ating" FieldName="percAtingimentoMeta" ShowInCustomizationForm="True" VisibleIndex="2" Width="70px">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Concluido" FieldName="idStatusAtingMeta_100" ToolTip="Indicador se a Meta de Venda foi atingida."  VisibleIndex="3">
                                                                               <Settings AllowAutoFilter="False" />
                                                                               <DataItemTemplate>
                                                                                    <dx:ASPxProgressBar ID="pb" runat="server" Height="21px" OnDataBound="pb_DataBound" Theme="Default"
                                                                                        Value='<%#Eval("idStatusAtingMeta_100")%>' Width="80px" DisplayFormatString=" 0.0" >
                                                                                    </dx:ASPxProgressBar>
                                                                                </DataItemTemplate>                                   
                                    
                                                                               <FooterCellStyle HorizontalAlign="Center">
                                                                               </FooterCellStyle>
                                    
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:GridViewBandColumn>
                                                                <dx:GridViewDataTextColumn Caption="Clientes" FieldName="numCliente" ShowInCustomizationForm="True" VisibleIndex="3" Width="70px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewBandColumn Caption="Lucro Final" ShowInCustomizationForm="True" VisibleIndex="5">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="Vlr." FieldName="vlrLucroTotal" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="% Marg " FieldName="percMargemFinal" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:GridViewBandColumn>
                                                                <dx:GridViewDataTextColumn Caption="Preço&lt;br&gt;Médio" FieldName="vlrPrecoMedio" ShowInCustomizationForm="True" VisibleIndex="6" Width="70px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Ticket &lt;br&gt; Médio" FieldName="TickeMedio" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:C}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewBandColumn Caption="CAI" ShowInCustomizationForm="True" VisibleIndex="7">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="Vlr" FieldName="vlrCAI" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Perc" FieldName="percCAI" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:GridViewBandColumn>
                                                                <dx:GridViewBandColumn Caption="Sell-Out" ShowInCustomizationForm="True" VisibleIndex="9">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="Vlr" FieldName="vlrSellOut" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Perc" FieldName="percSellOut" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:GridViewBandColumn>
                                                            </Columns>
                                                            <TotalSummary>
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdVendas" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta_Venda" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotal" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numCliente" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrCAI" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrSellOut" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingimentoMeta" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinal" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrPrecoMedio" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:C}" FieldName="TickeMedio" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}%" FieldName="idStatusAtingMeta_100" SummaryType="Custom" />                                                                 
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCAI" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percSellOut" SummaryType="Custom" />
                                                            </TotalSummary>
                                                            <Toolbars>
                                                                <dx:GridViewToolbar EnableAdaptivity="true">
                                                                    <Items>
                                                                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                                                                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                                                                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                                                                    </Items>
                                                                </dx:GridViewToolbar>
                                                            </Toolbars>
                                                            <FormatConditions>
                                                                <dx:GridViewFormatConditionIconSet FieldName="percAtingimentoMeta" Format="PositiveNegativeTriangles" ShowInColumn="% Ating" />
                                                            </FormatConditions>
                                                            <Styles>
                                                                <Header HorizontalAlign="Center" BackColor="#E1E1E1">
                                                                </Header>
                                                                <AlternatingRow BackColor="#F2F2F2">
                                                                </AlternatingRow>
                                                                <FocusedRow BackColor="Yellow" ForeColor="Black" >
                                                                </FocusedRow>
                                                                <Footer Font-Bold="True">
                                                                </Footer>
                                                            </Styles>

                                                        </dx:ASPxGridView>

                                                        <asp:SqlDataSource ID="Atacarejo_dsVendasDiarias_604" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" 
                                                            SelectCommand="Atacarejo.usp_Buscar_Vendas_Dia_604" 
                                                            SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                    <asp:SessionParameter Name="DiaInicial" SessionField="sDIA_INICIAL_ATACAREJO_604" Type="DateTime" />                                                                    
                                                                    <asp:SessionParameter Name="DiaFinal" SessionField="sDIA_FINAL_ATACAREJO_604" Type="DateTime" />  
                                                                    <asp:SessionParameter Name="Projecao" SessionField="sPROJECAO" Type="Byte" />                                                                    
                                                                </SelectParameters>
                                                        </asp:SqlDataSource>
                                								
							                        </div>
						                        </div>
					                        </div>
				                        </div><!-- /.span -->                                     

                                        <div class="col-xs-12 col-sm-5">
					                        <div class="widget-box">
						                        <div class="widget-header"><h6 class="widget-title"><span class="fa fa-desktop" ></span> &nbsp; Vendas Tele-Vendas</h6>

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
							                        <div class="widget-main" style="text-align:center">

                                                        <div style="padding-bottom:5px; padding-top:-4px; text-align:left ">
                                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="O canal de Tele-vendas representa" Theme="Material" ForeColor="Blue"></dx:ASPxLabel>
                                                        </div>
                                                        
								
                                                         <dx:ASPxGridView ID="Atacarejo_Grid_Vendas_Diarias_Tele_Vendas_604" runat="server" ClientInstanceName="Atacarejo_Grid_Vendas_Diarias_Tele_Vendas_604" AutoGenerateColumns="False" DataSourceID="Atacarejo_dsVendasDiarias_Tele_Vendas_604" EnableTheming="True" Theme="Default" Width="100%" Font-Size="Small">

                                                            <SettingsPager Mode="ShowAllRecords">
                                                            </SettingsPager>
                                                            <Settings HorizontalScrollBarMode="Auto" ShowFooter="True" VerticalScrollableHeight="347" VerticalScrollBarMode="Auto" ShowFilterRow="True" />
                                                            <SettingsBehavior AllowFocusedRow="True" />
                                                             <SettingsResizing ColumnResizeMode="Control" />
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Dia" FieldName="nomeDiaSemanaDesc" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="0" SortIndex="0" SortOrder="Descending" >
                                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                    <CellStyle Wrap="False" HorizontalAlign="Left">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendas" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewBandColumn Caption="Lucro Final" ShowInCustomizationForm="True" VisibleIndex="7">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="Vlr." FieldName="vlrLucroTotal" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="% Marg " FieldName="percMargemFinal" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:GridViewBandColumn>
                                                                <dx:GridViewDataTextColumn Caption="Preço&lt;br&gt;Médio" FieldName="vlrPrecoMedio" ShowInCustomizationForm="True" VisibleIndex="8" Width="70px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrVenda" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                    <CellStyle ForeColor="Blue">
                                                                    </CellStyle>
                                                                    <FooterCellStyle ForeColor="Blue">
                                                                    </FooterCellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <TotalSummary>
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdVendas" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotal" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinal" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrPrecoMedio" SummaryType="Custom" />
                                                            </TotalSummary>
                                                            <FormatConditions>
                                                                <dx:GridViewFormatConditionIconSet FieldName="percAtingimentoMeta" Format="PositiveNegativeTriangles" ShowInColumn="% Ating" />
                                                            </FormatConditions>
                                                            <Styles>
                                                                <Header HorizontalAlign="Center" BackColor="#E1E1E1">
                                                                </Header>
                                                                <AlternatingRow BackColor="#F2F2F2">
                                                                </AlternatingRow>
                                                                <FocusedRow BackColor="Yellow" ForeColor="Black" >
                                                                </FocusedRow>
                                                                <Footer Font-Bold="True">
                                                                </Footer>
                                                            </Styles>

                                                        </dx:ASPxGridView>

                                                        <asp:SqlDataSource ID="Atacarejo_dsVendasDiarias_Tele_Vendas_604" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" 
                                                            SelectCommand="dbo.usp_Buscar_Venda_NF" 
                                                            SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                    <asp:SessionParameter Name="DiaInicial" SessionField="sDIA_INICIAL_ATACAREJO_604" Type="DateTime" />                                                                    
                                                                    <asp:SessionParameter Name="DiaFinal" SessionField="sDIA_FINAL_ATACAREJO_604" Type="DateTime" />      
                                                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL_604" Type="Int16" DefaultValue ="604" />                                                                                                                                 
                                                                </SelectParameters>
                                                        </asp:SqlDataSource>

                                                     
                                								
							                        </div>
						                        </div>
					                        </div>
				                        </div><!-- /.span -->
                                  
                              </div> 

                            <hr />


                              <div class="row Quebra_Pagina_Row">
                
                                        <div class="col-xs-12 col-sm-12">
					                        <div class="widget-box">
						                        <div class="widget-header"><h6 class="widget-title"><span class="fa fa-desktop" ></span> &nbsp; Venda por Departamento - (PDV + Televendas)</h6>

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

                                                         <dx:ASPxGridView ID="Atacarejo_Grid_Vendas_Diarias_Depto_604" runat="server" ClientInstanceName="Atacarejo_Grid_Vendas_Diarias_Depto_604" AutoGenerateColumns="False" DataSourceID="Atacarejo_dsVendasDiarias_Depto_604" EnableTheming="True" Theme="Default" Width="100%" Font-Size="Small">

                                                            <SettingsPager Mode="ShowAllRecords">
                                                            </SettingsPager>
                                                            <Settings HorizontalScrollBarMode="Auto" ShowFooter="True" VerticalScrollableHeight="175" VerticalScrollBarMode="Auto" ShowFilterRow="True" />
                                                            <SettingsBehavior AllowFocusedRow="True" />
                                                             <SettingsResizing ColumnResizeMode="Control" />
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Departamentos" FieldName="nomeDiaSemanaDesc" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="0" Width="150px">
                                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                    <CellStyle Wrap="False">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewBandColumn Caption="Venda Total (PDV + Tele-Vendas)" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta_Venda" ShowInCustomizationForm="True" VisibleIndex="6" Visible="False">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                            <CellStyle ForeColor="#009900">
                                                                            </CellStyle>
                                                                            <FooterCellStyle ForeColor="#009900">
                                                                            </FooterCellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrVenda" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                            <CellStyle ForeColor="Blue">
                                                                            </CellStyle>
                                                                            <FooterCellStyle ForeColor="Blue">
                                                                            </FooterCellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="% Ating" FieldName="percAtingimentoMeta" ShowInCustomizationForm="True" VisibleIndex="7" Width="70px" Visible="False">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Concluido" FieldName="idStatusAtingMeta_100" ToolTip="Indicador se a Meta de Venda foi atingida."  VisibleIndex="8" Visible="False">
                                                                               <Settings AllowAutoFilter="False" />
                                                                               <DataItemTemplate>
                                                                                    <dx:ASPxProgressBar ID="pb" runat="server" Height="21px" OnDataBound="pb_DataBound" Theme="Default"
                                                                                        Value='<%#Eval("idStatusAtingMeta_100")%>' Width="80px" DisplayFormatString=" 0.0" >
                                                                                    </dx:ASPxProgressBar>
                                                                                </DataItemTemplate>                                   
                                    
                                                                               <FooterCellStyle HorizontalAlign="Center">
                                                                               </FooterCellStyle>
                                    
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendas" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Lucro PDV" FieldName="vlrLucroComercial" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="% Marg PDV" FieldName="percMargemPDV" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Lucro Final" FieldName="vlrLucroTotal" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="% Marg Final" FieldName="percMargemFinal" ShowInCustomizationForm="True" VisibleIndex="5" >
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:GridViewBandColumn>
                                                                <dx:GridViewDataTextColumn Caption="Clientes" FieldName="numCliente" ShowInCustomizationForm="True" VisibleIndex="5" Width="70px" Visible="False">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Preço&lt;br&gt;Médio" FieldName="vlrPrecoMedio" ShowInCustomizationForm="True" VisibleIndex="3" Width="70px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Ticket &lt;br&gt; Médio" FieldName="TickeMedio" ShowInCustomizationForm="True" VisibleIndex="6" Visible="False">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:C}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPartVendas" ShowInCustomizationForm="True" ToolTip="Percentual de Participação de cada Departamento em relação a Venda Total" VisibleIndex="2" Width="65px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewBandColumn Caption="Venda Tele-Vendas" ShowInCustomizationForm="True" VisibleIndex="8">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeNF" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrVendaNF" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Lucro Final" FieldName="vlrLucroFinalNF" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="% Marg Final" FieldName="percMargemFinalNF" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:GridViewBandColumn>
                                                                <dx:GridViewBandColumn Caption="Vendas" ShowInCustomizationForm="True" VisibleIndex="11">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde_Liq" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrVenda_Liq" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Lucro Final" FieldName="vlrLucroTotal_Liq" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="% Marg Final" FieldName="percMargemFinalNF_Liq" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:GridViewBandColumn>
                                                            </Columns>
                                                            <TotalSummary>
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdVendas" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta_Venda" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotal" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numCliente" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeNF" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaNF" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroFinalNF" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}%" FieldName="percPartVendas" SummaryType="Sum" />                                                                

                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde_Liq" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda_Liq" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotal_Liq" SummaryType="Sum" />

                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercial" SummaryType="Sum" />

                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingimentoMeta" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinal" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrPrecoMedio" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:C}" FieldName="TickeMedio" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}%" FieldName="idStatusAtingMeta_100" SummaryType="Custom" />                                                                 
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinalNF" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemPDV" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinalNF_Liq" SummaryType="Custom" />
                                                                

                                                            </TotalSummary>
                                                            <FormatConditions>
                                                                <dx:GridViewFormatConditionIconSet FieldName="percAtingimentoMeta" Format="PositiveNegativeTriangles" ShowInColumn="% Ating" />
                                                            </FormatConditions>
                                                            <Styles>
                                                                <Header HorizontalAlign="Center" BackColor="#E1E1E1">
                                                                </Header>
                                                                <AlternatingRow BackColor="#F2F2F2">
                                                                </AlternatingRow>
                                                                <FocusedRow BackColor="Yellow" ForeColor="Black" >
                                                                </FocusedRow>
                                                                <Footer Font-Bold="True">
                                                                </Footer>
                                                            </Styles>

                                                        </dx:ASPxGridView>

                                                        <asp:SqlDataSource ID="Atacarejo_dsVendasDiarias_Depto_604" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" 
                                                            SelectCommand="Atacarejo.usp_Buscar_Vendas_Dia_Departamento" 
                                                            SelectCommandType="StoredProcedure" ProviderName="<%$ ConnectionStrings:DWConnectionString.ProviderName %>">
                                                            <SelectParameters>
                                                                    <asp:SessionParameter Name="DiaInicial" SessionField="sDIA_INICIAL_ATACAREJO_604" Type="DateTime" />                                                                    
                                                                    <asp:SessionParameter Name="DiaFinal" SessionField="sDIA_FINAL_ATACAREJO_604" Type="DateTime" />   
                                                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL_604" Type="Int16" DefaultValue ="604" />                                                                                                                                    
                                                                </SelectParameters>
                                                        </asp:SqlDataSource>

								
                                                       		
							                        </div>
						                        </div>
					                        </div>
				                        </div><!-- /.span -->

                                   </div> 

                                  <div class="row Quebra_Pagina_Row">

                                        <div class="col-xs-12 col-sm-12">
					                        <div class="widget-box">
						                        <div class="widget-header"><h6 class="widget-title"><span class="fa fa-desktop" ></span> &nbsp;Venda por Seção - (PDV + Televendas)</h6>

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
								
                                                         <dx:ASPxGridView ID="Atacarejo_Grid_Vendas_Diarias_Secao_604" runat="server" ClientInstanceName="Atacarejo_Grid_Vendas_Diarias_Secao_604" AutoGenerateColumns="False" DataSourceID="Atacarejo_dsVendasDiarias_Secao_604" EnableTheming="True" Theme="Default" Width="100%" Font-Size="Small">

                                                            <SettingsPager Mode="ShowAllRecords">
                                                            </SettingsPager>
                                                            <Settings HorizontalScrollBarMode="Auto" ShowFooter="True" VerticalScrollableHeight="175" VerticalScrollBarMode="Auto" ShowFilterRow="True" />
                                                            <SettingsBehavior AllowFocusedRow="True" />
                                                             <SettingsResizing ColumnResizeMode="Control" />
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Departamentos" FieldName="nomeDiaSemanaDesc" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="0" Width="150px">
                                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                    <CellStyle Wrap="False">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewBandColumn Caption="Venda Total (PDV + Tele-Vendas)" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta_Venda" ShowInCustomizationForm="True" VisibleIndex="6" Visible="False">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                            <CellStyle ForeColor="#009900">
                                                                            </CellStyle>
                                                                            <FooterCellStyle ForeColor="#009900">
                                                                            </FooterCellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrVenda" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                            <CellStyle ForeColor="Blue">
                                                                            </CellStyle>
                                                                            <FooterCellStyle ForeColor="Blue">
                                                                            </FooterCellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="% Ating" FieldName="percAtingimentoMeta" ShowInCustomizationForm="True" VisibleIndex="7" Width="70px" Visible="False">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Concluido" FieldName="idStatusAtingMeta_100" ToolTip="Indicador se a Meta de Venda foi atingida."  VisibleIndex="8" Visible="False">
                                                                               <Settings AllowAutoFilter="False" />
                                                                               <DataItemTemplate>
                                                                                    <dx:ASPxProgressBar ID="pb" runat="server" Height="21px" OnDataBound="pb_DataBound" Theme="Default"
                                                                                        Value='<%#Eval("idStatusAtingMeta_100")%>' Width="80px" DisplayFormatString=" 0.0" >
                                                                                    </dx:ASPxProgressBar>
                                                                                </DataItemTemplate>                                   
                                    
                                                                               <FooterCellStyle HorizontalAlign="Center">
                                                                               </FooterCellStyle>
                                    
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendas" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Lucro PDV" FieldName="vlrLucroComercial" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="% Marg PDV" FieldName="percMargemPDV" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Lucro Final" FieldName="vlrLucroTotal" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="% Marg Final" FieldName="percMargemFinal" ShowInCustomizationForm="True" VisibleIndex="5" >
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:GridViewBandColumn>
                                                                <dx:GridViewDataTextColumn Caption="Clientes" FieldName="numCliente" ShowInCustomizationForm="True" VisibleIndex="5" Width="70px" Visible="False">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Preço&lt;br&gt;Médio" FieldName="vlrPrecoMedio" ShowInCustomizationForm="True" VisibleIndex="3" Width="70px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Ticket &lt;br&gt; Médio" FieldName="TickeMedio" ShowInCustomizationForm="True" VisibleIndex="6" Visible="False">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:C}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="% Part" FieldName="percPartVendas" ShowInCustomizationForm="True" ToolTip="Percentual de Participação de cada Departamento em relação a Venda Total" VisibleIndex="2" Width="65px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewBandColumn Caption="Venda Tele-Vendas" ShowInCustomizationForm="True" VisibleIndex="8">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeNF" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrVendaNF" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Lucro Final" FieldName="vlrLucroFinalNF" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="% Marg Final" FieldName="percMargemFinalNF" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:GridViewBandColumn>
                                                                <dx:GridViewBandColumn Caption="Vendas" ShowInCustomizationForm="True" VisibleIndex="11">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde_Liq" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrVenda_Liq" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Lucro Final" FieldName="vlrLucroTotal_Liq" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="% Marg Final" FieldName="percMargemFinalNF_Liq" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:GridViewBandColumn>
                                                            </Columns>
                                                            <TotalSummary>
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdVendas" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta_Venda" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotal" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="numCliente" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeNF" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaNF" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroFinalNF" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}%" FieldName="percPartVendas" SummaryType="Sum" />                                                                

                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde_Liq" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda_Liq" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotal_Liq" SummaryType="Sum" />

                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercial" SummaryType="Sum" />

                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAtingimentoMeta" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinal" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrPrecoMedio" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:C}" FieldName="TickeMedio" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}%" FieldName="idStatusAtingMeta_100" SummaryType="Custom" />                                                                 
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinalNF" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemPDV" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinalNF_Liq" SummaryType="Custom" />
                                                                

                                                            </TotalSummary>
                                                            <FormatConditions>
                                                                <dx:GridViewFormatConditionIconSet FieldName="percAtingimentoMeta" Format="PositiveNegativeTriangles" ShowInColumn="% Ating" />
                                                            </FormatConditions>
                                                            <Styles>
                                                                <Header HorizontalAlign="Center" BackColor="#E1E1E1">
                                                                </Header>
                                                                <AlternatingRow BackColor="#F2F2F2">
                                                                </AlternatingRow>
                                                                <FocusedRow BackColor="Yellow" ForeColor="Black" >
                                                                </FocusedRow>
                                                                <Footer Font-Bold="True">
                                                                </Footer>
                                                            </Styles>

                                                        </dx:ASPxGridView>

                                                        <asp:SqlDataSource ID="Atacarejo_dsVendasDiarias_Secao_604" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" 
                                                            SelectCommand="Atacarejo.usp_Buscar_Vendas_Dia_Secao" 
                                                            SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                    <asp:SessionParameter Name="DiaInicial" SessionField="sDIA_INICIAL_ATACAREJO_604" Type="DateTime" />                                                                    
                                                                    <asp:SessionParameter Name="DiaFinal" SessionField="sDIA_FINAL_ATACAREJO_604" Type="DateTime" />    
                                                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL_604" Type="Int16" DefaultValue ="604" />                                                                                                                                      
                                                                </SelectParameters>
                                                        </asp:SqlDataSource>
                                           
                                								
							                        </div>
						                        </div>
					                        </div>
				                        </div><!-- /.span -->
                                                                    
                              </div> 

                                          

                            <hr />

                                 <div class="row Quebra_Pagina_Row">

                                     <div class="col-xs-12 col-sm-12">
					                    <div class="widget-box">
						                    <div class="widget-header"><h6 class="widget-title"><span class="fa fa-desktop" ></span> &nbsp; Venda por Item</h6>
						
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

                                                         <dx:ASPxGridView ID="Atacarejo_Grid_Vendas_Diarias_Item_604" runat="server" ClientInstanceName="Atacarejo_Grid_Vendas_Diarias_Item_604" AutoGenerateColumns="False" DataSourceID="Atacarejo_dsVendasDiarias_Item_604" EnableTheming="True" Theme="Default" Width="100%" Font-Size="Small">

                                                             <SettingsPager PageSize="20">
                                                             </SettingsPager>
                                                            <Settings HorizontalScrollBarMode="Auto" ShowFooter="True" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" ShowFilterRow="True" ShowGroupPanel="True" />
                                                            <SettingsBehavior AllowFocusedRow="True" />
                                                             <SettingsResizing ColumnResizeMode="Control" />
                                                             <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
                                                            <Columns>
                                                                <dx:GridViewBandColumn ShowInCustomizationForm="True" VisibleIndex="0" FixedStyle="Left">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="Produto" FieldName="idProduto" ShowInCustomizationForm="True" VisibleIndex="0" FixedStyle="Left">
                                                                            <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                            <CellStyle HorizontalAlign="Left" Wrap="False">
                                                                            </CellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Descrição do Produto" FieldName="nomeProduto" ShowInCustomizationForm="True" VisibleIndex="1" Width="250px">
                                                                            <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                            <CellStyle Wrap="False">
                                                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                                            </CellStyle>
                                                                            <FooterCellStyle>
                                                                                <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                                            </FooterCellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:GridViewBandColumn>
                                                                <dx:GridViewBandColumn Caption="Venda Total (PDV + Tele-Vendas)" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdePDV" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrVendaPDV" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                            <CellStyle ForeColor="Blue">
                                                                                <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                                                            </CellStyle>
                                                                            <FooterCellStyle ForeColor="Blue">
                                                                            </FooterCellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Lucro Final" FieldName="vlrLucroTotalPDV" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="% Marg Final" FieldName="percMargemFinalPDV" ShowInCustomizationForm="True" VisibleIndex="5">
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
                                                                        <dx:GridViewDataTextColumn Caption="% Marg PDV" FieldName="percMargemComercial" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <CellStyle>
                                                                                <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                                                            </CellStyle>
                                                                            <FooterCellStyle>
                                                                                <BorderRight BorderColor="Gray" BorderStyle="Dashed" BorderWidth="1px" />
                                                                            </FooterCellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Lucro PDV" FieldName="vlrLucroComercial" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:GridViewBandColumn>

                                                                <dx:GridViewBandColumn Caption="Venda Tele-Vendas" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeNF" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrVendaNF" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="True" AutoFilterCondition="GreaterOrEqual" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Lucro Final" FieldName="vlrLucroFinalNF" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="% Marg Final" FieldName="percMargemFinalNF" ShowInCustomizationForm="True" VisibleIndex="3">
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
                                                                <dx:GridViewBandColumn Caption="Venda PDV" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                    <HeaderStyle BackColor="#CCFFCC" />
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="Volume" FieldName="Qtde" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                            <HeaderStyle BackColor="#CCFFCC" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrVenda" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                            <HeaderStyle BackColor="#CCFFCC" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Lucro Final" FieldName="vlrLucroTotal" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                            <HeaderStyle BackColor="#CCFFCC" />
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="% Margem Final" FieldName="percMargemFinal" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <Settings AllowAutoFilter="False" />
                                                                            <HeaderStyle BackColor="#CCFFCC" />
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:GridViewBandColumn>
                                                                <dx:GridViewBandColumn Caption="Mercadológico" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="Departamento" FieldName="Depto" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                            <CellStyle Wrap="False">
                                                                            </CellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Seção" FieldName="Secao" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                            <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                            <CellStyle Wrap="False">
                                                                            </CellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Grupo" FieldName="Grupo" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                            <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                            <CellStyle Wrap="False">
                                                                            </CellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Subgrupo" FieldName="Subgrupo" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                            <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                            <CellStyle Wrap="False">
                                                                            </CellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:GridViewBandColumn>
                                                            </Columns>
                                                            <TotalSummary>
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdePDV" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaPDV" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotalPDV" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinalPDV" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="QtdeNF" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaNF" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroFinalNF" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinalNF" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Qtde" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotal" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemFinal" SummaryType="Custom" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroComercial" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemComercial" SummaryType="Custom" />
                                                            </TotalSummary>
                                                            <FormatConditions>
                                                                <dx:GridViewFormatConditionIconSet FieldName="percAtingimentoMeta" Format="PositiveNegativeTriangles" ShowInColumn="% Ating" />
                                                            </FormatConditions>
                                                            <Styles>
                                                                <Header HorizontalAlign="Center" BackColor="#E1E1E1">
                                                                </Header>
                                                                <AlternatingRow BackColor="#F2F2F2">
                                                                </AlternatingRow>
                                                                <FocusedRow BackColor="Yellow" ForeColor="Black" >
                                                                </FocusedRow>
                                                                <Footer Font-Bold="True">
                                                                </Footer>
                                                            </Styles>

                                                        </dx:ASPxGridView>

                                                        <asp:SqlDataSource ID="Atacarejo_dsVendasDiarias_Item_604" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" 
                                                            SelectCommand="Atacarejo.usp_Buscar_Venda_Item" 
                                                            SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                    <asp:SessionParameter Name="DiaInicial" SessionField="sDIA_INICIAL_ATACAREJO_604" Type="DateTime" />                                                                    
                                                                    <asp:SessionParameter Name="DiaFinal" SessionField="sDIA_FINAL_ATACAREJO_604" Type="DateTime" /> 
                                                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL_604" Type="Int16" DefaultValue ="604" />                                                                                                                                      
                                                                </SelectParameters>
                                                        </asp:SqlDataSource>
                            
                                            
								
							</div>
						</div>
					</div>
				</div><!-- /.span -->

                                                                       
                                </div> 

                            <hr />

                                 <div class="row Quebra_Pagina_Row">

                                     <div class="col-xs-6 col-sm-6">
					                    <div class="widget-box">
						                    <div class="widget-header"><h6 class="widget-title"><span class="fa fa-desktop" ></span> &nbsp; Top 50 Produtos no período - Maior Venda</h6>
						
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

                                                         <dx:ASPxGridView ID="Atacarejo_Grid_Vendas_Diarias_Itens_Mais_Vendidos_604" runat="server" ClientInstanceName="Atacarejo_Grid_Vendas_Diarias_Itens_Mais_Vendidos_604" AutoGenerateColumns="False" DataSourceID="Atacarejo_dsVendasDiarias_ItemMiasVendidos_604" EnableTheming="True" Theme="Default" Width="100%" Font-Size="Small">

                                                             <SettingsPager PageSize="20" Mode="ShowAllRecords">
                                                             </SettingsPager>
                                                            <Settings HorizontalScrollBarMode="Auto" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" ShowFilterRow="True" />
                                                            <SettingsBehavior AllowFocusedRow="True" />
                                                             <SettingsResizing ColumnResizeMode="Control" />
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendas" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrVenda" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                    <CellStyle ForeColor="Blue">
                                                                    </CellStyle>
                                                                    <FooterCellStyle ForeColor="Blue">
                                                                    </FooterCellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Lucro Final" FieldName="vlrLucroTotal" ShowInCustomizationForm="True" VisibleIndex="5">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="% Marg Final" FieldName="percMargemFinal" ShowInCustomizationForm="True" VisibleIndex="6">
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
                                                                <dx:GridViewDataTextColumn Caption="Produto" FieldName="idProduto" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                    <CellStyle HorizontalAlign="Left" Wrap="False">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Descrição do Produto" FieldName="nomeProduto" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="2" Width="250px">
                                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                    <CellStyle Wrap="False">
                                                                    </CellStyle>
                                                                    <FooterCellStyle>
                                                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                                    </FooterCellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Rnk" FieldName="Ranking" FixedStyle="Left" ShowInCustomizationForm="True" ToolTip="Ranking" VisibleIndex="0" Width="50px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <FormatConditions>
                                                                <dx:GridViewFormatConditionIconSet FieldName="percAtingimentoMeta" Format="PositiveNegativeTriangles" ShowInColumn="% Ating" />
                                                            </FormatConditions>
                                                            <Styles>
                                                                <Header HorizontalAlign="Center" BackColor="#E1E1E1">
                                                                </Header>
                                                                <AlternatingRow BackColor="#F2F2F2">
                                                                </AlternatingRow>
                                                                <FocusedRow BackColor="Yellow" ForeColor="Black" >
                                                                </FocusedRow>
                                                                <Footer Font-Bold="True">
                                                                </Footer>
                                                            </Styles>

                                                        </dx:ASPxGridView>

                                                        <asp:SqlDataSource ID="Atacarejo_dsVendasDiarias_ItemMiasVendidos_604" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" 
                                                            SelectCommand="Atacarejo.usp_TOP_50_Vendas" 
                                                            SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                    <asp:SessionParameter Name="DiaInicial" SessionField="sDIA_INICIAL_ATACAREJO_604" Type="DateTime" />                                                                    
                                                                    <asp:SessionParameter Name="DiaFinal" SessionField="sDIA_FINAL_ATACAREJO_604" Type="DateTime" /> 
                                                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL_604" Type="Int16" DefaultValue ="604" />                                                                                                                                       
                                                                </SelectParameters>
                                                        </asp:SqlDataSource>
                            
                                            
								
							</div>
						</div>
					</div>
				</div><!-- /.span -->


                                     <div class="col-xs-6 col-sm-6">
					                    <div class="widget-box">
						                    <div class="widget-header"><h6 class="widget-title"><span class="fa fa-desktop" ></span> &nbsp; Top 50 Produtos no período - Menor Lucro </h6>
						
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

                                                         <dx:ASPxGridView ID="Atacarejo_Grid_Vendas_Diarias_Itens_Mais_Lucratividade_604" runat="server" ClientInstanceName="Atacarejo_Grid_Vendas_Diarias_Itens_Mais_Lucratividade_604" AutoGenerateColumns="False" DataSourceID="Atacarejo_ds_Vendas_Diarias_Itens_Mais_Lucratividade_604" EnableTheming="True" Theme="Default" Width="100%" Font-Size="Small">

                                                             <SettingsPager PageSize="20" Mode="ShowAllRecords">
                                                             </SettingsPager>
                                                            <Settings HorizontalScrollBarMode="Auto" VerticalScrollableHeight="400" VerticalScrollBarMode="Auto" ShowFilterRow="True" />
                                                            <SettingsBehavior AllowFocusedRow="True" />
                                                             <SettingsResizing ColumnResizeMode="Control" />
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdVendas" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrVenda" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                   
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Lucro Final" FieldName="vlrLucroTotal" ShowInCustomizationForm="True" VisibleIndex="5">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                     <CellStyle ForeColor="Blue">
                                                                    </CellStyle>
                                                                    <FooterCellStyle ForeColor="Blue">
                                                                    </FooterCellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="% Marg Final" FieldName="percMargemFinal" ShowInCustomizationForm="True" VisibleIndex="6">
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
                                                                <dx:GridViewDataTextColumn Caption="Produto" FieldName="idProduto" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                    <CellStyle HorizontalAlign="Left" Wrap="False">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Descrição do Produto" FieldName="nomeProduto" FixedStyle="Left" ShowInCustomizationForm="True" VisibleIndex="2" Width="250px">
                                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                    <CellStyle Wrap="False">
                                                                    </CellStyle>
                                                                    <FooterCellStyle>
                                                                        <BorderRight BorderColor="Gray" BorderStyle="Solid" BorderWidth="2px" />
                                                                    </FooterCellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Rnk" FieldName="Ranking" FixedStyle="Left" ShowInCustomizationForm="True" ToolTip="Ranking" VisibleIndex="0" Width="50px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <FormatConditions>
                                                                <dx:GridViewFormatConditionIconSet FieldName="percAtingimentoMeta" Format="PositiveNegativeTriangles" ShowInColumn="% Ating" />
                                                            </FormatConditions>
                                                            <Styles>
                                                                <Header HorizontalAlign="Center" BackColor="#E1E1E1">
                                                                </Header>
                                                                <AlternatingRow BackColor="#F2F2F2">
                                                                </AlternatingRow>
                                                                <FocusedRow BackColor="Yellow" ForeColor="Black" >
                                                                </FocusedRow>
                                                                <Footer Font-Bold="True">
                                                                </Footer>
                                                            </Styles>

                                                        </dx:ASPxGridView>

                                                        <asp:SqlDataSource ID="Atacarejo_ds_Vendas_Diarias_Itens_Mais_Lucratividade_604" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" 
                                                            SelectCommand="Atacarejo.usp_TOP_50_Lucratividade" 
                                                            SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                    <asp:SessionParameter Name="DiaInicial" SessionField="sDIA_INICIAL_ATACAREJO_604" Type="DateTime" />                                                                    
                                                                    <asp:SessionParameter Name="DiaFinal" SessionField="sDIA_FINAL_ATACAREJO_604" Type="DateTime" />   
                                                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL_604" Type="Int16" DefaultValue ="604" />                                                                                                                                     
                                                                </SelectParameters>
                                                        </asp:SqlDataSource>
                            
                                            
								
							</div>
						</div>
					</div>
				</div><!-- /.span -->


                                                                       
                                </div> 



                        </div> 

                        </dx:PanelContent>
            </PanelCollection>

        </dx:ASPxCallbackPanel>   

                    </dx:ContentControl>
                </ContentCollection>

            </dx:TabPage>


        </TabPages>
    </dx:ASPxPageControl>

    




                       
<%-------------------------------------------------------------------------------------------------------------------------------------------------------%>

        

            
        
<%------------------------------------------------------------------------------------------------------------------------------------------------------%>


        <asp:Label ID="lblError" runat="server" Text="Label"  ForeColor="Red" Visible="False"></asp:Label>
        <asp:Label ID="lblOBS" runat="server" Text=""></asp:Label>

               


       

<%------------------------------------------------------------------------------------------------------------------------------------------------------------%>

 

    <script src="../Scripts/jquery-2.2.3.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>   
    <script src="../plugins/fastclick/fastclick.min.js"></script>   
    <script src="../dist/js/app.min.js"></script>
    <script src="../plugins/sparkline/jquery.sparkline.min.js"></script>

    <script src="../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
    <script src="../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
    <script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>

    
    <script src="../dist/js/pages/dashboard2.js"></script>
    <script src="../dist/js/demo.js"></script>


        <script src="../assets/js/jquery-ui.custom.min.js"></script>
		<script src="../assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="../assets/js/chosen.jquery.min.js"></script>
		<script src="../assets/js/spinbox.min.js"></script>
		<script src="../assets/js/bootstrap-datepicker.min.js"></script>
		<script src="../assets/js/bootstrap-timepicker.min.js"></script>
		<script src="../assets/js/moment.min.js"></script>
		<script src="../assets/js/daterangepicker.min.js"></script>
		<script src="../assets/js/bootstrap-datetimepicker.min.js"></script>
		<script src="../assets/js/bootstrap-colorpicker.min.js"></script>
		<script src="../assets/js/jquery.knob.min.js"></script>
		<script src="../assets/js/autosize.min.js"></script>
		<script src="../assets/js/jquery.inputlimiter.min.js"></script>
		<script src="../assets/js/jquery.maskedinput.min.js"></script>
		<script src="../assets/js/bootstrap-tag.min.js"></script>

		<!-- ace scripts -->
		<script src="../assets/js/ace-elements.min.js"></script>
		<script src="../assets/js/ace.min.js"></script>


</asp:Content>

