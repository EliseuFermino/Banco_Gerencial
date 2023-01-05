<%@ Page Title="Menu Principal" Trace="false"  Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="menuPrincipal_Ricardo.aspx.vb" Inherits="MemberPages_menuPrincipal_Ricardo" %>

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
                                                                <dx:GridViewDataTextColumn Caption="Projeção Venda (2)" FieldName="vlrProjecao" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="2">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="Blue">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Crescim. AA" FieldName="percCresc" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="4">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Ating. Meta" FieldName="percMeta" ShowInCustomizationForm="True" VisibleIndex="5">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}%" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Período" FieldName="myDesc" ShowInCustomizationForm="True" VisibleIndex="0">
                                                                    <CellStyle HorizontalAlign="Left" Wrap="False">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Meta (1)" FieldName="vlrMeta" ShowInCustomizationForm="True" VisibleIndex="1">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <HeaderStyle HorizontalAlign="Center" />
                                                                    <CellStyle HorizontalAlign="Right" Font-Bold="True" ForeColor="#009900">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                                <dx:GridViewDataTextColumn Caption="Diferença (2)-(1)" FieldName="diferenca" ShowInCustomizationForm="True" UnboundType="Decimal" VisibleIndex="3">
                                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                                    </PropertiesTextEdit>
                                                                    <CellStyle HorizontalAlign="Right">
                                                                    </CellStyle>
                                                                </dx:GridViewDataTextColumn>
                                                            </Columns>
                                                            <FormatConditions>
                                                                <dx:GridViewFormatConditionIconSet FieldName="percCresc" Format="PositiveNegativeArrowsColored" />
                                                                <dx:GridViewFormatConditionIconSet FieldName="percMeta" Format="PositiveNegativeTriangles" />
                                                                <dx:GridViewFormatConditionHighlight Expression="[diferenca] &lt; 0.0" FieldName="diferenca">
                                                                </dx:GridViewFormatConditionHighlight>
                                                                <dx:GridViewFormatConditionHighlight Expression="[diferenca] &gt; 0.0" FieldName="diferenca" Format="GreenFillWithDarkGreenText">
                                                                </dx:GridViewFormatConditionHighlight>
                                                            </FormatConditions>
                                                            <Styles>
                                                                <Header Font-Bold="False" BackColor="#009900" ForeColor="White" Font-Size="Small" HorizontalAlign="Center">
                                                                </Header>
                                                                <AlternatingRow BackColor="#EAEAEA">
                                                                </AlternatingRow>
                                                                <FocusedRow BackColor="Yellow" ForeColor="Blue">
                                                                </FocusedRow>
                                                                <Cell Font-Size="15px" HorizontalAlign="Center">
                                                                </Cell>
                                                            </Styles>
                                                        </dx:ASPxGridView> 
                                                         
                                                        <asp:SqlDataSource ID="dsProjecao" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" 
                                                            SelectCommand="Dashboard.usp_Buscar_Projecao_Vendas_Diarias" 
                                                            SelectCommandType="StoredProcedure">

                                                            <SelectParameters>
                                                               <asp:SessionParameter Name="Departamento" SessionField="sDEPARTAMENTO" Type="String" />
                                                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" />
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


                              </div> 

                            <hr />


                              <div class="row Quebra_Pagina_Row">

                                  
                                            

                                        <div class="col-xs-12 col-sm-3">
					                        <div class="widget-box">
						                        <div class="widget-header"><h6 class="widget-title"><span class="fa fa-desktop" ></span> &nbsp; TOP 10 - Maiores Vendas</h6>

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

                                                        <dx:ASPxCallbackPanel  ID="cboPanelTop10" runat="server" Width="100%" ClientInstanceName="cboPanelTop10" Theme="Metropolis"  Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
                                                        <Images>
                                                        <LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
                                                        </Images>

                                                        <LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
                                                             <PanelCollection>
                                                                    <dx:PanelContent>                                                                    

                                                        <dx:ASPxPageControl ID="aspxVendaTOP" runat="server" Width="100%" ActiveTabIndex="1" EnableHierarchyRecreation="True" Theme="MetropolisBlue" >
                                                                <TabPages>

                                                                    <dx:TabPage Text="por Dia">
                                                                        <ContentCollection>
                                                                            <dx:ContentControl ID="ContentControl2" runat="server">                                                                                
                                                                                <dx:aspxgridview ID="ASPxGridView2" runat="server" Theme="PlasticBlue"
                                                AutoGenerateColumns="False" DataSourceID="dsFiveTop" KeyFieldName="Dia" Width="100%">

                                                <SettingsBehavior AllowFocusedRow="True" />
                                               
                                                <SettingsLoadingPanel Text="Aguarde. Processando...&amp;hellip;" />
                                               
                                                <SettingsText Title="Ranking das 10 maiores vendas" />
                                                <Columns>
                                                    <dx:gridviewdatadatecolumn FieldName="rnk" VisibleIndex="0" ToolTip="Posição no Ranking" Caption ="Rank" CellStyle-HorizontalAlign="Center">
                                                        <HeaderStyle HorizontalAlign="Center" />

