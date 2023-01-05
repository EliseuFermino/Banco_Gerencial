<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="DashboardHSA.aspx.vb" Inherits="MemberPages_Checklist_DashboardHSA" %>

<%@ Register Assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGauges" TagPrefix="dx" %>

<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Linear" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Circular" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.State" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web.ASPxGauges.Gauges.Digital" tagprefix="dx" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>






<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>



<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>

<%@ Register Src="~/Controles/wucSize.ascx" TagPrefix="uc1" TagName="wucSize" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>
<%@ Register Src="~/Controles/wucAnoMes.ascx" TagPrefix="uc1" TagName="wucAnoMes" %>



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

        #divFilial {
            clear: both;
            float: left;
            margin-left: 2px;
            margin-top: 5px;
        } 

        #divPeriodo {
           
            float: left;
            margin-left: 10px;   
            margin-top: 5px;        
        }   
        
        #divGrupoSubgrupo {
            float: left;
            margin-left: 10px;
            margin-top: 4px;
        }     

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
             margin-top: 1px;
        }

        #divSize {            
            float: left;  
             margin-top: 2px;         
        }

        #divBotaoExcel {            
            float: left;
            margin-left: 10px;
        }

        #divDados {
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
        Dashboard - Higiene e Saúde Alimentar (HSA)
        <small>Recursos Humanos</small>
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
              <h3 class="box-title">Pontuação - Empresa e Melhores e Piores Lojas</h3>

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
              
              <h4>Empresa</h4>
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
              <h3 class="box-title">Pontuação - por Tipo de Loja e Regional</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
               
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">

            <div class="row">
                <div class="row " style="margin-left: 25px">              
                    

                    <dx:ASPxPageControl ID="pcDados" runat="server" ActiveTabIndex="0">

                        <TabPages>

                            <dx:TabPage Text="Todas Filiais">
                                <TabStyle BackColor="#CCFFCC">
                                </TabStyle>
                                <ContentCollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">

                                        <h5><asp:Label ID="lblTodasFiliais" runat="server" Text=""></asp:Label></h5> 

                                        <dxchartsui:WebChartControl ID="graph_PontuacaoTodas" runat="server" AppearanceNameSerializable="Nature Colors" DataSourceID="dsTodas" Height="450px" Width="990px">
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
                                                <cc1:Series ArgumentDataMember="Descricao" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="Nota">
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

                                        <div id="div1" runat="server">
                                            <asp:SqlDataSource ID="dsTodas" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.usp_BuscarPontuacaoTotal_HSA" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" />
                                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>



                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>

                            <dx:TabPage Text="Super">
                                <ContentCollection>
                                    <dx:ContentControl runat="server" SupportsDisabledAttribute="True">

                                        <h5><asp:Label ID="lblSuper" runat="server" Text=""></asp:Label></h5> 

                                        <dxchartsui:WebChartControl ID="graph_PontuacaoTotal" runat="server" AppearanceNameSerializable="Nature Colors" DataSourceID="dsPontuacaoTotal" Height="450px" Width="990px">
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

                                        <div id="divGraph_PontuacaoTotal_Super" runat="server">
                                            <asp:SqlDataSource ID="dsPontuacaoTotal" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.usp_BuscarPontuacaoTotal_Super_HSA" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" />
                                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>

                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>

                            <dx:TabPage Text="Super E">
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl3" runat="server" SupportsDisabledAttribute="True">

                                        <h5><asp:Label ID="lblSuperE" runat="server" Text=""></asp:Label></h5> 


                                            <div id="divGraph_PontuacaoTotal_SuperE" runat="server">

                                                    <dxchartsui:WebChartControl ID="graph_SuperE" runat="server" DataSourceID="dsPontuacaoSuperE" AppearanceNameSerializable="Nature Colors" Height="450px" Width="990px">
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

                                                    <asp:SqlDataSource ID="dsPontuacaoSuperE" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.usp_BuscarPontuacaoTotal_SuperE_HSA" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                    <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" />
                                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>

                                            </div>

                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>


                            <dx:TabPage Text="Hiper">
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl4" runat="server" SupportsDisabledAttribute="True">

                                        <h5><asp:Label ID="lblHiper" runat="server" Text=""></asp:Label></h5> 


                                        <div id="divGraph_PontuacaoTotal_Hiper">
                                            <dxchartsui:WebChartControl ID="graph_Hiper" runat="server" DataSourceID="dsPontuacaoHiper" AppearanceNameSerializable="Nature Colors" Height="450px" Width="990px">
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
                                            <asp:SqlDataSource ID="dsPontuacaoHiper" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.usp_BuscarPontuacaoTotal_Hiper_HSA" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" />
                                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>

                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>


                            <%--REGIONAL--%>

                            <dx:TabPage Text="Regional Edison">
                                <TabStyle BackColor="#FFFFCC">
                                </TabStyle>
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl5" runat="server" SupportsDisabledAttribute="True">

                                        <h5><asp:Label ID="lblRegional205" runat="server" Text=""></asp:Label></h5> 
                                        
                                        <div id="div2">
                                            <dxchartsui:WebChartControl ID="graph_Regional205" runat="server" DataSourceID="dsPontuacaoRegional205" AppearanceNameSerializable="Nature Colors" Height="450px" Width="990px">
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
                                            <asp:SqlDataSource ID="dsPontuacaoRegional205" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.usp_BuscarPontuacaoTotal_Regional_HSA" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" />
                                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                                    <asp:SessionParameter Name="idRegional"  Type="Byte" DefaultValue="205" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>

                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>


                            <dx:TabPage Text="Regional João">
                                <TabStyle BackColor="#FFFFCC">
                                </TabStyle>
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl6" runat="server" SupportsDisabledAttribute="True">

                                        <h5><asp:Label ID="lblRegional214" runat="server" Text=""></asp:Label></h5> 


                                        <div id="div3">
                                            <dxchartsui:WebChartControl ID="graph_Regional214" runat="server" DataSourceID="dsPontuacaoRegional214" AppearanceNameSerializable="Nature Colors" Height="450px" Width="990px">
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
                                            <asp:SqlDataSource ID="dsPontuacaoRegional214" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.usp_BuscarPontuacaoTotal_Regional_HSA" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" />
                                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                                    <asp:SessionParameter Name="idRegional"  Type="Byte" DefaultValue="214" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>

                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>


                            <dx:TabPage Text="Regional Mauricio">
                                <TabStyle BackColor="#FFFFCC">
                                </TabStyle>
                                <ContentCollection>
                                    <dx:ContentControl ID="ContentControl7" runat="server" SupportsDisabledAttribute="True">

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
                                            <asp:SqlDataSource ID="dsPontuacaoRegional206" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.usp_BuscarPontuacaoTotal_Regional_HSA" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" />
                                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                                    <asp:SessionParameter Name="idRegional"  Type="Byte" DefaultValue="206" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>

                                    </dx:ContentControl>
                                </ContentCollection>
                            </dx:TabPage>
                            
                        </TabPages>

                    </dx:ASPxPageControl>

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
                                    
                                            <h5><asp:Label ID="lblDepartamento" runat="server" Text="" Font-Bold="true" ></asp:Label></h5> 

                                            <div class="divGrupoLegenda" >
                                                Grupo:
                                            </div>

                                            <div class="divGrupo" >
                                                <dx:ASPxComboBox ID="cboGrupo" runat="server" DataSourceID="dsGrupo" TextField="listaGrupo" Theme="SoftOrange" ValueField="idGrupo" Width="200px" AutoPostBack="True">

                                                    <ClientSideEvents SelectedIndexChanged="function(s, e) {
	
	
                    }" />

                                                </dx:ASPxComboBox>
                                                <asp:SqlDataSource ID="dsGrupo" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="SELECT [idGrupo], [listaGrupo] FROM [Cadastro].[tblCadGrupo] WHERE idGrupo BETWEEN 8 AND 15 ORDER BY [idGrupo]"></asp:SqlDataSource>
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
                                                <asp:SqlDataSource ID="dsSubgrupoDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.uspBuscar_Subgrupo" SelectCommandType="StoredProcedure">
                                                    <SelectParameters>
                                                        <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" />
                                                        <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                                        <asp:SessionParameter Name="idGrupo" SessionField="sGRUPO" Type="Byte" />
                                                        <asp:SessionParameter Name="idSubgrupo" SessionField="sSUBGRUPO" Type="Byte" />
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
                        
                                        <asp:SqlDataSource ID="dsNaoConforme" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.usp_BuscarQtdeNaoConforme_HSA" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" />
                                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
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
                        
                                        <asp:SqlDataSource ID="dsNaoConformeSubgrupo" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.uspBuscar_QtdeNaoConforme_Subgrupo" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" />
                                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                                <asp:SessionParameter Name="idGrupo" SessionField="sGRUPO_NA" Type="Byte" />
                                                <asp:SessionParameter Name="idSubgrupo" SessionField="sSUBGRUPO_NA" Type="Byte" />
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
                        
                                        <asp:SqlDataSource ID="dsQtdeNaoConforme_Subgrupo_porFilial" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.uspBuscar_QtdeNaoConforme_Subgrupo_porFilial_HSA" SelectCommandType="StoredProcedure">
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
                    
                        

                         <div id="divFilial">
                                <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
                            </div>

                            <div id="divPeriodo">
                                <uc1:wucAnoMes runat="server" id="cboAnoMes" />
                            </div>

                            <div id="divGrupoSubgrupo">
                                <dx:ASPxCheckBox ID="chkGrupoSub" runat="server" Theme="DevEx" Text="por Grupo" ForeColor="Blue" CheckState="Unchecked" >
                                    <ClientSideEvents CheckedChanged="function(s, e) {
	                        cbPanel.PerformCallback();
                            cbPanelNaoConforme.PerformCallback();
                        }" />
                                </dx:ASPxCheckBox>
                            </div>

                            <div id="divBotaoAtualizar">
                                <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="Metropolis">
                                    <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback(); cbPanelNaoConforme.PerformCallback();}" />
                                </dx:ASPxButton>
                            </div>

                            <div id="divSize">
                                <uc1:wucSize runat="server" ID="cboSize" />
                            </div>

                            <div id="divBotaoExcel">
                                <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="grid" />
                            </div>

