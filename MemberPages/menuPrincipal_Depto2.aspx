<%@ Page Title="Analise Seções do Departamento 2 - Pereciveis" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="menuPrincipal_Depto2.aspx.vb" Inherits="MemberPages_menuPrincipal_Depto2" %>

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


    <div class="container-fluid">

    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
          Dashboard - Loja
        <small>Controladoria</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Principal</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>

        <div id="divFilial" class="row">
            <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" AutoPostBack="False"  />
        </div>

        <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="True" Theme="Metropolis">
            
        </dx:ASPxButton>
        </div>

      <section style="clear:both ">
      
      <div class="row">
        <div class="col-md-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title"><span class="glyphicon glyphicon-shopping-cart"></span> Numero de Clientes &nbsp e &nbsp <span class="glyphicon glyphicon-list-alt"></span> Ticket Médio - Comparativo com o Ano Anterior - Todas as Seções do Departamento 2 - Pereciveis </h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
               
              </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">

            <div class="row">
                

				<div class="col-md-12">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="glyphicon glyphicon-shopping-cart"></span> Numero de Clientes &nbsp e &nbsp <span class="glyphicon glyphicon-list-alt"></span> Ticket Médio - Secao 11 - Leite</h4>

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
								
                                <dxchartsui:WebChartControl ID="graph_Secao11" runat="server" DataSourceID="dsClientesNumerosSecao11" Height="550px" Width="900px" AppearanceNameSerializable="Nature Colors" CrosshairEnabled="True">
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="-1" minorcount="1" visible="False">
                                                <range sidemarginsenabled="True" />
                                                <gridlines minorcolor="LightSteelBlue" minorvisible="True">
                                                    <minorlinestyle dashstyle="Dash" />
                                                </gridlines>
                                            </axisx>
                                            <axisy visibleinpanesserializable="-1" title-text="Número de Clientes" title-visible="True">
                                                <constantlines>
                                                    <cc1:ConstantLine AxisValueSerializable="1" Name="Constant Line 1" Visible="False">
                                                    </cc1:ConstantLine>
                                                </constantlines>
                                                <label visible="False">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                            <secondaryaxesx>
                                                <cc1:SecondaryAxisX Alignment="Near" AxisID="0" DateTimeScaleMode="Manual" Name="Secondary AxisX 1" VisibleInPanesSerializable="0" MinorCount="1">
                                                    <range sidemarginsenabled="True" />
                                                    <gridlines minorcolor="LightSteelBlue" minorvisible="True">
                                                        <minorlinestyle dashstyle="Dash" />
                                                    </gridlines>
                                                </cc1:SecondaryAxisX>
                                            </secondaryaxesx>
                                            <secondaryaxesy>
                                                <cc1:SecondaryAxisY AxisID="0" Name="Secondary AxisY 1" VisibleInPanesSerializable="0" Alignment="Near" Title-Text="Ticket Médio" Title-Visible="True">
                                                    <label visible="False">
                                                    </label>
                                                    <range sidemarginsenabled="True" />
                                                </cc1:SecondaryAxisY>
                                            </secondaryaxesy>
                                            <panes>
                                                <cc1:XYDiagramPane Name="Pane_Ticket_Medio" PaneID="0" >
                                                </cc1:XYDiagramPane>
                                            </panes>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
    <FillStyle><OptionsSerializable>
    <cc1:SolidFillOptions></cc1:SolidFillOptions>
    </OptionsSerializable>
    </FillStyle>

                                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="6" maxhorizontalpercentage="90">
                                        <margins bottom="0" top="0" />
                                    </legend>
                                    <seriesserializable>
                                        <cc1:Series ArgumentDataMember="descMes" Name="2021" ValueDataMembersSerializable="numClientesAA" LabelsVisibility="True" LegendTextPattern="{V:c2}">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Transparency="85" Color="170, 204, 178, 98">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="TopInside" TextPattern="{V:n0}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Number" precision="0" />
                                                            <valuenumericoptions format="Number" precision="0" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" precision="0" />
                                                    <valuenumericoptions format="Number" precision="0" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" Name="2022" ValueDataMembersSerializable="numClientes" LabelsVisibility="True" LegendTextPattern="{V:c2}">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Transparency="51" Color="204, 105, 193, 85">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" TextPattern="{V:n0}">
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
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="Diferença" ValueDataMembersSerializable="Dif" LegendTextPattern="{V:c2}">
                                            <viewserializable>
                                                <cc1:LineSeriesView Color="Brown" MarkerVisibility="True">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions size="5" BorderVisible="True">
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" TextPattern="{V:n0}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Number" precision="0" />
                                                            <valuenumericoptions format="Number" precision="0" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:PointSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" precision="0" />
                                                    <valuenumericoptions format="Number" precision="0" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_2016" ShowInLegend="False" ValueDataMembersSerializable="vlrTicketMedioAA">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="170, 204, 178, 98" PaneName="Pane_Ticket_Medio" Transparency="85">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="TopInside" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Currency" />
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Currency" />
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_2017" ShowInLegend="False" ValueDataMembersSerializable="vlrTicketMedioAT">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="204, 105, 193, 85" PaneName="Pane_Ticket_Medio" Transparency="51">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_Diferença" ShowInLegend="False" ValueDataMembersSerializable="Dif_TM">
                                            <viewserializable>
                                                <cc1:LineSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="Brown" PaneName="Pane_Ticket_Medio">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions color="0, 128, 0" size="5"   BorderVisible="True">
                                                        <fillstyle fillmode="Solid">
                                                            <optionsserializable>
                                                                <cc1:SolidFillOptions />
                                                            </optionsserializable>
                                                        </fillstyle>
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:PointSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                    </seriesserializable>

    <SeriesTemplate><ViewSerializable>
        <cc1:SideBySideBarSeriesView>
        </cc1:SideBySideBarSeriesView>
    </ViewSerializable>
    <LabelSerializable>
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
                                <asp:SqlDataSource ID="dsClientesNumerosSecao11" runat="server" ConnectionString="<%$ ConnectionStrings:DW_VendasConnectionString %>" SelectCommand="uspBuscarNumeroDeClientes_12Meses_Secao" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                        <asp:SessionParameter Name="idSecao" DefaultValue="11" Type="Byte" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

								
							</div>
						</div>
					</div>
				</div><!--  /Secao 11 -->

				<div class="col-md-12">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="glyphicon glyphicon-shopping-cart"></span> Numero de Clientes &nbsp e &nbsp <span class="glyphicon glyphicon-list-alt"></span> Ticket Médio - Secao 12 - Fiambreria</h4>

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
								
                                <dxchartsui:WebChartControl ID="graph_Secao12" runat="server" DataSourceID="dsClientesNumerosSecao12" Height="550px" Width="900px" AppearanceNameSerializable="Nature Colors" CrosshairEnabled="True">
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="-1" minorcount="1" visible="False">
                                                <range sidemarginsenabled="True" />
                                                <gridlines minorcolor="LightSteelBlue" minorvisible="True">
                                                    <minorlinestyle dashstyle="Dash" />
                                                </gridlines>
                                            </axisx>
                                            <axisy visibleinpanesserializable="-1" title-text="Número de Clientes" title-visible="True">
                                                <constantlines>
                                                    <cc1:ConstantLine AxisValueSerializable="1" Name="Constant Line 1" Visible="False">
                                                    </cc1:ConstantLine>
                                                </constantlines>
                                                <label visible="False">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                            <secondaryaxesx>
                                                <cc1:SecondaryAxisX Alignment="Near" AxisID="0" DateTimeScaleMode="Manual" Name="Secondary AxisX 1" VisibleInPanesSerializable="0" MinorCount="1">
                                                    <range sidemarginsenabled="True" />
                                                    <gridlines minorcolor="LightSteelBlue" minorvisible="True">
                                                        <minorlinestyle dashstyle="Dash" />
                                                    </gridlines>
                                                </cc1:SecondaryAxisX>
                                            </secondaryaxesx>
                                            <secondaryaxesy>
                                                <cc1:SecondaryAxisY AxisID="0" Name="Secondary AxisY 1" VisibleInPanesSerializable="0" Alignment="Near" Title-Text="Ticket Médio" Title-Visible="True">
                                                    <label visible="False">
                                                    </label>
                                                    <range sidemarginsenabled="True" />
                                                </cc1:SecondaryAxisY>
                                            </secondaryaxesy>
                                            <panes>
                                                <cc1:XYDiagramPane Name="Pane_Ticket_Medio" PaneID="0" >
                                                </cc1:XYDiagramPane>
                                            </panes>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
    <FillStyle><OptionsSerializable>
    <cc1:SolidFillOptions></cc1:SolidFillOptions>
    </OptionsSerializable>
    </FillStyle>

                                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="6" maxhorizontalpercentage="90">
                                        <margins bottom="0" top="0" />
                                    </legend>
                                    <seriesserializable>
                                        <cc1:Series ArgumentDataMember="descMes" Name="2021" ValueDataMembersSerializable="numClientesAA" LabelsVisibility="True">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Transparency="85" Color="170, 204, 178, 98">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="TopInside" TextPattern="{V:n0}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Number" precision="0" />
                                                            <valuenumericoptions format="Number" precision="0" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" precision="0" />
                                                    <valuenumericoptions format="Number" precision="0" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" Name="2022" ValueDataMembersSerializable="numClientes" LabelsVisibility="True">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Transparency="51" Color="204, 105, 193, 85">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" TextPattern="{V:n0}">
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
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="Diferença" ValueDataMembersSerializable="Dif">
                                            <viewserializable>
                                                <cc1:LineSeriesView Color="Brown" MarkerVisibility="True">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions size="5" BorderVisible="True">
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" TextPattern="{V:n0}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Number" precision="0" />
                                                            <valuenumericoptions format="Number" precision="0" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:PointSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" precision="0" />
                                                    <valuenumericoptions format="Number" precision="0" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_2016" ShowInLegend="False" ValueDataMembersSerializable="vlrTicketMedioAA">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="170, 204, 178, 98" PaneName="Pane_Ticket_Medio" Transparency="85">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="TopInside" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Currency" />
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Currency" />
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_2017" ShowInLegend="False" ValueDataMembersSerializable="vlrTicketMedioAT">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="204, 105, 193, 85" PaneName="Pane_Ticket_Medio" Transparency="51">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_Diferença" ShowInLegend="False" ValueDataMembersSerializable="Dif_TM">
                                            <viewserializable>
                                                <cc1:LineSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="Brown" PaneName="Pane_Ticket_Medio">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions color="0, 128, 0" size="5" BorderVisible="True">
                                                        <fillstyle fillmode="Solid">
                                                            <optionsserializable>
                                                                <cc1:SolidFillOptions />
                                                            </optionsserializable>
                                                        </fillstyle>
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:PointSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                    </seriesserializable>

    <SeriesTemplate><ViewSerializable>
        <cc1:SideBySideBarSeriesView>
        </cc1:SideBySideBarSeriesView>
    </ViewSerializable>
    <LabelSerializable>
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
                                <asp:SqlDataSource ID="dsClientesNumerosSecao12" runat="server" ConnectionString="<%$ ConnectionStrings:DW_VendasConnectionString %>" SelectCommand="uspBuscarNumeroDeClientes_12Meses_Secao" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                        <asp:SessionParameter Name="idSecao" DefaultValue="12" Type="Byte" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

								
							</div>
						</div>
					</div>
				</div><!--  /Secao 12 -->

				<div class="col-md-12">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="glyphicon glyphicon-shopping-cart"></span> Numero de Clientes &nbsp e &nbsp <span class="glyphicon glyphicon-list-alt"></span> Ticket Médio - Secao 13 - Rotisseria</h4>

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
								
                                <dxchartsui:WebChartControl ID="graph_Secao13" runat="server" DataSourceID="dsClientesNumerosSecao13" Height="550px" Width="900px" AppearanceNameSerializable="Nature Colors" CrosshairEnabled="True">
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="-1" minorcount="1" visible="False">
                                                <range sidemarginsenabled="True" />
                                                <gridlines minorcolor="LightSteelBlue" minorvisible="True">
                                                    <minorlinestyle dashstyle="Dash" />
                                                </gridlines>
                                            </axisx>
                                            <axisy visibleinpanesserializable="-1" title-text="Número de Clientes" title-visible="True">
                                                <constantlines>
                                                    <cc1:ConstantLine AxisValueSerializable="1" Name="Constant Line 1" Visible="False">
                                                    </cc1:ConstantLine>
                                                </constantlines>
                                                <label visible="False">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                            <secondaryaxesx>
                                                <cc1:SecondaryAxisX Alignment="Near" AxisID="0" DateTimeScaleMode="Manual" Name="Secondary AxisX 1" VisibleInPanesSerializable="0" MinorCount="1">
                                                    <range sidemarginsenabled="True" />
                                                    <gridlines minorcolor="LightSteelBlue" minorvisible="True">
                                                        <minorlinestyle dashstyle="Dash" />
                                                    </gridlines>
                                                </cc1:SecondaryAxisX>
                                            </secondaryaxesx>
                                            <secondaryaxesy>
                                                <cc1:SecondaryAxisY AxisID="0" Name="Secondary AxisY 1" VisibleInPanesSerializable="0" Alignment="Near" Title-Text="Ticket Médio" Title-Visible="True">
                                                    <label visible="False">
                                                    </label>
                                                    <range sidemarginsenabled="True" />
                                                </cc1:SecondaryAxisY>
                                            </secondaryaxesy>
                                            <panes>
                                                <cc1:XYDiagramPane Name="Pane_Ticket_Medio" PaneID="0" >
                                                </cc1:XYDiagramPane>
                                            </panes>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
    <FillStyle><OptionsSerializable>
    <cc1:SolidFillOptions></cc1:SolidFillOptions>
    </OptionsSerializable>
    </FillStyle>

                                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="6" maxhorizontalpercentage="90">
                                        <margins bottom="0" top="0" />
                                    </legend>
                                    <seriesserializable>
                                        <cc1:Series ArgumentDataMember="descMes" Name="2021" ValueDataMembersSerializable="numClientesAA" LabelsVisibility="True">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Transparency="85" Color="170, 204, 178, 98">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="TopInside" TextPattern="{V:n0}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Number" precision="0" />
                                                            <valuenumericoptions format="Number" precision="0" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" precision="0" />
                                                    <valuenumericoptions format="Number" precision="0" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" Name="2022" ValueDataMembersSerializable="numClientes" LabelsVisibility="True">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Transparency="51" Color="204, 105, 193, 85">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" TextPattern="{V:n0}">
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
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="Diferença" ValueDataMembersSerializable="Dif">
                                            <viewserializable>
                                                <cc1:LineSeriesView Color="Brown" MarkerVisibility="True">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions size="5" BorderVisible="True">
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" TextPattern="{V:n0}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Number" precision="0" />
                                                            <valuenumericoptions format="Number" precision="0" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:PointSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" precision="0" />
                                                    <valuenumericoptions format="Number" precision="0" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_2016" ShowInLegend="False" ValueDataMembersSerializable="vlrTicketMedioAA">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="170, 204, 178, 98" PaneName="Pane_Ticket_Medio" Transparency="85">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="TopInside" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Currency" />
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Currency" />
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_2017" ShowInLegend="False" ValueDataMembersSerializable="vlrTicketMedioAT">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="204, 105, 193, 85" PaneName="Pane_Ticket_Medio" Transparency="51">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_Diferença" ShowInLegend="False" ValueDataMembersSerializable="Dif_TM">
                                            <viewserializable>
                                                <cc1:LineSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="Brown" PaneName="Pane_Ticket_Medio">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions color="0, 128, 0" size="5" BorderVisible="True">
                                                        <fillstyle fillmode="Solid">
                                                            <optionsserializable>
                                                                <cc1:SolidFillOptions />
                                                            </optionsserializable>
                                                        </fillstyle>
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:PointSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                    </seriesserializable>

    <SeriesTemplate><ViewSerializable>
        <cc1:SideBySideBarSeriesView>
        </cc1:SideBySideBarSeriesView>
    </ViewSerializable>
    <LabelSerializable>
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
                                <asp:SqlDataSource ID="dsClientesNumerosSecao13" runat="server" ConnectionString="<%$ ConnectionStrings:DW_VendasConnectionString %>" SelectCommand="uspBuscarNumeroDeClientes_12Meses_Secao" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                        <asp:SessionParameter Name="idSecao" DefaultValue="13" Type="Byte" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

								
							</div>
						</div>
					</div>
				</div><!--  /Secao 13 -->

				<div class="col-md-12">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="glyphicon glyphicon-shopping-cart"></span> Numero de Clientes &nbsp e &nbsp <span class="glyphicon glyphicon-list-alt"></span> Ticket Médio - Secao 14 - Frios, Massas & Gordurosos</h4>

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
								
                                <dxchartsui:WebChartControl ID="graph_Secao14" runat="server" DataSourceID="dsClientesNumerosSecao14" Height="550px" Width="900px" AppearanceNameSerializable="Nature Colors" CrosshairEnabled="True">
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="-1" minorcount="1" visible="False">
                                                <range sidemarginsenabled="True" />
                                                <gridlines minorcolor="LightSteelBlue" minorvisible="True">
                                                    <minorlinestyle dashstyle="Dash" />
                                                </gridlines>
                                            </axisx>
                                            <axisy visibleinpanesserializable="-1" title-text="Número de Clientes" title-visible="True">
                                                <constantlines>
                                                    <cc1:ConstantLine AxisValueSerializable="1" Name="Constant Line 1" Visible="False">
                                                    </cc1:ConstantLine>
                                                </constantlines>
                                                <label visible="False">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                            <secondaryaxesx>
                                                <cc1:SecondaryAxisX Alignment="Near" AxisID="0" DateTimeScaleMode="Manual" Name="Secondary AxisX 1" VisibleInPanesSerializable="0" MinorCount="1">
                                                    <range sidemarginsenabled="True" />
                                                    <gridlines minorcolor="LightSteelBlue" minorvisible="True">
                                                        <minorlinestyle dashstyle="Dash" />
                                                    </gridlines>
                                                </cc1:SecondaryAxisX>
                                            </secondaryaxesx>
                                            <secondaryaxesy>
                                                <cc1:SecondaryAxisY AxisID="0" Name="Secondary AxisY 1" VisibleInPanesSerializable="0" Alignment="Near" Title-Text="Ticket Médio" Title-Visible="True">
                                                    <label visible="False">
                                                    </label>
                                                    <range sidemarginsenabled="True" />
                                                </cc1:SecondaryAxisY>
                                            </secondaryaxesy>
                                            <panes>
                                                <cc1:XYDiagramPane Name="Pane_Ticket_Medio" PaneID="0" >
                                                </cc1:XYDiagramPane>
                                            </panes>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
    <FillStyle><OptionsSerializable>
    <cc1:SolidFillOptions></cc1:SolidFillOptions>
    </OptionsSerializable>
    </FillStyle>

                                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="6" maxhorizontalpercentage="90">
                                        <margins bottom="0" top="0" />
                                    </legend>
                                    <seriesserializable>
                                        <cc1:Series ArgumentDataMember="descMes" Name="2021" ValueDataMembersSerializable="numClientesAA" LabelsVisibility="True">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Transparency="85" Color="170, 204, 178, 98">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="TopInside" TextPattern="{V:n0}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Number" precision="0" />
                                                            <valuenumericoptions format="Number" precision="0" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" precision="0" />
                                                    <valuenumericoptions format="Number" precision="0" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" Name="2022" ValueDataMembersSerializable="numClientes" LabelsVisibility="True">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Transparency="51" Color="204, 105, 193, 85">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" TextPattern="{V:n0}">
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
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="Diferença" ValueDataMembersSerializable="Dif">
                                            <viewserializable>
                                                <cc1:LineSeriesView Color="Brown" MarkerVisibility="True">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions size="5" BorderVisible="True">
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" TextPattern="{V:n0}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Number" precision="0" />
                                                            <valuenumericoptions format="Number" precision="0" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:PointSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" precision="0" />
                                                    <valuenumericoptions format="Number" precision="0" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_2016" ShowInLegend="False" ValueDataMembersSerializable="vlrTicketMedioAA">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="170, 204, 178, 98" PaneName="Pane_Ticket_Medio" Transparency="85">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="TopInside" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Currency" />
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Currency" />
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_2017" ShowInLegend="False" ValueDataMembersSerializable="vlrTicketMedioAT">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="204, 105, 193, 85" PaneName="Pane_Ticket_Medio" Transparency="51">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_Diferença" ShowInLegend="False" ValueDataMembersSerializable="Dif_TM">
                                            <viewserializable>
                                                <cc1:LineSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="Brown" PaneName="Pane_Ticket_Medio">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions color="0, 128, 0" size="5" BorderVisible="True">
                                                        <fillstyle fillmode="Solid">
                                                            <optionsserializable>
                                                                <cc1:SolidFillOptions />
                                                            </optionsserializable>
                                                        </fillstyle>
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:PointSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                    </seriesserializable>

    <SeriesTemplate><ViewSerializable>
        <cc1:SideBySideBarSeriesView>
        </cc1:SideBySideBarSeriesView>
    </ViewSerializable>
    <LabelSerializable>
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
                                <asp:SqlDataSource ID="dsClientesNumerosSecao14" runat="server" ConnectionString="<%$ ConnectionStrings:DW_VendasConnectionString %>" SelectCommand="uspBuscarNumeroDeClientes_12Meses_Secao" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                        <asp:SessionParameter Name="idSecao" DefaultValue="14" Type="Byte" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

								
							</div>
						</div>
					</div>
				</div><!--  /Secao 14 -->

				<div class="col-md-12">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="glyphicon glyphicon-shopping-cart"></span> Numero de Clientes &nbsp e &nbsp <span class="glyphicon glyphicon-list-alt"></span> Ticket Médio - Secao 15 - Laticinios</h4>

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
								
                                <dxchartsui:WebChartControl ID="graph_Secao15" runat="server" DataSourceID="dsClientesNumerosSecao15" Height="550px" Width="900px" AppearanceNameSerializable="Nature Colors" CrosshairEnabled="True">
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="-1" minorcount="1" visible="False">
                                                <range sidemarginsenabled="True" />
                                                <gridlines minorcolor="LightSteelBlue" minorvisible="True">
                                                    <minorlinestyle dashstyle="Dash" />
                                                </gridlines>
                                            </axisx>
                                            <axisy visibleinpanesserializable="-1" title-text="Número de Clientes" title-visible="True">
                                                <constantlines>
                                                    <cc1:ConstantLine AxisValueSerializable="1" Name="Constant Line 1" Visible="False">
                                                    </cc1:ConstantLine>
                                                </constantlines>
                                                <label visible="False">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                            <secondaryaxesx>
                                                <cc1:SecondaryAxisX Alignment="Near" AxisID="0" DateTimeScaleMode="Manual" Name="Secondary AxisX 1" VisibleInPanesSerializable="0" MinorCount="1">
                                                    <range sidemarginsenabled="True" />
                                                    <gridlines minorcolor="LightSteelBlue" minorvisible="True">
                                                        <minorlinestyle dashstyle="Dash" />
                                                    </gridlines>
                                                </cc1:SecondaryAxisX>
                                            </secondaryaxesx>
                                            <secondaryaxesy>
                                                <cc1:SecondaryAxisY AxisID="0" Name="Secondary AxisY 1" VisibleInPanesSerializable="0" Alignment="Near" Title-Text="Ticket Médio" Title-Visible="True">
                                                    <label visible="False">
                                                    </label>
                                                    <range sidemarginsenabled="True" />
                                                </cc1:SecondaryAxisY>
                                            </secondaryaxesy>
                                            <panes>
                                                <cc1:XYDiagramPane Name="Pane_Ticket_Medio" PaneID="0" >
                                                </cc1:XYDiagramPane>
                                            </panes>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
    <FillStyle><OptionsSerializable>
    <cc1:SolidFillOptions></cc1:SolidFillOptions>
    </OptionsSerializable>
    </FillStyle>

                                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="6" maxhorizontalpercentage="90">
                                        <margins bottom="0" top="0" />
                                    </legend>
                                    <seriesserializable>
                                        <cc1:Series ArgumentDataMember="descMes" Name="2021" ValueDataMembersSerializable="numClientesAA" LabelsVisibility="True">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Transparency="85" Color="170, 204, 178, 98">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="TopInside" TextPattern="{V:n0}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Number" precision="0" />
                                                            <valuenumericoptions format="Number" precision="0" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" precision="0" />
                                                    <valuenumericoptions format="Number" precision="0" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" Name="2022" ValueDataMembersSerializable="numClientes" LabelsVisibility="True">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Transparency="51" Color="204, 105, 193, 85">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" TextPattern="{V:n0}">
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
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="Diferença" ValueDataMembersSerializable="Dif">
                                            <viewserializable>
                                                <cc1:LineSeriesView Color="Brown" MarkerVisibility="True">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions size="5" BorderVisible="True">
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" TextPattern="{V:n0}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Number" precision="0" />
                                                            <valuenumericoptions format="Number" precision="0" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:PointSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" precision="0" />
                                                    <valuenumericoptions format="Number" precision="0" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_2016" ShowInLegend="False" ValueDataMembersSerializable="vlrTicketMedioAA">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="170, 204, 178, 98" PaneName="Pane_Ticket_Medio" Transparency="85">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="TopInside" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Currency" />
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Currency" />
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_2017" ShowInLegend="False" ValueDataMembersSerializable="vlrTicketMedioAT">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="204, 105, 193, 85" PaneName="Pane_Ticket_Medio" Transparency="51">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_Diferença" ShowInLegend="False" ValueDataMembersSerializable="Dif_TM">
                                            <viewserializable>
                                                <cc1:LineSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="Brown" PaneName="Pane_Ticket_Medio">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions color="0, 128, 0" size="5" BorderVisible="True">
                                                        <fillstyle fillmode="Solid">
                                                            <optionsserializable>
                                                                <cc1:SolidFillOptions />
                                                            </optionsserializable>
                                                        </fillstyle>
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:PointSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                    </seriesserializable>

    <SeriesTemplate><ViewSerializable>
        <cc1:SideBySideBarSeriesView>
        </cc1:SideBySideBarSeriesView>
    </ViewSerializable>
    <LabelSerializable>
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
                                <asp:SqlDataSource ID="dsClientesNumerosSecao15" runat="server" ConnectionString="<%$ ConnectionStrings:DW_VendasConnectionString %>" SelectCommand="uspBuscarNumeroDeClientes_12Meses_Secao" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                        <asp:SessionParameter Name="idSecao" DefaultValue="15" Type="Byte" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

								
							</div>
						</div>
					</div>
				</div><!--  /Secao 15 -->

				<div class="col-md-12">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="glyphicon glyphicon-shopping-cart"></span> Numero de Clientes &nbsp e &nbsp <span class="glyphicon glyphicon-list-alt"></span> Ticket Médio - Secao 16 - Congelados</h4>

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
								
                                <dxchartsui:WebChartControl ID="graph_Secao16" runat="server" DataSourceID="dsClientesNumerosSecao16" Height="550px" Width="900px" AppearanceNameSerializable="Nature Colors" CrosshairEnabled="True">
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="-1" minorcount="1" visible="False">
                                                <range sidemarginsenabled="True" />
                                                <gridlines minorcolor="LightSteelBlue" minorvisible="True">
                                                    <minorlinestyle dashstyle="Dash" />
                                                </gridlines>
                                            </axisx>
                                            <axisy visibleinpanesserializable="-1" title-text="Número de Clientes" title-visible="True">
                                                <constantlines>
                                                    <cc1:ConstantLine AxisValueSerializable="1" Name="Constant Line 1" Visible="False">
                                                    </cc1:ConstantLine>
                                                </constantlines>
                                                <label visible="False">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                            <secondaryaxesx>
                                                <cc1:SecondaryAxisX Alignment="Near" AxisID="0" DateTimeScaleMode="Manual" Name="Secondary AxisX 1" VisibleInPanesSerializable="0" MinorCount="1">
                                                    <range sidemarginsenabled="True" />
                                                    <gridlines minorcolor="LightSteelBlue" minorvisible="True">
                                                        <minorlinestyle dashstyle="Dash" />
                                                    </gridlines>
                                                </cc1:SecondaryAxisX>
                                            </secondaryaxesx>
                                            <secondaryaxesy>
                                                <cc1:SecondaryAxisY AxisID="0" Name="Secondary AxisY 1" VisibleInPanesSerializable="0" Alignment="Near" Title-Text="Ticket Médio" Title-Visible="True">
                                                    <label visible="False">
                                                    </label>
                                                    <range sidemarginsenabled="True" />
                                                </cc1:SecondaryAxisY>
                                            </secondaryaxesy>
                                            <panes>
                                                <cc1:XYDiagramPane Name="Pane_Ticket_Medio" PaneID="0" >
                                                </cc1:XYDiagramPane>
                                            </panes>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
    <FillStyle><OptionsSerializable>
    <cc1:SolidFillOptions></cc1:SolidFillOptions>
    </OptionsSerializable>
    </FillStyle>

                                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="6" maxhorizontalpercentage="90">
                                        <margins bottom="0" top="0" />
                                    </legend>
                                    <seriesserializable>
                                        <cc1:Series ArgumentDataMember="descMes" Name="2021" ValueDataMembersSerializable="numClientesAA" LabelsVisibility="True">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Transparency="85" Color="170, 204, 178, 98">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="TopInside" TextPattern="{V:n0}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Number" precision="0" />
                                                            <valuenumericoptions format="Number" precision="0" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" precision="0" />
                                                    <valuenumericoptions format="Number" precision="0" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" Name="2022" ValueDataMembersSerializable="numClientes" LabelsVisibility="True">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Transparency="51" Color="204, 105, 193, 85">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" TextPattern="{V:n0}">
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
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="Diferença" ValueDataMembersSerializable="Dif">
                                            <viewserializable>
                                                <cc1:LineSeriesView Color="Brown" MarkerVisibility="True">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions size="5" BorderVisible="True">
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" TextPattern="{V:n0}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Number" precision="0" />
                                                            <valuenumericoptions format="Number" precision="0" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:PointSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" precision="0" />
                                                    <valuenumericoptions format="Number" precision="0" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_2016" ShowInLegend="False" ValueDataMembersSerializable="vlrTicketMedioAA">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="170, 204, 178, 98" PaneName="Pane_Ticket_Medio" Transparency="85">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="TopInside" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Currency" />
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Currency" />
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_2017" ShowInLegend="False" ValueDataMembersSerializable="vlrTicketMedioAT">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="204, 105, 193, 85" PaneName="Pane_Ticket_Medio" Transparency="51">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_Diferença" ShowInLegend="False" ValueDataMembersSerializable="Dif_TM">
                                            <viewserializable>
                                                <cc1:LineSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="Brown" PaneName="Pane_Ticket_Medio">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions color="0, 128, 0" size="5" BorderVisible="True">
                                                        <fillstyle fillmode="Solid">
                                                            <optionsserializable>
                                                                <cc1:SolidFillOptions />
                                                            </optionsserializable>
                                                        </fillstyle>
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:PointSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                    </seriesserializable>

    <SeriesTemplate><ViewSerializable>
        <cc1:SideBySideBarSeriesView>
        </cc1:SideBySideBarSeriesView>
    </ViewSerializable>
    <LabelSerializable>
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
                                <asp:SqlDataSource ID="dsClientesNumerosSecao16" runat="server" ConnectionString="<%$ ConnectionStrings:DW_VendasConnectionString %>" SelectCommand="uspBuscarNumeroDeClientes_12Meses_Secao" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                        <asp:SessionParameter Name="idSecao" DefaultValue="16" Type="Byte" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

								
							</div>
						</div>
					</div>
				</div><!--  /Secao 16 -->

				<div class="col-md-12">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="glyphicon glyphicon-shopping-cart"></span> Numero de Clientes &nbsp e &nbsp <span class="glyphicon glyphicon-list-alt"></span> Ticket Médio - Secao 17 - Padaria</h4>

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
								
                                <dxchartsui:WebChartControl ID="graph_Secao17" runat="server" DataSourceID="dsClientesNumerosSecao17" Height="550px" Width="900px" AppearanceNameSerializable="Nature Colors" CrosshairEnabled="True">
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="-1" minorcount="1" visible="False">
                                                <range sidemarginsenabled="True" />
                                                <gridlines minorcolor="LightSteelBlue" minorvisible="True">
                                                    <minorlinestyle dashstyle="Dash" />
                                                </gridlines>
                                            </axisx>
                                            <axisy visibleinpanesserializable="-1" title-text="Número de Clientes" title-visible="True">
                                                <constantlines>
                                                    <cc1:ConstantLine AxisValueSerializable="1" Name="Constant Line 1" Visible="False">
                                                    </cc1:ConstantLine>
                                                </constantlines>
                                                <label visible="False">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                            <secondaryaxesx>
                                                <cc1:SecondaryAxisX Alignment="Near" AxisID="0" DateTimeScaleMode="Manual" Name="Secondary AxisX 1" VisibleInPanesSerializable="0" MinorCount="1">
                                                    <range sidemarginsenabled="True" />
                                                    <gridlines minorcolor="LightSteelBlue" minorvisible="True">
                                                        <minorlinestyle dashstyle="Dash" />
                                                    </gridlines>
                                                </cc1:SecondaryAxisX>
                                            </secondaryaxesx>
                                            <secondaryaxesy>
                                                <cc1:SecondaryAxisY AxisID="0" Name="Secondary AxisY 1" VisibleInPanesSerializable="0" Alignment="Near" Title-Text="Ticket Médio" Title-Visible="True">
                                                    <label visible="False">
                                                    </label>
                                                    <range sidemarginsenabled="True" />
                                                </cc1:SecondaryAxisY>
                                            </secondaryaxesy>
                                            <panes>
                                                <cc1:XYDiagramPane Name="Pane_Ticket_Medio" PaneID="0" >
                                                </cc1:XYDiagramPane>
                                            </panes>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
    <FillStyle><OptionsSerializable>
    <cc1:SolidFillOptions></cc1:SolidFillOptions>
    </OptionsSerializable>
    </FillStyle>

                                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="6" maxhorizontalpercentage="90">
                                        <margins bottom="0" top="0" />
                                    </legend>
                                    <seriesserializable>
                                        <cc1:Series ArgumentDataMember="descMes" Name="2021" ValueDataMembersSerializable="numClientesAA" LabelsVisibility="True">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Transparency="85" Color="170, 204, 178, 98">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="TopInside" TextPattern="{V:n0}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Number" precision="0" />
                                                            <valuenumericoptions format="Number" precision="0" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" precision="0" />
                                                    <valuenumericoptions format="Number" precision="0" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" Name="2022" ValueDataMembersSerializable="numClientes" LabelsVisibility="True">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Transparency="51" Color="204, 105, 193, 85">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" TextPattern="{V:n0}">
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
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="Diferença" ValueDataMembersSerializable="Dif">
                                            <viewserializable>
                                                <cc1:LineSeriesView Color="Brown" MarkerVisibility="True">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions size="5" BorderVisible="True">
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" TextPattern="{V:n0}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Number" precision="0" />
                                                            <valuenumericoptions format="Number" precision="0" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:PointSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" precision="0" />
                                                    <valuenumericoptions format="Number" precision="0" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_2016" ShowInLegend="False" ValueDataMembersSerializable="vlrTicketMedioAA">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="170, 204, 178, 98" PaneName="Pane_Ticket_Medio" Transparency="85">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="TopInside" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Currency" />
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Currency" />
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_2017" ShowInLegend="False" ValueDataMembersSerializable="vlrTicketMedioAT">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="204, 105, 193, 85" PaneName="Pane_Ticket_Medio" Transparency="51">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_Diferença" ShowInLegend="False" ValueDataMembersSerializable="Dif_TM">
                                            <viewserializable>
                                                <cc1:LineSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="Brown" PaneName="Pane_Ticket_Medio">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions color="0, 128, 0" size="5" BorderVisible="True">
                                                        <fillstyle fillmode="Solid">
                                                            <optionsserializable>
                                                                <cc1:SolidFillOptions />
                                                            </optionsserializable>
                                                        </fillstyle>
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:PointSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                    </seriesserializable>

    <SeriesTemplate><ViewSerializable>
        <cc1:SideBySideBarSeriesView>
        </cc1:SideBySideBarSeriesView>
    </ViewSerializable>
    <LabelSerializable>
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
                                <asp:SqlDataSource ID="dsClientesNumerosSecao17" runat="server" ConnectionString="<%$ ConnectionStrings:DW_VendasConnectionString %>" SelectCommand="uspBuscarNumeroDeClientes_12Meses_Secao" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                        <asp:SessionParameter Name="idSecao" DefaultValue="17" Type="Byte" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

								
							</div>
						</div>
					</div>
				</div><!--  /Secao 17 -->

				<div class="col-md-12">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="glyphicon glyphicon-shopping-cart"></span> Numero de Clientes &nbsp e &nbsp <span class="glyphicon glyphicon-list-alt"></span> Ticket Médio - Secao 18 - Confeitaria</h4>

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
								
                                <dxchartsui:WebChartControl ID="graph_Secao18" runat="server" DataSourceID="dsClientesNumerosSecao18" Height="550px" Width="900px" AppearanceNameSerializable="Nature Colors" CrosshairEnabled="True">
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="-1" minorcount="1" visible="False">
                                                <range sidemarginsenabled="True" />
                                                <gridlines minorcolor="LightSteelBlue" minorvisible="True">
                                                    <minorlinestyle dashstyle="Dash" />
                                                </gridlines>
                                            </axisx>
                                            <axisy visibleinpanesserializable="-1" title-text="Número de Clientes" title-visible="True">
                                                <constantlines>
                                                    <cc1:ConstantLine AxisValueSerializable="1" Name="Constant Line 1" Visible="False">
                                                    </cc1:ConstantLine>
                                                </constantlines>
                                                <label visible="False">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                            <secondaryaxesx>
                                                <cc1:SecondaryAxisX Alignment="Near" AxisID="0" DateTimeScaleMode="Manual" Name="Secondary AxisX 1" VisibleInPanesSerializable="0" MinorCount="1">
                                                    <range sidemarginsenabled="True" />
                                                    <gridlines minorcolor="LightSteelBlue" minorvisible="True">
                                                        <minorlinestyle dashstyle="Dash" />
                                                    </gridlines>
                                                </cc1:SecondaryAxisX>
                                            </secondaryaxesx>
                                            <secondaryaxesy>
                                                <cc1:SecondaryAxisY AxisID="0" Name="Secondary AxisY 1" VisibleInPanesSerializable="0" Alignment="Near" Title-Text="Ticket Médio" Title-Visible="True">
                                                    <label visible="False">
                                                    </label>
                                                    <range sidemarginsenabled="True" />
                                                </cc1:SecondaryAxisY>
                                            </secondaryaxesy>
                                            <panes>
                                                <cc1:XYDiagramPane Name="Pane_Ticket_Medio" PaneID="0" >
                                                </cc1:XYDiagramPane>
                                            </panes>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
    <FillStyle><OptionsSerializable>
    <cc1:SolidFillOptions></cc1:SolidFillOptions>
    </OptionsSerializable>
    </FillStyle>

                                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="6" maxhorizontalpercentage="90">
                                        <margins bottom="0" top="0" />
                                    </legend>
                                    <seriesserializable>
                                        <cc1:Series ArgumentDataMember="descMes" Name="2021" ValueDataMembersSerializable="numClientesAA" LabelsVisibility="True">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Transparency="85" Color="170, 204, 178, 98">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="TopInside" TextPattern="{V:n0}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Number" precision="0" />
                                                            <valuenumericoptions format="Number" precision="0" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" precision="0" />
                                                    <valuenumericoptions format="Number" precision="0" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" Name="2022" ValueDataMembersSerializable="numClientes" LabelsVisibility="True">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Transparency="51" Color="204, 105, 193, 85">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" TextPattern="{V:n0}">
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
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="Diferença" ValueDataMembersSerializable="Dif">
                                            <viewserializable>
                                                <cc1:LineSeriesView Color="Brown" MarkerVisibility="True">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions size="5" BorderVisible="True">
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" TextPattern="{V:n0}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Number" precision="0" />
                                                            <valuenumericoptions format="Number" precision="0" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:PointSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" precision="0" />
                                                    <valuenumericoptions format="Number" precision="0" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_2016" ShowInLegend="False" ValueDataMembersSerializable="vlrTicketMedioAA">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="170, 204, 178, 98" PaneName="Pane_Ticket_Medio" Transparency="85">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="TopInside" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Currency" />
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Currency" />
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_2017" ShowInLegend="False" ValueDataMembersSerializable="vlrTicketMedioAT">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="204, 105, 193, 85" PaneName="Pane_Ticket_Medio" Transparency="51">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_Diferença" ShowInLegend="False" ValueDataMembersSerializable="Dif_TM">
                                            <viewserializable>
                                                <cc1:LineSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="Brown" PaneName="Pane_Ticket_Medio">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions color="0, 128, 0" size="5" BorderVisible="True">
                                                        <fillstyle fillmode="Solid">
                                                            <optionsserializable>
                                                                <cc1:SolidFillOptions />
                                                            </optionsserializable>
                                                        </fillstyle>
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:PointSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                    </seriesserializable>

    <SeriesTemplate><ViewSerializable>
        <cc1:SideBySideBarSeriesView>
        </cc1:SideBySideBarSeriesView>
    </ViewSerializable>
    <LabelSerializable>
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
                                <asp:SqlDataSource ID="dsClientesNumerosSecao18" runat="server" ConnectionString="<%$ ConnectionStrings:DW_VendasConnectionString %>" SelectCommand="uspBuscarNumeroDeClientes_12Meses_Secao" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                        <asp:SessionParameter Name="idSecao" DefaultValue="18" Type="Byte" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

								
							</div>
						</div>
					</div>
				</div><!--  /Secao 18 -->

				<div class="col-md-12">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="glyphicon glyphicon-shopping-cart"></span> Numero de Clientes &nbsp e &nbsp <span class="glyphicon glyphicon-list-alt"></span> Ticket Médio - Secao 19 - Pães Industrializados</h4>

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
								
                                <dxchartsui:WebChartControl ID="graph_Secao19" runat="server" DataSourceID="dsClientesNumerosSecao19" Height="550px" Width="900px" AppearanceNameSerializable="Nature Colors" CrosshairEnabled="True">
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="-1" minorcount="1" visible="False">
                                                <range sidemarginsenabled="True" />
                                                <gridlines minorcolor="LightSteelBlue" minorvisible="True">
                                                    <minorlinestyle dashstyle="Dash" />
                                                </gridlines>
                                            </axisx>
                                            <axisy visibleinpanesserializable="-1" title-text="Número de Clientes" title-visible="True">
                                                <constantlines>
                                                    <cc1:ConstantLine AxisValueSerializable="1" Name="Constant Line 1" Visible="False">
                                                    </cc1:ConstantLine>
                                                </constantlines>
                                                <label visible="False">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                            <secondaryaxesx>
                                                <cc1:SecondaryAxisX Alignment="Near" AxisID="0" DateTimeScaleMode="Manual" Name="Secondary AxisX 1" VisibleInPanesSerializable="0" MinorCount="1">
                                                    <range sidemarginsenabled="True" />
                                                    <gridlines minorcolor="LightSteelBlue" minorvisible="True">
                                                        <minorlinestyle dashstyle="Dash" />
                                                    </gridlines>
                                                </cc1:SecondaryAxisX>
                                            </secondaryaxesx>
                                            <secondaryaxesy>
                                                <cc1:SecondaryAxisY AxisID="0" Name="Secondary AxisY 1" VisibleInPanesSerializable="0" Alignment="Near" Title-Text="Ticket Médio" Title-Visible="True">
                                                    <label visible="False">
                                                    </label>
                                                    <range sidemarginsenabled="True" />
                                                </cc1:SecondaryAxisY>
                                            </secondaryaxesy>
                                            <panes>
                                                <cc1:XYDiagramPane Name="Pane_Ticket_Medio" PaneID="0" >
                                                </cc1:XYDiagramPane>
                                            </panes>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
    <FillStyle><OptionsSerializable>
    <cc1:SolidFillOptions></cc1:SolidFillOptions>
    </OptionsSerializable>
    </FillStyle>

                                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="6" maxhorizontalpercentage="90">
                                        <margins bottom="0" top="0" />
                                    </legend>
                                    <seriesserializable>
                                        <cc1:Series ArgumentDataMember="descMes" Name="2021" ValueDataMembersSerializable="numClientesAA" LabelsVisibility="True">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Transparency="85" Color="170, 204, 178, 98">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="TopInside" TextPattern="{V:n0}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Number" precision="0" />
                                                            <valuenumericoptions format="Number" precision="0" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" precision="0" />
                                                    <valuenumericoptions format="Number" precision="0" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" Name="2022" ValueDataMembersSerializable="numClientes" LabelsVisibility="True">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Transparency="51" Color="204, 105, 193, 85">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" TextPattern="{V:n0}">
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
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="Diferença" ValueDataMembersSerializable="Dif">
                                            <viewserializable>
                                                <cc1:LineSeriesView Color="Brown" MarkerVisibility="True">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions size="5" BorderVisible="True">
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" TextPattern="{V:n0}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Number" precision="0" />
                                                            <valuenumericoptions format="Number" precision="0" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:PointSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" precision="0" />
                                                    <valuenumericoptions format="Number" precision="0" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_2016" ShowInLegend="False" ValueDataMembersSerializable="vlrTicketMedioAA">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="170, 204, 178, 98" PaneName="Pane_Ticket_Medio" Transparency="85">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="TopInside" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Currency" />
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Currency" />
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_2017" ShowInLegend="False" ValueDataMembersSerializable="vlrTicketMedioAT">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="204, 105, 193, 85" PaneName="Pane_Ticket_Medio" Transparency="51">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_Diferença" ShowInLegend="False" ValueDataMembersSerializable="Dif_TM">
                                            <viewserializable>
                                                <cc1:LineSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="Brown" PaneName="Pane_Ticket_Medio">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions color="0, 128, 0" size="5" BorderVisible="True">
                                                        <fillstyle fillmode="Solid">
                                                            <optionsserializable>
                                                                <cc1:SolidFillOptions />
                                                            </optionsserializable>
                                                        </fillstyle>
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:PointSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                    </seriesserializable>

    <SeriesTemplate><ViewSerializable>
        <cc1:SideBySideBarSeriesView>
        </cc1:SideBySideBarSeriesView>
    </ViewSerializable>
    <LabelSerializable>
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
                                <asp:SqlDataSource ID="dsClientesNumerosSecao19" runat="server" ConnectionString="<%$ ConnectionStrings:DW_VendasConnectionString %>" SelectCommand="uspBuscarNumeroDeClientes_12Meses_Secao" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                        <asp:SessionParameter Name="idSecao" DefaultValue="19" Type="Byte" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

								
							</div>
						</div>
					</div>
				</div><!--  /Secao 19 -->

				<div class="col-md-12">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="glyphicon glyphicon-shopping-cart"></span> Numero de Clientes &nbsp e &nbsp <span class="glyphicon glyphicon-list-alt"></span> Ticket Médio - Secao 21 - Açougue</h4>

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
								
                                <dxchartsui:WebChartControl ID="graph_Secao21" runat="server" DataSourceID="dsClientesNumerosSecao21" Height="550px" Width="900px" AppearanceNameSerializable="Nature Colors" CrosshairEnabled="True">
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="-1" minorcount="1" visible="False">
                                                <range sidemarginsenabled="True" />
                                                <gridlines minorcolor="LightSteelBlue" minorvisible="True">
                                                    <minorlinestyle dashstyle="Dash" />
                                                </gridlines>
                                            </axisx>
                                            <axisy visibleinpanesserializable="-1" title-text="Número de Clientes" title-visible="True">
                                                <constantlines>
                                                    <cc1:ConstantLine AxisValueSerializable="1" Name="Constant Line 1" Visible="False">
                                                    </cc1:ConstantLine>
                                                </constantlines>
                                                <label visible="False">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                            <secondaryaxesx>
                                                <cc1:SecondaryAxisX Alignment="Near" AxisID="0" DateTimeScaleMode="Manual" Name="Secondary AxisX 1" VisibleInPanesSerializable="0" MinorCount="1">
                                                    <range sidemarginsenabled="True" />
                                                    <gridlines minorcolor="LightSteelBlue" minorvisible="True">
                                                        <minorlinestyle dashstyle="Dash" />
                                                    </gridlines>
                                                </cc1:SecondaryAxisX>
                                            </secondaryaxesx>
                                            <secondaryaxesy>
                                                <cc1:SecondaryAxisY AxisID="0" Name="Secondary AxisY 1" VisibleInPanesSerializable="0" Alignment="Near" Title-Text="Ticket Médio" Title-Visible="True">
                                                    <label visible="False">
                                                    </label>
                                                    <range sidemarginsenabled="True" />
                                                </cc1:SecondaryAxisY>
                                            </secondaryaxesy>
                                            <panes>
                                                <cc1:XYDiagramPane Name="Pane_Ticket_Medio" PaneID="0" >
                                                </cc1:XYDiagramPane>
                                            </panes>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
    <FillStyle><OptionsSerializable>
    <cc1:SolidFillOptions></cc1:SolidFillOptions>
    </OptionsSerializable>
    </FillStyle>

                                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="6" maxhorizontalpercentage="90">
                                        <margins bottom="0" top="0" />
                                    </legend>
                                    <seriesserializable>
                                        <cc1:Series ArgumentDataMember="descMes" Name="2021" ValueDataMembersSerializable="numClientesAA" LabelsVisibility="True">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Transparency="85" Color="170, 204, 178, 98">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="TopInside" TextPattern="{V:n0}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Number" precision="0" />
                                                            <valuenumericoptions format="Number" precision="0" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" precision="0" />
                                                    <valuenumericoptions format="Number" precision="0" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" Name="2022" ValueDataMembersSerializable="numClientes" LabelsVisibility="True">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Transparency="51" Color="204, 105, 193, 85">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" TextPattern="{V:n0}">
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
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="Diferença" ValueDataMembersSerializable="Dif">
                                            <viewserializable>
                                                <cc1:LineSeriesView Color="Brown" MarkerVisibility="True">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions size="5" BorderVisible="True">
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" TextPattern="{V:n0}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Number" precision="0" />
                                                            <valuenumericoptions format="Number" precision="0" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:PointSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" precision="0" />
                                                    <valuenumericoptions format="Number" precision="0" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_2016" ShowInLegend="False" ValueDataMembersSerializable="vlrTicketMedioAA">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="170, 204, 178, 98" PaneName="Pane_Ticket_Medio" Transparency="85">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="TopInside" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Currency" />
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Currency" />
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_2017" ShowInLegend="False" ValueDataMembersSerializable="vlrTicketMedioAT">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="204, 105, 193, 85" PaneName="Pane_Ticket_Medio" Transparency="51">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_Diferença" ShowInLegend="False" ValueDataMembersSerializable="Dif_TM">
                                            <viewserializable>
                                                <cc1:LineSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="Brown" PaneName="Pane_Ticket_Medio">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions color="0, 128, 0" size="5" BorderVisible="True">
                                                        <fillstyle fillmode="Solid">
                                                            <optionsserializable>
                                                                <cc1:SolidFillOptions />
                                                            </optionsserializable>
                                                        </fillstyle>
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:PointSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                    </seriesserializable>

    <SeriesTemplate><ViewSerializable>
        <cc1:SideBySideBarSeriesView>
        </cc1:SideBySideBarSeriesView>
    </ViewSerializable>
    <LabelSerializable>
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
                                <asp:SqlDataSource ID="dsClientesNumerosSecao21" runat="server" ConnectionString="<%$ ConnectionStrings:DW_VendasConnectionString %>" SelectCommand="uspBuscarNumeroDeClientes_12Meses_Secao" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                        <asp:SessionParameter Name="idSecao" DefaultValue="21" Type="Byte" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

								
							</div>
						</div>
					</div>
				</div><!--  /Secao 21 -->

				<div class="col-md-12">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="glyphicon glyphicon-shopping-cart"></span> Numero de Clientes &nbsp e &nbsp <span class="glyphicon glyphicon-list-alt"></span> Ticket Médio - Secao 22 - Granjeiros</h4>

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
								
                                <dxchartsui:WebChartControl ID="graph_Secao22" runat="server" DataSourceID="dsClientesNumerosSecao22" Height="550px" Width="900px" AppearanceNameSerializable="Nature Colors" CrosshairEnabled="True">
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="-1" minorcount="1" visible="False">
                                                <range sidemarginsenabled="True" />
                                                <gridlines minorcolor="LightSteelBlue" minorvisible="True">
                                                    <minorlinestyle dashstyle="Dash" />
                                                </gridlines>
                                            </axisx>
                                            <axisy visibleinpanesserializable="-1" title-text="Número de Clientes" title-visible="True">
                                                <constantlines>
                                                    <cc1:ConstantLine AxisValueSerializable="1" Name="Constant Line 1" Visible="False">
                                                    </cc1:ConstantLine>
                                                </constantlines>
                                                <label visible="False">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                            <secondaryaxesx>
                                                <cc1:SecondaryAxisX Alignment="Near" AxisID="0" DateTimeScaleMode="Manual" Name="Secondary AxisX 1" VisibleInPanesSerializable="0" MinorCount="1">
                                                    <range sidemarginsenabled="True" />
                                                    <gridlines minorcolor="LightSteelBlue" minorvisible="True">
                                                        <minorlinestyle dashstyle="Dash" />
                                                    </gridlines>
                                                </cc1:SecondaryAxisX>
                                            </secondaryaxesx>
                                            <secondaryaxesy>
                                                <cc1:SecondaryAxisY AxisID="0" Name="Secondary AxisY 1" VisibleInPanesSerializable="0" Alignment="Near" Title-Text="Ticket Médio" Title-Visible="True">
                                                    <label visible="False">
                                                    </label>
                                                    <range sidemarginsenabled="True" />
                                                </cc1:SecondaryAxisY>
                                            </secondaryaxesy>
                                            <panes>
                                                <cc1:XYDiagramPane Name="Pane_Ticket_Medio" PaneID="0" >
                                                </cc1:XYDiagramPane>
                                            </panes>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
    <FillStyle><OptionsSerializable>
    <cc1:SolidFillOptions></cc1:SolidFillOptions>
    </OptionsSerializable>
    </FillStyle>

                                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="6" maxhorizontalpercentage="90">
                                        <margins bottom="0" top="0" />
                                    </legend>
                                    <seriesserializable>
                                        <cc1:Series ArgumentDataMember="descMes" Name="2021" ValueDataMembersSerializable="numClientesAA" LabelsVisibility="True">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Transparency="85" Color="170, 204, 178, 98">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="TopInside" TextPattern="{V:n0}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Number" precision="0" />
                                                            <valuenumericoptions format="Number" precision="0" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" precision="0" />
                                                    <valuenumericoptions format="Number" precision="0" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" Name="2022" ValueDataMembersSerializable="numClientes" LabelsVisibility="True">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Transparency="51" Color="204, 105, 193, 85">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" TextPattern="{V:n0}">
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
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="Diferença" ValueDataMembersSerializable="Dif">
                                            <viewserializable>
                                                <cc1:LineSeriesView Color="Brown" MarkerVisibility="True">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions size="5" BorderVisible="True">
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" TextPattern="{V:n0}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Number" precision="0" />
                                                            <valuenumericoptions format="Number" precision="0" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:PointSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" precision="0" />
                                                    <valuenumericoptions format="Number" precision="0" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_2016" ShowInLegend="False" ValueDataMembersSerializable="vlrTicketMedioAA">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="170, 204, 178, 98" PaneName="Pane_Ticket_Medio" Transparency="85">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="TopInside" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Currency" />
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Currency" />
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_2017" ShowInLegend="False" ValueDataMembersSerializable="vlrTicketMedioAT">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="204, 105, 193, 85" PaneName="Pane_Ticket_Medio" Transparency="51">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_Diferença" ShowInLegend="False" ValueDataMembersSerializable="Dif_TM">
                                            <viewserializable>
                                                <cc1:LineSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="Brown" PaneName="Pane_Ticket_Medio">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions color="0, 128, 0" size="5" BorderVisible="True">
                                                        <fillstyle fillmode="Solid">
                                                            <optionsserializable>
                                                                <cc1:SolidFillOptions />
                                                            </optionsserializable>
                                                        </fillstyle>
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:PointSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                    </seriesserializable>

    <SeriesTemplate><ViewSerializable>
        <cc1:SideBySideBarSeriesView>
        </cc1:SideBySideBarSeriesView>
    </ViewSerializable>
    <LabelSerializable>
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
                                <asp:SqlDataSource ID="dsClientesNumerosSecao22" runat="server" ConnectionString="<%$ ConnectionStrings:DW_VendasConnectionString %>" SelectCommand="uspBuscarNumeroDeClientes_12Meses_Secao" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                        <asp:SessionParameter Name="idSecao" DefaultValue="22" Type="Byte" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

								
							</div>
						</div>
					</div>
				</div><!--  /Secao 22 -->

				<div class="col-md-12">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="glyphicon glyphicon-shopping-cart"></span> Numero de Clientes &nbsp e &nbsp <span class="glyphicon glyphicon-list-alt"></span> Ticket Médio - Secao 23 - Frutas & Hortalicas</h4>

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
								
                                <dxchartsui:WebChartControl ID="graph_Secao23" runat="server" DataSourceID="dsClientesNumerosSecao23" Height="550px" Width="900px" AppearanceNameSerializable="Nature Colors" CrosshairEnabled="True">
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="-1" minorcount="1" visible="False">
                                                <range sidemarginsenabled="True" />
                                                <gridlines minorcolor="LightSteelBlue" minorvisible="True">
                                                    <minorlinestyle dashstyle="Dash" />
                                                </gridlines>
                                            </axisx>
                                            <axisy visibleinpanesserializable="-1" title-text="Número de Clientes" title-visible="True">
                                                <constantlines>
                                                    <cc1:ConstantLine AxisValueSerializable="1" Name="Constant Line 1" Visible="False">
                                                    </cc1:ConstantLine>
                                                </constantlines>
                                                <label visible="False">
                                                </label>
                                                <range sidemarginsenabled="True" />
                                                <gridlines visible="False">
                                                </gridlines>
                                            </axisy>
                                            <secondaryaxesx>
                                                <cc1:SecondaryAxisX Alignment="Near" AxisID="0" DateTimeScaleMode="Manual" Name="Secondary AxisX 1" VisibleInPanesSerializable="0" MinorCount="1">
                                                    <range sidemarginsenabled="True" />
                                                    <gridlines minorcolor="LightSteelBlue" minorvisible="True">
                                                        <minorlinestyle dashstyle="Dash" />
                                                    </gridlines>
                                                </cc1:SecondaryAxisX>
                                            </secondaryaxesx>
                                            <secondaryaxesy>
                                                <cc1:SecondaryAxisY AxisID="0" Name="Secondary AxisY 1" VisibleInPanesSerializable="0" Alignment="Near" Title-Text="Ticket Médio" Title-Visible="True">
                                                    <label visible="False">
                                                    </label>
                                                    <range sidemarginsenabled="True" />
                                                </cc1:SecondaryAxisY>
                                            </secondaryaxesy>
                                            <panes>
                                                <cc1:XYDiagramPane Name="Pane_Ticket_Medio" PaneID="0" >
                                                </cc1:XYDiagramPane>
                                            </panes>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
    <FillStyle><OptionsSerializable>
    <cc1:SolidFillOptions></cc1:SolidFillOptions>
    </OptionsSerializable>
    </FillStyle>

                                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="6" maxhorizontalpercentage="90">
                                        <margins bottom="0" top="0" />
                                    </legend>
                                    <seriesserializable>
                                        <cc1:Series ArgumentDataMember="descMes" Name="2021" ValueDataMembersSerializable="numClientesAA" LabelsVisibility="True">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Transparency="85" Color="170, 204, 178, 98">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="TopInside" TextPattern="{V:n0}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Number" precision="0" />
                                                            <valuenumericoptions format="Number" precision="0" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" precision="0" />
                                                    <valuenumericoptions format="Number" precision="0" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" Name="2022" ValueDataMembersSerializable="numClientes" LabelsVisibility="True">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Transparency="51" Color="204, 105, 193, 85">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" TextPattern="{V:n0}">
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
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="Diferença" ValueDataMembersSerializable="Dif">
                                            <viewserializable>
                                                <cc1:LineSeriesView Color="Brown" MarkerVisibility="True">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions size="5" BorderVisible="True">
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" TextPattern="{V:n0}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Number" precision="0" />
                                                            <valuenumericoptions format="Number" precision="0" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:PointSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Number" precision="0" />
                                                    <valuenumericoptions format="Number" precision="0" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_2016" ShowInLegend="False" ValueDataMembersSerializable="vlrTicketMedioAA">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="170, 204, 178, 98" PaneName="Pane_Ticket_Medio" Transparency="85">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="TopInside" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <argumentnumericoptions format="Currency" />
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <argumentnumericoptions format="Currency" />
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_2017" ShowInLegend="False" ValueDataMembersSerializable="vlrTicketMedioAT">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="204, 105, 193, 85" PaneName="Pane_Ticket_Medio" Transparency="51">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:SideBySideBarSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="descMes" LabelsVisibility="True" Name="TM_Diferença" ShowInLegend="False" ValueDataMembersSerializable="Dif_TM">
                                            <viewserializable>
                                                <cc1:LineSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="Brown" PaneName="Pane_Ticket_Medio">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions color="0, 128, 0" size="5" BorderVisible="True">
                                                        <fillstyle fillmode="Solid">
                                                            <optionsserializable>
                                                                <cc1:SolidFillOptions />
                                                            </optionsserializable>
                                                        </fillstyle>
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" TextPattern="{V:c2}">
                                                    <fillstyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                    <pointoptionsserializable>
                                                        <cc1:PointOptions>
                                                            <valuenumericoptions format="Currency" />
                                                        </cc1:PointOptions>
                                                    </pointoptionsserializable>
                                                </cc1:PointSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Currency" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                    </seriesserializable>

    <SeriesTemplate><ViewSerializable>
        <cc1:SideBySideBarSeriesView>
        </cc1:SideBySideBarSeriesView>
    </ViewSerializable>
    <LabelSerializable>
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
                                <asp:SqlDataSource ID="dsClientesNumerosSecao23" runat="server" ConnectionString="<%$ ConnectionStrings:DW_VendasConnectionString %>" SelectCommand="uspBuscarNumeroDeClientes_12Meses_Secao" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                        <asp:SessionParameter Name="idSecao" DefaultValue="23" Type="Byte" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

								
							</div>
						</div>
					</div>
				</div><!--  /Secao 23 -->


              
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

      </section>


        <asp:Label ID="lblError" runat="server" Text="Label"  ForeColor="Red" Visible="False"></asp:Label>


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