<CellStyle HorizontalAlign="Center"></CellStyle>
                                                    </dx:gridviewdatadatecolumn>
                                                    <dx:gridviewdatadatecolumn FieldName="Dia" VisibleIndex="1">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dx:gridviewdatadatecolumn>
                                                    <dx:gridviewdatatextcolumn FieldName="Semana" VisibleIndex="2" ToolTip="Nome do dia na semana" Caption ="Sem." CellStyle-HorizontalAlign="Center">
                                                        <HeaderStyle HorizontalAlign="Center" />

<CellStyle HorizontalAlign="Center"></CellStyle>
                                                    </dx:gridviewdatatextcolumn>
                                                    <dx:gridviewdatatextcolumn Caption="Venda" FieldName="vlrVenda" 
                                                        ToolTip="As 10 maiores vendas da empresa em ordem decrescente." 
                                                        VisibleIndex="3">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dx:gridviewdatatextcolumn>
                                                    <dx:gridviewdatatextcolumn FieldName="Margem" VisibleIndex="4" Caption="Mgr. PDV" ToolTip="Percentual de Margem PDV">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                    </dx:gridviewdatatextcolumn> 
                                                
                                                    <dx:GridViewDataTextColumn Caption="Mgr. Final" FieldName="MargemFinal" ShowInCustomizationForm="True" ToolTip="Percentual de Margem Final" VisibleIndex="5">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                
                                                </Columns>
                                                <Settings ShowTitlePanel="False" ShowVerticalScrollBar="False" 
                                                    VerticalScrollableHeight="215" />

                                                    <Styles>                                                                
                                                        <Header HorizontalAlign="Center">
                                                        </Header>
                                                        <AlternatingRow BackColor="#EAEAEA">
                                                        </AlternatingRow>
                                                        <FocusedRow BackColor="Yellow" ForeColor="Blue">
                                                        </FocusedRow>                                                               
                                                     </Styles>
                                                 
                                                <StylesEditors>


                                                    <ProgressBar Height="25px">
                                                    </ProgressBar>
                                                </StylesEditors>
                                            </dx:aspxgridview>

                                                                              

                                                       <asp:SqlDataSource ID="dsFiveTop" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" 
                                                            SelectCommand="Dashboard.usp_Top_10_Vendas_Dia" 
                                                            SelectCommandType="StoredProcedure">
                                                        </asp:SqlDataSource>

                                                                                
                                                                            </dx:ContentControl>
                                                                        </ContentCollection>
                                                                    </dx:TabPage>                                                                    

                                                                    <dx:TabPage Text="por Dia da Semana">
                                                                        <ContentCollection>
                                                                            <dx:ContentControl ID="ContentControl3" runat="server">

                                                                                <div id="divDiasSemana">

                                                                                    <div id="divSeg" class="rndSemana">
                                                                                        <dx:ASPxRadioButton ID="rndSeg" runat="server" Checked="false" Text="Seg " ToolTip="Segunda-Feira" Theme="DevEx" GroupName="rnd" AutoPostBack="false">
                                                                                            
                                                                                            <ClientSideEvents CheckedChanged="function(s, e) {
gridTopSemana.Refresh();	
}" />
                                                                                            
                                                                                        </dx:ASPxRadioButton>
                                                                                    </div>

                                                                                    <div id="divTer" class="rndSemana">
                                                                                        <dx:ASPxRadioButton ID="rndTer" runat="server" Checked="false" Text="Ter " ToolTip="Terça-Feira" Theme="DevEx" GroupName="rnd" AutoPostBack="false" >
                                                                                            
                                                                                            <ClientSideEvents CheckedChanged="function(s, e) {
gridTopSemana.Refresh();	
}" />
                                                                                            
                                                                                        </dx:ASPxRadioButton>
                                                                                    </div>

                                                                                    <div id="divQua" class="rndSemana">
                                                                                        <dx:ASPxRadioButton ID="rndQua" runat="server" Checked="false" Text="Qua " ToolTip="Quarta-Feira" Theme="DevEx" GroupName="rnd" AutoPostBack="false">
                                                                                           
                                                                                            <ClientSideEvents CheckedChanged="function(s, e) {
	gridTopSemana.Refresh();
}" />
                                                                                           
                                                                                        </dx:ASPxRadioButton>
                                                                                    </div>

                                                                                     <div id="divQui" class="rndSemana">
                                                                                        <dx:ASPxRadioButton ID="rndQui" runat="server" Checked="false" Text="Qui " ToolTip="Quinta-Feira" Theme="DevEx" GroupName="rnd" AutoPostBack="false">
                                                                                            
                                                                                            <ClientSideEvents CheckedChanged="function(s, e) {
	gridTopSemana.Refresh();
}" />
                                                                                            
                                                                                        </dx:ASPxRadioButton>
                                                                                     </div>

                                                                                     <div id="divSex" class="rndSemana">
                                                                                        <dx:ASPxRadioButton ID="rndSex" runat="server" Checked="false" Text="Sex " ToolTip="Sexta-Feira" Theme="DevEx" GroupName="rnd" AutoPostBack="false">
                                                                                            
                                                                                            <ClientSideEvents CheckedChanged="function(s, e) {
