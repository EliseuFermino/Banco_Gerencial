<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="DashboardUnit.aspx.vb" Inherits="MemberPages_Checklist_DashboardUnit" %>

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


    <link href="../../css/Dashboard.css" rel="stylesheet" />
    <link href="../../css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-2.2.3.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
      <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">

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

    </style>
    
    
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">


    <div class="container-fluid">

    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Dashboard - Regional
        <small>Controladoria</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Principal</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>


      <div class="row">
        <div class="col-md-12">
          <div class="box">
            <div class="box-header with-border">              
              <h3 class="box-title"><asp:Label ID="lblRelogios" runat="server" Text=""></asp:Label></h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
               
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">

      <div class="row" style="margin-left: 25px">
        
          <div class="row placeholders">
            <div class="col-md-3 col-lg-2 placeholder">               

                <dx:ASPxGaugeControl ID="gauge_Pontuacao_Empresa" runat="server" Height="200px" Width="200px" BackColor="Transparent" LayoutInterval="6" Value="86,5" >
                    <Gauges>
                        <dx:CircularGauge Bounds="6, 6, 188, 188" Name="circularGauge1">
                            <scales>
                                <dx:ArcScaleComponent AcceptOrder="0" AppearanceTickmarkText-Font="Tahoma, 8.5pt" AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#484E5A&quot;/&gt;" Center="125, 125" EndAngle="60" MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-14" MajorTickmark-ShapeType="Circular_Style16_1" MajorTickmark-TextOrientation="LeftToRight" MaxValue="100" MinorTickCount="4" MinorTickmark-ShapeOffset="-7" MinorTickmark-ShapeType="Circular_Style16_2" Name="scale1" StartAngle="-240" Value="86.5">
                                    <ranges>
                                        <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Firebrick&quot;/&gt;" EndThickness="14" EndValue="70" Name="Range0" ShapeOffset="0" StartThickness="14" />
                                        <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:SandyBrown&quot;/&gt;" EndThickness="14" EndValue="90" Name="Range1" ShapeOffset="0" StartThickness="14" StartValue="70.01" />
                                        <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:DeepSkyBlue&quot;/&gt;" EndThickness="14" EndValue="95" Name="Range2" ShapeOffset="0" StartThickness="14" StartValue="90.01" />
                                        <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:SteelBlue&quot;/&gt;" EndThickness="14" EndValue="97" Name="Range3" ShapeOffset="0" StartThickness="14" StartValue="95.01" />
                                        <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:LimeGreen&quot;/&gt;" EndThickness="14" EndValue="100" Name="Range4" ShapeOffset="0" StartThickness="14" StartValue="97.01" />
                                    </ranges>
                                </dx:ArcScaleComponent>
                            </scales>
                            <backgroundlayers>
                                <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" Name="bg" ScaleID="scale1" ShapeType="CircularFull_Style16" ZOrder="1000" />
                            </backgroundlayers>
                            <needles>
                                <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" EndOffset="5" Name="needle" ScaleID="scale1" ShapeType="CircularFull_Style16" ZOrder="-50" />
                            </needles>
                            <spindlecaps>
                                <dx:ArcScaleSpindleCapComponent AcceptOrder="100" ArcScale="" Name="cGauge1_SpindleCap1" ScaleID="scale1" ShapeType="CircularFull_Style16" Size="25, 25" ZOrder="-100" />
                            </spindlecaps>
                        </dx:CircularGauge>
                    </Gauges>
<LayoutPadding All="6" Left="6" Top="6" Right="6" Bottom="6"></LayoutPadding>
                </dx:ASPxGaugeControl>
              
              <h4><asp:Label ID="lblNomeRegional" runat="server"></asp:Label></h4>
              <span class="text-muted"><asp:Label ID="lblPeriodo_Empresa" runat="server" Text=""></asp:Label></span>
            </div>

            <div class="col-md-3 col-lg-2 placeholder">                 

                <dx:ASPxGaugeControl ID="gauge_Pontuacao_Melhor1" runat="server" Height="200px" Width="200px" BackColor="Transparent" LayoutInterval="6" Value="98,4" >
                    <Gauges>
                        <dx:CircularGauge Bounds="6, 6, 188, 188" Name="circularGauge1">
                            <scales>
                                <dx:ArcScaleComponent AcceptOrder="0" AppearanceTickmarkText-Font="Tahoma, 8.5pt" AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#484E5A&quot;/&gt;" Center="125, 125" EndAngle="60" MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-14" MajorTickmark-ShapeType="Circular_Style16_1" MajorTickmark-TextOrientation="LeftToRight" MaxValue="100" MinorTickCount="4" MinorTickmark-ShapeOffset="-7" MinorTickmark-ShapeType="Circular_Style16_2" Name="scale1" StartAngle="-240" Value="98.4">
                                    <ranges>
                                        <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Firebrick&quot;/&gt;" EndThickness="14" EndValue="70" Name="Range0" ShapeOffset="0" StartThickness="14" />
                                        <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:SandyBrown&quot;/&gt;" EndThickness="14" EndValue="90" Name="Range1" ShapeOffset="0" StartThickness="14" StartValue="70.01" />
                                        <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:DeepSkyBlue&quot;/&gt;" EndThickness="14" EndValue="95" Name="Range2" ShapeOffset="0" StartThickness="14" StartValue="90.01" />
                                        <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:SteelBlue&quot;/&gt;" EndThickness="14" EndValue="97" Name="Range3" ShapeOffset="0" StartThickness="14" StartValue="95.01" />
                                        <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:LimeGreen&quot;/&gt;" EndThickness="14" EndValue="100" Name="Range4" ShapeOffset="0" StartThickness="14" StartValue="97.01" />
                                    </ranges>
                                </dx:ArcScaleComponent>
                            </scales>
                            <backgroundlayers>
                                <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" Name="bg" ScaleID="scale1" ShapeType="CircularFull_Style16" ZOrder="1000" />
                            </backgroundlayers>
                            <needles>
                                <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" EndOffset="5" Name="needle" ScaleID="scale1" ShapeType="CircularFull_Style16" ZOrder="-50" />
                            </needles>
                            <spindlecaps>
                                <dx:ArcScaleSpindleCapComponent AcceptOrder="100" ArcScale="" Name="cGauge1_SpindleCap1" ScaleID="scale1" ShapeType="CircularFull_Style16" Size="25, 25" ZOrder="-100" />
                            </spindlecaps>
                        </dx:CircularGauge>
                    </Gauges>
