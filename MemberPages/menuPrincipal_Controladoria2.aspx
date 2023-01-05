<%@ Page Title="Menu Principal" Trace="false"  Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="menuPrincipal_Controladoria2.aspx.vb" Inherits="MemberPages_menuPrincipal_Controladoria2" %>

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


<%@ Register src="../Controles/wuc_KPI_Secao_Depto.ascx" tagname="wuc_KPI_Secao_Depto" tagprefix="uc2" %>
<%@ Register Src="~/Controles/wucListaDiaIniFin.ascx" TagPrefix="uc1" TagName="wucListaDiaIniFin" %>



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

        .rndSemana {
            float: left ;
        }



    </style>

    <script type="text/javascript"> 
       
        function OnGridFocusedRowChanged() {
            // Query the server for the "EmployeeID" and "Notes" fields from the focused row
            // The values will be returned to the OnGetRowValues() function            
            // grid_Top5_LucroPDV.GetRowValues(grid_Top5_LucroPDV.GetFocusedRowIndex(), 'idFilial;FilialDesc', OnGetRowValues);
        }

        function OnGetRowValues(values) {
                txtFilial.SetText(values[0]);
        }

        function Update_gridTodosItensNegativosLoja_Grid(s, e) {
            gridTodosItensNegativosLoja.PerformCallback();
        }

        function Update_gridItemLoja_a_Loja_Grid(s, e) {
            gridItemLoja_a_Loja.PerformCallback();
        }
       
    </script>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

        <dx:ASPxTimer ID="ASPxTimer1" runat="server" Interval="60000">
            <ClientSideEvents Tick="function(s, e) {  
        cbPanel.PerformCallback();  
    }" />  
        </dx:ASPxTimer>  

   
           
     

    <dx:ASPxPageControl ID="TabControl" runat="server" Width="100%" ActiveTabIndex="1" EnableHierarchyRecreation="True" Theme="SoftOrange" >
        <TabPages>

            <dx:TabPage Text="Vendas">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl1" runat="server">

                        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis"  Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
                            <Images>
                                <LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
                            </Images>

                             <LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>

                <PanelCollection>
                    <dx:PanelContent> 

                        <div class="container-fluid">                             


                              <div class="row Quebra_Pagina_Row">

                                  
                                            

                
                                        <div class="col-xs-12 col-sm-3">
					                        <div class="widget-box">
						                        <div class="widget-header"><h6 class="widget-title"><span class="fa fa-desktop" ></span> &nbsp; Menor Margem PDV - <asp:Label ID="lbl_2_1" runat="server"></asp:Label></h6>

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

                                                        <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="100%" ClientInstanceName="cbPanel">
                                                            <PanelCollection>
                                                                <dx:PanelContent runat ="server" SupportsDisabledAttributes="both">

                                                                

                                                        <dx:ASPxDateEdit ID="cboDia" runat="server" Theme="Mulberry" Width="130px" HorizontalAlign="Center"  >
                                                            <ClientSideEvents DateChanged="function(s, e) {
grid_Top5_LucroPDV.Refresh(); cbPanelDia.PerformCallback()	
}" />
                                                        </dx:ASPxDateEdit>
								
                                                        <dx:ASPxGridView ID="grid_Top5_LucroPDV" runat="server" ClientInstanceName="grid_Top5_LucroPDV" AutoGenerateColumns="False" DataSourceID="ds_Dashboard_Top5_LucroPDV" EnableTheming="True" Theme="PlasticBlue" Width="100%" KeyFieldName="idFilial">
                                                            <ClientSideEvents FocusedRowChanged="function(s, e) { 