gridTopSemana.Refresh();	
}" />
                                                                                            
                                                                                        </dx:ASPxRadioButton>
                                                                                     </div>

                                                                                    <div id="divSab" class="rndSemana">
                                                                                        <dx:ASPxRadioButton ID="rndSab" runat="server" Checked="false" Text="Sab " ToolTip="Sabádo" Theme="DevEx" GroupName="rnd" AutoPostBack="false" ForeColor="Blue">
                                                                                           
                                                                                            <ClientSideEvents CheckedChanged="function(s, e) {
gridTopSemana.Refresh();	
}" />
                                                                                           
                                                                                        </dx:ASPxRadioButton>
                                                                                     </div>

                                                                                    <div id="divDom" class="rndSemana">
                                                                                        <dx:ASPxRadioButton ID="rndDom" runat="server" Checked="false" Text="Dom " ToolTip="Domingo" Theme="DevEx" GroupName="rnd" AutoPostBack="false" ForeColor="Red">
                                                                                            
                                                                                            <ClientSideEvents CheckedChanged="function(s, e) {
gridTopSemana.Refresh();	
}" />
                                                                                            
                                                                                        </dx:ASPxRadioButton>
                                                                                     </div>

                                                                                </div> 


                                                                                 <dx:aspxgridview ID="gridTopSemana" runat="server" Theme="PlasticBlue" ClientInstanceName="gridTopSemana" 
                                                    AutoGenerateColumns="False"  DataSourceID="dsTopWeek" KeyFieldName="Dia"  Width="100%">
                                                <SettingsBehavior AllowFocusedRow="True" />
                                               
                                                <SettingsLoadingPanel Text="Aguarde. Processando...&amp;hellip;" />
                                                
                                                <Columns>
                                                    <dx:gridviewdatadatecolumn FieldName="rnk" VisibleIndex="0" ToolTip="Posição no Ranking" Caption ="Rank" CellStyle-HorizontalAlign="Center">
                                                        <HeaderStyle HorizontalAlign="Center" />

<CellStyle HorizontalAlign="Center"></CellStyle>
                                                    </dx:gridviewdatadatecolumn>
                                                    <dx:gridviewdatadatecolumn FieldName="Dia" VisibleIndex="1">
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dx:gridviewdatadatecolumn>
                                                    <dx:gridviewdatatextcolumn FieldName="Semana" VisibleIndex="2" ToolTip="Nome do dia na semana" Caption ="Sem." CellStyle-HorizontalAlign="Center">
                                                        <HeaderStyle HorizontalAlign="Center" />

<CellStyle HorizontalAlign="Center"></CellStyle>
                                                    </dx:gridviewdatatextcolumn>
                                                    <dx:gridviewdatatextcolumn Caption="Venda" FieldName="vlrVenda" 
                                                        ToolTip="As 10 maiores vendas da empresa em ordem decrescente." 
                                                        VisibleIndex="3">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                        <HeaderStyle HorizontalAlign="Center" />
                                                    </dx:gridviewdatatextcolumn>
                                                    <dx:gridviewdatatextcolumn FieldName="Margem" VisibleIndex="4" Caption="Mgr. PDV" ToolTip="Percentual de Margem PDV">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                    </dx:gridviewdatatextcolumn> 
                                                
                                                    <dx:GridViewDataTextColumn Caption="Mrg. Final" FieldName="MargemFinal" ShowInCustomizationForm="True" ToolTip="Percentual de Margem Final" VisibleIndex="5">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                        </PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                
                                                </Columns>
                                                    <Settings ShowTitlePanel="False" ShowVerticalScrollBar="False" 
                                                    VerticalScrollableHeight="215" />

                                               <Styles>                                                                
                                                        <Header HorizontalAlign="Center">
                                                        </Header>
                                                        <AlternatingRow BackColor="#EAEAEA">
                                                        </AlternatingRow>
                                                        <FocusedRow BackColor="Yellow" ForeColor="Blue">
                                                        </FocusedRow>                                                               
                                                     </Styles>

                                                <StylesEditors>
                                                    <ProgressBar Height="25px">
                                                    </ProgressBar>
                                                </StylesEditors>
                                                </dx:aspxgridview>
                                                                                
                                                        <asp:SqlDataSource ID="dsTopWeek" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" 
                                                            SelectCommand="Dashboard.usp_Top_10_Vendas_Dia_Semana" 
                                                            SelectCommandType="StoredProcedure">
                                                            <SelectParameters>
                                                                <asp:SessionParameter Name="Dia" SessionField="sSEMANA" DbType="Byte" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>

                                                                                
                                                                            </dx:ContentControl>
                                                                        </ContentCollection>
                                                                    </dx:TabPage>

                                                                    <dx:TabPage Text="por Mês">
                                                                        <ContentCollection>
                                                                            <dx:ContentControl ID="ContentControl4" runat="server">

                                               <dx:aspxgridview ID="gridTopMes" runat="server" AutoGenerateColumns="False"  Theme="PlasticBlue"
                                                    DataSourceID="dsMes" Width="100%" 
                                                    Visible="True">
                                                    <SettingsBehavior AllowFocusedRow="True" />
                                                    
                                                    <SettingsLoadingPanel Text="Aguarde. Processando...&amp;hellip;" />
                                                   
                                                    <SettingsText Title="Ranking das 10 Maiores Vendas por Mês" />
                                                    <Columns>
                                                        <dx:gridviewdatadatecolumn FieldName="rnk" VisibleIndex="0" ToolTip="Posição no Ranking" Caption ="Rank" CellStyle-HorizontalAlign="Center">
                                                            <HeaderStyle HorizontalAlign="Center" />