<LayoutPadding All="6" Left="6" Top="6" Right="6" Bottom="6"></LayoutPadding>
                </dx:ASPxGaugeControl>
              
              <h4><asp:Label ID="lblFilial_Melhor1" runat="server" ></asp:Label></h4>
              <span class="text-muted"><asp:Label ID="lblPeriodo_Melhor1" runat="server" ></asp:Label></span>
                <h4><asp:Button ID="btnMelhor1" runat="server" Text="Melhor 1" CssClass="btn btn-warning" /></h4>
            </div>

            <div class="col-md-3 col-lg-2 placeholder">
                <dx:ASPxGaugeControl ID="gauge_Pontuacao_Melhor2" runat="server" Height="200px" Width="200px" BackColor="Transparent" LayoutInterval="6" Value="98,1" >
                    <Gauges>
                        <dx:CircularGauge Bounds="6, 6, 188, 188" Name="circularGauge1">
                            <scales>
                                <dx:ArcScaleComponent AcceptOrder="0" AppearanceTickmarkText-Font="Tahoma, 8.5pt" AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#484E5A&quot;/&gt;" Center="125, 125" EndAngle="60" MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-14" MajorTickmark-ShapeType="Circular_Style16_1" MajorTickmark-TextOrientation="LeftToRight" MaxValue="100" MinorTickCount="4" MinorTickmark-ShapeOffset="-7" MinorTickmark-ShapeType="Circular_Style16_2" Name="scale1" StartAngle="-240" Value="98.1">
                                    <ranges>
                                        <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Firebrick&quot;/&gt;" EndThickness="14" EndValue="70" Name="Range0" ShapeOffset="0" StartThickness="14" />
                                        <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:SandyBrown&quot;/&gt;" EndThickness="14" EndValue="90" Name="Range1" ShapeOffset="0" StartThickness="14" StartValue="70.01" />
                                        <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:DeepSkyBlue&quot;/&gt;" EndThickness="14" EndValue="95" Name="Range2" ShapeOffset="0" StartThickness="14" StartValue="90.01" />
                                        <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:SteelBlue&quot;/&gt;" EndThickness="14" EndValue="97" Name="Range3" ShapeOffset="0" StartThickness="14" StartValue="95.01" />
                                        <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:LimeGreen&quot;/&gt;" EndThickness="14" EndValue="100" Name="Range4" ShapeOffset="0" StartThickness="14" StartValue="97.01" />
                                    </ranges>
                                </dx:ArcScaleComponent>
                            </scales>
                            <backgroundlayers>
                                <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" Name="bg" ScaleID="scale1" ShapeType="CircularFull_Style16" ZOrder="1000" />
                            </backgroundlayers>
                            <needles>
                                <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" EndOffset="5" Name="needle" ScaleID="scale1" ShapeType="CircularFull_Style16" ZOrder="-50" />
                            </needles>
                            <spindlecaps>
                                <dx:ArcScaleSpindleCapComponent AcceptOrder="100" ArcScale="" Name="cGauge1_SpindleCap1" ScaleID="scale1" ShapeType="CircularFull_Style16" Size="25, 25" ZOrder="-100" />
                            </spindlecaps>
                        </dx:CircularGauge>
                    </Gauges>
<LayoutPadding All="6" Left="6" Top="6" Right="6" Bottom="6"></LayoutPadding>
                </dx:ASPxGaugeControl>
              
              <h4><asp:Label ID="lblFilial_Melhor2" runat="server" ></asp:Label></h4>
              <span class="text-muted"><asp:Label ID="lblPeriodo_Melhor2" runat="server" ></asp:Label></span>
                <h4><asp:Button ID="btnMelhor2" runat="server" Text="Melhor 2" CssClass="btn btn-warning" /></h4>
            </div>

            <div class="col-md-3 col-lg-2 placeholder">
                <dx:ASPxGaugeControl ID="gauge_Pontuacao_Pior1" runat="server" Height="200px" Width="200px" BackColor="Transparent" LayoutInterval="6" Value="61,2" >
                    <Gauges>
                        <dx:CircularGauge Bounds="6, 6, 188, 188" Name="circularGauge1">
                            <scales>
                                <dx:ArcScaleComponent AcceptOrder="0" AppearanceTickmarkText-Font="Tahoma, 8.5pt" AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#484E5A&quot;/&gt;" Center="125, 125" EndAngle="60" MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-14" MajorTickmark-ShapeType="Circular_Style16_1" MajorTickmark-TextOrientation="LeftToRight" MaxValue="100" MinorTickCount="4" MinorTickmark-ShapeOffset="-7" MinorTickmark-ShapeType="Circular_Style16_2" Name="scale1" StartAngle="-240" Value="61.2">
                                    <ranges>
                                        <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Firebrick&quot;/&gt;" EndThickness="14" EndValue="70" Name="Range0" ShapeOffset="0" StartThickness="14" />
                                        <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:SandyBrown&quot;/&gt;" EndThickness="14" EndValue="90" Name="Range1" ShapeOffset="0" StartThickness="14" StartValue="70.01" />
                                        <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:DeepSkyBlue&quot;/&gt;" EndThickness="14" EndValue="95" Name="Range2" ShapeOffset="0" StartThickness="14" StartValue="90.01" />
                                        <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:SteelBlue&quot;/&gt;" EndThickness="14" EndValue="97" Name="Range3" ShapeOffset="0" StartThickness="14" StartValue="95.01" />
                                        <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:LimeGreen&quot;/&gt;" EndThickness="14" EndValue="100" Name="Range4" ShapeOffset="0" StartThickness="14" StartValue="97.01" />
                                    </ranges>
                                </dx:ArcScaleComponent>
                            </scales>
                            <backgroundlayers>
                                <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" Name="bg" ScaleID="scale1" ShapeType="CircularFull_Style16" ZOrder="1000" />
                            </backgroundlayers>
                            <needles>
                                <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" EndOffset="5" Name="needle" ScaleID="scale1" ShapeType="CircularFull_Style16" ZOrder="-50" />
                            </needles>
                            <spindlecaps>
                                <dx:ArcScaleSpindleCapComponent AcceptOrder="100" ArcScale="" Name="cGauge1_SpindleCap1" ScaleID="scale1" ShapeType="CircularFull_Style16" Size="25, 25" ZOrder="-100" />
                            </spindlecaps>
                        </dx:CircularGauge>
                    </Gauges>
