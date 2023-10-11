<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="DashboardGigante.aspx.vb" Inherits="MemberPages_Checklist_DashboardGigante" %>

<%@ Register Assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGauges" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGauges.Gauges" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGauges.Gauges.Linear" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGauges.Gauges.Circular" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGauges.Gauges.State" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxGauges.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxGauges.Gauges.Digital" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register Assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>
<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="../../Controles/wucLista_Filial_Empresa.ascx" TagName="wucLista_Filial_Empresa" TagPrefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="../../css/Dashboard.css" rel="stylesheet" />
    <link href="../../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../css/myCSS.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-2.2.3.min.js"></script>

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

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="container-fluid">

        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>Dashboard - Prevenção de Perdas (Gigante)
        <small>Controladoria</small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Principal</a></li>
                <li class="active">Dashboard</li>
            </ol>
        </section>

        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title text-center">Pontuação - Empresa e Melhores e Piores Lojas</h3>

                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                <i class="fa fa-minus"></i>
                            </button>

                        </div>

                    </div>
                    <!-- /.box-header -->
                    <div class="box-body justify-content-center">

                        <div class="row justify-content-center text-center">

                            <div class="col-3 placeholder" style="background-color: #E2EFDA">

                                <dx:ASPxGaugeControl ID="gauge_Pontuacao_Melhor1" runat="server" Height="200px" Width="200px" BackColor="Transparent" LayoutInterval="6" Value="98,4">
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

                                <h4>
                                    <asp:Label ID="lblFilial_Melhor1" runat="server"></asp:Label></h4>
                                <span class="text-muted">
                                    <asp:Label ID="lblPeriodo_Melhor1" runat="server"></asp:Label></span>
                                <%--<h4>
                                        <asp:Button ID="btnMelhor1" runat="server" Text="Melhor 1" CssClass="btn btn-warning fixed-bottom" /></h4>--%>
                            </div>

                            <div class="col-3 placeholder" style="background-color: #DDEBF7">

                                <dx:ASPxGaugeControl ID="gauge_Pontuacao_Empresa" runat="server" Height="200px" Width="200px" BackColor="Transparent" LayoutInterval="6" Value="86,5">
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

                                <h4>Gigante</h4>
                                <span class="text-muted">
                                    <asp:Label ID="lblPeriodo_Empresa" runat="server" Text=""></asp:Label></span>
                            </div>

                            <div class="col-3 placeholder" style="background-color: #F5A5A5">
                                <dx:ASPxGaugeControl ID="gauge_Pontuacao_Pior1" runat="server" Height="200px" Width="200px" BackColor="Transparent" LayoutInterval="6" Value="61,2">
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

                                <h4>
                                    <asp:Label ID="lblFilial_Pior1" runat="server"></asp:Label></h4>
                                <span class="text-muted">
                                    <asp:Label ID="lblPeriodo_Pior1" runat="server"></asp:Label></span>
                                <%--               <h4>
                                        <asp:Button ID="btnPior1" runat="server" Text="Pior 1" CssClass="btn btn-warning fixed-bottom " /></h4>--%>
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

        <%-----------------------------------------------------------------------------------------------------------------------------------------------------%>

        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">Pontuação Total - por Mês e Ano - Filial Selecionada</h3>

                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                <i class="fa fa-minus"></i>
                            </button>

                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">

                        <div class="row justify-content-center col-md-12" style="height: 380px">

                            <asp:UpdatePanel ID="upPanel_AnoMes" runat="server">
                                <ContentTemplate>
                                    <div class="divGrupo">
                                        <asp:DropDownList AutoPostBack="true" class="form-control" Font-Size="10px" Height="30px" ID="selFilial1" runat="server" OnSelectedIndexChanged="selFilial1_SelectedIndexChanged" DataTextField="Desc"></asp:DropDownList>
                                    </div>

                                    <%--<uc2:wucLista_Filial_Empresa ID="wser" runat="server" />--%>

                                    <dxchartsui:WebChartControl Width="900" Height="350" ID="graph_Periodo" runat="server" DataSourceID="dsPontuacaoTotal_MesAno" BackColor="Transparent" CrosshairEnabled="True">
                                        <BorderOptions Visible="False" />
                                        <DiagramSerializable>
                                            <cc1:XYDiagram>
                                                <axisx visibleinpanesserializable="-1">
                                                    <label angle="90">
                                                    </label>
                                                    <range sidemarginsenabled="True" />
                                                </axisx>
                                                <axisy visibleinpanesserializable="-1" color="Transparent" visible="False">
                                                    <range sidemarginsenabled="True" />
                                                    <gridlines visible="False">
                                                    </gridlines>
                                                </axisy>
                                            </cc1:XYDiagram>
                                        </DiagramSerializable>
                                        <FillStyle FillMode="Empty"></FillStyle>
                                        <Legend Visibility="False"></Legend>
                                        <SeriesSerializable>
                                            <cc1:Series ArgumentDataMember="descPeriodo" Name="Series 1" ValueDataMembersSerializable="Nota" LabelsVisibility="True">
                                                <viewserializable>
                                                    <cc1:SideBySideBarSeriesView>
                                                    </cc1:SideBySideBarSeriesView>
                                                </viewserializable>
                                                <labelserializable>
                                                    <cc1:SideBySideBarSeriesLabel LineVisible="True" Font="Tahoma, 10pt" Indent="4" Position="TopInside">
                                                        <fillstyle>
                                                            <optionsserializable>
                                                                <cc1:SolidFillOptions />
                                                            </optionsserializable>
                                                        </fillstyle>
                                                        <pointoptionsserializable>
                                                            <cc1:PointOptions>
                                                                <valuenumericoptions format="Number" />
                                                            </cc1:PointOptions>
                                                        </pointoptionsserializable>
                                                    </cc1:SideBySideBarSeriesLabel>
                                                </labelserializable>
                                                <legendpointoptionsserializable>
                                                    <cc1:PointOptions>
                                                        <valuenumericoptions format="Number" />
                                                    </cc1:PointOptions>
                                                </legendpointoptionsserializable>
                                            </cc1:Series>
                                        </SeriesSerializable>
                                        <SeriesTemplate>
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
                                        </SeriesTemplate>
                                        <CrosshairOptions>
                                            <commonlabelpositionserializable>
                                                <cc1:CrosshairMousePosition />
                                            </commonlabelpositionserializable>
                                        </CrosshairOptions>
                                        <ToolTipOptions>
                                            <tooltippositionserializable>
                                                <cc1:ToolTipMousePosition />
                                            </tooltippositionserializable>
                                        </ToolTipOptions>
                                    </dxchartsui:WebChartControl>

                                    <asp:SqlDataSource ID="dsPontuacaoTotal_MesAno" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.sp_TotalAnoMes" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL_NA" Type="Int16" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                            <br />
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

        <%-----------------------------------------------------------------------------------------------------------------------------------------------%>

        <div class="row">
            <div class="col-md-12">
                <div class="box">
                    <div class="box-header with-border">
                        <h3 class="box-title">Pontuação - por Tipo de Loja e Regional</h3>
                        <div class="box-tools pull-right">
                            <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                <i class="fa fa-minus"></i>
                            </button>

                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">

                        <div class="row justify-content-center" style="margin-left: 25px">


                            <dx:ASPxPageControl ID="pcDados" runat="server" ActiveTabIndex="0">

                                <TabPages>

                                    <dx:TabPage Text="Todas Filiais">
                                        <TabStyle BackColor="#CCFFCC">
                                        </TabStyle>
                                        <ContentCollection>
                                            <dx:ContentControl runat="server" SupportsDisabledAttribute="True">

                                                <h5>
                                                    <asp:Label ID="lblTodasFiliais" runat="server" Text=""></asp:Label></h5>

                                                <dxchartsui:WebChartControl ID="graph_PontuacaoTodas" runat="server" AppearanceNameSerializable="Nature Colors" DataSourceID="dsTodas" Height="450px" Width="990px">
                                                    <DiagramSerializable>
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
                                                    </DiagramSerializable>
                                                    <FillStyle>
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </FillStyle>
                                                    <Legend Visibility="False"></Legend>
                                                    <SeriesSerializable>
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
                                                    </SeriesSerializable>
                                                    <SeriesTemplate>
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
                                                    </SeriesTemplate>
                                                    <CrosshairOptions>
                                                        <commonlabelpositionserializable>
                                                            <cc1:CrosshairMousePosition />
                                                        </commonlabelpositionserializable>
                                                    </CrosshairOptions>
                                                    <ToolTipOptions>
                                                        <tooltippositionserializable>
                                                            <cc1:ToolTipMousePosition />
                                                        </tooltippositionserializable>
                                                    </ToolTipOptions>
                                                </dxchartsui:WebChartControl>

                                                <div id="div1" runat="server">
                                                    <asp:SqlDataSource ID="dsTodas" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.usp_BuscarPontuacaoTotal_Gigante" SelectCommandType="StoredProcedure">
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

                                    <dx:TabPage Text="Regional Samoel">
                                        <TabStyle BackColor="#FFFFCC">
                                        </TabStyle>
                                        <ContentCollection>
                                            <dx:ContentControl ID="ContentControl9" runat="server" SupportsDisabledAttribute="True">

                                                <h5>
                                                    <asp:Label ID="lblRegional1016" runat="server" Text=""></asp:Label></h5>


                                                <div>
                                                    <dxchartsui:WebChartControl ID="graph_Regional1016" runat="server" DataSourceID="dsPontuacaoRegional1016" AppearanceNameSerializable="Nature Colors" Height="450px" Width="990px">
                                                        <DiagramSerializable>
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
                                                        </DiagramSerializable>
                                                        <FillStyle>
                                                            <optionsserializable>
                                                                <cc1:SolidFillOptions></cc1:SolidFillOptions>
                                                            </optionsserializable>
                                                        </FillStyle>

                                                        <Legend Visibility="False"></Legend>
                                                        <SeriesSerializable>
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
                                                        </SeriesSerializable>

                                                        <SeriesTemplate>
                                                            <viewserializable>
                                                                <cc1:SideBySideBarSeriesView></cc1:SideBySideBarSeriesView>
                                                            </viewserializable>
                                                            <labelserializable>
                                                                <cc1:SideBySideBarSeriesLabel LineVisible="True">
                                                                    <fillstyle>
                                                                        <optionsserializable>
                                                                            <cc1:SolidFillOptions></cc1:SolidFillOptions>
                                                                        </optionsserializable>
                                                                    </fillstyle>
                                                                    <pointoptionsserializable>
                                                                        <cc1:PointOptions></cc1:PointOptions>
                                                                    </pointoptionsserializable>
                                                                </cc1:SideBySideBarSeriesLabel>
                                                            </labelserializable>
                                                            <legendpointoptionsserializable>
                                                                <cc1:PointOptions></cc1:PointOptions>
                                                            </legendpointoptionsserializable>
                                                        </SeriesTemplate>

                                                        <CrosshairOptions>
                                                            <commonlabelpositionserializable>
                                                                <cc1:CrosshairMousePosition></cc1:CrosshairMousePosition>
                                                            </commonlabelpositionserializable>
                                                        </CrosshairOptions>

                                                        <ToolTipOptions>
                                                            <tooltippositionserializable>
                                                                <cc1:ToolTipMousePosition></cc1:ToolTipMousePosition>
                                                            </tooltippositionserializable>
                                                        </ToolTipOptions>
                                                    </dxchartsui:WebChartControl>
                                                    <asp:SqlDataSource ID="dsPontuacaoRegional1016" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.usp_BuscarPontuacaoTotal_Regional_Gigante" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" />
                                                            <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                                            <asp:SessionParameter Name="idRegional" Type="Int16" DefaultValue="1016" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </div>

                                            </dx:ContentControl>
                                        </ContentCollection>
                                    </dx:TabPage>

                                </TabPages>
                            </dx:ASPxPageControl>
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
                            <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                <i class="fa fa-minus"></i>
                            </button>

                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">

                        <div class="row justify-content-center" style="margin-left: 25px">

                            <div id="divDadosDepartamento">

                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>

                                        <h5>
                                            <asp:Label ID="lblDepartamento" runat="server" Text="" Font-Bold="true"></asp:Label></h5>

                                        <div class="divGrupoLegenda">
                                            Grupo:
                                        </div>

                                        <div class="divGrupo" style="padding: 10px 0 10px 0">
                                            <asp:DropDownList AutoPostBack="true" class="form-control" Font-Size="10px" Height="30px" ID="selGrupo1" runat="server" DataTextField="Desc" OnSelectedIndexChanged="selGrupo1_SelectedIndexChanged"></asp:DropDownList>
                                        </div>

                                        <dxchartsui:WebChartControl ID="graph_Subgrupo" runat="server" AppearanceNameSerializable="Nature Colors" DataSourceID="dsSubgrupoDados" Height="450px" Width="1020px" CrosshairEnabled="True">
                                            <DiagramSerializable>
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
                                            </DiagramSerializable>
                                            <FillStyle>
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </FillStyle>
                                            <Legend Visibility="False"></Legend>
                                            <SeriesSerializable>
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
                                            </SeriesSerializable>
                                            <SeriesTemplate>
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
                                            </SeriesTemplate>
                                            <CrosshairOptions>
                                                <commonlabelpositionserializable>
                                                    <cc1:CrosshairMousePosition />
                                                </commonlabelpositionserializable>
                                            </CrosshairOptions>
                                            <ToolTipOptions>
                                                <tooltippositionserializable>
                                                    <cc1:ToolTipMousePosition />
                                                </tooltippositionserializable>
                                            </ToolTipOptions>
                                        </dxchartsui:WebChartControl>

                                        <div id="dsSubgrupo" runat="server">
                                            <asp:SqlDataSource ID="dsSubgrupoDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.uspBuscar_Subgrupo_Gigante" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" />
                                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                                    <asp:SessionParameter Name="idGrupo" SessionField="sGRUPO" Type="Byte" />
                                                </SelectParameters>
                                            </asp:SqlDataSource>
                                        </div>

                                        <br />
                                    </ContentTemplate>
                                </asp:UpdatePanel>

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
                            <button type="button" class="btn btn-box-tool" data-widget="collapse">
                                <i class="fa fa-minus"></i>
                            </button>

                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">

                        <div class="row justify-content-center" style="margin-left: 25px">

                            <div id="div6">

                                <asp:UpdatePanel ID="UpdatePanel3" runat="server">
                                    <ContentTemplate>

                                        <br />

                                        <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0">

                                            <TabPages>

                                                <dx:TabPage Text="Todas Filiais">
                                                    <TabStyle BackColor="#CCFFCC">
                                                    </TabStyle>
                                                    <ContentCollection>
                                                        <dx:ContentControl ID="ContentControl1" runat="server" SupportsDisabledAttribute="True">

                                                            <br />

                                                            <h5>
                                                                <asp:Label ID="lblNaoConforme" runat="server" Text="" Font-Bold="true"></asp:Label></h5>

                                                            <dxchartsui:WebChartControl ID="graphNaoConforme" runat="server" AppearanceNameSerializable="Northern Lights" DataSourceID="dsNaoConforme" Height="450px" Width="1020px" PaletteName="Black and White">
                                                                <DiagramSerializable>
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
                                                                </DiagramSerializable>
                                                                <FillStyle>
                                                                    <optionsserializable>
                                                                        <cc1:SolidFillOptions />
                                                                    </optionsserializable>
                                                                </FillStyle>
                                                                <Legend Visibility="False"></Legend>
                                                                <SeriesSerializable>
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
                                                                </SeriesSerializable>
                                                                <SeriesTemplate>
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
                                                                </SeriesTemplate>
                                                                <CrosshairOptions>
                                                                    <commonlabelpositionserializable>
                                                                        <cc1:CrosshairMousePosition />
                                                                    </commonlabelpositionserializable>
                                                                </CrosshairOptions>
                                                                <ToolTipOptions>
                                                                    <tooltippositionserializable>
                                                                        <cc1:ToolTipMousePosition />
                                                                    </tooltippositionserializable>
                                                                </ToolTipOptions>
                                                            </dxchartsui:WebChartControl>

                                                            <asp:SqlDataSource ID="dsNaoConforme" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.usp_BuscarQtdeNaoConforme_Gigante" SelectCommandType="StoredProcedure">
                                                                <SelectParameters>
                                                                    <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" />
                                                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>

                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:TabPage>

                                                <dx:TabPage Text="por Departamento">
                                                    <ContentCollection>
                                                        <dx:ContentControl ID="ContentControl2" runat="server" SupportsDisabledAttribute="True">

                                                            <h5>
                                                                <asp:Label ID="lblNaoConformePorDepartamento" runat="server" Text="" Font-Bold="true"></asp:Label></h5>

                                                            <div class="divGrupoLegenda">
                                                                Grupo:
                                                            </div>

                                                            <div class="divGrupo" style="padding: 10px 0 10px 0">
                                                                <asp:DropDownList AutoPostBack="true" class="form-control" Font-Size="10px" Height="30px" ID="selGrupo2" runat="server" DataTextField="Desc" OnSelectedIndexChanged="selGrupo2_SelectedIndexChanged"></asp:DropDownList>
                                                            </div>

                                                            <dxchartsui:WebChartControl ID="WebChartControl2" runat="server" AppearanceNameSerializable="Northern Lights" DataSourceID="dsNaoConformeSubgrupo" Height="450px" Width="1020px" PaletteName="Black and White">
                                                                <DiagramSerializable>
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
                                                                </DiagramSerializable>
                                                                <FillStyle>
                                                                    <optionsserializable>
                                                                        <cc1:SolidFillOptions />
                                                                    </optionsserializable>
                                                                </FillStyle>
                                                                <Legend Visibility="False"></Legend>
                                                                <SeriesSerializable>
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
                                                                </SeriesSerializable>
                                                                <SeriesTemplate>
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
                                                                </SeriesTemplate>
                                                                <CrosshairOptions>
                                                                    <commonlabelpositionserializable>
                                                                        <cc1:CrosshairMousePosition />
                                                                    </commonlabelpositionserializable>
                                                                </CrosshairOptions>
                                                                <ToolTipOptions>
                                                                    <tooltippositionserializable>
                                                                        <cc1:ToolTipMousePosition />
                                                                    </tooltippositionserializable>
                                                                </ToolTipOptions>
                                                            </dxchartsui:WebChartControl>

                                                            <asp:SqlDataSource ID="dsNaoConformeSubgrupo" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.uspBuscar_QtdeNaoConforme_Subgrupo_Gigante" SelectCommandType="StoredProcedure">
                                                                <SelectParameters>
                                                                    <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" />
                                                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                                                    <asp:SessionParameter Name="idGrupo" SessionField="sGRUPO_NA" Type="Byte" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>


                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:TabPage>

                                                <dx:TabPage Text="por Filial">
                                                    <ContentCollection>
                                                        <dx:ContentControl ID="ContentControl8" runat="server" SupportsDisabledAttribute="True">

                                                            <h5>
                                                                <asp:Label ID="lblNaoConformePorFilial" runat="server" Text="" Font-Bold="true"></asp:Label></h5>

                                                            <div class="divGrupo" runat="server" style="padding-bottom: 15px">
                                                                <asp:DropDownList AutoPostBack="true" class="form-control" Font-Size="10px" Height="30px" ID="selFilial2" runat="server" DataTextField="Desc" OnSelectedIndexChanged="selFilial2_SelectedIndexChanged"></asp:DropDownList>
                                                            </div>

                                                            <dxchartsui:WebChartControl ID="graphNaoConformeDepartamentoFilial" runat="server" AppearanceNameSerializable="Northern Lights" DataSourceID="dsQtdeNaoConforme_Subgrupo_porFilial" Height="450px" Width="1020px" PaletteName="Black and White">
                                                                <DiagramSerializable>
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
                                                                </DiagramSerializable>
                                                                <FillStyle>
                                                                    <optionsserializable>
                                                                        <cc1:SolidFillOptions />
                                                                    </optionsserializable>
                                                                </FillStyle>
                                                                <Legend Visibility="False"></Legend>
                                                                <SeriesSerializable>
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
                                                                </SeriesSerializable>
                                                                <SeriesTemplate>
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
                                                                </SeriesTemplate>
                                                                <CrosshairOptions>
                                                                    <commonlabelpositionserializable>
                                                                        <cc1:CrosshairMousePosition />
                                                                    </commonlabelpositionserializable>
                                                                </CrosshairOptions>
                                                                <ToolTipOptions>
                                                                    <tooltippositionserializable>
                                                                        <cc1:ToolTipMousePosition />
                                                                    </tooltippositionserializable>
                                                                </ToolTipOptions>
                                                            </dxchartsui:WebChartControl>

                                                            <asp:SqlDataSource ID="dsQtdeNaoConforme_Subgrupo_porFilial" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.uspBuscar_QtdeNaoConforme_Subgrupo_porFilial" SelectCommandType="StoredProcedure">
                                                                <SelectParameters>
                                                                    <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" />
                                                                    <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL_NA" Type="Int16" />
                                                                </SelectParameters>
                                                            </asp:SqlDataSource>


                                                        </dx:ContentControl>
                                                    </ContentCollection>
                                                </dx:TabPage>

                                            </TabPages>

                                        </dx:ASPxPageControl>
                                    </ContentTemplate>
                                </asp:UpdatePanel>

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

        <asp:Label ID="lblError" runat="server" Text="Label" ForeColor="Red"></asp:Label>

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

