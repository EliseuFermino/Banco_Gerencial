<%@ Page Title="Grafico de Clientes" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="GraficoClientes.aspx.vb" Inherits="MemberPages_Clientes_GraficoClientes" %>

<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>

<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>
<%@ Register Src="~/Controles/wucAnoMes.ascx" TagPrefix="uc1" TagName="wucAnoMes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">

   
    <link href="../../css/Dashboard.css" rel="stylesheet" />
    <link href="../../css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-2.2.3.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
      <!-- Ionicons -->
    <link href="../../css/ionicons.min.css" rel="stylesheet" />
    <link href="../../assets/css/ace.min.css" rel="stylesheet" />

  <!-- Font Awesome -->    

    <link href="../../assets/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" />

    <style type ="text/css" > 
        
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
        
/*---------------------------------------------------------------------------------------------------------*/                     

        #divBotaoAtualizar {            
            float: left;
            margin-left: 10px;
        }

        #divDados {
            clear: both;
            float: left;
            margin-left: 2px;
        }

         #divBotao2 {
            clear: both;
            float: left;
            margin-left: 2px;
            text-align: left;
        }

        #divDados_Tabela {
            float: left;
            margin-left: 5px;
            margin-top: 5px;
        }

        #divMediaClientes {
            clear: both;
            float: left;
            margin-left: 10px;
            margin-top: 0px;
        }

        #divGraphAcumulado {
            float: left;
            margin-left: 10px;
            margin-top: 10px;
            
        }

        .Divisao {
            margin-top:100px;
            margin-left: 5px;
        }

        #divGrafico_LojaEmpresa{
            float: left;
        }

        #divAnoMes {
            float: left;
        }

       

    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
   

    <div id="divFilial" class="BGC_Filial BGC_myBorder ">
        <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
    </div>

    <div id="divBotaoAtualizar">
        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="MetropolisBlue">
            <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
        </dx:ASPxButton>
    </div>

   
        <dx:ASPxCallbackPanel ID="cboPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde. Atualizando">