<LayoutPadding All="6" Left="6" Top="6" Right="6" Bottom="6"></LayoutPadding>
                </dx:ASPxGaugeControl>
              
              <h4><asp:Label ID="lblFilial_Pior1" runat="server" ></asp:Label></h4>
              <span class="text-muted"><asp:Label ID="lblPeriodo_Pior1" runat="server" ></asp:Label></span>
              <h4><asp:Button ID="btnPior1" runat="server" Text="Pior 1" CssClass="btn btn-warning" /></h4>
            </div>

            <div class="col-md-3 col-lg-2 placeholder">
                <dx:ASPxGaugeControl ID="gauge_Pontuacao_Pior2" runat="server" Height="200px" Width="200px" BackColor="Transparent" LayoutInterval="6" Value="75,4" >
                    <Gauges>
                        <dx:CircularGauge Bounds="6, 6, 188, 188" Name="circularGauge1">
                            <scales>
                                <dx:ArcScaleComponent AcceptOrder="0" AppearanceTickmarkText-Font="Tahoma, 8.5pt" AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#484E5A&quot;/&gt;" Center="125, 125" EndAngle="60" MajorTickmark-FormatString="{0:F0}" MajorTickmark-ShapeOffset="-14" MajorTickmark-ShapeType="Circular_Style16_1" MajorTickmark-TextOrientation="LeftToRight" MaxValue="100" MinorTickCount="4" MinorTickmark-ShapeOffset="-7" MinorTickmark-ShapeType="Circular_Style16_2" Name="scale1" StartAngle="-240" Value="75.4">
                                    <ranges>
                                        <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:Firebrick&quot;/&gt;" EndThickness="14" EndValue="70" Name="Range0" ShapeOffset="0" StartThickness="14" />
                                        <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:SandyBrown&quot;/&gt;" EndThickness="14" EndValue="90" Name="Range1" ShapeOffset="0" StartThickness="14" StartValue="70.01" />
                                        <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:DeepSkyBlue&quot;/&gt;" EndThickness="14" EndValue="95" Name="Range2" ShapeOffset="0" StartThickness="14" StartValue="90.01" />
                                        <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:SteelBlue&quot;/&gt;" EndThickness="14" EndValue="97" Name="Range3" ShapeOffset="0" StartThickness="14" StartValue="95.01" />
                                        <dx:ArcScaleRangeWeb AppearanceRange-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:LimeGreen&quot;/&gt;" EndThickness="14" EndValue="100" Name="Range4" ShapeOffset="0" StartThickness="14" StartValue="97.01" />
                                    </ranges>
                                </dx:ArcScaleComponent>
                            </scales>
                            <backgroundlayers>
                                <dx:ArcScaleBackgroundLayerComponent AcceptOrder="-1000" ArcScale="" Name="bg" ScaleID="scale1" ShapeType="CircularFull_Style16" ZOrder="1000" />
                            </backgroundlayers>
                            <needles>
                                <dx:ArcScaleNeedleComponent AcceptOrder="50" ArcScale="" EndOffset="5" Name="needle" ScaleID="scale1" ShapeType="CircularFull_Style16" ZOrder="-50" />
                            </needles>
                            <spindlecaps>
                                <dx:ArcScaleSpindleCapComponent AcceptOrder="100" ArcScale="" Name="cGauge1_SpindleCap1" ScaleID="scale1" ShapeType="CircularFull_Style16" Size="25, 25" ZOrder="-100" />
                            </spindlecaps>
                        </dx:CircularGauge>
                    </Gauges>
