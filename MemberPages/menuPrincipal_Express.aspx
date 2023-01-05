<%@ Page Title="Express - Dashboard" Trace="false"  Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="menuPrincipal_Express.aspx.vb" Inherits="MemberPages_menuPrincipal_Express" %>

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
<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>




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
        <dx:ASPxTimer ID="ASPxTimer1" runat="server" Interval="60000">
            <ClientSideEvents Tick="function(s, e) {  
        cbPanel.PerformCallback();  
    }" />  
        </dx:ASPxTimer>  

     <dx:ASPxPageControl ID="TabControl" runat="server" Width="100%" ActiveTabIndex="0" EnableHierarchyRecreation="True" Theme="SoftOrange" >
        <TabPages>

            <dx:TabPage Text="Vendas">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl1" runat="server">

    

    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
          Dashboard - Principal
        <small>Loja 59 - Condor Express</small>
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

						<div class="widget-body" style="overflow-x:auto">
							<div class="widget-main">
								
                                <dx:ASPxGridView ID="gridProjecao" runat="server" AutoGenerateColumns="False" DataSourceID="dsProjecao" EnableTheming="True" Theme="Mulberry" Width="100%" Font-Size="Large">
                                    <SettingsBehavior AllowFocusedRow="True" />
                                    <SettingsText Title="Projeção Venda Hoje" />
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Projeção Venda" FieldName="vlrProjecao" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                            <CellStyle HorizontalAlign="Right">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Crescim. AA" FieldName="percCresc" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Ating. Meta" FieldName="percMeta" ShowInCustomizationForm="True" VisibleIndex="4">
                                            <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Período" FieldName="myDesc" ShowInCustomizationForm="True" VisibleIndex="0">
                                            <CellStyle HorizontalAlign="Left" Wrap="False">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta" ShowInCustomizationForm="True" VisibleIndex="1">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
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
                                        <Cell Font-Size="Small" HorizontalAlign="Center">
                                        </Cell>
                                    </Styles>
                                </dx:ASPxGridView>        
                                <asp:SqlDataSource ID="dsProjecao" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="Dashboard.usp_Buscar_Projecao_Vendas_Diarias" SelectCommandType="StoredProcedure">
                                      <SelectParameters>
                                       <asp:SessionParameter Name="Departamento" SessionField="sDEPARTAMENTO" Type="String" />
                                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                                   </SelectParameters>
                                </asp:SqlDataSource>
                                								
							</div>
						</div>
					</div>
				</div><!-- /.span -->

                <div class="col-xs-12 col-sm-2">
					<div class="widget-box">
						<div class="widget-header"><h6 class="widget-title"><span class="fa fa-bar-chart-o" ></span> &nbsp;% Ag. 23 - <asp:Label ID="lbl_1_2" runat="server"></asp:Label> </h6>
						
                            <div class="widget-toolbar">
								<a href="#" data-action="collapse">
									<i class="ace-icon fa fa-chevron-up"></i>
								</a>

								<a href="#" data-action="close">
									<i class="ace-icon fa fa-times"></i>
								</a>
							</div>

						</div>                       

						<div class="widget-body" >
							<div class="widget-main">
								
							    <dxchartsui:WebChartControl ID="chartPercentual" runat="server" CrosshairEnabled="True" DataSourceID="dsQuebraPercentual" Height="200px" Width="200px">
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
                                    <Legend AlignmentVertical="BottomOutside" Direction="BottomToTop" DockTargetName="Default Pane" MarkerSize="21, 21" MaxCrosshairContentWidth="200" MaxVerticalPercentage="20" Name="Default Legend" TextOffset="10" VerticalIndent="1" Visibility="True" AlignmentHorizontal="Center">
                                        <margins bottom="1" left="1" right="1" top="1" />
                                        <border visibility="True" />
                                        <title wordwrap="True"></title></Legend>
                                    <SeriesSerializable>
                                        <cc1:Series ArgumentDataMember="Caption" ArgumentScaleType="Qualitative" LabelsVisibility="True" Name="Realizado" ValueDataMembersSerializable="percAg23">
                                        <viewserializable>
                                            <cc1:SideBySideBarSeriesView Color="216, 25, 79, 177" BarWidth="0.7">
                                                <fillstyle fillmode="Solid">
                                                </fillstyle>
                                            </cc1:SideBySideBarSeriesView>
                                        </viewserializable>
                                        <labelserializable>
                                            <cc1:SideBySideBarSeriesLabel Position="Top" TextPattern="{V:n2}">
                                            </cc1:SideBySideBarSeriesLabel>
                                        </labelserializable>
                                        </cc1:Series>
                                        <cc1:Series ArgumentDataMember="Caption" ArgumentScaleType="Qualitative" LabelsVisibility="True" Name="Meta" ValueDataMembersSerializable="percAg23meta">
                                        <viewserializable>
                                            <cc1:SideBySideBarSeriesView Color="218, 0, 176, 80" Transparency="75" BarWidth="0.7">
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
                                <asp:SqlDataSource ID="dsQuebraPercentual" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="Dashboard.usp_Perdas_Empresa_Metas_x_Realizado" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                        <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                        
                                    </SelectParameters>
                                </asp:SqlDataSource>
								
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
                                                <dx:ArcScaleComponent AcceptOrder="0" AppearanceMajorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMajorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceTickmarkText-Font="Tahoma, 8pt" AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#999999&quot;/&gt;" Center="125, 159" EndAngle="0" MajorTickCount="20" MajorTickmark-AllowTickOverlap="True" MajorTickmark-FormatString="{0:F1}" MajorTickmark-ShapeOffset="-1" MajorTickmark-ShapeType="Circular_Style27_1" MajorTickmark-TextOffset="18" MajorTickmark-TextOrientation="Radial" MaxValue="20" MinorTickCount="5" MinorTickmark-ShapeOffset="4" MinorTickmark-ShapeType="Circular_Style27_1" MinorTickmark-ShowTick="False" MinValue="5" Name="scale1" RadiusX="101" RadiusY="101" StartAngle="-180" Value="1">
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
                                                <dx:ArcScaleComponent AcceptOrder="0" AppearanceMajorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMajorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-BorderBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceMinorTickmark-ContentBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:White&quot;/&gt;" AppearanceTickmarkText-TextBrush="&lt;BrushObject Type=&quot;Solid&quot; Data=&quot;Color:#999999&quot;/&gt;" Center="125, 159" EndAngle="0" MajorTickCount="20" MajorTickmark-AllowTickOverlap="True" MajorTickmark-FormatString="{0:F1}" MajorTickmark-ShapeOffset="-1" MajorTickmark-ShapeType="Circular_Style27_1" MajorTickmark-TextOffset="18" MajorTickmark-TextOrientation="Radial" MaxValue="20" MinorTickCount="5" MinorTickmark-ShapeOffset="4" MinorTickmark-ShapeType="Circular_Style27_1" MinorTickmark-ShowTick="False" MinValue="5" Name="scale1" RadiusX="101" RadiusY="101" StartAngle="-180" Value="1">
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

      <div class="row Quebra_Pagina_Row">
                
               

                <div class="col-xs-12 col-sm-4">
					<div class="widget-box">
						<div class="widget-header"><h6 class="widget-title"><span class="fa fa-desktop" ></span> &nbsp; % Cresc. Quantidade <asp:Label ID="lbl_graph_horizontal" runat="server"></asp:Label></h6>
						
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

                                <dxchartsui:WebChartControl ID="graphQtdeCresc" runat="server" DataSourceID="dsGrafico_Crescimento_Qtde" Height="370px" Width="585px">

                                    <BorderOptions Visibility="False" />

                                    <DiagramSerializable>
                                        <cc1:XYDiagram Rotated="True">
                                        <axisx visibleinpanesserializable="-1" minorcount="1" reverse="True" visibility="True">
                                        <qualitativescaleoptions autogrid="False" gridoffset="1" /><tickmarks minorlength="1" minorvisible="False" /><label font="Arial, 7.5pt"></label><gridlines visible="True"></gridlines></axisx>
                                        <axisy visibleinpanesserializable="-1" visibility="False">
                                        <gridlines visible="False"></gridlines></axisy>
                                        </cc1:XYDiagram>
                                    </DiagramSerializable>