<CellStyle HorizontalAlign="Center"></CellStyle>
                                                        </dx:gridviewdatadatecolumn>
                                                        <dx:gridviewdatatextcolumn Caption="Ano" FieldName="Ano" VisibleIndex="1">
                                                        </dx:gridviewdatatextcolumn>
                                                        <dx:gridviewdatatextcolumn Caption="Mês" FieldName="descMes" 
                                                            VisibleIndex="2">
                                                        </dx:gridviewdatatextcolumn>
                                                        <dx:gridviewdatatextcolumn Caption="Venda" FieldName="vlrVenda" 
                                                            VisibleIndex="3">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                        </dx:gridviewdatatextcolumn>
                                                        <dx:gridviewdatatextcolumn Caption="Mgr. PDV" FieldName="percMargem" 
                                                            VisibleIndex="4" ToolTip="Percentual Margem PDV">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                        </dx:gridviewdatatextcolumn>
                                                        <dx:GridViewDataTextColumn Caption="Mrg. Final" FieldName="MargemFinal" ShowInCustomizationForm="True" ToolTip="Percentual Margem Final" VisibleIndex="5">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                    <Settings ShowTitlePanel="False" ShowVerticalScrollBar="False" 
                                                        VerticalScrollableHeight="215" />
                                                    <StylesEditors>
                                                        <ProgressBar Height="25px">
                                                        </ProgressBar>
                                                    </StylesEditors>

                                                   <Styles>                                                                
                                                        <Header HorizontalAlign="Center">
                                                        </Header>
                                                        <AlternatingRow BackColor="#EAEAEA">
                                                        </AlternatingRow>
                                                        <FocusedRow BackColor="Yellow" ForeColor="Blue">
                                                        </FocusedRow>                                                               
                                                     </Styles>

                                                </dx:aspxgridview>

                                                                                
                                                        <asp:SqlDataSource ID="dsMes" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" 
                                                            SelectCommand="Dashboard.usp_Top_10_Vendas_Mes" 
                                                            SelectCommandType="StoredProcedure">                                                           
                                                        </asp:SqlDataSource>


                                                                            </dx:ContentControl>
                                                                        </ContentCollection>
                                                                    </dx:TabPage>

                                                            </TabPages>
                                                        </dx:ASPxPageControl>

                                                                    </dx:PanelContent>
                                                             </PanelCollection>
                                                        </dx:ASPxCallbackPanel>
								
                                								
							                        </div>
						                        </div>
					                        </div>
				                        </div><!-- /.span -->
                
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
                                                            <Settings VerticalScrollBarMode="Visible" VerticalScrollableHeight="290" />
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

                                        <div class="col-xs-12 col-sm-5">
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
                                                        Caption="% Mrg Final" >
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
                                                    <dx:GridViewDataTextColumn Caption="R$ Lucro PDV" FieldName="vlrLucroComercial" ShowInCustomizationForm="True" VisibleIndex="4" SortIndex="0" SortOrder="Ascending">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False" >
                                                        </PropertiesTextEdit>
                                                        <Settings AllowAutoFilter="False" />
                                                    </dx:GridViewDataTextColumn>
                                                </Columns>
                                                                                <SettingsPager PageSize="14" Mode="ShowAllRecords">
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

                                     

                                     <div class="col-xs-12 col-sm-8">
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

                                <dx:ASPxCallbackPanel  ID="cboPanelGestor" runat="server" Width="100%" ClientInstanceName="cboPanelGestor" Theme="Metropolis"  Images-LoadingPanel-AlternateText="Aguarde. Atualizando">
                                                        <Images>
                                                        <LoadingPanel AlternateText="Aguarde. Atualizando"></LoadingPanel>
                                                        </Images>

                                                        <LoadingPanelImage AlternateText="Aguarde. Atualizando"></LoadingPanelImage>
                                                             <PanelCollection>
                                                                    <dx:PanelContent>

                                <div id="divPeridoGestor">
                                
                                    <div id="divDiaInicial">
                                        <dx:ASPxDateEdit ID="cboDiaInicialGestor" runat="server" Theme="Mulberry" AutoPostBack="false"></dx:ASPxDateEdit>
                                    </div>    

                                    <div id="divDiaFinal">
                                        <dx:ASPxDateEdit ID="cboDiaFinalGestor" runat="server" Theme="Mulberry" AutoPostBack="false"></dx:ASPxDateEdit>
                                    </div>

                                    <div id="divBotaoAtualizarGestor">
                                        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="false" Theme="MetropolisBlue" >

                                               <ClientSideEvents Click="function(s, e) {
                                                    cboPanelGestor.PerformCallback();	
                                                }" />
                                            	
                                        </dx:ASPxButton>
                                    </div>

                                </div>
								
                                <dx:ASPxGridView ID="grid_Loja_Nao_Fizeram_Checklist" ClientInstanceName="grid_gestor_comprador" runat="server" AutoGenerateColumns="False" DataSourceID="dsChecklist" EnableTheming="True" Theme="SoftOrange" Font-Size="Medium" Width="100%" KeyFieldName="Gestor">
                                    <SettingsDetail ShowDetailRow="True" />
                                    <Templates>
                                        <DetailRow>
                                            <dx:ASPxGridView ID="grid_Loja_Nao_Fizeram_Checklist" runat="server" AutoGenerateColumns="False" DataSourceID="dsComprador" EnableTheming="True" Font-Size="Medium" Theme="PlasticBlue" Width="100%" OnBeforePerformDataSelect="grid_Loja_Nao_Fizeram_Checklist_BeforePerformDataSelect" KeyFieldName="Comprador">
                                                <SettingsPager Mode="ShowAllRecords">
                                                </SettingsPager>
                                                <SettingsText EmptyDataRow="Todas as Lojas Fizeram o Check-List Ontem." />
                                                <Columns>
                                                    <dx:GridViewDataTextColumn FieldName="Comprador" ShowInCustomizationForm="True" VisibleIndex="0">
                                                        <CellStyle HorizontalAlign="Left" Wrap="False">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Meta" FieldName="vlrMeta_Venda" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="3">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                        <CellStyle HorizontalAlign="Right">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Real" FieldName="vlrVenda" ReadOnly="True" ShowInCustomizationForm="True" SortIndex="0" SortOrder="Descending" VisibleIndex="4">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False"></PropertiesTextEdit>
                                                        <CellStyle HorizontalAlign="Right">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Ating" FieldName="percMeta" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual de Atigimento de Meta" VisibleIndex="5">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                        <CellStyle HorizontalAlign="Right">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento sobre o Ano Anterior (não mesmos dias)" VisibleIndex="6">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="M Final" FieldName="percMargFinal" ShowInCustomizationForm="True" ToolTip="Margem Final" VisibleIndex="7">
                                                        <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False"></PropertiesTextEdit>
                                                        <CellStyle BackColor="#FFFF99" Font-Bold="True">
                                                        </CellStyle>
                                                    </dx:GridViewDataTextColumn>
                                                    <dx:GridViewDataTextColumn Caption="Seção" FieldName="Secao" VisibleIndex="2">
                                                        <CellStyle HorizontalAlign="Left">
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
                                                    <dx:GridViewFormatConditionHighlight Expression="[percCresc] &lt; 0.0" FieldName="percCresc">
                                                    </dx:GridViewFormatConditionHighlight>
                                                    <dx:GridViewFormatConditionHighlight Expression="[percCresc] &gt; 0.0" FieldName="percCresc" Format="GreenFillWithDarkGreenText">
                                                    </dx:GridViewFormatConditionHighlight>
                                                </FormatConditions>
                                                <Styles>
                                                    <Header Font-Bold="True" Font-Size="Small" HorizontalAlign="Center">
                                                    </Header>
                                                    <GroupRow Font-Size="Small">
                                                    </GroupRow>
                                                    <AlternatingRow BackColor="#EBEBEB">
                                                    </AlternatingRow>
                                                    <Cell Font-Size="Small" HorizontalAlign="Center">
                                                    </Cell>
                                                    <Footer Font-Size="Small">
                                                    </Footer>
                                                </Styles>
                                            </dx:ASPxGridView>
                                        </DetailRow>
                                    </Templates>
                                    <SettingsPager Mode="ShowAllRecords">
                                    </SettingsPager>
                                    <Settings ShowFooter="True" />
                                    <SettingsText EmptyDataRow="Todas as Lojas Fizeram o Check-List Ontem." />
                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="Gestor" ShowInCustomizationForm="True" VisibleIndex="0">
                                            <CellStyle HorizontalAlign="Left" Wrap="False">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewBandColumn Caption="Margem Final" ShowInCustomizationForm="True" VisibleIndex="2">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Meta" FieldName="percMetaMargFinal" ShowInCustomizationForm="True" ToolTip="% de Meta de Margem Final" VisibleIndex="0">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#009900" ForeColor="White" />
                                                    <CellStyle ForeColor="#336600">
                                                    </CellStyle>
                                                    <FooterCellStyle ForeColor="#336600" HorizontalAlign="Center">
                                                    </FooterCellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Real" FieldName="percMargFinal" ShowInCustomizationForm="True" ToolTip="Margem Final" VisibleIndex="1">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <CellStyle BackColor="#FFFF99" Font-Bold="True" ForeColor="Blue">
                                                    </CellStyle>
                                                    <FooterCellStyle ForeColor="Blue" HorizontalAlign="Center">
                                                    </FooterCellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Dif." FieldName="dif_MxR" ShowInCustomizationForm="True" ToolTip="Diferença entre a Meta x Realizado do Percentual da Margem Final" UnboundType="Decimal" VisibleIndex="2" Width="75px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <FooterCellStyle HorizontalAlign="Center">
                                                    </FooterCellStyle>
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:GridViewBandColumn>
                                        <dx:GridViewBandColumn Caption="Vendas" ShowInCustomizationForm="True" VisibleIndex="1">
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Meta (1)" FieldName="vlrMeta_Venda" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="0">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#009900" ForeColor="White" />
                                                    <CellStyle ForeColor="#336600" HorizontalAlign="Right">
                                                    </CellStyle>
                                                    <FooterCellStyle ForeColor="#336600">
                                                    </FooterCellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Real (2)" FieldName="vlrVenda" ReadOnly="True" ShowInCustomizationForm="True" SortIndex="0" SortOrder="Descending" VisibleIndex="1">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <CellStyle ForeColor="Blue" HorizontalAlign="Right">
                                                    </CellStyle>
                                                    <FooterCellStyle ForeColor="Blue">
                                                    </FooterCellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="Dif (2) - (1)" FieldName="dif_MxR_Vlr" ShowInCustomizationForm="True" ToolTip="Diferença entre a Meta x Realizado da Venda" UnboundType="Decimal" VisibleIndex="2">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <CellStyle HorizontalAlign="Right">
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="% Ating" FieldName="percMeta" ReadOnly="True" ShowInCustomizationForm="True" ToolTip="Percentual de Atigimento de Meta" VisibleIndex="3" Width="75px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <CellStyle HorizontalAlign="Center">
                                                    </CellStyle>
                                                    <FooterCellStyle HorizontalAlign="Center">
                                                    </FooterCellStyle>
                                                </dx:GridViewDataTextColumn>
                                                <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCresc" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento sobre o Ano Anterior (não mesmos dias)" VisibleIndex="4" Width="75px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <FooterCellStyle HorizontalAlign="Center">
                                                    </FooterCellStyle>
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                        </dx:GridViewBandColumn>
                                        <dx:GridViewDataTextColumn FieldName="vlrAA" ShowInCustomizationForm="True" VisibleIndex="3" Visible="False">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="vlrLucroTotal" ShowInCustomizationForm="True" VisibleIndex="4" Visible="False">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="vlrMetaLucroMesComl" ShowInCustomizationForm="True" VisibleIndex="5" Visible="False">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewBandColumn Caption="Meta Mes" ShowInCustomizationForm="True" VisibleIndex="7">
                                            <HeaderStyle BackColor="#009900" />
                                            <Columns>
                                                <dx:GridViewDataTextColumn Caption="Vendas" FieldName="vlrMetaVendaMesComl" ShowInCustomizationForm="True" VisibleIndex="0" Width="90px">
                                                    <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                    </PropertiesTextEdit>
                                                    <HeaderStyle BackColor="#009900" />
                                                    <CellStyle ForeColor="#336600" HorizontalAlign="Right">
                                                    </CellStyle>
                                                    <FooterCellStyle ForeColor="#336600">
                                                    </FooterCellStyle>
                                                </dx:GridViewDataTextColumn>

                                                <dx:GridViewDataTextColumn VisibleIndex ="1" Caption="Atingimento"  >
                                                    <DataItemTemplate>
                                                        <dx:ASPxProgressBar ID="pb" runat="server" Height="21px" OnDataBound="pb_DataBound" Theme="SoftOrange" 
                                                                        Value='<%#Eval("percAtingimentoMes")%>' Width="80px" DisplayFormatString=" 0.0" >

                                                        </dx:ASPxProgressBar>                                                
                                                    </DataItemTemplate>                                      

                                                    <HeaderStyle BackColor="#009900" />

                                                </dx:GridViewDataTextColumn>

                                            </Columns>
                                        </dx:GridViewBandColumn>
                                    </Columns>
                                    <TotalSummary>
                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMeta_Venda" SummaryType="Sum" />
                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVenda" SummaryType="Sum" />
                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrAA" SummaryType="Sum" />
                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrLucroTotal" SummaryType="Sum" />
                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaLucroMesComl" SummaryType="Sum" />     
                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaVendaMesComl" SummaryType="Sum" /> 
                                                                                                              
                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="dif_MxR_Vlr" SummaryType="Sum" />
                                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMeta" SummaryType="Custom" />
                                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCresc" SummaryType="Custom" />
                                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargFinal" SummaryType="Custom" />
                                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMetaMargFinal" SummaryType="Custom" />
                                        <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="dif_MxR" SummaryType="Custom" />
                                        
                                        
                                    </TotalSummary>
                                    <FormatConditions>
                                        <dx:GridViewFormatConditionIconSet FieldName="percCresc" Format="PositiveNegativeArrowsColored" />
                                        <dx:GridViewFormatConditionIconSet FieldName="percMeta" Format="PositiveNegativeTriangles" />
                                        <dx:GridViewFormatConditionHighlight Expression="[percCresc] &lt; 0.0" FieldName="percCresc">
                                        </dx:GridViewFormatConditionHighlight>
                                        <dx:GridViewFormatConditionHighlight Expression="[percCresc] &gt; 0.0" FieldName="percCresc" Format="GreenFillWithDarkGreenText">
                                        </dx:GridViewFormatConditionHighlight>
                                        <dx:GridViewFormatConditionIconSet FieldName="dif_MxR" Format="PositiveNegativeTriangles" ShowInColumn="dif_MxR" />
                                        <dx:GridViewFormatConditionHighlight Expression="dif_MxR_Vlr &lt; 0" FieldName="dif_MxR_Vlr" ShowInColumn="dif_MxR_Vlr">
                                        </dx:GridViewFormatConditionHighlight>
                                        <dx:GridViewFormatConditionHighlight Expression="dif_MxR_Vlr &gt; 0" FieldName="dif_MxR_Vlr" Format="GreenFillWithDarkGreenText" ShowInColumn="dif_MxR_Vlr">
                                        </dx:GridViewFormatConditionHighlight>
                                    </FormatConditions>
                                    <Styles>
                                        <Header Font-Bold="True" Font-Size="Small" HorizontalAlign="Center">
                                        </Header>
                                        <GroupRow Font-Size="Small">
                                        </GroupRow>
                                        <AlternatingRow BackColor="#EAEAEA">
                                        </AlternatingRow>
                                        <Cell Font-Size="Small" HorizontalAlign="Center">
                                        </Cell>
                                        <Footer Font-Size="Small" Font-Bold="True">
                                        </Footer>
                                    </Styles>
                                </dx:ASPxGridView>        
                                <asp:SqlDataSource ID="dsChecklist" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="Dashboard.usp_Gestor" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                            <asp:SessionParameter Name="Departamento" SessionField="sDEPARTAMENTO" Type="String" />
                                            <asp:SessionParameter Name="Matricula" SessionField="sMATRICULA" Type="String" />
                                            <asp:SessionParameter Name="PrimeiroDia" SessionField="sDIA_INICIAL_GESTOR" DbType="Date" />
                                            <asp:SessionParameter Name="DiaOntem" SessionField="sDIA_FINAL_GESTOR" DbType="Date" />
                                        </SelectParameters>
                                </asp:SqlDataSource>
							    <asp:SqlDataSource ID="dsComprador" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="Dashboard.usp_Comprador" SelectCommandType="StoredProcedure">
                                   <SelectParameters>
                                       <asp:SessionParameter Name="Gestor" SessionField="sGESTOR" Type="String" />
                                       <asp:SessionParameter Name="PrimeiroDia" SessionField="sDIA_INICIAL_GESTOR" DbType="Date" />
                                       <asp:SessionParameter Name="DiaOntem" SessionField="sDIA_FINAL_GESTOR" DbType="Date" />
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

            <dx:TabPage Text="Acima da Quantidade - Condor">
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
                           
                           <div style="float:left; padding-bottom: 5px ; padding-right: 10px " >

                           <dx:ASPxRadioButton ID="rndRadio" runat="server" Text="Campanhas de Rádio e TV" GroupName="GroupCamp" Theme="Material" AutoPostBack="false" >
                               <ClientSideEvents CheckedChanged="function(s, e) {