<LayoutPadding All="6" Left="6" Top="6" Right="6" Bottom="6"></LayoutPadding>
                </dx:ASPxGaugeControl>
              
              <h4><asp:Label ID="lblFilial_Pior2" runat="server" ></asp:Label></h4>
              <span class="text-muted"><asp:Label ID="lblPeriodo_Pior2" runat="server" ></asp:Label></span>
              <h4><asp:Button ID="btnPior2" runat="server" Text="Pior 2" CssClass="btn btn-success" /></h4>
                
            </div>

        </div>

                    <%--LEGENDAS--%>

                    <span class="label label-danger">Péssimo - Entre 0 e 70</span>
                    <span class="label label-warning">Ruim - Entre 70,1 e 90</span>
                    <span class="label label-info">Regular - Entre 90,1 e 95</span>
                    <span class="label label-primary">Bom - Entre 95,1 e 97</span>                
                    <span class="label label-success">Ótimo - Entre 97,1 e 100</span>

 
    </div> 


              <!-- /.row -->
            </div>
            <!-- ./box-body -->
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>

      <div class="row">
        <div class="col-md-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Pontuação - por Loja</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
               
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">

            <div class="row">
                <div class="row " style="margin-left: 25px">              
                    
                        <h5><asp:Label ID="lblRegional206" runat="server" Text=""></asp:Label></h5> 

                        <div id="div4">
                            <dxchartsui:WebChartControl ID="graph_Regional206" runat="server" DataSourceID="dsPontuacaoRegional206" AppearanceNameSerializable="Nature Colors" Height="450px" Width="990px">
                                <diagramserializable>
                                    <cc1:XYDiagram>
                                        <axisx visibleinpanesserializable="-1">
                                            <label angle="90">
                                            </label>
                                            <range sidemarginsenabled="True" />
                                        </axisx>
                                        <axisy visibleinpanesserializable="-1" visible="False">
                                            <range sidemarginsenabled="True" />
                                        </axisy>
                                    </cc1:XYDiagram>
                                </diagramserializable>
    <FillStyle><OptionsSerializable>
    <cc1:SolidFillOptions></cc1:SolidFillOptions>
    </OptionsSerializable>
    </FillStyle>

                                <legend Visibility="False"></legend>
                                <seriesserializable>
                                    <cc1:Series ArgumentDataMember="Descricao" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="Nota">
                                        <viewserializable>
                                            <cc1:SideBySideBarSeriesView Transparency="25">
                                            </cc1:SideBySideBarSeriesView>
                                        </viewserializable>
                                        <labelserializable>
                                            <cc1:SideBySideBarSeriesLabel EnableAntialiasing="True" LineVisible="True">
                                                <fillstyle>
                                                    <optionsserializable>
                                                        <cc1:SolidFillOptions />
                                                    </optionsserializable>
                                                </fillstyle>
                                                <pointoptionsserializable>
                                                    <cc1:PointOptions>
                                                        <valuenumericoptions format="Number" precision="1" />
                                                    </cc1:PointOptions>
                                                </pointoptionsserializable>
                                            </cc1:SideBySideBarSeriesLabel>
                                        </labelserializable>
                                        <legendpointoptionsserializable>
                                            <cc1:PointOptions>
                                                <valuenumericoptions format="Number" precision="1" />
                                            </cc1:PointOptions>
                                        </legendpointoptionsserializable>
                                    </cc1:Series>
                                </seriesserializable>

    <SeriesTemplate><ViewSerializable>
    <cc1:SideBySideBarSeriesView></cc1:SideBySideBarSeriesView>
    </ViewSerializable>
    <LabelSerializable>
    <cc1:SideBySideBarSeriesLabel LineVisible="True">
    <FillStyle><OptionsSerializable>
    <cc1:SolidFillOptions></cc1:SolidFillOptions>
    </OptionsSerializable>
    </FillStyle>
    <PointOptionsSerializable>
    <cc1:PointOptions></cc1:PointOptions>
    </PointOptionsSerializable>
    </cc1:SideBySideBarSeriesLabel>
    </LabelSerializable>
    <LegendPointOptionsSerializable>
    <cc1:PointOptions></cc1:PointOptions>
    </LegendPointOptionsSerializable>
    </SeriesTemplate>

    <CrosshairOptions><CommonLabelPositionSerializable>
    <cc1:CrosshairMousePosition></cc1:CrosshairMousePosition>
    </CommonLabelPositionSerializable>
    </CrosshairOptions>

    <ToolTipOptions><ToolTipPositionSerializable>
    <cc1:ToolTipMousePosition></cc1:ToolTipMousePosition>
    </ToolTipPositionSerializable>
    </ToolTipOptions>
                            </dxchartsui:WebChartControl>
                            <asp:SqlDataSource ID="dsPontuacaoRegional206" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.usp_BuscarPontuacaoTotal_Regional" SelectCommandType="StoredProcedure">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" />
                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                    <asp:SessionParameter Name="idRegional" SessionField="sREGIONAL" Type="Byte" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </div>


                    <%--LEGENDAS--%>

                    <span class="label label-danger">Péssimo - Entre 0 e 70</span>
                    <span class="label label-warning">Ruim - Entre 70,1 e 90</span>
                    <span class="label label-info">Regular - Entre 90,1 e 95</span>
                    <span class="label label-primary">Bom - Entre 95,1 e 97</span>                
                    <span class="label label-success">Ótimo - Entre 97,1 e 100</span>
               
               </div>

           </div>   
                    

                
                          
                    


              <!-- /.row -->
            </div>
            <!-- ./box-body -->
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>


      <div class="row">
        <div class="col-md-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Pontuação - por Departamento</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
               
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">

            <div class="row">
                <div class="row " style="margin-left: 25px">              
                    
                        <div id="divDadosDepartamento">

                            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                <ContentTemplate>
                                    
                                            <h5><asp:Label ID="lblDepartamento" runat="server" Text="" ></asp:Label></h5> 

                                            <div class="divGrupoLegenda" >
                                                Grupo:
                                            </div>

                                            <div class="divGrupo" >
                                                <dx:ASPxComboBox ID="cboGrupo" runat="server" DataSourceID="dsGrupo" TextField="listaGrupo" Theme="SoftOrange" ValueField="idGrupo" Width="200px" AutoPostBack="True">

                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) {
	
	
                    }" />

                                                </dx:ASPxComboBox>
                                                <asp:SqlDataSource ID="dsGrupo" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="SELECT [idGrupo], [listaGrupo] FROM [Cadastro].[tblCadGrupo] ORDER BY [idGrupo]"></asp:SqlDataSource>
                                            </div>

                                            <div class="divSubgrupoLegenda" >
                                                Subgrupo:
                                            </div>

                                            <div class="divSubgrupo" >
                                                <dx:ASPxComboBox ID="cboSubgrupo" runat="server" DataSourceID="dsSubgrupoLista" TextField="descSubgrupo" Theme="SoftOrange" ValueField="idSubgrupo" Width="200px" ClientInstanceName="cboSubgrupo" AutoPostBack="True">

                                                </dx:ASPxComboBox>
                                                <asp:SqlDataSource ID="dsSubgrupoLista" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="SELECT [idSubgrupo], [descSubgrupo] FROM [Cadastro].[tblCadSubgrupo] WHERE ([idGrupo] = @idGrupo)">
                                                    <SelectParameters>
                                                        <asp:ControlParameter ControlID="cboGrupo" Name="idGrupo" PropertyName="Value" Type="Byte" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>

                                            </div>

                                            <dxchartsui:WebChartControl ID="graph_Subgrupo" runat="server" AppearanceNameSerializable="Nature Colors" DataSourceID="dsSubgrupoDados" Height="450px" Width="1020px">
                                                <diagramserializable>
                                                    <cc1:XYDiagram>
                                                        <axisx visibleinpanesserializable="-1">
                                                            <label angle="90">
                                                            </label>
                                                            <range sidemarginsenabled="True" />
                                                        </axisx>
                                                        <axisy visibleinpanesserializable="-1" visible="False">
                                                            <range sidemarginsenabled="True" />
                                                        </axisy>
                                                    </cc1:XYDiagram>
                                                </diagramserializable>
                                                <fillstyle>
                                                    <optionsserializable>
                                                        <cc1:SolidFillOptions />
                                                    </optionsserializable>
                                                </fillstyle>
                                                <legend Visibility="False"></legend>
                                                <seriesserializable>
                                                    <cc1:Series LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="Nota" ArgumentDataMember="Descricao">
                                                        <viewserializable>
                                                            <cc1:SideBySideBarSeriesView Transparency="25">
                                                            </cc1:SideBySideBarSeriesView>
                                                        </viewserializable>
                                                        <labelserializable>
                                                            <cc1:SideBySideBarSeriesLabel EnableAntialiasing="True" LineVisible="True" Font="Tahoma, 7pt">
                                                                <fillstyle>
                                                                    <optionsserializable>
                                                                        <cc1:SolidFillOptions />
                                                                    </optionsserializable>
                                                                </fillstyle>
                                                                <pointoptionsserializable>
                                                                    <cc1:PointOptions>
                                                                        <valuenumericoptions format="Number" precision="1" />
                                                                    </cc1:PointOptions>
                                                                </pointoptionsserializable>
                                                            </cc1:SideBySideBarSeriesLabel>
                                                        </labelserializable>
                                                        <legendpointoptionsserializable>
                                                            <cc1:PointOptions>
                                                                <valuenumericoptions format="Number" precision="1" />
                                                            </cc1:PointOptions>
                                                        </legendpointoptionsserializable>
                                                    </cc1:Series>
                                                </seriesserializable>
                                                <seriestemplate>
                                                    <viewserializable>
                                                        <cc1:SideBySideBarSeriesView>
                                                        </cc1:SideBySideBarSeriesView>
                                                    </viewserializable>
                                                    <labelserializable>
                                                        <cc1:SideBySideBarSeriesLabel LineVisible="True">
                                                            <fillstyle>
                                                                <optionsserializable>
                                                                    <cc1:SolidFillOptions />
                                                                </optionsserializable>
                                                            </fillstyle>
                                                            <pointoptionsserializable>
                                                                <cc1:PointOptions>
                                                                </cc1:PointOptions>
                                                            </pointoptionsserializable>
                                                        </cc1:SideBySideBarSeriesLabel>
                                                    </labelserializable>
                                                    <legendpointoptionsserializable>
                                                        <cc1:PointOptions>
                                                        </cc1:PointOptions>
                                                    </legendpointoptionsserializable>
                                                </seriestemplate>
                                                <crosshairoptions>
                                                    <commonlabelpositionserializable>
                                                        <cc1:CrosshairMousePosition />
                                                    </commonlabelpositionserializable>
                                                </crosshairoptions>
                                                <tooltipoptions>
                                                    <tooltippositionserializable>
                                                        <cc1:ToolTipMousePosition />
                                                    </tooltippositionserializable>
                                                </tooltipoptions>
                                            </dxchartsui:WebChartControl>

                                            <div id="dsSubgrupo" runat="server">
                                                <asp:SqlDataSource ID="dsSubgrupoDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.uspBuscar_Subgrupo_porRegional" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" />
                                                        <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                                        <asp:SessionParameter Name="idGrupo" SessionField="sGRUPO" Type="Byte" />
                                                        <asp:SessionParameter Name="idSubgrupo" SessionField="sSUBGRUPO" Type="Byte" />
                                                        <asp:SessionParameter Name="idFilial" SessionField="sREGIONAL" Type="Byte" />
                                                    </SelectParameters>
                                                </asp:SqlDataSource>
                                            </div>

                                        <br />

                                        <%--LEGENDAS--%>

                                        <span class="label label-danger">Péssimo - Entre 0 e 70</span>
                                        <span class="label label-warning">Ruim - Entre 70,1 e 90</span>
                                        <span class="label label-info">Regular - Entre 90,1 e 95</span>
                                        <span class="label label-primary">Bom - Entre 95,1 e 97</span>                
                                        <span class="label label-success">Ótimo - Entre 97,1 e 100</span>

                                </ContentTemplate>
                            </asp:UpdatePanel>

                        </div>

               
               </div>

           </div>   


              <!-- /.row -->
            </div>
            <!-- ./box-body -->
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>






      <div class="row">
        <div class="col-md-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Total de Não-Conforme</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
               
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">

            <div class="row">
                <div class="row " style="margin-left: 25px">              
                    
                        <div id="div6">

        <asp:UpdatePanel ID="UpdatePanel3" runat="server">
            <ContentTemplate>

                        <br />

                    <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" >

                        <TabPages>
                            <dx:TabPage Text="Todas Filiais">
                                <TabStyle BackColor="#CCFFCC">
                                </TabStyle>
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl1" runat="server" SupportsDisabledAttribute="True">

                                       <br />

                                        <h5><asp:Label ID="lblNaoConforme" runat="server" Text="" Font-Bold="true" ></asp:Label></h5> 

                                        <dxchartsui:WebChartControl ID="graphNaoConforme" runat="server" AppearanceNameSerializable="Northern Lights" DataSourceID="dsNaoConforme" Height="450px" Width="1020px" PaletteName="Black and White">
                                            <diagramserializable>
                                                <cc1:XYDiagram>
                                                    <axisx visibleinpanesserializable="-1">
                                                        <label angle="90">
                                                        </label>
                                                        <range sidemarginsenabled="True" />
                                                    </axisx>
                                                    <axisy visibleinpanesserializable="-1" visible="False">
                                                        <range sidemarginsenabled="True" />
                                                    </axisy>
                                                </cc1:XYDiagram>
                                            </diagramserializable>
                                            <fillstyle>
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                            <legend Visibility="False"></legend>
                                            <seriesserializable>
                                                <cc1:Series LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="Nota" ArgumentDataMember="Descricao">
                                                    <viewserializable>
                                                        <cc1:SideBySideBarSeriesView Transparency="25">
                                                        </cc1:SideBySideBarSeriesView>
                                                    </viewserializable>
                                                    <labelserializable>
                                                        <cc1:SideBySideBarSeriesLabel EnableAntialiasing="True" LineVisible="True">
                                                            <fillstyle>
                                                                <optionsserializable>
                                                                    <cc1:SolidFillOptions />
                                                                </optionsserializable>
                                                            </fillstyle>
                                                            <pointoptionsserializable>
                                                                <cc1:PointOptions>
                                                                    <valuenumericoptions format="Number" precision="0" />
                                                                </cc1:PointOptions>
                                                            </pointoptionsserializable>
                                                        </cc1:SideBySideBarSeriesLabel>
                                                    </labelserializable>
                                                    <legendpointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <valuenumericoptions format="Number" precision="0" />
                                                        </cc1:PointOptions>
                                                    </legendpointoptionsserializable>
                                                </cc1:Series>
                                            </seriesserializable>
                                            <seriestemplate>
                                                <viewserializable>
                                                    <cc1:SideBySideBarSeriesView>
                                                    </cc1:SideBySideBarSeriesView>
                                                </viewserializable>
                                                <labelserializable>
                                                    <cc1:SideBySideBarSeriesLabel LineVisible="True">
                                                        <fillstyle>
                                                            <optionsserializable>
                                                                <cc1:SolidFillOptions />
                                                            </optionsserializable>
                                                        </fillstyle>
                                                        <pointoptionsserializable>
                                                            <cc1:PointOptions>
                                                            </cc1:PointOptions>
                                                        </pointoptionsserializable>
                                                    </cc1:SideBySideBarSeriesLabel>
                                                </labelserializable>
                                                <legendpointoptionsserializable>
                                                    <cc1:PointOptions>
                                                    </cc1:PointOptions>
                                                </legendpointoptionsserializable>
                                            </seriestemplate>
                                            <crosshairoptions>
                                                <commonlabelpositionserializable>
                                                    <cc1:CrosshairMousePosition />
                                                </commonlabelpositionserializable>
                                            </crosshairoptions>
                                            <tooltipoptions>
                                                <tooltippositionserializable>
                                                    <cc1:ToolTipMousePosition />
                                                </tooltippositionserializable>
                                            </tooltipoptions>
                                        </dxchartsui:WebChartControl>
                        
                                        <asp:SqlDataSource ID="dsNaoConforme" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.usp_BuscarQtdeNaoConforme_porRegional" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" />
                                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                                <asp:SessionParameter Name="idFilial" SessionField="sREGIONAL" Type="Byte" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>

                            <dx:TabPage Text="por Departamento" >
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl2" runat="server" SupportsDisabledAttribute="True">

                                        <h5><asp:Label ID="lblNaoConformePorDepartamento" runat="server" Text="" Font-Bold="true"></asp:Label></h5> 

                                        <div class="divGrupoLegenda">
                                            Grupo:
                                        </div>

                                        <div class="divGrupo">
                                            <dx:ASPxComboBox ID="cboGrupo_NA" runat="server" DataSourceID="dsGrupo" TextField="listaGrupo" Theme="Default" ValueField="idGrupo" Width="200px" AutoPostBack="True" DropDownRows="10">

                                            </dx:ASPxComboBox>
                                            
                                        </div>

                                        <div class="divSubgrupoLegenda">
                                            Subgrupo:
                                        </div>

                                        <div class="divSubgrupo">
                                            <dx:ASPxComboBox ID="cboSubgrupo_NA" runat="server" DataSourceID="dsSubgrupoLista_NA" TextField="descSubgrupo" Theme="Default" ValueField="idSubgrupo" Width="200px" ClientInstanceName="cboSubgrupo" AutoPostBack="True" DropDownRows="10">

                                            </dx:ASPxComboBox>
                                            <asp:SqlDataSource ID="dsSubgrupoLista_NA" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="SELECT [idSubgrupo], [descSubgrupo] FROM [Cadastro].[tblCadSubgrupo] WHERE ([idGrupo] = @idGrupo)">
                                                <SelectParameters>
                                                    <asp:ControlParameter ControlID="cboGrupo_NA" Name="idGrupo" PropertyName="Value" Type="Byte" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>

                                        </div>


                                        <dxchartsui:WebChartControl ID="WebChartControl2" runat="server" AppearanceNameSerializable="Northern Lights" DataSourceID="dsNaoConformeSubgrupo" Height="450px" Width="1020px" PaletteName="Black and White">
                                            <diagramserializable>
                                                <cc1:XYDiagram>
                                                    <axisx visibleinpanesserializable="-1">
                                                        <label angle="90">
                                                        </label>
                                                        <range sidemarginsenabled="True" />
                                                    </axisx>
                                                    <axisy visibleinpanesserializable="-1" visible="False">
                                                        <range sidemarginsenabled="True" />
                                                    </axisy>
                                                </cc1:XYDiagram>
                                            </diagramserializable>
                                            <fillstyle>
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                            <legend Visibility="False"></legend>
                                            <seriesserializable>
                                                <cc1:Series LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="Nota" ArgumentDataMember="Descricao">
                                                    <viewserializable>
                                                        <cc1:SideBySideBarSeriesView Transparency="25">
                                                        </cc1:SideBySideBarSeriesView>
                                                    </viewserializable>
                                                    <labelserializable>
                                                        <cc1:SideBySideBarSeriesLabel EnableAntialiasing="True" LineVisible="True">
                                                            <fillstyle>
                                                                <optionsserializable>
                                                                    <cc1:SolidFillOptions />
                                                                </optionsserializable>
                                                            </fillstyle>
                                                            <pointoptionsserializable>
                                                                <cc1:PointOptions>
                                                                    <valuenumericoptions format="Number" precision="0" />
                                                                </cc1:PointOptions>
                                                            </pointoptionsserializable>
                                                        </cc1:SideBySideBarSeriesLabel>
                                                    </labelserializable>
                                                    <legendpointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <valuenumericoptions format="Number" precision="0" />
                                                        </cc1:PointOptions>
                                                    </legendpointoptionsserializable>
                                                </cc1:Series>
                                            </seriesserializable>
                                            <seriestemplate>
                                                <viewserializable>
                                                    <cc1:SideBySideBarSeriesView>
                                                    </cc1:SideBySideBarSeriesView>
                                                </viewserializable>
                                                <labelserializable>
                                                    <cc1:SideBySideBarSeriesLabel LineVisible="True">
                                                        <fillstyle>
                                                            <optionsserializable>
                                                                <cc1:SolidFillOptions />
                                                            </optionsserializable>
                                                        </fillstyle>
                                                        <pointoptionsserializable>
                                                            <cc1:PointOptions>
                                                            </cc1:PointOptions>
                                                        </pointoptionsserializable>
                                                    </cc1:SideBySideBarSeriesLabel>
                                                </labelserializable>
                                                <legendpointoptionsserializable>
                                                    <cc1:PointOptions>
                                                    </cc1:PointOptions>
                                                </legendpointoptionsserializable>
                                            </seriestemplate>
                                            <crosshairoptions>
                                                <commonlabelpositionserializable>
                                                    <cc1:CrosshairMousePosition />
                                                </commonlabelpositionserializable>
                                            </crosshairoptions>
                                            <tooltipoptions>
                                                <tooltippositionserializable>
                                                    <cc1:ToolTipMousePosition />
                                                </tooltippositionserializable>
                                            </tooltipoptions>
                                        </dxchartsui:WebChartControl>
                        
                                        <asp:SqlDataSource ID="dsNaoConformeSubgrupo" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.uspBuscar_QtdeNaoConforme_Subgrupo_porRegional" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" />
                                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                                <asp:SessionParameter Name="idGrupo" SessionField="sGRUPO_NA" Type="Byte" />
                                                <asp:SessionParameter Name="idSubgrupo" SessionField="sSUBGRUPO_NA" Type="Byte" />
                                                <asp:SessionParameter Name="idFilial" SessionField="sREGIONAL" Type="Byte" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        

                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>

                            <dx:TabPage Text="por Filial" >
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl8" runat="server" SupportsDisabledAttribute="True">

                                        <h5><asp:Label ID="lblNaoConformePorFilial" runat="server" Text="" Font-Bold="true"></asp:Label></h5> 
                                        
                                        <div class="divGrupo">
                                            <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial_NA" />

                                        </div>

                                        <dxchartsui:WebChartControl ID="graphNaoConformeDepartamentoFilial" runat="server" AppearanceNameSerializable="Northern Lights" DataSourceID="dsQtdeNaoConforme_Subgrupo_porFilial" Height="450px" Width="1020px" PaletteName="Black and White">
                                            <diagramserializable>
                                                <cc1:XYDiagram>
                                                    <axisx visibleinpanesserializable="-1">
                                                        <label angle="90">
                                                        </label>
                                                        <range sidemarginsenabled="True" />
                                                    </axisx>
                                                    <axisy visibleinpanesserializable="-1" visible="False">
                                                        <range sidemarginsenabled="True" />
                                                    </axisy>
                                                </cc1:XYDiagram>
                                            </diagramserializable>
                                            <fillstyle>
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                            <legend Visibility="False"></legend>
                                            <seriesserializable>
                                                <cc1:Series LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="Nota" ArgumentDataMember="Descricao">
                                                    <viewserializable>
                                                        <cc1:SideBySideBarSeriesView Transparency="25">
                                                        </cc1:SideBySideBarSeriesView>
                                                    </viewserializable>
                                                    <labelserializable>
                                                        <cc1:SideBySideBarSeriesLabel EnableAntialiasing="True" LineVisible="True">
                                                            <fillstyle>
                                                                <optionsserializable>
                                                                    <cc1:SolidFillOptions />
                                                                </optionsserializable>
                                                            </fillstyle>
                                                            <pointoptionsserializable>
                                                                <cc1:PointOptions>
                                                                    <valuenumericoptions format="Number" precision="0" />
                                                                </cc1:PointOptions>
                                                            </pointoptionsserializable>
                                                        </cc1:SideBySideBarSeriesLabel>
                                                    </labelserializable>
                                                    <legendpointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <valuenumericoptions format="Number" precision="0" />
                                                        </cc1:PointOptions>
                                                    </legendpointoptionsserializable>
                                                </cc1:Series>
                                            </seriesserializable>
                                            <seriestemplate>
                                                <viewserializable>
                                                    <cc1:SideBySideBarSeriesView>
                                                    </cc1:SideBySideBarSeriesView>
                                                </viewserializable>
                                                <labelserializable>
                                                    <cc1:SideBySideBarSeriesLabel LineVisible="True">
                                                        <fillstyle>
                                                            <optionsserializable>
                                                                <cc1:SolidFillOptions />
                                                            </optionsserializable>
                                                        </fillstyle>
                                                        <pointoptionsserializable>
                                                            <cc1:PointOptions>
                                                            </cc1:PointOptions>
                                                        </pointoptionsserializable>
                                                    </cc1:SideBySideBarSeriesLabel>
                                                </labelserializable>
                                                <legendpointoptionsserializable>
                                                    <cc1:PointOptions>
                                                    </cc1:PointOptions>
                                                </legendpointoptionsserializable>
                                            </seriestemplate>
                                            <crosshairoptions>
                                                <commonlabelpositionserializable>
                                                    <cc1:CrosshairMousePosition />
                                                </commonlabelpositionserializable>
                                            </crosshairoptions>
                                            <tooltipoptions>
                                                <tooltippositionserializable>
                                                    <cc1:ToolTipMousePosition />
                                                </tooltippositionserializable>
                                            </tooltipoptions>
                                        </dxchartsui:WebChartControl>
                        
                                        <asp:SqlDataSource ID="dsQtdeNaoConforme_Subgrupo_porFilial" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.uspBuscar_QtdeNaoConforme_Subgrupo_porFilial" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" />
                                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL_NA" Type="Byte" />                                               
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                        

                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>


                        </TabPages>

                    </dx:ASPxPageControl>




   
