<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Dashboard_Posto.aspx.vb" Inherits="MemberPages_Posto_Dashboard_Posto" %>



<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>



<%@ Register Src="~/Controles/wucListaDia.ascx" TagPrefix="uc1" TagName="wucListaDia" %>

<%@ Register assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.XtraCharts" tagprefix="cc1" %>



<!DOCTYPE html>

<html>

<head runat="server">

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">    

    <title></title>

    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.4.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">

    <link href="../../css/bootstrap.min.css" rel="stylesheet" />
    <link href="../../css/AdminLTE.min.css" rel="stylesheet" />
    
</head>
<body >
       

    <form id="form1" runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>


    <div class="wrapper">    

      <div class="container-fluid" style="background-color:#ecf0f5">
        <!-- Content Header (Page header) -->
        <section class="content-header">

          <h1>
              <asp:Button ID="Button1" runat="server" Text="Menu" CssClass="btn btn-danger" />    
              <img src="../../image/LogoCondor_Vermelho_25.jpg" height="27" width="120 " /> Posto             
          </h1>
            
          <div class="breadcrumb navbar navbar-right">     
 
            <li><uc1:wucListaDia runat="server" ID="cboDia" /></li>

                 

          </div>
        </section>

        <!-- Main content -->
        <section class="content">

          <div class="row">

            <div class="col-lg-2 col-md-3 col-sm-4 col-xs-6">
                <div class="panel panel-primary">
                  <div class="panel-heading">
                    <h3 class="panel-title">Total Geral</h3>
                  </div>
                  <div >
                      
                  <table class="table table-bordered table-condensed tabl " >
                    <tr>                     
                      <th class="text-center">Volume</th>
                      <th class="text-center">Venda</th>                      
                      <th style="width: 80px">% Part.</th>
                    </tr>
                    <tr>                    
                      <td class="text-right" ><asp:Label ID="lbl_Qtde_Total_Geral" runat="server" Text="0,00"></asp:Label></td>
                      <td class="text-right" ><asp:Label ID="lbl_Valor_Total_Geral" runat="server" Text="0,00"></asp:Label></td>
                      <td class="text-center"><span class="badge bg-green">100,00%</span></td>
                    </tr>
                  </table>


                  </div>
                </div>
            </div>


            <div class="col-lg-2 col-md-3 col-sm-4 col-xs-6">
                <div class="panel panel-primary">
                  <div class="panel-heading">
                    <h3 class="panel-title">Total dos Combustiveis</h3>
                  </div>
                  <div >
                      
                  <table class="table table-bordered table-condensed tabl " >
                    <tr>                     
                      <th class="text-center">Volume</th>
                      <th class="text-center">Venda</th>                      
                      <th style="width: 80px">% Part.</th>
                    </tr>
                    <tr>                    
                      <td class="text-right" ><asp:Label ID="lbl_Qtde_Total_Combustiveis" runat="server" Text="0,00"></asp:Label></td>
                      <td class="text-right" ><asp:Label ID="lbl_Valor_Total_Combustiveis" runat="server" Text="0,00"></asp:Label></td>
                      <td class="text-center"><span class="badge bg-green"> <asp:Label ID="perc_Total_Combustiveis" runat="server" Text="0,00%"></asp:Label></span></td>
                    </tr>
                  </table>

                  </div>
                </div>
            </div>

            <div class="col-lg-2 col-md-3 col-sm-4 col-xs-6">
                <div class="panel panel-danger">
                  <div class="panel-heading">
                    <h3 class="panel-title">Total de Gasolina</h3>
                  </div>
                  <div >
                      
                  <table class="table table-bordered table-condensed tabl " >
                    <tr>                     
                      <th class="text-center">Volume</th>
                      <th class="text-center">Venda</th>                      
                      <th style="width: 80px">% Part.</th>
                    </tr>
                    <tr>                    
                      <td class="text-right" ><asp:Label ID="lbl_Qtde_Total_Gasolina" runat="server" Text="0,00"></asp:Label></td>
                      <td class="text-right" ><asp:Label ID="lbl_Valor_Total_Gasolina" runat="server" Text="0,00"></asp:Label></td>
                      <td class="text-center"><span class="badge bg-green"> <asp:Label ID="perc_Total_Gasolina" runat="server" Text="0,00%"></asp:Label></span></td>
                    </tr>
                  </table>


                  </div>
                </div>
            </div>

            <div class="col-lg-2 col-md-3 col-sm-4 col-xs-6">
                <div class="panel panel-danger">
                  <div class="panel-heading">
                    <h3 class="panel-title">Total de Diesel</h3>
                  </div>
                  <div >
                      
                  <table class="table table-bordered table-condensed tabl " >

                    <tr>                   
                      <th class="text-center">Volume</th>
                      <th class="text-center">Venda</th>                      
                      <th style="width: 80px">% Part.</th>
                    </tr>

                    <tr>                     
                      <td class="text-right" ><asp:Label ID="lbl_Qtde_Total_Diesel" runat="server" Text="0,00"></asp:Label></td>
                      <td class="text-right" ><asp:Label ID="lbl_Valor_Total_Diesel" runat="server" Text="0,00"></asp:Label></td>
                      <td class="text-center"><span class="badge bg-green"> <asp:Label ID="perc_Total_Diesel" runat="server" Text="0,00%"></asp:Label></span></td>
                    </tr>
                  </table>


                  </div>
                </div>
            </div>

            <div class="col-lg-2 col-md-3 col-sm-4 col-xs-6">
                <div class="panel panel-success">
                  <div class="panel-heading">
                    <h3 class="panel-title">Total Outros</h3>
                  </div>
                  <div >
                      
                  <table class="table table-bordered table-condensed tabl " >
                    <tr>                   
                      <th class="text-center">Volume</th>
                      <th class="text-center">Venda</th>                      
                      <th style="width: 80px">% Part.</th>
                    </tr>

                    <tr>                     
                      <td class="text-right" ><asp:Label ID="lbl_Qtde_Total_Outros" runat="server" Text="0,00"></asp:Label></td>
                      <td class="text-right" ><asp:Label ID="lbl_Valor_Total_Outros" runat="server" Text="0,00"></asp:Label></td>
                      <td class="text-center"><span class="badge bg-green"> <asp:Label ID="perc_Total_Outros" runat="server" Text="0,00%"></asp:Label></span></td>
                    </tr>
                  </table>


                  </div>
                </div>
            </div>


          </div>

          <div class="row">

            <div class="col-md-6">
              <div class="box">
                <div class="box-header with-border">
                  <h3 class="box-title">Combustivel</h3>

                </div><!-- /.box-header -->
                <div class="box-body">
                  <table class="table table-bordered table-striped">
                    <tr>                      
                      <th>Descrição da Conta</th>
                      <th class="text-right">Volume</th>
                      <th class="text-right">Venda</th>                      
                      <th style="width: 80px">% Part.</th>
                    </tr>

                    <tr>                      
                      <td>Gasolina Tipo C. Shell</td>
                      <td class="text-right" ><asp:Label ID="lbl_Qtde_09" runat="server" Text="0,00"></asp:Label></td>
                      <td class="text-right" ><asp:Label ID="lbl_Vlr_09" runat="server" Text="0,00"></asp:Label></td>
                      <td class="text-center"><span class="badge bg-green"> <asp:Label ID="perc_09" runat="server" Text="0,00%"></asp:Label></span></td>
                    </tr>

                    <tr>                      
                      <td>Gasolina V-Power Aditivada</td>
                      <td class="text-right" ><asp:Label ID="lbl_Qtde_10" runat="server" Text="0,00"></asp:Label></td>
                      <td class="text-right" ><asp:Label ID="lbl_Vlr_10" runat="server" Text="0,00"></asp:Label></td>
                      <td class="text-center"><span class="badge bg-green"> <asp:Label ID="perc_10" runat="server" Text="0,00%"></asp:Label></span></td>
                    </tr>

                    <tr>                      
                      <td>Alcool Etilico HD CB Shell</td>
                      <td class="text-right" ><asp:Label ID="lbl_Qtde_11" runat="server" Text="0,00"></asp:Label></td>
                      <td class="text-right" ><asp:Label ID="lbl_Vlr_11" runat="server" Text="0,00"></asp:Label></td>
                      <td class="text-center"><span class="badge bg-green"> <asp:Label ID="perc_11" runat="server" Text="0,00%"></asp:Label></span></td>
                    </tr>

                    <tr>                      
                      <td>Diesel B S10 Shell Evolux Aditiva</td>
                      <td class="text-right" ><asp:Label ID="lbl_Qtde_641" runat="server" Text="0,00"></asp:Label></td>
                      <td class="text-right" ><asp:Label ID="lbl_Vlr_641" runat="server" Text="0,00"></asp:Label></td>
                      <td class="text-center"><span class="badge bg-green"> <asp:Label ID="perc_641" runat="server" Text="0,00%"></asp:Label></span></td>
                    </tr>

                    <tr>                      
                      <td>Diesel B S500 Shell</td>
                      <td class="text-right" ><asp:Label ID="lbl_Qtde_12" runat="server" Text="0,00"></asp:Label></td>
                      <td class="text-right" ><asp:Label ID="lbl_Vlr_12" runat="server" Text="0,00"></asp:Label></td>
                      <td class="text-center"><span class="badge bg-green"> <asp:Label ID="perc_12" runat="server" Text="0,00%"></asp:Label></span></td>
                    </tr>

                    <tr>                      
                      <td>Diesel B S500 Shell Evolux Aditivil</td>
                      <td class="text-right" ><asp:Label ID="lbl_Qtde_13" runat="server" Text="0,00"></asp:Label></td>
                      <td class="text-right" ><asp:Label ID="lbl_Vlr_13" runat="server" Text="0,00"></asp:Label></td>
                      <td class="text-center"><span class="badge bg-green"> <asp:Label ID="perc_13" runat="server" Text="0,00%"></asp:Label></span></td>
                    </tr>

                  </table>
                </div><!-- /.box-body -->

              </div><!-- /.box -->              

            </div><!-- /.col -->

            <div class="col-md-6">
         
              <div class="box">
                <div class="box-header with-border">
                  <h3 class="box-title">Outros</h3>


                </div><!-- /.box-header -->
                <div class="box-body">
                  <table class="table table-bordered table-striped">
                    <tr>                      
                      <th>Descrição da Conta</th>
                      <th class="text-right">Volume</th>
                      <th class="text-right">Venda</th>                      
                      <th style="width: 80px">% Cresc.</th>
                    </tr>

                    <tr>                      
                      <td>Bebidas</td>
                      <td class="text-right" ><asp:Label ID="lbl_Qtde_26" runat="server" Text="0,00"></asp:Label></td>
                      <td class="text-right" ><asp:Label ID="lbl_Vlr_26" runat="server" Text="0,00"></asp:Label></td>
                      <td class="text-center"><span class="badge bg-green"> <asp:Label ID="perc_26" runat="server" Text="0,00%"></asp:Label></span></td>
                    </tr>

                    <tr>                      
                      <td>Cigarros</td>
                      <td class="text-right" ><asp:Label ID="lbl_Qtde_33" runat="server" Text="0,00"></asp:Label></td>
                      <td class="text-right" ><asp:Label ID="lbl_Vlr_33" runat="server" Text="0,00"></asp:Label></td>
                      <td class="text-center"><span class="badge bg-green"> <asp:Label ID="perc_33" runat="server" Text="0,00%"></asp:Label></span></td>
                    </tr>

                    <tr>                      
                      <td>Filtros</td>
                      <td class="text-right" ><asp:Label ID="lbl_Qtde_32" runat="server" Text="0,00"></asp:Label></td>
                      <td class="text-right" ><asp:Label ID="lbl_Vlr_32" runat="server" Text="0,00"></asp:Label></td>
                      <td class="text-center"><span class="badge bg-green"> <asp:Label ID="perc_32" runat="server" Text="0,00%"></asp:Label></span></td>
                    </tr>

                    <tr>                      
                      <td>Lubrificantes</td>
                      <td class="text-right" ><asp:Label ID="lbl_Qtde_3" runat="server" Text="0,00"></asp:Label></td>
                      <td class="text-right" ><asp:Label ID="lbl_Vlr_3" runat="server" Text="0,00"></asp:Label></td>
                      <td class="text-center"><span class="badge bg-green"> <asp:Label ID="perc_3" runat="server" Text="0,00%"></asp:Label></span></td>
                    </tr>

                    <tr>                      
                      <td>Mini-Mercado</td>
                      <td class="text-right" ><asp:Label ID="lbl_Qtde_25" runat="server" Text="0,00"></asp:Label></td>
                      <td class="text-right" ><asp:Label ID="lbl_Vlr_25" runat="server" Text="0,00"></asp:Label></td>
                      <td class="text-center"><span class="badge bg-green"> <asp:Label ID="perc_25" runat="server" Text="0,00%"></asp:Label></span></td>
                    </tr>

                    <tr>                      
                      <td>Sorvetes</td>
                      <td class="text-right" ><asp:Label ID="lbl_Qtde_30" runat="server" Text="0,00"></asp:Label></td>
                      <td class="text-right" ><asp:Label ID="lbl_Vlr_30" runat="server" Text="0,00"></asp:Label></td>
                      <td class="text-center"><span class="badge bg-green"> <asp:Label ID="perc_30" runat="server" Text="0,00%"></asp:Label></span></td>
                    </tr>

                  </table>
                </div><!-- /.box-body -->

              </div><!-- /.box -->

            
            </div><!-- /.col -->
          </div><!-- /.row -->


         <div class="row">
             <div class="col-md-6" style="padding-bottom:20px">
                 <dxchartsui:WebChartControl ID="WebChartControl1" runat="server" DataSourceID="ds_TotalVenda" Height="200px" Width="510px">
                     <borderoptions color="224, 224, 224" />
                     <diagramserializable>
                         <cc1:XYDiagram>
                             <axisx visibleinpanesserializable="-1">
                                 <range sidemarginsenabled="True" />
                             </axisx>
                             <axisy visible="False" visibleinpanesserializable="-1">
                                 <range sidemarginsenabled="True" />
                                 <gridlines visible="False">
                                 </gridlines>
                             </axisy>
                             <defaultpane bordervisible="False">
                             </defaultpane>
                         </cc1:XYDiagram>
                     </diagramserializable>
                     <fillstyle>
                         <optionsserializable>
                             <cc1:SolidFillOptions />
                         </optionsserializable>
                     </fillstyle>
                     <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside"></legend>
                     <seriesserializable>
                         <cc1:Series ArgumentDataMember="Periodo" LabelsVisibility="True" Name="Venda Total" ValueDataMembersSerializable="vlrVenda">
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
                     <titles>
                         <cc1:ChartTitle Font="Tahoma, 14pt" Text="Venda Total do Posto - Mês" />
                     </titles>
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
                 <asp:SqlDataSource ID="ds_TotalVenda" runat="server" ConnectionString="<%$ ConnectionStrings:VendasConnectionString %>" SelectCommand="Posto.usp_BuscarVenda_Mes_Total" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
             </div>

             <div class="col-md-6">
                 <dxchartsui:WebChartControl ID="graphVolume" runat="server" DataSourceID="ds_TotalVenda" Height="200px" Width="510px" PaletteName="Equity">
                     <borderoptions color="224, 224, 224" />
                     <diagramserializable>
                         <cc1:XYDiagram>
                             <axisx visibleinpanesserializable="-1">
                                 <range sidemarginsenabled="True" />
                             </axisx>
                             <axisy visible="False" visibleinpanesserializable="-1">
                                 <range sidemarginsenabled="True" />
                                 <gridlines visible="False">
                                 </gridlines>
                             </axisy>
                             <defaultpane bordervisible="False">
                             </defaultpane>
                         </cc1:XYDiagram>
                     </diagramserializable>
                     <fillstyle>
                         <optionsserializable>
                             <cc1:SolidFillOptions />
                         </optionsserializable>
                     </fillstyle>
                     <legend alignmenthorizontal="Center" alignmentvertical="BottomOutside"></legend>
                     <seriesserializable>
                         <cc1:Series ArgumentDataMember="Periodo" LabelsVisibility="True" Name="Volume Total" ValueDataMembersSerializable="Qtde">
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
                     <titles>
                         <cc1:ChartTitle Font="Tahoma, 14pt" Text="Volume Total do Posto - Mês" />
                     </titles>
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
             </div>
         </div>  




        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->

    </div>

        </ContentTemplate>
    </asp:UpdatePanel>

        

    </form>


</body>
</html>
