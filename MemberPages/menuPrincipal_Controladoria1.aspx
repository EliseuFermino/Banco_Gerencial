<%@ Page Title="Menu Principal" Trace="false"  Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="menuPrincipal_Controladoria1.aspx.vb" Inherits="MemberPages_menuPrincipal_Controladoria1" %>

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

    <div class="container-fluid">

    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
          Dashboard - Principal
        <small>Controladoria</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Principal</a></li>
        <li class="active">Dashboard</li>
      </ol>
        
    </section>
        
<%--        <div id="divFilial" class="row">
            <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" AutoPostBack="false"  />            
        </div>

        <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
        </div>--%>

        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis"  Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
            <Images>
                <LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
            </Images>

            <LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
                <PanelCollection>
                    <dx:PanelContent>

                       
<%-------------------------------------------------------------------------------------------------------------------------------------------------------%>

      <div class="row Quebra_Pagina_Row">
                
                <div class="col-xs-12 col-sm-4">
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

						<div class="widget-body">
							<div class="widget-main">
								
                                <dx:ASPxGaugeControl ID="gauge_Margem_PDV" runat="server" Height="260px" Width="360px" LayoutInterval="6" Value="5">
                                    <Gauges>
                                        <dx:CircularGauge Bounds="6, 6, 348, 248" Name="circularGauge13">
                                            <scales>
                                                <dx:ArcScaleComponent AcceptOrder="0" AppearanceMajorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMajorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceTickmarkText-Font="Tahoma, 10pt" AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#999999&quot;/&gt;" Center="125, 159" EndAngle="0" MajorTickCount="6" MajorTickmark-AllowTickOverlap="True" MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-2" MajorTickmark-ShapeType="Circular_Style27_1" MajorTickmark-TextOffset="18" MajorTickmark-TextOrientation="LeftToRight" MaxValue="20" MinorTickCount="4" MinorTickmark-ShapeOffset="4" MinorTickmark-ShapeType="Circular_Style27_1" MinorTickmark-ShowTick="False" MinValue="5" Name="scale1" RadiusX="101" RadiusY="101" StartAngle="-180" Value="5">
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
<LayoutPadding All="6" Left="6" Top="6" Right="6" Bottom="6"></LayoutPadding>
                                </dx:ASPxGaugeControl>
                                								
							</div>
						</div>
					</div>
				</div><!-- /.span -->

                <div class="col-xs-12 col-sm-4">
					<div class="widget-box">
						<div class="widget-header"><h6 class="widget-title"><span class="fa fa-bar-chart-o" ></span> &nbsp;% Agenda 23 Meta x Realizado Empresa - <asp:Label ID="lbl_1_2" runat="server"></asp:Label> </h6>
						
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
	
							</div>
						</div>
					</div>
				</div><!-- /.span -->

                <div class="col-xs-12 col-sm-4">
					<div class="widget-box">
						<div class="widget-header"><h6 class="widget-title"><span class="fa fa-bar-chart-o" ></span> &nbsp; Check-List Não Feito - <asp:Label ID="lbl_1_3" runat="server"></asp:Label>  </h6>
						
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
								
							   
								
							</div>
						</div>
					</div>
				</div><!-- /.span -->

      </div> 

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

								
								
							</div>
						</div>
					</div>
				</div><!-- Agenda 23 por Produto - TOP 10 -->

                <div class="col-xs-12 col-sm-4">
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
                               

                                </div>
						</div>
					</div>
				</div><!--  -->

      </div> 
                        
      <div class="row Quebra_Pagina_Row">
                
                <div class="col-xs-12 col-sm-4">
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
								
               				
							</div>
						</div>
					</div>
				</div><!-- /.span -->

                <div class="col-xs-12 col-sm-4">
					<div class="widget-box">
						<div class="widget-header"><h6 class="widget-title"><span class="fa fa-desktop" ></span> &nbsp; Agenda 23 por Produto - TOP 10 - <asp:Label ID="lbl_3_2" runat="server"></asp:Label></h6>
						
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

							</div>
						</div>
					</div>
				</div><!-- /.span -->

                <div class="col-xs-12 col-sm-4">
					<div class="widget-box">
						<div class="widget-header"><h4 class="widget-title"><span class="fa fa-desktop" ></span> &nbsp; 3 - 3</h4>
						
						</div>

                        

						<div class="widget-body">
							<div class="widget-main">
								
							</div>
						</div>
					</div>
				</div><!-- /.span -->

      </div> 
                        
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
								
                                       

                                								
							</div>
						</div>
					</div>
				</div><!-- /.span -->
              
           </div>   
        

            
        
<%------------------------------------------------------------------------------------------------------------------------------------------------------%>


        <asp:Label ID="lblError" runat="server" Text="Label"  ForeColor="Red" Visible="False"></asp:Label>
        <asp:Label ID="lblOBS" runat="server" Text=""></asp:Label>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>


<%------------------------------------------------------------------------------------------------------------------------------------------------------------%>

 </div> 

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