<Legend Name="Default Legend" Visibility="False"></Legend>

                                    <SeriesSerializable>
                                        <cc1:Series ArgumentDataMember="Secao" ArgumentScaleType="Qualitative" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="percCresc">
                                        <viewserializable>
                                            <cc1:SideBySideBarSeriesView Color="240, 0, 0">
                                                <fillstyle fillmode="Solid">
                                                </fillstyle>
                                            </cc1:SideBySideBarSeriesView>
                                        </viewserializable>
                                        <labelserializable>
                                            <cc1:SideBySideBarSeriesLabel Position="Top" Font="Tahoma, 8pt, style=Bold">
                                            <border visibility="False" /></cc1:SideBySideBarSeriesLabel>
                                        </labelserializable>
                                        </cc1:Series>
                                    </SeriesSerializable>

                                </dxchartsui:WebChartControl>
								
								
							    <asp:SqlDataSource ID="dsGrafico_Crescimento_Qtde" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="Dashboard.uspCrescimentoQtde" SelectCommandType="StoredProcedure">
                                    <SelectParameters>                                      
                                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                                   </SelectParameters>
							    </asp:SqlDataSource>
								
								
							</div>
						</div>
					</div>
				</div>

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

                        <dx:ASPxGridView ID="gridAgendaItem" runat="server" AutoGenerateColumns="False"  DataSourceID="ds_Dashboard_Agenda23_por_Item" EnableTheming="True" Font-Size="Medium" KeyFieldName="CodProduto" Theme="PlasticBlue" Width="100%">
                                    <SettingsPager Mode="ShowAllRecords" PageSize="14">
                                        <Summary AllPagesText="Páginas: {0} - {1} ({2} produtoss)" Text="Paginá {0} of {1} ({2} produtos)" />
                                        <PageSizeItemSettings Caption="Tamanho da Página:">
                                        </PageSizeItemSettings>
                                    </SettingsPager>
                                    <Settings ShowVerticalScrollBar="True" VerticalScrollableHeight="235" />
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
                               
                                <asp:SqlDataSource ID="ds_Dashboard_Agenda23_por_Item" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="Dashboard.usp_Buscar_Agenda23_por_Item" SelectCommandType="StoredProcedure">
                                    <SelectParameters>                                      
                                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
                                   </SelectParameters>
                                </asp:SqlDataSource>
								
							</div>
						</div>
					</div>
				</div><!-- /.span -->

                         

      </div> 
                        
      

     
        

            
        
<%------------------------------------------------------------------------------------------------------------------------------------------------------%>


        <asp:Label ID="lblError" runat="server" Text="Label"  ForeColor="Red" Visible="True"></asp:Label>
        <asp:Label ID="lblOBS" runat="server" Text=""></asp:Label>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>

                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>


            <dx:TabPage Text="Crescimento">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl3" runat="server">

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
							<div class="widget-main">
								
                                        <uc2:wuc_KPI_Secao_Depto ID="wuc_KPI_Secao_Depto2" runat="server" />

                                								
							</div>
						</div>
					</div>
				</div><!-- /.span -->
              
           </div>   

                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>


            <dx:TabPage Text="Analise Seção">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl2" runat="server">

                                <dx:ASPxCallbackPanel ID="ASPxCallbackPanel1" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis"  Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
            <Images>
                <LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
            </Images>

            <LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
                <PanelCollection>
                    <dx:PanelContent>