OnGridFocusedRowChanged();
Update_gridTodosItensNegativosLoja_Grid();
 }" />
                                                            <SettingsPager Mode="ShowAllRecords">
                                                            </SettingsPager>
                                                            <Settings VerticalScrollBarMode="Visible" VerticalScrollableHeight="290" />
                                                            <SettingsBehavior AllowFocusedRow="True" />
                                                            <SettingsResizing ColumnResizeMode="Control" />
                                                            <SettingsText Title="Projeção Venda Hoje" />
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Filial" FieldName="FilialDesc" ShowInCustomizationForm="True" VisibleIndex="1" Width="125px">
                                                                    <CellStyle Wrap="False">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="R$ Lucro PDV" FieldName="vlrLucroComercial" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="% Marg PDV" FieldName="percPDV" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" >
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="% Marg Final" FieldName="percFinal" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4"  SortIndex="0" SortOrder="Ascending">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="ID" FieldName="idFilial" ShowInCustomizationForm="True" VisibleIndex="0" Visible="False">
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <FormatConditions>
                                                                <dx:GridViewFormatConditionIconSet FieldName="percCresc" Format="PositiveNegativeTriangles" />
                                                            </FormatConditions>
                                                            <Styles>
                                                                <Header Font-Bold="False" Font-Size="Small">
                                                                </Header>
                                                                <AlternatingRow BackColor="#EAEAEA">
                                                                </AlternatingRow>
                                                                <FocusedRow BackColor="Yellow" ForeColor="Blue">
                                                                </FocusedRow>
                                                                <Cell Font-Size="Small">
                                                                </Cell>
                                                            </Styles>
                                                        </dx:ASPxGridView>        
                                                        <asp:SqlDataSource ID="ds_Dashboard_Top5_LucroPDV" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="Dashboard.usp_Buscar_Top5_LucroPDV_Dia" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="cboDia" Name="DiaHoje" DbType="Date"   />
                                                              
                                                            </SelectParameters>
                                                            
                                                        </asp:SqlDataSource>

                                                        </dx:PanelContent>
                                                            </PanelCollection>

                                                        </dx:ASPxCallbackPanel>
                                								
							                        </div>
						                        </div>
					                        </div>
				                        </div><!-- /.span -->

                                        <div class="col-xs-12 col-sm-5">
					                        <div class="widget-box">
						                        <div class="widget-header"><h6 class="widget-title"><span class="fa fa-desktop" ></span> &nbsp;Todos Produtos Com Margem Negativa da Loja - <asp:Label ID="lbl_3_1" runat="server"></asp:Label></h6>

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

                                             <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" Width="100%" ClientInstanceName="cbPanel">
                                                            <PanelCollection>
                                                                <dx:PanelContent ID="PanelContent1" runat ="server" SupportsDisabledAttributes="both">

                                                                    <dx:ASPxGridView ID="gridTodosItensNegativosLoja" runat="server" AutoGenerateColumns="False" ClientInstanceName="gridTodosItensNegativosLoja"                       
                                                                        DataSourceID="dsTodosItensNegativosLoja" Width="100%" Font-Size="Medium" 
                                                                        KeyFieldName="idProduto" Theme="PlasticBlue" EnableTheming="True">
                                                                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                                                        <Styles>                             
                                                                            <Header ImageSpacing="5px" SortingImageSpacing="5px" Font-Size="Small" HorizontalAlign="Center"></Header>
                                                                            <FocusedRow BackColor="Yellow" ForeColor="#0066FF"> </FocusedRow>
                                                                            <AlternatingRow BackColor="#EAEAEA"></AlternatingRow>
                                                                            <FilterRow Font-Size="Small">
                                                                            </FilterRow>
                                                                            <Cell Font-Size="Small">
                                                                            </Cell>
                                                                            <GroupPanel Font-Size="Medium">
                                                                            </GroupPanel>
                                                                            <FilterCell Font-Size="Small">
                                                                            </FilterCell>
                                                                            <TitlePanel Font-Bold="True" Font-Size="Larger">
                                                                            </TitlePanel>
                                                                            <FilterBar Font-Size="Small">
                                                                            </FilterBar>
                                                                        </Styles>
                                                                        <GroupSummary>
                                                                            <dx:ASPxSummaryItem DisplayFormat="Itens c/ margem negativa {0:n0}" 
                                                                                FieldName="CodProduto" SummaryType="Count" />
                                                                        </GroupSummary>
                                                                        <Images >
                                                                            <FilterRowButton Height="13px" Width="13px" />
                                                                        </Images>
                                                                        <SettingsText Title="Consulta itens com margem negativa - por Filial" 
                                                                            GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
                                                                        <Columns>
                                                                            <dx:GridViewDataTextColumn FieldName="idProduto" VisibleIndex="0" 
                                                                                Caption="Produto" Width="80px">
                                                                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn FieldName="percSellOut" VisibleIndex="6" 
                                                                                Caption="% Mrg Final" SortIndex="0" SortOrder="Ascending">
                                                                                <Settings AllowAutoFilter="False" />
                                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                                </PropertiesTextEdit>
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn FieldName="percPDV" VisibleIndex="5" 
                                                                                Caption="% Mrg PDV">
                                                                                <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                                </PropertiesTextEdit>
                                                                                <Settings AllowAutoFilter="False" />
                                                                                <HeaderStyle HorizontalAlign="Center" />
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn FieldName="nomeProduto" ReadOnly="True" 
                                                                                VisibleIndex="1" Caption="Nome do Produto" Width="250px">
                                                                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                                <CellStyle Wrap="False">
                                                                                </CellStyle>
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn Caption="Lucro PDV" FieldName="vlrLucroComercial" ShowInCustomizationForm="True" VisibleIndex="4" Width="90px">
                                                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                                </PropertiesTextEdit>
                                                                                <Settings AllowAutoFilter="False" />
                                                                            </dx:GridViewDataTextColumn>
                                                                            <dx:GridViewDataTextColumn FieldName="Qtde" ShowInCustomizationForm="True" VisibleIndex="3" Width="60px">
                                                                                <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                                </PropertiesTextEdit>
                                                                                <Settings AllowAutoFilter="False" />
                                                                            </dx:GridViewDataTextColumn>
                                                                        </Columns>
                                                                                                        <ClientSideEvents FocusedRowChanged="function(s, e) {
   Update_gridItemLoja_a_Loja_Grid();
}" />
                                                                                                        <SettingsPager PageSize="14">
                                                                                                            <Summary AllPagesText="Páginas: {0} - {1} ({2} produtoss)" Text="Paginá {0} of {1} ({2} produtos)" />
                                                                                                            <PageSizeItemSettings Caption="Tamanho da Página:">
                                                                                                            </PageSizeItemSettings>
                                                                                                        </SettingsPager>
                                                                        <Settings ShowVerticalScrollBar="True" ShowFilterRow="True" VerticalScrollableHeight="255" />
                                                                        <StylesEditors>
                                                                            <ProgressBar Height="25px">
                                                                            </ProgressBar>
                                                                        </StylesEditors>
                                                                    </dx:ASPxGridView>

                                                                     <asp:SqlDataSource ID="dsTodosItensNegativosLoja" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" 
                                                                        SelectCommand="Dashboard.usp_Buscar_Itens_Com_Margem_Negativa_Dia_Filial"  SelectCommandType="StoredProcedure">
                                                                         <SelectParameters>
                                                                                <asp:SessionParameter SessionField="sDIA" Name="DiaHoje" DbType="Date"   />                                                                              
                                                                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL_1" DbType="Int16"  />
                                                                            </SelectParameters>
                                                                        </asp:SqlDataSource>
                                                                    								

                                                                    </dx:PanelContent>
                                                            </PanelCollection>

                                                        </dx:ASPxCallbackPanel>

                                								
							                        </div>
						                        </div>
					                        </div>
				                        </div><!-- /.span -->

                                        <div class="col-xs-12 col-sm-4">
					                        <div class="widget-box">
						                        <div class="widget-header"><h6 class="widget-title"><span class="fa fa-desktop" ></span> &nbsp; Item Loja a Loja</h6>

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

                                                        <dx:ASPxCallbackPanel ID="ASPxCallbackPanel4" runat="server" Width="100%" ClientInstanceName="cbPanelItemLoja_a_Loja">
                                                            <PanelCollection>
                                                                <dx:PanelContent ID="PanelContent4" runat ="server" SupportsDisabledAttributes="both">

                                                         <dx:ASPxGridView ID="gridItemLoja_a_Loja" runat="server" ClientInstanceName="gridItemLoja_a_Loja" AutoGenerateColumns="False" DataSourceID="ds_ItemLoja_a_Loja" EnableTheming="True" Theme="PlasticBlue" Width="100%" KeyFieldName="idFilial">
                                                            <ClientSideEvents FocusedRowChanged="function(s, e) { 
 }" />
                                                            <SettingsPager Mode="ShowAllRecords">
                                                            </SettingsPager>
                                                            <Settings VerticalScrollBarMode="Visible" VerticalScrollableHeight="290" />
                                                            <SettingsBehavior AllowFocusedRow="True" />
                                                            <SettingsResizing ColumnResizeMode="Control" />
                                                            <SettingsText Title="Projeção Venda Hoje" />
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Filial" FieldName="FilialDesc" ShowInCustomizationForm="True" VisibleIndex="1" Width="160px">
                                                                    <CellStyle Wrap="False">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Lucro PDV" FieldName="vlrLucroComercial" ShowInCustomizationForm="True" VisibleIndex="3" Width="80px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="% Marg PDV" FieldName="percPDV" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4" >
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="% Marg Final" FieldName="percSellOut" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5"  SortIndex="0" SortOrder="Ascending">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="ID" FieldName="idFilial" ShowInCustomizationForm="True" VisibleIndex="0" Visible="False">
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="Qtde" ShowInCustomizationForm="True" VisibleIndex="2" Width="60px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <FormatConditions>
                                                                <dx:GridViewFormatConditionIconSet FieldName="percCresc" Format="PositiveNegativeTriangles" />
                                                            </FormatConditions>
                                                            <Styles>
                                                                <Header Font-Bold="False" Font-Size="Small">
                                                                </Header>
                                                                <AlternatingRow BackColor="#EAEAEA">
                                                                </AlternatingRow>
                                                                <FocusedRow BackColor="Yellow" ForeColor="Blue">
                                                                </FocusedRow>
                                                                <Cell Font-Size="Small">
                                                                </Cell>
                                                            </Styles>
                                                        </dx:ASPxGridView>        
                                                        <asp:SqlDataSource ID="ds_ItemLoja_a_Loja" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="Dashboard.usp_Buscar_Itens_Com_Margem_Negativa_Dia_Produto_Lojas" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:SessionParameter SessionField="sDIA" Name="DiaHoje" DbType="Date"   />
                                                               <asp:SessionParameter SessionField="sPRODUTO" Name="idProduto" DbType="Int32"   />
                                                            </SelectParameters>
                                                            
                                                        </asp:SqlDataSource>		
                                                        
                                                      			</dx:PanelContent>
                                                            </PanelCollection>

                                                        </dx:ASPxCallbackPanel>
                                								
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


       
        <asp:Label ID="lblOBS" runat="server" Text=""></asp:Label>

               

    <dx:ASPxCallbackPanel ID="cbPanelDia" runat="server" Width="200px" ClientInstanceName="cbPanelDia">
        <PanelCollection>
            <dx:PanelContent>

                 <asp:Label ID="lblError" runat="server" Text="Label"  ForeColor="Red" Visible="False"></asp:Label>

            </dx:PanelContent>
        </PanelCollection>
    </dx:ASPxCallbackPanel>
       

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