cbPanelAcima.PerformCallback() ;	
}" />
                        </dx:ASPxRadioButton> 
                             </div>

                        <div style="float:left; padding-left: 30px; margin-top: 2px " >
                        <dx:ASPxDateEdit ID="cboDia_Acima" runat="server" Width="125px" Theme="Mulberry" AutoPostBack="false" Caption="Selecione uma Data: " CalendarProperties-TodayButtonText="Hoje" CalendarProperties-ClearButtonText="Limpar" >
<CalendarProperties ClearButtonText="Limpar" TodayButtonText="Hoje"></CalendarProperties>
                            <ClientSideEvents DateChanged="function(s, e) {
	cbPanelAcima.PerformCallback() ;	
}" />
                            </dx:ASPxDateEdit>
                      </div> 

                        <dx:ASPxCallbackPanel ID="cbPanelAcima" runat="server" Width="100%" ClientInstanceName="cbPanelAcima">
                            <PanelCollection>
                                <dx:PanelContent>
                                

                                <dx:ASPxGridView ID="gridAcima" runat="server" ClientInstanceName="gridAcima" AutoGenerateColumns="False" DataSourceID="dsAcima" EnableTheming="True" Theme="SoftOrange" Width="100%" KeyFieldName="ID" >
                                             <Toolbars>
                <dx:GridViewToolbar EnableAdaptivity="true">
                    <Items>
                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
               
                                             <SettingsPager NumericButtonCount="25" PageSize="25" Mode="EndlessPaging">
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
                                                                    <asp:SessionParameter Name="Dia" SessionField="sDIA_ACIMA" Type="DateTime" />                                                                    
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


                        <dx:TabPage Text="Acima da Quantidade - Atacarejo">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl6" runat="server">

                        <%--here--%>

                        <div style="clear:both; float:left; padding-bottom: 5px ; padding-right: 10px " >
                            <dx:ASPxRadioButton ID="rndTodosAtacarejo" runat="server" Text="Todas as Campanhas" GroupName="GroupCampAtacarejo" Theme="Material" Checked="true" AutoPostBack="false">
                                <ClientSideEvents CheckedChanged="function(s, e) {
	cbPanelAcimaAtacarejo.PerformCallback() ;
}" />
                            </dx:ASPxRadioButton>  
                        </div>
                           
                           <div style="float:left; padding-bottom: 5px ; padding-right: 10px " >

                           <dx:ASPxRadioButton ID="rndRadioAtacarejo" runat="server" Text="Campanhas de Rádio e TV" GroupName="GroupCampAtacarejo" Theme="Material" AutoPostBack="false" >
                               <ClientSideEvents CheckedChanged="function(s, e) {
