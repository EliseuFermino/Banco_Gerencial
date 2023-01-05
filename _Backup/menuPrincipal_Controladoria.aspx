<%@ Page Title="Menu Principal" Trace="false"  Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="menuPrincipal_Controladoria.aspx.vb" Inherits="MemberPages_menuPrincipal_Controladoria" %>

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


    </style>
       
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

        <dx:ASPxTimer ID="ASPxTimer1" runat="server" Interval="60000">
            <ClientSideEvents Tick="function(s, e) {  
        cbPanel.PerformCallback();  
    }" />  
        </dx:ASPxTimer>  

   
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis"  Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
            <Images>
                <LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
            </Images>

            <LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
                <PanelCollection>
                    <dx:PanelContent>    
     

    <dx:ASPxPageControl ID="TabControl" runat="server" Width="100%" ActiveTabIndex="0" EnableHierarchyRecreation="True" Theme="SoftOrange" >
        <TabPages>

            <dx:TabPage Text="Vendas">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl1" runat="server">

                        <div class="container-fluid">

                              <div class="row Quebra_Pagina_Row">
                
                                        <div class="col-xs-12 col-sm-6">
					                        <div class="widget-box">
						                        <div class="widget-header"><h6 class="widget-title"><span class="fa fa-desktop" ></span> &nbsp; Projeção de Vendas</h6>

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
								
                                                        <dx:ASPxGridView ID="gridProjecao" runat="server" AutoGenerateColumns="False" DataSourceID="dsProjecao" EnableTheming="True" Theme="Mulberry" Width="100%" Font-Size="Large">
                                                            <SettingsBehavior AllowFocusedRow="True" />
                                                            <SettingsText Title="Projeção Venda Hoje" />
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Projeção Venda" FieldName="vlrProjecao" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="Blue">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Crescim. AA" FieldName="percCresc" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Ating. Meta" FieldName="percMeta" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Período" FieldName="myDesc" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                    <CellStyle HorizontalAlign="Left" Wrap="False">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="#009900">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <FormatConditions>
                                                                <dx:GridViewFormatConditionIconSet FieldName="percCresc" Format="PositiveNegativeArrowsColored" />
                                                                <dx:GridViewFormatConditionIconSet FieldName="percMeta" Format="PositiveNegativeTriangles" />
                                                            </FormatConditions>
                                                            <Styles>
                                                                <Header Font-Bold="False" BackColor="#009900" ForeColor="White" Font-Size="Small">
                                                                </Header>
                                                                <AlternatingRow BackColor="#EAEAEA">
                                                                </AlternatingRow>
                                                                <FocusedRow BackColor="Yellow" ForeColor="Blue">
                                                                </FocusedRow>
                                                                <Cell Font-Size="15px" HorizontalAlign="Center">
                                                                </Cell>
                                                            </Styles>
                                                        </dx:ASPxGridView>        
                                                        <asp:SqlDataSource ID="dsProjecao" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="Dashboard.usp_Buscar_Projecao_Vendas_Diarias" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                								
							                        </div>
						                        </div>
					                        </div>
				                        </div><!-- /.span -->

                                        <div class="col-xs-12 col-sm-3">
					                        <div class="widget-box">
						                        <div class="widget-header"><h6 class="widget-title"><span class="fa fa-desktop" ></span> &nbsp; Margem Final de Hoje</h6>

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
							                        <div class="widget-main" style="text-align:left">
								
                                                        <dx:ASPxGaugeControl ID="gauge_Margem_PDV" runat="server" Height="200px" Width="350px" LayoutInterval="6" Value="1" AutoLayout="False">
                                                            <Gauges>
                                                                <dx:CircularGauge Bounds="0, 0, 360, 200" Name="circularGauge13">
                                                                    <scales>
                                                                        <dx:ArcScaleComponent AcceptOrder="0" AppearanceMajorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMajorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceTickmarkText-Font="Tahoma, 10pt" AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#999999&quot;/&gt;" Center="125, 159" EndAngle="0" MajorTickCount="15" MajorTickmark-AllowTickOverlap="True" MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-2" MajorTickmark-ShapeType="Circular_Style27_1" MajorTickmark-TextOffset="18" MajorTickmark-TextOrientation="LeftToRight" MaxValue="20" MinorTickCount="4" MinorTickmark-ShapeOffset="4" MinorTickmark-ShapeType="Circular_Style27_1" MinorTickmark-ShowTick="False" MinValue="5" Name="scale1" RadiusX="101" RadiusY="101" StartAngle="-180" Value="1">
                                                                            <ranges>
                                                                                <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Red&quot;/&gt;" EndThickness="22" EndValue="10" Name="Range0" ShapeOffset="-4" StartThickness="22" StartValue="5" />
                                                                                <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Yellow&quot;/&gt;" EndThickness="22" EndValue="15" Name="Range1" ShapeOffset="-4" StartThickness="22" StartValue="10" />
                                                                                <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Green&quot;/&gt;" EndThickness="22" EndValue="20" Name="rngMeta" ShapeOffset="-4" StartThickness="22" StartValue="15" />
                                                                            </ranges>
                                                                        </dx:ArcScaleComponent>
                                                                    </scales>
                                                                    <backgroundlayers>
                                                                        <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" Name="bg" ScaleCenterPos="0.5, 0.99" ScaleID="scale1" ShapeType="CircularHalf_Style27" Size="200, 102" ZOrder="1000" />
                                                                    </backgroundlayers>
                                                                    <needles>
                                                                        <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" EndOffset="8" Name="needle" ScaleID="scale1" ShapeType="CircularFull_Style27" StartOffset="-6" ZOrder="-50" />
                                                                    </needles>
                                                                </dx:CircularGauge>
                                                            </Gauges>
                        <LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                                        </dx:ASPxGaugeControl>
                                								
							                        </div>
						                        </div>
					                        </div>
				                        </div><!-- /.span -->

                                        <div class="col-xs-12 col-sm-3">
					                        <div class="widget-box">
						                        <div class="widget-header"><h6 class="widget-title"><span class="fa fa-desktop" ></span> &nbsp; Margem Final Mensal Acumulada</h6>

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
								
                                                        <dx:ASPxGaugeControl ID="gauge_Margem_Final" runat="server" Height="200px" Width="350px" LayoutInterval="6" Value="1" AutoLayout="False">
                                                            <Gauges>
                                                                <dx:CircularGauge Bounds="0, 0, 360, 200" Name="circularGauge13">
                                                                    <scales>
                                                                        <dx:ArcScaleComponent AcceptOrder="0" AppearanceMajorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMajorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceTickmarkText-Font="Tahoma, 10pt" AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#999999&quot;/&gt;" Center="125, 159" EndAngle="0" MajorTickCount="15" MajorTickmark-AllowTickOverlap="True" MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-2" MajorTickmark-ShapeType="Circular_Style27_1" MajorTickmark-TextOffset="18" MajorTickmark-TextOrientation="LeftToRight" MaxValue="20" MinorTickCount="4" MinorTickmark-ShapeOffset="4" MinorTickmark-ShapeType="Circular_Style27_1" MinorTickmark-ShowTick="False" MinValue="5" Name="scale1" RadiusX="101" RadiusY="101" StartAngle="-180" Value="1">
                                                                            <ranges>
                                                                                <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Red&quot;/&gt;" EndThickness="22" EndValue="10" Name="Range0" ShapeOffset="-4" StartThickness="22" StartValue="5" />
                                                                                <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Yellow&quot;/&gt;" EndThickness="22" EndValue="15" Name="Range1" ShapeOffset="-4" StartThickness="22" StartValue="10" />
                                                                                <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Green&quot;/&gt;" EndThickness="22" EndValue="20" Name="rngMeta" ShapeOffset="-4" StartThickness="22" StartValue="15" />
                                                                            </ranges>
                                                                        </dx:ArcScaleComponent>
                                                                    </scales>
                                                                    <backgroundlayers>
                                                                        <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" Name="bg" ScaleCenterPos="0.5, 0.99" ScaleID="scale1" ShapeType="CircularHalf_Style27" Size="200, 102" ZOrder="1000" />
                                                                    </backgroundlayers>
                                                                    <needles>
                                                                        <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" EndOffset="8" Name="needle" ScaleID="scale1" ShapeType="CircularFull_Style27" StartOffset="-6" ZOrder="-50" />
                                                                    </needles>
                                                                </dx:CircularGauge>
                                                            </Gauges>
                        <LayoutPadding All="0" Left="0" Top="0" Right="0" Bottom="0"></LayoutPadding>
                                                        </dx:ASPxGaugeControl>
                                								
							                        </div>
						                        </div>
					                        </div>
				                        </div><!-- /.span -->


                              </div> 

                            <hr />

                              <div class="row Quebra_Pagina_Row">
                
                                        <div class="col-xs-12 col-sm-4">
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
								
                                                        <dx:ASPxGridView ID="grid_Top5_LucroPDV" runat="server" AutoGenerateColumns="False" DataSourceID="ds_Dashboard_Top5_LucroPDV" EnableTheming="True" Theme="PlasticBlue" Width="100%">
                                                            <SettingsPager Mode="ShowAllRecords">
                                                            </SettingsPager>
                                                            <Settings VerticalScrollBarMode="Visible" />
                                                            <SettingsBehavior AllowFocusedRow="True" />
                                                            <SettingsResizing ColumnResizeMode="Control" />
                                                            <SettingsText Title="Projeção Venda Hoje" />
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Filial" FieldName="FilialDesc" ShowInCustomizationForm="True" VisibleIndex="0" Width="200px">
                                                                    <CellStyle Wrap="False">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="R$ Lucro PDV" FieldName="vlrLucroComercial" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="% Marg PDV" FieldName="percPDV" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" SortIndex="0" SortOrder="Ascending">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="% Marg Final" FieldName="percFinal" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
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
                                                        <asp:SqlDataSource ID="ds_Dashboard_Top5_LucroPDV" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="Dashboard.usp_Buscar_Top5_LucroPDV" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
                                								
							                        </div>
						                        </div>
					                        </div>
				                        </div><!-- /.span -->

                                        <div class="col-xs-12 col-sm-8">
					                        <div class="widget-box">
						                        <div class="widget-header"><h6 class="widget-title"><span class="fa fa-desktop" ></span> &nbsp;Produtos Com Margem Negativa - <asp:Label ID="lbl_3_1" runat="server"></asp:Label></h6>

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
								
                                             <dx:ASPxGridView ID="gridItem" runat="server" AutoGenerateColumns="False"                       
                                                DataSourceID="dsItem" Width="100%" Font-Size="Medium" 
                                                KeyFieldName="CodProduto" Theme="PlasticBlue" EnableTheming="True">
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
                                                    <dx:GridViewDataTextColumn FieldName="FilialDesc" VisibleIndex="0" 
                                                        Caption="Filial">
                                                        <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                        <CellStyle Wrap="False">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="idProduto" VisibleIndex="1" 
                                                        Caption="Produto" Width="80px">
                                                        <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn FieldName="percSellOut" VisibleIndex="6" 
                                                        Caption="% Mrg Final">
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
                                                        VisibleIndex="2" Caption="Nome do Produto">
                                                        <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                        <CellStyle Wrap="False">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="R$ Lucro PDV" FieldName="vlrLucroComercial" ShowInCustomizationForm="True" VisibleIndex="4">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                                                <SettingsPager PageSize="14" Mode="ShowAllRecords">
                                                                                    <Summary AllPagesText="Páginas: {0} - {1} ({2} produtoss)" Text="Paginá {0} of {1} ({2} produtos)" />
                                                                                    <PageSizeItemSettings Caption="Tamanho da Página:">
                                                                                    </PageSizeItemSettings>
                                                                                </SettingsPager>
                                                <Settings ShowVerticalScrollBar="True" ShowFilterRow="True" />
                                                <StylesEditors>
                                                    <ProgressBar Height="25px">
                                                    </ProgressBar>
                                                </StylesEditors>
                                            </dx:ASPxGridView>

                                                        <asp:SqlDataSource ID="dsItem" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" 
                                                SelectCommand="Dashboard.usp_Buscar_Itens_Com_Margem_Negativa"  SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                            
                                                </SelectParameters>
                                            </asp:SqlDataSource>

                                								
							                        </div>
						                        </div>
					                        </div>
				                        </div><!-- /.span -->
                                  
                              </div> 


                            <hr />
                        
                              <div class="row Quebra_Pagina_Row">
                
                                        <div class="col-md-12">
					                        <div class="widget-box">
						                        <div class="widget-header">
							                        <h4 class="widget-title">Crescimento de Vendas Total</h4>

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
							                        <div class="widget-main" style="overflow-x:auto ">
								
                                                                <uc2:wuc_KPI_Secao_Depto ID="wuc_KPI_Secao_Depto1" runat="server" />

                                								
							                        </div>
						                        </div>
					                        </div>
				                        </div><!-- /.span -->
              
                                   </div>   

                        </div> 

                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>

            <dx:TabPage Text="Agenda 23">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl2" runat="server">

                        <div class="container-fluid">

                              <div class="row Quebra_Pagina_Row">                

                                    <div class="col-xs-12 col-sm-3">
					                        <div class="widget-box">
						                        <div class="widget-header"><h6 class="widget-title"><span class="fa fa-bar-chart-o" ></span> &nbsp;% Ag. 23 Meta x Real Empresa - <asp:Label ID="Label1" runat="server"></asp:Label> </h6>
						
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
								
							                            <dxchartsui:WebChartControl ID="chartPercentual" runat="server" CrosshairEnabled="True" DataSourceID="dsQuebraPercentual" Height="200px" Width="400px">
                                                            <BorderOptions Visibility="False" />
                                                            <DiagramSerializable>
                                                                <cc1:XYDiagram LabelsResolveOverlappingMinIndent="0" PaneDistance="0">
                                                                <axisx reverse="True" visibility="False" visibleinpanesserializable="-1">
                                                                    <label angle="90">
                                                                    </label>
                                                                </axisx>
                                                                <axisy visibility="False" visibleinpanesserializable="-1">
                                                                    <gridlines visible="False">
                                                                    </gridlines>
                                                                </axisy>
                                                                <margins bottom="0" left="0" right="0" top="0" />
                                                                <defaultpane bordercolor="White" bordervisible="False">
                                                                </defaultpane>
                                                                </cc1:XYDiagram>
                                                            </DiagramSerializable>
                                                            <Legend AlignmentVertical="Center" Direction="BottomToTop" DockTargetName="Default Pane" MarkerSize="21, 21" MaxCrosshairContentWidth="200" MaxHorizontalPercentage="50" MaxVerticalPercentage="50" Name="Default Legend" TextOffset="10" VerticalIndent="1" Visibility="True">
                                                                <margins bottom="1" left="1" right="1" top="1" />
                                                                <border visibility="True" />
                                                                <title wordwrap="True"></title></Legend>
                                                            <SeriesSerializable>
                                                                <cc1:Series ArgumentDataMember="Caption" ArgumentScaleType="Qualitative" FilterString="[rnk] = 1" LabelsVisibility="True" Name="Realizado" ValueDataMembersSerializable="percAg23">
                                                                <viewserializable>
                                                                    <cc1:SideBySideBarSeriesView Color="216, 25, 79, 177">
                                                                        <fillstyle fillmode="Solid">
                                                                        </fillstyle>
                                                                    </cc1:SideBySideBarSeriesView>
                                                                </viewserializable>
                                                                <labelserializable>
                                                                    <cc1:SideBySideBarSeriesLabel Position="Top" TextPattern="{V:n2}">
                                                                    </cc1:SideBySideBarSeriesLabel>
                                                                </labelserializable>
                                                                </cc1:Series>
                                                                <cc1:Series ArgumentDataMember="Caption" ArgumentScaleType="Qualitative" FilterString="[rnk] = 1" LabelsVisibility="True" Name="Meta" ValueDataMembersSerializable="percAg23meta">
                                                                <viewserializable>
                                                                    <cc1:SideBySideBarSeriesView Color="218, 0, 176, 80" Transparency="75">
                                                                        <fillstyle fillmode="Solid">
                                                                        </fillstyle>
                                                                    </cc1:SideBySideBarSeriesView>
                                                                </viewserializable>
                                                                <labelserializable>
                                                                    <cc1:SideBySideBarSeriesLabel LineVisibility="True" Position="Top" TextPattern="{V:n2}">
                                                                    </cc1:SideBySideBarSeriesLabel>
                                                                </labelserializable>
                                                                </cc1:Series>
                                                            </SeriesSerializable>
                                                        </dxchartsui:WebChartControl>
                                                        <asp:SqlDataSource ID="dsQuebraPercentual" runat="server" ConnectionString="<%$ ConnectionStrings:gerPerdasConnectionString %>" SelectCommand="Analises.uspPerdas_por_Mes" SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                                                <asp:SessionParameter Name="idTipo" SessionField="sOPCAO" Type="Byte" />
                                                                <asp:SessionParameter Name="idMercadologico" SessionField="sMERCADOLOGICO" Type="Int16" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
								
							                        </div>
						                        </div>
					                        </div>
				                        </div><!-- /.span -->

                                    <div class="col-xs-12 col-sm-4">
					                        <div class="widget-box">
						                        <div class="widget-header"><h6 class="widget-title"><span class="fa fa-desktop" ></span> &nbsp; Agenda 23 - Meta x Realizado - <asp:Label ID="lbl_2_2" runat="server"></asp:Label></h6>
						
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

                                                        <dx:ASPxGridView ID="grid_Meta_Realizado_Ag23" runat="server" AutoGenerateColumns="False" DataSourceID="ds_Perdas_Loja_Metas_x_Realizado" EnableTheming="True" Theme="PlasticBlue" Width="100%">
                                                            <SettingsPager Mode="ShowAllRecords">
                                                            </SettingsPager>
                                                            <Settings VerticalScrollBarMode="Visible" />
                                                            <SettingsBehavior AllowFocusedRow="True" />
                                                            <SettingsResizing ColumnResizeMode="Control" />
                                                            <SettingsText Title="Projeção Venda Hoje" />
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Filial" FieldName="FilialDesc" ShowInCustomizationForm="True" VisibleIndex="0" Width="200px">
                                                                    <CellStyle Wrap="False">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta_Agenda23" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Realizado" FieldName="vlrAgenda23" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Diferença" FieldName="Dif" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <Styles>
                                                                <Header Font-Bold="False" Font-Size="Small" HorizontalAlign="Center">
                                                                </Header>
                                                                <AlternatingRow BackColor="#EAEAEA">
                                                                </AlternatingRow>
                                                                <FocusedRow BackColor="Yellow" ForeColor="Blue">
                                                                </FocusedRow>
                                                                <Cell Font-Size="Small">
                                                                </Cell>
                                                            </Styles>
                                                        </dx:ASPxGridView>        
                                                        <asp:SqlDataSource ID="ds_Perdas_Loja_Metas_x_Realizado" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="Dashboard.usp_Perdas_Loja_Metas_x_Realizado" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

								
								
							                        </div>
						                        </div>
					                        </div>
				                        </div><!-- Agenda 23 por Produto - TOP 10 -->

                                    <div class="col-xs-12 col-sm-5">
					                        <div class="widget-box">
						                        <div class="widget-header"><h6 class="widget-title"><span class="fa fa-desktop" ></span> &nbsp; Agenda 23 por Produto - TOP 10 - <asp:Label ID="Label5" runat="server"></asp:Label></h6>
						
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

                                                <dx:ASPxGridView ID="gridAgendaItem" runat="server" AutoGenerateColumns="False"  DataSourceID="ds_Dashboard_Agenda23_por_Item" EnableTheming="True" Font-Size="Medium" KeyFieldName="CodProduto" Theme="PlasticBlue" Width="100%">
                                                            <SettingsPager Mode="ShowAllRecords" PageSize="14">
                                                                <Summary AllPagesText="Páginas: {0} - {1} ({2} produtoss)" Text="Paginá {0} of {1} ({2} produtos)" />
                                                                <PageSizeItemSettings Caption="Tamanho da Página:">
                                                                </PageSizeItemSettings>
                                                            </SettingsPager>
                                                            <Settings ShowVerticalScrollBar="True" />
                                                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                                            <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" Title="Consulta itens com margem negativa - por Filial" />
                                                            <StylesEditors>
                                                                <ProgressBar Height="25px">
                                                                </ProgressBar>
                                                            </StylesEditors>
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Filial" FieldName="FilialDesc" ShowInCustomizationForm="True" VisibleIndex="5">
                                                                    <Settings AllowAutoFilter="False" AutoFilterCondition="Contains" />
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle Wrap="False">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Produto" FieldName="idProduto" ShowInCustomizationForm="True" VisibleIndex="1" Width="70px">
                                                                    <Settings AllowAutoFilter="False" AutoFilterCondition="Contains" />
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Valor" FieldName="vlrAg23" ShowInCustomizationForm="True" VisibleIndex="4" Width="70px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Nome do Produto" FieldName="nomeProduto" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                    <Settings AllowAutoFilter="False" />
                                                                    <CellStyle Wrap="False">
                                                                    </CellStyle>
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" AutoFilterCondition="Contains" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Volume" FieldName="QtdeAg23" ShowInCustomizationForm="True" VisibleIndex="3" Width="70px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n3}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <Settings AllowAutoFilter="False" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="#" FieldName="rnk" ShowInCustomizationForm="True" VisibleIndex="0" Width="35px">
                                                                    <Settings AllowAutoFilter="False" />
                                                                    <CellStyle HorizontalAlign="Center">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <GroupSummary>
                                                                <dx:ASPxSummaryItem DisplayFormat="Itens c/ margem negativa {0:n0}" FieldName="CodProduto" SummaryType="Count" />
                                                            </GroupSummary>
                                                            <Styles>
                                                                <Header Font-Size="Small" ImageSpacing="5px" SortingImageSpacing="5px" HorizontalAlign="Center">
                                                                </Header>
                                                                <AlternatingRow BackColor="#EAEAEA">
                                                                </AlternatingRow>
                                                                <FocusedRow BackColor="Yellow" ForeColor="#0066FF">
                                                                </FocusedRow>
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
                                    
                                                        </dx:ASPxGridView>
                               
                                                        <asp:SqlDataSource ID="ds_Dashboard_Agenda23_por_Item" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="Dashboard.usp_Buscar_Agenda23_por_Item" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
								
							                        </div>
						                        </div>
					                        </div>
				                        </div><!-- /.span -->        


                              </div> 

                             <hr />
                        
                              <div class="row Quebra_Pagina_Row">                                   

                                        <div class="col-xs-12 col-sm-5">
					                        <div class="widget-box">
						                        <div class="widget-header"><h5 class="widget-title"><span class="fa fa-desktop" ></span> &nbsp; USO e CONSUMO - Comparativo com Ano Anterior</h5>
						
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
                                                        <dx:ASPxGridView ID="grid_Ag245" runat="server" AutoGenerateColumns="False" DataSourceID="ds_Agenda245" EnableTheming="True" Theme="PlasticBlue" Width="100%" ClientInstanceName="grid_Ag245">
                                                            <ClientSideEvents FocusedRowChanged="function(s, e) {
	                        OnGridFocusedRowChanged();
                        }" RowDblClick="function(s, e) {
	                        ShowLoginWindow(); 
                        }" />
                                                            <SettingsPager Mode="ShowAllRecords">
                                                            </SettingsPager>
                                                            <Settings VerticalScrollBarMode="Visible" ShowFooter="True" />
                                                            <SettingsBehavior AllowFocusedRow="True" />
                                                            <SettingsResizing ColumnResizeMode="Control" />
                                                            <SettingsText Title="Projeção Venda Hoje" />
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn Caption="Filial" FieldName="FilialDesc" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                    <CellStyle Wrap="False">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Julho 2019" FieldName="vlr245_AA" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <FilterCellStyle BackColor="#FF3300">
                                                                    </FilterCellStyle>
                                                                    <HeaderStyle BackColor="#FF3300" />
                                                                    <CellStyle>
                                                                        <BorderRight BorderColor="Gray" BorderStyle="Dashed" />
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Julho 2020" FieldName="vlrProjecao" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Diferença" FieldName="Dif" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="5" SortIndex="0" SortOrder="Descending">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Junho 2020" FieldName="vlr245_MA" ShowInCustomizationForm="True" VisibleIndex="3">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="idFilial" ShowInCustomizationForm="True" VisibleIndex="0" Visible="False">
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <TotalSummary>
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr245_AA" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrProjecao" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Dif" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlr245_MA" SummaryType="Sum" />
                                                            </TotalSummary>
                                                            <FormatConditions>
                                                                <dx:GridViewFormatConditionHighlight Expression="[Dif] &lt; 0.0" FieldName="Dif" Format="GreenFillWithDarkGreenText">
                                                                </dx:GridViewFormatConditionHighlight>
                                                                <dx:GridViewFormatConditionHighlight Expression="[Dif] &gt; 0.0" FieldName="Dif">
                                                                </dx:GridViewFormatConditionHighlight>
                                                                <dx:GridViewFormatConditionIconSet FieldName="Dif" Format="PositiveNegativeArrowsColored" />
                                                            </FormatConditions>
                                                            <Styles>
                                                                <Header Font-Bold="False" Font-Size="Small" HorizontalAlign="Center">
                                                                </Header>
                                                                <AlternatingRow BackColor="#EAEAEA">
                                                                </AlternatingRow>
                                                                <FocusedRow BackColor="Yellow" ForeColor="Blue">
                                                                </FocusedRow>
                                                                <Cell Font-Size="Small">
                                                                </Cell>
                                                                <Footer BackColor="#DBDBDB" Font-Bold="True" Font-Size="Small" ForeColor="Black">
                                                                </Footer>
                                                            </Styles>
                                                        </dx:ASPxGridView>        
                                                        <asp:SqlDataSource ID="ds_Agenda245" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="Dashboard.usp_Buscar_Agenda245" SelectCommandType="StoredProcedure"></asp:SqlDataSource>


                                                        </div>
						                        </div>
					                        </div>
				                        </div><!--  -->
                                                              

                              </div> 
                        
                        </div> 

                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>

            <dx:TabPage Text="Comercial">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl3" runat="server">

                        <div class="container-fluid"> 
                        
                                        <div class="col-xs-12 col-sm-4">
					                        <div class="widget-box">
						                        <div class="widget-header"><h6 class="widget-title"><span class="fa fa-desktop" ></span> &nbsp; Meta x Realizado de Venda por Gestor</h6>
						
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
								
                                                        <dx:ASPxGridView ID="grid_Loja_Nao_Fizeram_Checklist" runat="server" AutoGenerateColumns="False" DataSourceID="dsChecklist" EnableTheming="True" Theme="PlasticBlue" Font-Size="Medium" Width="100%">
                                                            <SettingsPager Mode="ShowAllRecords">
                                                            </SettingsPager>
                                                            <Settings ShowFooter="True" />
                                                            <SettingsText EmptyDataRow="Todas as Lojas Fizeram o Check-List Ontem." />
                                                            <Columns>
                                                                <dx:GridViewDataTextColumn FieldName="Gestor" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                    <CellStyle HorizontalAlign="Left">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="vlrMeta_Venda" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1" Caption="Meta">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <CellStyle HorizontalAlign="Right">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="vlrVenda" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2" Caption="Real" SortIndex="0" SortOrder="Descending">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <CellStyle HorizontalAlign="Right">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn FieldName="percMeta" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3" Caption="% Ating">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <CellStyle HorizontalAlign="Right">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento sobre o Ano Anterior (não mesmos dias)" VisibleIndex="4">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="% Marg Final" FieldName="percMargFinal" ShowInCustomizationForm="True" VisibleIndex="5">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <CellStyle BackColor="#FFFF99" Font-Bold="True">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <TotalSummary>
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta_Venda" SummaryType="Sum" />
                                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                                                            </TotalSummary>
                                                            <FormatConditions>
                                                                <dx:GridViewFormatConditionIconSet FieldName="percCresc" Format="PositiveNegativeArrowsColored" />
                                                                <dx:GridViewFormatConditionIconSet FieldName="percMeta" Format="PositiveNegativeTriangles" />
                                                            </FormatConditions>
                                                            <Styles>
                                                                <Header Font-Bold="True" Font-Size="Small" HorizontalAlign="Center">
                                                                </Header>
                                                                <Cell Font-Size="Small" HorizontalAlign="Center">
                                                                </Cell>
                                                                <Footer Font-Size="Small">
                                                                </Footer>
                                                            </Styles>
                                                        </dx:ASPxGridView>        
                                                        <asp:SqlDataSource ID="dsChecklist" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="Dashboard.usp_Gestor" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
							   
								
							                        </div>
						                        </div>
					                        </div>
				                        </div><!-- /.span -->
                        
                        </div> 

                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>


        </TabPages>
    </dx:ASPxPageControl>

    




                       
<%-------------------------------------------------------------------------------------------------------------------------------------------------------%>

        

            
        
<%------------------------------------------------------------------------------------------------------------------------------------------------------%>


        <asp:Label ID="lblError" runat="server" Text="Label"  ForeColor="Red" Visible="False"></asp:Label>
        <asp:Label ID="lblOBS" runat="server" Text=""></asp:Label>

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