<%-------------------------------------------------------------------------------------------------------------------------------------------------------%>

      
        
      <div class="row Quebra_Pagina_Row">
        <div class="col-md-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">Número de Clientes - Comparativo com o Ano Anterior </h3>

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
							<h4 class="widget-title"><span class="glyphicon glyphicon-shopping-cart"></span> Numero de Clientes &nbsp e &nbsp <span class="glyphicon glyphicon-list-alt"></span> Ticket Médio - Total da Loja</h4>

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
								
                                <dxchartsui:WebChartControl ID="WebChartControl1" runat="server" DataSourceID="dsClientesNumeros" Height="550px" Width="900px" CrosshairEnabled="True">
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
                                                <cc1:XYDiagramPane Name="Pane_Ticket_Medio" PaneID="0">
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
                                        <cc1:Series ArgumentDataMember="descMes" Name="2018" ValueDataMembersSerializable="numClientesAA" LabelsVisibility="True">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Transparency="90">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="Top" EnableAntialiasing="True" TextPattern="{V:n0}">
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
                                        <cc1:Series ArgumentDataMember="descMes" Name="2019" ValueDataMembersSerializable="numClientes" LabelsVisibility="True">
                                            <viewserializable>
                                                <cc1:SideBySideBarSeriesView Transparency="90">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" EnableAntialiasing="True" Position="Top" TextPattern="{V:n0}">
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
                                                <cc1:LineSeriesView Color="0, 128, 0" MarkerVisibility="True">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions size="5" >
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
                                                <cc1:SideBySideBarSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="190, 70, 130, 180" PaneName="Pane_Ticket_Medio" Transparency="65">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="Top" EnableAntialiasing="True" TextPattern="{V:c2}">
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
                                                <cc1:SideBySideBarSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="205, 205, 92, 92" PaneName="Pane_Ticket_Medio" Transparency="50">
                                                    <fillstyle fillmode="Solid">
                                                        <optionsserializable>
                                                            <cc1:SolidFillOptions />
                                                        </optionsserializable>
                                                    </fillstyle>
                                                </cc1:SideBySideBarSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" EnableAntialiasing="True" Position="Top" TextPattern="{V:c2}">
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
                                                <cc1:LineSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="Green" PaneName="Pane_Ticket_Medio">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions color="0, 128, 0" size="5" >
                                                        <fillstyle fillmode="Solid">
                                                            <optionsserializable>
                                                                <cc1:SolidFillOptions />
                                                            </optionsserializable>
                                                        </fillstyle>
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" EnableAntialiasing="True" Position="Center" TextPattern="{V:c2}">
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
                                    <asp:SqlDataSource ID="dsClientesNumeros" runat="server" ConnectionString="<%$ ConnectionStrings:DW_VendasConnectionString %>" SelectCommand="uspBuscarNumeroDeClientes_12Meses" SelectCommandType="StoredProcedure">
                                        <SelectParameters>
                                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                								
							</div>
						</div>
					</div>
				</div><!-- /.span -->


				<div class="col-md-12">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="glyphicon glyphicon-shopping-cart"></span> Numero de Clientes &nbsp e &nbsp <span class="glyphicon glyphicon-list-alt"></span> Ticket Médio - Departamento 1 - Mercearia  &nbsp &nbsp &nbsp &nbsp <span class="label label-xlg label-primary arrowed arrowed-right" ><a href="menuPrincipal_Depto1.aspx" target="_blank">Abrir Seções</a></span></h4>
                                                        

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
								
                                <dxchartsui:WebChartControl ID="graph_Depto1" runat="server" DataSourceID="dsClientesNumerosDepto" Height="550px" Width="900px" AppearanceNameSerializable="Nature Colors" CrosshairEnabled="True">
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
                                        <cc1:Series ArgumentDataMember="descMes" Name="2018" ValueDataMembersSerializable="numClientesAA" LabelsVisibility="True">
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
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="Top" EnableAntialiasing="True" TextPattern="{V:n0}">
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
                                        <cc1:Series ArgumentDataMember="descMes" Name="2019" ValueDataMembersSerializable="numClientes" LabelsVisibility="True">
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
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" EnableAntialiasing="True" Position="Top" TextPattern="{V:n0}">
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
                                                <cc1:LineSeriesView Color="0, 128, 0" MarkerVisibility="True">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions size="5" >
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" EnableAntialiasing="True" Position="Center" TextPattern="{V:n0}">
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
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="Top" EnableAntialiasing="True" TextPattern="{V:c2}">
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
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" EnableAntialiasing="True" Position="Top" TextPattern="{V:c2}">
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
                                                <cc1:LineSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="Green" PaneName="Pane_Ticket_Medio">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions color="0, 128, 0" size="5" >
                                                        <fillstyle fillmode="Solid">
                                                            <optionsserializable>
                                                                <cc1:SolidFillOptions />
                                                            </optionsserializable>
                                                        </fillstyle>
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" EnableAntialiasing="True" Position="Center" TextPattern="{V:c2}">
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
                                <asp:SqlDataSource ID="dsClientesNumerosDepto" runat="server" ConnectionString="<%$ ConnectionStrings:DW_VendasConnectionString %>" SelectCommand="uspBuscarNumeroDeClientes_12Meses_Depto" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                        <asp:SessionParameter Name="idDepto" DefaultValue="1" Type="Byte" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

								
							</div>
						</div>
					</div>
				</div><!--  /Depto 1 - Mercearia -->

				<div class="col-md-12">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="glyphicon glyphicon-shopping-cart"></span> Numero de Clientes &nbsp e &nbsp <span class="glyphicon glyphicon-list-alt"></span> Ticket Médio - Departamento 2 - Pereciveis  &nbsp &nbsp &nbsp &nbsp <span class="label label-xlg label-primary arrowed arrowed-right" ><a href="menuPrincipal_Depto2.aspx" target="_blank">Abrir Seções</a></span></h4>

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
								
                                <dxchartsui:WebChartControl ID="graph_Depto2" runat="server" DataSourceID="dsClientesNumerosDepto2" Height="550px" Width="900px" AppearanceNameSerializable="Nature Colors" CrosshairEnabled="True">
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
                                        <cc1:Series ArgumentDataMember="descMes" Name="2018" ValueDataMembersSerializable="numClientesAA" LabelsVisibility="True">
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
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="Top" EnableAntialiasing="True" TextPattern="{V:n0}">
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
                                        <cc1:Series ArgumentDataMember="descMes" Name="2019" ValueDataMembersSerializable="numClientes" LabelsVisibility="True">
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
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" EnableAntialiasing="True" Position="Top" TextPattern="{V:n0}">
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
                                                <cc1:LineSeriesView Color="0, 128, 0" MarkerVisibility="True">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions size="5" >
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" EnableAntialiasing="True" Position="Center" TextPattern="{V:n0}">
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
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="Top" EnableAntialiasing="True" TextPattern="{V:c2}">
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
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" EnableAntialiasing="True" Position="Top" TextPattern="{V:c2}">
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
                                                <cc1:LineSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="Green" PaneName="Pane_Ticket_Medio">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions color="0, 128, 0" size="5" >
                                                        <fillstyle fillmode="Solid">
                                                            <optionsserializable>
                                                                <cc1:SolidFillOptions />
                                                            </optionsserializable>
                                                        </fillstyle>
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" EnableAntialiasing="True" Position="Center" TextPattern="{V:c2}">
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
                                <asp:SqlDataSource ID="dsClientesNumerosDepto2" runat="server" ConnectionString="<%$ ConnectionStrings:DW_VendasConnectionString %>" SelectCommand="uspBuscarNumeroDeClientes_12Meses_Depto" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                        <asp:SessionParameter Name="idDepto" DefaultValue="2" Type="Byte" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

								
							</div>
						</div>
					</div>
				</div><!--  /Depto 2 - Pereciveis -->

				<div class="col-md-12">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="glyphicon glyphicon-shopping-cart"></span> Numero de Clientes &nbsp e &nbsp <span class="glyphicon glyphicon-list-alt"></span> Ticket Médio - Departamento 3 - Bazar  &nbsp &nbsp &nbsp &nbsp <span class="label label-xlg label-primary arrowed arrowed-right" ><a href="menuPrincipal_Depto3.aspx" target="_blank">Abrir Seções</a></span></h4>

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
								
                                <dxchartsui:WebChartControl ID="graph_Depto3" runat="server" DataSourceID="dsClientesNumerosDepto3" Height="550px" Width="900px" AppearanceNameSerializable="Nature Colors" CrosshairEnabled="True">
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
                                        <cc1:Series ArgumentDataMember="descMes" Name="2018" ValueDataMembersSerializable="numClientesAA" LabelsVisibility="True">
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
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="Top" TextPattern="{V:n0}">
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
                                        <cc1:Series ArgumentDataMember="descMes" Name="2019" ValueDataMembersSerializable="numClientes" LabelsVisibility="True">
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
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Position="Top" TextPattern="{V:n0}">
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
                                                <cc1:LineSeriesView Color="0, 128, 0" MarkerVisibility="True">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions size="5" >
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" Position="Center" TextPattern="{V:n0}">
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
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="Top" TextPattern="{V:c2}">
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
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Position="Top" TextPattern="{V:c2}">
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
                                                <cc1:LineSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="Green" PaneName="Pane_Ticket_Medio">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions color="0, 128, 0" size="5">
                                                        <fillstyle fillmode="Solid">
                                                            <optionsserializable>
                                                                <cc1:SolidFillOptions />
                                                            </optionsserializable>
                                                        </fillstyle>
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" Position="Center" TextPattern="{V:c2}">
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
                                <asp:SqlDataSource ID="dsClientesNumerosDepto3" runat="server" ConnectionString="<%$ ConnectionStrings:DW_VendasConnectionString %>" SelectCommand="uspBuscarNumeroDeClientes_12Meses_Depto" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                        <asp:SessionParameter Name="idDepto" DefaultValue="3" Type="Byte" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

								
							</div>
						</div>
					</div>
				</div><!--  /Depto 3 - Bazar -->

				<div class="col-md-12">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="glyphicon glyphicon-shopping-cart"></span> Numero de Clientes &nbsp e &nbsp <span class="glyphicon glyphicon-list-alt"></span> Ticket Médio - Departamento 4 - Textil  &nbsp &nbsp &nbsp &nbsp <span class="label label-xlg label-primary arrowed arrowed-right" ><a href="menuPrincipal_Depto4.aspx" target="_blank">Abrir Seções</a></span></h4>

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
								
                                <dxchartsui:WebChartControl ID="graph_Depto4" runat="server" DataSourceID="dsClientesNumerosDepto4" Height="550px" Width="900px" AppearanceNameSerializable="Nature Colors" CrosshairEnabled="True">
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
                                        <cc1:Series ArgumentDataMember="descMes" Name="2018" ValueDataMembersSerializable="numClientesAA" LabelsVisibility="True">
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
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="Top" TextPattern="{V:n0}">
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
                                        <cc1:Series ArgumentDataMember="descMes" Name="2019" ValueDataMembersSerializable="numClientes" LabelsVisibility="True">
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
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Position="Top" TextPattern="{V:n0}">
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
                                                <cc1:LineSeriesView Color="0, 128, 0" MarkerVisibility="True">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions size="5" >
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" Position="Center" TextPattern="{V:n0}">
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
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="Top" TextPattern="{V:c2}">
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
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Position="Top" TextPattern="{V:c2}">
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
                                                <cc1:LineSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="Green" PaneName="Pane_Ticket_Medio">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions color="0, 128, 0" size="5" >
                                                        <fillstyle fillmode="Solid">
                                                            <optionsserializable>
                                                                <cc1:SolidFillOptions />
                                                            </optionsserializable>
                                                        </fillstyle>
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" Position="Center" TextPattern="{V:c2}">
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
                                <asp:SqlDataSource ID="dsClientesNumerosDepto4" runat="server" ConnectionString="<%$ ConnectionStrings:DW_VendasConnectionString %>" SelectCommand="uspBuscarNumeroDeClientes_12Meses_Depto" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                        <asp:SessionParameter Name="idDepto" DefaultValue="4" Type="Byte" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

								
							</div>
						</div>
					</div>
				</div><!--  /Depto 4 - Textil -->

				<div class="col-md-12">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="glyphicon glyphicon-shopping-cart"></span> Numero de Clientes &nbsp e &nbsp <span class="glyphicon glyphicon-list-alt"></span> Ticket Médio - Departamento 5 - Eletrodomésticos  &nbsp &nbsp &nbsp &nbsp <span class="label label-xlg label-primary arrowed arrowed-right" ><a href="menuPrincipal_Depto5.aspx" target="_blank">Abrir Seções</a></span></h4>

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
								
                                <dxchartsui:WebChartControl ID="graph_Depto5" runat="server" DataSourceID="dsClientesNumerosDepto5" Height="550px" Width="900px" AppearanceNameSerializable="Nature Colors" CrosshairEnabled="True">
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
                                        <cc1:Series ArgumentDataMember="descMes" Name="2018" ValueDataMembersSerializable="numClientesAA" LabelsVisibility="True">
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
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="Top" EnableAntialiasing="True" TextPattern="{V:n0}">
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
                                        <cc1:Series ArgumentDataMember="descMes" Name="2019" ValueDataMembersSerializable="numClientes" LabelsVisibility="True">
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
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" EnableAntialiasing="True" Position="Top" TextPattern="{V:n0}">
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
                                                <cc1:LineSeriesView Color="0, 128, 0" MarkerVisibility="True">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions size="5" >
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" EnableAntialiasing="True" Position="Center" TextPattern="{V:n0}">
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
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" Indent="13" Position="Top" EnableAntialiasing="True" TextPattern="{V:c2}">
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
                                                <cc1:SideBySideBarSeriesLabel LineVisible="True" EnableAntialiasing="True" Position="Top" TextPattern="{V:c2}">
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
                                                <cc1:LineSeriesView AxisXName="Secondary AxisX 1" AxisYName="Secondary AxisY 1" Color="Green" PaneName="Pane_Ticket_Medio">
                                                    <linestyle dashstyle="Dash" thickness="1" />
                                                    <linemarkeroptions color="0, 128, 0" size="5" >
                                                        <fillstyle fillmode="Solid">
                                                            <optionsserializable>
                                                                <cc1:SolidFillOptions />
                                                            </optionsserializable>
                                                        </fillstyle>
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel LineVisible="True" Angle="270" EnableAntialiasing="True" Position="Center" TextPattern="{V:c2}">
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
                                <asp:SqlDataSource ID="dsClientesNumerosDepto5" runat="server" ConnectionString="<%$ ConnectionStrings:DW_VendasConnectionString %>" SelectCommand="uspBuscarNumeroDeClientes_12Meses_Depto" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                        <asp:SessionParameter Name="idDepto" DefaultValue="5" Type="Byte" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

								
							</div>
						</div>
					</div>
				</div><!--  /Depto 4 - Textil -->

              
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
        
      <div class="row Quebra_Pagina_Row">
                
                <div class="col-md-12">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"> Crescimento no Número de Clientes</h4>

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
								
                                <dxchartsui:WebChartControl ID="Graph" runat="server" DataSourceID="dsDados" Height="450px" Width="900px" CrosshairEnabled="True">
                                    <diagramserializable>
                                        <cc1:XYDiagram>
                                            <axisx visibleinpanesserializable="-1">
                                                <range sidemarginsenabled="True" />
                                            </axisx>
                                            <axisy visibleinpanesserializable="-1">
                                                <range sidemarginsenabled="True" />
                                            </axisy>
                                        </cc1:XYDiagram>
                                    </diagramserializable>
            <FillStyle><OptionsSerializable>
            <cc1:SolidFillOptions></cc1:SolidFillOptions>
            </OptionsSerializable>
            </FillStyle>

                                    <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="7"></legend>
                                    <seriesserializable>
                                        <cc1:Series LabelsVisibility="True" Name="Empresa" ArgumentDataMember="Periodo" ValueDataMembersSerializable="percCrescEmpresaMesas">                                                                     
                                            <viewserializable>
                                                <cc1:LineSeriesView MarkerVisibility="True">
                                                    <linemarkeroptions size="2" >
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel Angle="270" LineVisible="True" ResolveOverlappingMode="JustifyAroundPoint">
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
                                                </cc1:PointSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Number" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                        <cc1:Series LabelsVisibility="True" Name="Loja" ArgumentDataMember="Periodo" ValueDataMembersSerializable="percCrescLoja">
                                            <viewserializable>
                                                <cc1:LineSeriesView MarkerVisibility="True" Color="ForestGreen">
                                                    <linemarkeroptions size="2" >
                                                    </linemarkeroptions>
                                                </cc1:LineSeriesView>
                                            </viewserializable>
                                            <labelserializable>
                                                <cc1:PointSeriesLabel Angle="270" LineVisible="True" ResolveOverlappingMode="JustifyAroundPoint">
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
                                                </cc1:PointSeriesLabel>
                                            </labelserializable>
                                            <legendpointoptionsserializable>
                                                <cc1:PointOptions>
                                                    <valuenumericoptions format="Number" />
                                                </cc1:PointOptions>
                                            </legendpointoptionsserializable>
                                        </cc1:Series>
                                    </seriesserializable>

            <SeriesTemplate><ViewSerializable>
                <cc1:LineSeriesView MarkerVisibility="True">
                    <linemarkeroptions >
                    </linemarkeroptions>
                </cc1:LineSeriesView>
            </ViewSerializable>
            <LabelSerializable>
                <cc1:PointSeriesLabel LineVisible="True">
                    <fillstyle>
                        <optionsserializable>
                            <cc1:SolidFillOptions />
                        </optionsserializable>
                    </fillstyle>
                    <pointoptionsserializable>
                        <cc1:PointOptions>
                        </cc1:PointOptions>
                    </pointoptionsserializable>
                </cc1:PointSeriesLabel>
            </LabelSerializable>
            <LegendPointOptionsSerializable>
            <cc1:PointOptions></cc1:PointOptions>
            </LegendPointOptionsSerializable>
            </SeriesTemplate>

                                    <titles>
                                        <cc1:ChartTitle Font="Tahoma, 14pt" Indent="1" Text=" Percentual de Crescimento do Número de Clientes Mensal" WordWrap="True" />
                                    </titles>

            <CrosshairOptions><CommonLabelPositionSerializable>
            <cc1:CrosshairMousePosition></cc1:CrosshairMousePosition>
            </CommonLabelPositionSerializable>
            </CrosshairOptions>

            <ToolTipOptions><ToolTipPositionSerializable>
            <cc1:ToolTipMousePosition></cc1:ToolTipMousePosition>
            </ToolTipPositionSerializable>
            </ToolTipOptions>
                                </dxchartsui:WebChartControl>                                     
                    
		                        <asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:DW_VendasConnectionString %>" SelectCommand="dbo.sp_BuscarCrescimento" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                    </SelectParameters>
                                </asp:SqlDataSource>

                                								
							</div>
						</div>
					</div>
				</div><!-- /.span -->
              
           </div>   
        
      <div class="row Quebra_Pagina_Row">
                
                <div class="col-md-12">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"> Valor do Ticket Médio e Percentual de Crescimento do Ticket Médio - Últimos 12 meses</h4>

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
								
                                                        <dxchartsui:WebChartControl ID="Chart_TicketMedio" runat="server" DataSourceID="dsTicketMedio" Height="450px" Width="900px" CrosshairEnabled="True">
                            <diagramserializable>
                                <cc1:XYDiagram>
                                    <axisx visibleinpanesserializable="-1" reverse="True">
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

                            <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside" maxverticalpercentage="7"></legend>
                            <seriesserializable>
                                <cc1:Series LabelsVisibility="True" Name="TicketMedio" ArgumentDataMember="Periodo" ValueDataMembersSerializable="vlrTicketMedio">                                                                     
                                    <viewserializable>
                                        <cc1:SideBySideBarSeriesView Color="156, 128, 128, 255" Transparency="99">
                                            <fillstyle fillmode="Solid">
                                                <optionsserializable>
                                                    <cc1:SolidFillOptions />
                                                </optionsserializable>
                                            </fillstyle>
                                        </cc1:SideBySideBarSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:SideBySideBarSeriesLabel LineVisible="True" ResolveOverlappingMode="Default" EnableAntialiasing="True" Position="Top" TextPattern="{V:c2}">
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
                                <cc1:Series LabelsVisibility="True" Name="% de Crescimento" ArgumentDataMember="Periodo" ValueDataMembersSerializable="percCresc">
                                    <viewserializable>
                                        <cc1:LineSeriesView MarkerVisibility="True" Color="ForestGreen">
                                            <linemarkeroptions size="2" >
                                            </linemarkeroptions>
                                        </cc1:LineSeriesView>
                                    </viewserializable>
                                    <labelserializable>
                                        <cc1:PointSeriesLabel Angle="270" LineVisible="True" ResolveOverlappingMode="Default" EnableAntialiasing="True" Position="Center" TextPattern="{V:n2}%">
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
                                        </cc1:PointSeriesLabel>
                                    </labelserializable>
                                    <legendpointoptionsserializable>
                                        <cc1:PointOptions>
                                            <valuenumericoptions format="Number" />
                                        </cc1:PointOptions>
                                    </legendpointoptionsserializable>
                                </cc1:Series>
                            </seriesserializable>

    <SeriesTemplate><ViewSerializable>
        <cc1:LineSeriesView MarkerVisibility="True">
            <linemarkeroptions >
            </linemarkeroptions>
        </cc1:LineSeriesView>
    </ViewSerializable>
    <LabelSerializable>
        <cc1:PointSeriesLabel LineVisible="True">
            <fillstyle>
                <optionsserializable>
                    <cc1:SolidFillOptions />
                </optionsserializable>
            </fillstyle>
            <pointoptionsserializable>
                <cc1:PointOptions>
                </cc1:PointOptions>
            </pointoptionsserializable>
        </cc1:PointSeriesLabel>
    </LabelSerializable>
    <LegendPointOptionsSerializable>
    <cc1:PointOptions></cc1:PointOptions>
    </LegendPointOptionsSerializable>
    </SeriesTemplate>

                            <titles>
                                <cc1:ChartTitle Font="Tahoma, 14pt" Indent="1" Text="Ticket Médio e Percentual de Crescimento Mensal" WordWrap="True" />
                            </titles>

    <CrosshairOptions><CommonLabelPositionSerializable>
    <cc1:CrosshairMousePosition></cc1:CrosshairMousePosition>
    </CommonLabelPositionSerializable>
    </CrosshairOptions>

    <ToolTipOptions><ToolTipPositionSerializable>
    <cc1:ToolTipMousePosition></cc1:ToolTipMousePosition>
    </ToolTipPositionSerializable>
    </ToolTipOptions>
                        </dxchartsui:WebChartControl>                                     
                    
		                <asp:SqlDataSource ID="dsTicketMedio" runat="server" ConnectionString="<%$ ConnectionStrings:DW_VendasConnectionString %>" SelectCommand="dbo.uspBuscarTicketMedio_12Meses" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                                								
							</div>
						</div>
					</div>
				</div><!-- /.span -->
              
           </div>   
            
        