<SettingsLoadingPanel Text="Aguarde. Atualizando"></SettingsLoadingPanel>
            <PanelCollection>
                <dx:PanelContent>

                <div id="divGrafico_Loja_Empresa" style="clear:both ">

                

                <div class="row">

				    <div class="col-md-12">
					    <div class="widget-box">
						    <div class="widget-header">
							    <h4 class="widget-title">Gráfico Comparativo de Clientes Referente ao Mesmo Mês do Ano Anterior</h4>

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
								   
                                     <dxchartsui:WebChartControl ID="Graph" runat="server" DataSourceID="dsDados" Height="450px" Width="990px">
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
                                            <linemarkeroptions size="2" BorderVisible="True">
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
                                            <linemarkeroptions size="2" BorderVisible="True">
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
            <linemarkeroptions BorderVisible="True">
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
                                <cc1:ChartTitle Font="Tahoma, 14pt" Indent="1" Text="Comparativo de Clientes Referente ao Mesmo Mês do Ano Anterior - Mesmos Dias &lt;br&gt; Comparando com a Perda da Empresa - Mesmas Lojas" WordWrap="True" />
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


                    <div class="col-md-12">
					    <div class="widget-box">
						    <div class="widget-header">
							    <h4 class="widget-title">Acompanhamento de Número de Clientes</h4>

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

                                    <table>
                                        <tr>
                                            <td>
                                                <uc1:wucAnoMes runat="server" ID="cboPeriodo" />
                                            </td>
                                            <td>
                                                <div id="divBotao2" >
                                                    <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Atualizar" AutoPostBack="False" Theme="MetropolisBlue">
                                                        <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback();}" />
                                                    </dx:ASPxButton>
                                                </div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td style="vertical-align: top">
                                                 <dx:ASPxGridView ID="gridTabela" runat="server" 
                                            AutoGenerateColumns="False" EnableTheming="True" KeyFieldName="DateAbrev" 
                                            Theme="Default" style="margin-bottom: 0px" Width="445px" DataSourceID="dsDadosVendas">
                                            <TotalSummary>                                            
                                                <dx:ASPxSummaryItem FieldName="vlrVendaAA" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem FieldName="vlrVendaAT" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="clientesAA" SummaryType="Sum" />                                 
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="clientesAT" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difClientes" SummaryType="Sum" />
                                                                                    
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescClientes" SummaryType="Custom" />

                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="ticketMedioAA" SummaryType="Custom"  />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="ticketMedioAT" SummaryType="Custom"  />

                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMedCheckoutAA" SummaryType="Average" />                                            
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMedCheckoutAT" SummaryType="Average" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difTicket" SummaryType="Sum" />

                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescTicket" SummaryType="Custom" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difCheck" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percCrescCheck" SummaryType="Custom" />
                                            </TotalSummary>
                                            <GroupSummary>
                                            
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMetaVenda" ShowInGroupFooterColumn="vlrMetaVenda" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrVendaAT" ShowInGroupFooterColumn="vlrVendaAT" SummaryType="Sum" />   
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="clientesAA" ShowInGroupFooterColumn="clientesAA" SummaryType="Sum" />                          
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="clientesAT" ShowInGroupFooterColumn="clientesAT" SummaryType="Sum" />                                                                             
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difClientes" ShowInGroupFooterColumn="difClientes" SummaryType="Sum" />
                                             
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargemAA" ShowInGroupFooterColumn="vlrMargemAA" SummaryType="Sum" />                          
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMargemAT" ShowInGroupFooterColumn="vlrMargemAT" SummaryType="Sum" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="difVlrMargem" ShowInGroupFooterColumn="difVlrMargem" SummaryType="Sum" />    
                                            
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="vlrMedCheckoutAT" ShowInGroupFooterColumn="vlrMedCheckoutAT" SummaryType="Average" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMedFuncAA" ShowInGroupFooterColumn="vlrMedFuncAA" SummaryType="Custom" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="vlrMedFuncAT" ShowInGroupFooterColumn="vlrMedFuncAT" SummaryType="Custom" />

                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="ticketMedioAA" ShowInGroupFooterColumn="ticketMedioAA" SummaryType="Custom" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="ticketMedioAT" ShowInGroupFooterColumn="ticketMedioAT" SummaryType="Custom" />

                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAA" ShowInGroupFooterColumn="percMargemAA" SummaryType="Custom" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percMargemAT" ShowInGroupFooterColumn="percMargemAT" SummaryType="Custom" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="difMargem" ShowInGroupFooterColumn="difMargem" SummaryType="Custom" />
                                                <dx:ASPxSummaryItem DisplayFormat="{0:n2}" FieldName="percAting" ShowInGroupFooterColumn="percAting" SummaryType="Custom" />
                                            </GroupSummary>
                                            <Columns>
                                                <dx:GridViewBandColumn Caption="Clientes" ShowInCustomizationForm="True" ToolTip="Exibe as informações de número de clientes deste ano com o ano passado." VisibleIndex="2">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="2015" FieldName="clientesAT" ShowInCustomizationForm="True" ToolTip="Número de clientes que passou na loja nesse período." VisibleIndex="1" Width="80px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <HeaderStyle Wrap="True" />
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="2014" FieldName="clientesAA" ShowInCustomizationForm="True" ToolTip="Número de clientes que passou na loja nesse período." VisibleIndex="0" Width="80px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="Diferença" FieldName="difClientes" ShowInCustomizationForm="True" ToolTip="Diferença entre o número de entre os clientes deste ano e do ano anterior" VisibleIndex="2" Width="70px" UnboundType="Integer">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="% Cresc" FieldName="percCrescClientes" ShowInCustomizationForm="True" ToolTip="Percentual de Crescimento do número de clientes em relação ao ano passado." VisibleIndex="3" Width="60px" UnboundType="Decimal">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:GridViewBandColumn>
                                                <dx:GridViewDataDateColumn FieldName="DateAbrev" ReadOnly="True" VisibleIndex="0" Width="60px" FixedStyle="Left" SortIndex="0" SortOrder="Ascending">
                                                    <PropertiesDateEdit DisplayFormatString="{0:dd/MM}"> </PropertiesDateEdit>
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <CellStyle HorizontalAlign="Center"></CellStyle>
                                                </dx:GridViewDataDateColumn>
                                                <dx:GridViewDataTextColumn Caption="Desc." FieldName="descReduzidoDia" VisibleIndex="1" Width="90px" FixedStyle="Left">
                                                    <HeaderStyle HorizontalAlign="Center" />
                                                    <CellStyle HorizontalAlign="Left">
                                                        <BorderRight BorderColor="#999999" BorderStyle="Solid" BorderWidth="2px" />
                                                    </CellStyle>
                                                </dx:GridViewDataTextColumn>
                                            </Columns>
                                            <SettingsBehavior AllowFocusedRow="True" ColumnResizeMode="Control" />
                                            <SettingsPager Mode="ShowAllRecords">
                                            </SettingsPager>
                                            <Settings ShowFooter="True" VerticalScrollableHeight="290" 
                                                ShowGroupFooter="VisibleAlways" ShowFilterRow="True" ShowFilterBar="Auto" 
                                                ShowFilterRowMenu="True" VerticalScrollBarMode="Visible" />
                                            <SettingsText CommandClearFilter="Limpar Filtro" 
                                                FilterControlPopupCaption="Igual" />
                                            <SettingsLoadingPanel Text="Processando informações. Aguarde...&amp;hellip;" />
                                            <Styles>
	                                            <FocusedRow BackColor="#FFFF66" ForeColor="#0066FF"> </FocusedRow>
	                                            <Header HorizontalAlign="Center">
                                                </Header>
	                                            <AlternatingRow BackColor="#EEEEEE"></AlternatingRow>
                                                <Footer Font-Bold="True">
                                                </Footer>
                                                <GroupFooter Font-Bold="False">
                                                </GroupFooter>
                                            </Styles>      

                                        </dx:ASPxGridView>
                                    
                                        <asp:SqlDataSource ID="dsDadosVendas" runat="server" ConnectionString="<%$ ConnectionStrings:DW_VendasConnectionString %>" SelectCommand="dbo.sp_BuscarClientes" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" />
                                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                            </SelectParameters>
                                        </asp:SqlDataSource> 
                                            </td>

                                            <td style="vertical-align: top; right: 5px;">
                                                 <div id="divMediaClientes">
                        <dx:ASPxGridView ID="gridMediaClientes" runat="server" DataSourceID="dsMediaClientes" AutoGenerateColumns="False" EnableTheming="True" Theme="Default">
                            <Columns>
                                <dx:GridViewDataTextColumn FieldName="idDesc" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewBandColumn Caption="Média Clientes Mês" ShowInCustomizationForm="True" VisibleIndex="1">
                                    <Columns>
                                        <dx:GridViewDataTextColumn Caption="Descrição" FieldName="Descricao" ShowInCustomizationForm="True" VisibleIndex="0">
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn Caption="Clientes" FieldName="vlrClientes" ShowInCustomizationForm="True" VisibleIndex="1">
                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                            </PropertiesTextEdit>
                                        </dx:GridViewDataTextColumn>
                                    </Columns>
                                </dx:GridViewBandColumn>
                                <dx:GridViewDataTextColumn Caption="Ticket &lt;br&gt; Médio" FieldName="vlrTickets" ShowInCustomizationForm="True" VisibleIndex="4">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                            </Columns>
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                        </dx:ASPxGridView>
                        <asp:SqlDataSource ID="dsMediaClientes" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="Clientes.usp_BuscarMediaClientes_Ultimos_7_Meses" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </div>
                                                <br />
                                                 <div id="divGraphAcumulado">
                        
                                                    <dxchartsui:WebChartControl ID="chartAcum" runat="server" DataSourceID="dsMediaClienteAcum" Height="137px" Width="200px" PaletteName="Palette 1">
                                                        <diagramserializable>
                                                            <cc1:XYDiagram>
                                                                <axisx visibleinpanesserializable="-1">
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
                                                            <cc1:Series ArgumentDataMember="idDesc" Name="Series 1" ValueDataMembersSerializable="vlrDados" LabelsVisibility="True">
                                                                <viewserializable>
                                                                    <cc1:SideBySideBarSeriesView ColorEach="True">
                                                                    </cc1:SideBySideBarSeriesView>
                                                                </viewserializable>
                                                                <labelserializable>
                                                                    <cc1:SideBySideBarSeriesLabel LineVisible="True" Font="Tahoma, 10pt" Position="TopInside">
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

                                                        <palettewrappers>
                                                            <dxchartsui:PaletteWrapper Name="Palette 1" ScaleMode="Repeat">
                                                                <palette>
                                                                    <cc1:PaletteEntry Color="79, 129, 189" Color2="51, 90, 136" />
                                                                    <cc1:PaletteEntry Color="Green" Color2="Green" />
                                                                    <cc1:PaletteEntry Color="128, 100, 162" Color2="89, 69, 115" />
                                                                    <cc1:PaletteEntry Color="75, 172, 198" Color2="46, 124, 145" />
                                                                    <cc1:PaletteEntry Color="247, 150, 70" Color2="213, 101, 9" />
                                                                </palette>
                                                            </dxchartsui:PaletteWrapper>
                                                        </palettewrappers>

                            <CrosshairOptions><CommonLabelPositionSerializable>
                            <cc1:CrosshairMousePosition></cc1:CrosshairMousePosition>
                            </CommonLabelPositionSerializable>
                            </CrosshairOptions>

                            <ToolTipOptions><ToolTipPositionSerializable>
                            <cc1:ToolTipMousePosition></cc1:ToolTipMousePosition>
                            </ToolTipPositionSerializable>
                            </ToolTipOptions>
                                                    </dxchartsui:WebChartControl>

                                                    <asp:SqlDataSource ID="dsMediaClienteAcum" runat="server" ConnectionString="<%$ ConnectionStrings:gerManagerConnectionString %>" SelectCommand="Clientes.usp_BuscarMediaClientesAcumulado_Ultimos_6_Meses" SelectCommandType="StoredProcedure">
                                                        <SelectParameters>
                                                            <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Byte" />
                                                        </SelectParameters>
                                                    </asp:SqlDataSource>
                                                </div>
                                            </td>

                                           

                                        </tr>
                                    </table>
                                        
                                    
                                    
								   
                                         
                                   

							    </div>
						    </div>
					    </div>
				    </div><!-- /.span -->


                    <div class="col-xs-12 col-md-12">
					    <div class="widget-box">
						    <div class="widget-header">
							    <h4 class="widget-title">CURITIBA - Gráfico de Clientes por Região</h4>

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
								   
                                    <div id="div1">                  
                 
                                        <dxchartsui:WebChartControl ID="WebChartControl1" runat="server" DataSourceID="dsDados_KeyRegiao_1" Height="450px" Width="990px">
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
                                                            <linemarkeroptions size="2" BorderVisible="True">
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
                                                            <linemarkeroptions size="2" BorderVisible="True">
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
                                                    <linemarkeroptions BorderVisible="True">
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
                                                                        <cc1:ChartTitle Font="Tahoma, 14pt" Indent="1" Text="Comparativo de Clientes Referente ao Mesmo Mês do Ano Anterior - Mesmos Dias - REGIÃO CURITIBA" WordWrap="True" />
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
                    
		                                <asp:SqlDataSource ID="dsDados_KeyRegiao_1" runat="server" ConnectionString="<%$ ConnectionStrings:DW_VendasConnectionString %>" SelectCommand="dbo.sp_BuscarCrescimento" SelectCommandType="StoredProcedure">
                                            <SelectParameters>                                
                                                <asp:SessionParameter Name="idFilial" SessionField="sKEY_REGIAO" Type="Byte" DefaultValue="200" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>

                                    </div>

							    </div>
						    </div>
					    </div>
				    </div><!-- REGIAO CURITIBA -->

                    <div class="col-xs-12 col-md-12">
					    <div class="widget-box">
						    <div class="widget-header">
							    <h4 class="widget-title">REGIÃO METROPOLITANA - Gráfico de Clientes por Região</h4>

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
								 

                        <dxchartsui:WebChartControl ID="Graph3" runat="server" DataSourceID="dsDados_KeyRegiao_3" Height="450px" Width="990px">
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
                                            <linemarkeroptions size="2" BorderVisible="True">
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
                                            <linemarkeroptions size="2" BorderVisible="True">
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
                                    <linemarkeroptions BorderVisible="True">
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
                                                        <cc1:ChartTitle Font="Tahoma, 14pt" Indent="1" Text="Comparativo de Clientes Referente ao Mesmo Mês do Ano Anterior - Mesmos Dias - REGIÃO METROPOLITANA" WordWrap="True" />
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
                    
		                <asp:SqlDataSource ID="dsDados_KeyRegiao_3" runat="server" ConnectionString="<%$ ConnectionStrings:DW_VendasConnectionString %>" SelectCommand="dbo.sp_BuscarCrescimento" SelectCommandType="StoredProcedure">
                            <SelectParameters>                                
                                <asp:SessionParameter Name="idFilial" SessionField="sKEY_REGIAO" Type="Byte" DefaultValue="201" />
                            </SelectParameters>
                        </asp:SqlDataSource>



							    </div>
						    </div>
					    </div>
				    </div><!-- REGIAO - METROPOLITANA -->

                    <div class="col-xs-12 col-md-12">
					    <div class="widget-box">
						    <div class="widget-header">
							    <h4 class="widget-title">REGIÃO CENTRO-OESTE - Gráfico de Clientes por Região</h4>

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
								   

                        <dxchartsui:WebChartControl ID="Graph4" runat="server" DataSourceID="dsDados_KeyRegiao_4" Height="450px" Width="990px">
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
                                            <linemarkeroptions size="2" BorderVisible="True">
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
                                            <linemarkeroptions size="2" BorderVisible="True">
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
                                    <linemarkeroptions BorderVisible="True">
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
                                                        <cc1:ChartTitle Font="Tahoma, 14pt" Indent="1" Text="Comparativo de Clientes Referente ao Mesmo Mês do Ano Anterior - Mesmos Dias - REGIÃO CENTRO-OESTE" WordWrap="True" />
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
                    
		                <asp:SqlDataSource ID="dsDados_KeyRegiao_4" runat="server" ConnectionString="<%$ ConnectionStrings:DW_VendasConnectionString %>" SelectCommand="dbo.sp_BuscarCrescimento" SelectCommandType="StoredProcedure">
                            <SelectParameters>                                
                                <asp:SessionParameter Name="idFilial" SessionField="sKEY_REGIAO" Type="Byte" DefaultValue="202" />
                            </SelectParameters>
                        </asp:SqlDataSource>


							    </div>
						    </div>
					    </div>
				    </div><!-- REGIÃO CENTRO - OESTE -->

                    <div class="col-xs-12 col-md-12">
					    <div class="widget-box">
						    <div class="widget-header">
							    <h4 class="widget-title">NORTE - Gráfico de Clientes por Região</h4>

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
                             

                        <dxchartsui:WebChartControl ID="Graph5" runat="server" DataSourceID="dsDados_KeyRegiao_5" Height="450px" Width="990px">
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
                                            <linemarkeroptions size="2" BorderVisible="True">
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
                                            <linemarkeroptions size="2" BorderVisible="True">
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
                                    <linemarkeroptions BorderVisible="True">
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
                                                        <cc1:ChartTitle Font="Tahoma, 14pt" Indent="1" Text="Comparativo de Clientes Referente ao Mesmo Mês do Ano Anterior - Mesmos Dias - REGIÃO NORTE" WordWrap="True" />
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
                    
		                <asp:SqlDataSource ID="dsDados_KeyRegiao_5" runat="server" ConnectionString="<%$ ConnectionStrings:DW_VendasConnectionString %>" SelectCommand="dbo.sp_BuscarCrescimento" SelectCommandType="StoredProcedure">
                            <SelectParameters>                               
                                <asp:SessionParameter Name="idFilial" SessionField="sKEY_REGIAO" Type="Byte" DefaultValue="203" />
                            </SelectParameters>
                        </asp:SqlDataSource>
               

							    </div>
						    </div>
					    </div>
				    </div><!-- REGIÃO - NORTE -->

                    <div class="col-xs-12 col-md-12">
					    <div class="widget-box">
						    <div class="widget-header">
							    <h4 class="widget-title">REGIÃO PARANAGUÁ - Gráfico de Clientes por Região</h4>

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
								   
                                     <dxchartsui:WebChartControl ID="Graph7" runat="server" DataSourceID="dsDados_KeyRegiao_7" Height="450px" Width="990px">
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
                                            <linemarkeroptions size="2" BorderVisible="True">
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
                                            <linemarkeroptions size="2" BorderVisible="True">
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
                                    <linemarkeroptions BorderVisible="True">
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
                                                        <cc1:ChartTitle Font="Tahoma, 14pt" Indent="1" Text="Comparativo de Clientes Referente ao Mesmo Mês do Ano Anterior - Mesmos Dias - REGIÃO PARANAGUA" WordWrap="True" />
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
                    
		                <asp:SqlDataSource ID="dsDados_KeyRegiao_7" runat="server" ConnectionString="<%$ ConnectionStrings:DW_VendasConnectionString %>" SelectCommand="dbo.sp_BuscarCrescimento" SelectCommandType="StoredProcedure">
                            <SelectParameters>                                
                                <asp:SessionParameter Name="idFilial" SessionField="sKEY_REGIAO" Type="Byte" DefaultValue="211" />
                            </SelectParameters>
                        </asp:SqlDataSource>

							    </div>
						    </div>
					    </div>
				    </div><!-- REGIÃO PARANAGUÁ -->

                    <div class="col-xs-12 col-md-12">
					    <div class="widget-box">
						    <div class="widget-header">
							    <h4 class="widget-title">REGIÃO SANTA CATARINA - Gráfico de Clientes por Região</h4>

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
								                
                 
                        <dxchartsui:WebChartControl ID="Graph1" runat="server" DataSourceID="dsDados_KeyRegiao_1" Height="450px" Width="990px">
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
                                            <linemarkeroptions size="2" BorderVisible="True">
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
                                            <linemarkeroptions size="2" BorderVisible="True">
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
                                    <linemarkeroptions BorderVisible="True">
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
                                                        <cc1:ChartTitle Font="Tahoma, 14pt" Indent="1" Text="Comparativo de Clientes Referente ao Mesmo Mês do Ano Anterior - Mesmos Dias - REGIÃO SANTA CATARINA" WordWrap="True" />
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
                    
		                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DW_VendasConnectionString %>" SelectCommand="dbo.sp_BuscarCrescimento" SelectCommandType="StoredProcedure">
                            <SelectParameters>                                
                                <asp:SessionParameter Name="idFilial" SessionField="sKEY_REGIAO" Type="Byte" DefaultValue="213" />
                            </SelectParameters>
                        </asp:SqlDataSource>

                  

							    </div>
						    </div>
					    </div>
				    </div><!-- REGIAO  SANTA CATARINA -->




 

                    </div>

                </div>

               
                
                    




                   

                   


                    

                   
                 

                   


            
                        
                 


                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>

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


        <script src="../../assets/js/jquery-ui.custom.min.js"></script>
		<script src="../../assets/js/jquery.ui.touch-punch.min.js"></script>
		<script src="../../assets/js/chosen.jquery.min.js"></script>
		<script src="../../assets/js/spinbox.min.js"></script>
		<script src="../../assets/js/bootstrap-datepicker.min.js"></script>
		<script src="../../assets/js/bootstrap-timepicker.min.js"></script>
		<script src="../../assets/js/moment.min.js"></script>
		<script src="../../assets/js/daterangepicker.min.js"></script>
		<script src="../../assets/js/bootstrap-datetimepicker.min.js"></script>
		<script src="../../assets/js/bootstrap-colorpicker.min.js"></script>
		<script src="../../assets/js/jquery.knob.min.js"></script>
		<script src="../../assets/js/autosize.min.js"></script>
		<script src="../../assets/js/jquery.inputlimiter.min.js"></script>
		<script src="../../assets/js/jquery.maskedinput.min.js"></script>
		<script src="../../assets/js/bootstrap-tag.min.js"></script>

		<!-- ace scripts -->
		<script src="../../assets/js/ace-elements.min.js"></script>
		<script src="../../assets/js/ace.min.js"></script>


</asp:Content>