cbPanelAcimaAtacarejo.PerformCallback() ;	
}" />
                        </dx:ASPxRadioButton> 
                             </div>

                        <div style="float:left; padding-left: 30px; margin-top: 2px " >
                        <dx:ASPxDateEdit ID="cboDia_AcimaAtacarejo" runat="server" Width="125px" Theme="Mulberry" AutoPostBack="false" Caption="Selecione uma Data: " CalendarProperties-TodayButtonText="Hoje" CalendarProperties-ClearButtonText="Limpar" >
<CalendarProperties ClearButtonText="Limpar" TodayButtonText="Hoje"></CalendarProperties>
                            <ClientSideEvents DateChanged="function(s, e) {
	cbPanelAcimaAtacarejo.PerformCallback() ;	
}" />
                            </dx:ASPxDateEdit>
                      </div> 

                        <dx:ASPxCallbackPanel ID="cbPanelAcimaAtacarejo" runat="server" Width="100%" ClientInstanceName="cbPanelAcimaAtacarejo">
                            <PanelCollection>
                                <dx:PanelContent>
                                

                                <dx:ASPxGridView ID="gridAcimaAtacarejo" runat="server" ClientInstanceName="gridAcimaAtacarejo" AutoGenerateColumns="False" DataSourceID="dsAcimaAtacarejo" EnableTheming="True" Theme="SoftOrange" Width="100%" KeyFieldName="ID" >
                                             <Toolbars>
                <dx:GridViewToolbar EnableAdaptivity="true">
                    <Items>
                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                    </Items>
                </dx:GridViewToolbar>
            </Toolbars>
               
                                             <SettingsPager NumericButtonCount="25" PageSize="25" Mode="EndlessPaging">
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
 
                            
                                <asp:SqlDataSource ID="dsAcimaAtacarejo" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:gerVendaItemConnectionString %>" 
                                                            SelectCommand="dbo.usp_Buscar_Venda_Acima_Quantidade_Item_Atacarejo" 
                                                            SelectCommandType="StoredProcedure">
                                                                <SelectParameters>
                                                                    <asp:SessionParameter Name="Dia" SessionField="sDIA_ACIMA_ATACAREJO" Type="DateTime" />                                                                    
                                                                     <asp:SessionParameter Name="RadioTV" SessionField="sRADIOTV_ATACAREJO" Type="Byte" />  
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