<%------------------------------------------------------------------------------------------------------------------------------------------------------%>


        <asp:Label ID="Label1" runat="server" Text="Label"  ForeColor="Red" Visible="False"></asp:Label>
        <asp:Label ID="Label2" runat="server" Text=""></asp:Label>

                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>


                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>

       
            <dx:TabPage Text="Acima da Quantidade">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl5" runat="server">

                        <%--here--%>

                        <div style="clear:both; float:left; padding-bottom: 5px ; padding-right: 10px " >
                            <dx:ASPxRadioButton ID="rndTodos" runat="server" Text="Todas as Campanhas" GroupName="GroupCamp" Theme="Material" Checked="true" AutoPostBack="false">
                                <ClientSideEvents CheckedChanged="function(s, e) {
	cbPanelAcima.PerformCallback() ;
}" />
                            </dx:ASPxRadioButton>  
                        </div>
                           
                           <dx:ASPxRadioButton ID="rndRadio" runat="server" Text="Campanhas de Rádio e TV" GroupName="GroupCamp" Theme="Material" AutoPostBack="false" >
                               <ClientSideEvents CheckedChanged="function(s, e) {
cbPanelAcima.PerformCallback() ;	
}" />
                        </dx:ASPxRadioButton> 

                        <dx:ASPxCallbackPanel ID="cbPanelAcima" runat="server" Width="100%" ClientInstanceName="cbPanelAcima">
                            <PanelCollection>
                                <dx:PanelContent>
                                

                                                          <dx:ASPxGridView ID="gridAcima" runat="server" ClientInstanceName="gridAcima" AutoGenerateColumns="False" DataSourceID="dsAcima" EnableTheming="True" Theme="SoftOrange" Width="100%" >
                                             <Toolbars>
                <dx:GridViewToolbar EnableAdaptivity="true">
                    <Items>
                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
               
                                             <SettingsPager NumericButtonCount="25" PageSize="25">
                                                            </SettingsPager>
                                                            <Settings VerticalScrollableHeight="500" VerticalScrollBarMode="Visible" ShowFilterRow="True" />
                                                            <SettingsBehavior AllowFocusedRow="True" />
                                                            <SettingsResizing ColumnResizeMode="Control" />
                                                            <SettingsSearchPanel Visible="True" />
                                             <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                                                            <SettingsText Title="Projeção Venda Hoje" SearchPanelEditorNullText="Digite parte do Produto ou Campanha para filtrar..." />
                                                            <Columns>                                                                

                                                                <dx:GridViewDataTextColumn Caption="Dia" FieldName="Dia" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">                                                                    
                                                                    <PropertiesTextEdit DisplayFormatString="{0:dd/MM/yyyy} " EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle HorizontalAlign="Right"  ForeColor="Blue">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>

                                                                <dx:GridViewDataTextColumn Caption="Filial" FieldName="nomeFilial" ShowInCustomizationForm="True" VisibleIndex="1" Width="150px">
                                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                    <CellStyle HorizontalAlign="Left" Wrap="False">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>

                                                                <dx:GridViewDataTextColumn Caption="idProduto" FieldName="idProduto" ShowInCustomizationForm="True" VisibleIndex="2">                                                                   
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle HorizontalAlign="Right"  ForeColor="#009900">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>

                                                                <dx:GridViewDataTextColumn Caption="Descrição" FieldName="nomeProduto" ShowInCustomizationForm="True" VisibleIndex="3" Width="275px">
                                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                    <CellStyle HorizontalAlign="Left" Wrap="False">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                
                                                                <dx:GridViewDataTextColumn Caption="Volume" FieldName="Volume" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="6" SortIndex="0" SortOrder="Descending">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n3}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle HorizontalAlign="Right">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>

                                                                <dx:GridViewDataTextColumn Caption="Venda Item" FieldName="vlrVenda" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="7">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:C}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#336600" ForeColor="White" />
                                                                    <CellStyle ForeColor="#336600" HorizontalAlign="Right">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>

                                                                <dx:GridViewDataTextColumn Caption="Hora" FieldName="Hora" ShowInCustomizationForm="True" VisibleIndex="12">
                                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                    <CellStyle HorizontalAlign="Center" Wrap="False">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>

                                                                <dx:GridViewDataTextColumn Caption="nº PDV" FieldName="NUMPDV" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="13" ToolTip="Numero do PDV" Width="60px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </dx:GridViewDataTextColumn>

                                                                <dx:GridViewDataTextColumn Caption="nº<br>Cupom" FieldName="NUMCUPOM" ShowInCustomizationForm="True" VisibleIndex="14">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </dx:GridViewDataTextColumn>
                                                                
                                                                <dx:GridViewDataTextColumn Caption="Seq.<br>Cupom" FieldName="SEQCUPOM" ShowInCustomizationForm="True" VisibleIndex="15">                                                                    
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </dx:GridViewDataTextColumn>
                                                                
                                                                <dx:GridViewDataTextColumn Caption="Descrição da Campanha" FieldName="descCampanha" ShowInCustomizationForm="True" VisibleIndex="5" Width="275px">
                                                                    <Settings AutoFilterCondition="Contains" />
                                                                    <CellStyle HorizontalAlign="Left" Wrap="False">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="nº<br>Campanha" FieldName="idCampanha" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                </dx:GridViewDataTextColumn>
                                                                
                                                                <dx:GridViewDataTextColumn Caption="Venda Total" FieldName="VALORTOTALVENDA" ShowInCustomizationForm="True" ToolTip="Venda Total do Cupom (todos os itens)" VisibleIndex="8">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:C}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle BackColor="#000099" ForeColor="White" HorizontalAlign="Center" />
                                                                    <CellStyle ForeColor="Blue" HorizontalAlign="Right">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                
                                                                <dx:GridViewBandColumn Caption="Percentual Margem" ShowInCustomizationForm="True" VisibleIndex="9">
                                                                    <HeaderStyle BackColor="Red" ForeColor="White" />
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="PDV" FieldName="percMargemPDV" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <HeaderStyle BackColor="Red" ForeColor="White" />
                                                                            <CellStyle HorizontalAlign="Right">
                                                                            </CellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Final" FieldName="percMargemSellOut" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <HeaderStyle BackColor="Red" ForeColor="White" />
                                                                            <CellStyle HorizontalAlign="Right">
                                                                            </CellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:GridViewBandColumn>
                                                                
                                                            </Columns>
                                                            
                                                            <FormatConditions>
                                                                <dx:GridViewFormatConditionHighlight Expression="[percMargemSellOut] &lt; 0" FieldName="percMargemSellOut">
                                                                </dx:GridViewFormatConditionHighlight>
                                                                <dx:GridViewFormatConditionHighlight Expression="[percMargemSellOut] &gt; 0" FieldName="percMargemSellOut" Format="GreenFillWithDarkGreenText">
                                                                </dx:GridViewFormatConditionHighlight>
                                             </FormatConditions>
                                                            
                                                            <Styles>
                                                                <Header Font-Bold="False" ForeColor="White" Font-Size="Small" HorizontalAlign="Center">
                                                                </Header>
                                                                <AlternatingRow BackColor="#EAEAEA">
                                                                </AlternatingRow>
                                                                <FocusedRow BackColor="Yellow" ForeColor="Blue">
                                                                </FocusedRow>
                                                                <Cell HorizontalAlign="Center">
                                                                </Cell>
                                                            </Styles>
                                                        </dx:ASPxGridView>     
 
 
                            
                                <asp:SqlDataSource ID="dsAcima" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" 
                                                            SelectCommand="dbo.usp_Buscar_Venda_Acima_Quantidade_Item" 
                                                            SelectCommandType="StoredProcedure">
                                                                <SelectParameters>
                                                                    <asp:SessionParameter Name="Dia" SessionField="sDIA" Type="DateTime" />                                                                    
                                                                     <asp:SessionParameter Name="RadioTV" SessionField="sRADIOTV" Type="Byte" />  
                                                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />  
                                                                </SelectParameters>
                                                            
                                                        </asp:SqlDataSource>

                        </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxCallbackPanel>


                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>


            <dx:TabPage Text="Vendas por Hora">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl4" runat="server">

                        <%--here--%>

                            <div id="divAno">
                                <uc1:wucAno runat="server" ID="cboAno" />                               
                            </div>

                            <div id="divMes">
                                <uc1:wuciListaMes runat="server" ID="cboMes" />                            

                            </div>
                      
                           
                           <dx:ASPxRadioButton ID="ASPxRadioButton2" runat="server" Text="Campanhas de Rádio e TV" GroupName="GroupCamp" Theme="Material" AutoPostBack="false" >
                               <ClientSideEvents CheckedChanged="function(s, e) {