<%--                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>--%>

            </ContentTemplate>
        </asp:UpdatePanel>

                        </div>

               
               </div>

           </div>   


              <!-- /.row -->
            </div>
            <!-- ./box-body -->
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>



       <%-- NOTAS DAS LOJAS--%>

        <div class="row">
        <div class="col-md-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Notas do Check-List - por Mes e Quadrimestre</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
               
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">

            <div class="row">
                <div class="row " style="margin-left: 25px">              
                    
                        <div id="div1">

        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>

                      
                <dx:ASPxGridView ID="grid_Notas" runat="server" AutoGenerateColumns="False" DataSourceID="dsGrid_Nota" EnableTheming="True" Theme="SoftOrange" KeyFieldName="idFilial">

                    <Columns>
                        <dx:GridViewDataTextColumn Caption="Filial" FieldName="Descricao" VisibleIndex="0">
                            <HeaderStyle BackColor="#999999" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Jan" FieldName="mes1" VisibleIndex="1" Width="55px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Fev " FieldName="mes2" VisibleIndex="2" Width="55px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Mar" FieldName="mes3" VisibleIndex="3" Width="55px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Abr" FieldName="mes4" VisibleIndex="4" Width="55px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="1º Quad" FieldName="mes1Q" VisibleIndex="5" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle BackColor="#666666" />
                            <CellStyle Font-Bold="True">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Mai" FieldName="mes5" VisibleIndex="6" Width="55px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Jun" FieldName="mes6" VisibleIndex="7" Width="55px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Jul" FieldName="mes7" VisibleIndex="8" Width="55px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Ago" FieldName="mes8" VisibleIndex="9" Width="55px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="2º Quad" FieldName="mes2Q" VisibleIndex="10" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle BackColor="#666666" />
                            <CellStyle Font-Bold="True">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Set" FieldName="mes9" VisibleIndex="11" Width="55px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Out" FieldName="mes10" VisibleIndex="12" Width="55px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Nov" FieldName="mes11" VisibleIndex="13" Width="55px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="Dez" FieldName="mes12" VisibleIndex="14" Width="55px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn Caption="3º Quad" FieldName="mes3Q" VisibleIndex="15" Width="70px">
                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                            </PropertiesTextEdit>
                            <HeaderStyle BackColor="#666666" />
                            <CellStyle Font-Bold="True">
                            </CellStyle>
                        </dx:GridViewDataTextColumn>
                    </Columns>
                    <SettingsBehavior AllowFocusedRow="True" />
                    <SettingsPager Mode="ShowAllRecords">
                    </SettingsPager>
                    <Styles>
                        <Header HorizontalAlign="Center">
                        </Header>
                        <AlternatingRow BackColor="#E2E2E2">
                        </AlternatingRow>
                    </Styles>

                </dx:ASPxGridView>


                  <br />
   
                        <asp:SqlDataSource ID="dsGrid_Nota" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="uspBuscarNotaLoja_Mes_a_Mes_Regional" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="idRegional" SessionField="sREGIONAL" Type="Byte" />
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            </SelectParameters>
                        </asp:SqlDataSource>



   
<%--                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>--%>

            </ContentTemplate>
        </asp:UpdatePanel>

                        </div>

               
               </div>

           </div>   


              <!-- /.row -->
            </div>
            <!-- ./box-body -->
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>












        <asp:Label ID="lblError" runat="server" Text="Label"  ForeColor="Red" Visible="False"></asp:Label>


 </div> 
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
</asp:Content>