<div id="divDados">

                        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
            <PanelCollection>
                <dx:PanelContent>


                    <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="dsDados" Width="1000px" KeyFieldName="descPergunta">
                        <TotalSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Conforme" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Validos" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Nota" SummaryType="Custom" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia1" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia2" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia3" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia4" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia5" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia6" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia7" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia8" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia9" SummaryType="Custom" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia10" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia11" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia12" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia13" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia14" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia15" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia16" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia17" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia18" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia19" SummaryType="Custom" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia20" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia21" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia22" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia23" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia24" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia25" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia26" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia27" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia28" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia29" SummaryType="Custom" />

                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia30" SummaryType="Custom" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Dia31" SummaryType="Custom" />

                        </TotalSummary>
                        <GroupSummary>
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Conforme" ShowInGroupFooterColumn="Conforme" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="Validos" ShowInGroupFooterColumn="Validos" SummaryType="Sum" />
                            <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="Nota" ShowInGroupFooterColumn="Nota" SummaryType="Custom" />
                        </GroupSummary>
                        <Columns>
                            <dx:GridViewCommandColumn ShowInCustomizationForm="True" Visible="False" VisibleIndex="0" ShowClearFilterButton="True"/>
                            <dx:GridViewDataTextColumn FieldName="listaGrupo" ShowInCustomizationForm="True" VisibleIndex="33" Width="115px" Caption="Grupo" Visible="True" >
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="listaSubgrupo" ShowInCustomizationForm="True" VisibleIndex="34" Width="115px" Caption="Sub-grupo" Visible="true" >
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="descPergunta" ShowInCustomizationForm="True" VisibleIndex="1" Width="260px" Caption="Questão" FixedStyle="Left">
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                <CellStyle Wrap="False">
                                </CellStyle>
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewBandColumn Caption="Pontuação" ShowInCustomizationForm="True" VisibleIndex="2" FixedStyle="Left">
                                <Columns>
                                    <dx:GridViewDataTextColumn FieldName="Conforme" ShowInCustomizationForm="True" VisibleIndex="0" Width="65px">
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle Font-Bold="True" ForeColor="Blue" HorizontalAlign="Center">
                                        </CellStyle>
                                        <FooterCellStyle Font-Bold="True" ForeColor="Blue" HorizontalAlign="Center">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Validos" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle Font-Bold="True" ForeColor="#009900" HorizontalAlign="Center">
                                        </CellStyle>
                                        <FooterCellStyle Font-Bold="True" ForeColor="#009900" HorizontalAlign="Center">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                    <dx:GridViewDataTextColumn FieldName="Nota" ShowInCustomizationForm="True" VisibleIndex="2" Width="60px">
                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                        </PropertiesTextEdit>
                                        <Settings AllowAutoFilter="False" />
                                        <CellStyle Font-Bold="True" HorizontalAlign="Center">
                                        </CellStyle>
                                        <FooterCellStyle Font-Bold="True" HorizontalAlign="Center">
                                        </FooterCellStyle>
                                    </dx:GridViewDataTextColumn>
                                </Columns>
                            </dx:GridViewBandColumn>


                            <dx:GridViewDataCheckColumn FieldName="Dia1" ShowInCustomizationForm="True" VisibleIndex="3" Caption="Seg" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Ter" FieldName="Dia2" ShowInCustomizationForm="True" ToolTip="Terça-Feira" VisibleIndex="4" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Qua" FieldName="Dia3" ShowInCustomizationForm="True" ToolTip="Quarta-Feira" VisibleIndex="5" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Qui" FieldName="Dia4" ShowInCustomizationForm="True" ToolTip="Quinta-Feira" VisibleIndex="6" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Sex" FieldName="Dia5" ShowInCustomizationForm="True" ToolTip="Sexta-Feira" VisibleIndex="7" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Sáb" FieldName="Dia6" ShowInCustomizationForm="True" ToolTip="Sábado" VisibleIndex="8" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>

                            <dx:GridViewDataCheckColumn FieldName="Dia7" ShowInCustomizationForm="True" VisibleIndex="9" Caption="Seg" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Ter" FieldName="Dia8" ShowInCustomizationForm="True" ToolTip="Terça-Feira" VisibleIndex="10" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Qua" FieldName="Dia9" ShowInCustomizationForm="True" ToolTip="Quarta-Feira" VisibleIndex="11" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Qui" FieldName="Dia10" ShowInCustomizationForm="True" ToolTip="Quinta-Feira" VisibleIndex="12" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Sex" FieldName="Dia11" ShowInCustomizationForm="True" ToolTip="Sexta-Feira" VisibleIndex="13" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Sáb" FieldName="Dia12" ShowInCustomizationForm="True" ToolTip="Sábado" VisibleIndex="14" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>

                            <dx:GridViewDataCheckColumn FieldName="Dia13" ShowInCustomizationForm="True" VisibleIndex="15" Caption="Seg" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Ter" FieldName="Dia14" ShowInCustomizationForm="True" ToolTip="Terça-Feira" VisibleIndex="16" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Qua" FieldName="Dia15" ShowInCustomizationForm="True" ToolTip="Quarta-Feira" VisibleIndex="17" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Qui" FieldName="Dia16" ShowInCustomizationForm="True" ToolTip="Quinta-Feira" VisibleIndex="18" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Sex" FieldName="Dia17" ShowInCustomizationForm="True" ToolTip="Sexta-Feira" VisibleIndex="19" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Sáb" FieldName="Dia18" ShowInCustomizationForm="True" ToolTip="Sábado" VisibleIndex="20" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>

                            <dx:GridViewDataCheckColumn FieldName="Dia19" ShowInCustomizationForm="True" VisibleIndex="21" Caption="Seg" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Ter" FieldName="Dia20" ShowInCustomizationForm="True" ToolTip="Terça-Feira" VisibleIndex="22" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Qua" FieldName="Dia21" ShowInCustomizationForm="True" ToolTip="Quarta-Feira" VisibleIndex="23" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Qui" FieldName="Dia22" ShowInCustomizationForm="True" ToolTip="Quinta-Feira" VisibleIndex="24" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Sex" FieldName="Dia23" ShowInCustomizationForm="True" ToolTip="Sexta-Feira" VisibleIndex="25" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Sáb" FieldName="Dia24" ShowInCustomizationForm="True" ToolTip="Sábado" VisibleIndex="26" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>

                            <dx:GridViewDataCheckColumn Caption="Sáb" FieldName="Dia25" ShowInCustomizationForm="True" ToolTip="Sábado" VisibleIndex="27" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Sáb" FieldName="Dia26" ShowInCustomizationForm="True" ToolTip="Sábado" VisibleIndex="28" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Sáb" FieldName="Dia27" ShowInCustomizationForm="True" ToolTip="Sábado" VisibleIndex="29" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            <dx:GridViewDataCheckColumn Caption="Sáb" FieldName="Dia28" ShowInCustomizationForm="True" ToolTip="Sábado" VisibleIndex="30" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>
                            
                            <dx:GridViewDataCheckColumn Caption="Sáb" FieldName="Dia29" ShowInCustomizationForm="True" ToolTip="Sábado" VisibleIndex="31" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>

                            <dx:GridViewDataCheckColumn Caption="Sáb" FieldName="Dia30" ShowInCustomizationForm="True" ToolTip="Sábado" VisibleIndex="32" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>

                           <dx:GridViewDataCheckColumn Caption="Sáb" FieldName="Dia31" ShowInCustomizationForm="True" ToolTip="Sábado" VisibleIndex="32" Width="50px">
                                <PropertiesCheckEdit>
                                    <DisplayImageChecked Height="16px" Url="~/image/check_16.png" Width="16px">
                                    </DisplayImageChecked>
                                    <DisplayImageUnchecked Height="16px" Url="~/image/check_no.png" Width="16px">
                                    </DisplayImageUnchecked>
                                    <DisplayImageUndefined Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageUndefined>
                                    <DisplayImageGrayed Height="16px" Url="~/image/check_isnul.png" Width="16px">
                                    </DisplayImageGrayed>
                                </PropertiesCheckEdit>
                                <Settings AllowAutoFilter="True" AutoFilterCondition="Equals" />
                            </dx:GridViewDataCheckColumn>



                            <dx:GridViewDataTextColumn FieldName="idGrupo" ShowInCustomizationForm="True" Visible="False" VisibleIndex="32">
                            </dx:GridViewDataTextColumn>



                        </Columns>
                        <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                        <SettingsPager Mode="ShowAllRecords">
                        </SettingsPager>
                        <Settings VerticalScrollableHeight="500" VerticalScrollBarMode="Auto" HorizontalScrollBarMode="Auto" ShowFilterRow="True" ShowGroupFooter="VisibleAlways" ShowGroupPanel="True" ShowFooter="True" />
                        <SettingsText GroupPanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
                        <Styles>
                            <Header HorizontalAlign="Center">
                            </Header>
                            <AlternatingRow BackColor="#F0F0F0">
                            </AlternatingRow>
                            <FocusedRow BackColor="Yellow" ForeColor="Blue">
                            </FocusedRow>
                            <GroupFooter Font-Bold="True">
                            </GroupFooter>
                        </Styles>
                    </dx:ASPxGridView>
                  
                        <%--Arraste seu controle aqui --%>                         
                    
            		<asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.uspMapaSemanalLoja_HSA" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" />
                            <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>

                      </div>

               
               </div>

           </div>   


            </div>
       
          </div>
         
        </div>
       
      </div>
       










        <asp:Label ID="lblError" runat="server" Text="Label"  ForeColor="Red"></asp:Label>


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