cbPanelAcima.PerformCallback() ;	
}" />
                        </dx:ASPxRadioButton> 

                        <dx:ASPxCallbackPanel ID="ASPxCallbackPanel2" runat="server" Width="100%" ClientInstanceName="cbPanelAcima">
                            <PanelCollection>
                                <dx:PanelContent>
                                

                                                          <dx:ASPxGridView ID="ASPxGridView1" runat="server" ClientInstanceName="gridAcima" AutoGenerateColumns="False" DataSourceID="dsAcima" EnableTheming="True" Theme="SoftOrange" Width="100%" >
                                             <Toolbars>
                <dx:GridViewToolbar EnableAdaptivity="true">
                    <Items>
                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
               
                                             <SettingsPager NumericButtonCount="25" PageSize="25">
                                                            </SettingsPager>
                                                            <Settings VerticalScrollableHeight="500" VerticalScrollBarMode="Visible" ShowFilterRow="True" />
                                                            <SettingsBehavior AllowFocusedRow="True" />
                                                            <SettingsResizing ColumnResizeMode="Control" />
                                                            <SettingsSearchPanel Visible="True" />
                                             <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                                                            <SettingsText Title="Projeção Venda Hoje" SearchPanelEditorNullText="Digite parte do Produto ou Campanha para filtrar..." />
                                                            <Columns>                                                                

                                                                <dx:GridViewDataTextColumn Caption="Dia" FieldName="Dia" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">                                                                    
                                                                    <PropertiesTextEdit DisplayFormatString="{0:dd/MM/yyyy} " EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle HorizontalAlign="Right"  ForeColor="Blue">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>

                                                                <dx:GridViewDataTextColumn Caption="Filial" FieldName="nomeFilial" ShowInCustomizationForm="True" VisibleIndex="1" Width="150px">
                                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                    <CellStyle HorizontalAlign="Left" Wrap="False">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>

                                                                <dx:GridViewDataTextColumn Caption="idProduto" FieldName="idProduto" ShowInCustomizationForm="True" VisibleIndex="2">                                                                   
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle HorizontalAlign="Right"  ForeColor="#009900">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>

                                                                <dx:GridViewDataTextColumn Caption="Descrição" FieldName="nomeProduto" ShowInCustomizationForm="True" VisibleIndex="3" Width="275px">
                                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                    <CellStyle HorizontalAlign="Left" Wrap="False">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                
                                                                <dx:GridViewDataTextColumn Caption="Volume" FieldName="Volume" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="6" SortIndex="0" SortOrder="Descending">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n3}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle HorizontalAlign="Right">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>

                                                                <dx:GridViewDataTextColumn Caption="Venda Item" FieldName="vlrVenda" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="7">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:C}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#336600" ForeColor="White" />
                                                                    <CellStyle ForeColor="#336600" HorizontalAlign="Right">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>

                                                                <dx:GridViewDataTextColumn Caption="Hora" FieldName="Hora" ShowInCustomizationForm="True" VisibleIndex="12">
                                                                    <Settings AllowAutoFilter="True" AutoFilterCondition="Contains" />
                                                                    <CellStyle HorizontalAlign="Center" Wrap="False">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>

                                                                <dx:GridViewDataTextColumn Caption="nº PDV" FieldName="NUMPDV" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="13" ToolTip="Numero do PDV" Width="60px">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </dx:GridViewDataTextColumn>

                                                                <dx:GridViewDataTextColumn Caption="nº<br>Cupom" FieldName="NUMCUPOM" ShowInCustomizationForm="True" VisibleIndex="14">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </dx:GridViewDataTextColumn>
                                                                
                                                                <dx:GridViewDataTextColumn Caption="Seq.<br>Cupom" FieldName="SEQCUPOM" ShowInCustomizationForm="True" VisibleIndex="15">                                                                    
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </dx:GridViewDataTextColumn>
                                                                
                                                                <dx:GridViewDataTextColumn Caption="Descrição da Campanha" FieldName="descCampanha" ShowInCustomizationForm="True" VisibleIndex="5" Width="275px">
                                                                    <Settings AutoFilterCondition="Contains" />
                                                                    <CellStyle HorizontalAlign="Left" Wrap="False">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="nº<br>Campanha" FieldName="idCampanha" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                </dx:GridViewDataTextColumn>
                                                                
                                                                <dx:GridViewDataTextColumn Caption="Venda Total" FieldName="VALORTOTALVENDA" ShowInCustomizationForm="True" ToolTip="Venda Total do Cupom (todos os itens)" VisibleIndex="8">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:C}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle BackColor="#000099" ForeColor="White" HorizontalAlign="Center" />
                                                                    <CellStyle ForeColor="Blue" HorizontalAlign="Right">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                
                                                                <dx:GridViewBandColumn Caption="Percentual Margem" ShowInCustomizationForm="True" VisibleIndex="9">
                                                                    <HeaderStyle BackColor="Red" ForeColor="White" />
                                                                    <Columns>
                                                                        <dx:GridViewDataTextColumn Caption="PDV" FieldName="percMargemPDV" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <HeaderStyle BackColor="Red" ForeColor="White" />
                                                                            <CellStyle HorizontalAlign="Right">
                                                                            </CellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                        <dx:GridViewDataTextColumn Caption="Final" FieldName="percMargemSellOut" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                                            </PropertiesTextEdit>
                                                                            <HeaderStyle BackColor="Red" ForeColor="White" />
                                                                            <CellStyle HorizontalAlign="Right">
                                                                            </CellStyle>
                                                                        </dx:GridViewDataTextColumn>
                                                                    </Columns>
                                                                </dx:GridViewBandColumn>
                                                                
                                                            </Columns>
                                                            
                                                            <FormatConditions>
                                                                <dx:GridViewFormatConditionHighlight Expression="[percMargemSellOut] &lt; 0" FieldName="percMargemSellOut">
                                                                </dx:GridViewFormatConditionHighlight>
                                                                <dx:GridViewFormatConditionHighlight Expression="[percMargemSellOut] &gt; 0" FieldName="percMargemSellOut" Format="GreenFillWithDarkGreenText">
                                                                </dx:GridViewFormatConditionHighlight>
                                             </FormatConditions>
                                                            
                                                            <Styles>
                                                                <Header Font-Bold="False" ForeColor="White" Font-Size="Small" HorizontalAlign="Center">
                                                                </Header>
                                                                <AlternatingRow BackColor="#EAEAEA">
                                                                </AlternatingRow>
                                                                <FocusedRow BackColor="Yellow" ForeColor="Blue">
                                                                </FocusedRow>
                                                                <Cell HorizontalAlign="Center">
                                                                </Cell>
                                                            </Styles>
                                                        </dx:ASPxGridView>     
 
 
                            
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" 
                                                            SelectCommand="dbo.usp_Buscar_Venda_Acima_Quantidade_Item" 
                                                            SelectCommandType="StoredProcedure">
                                                                <SelectParameters>
                                                                    <asp:SessionParameter Name="Dia" SessionField="sDIA" Type="DateTime" />                                                                    
                                                                     <asp:SessionParameter Name="RadioTV" SessionField="sRADIOTV" Type="Byte" />  
                                                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />  
                                                                </SelectParameters>
                                                            
                                                        </asp:SqlDataSource>

                        </dx:PanelContent>
                            </PanelCollection>
                        </dx:ASPxCallbackPanel>


                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>



        </TabPages>
    </dx:ASPxPageControl>
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

