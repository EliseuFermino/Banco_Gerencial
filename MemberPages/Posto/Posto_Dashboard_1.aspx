<%@ Page Title="" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="Posto_Dashboard_1.aspx.vb" Inherits="MemberPages_Posto_Posto_Dashboard_1" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>




<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    
    <style type="text/css" >

        #divDados {
            clear:both;
            float:left ;
            width: 100%;
        }

    </style>


    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="../../css/Dashboard.css" rel="stylesheet" />    
    <link href="../../css/bootstrap.min.css" rel="stylesheet" />
    <%--<script src="../../Scripts/jquery-2.2.3.min.js"></script>--%>
    <script src="../../js/bootstrap.min.js"></script>
      <!-- Ionicons -->
    <link href="../../css/ionicons.min.css" rel="stylesheet" />
    <link href="../../assets/css/ace.min.css" rel="stylesheet" />


  <!-- Font Awesome -->    

    <link href="../../assets/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">

    <%----------------------------------------------------------------------------------------------------------------------------------------------%>

    <div class="container-fluid">

    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
          Dashboard - Postos
        <small>Consultas</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Principal</a></li>
        <li class="active">Dashboard</li>
      </ol>
        
    </section>



                



        <div id="divDados">
            <div class="row">
                
                <div class="col-md-12">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="glyphicon glyphicon-list-alt"></span> &nbsp Margem Negativa por Produto e por Filial</h4>

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
                                
                                <%--------------	--%>						
                                
                                
                                <dx:ASPxGridView ID="grid1" runat="server" DataSourceID="dsGrid1" Width="100%" AutoGenerateColumns="False" EnableTheming="True" Theme="SoftOrange">
                                    <SettingsPager Mode="ShowAllRecords">
                                    </SettingsPager>
                                    <Settings HorizontalScrollBarMode="Visible" ShowFooter="True" />

                                    <Columns>
                                        <dx:GridViewDataTextColumn FieldName="idFilial" FixedStyle="Left" VisibleIndex="0" Width="55px">
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewDataTextColumn FieldName="nomeFilial" FixedStyle="Left" VisibleIndex="1" Width="200px">
                                            <CellStyle Wrap="False">
                                            </CellStyle>
                                        </dx:GridViewDataTextColumn>
                                        <dx:GridViewBandColumn Caption="por Dia" VisibleIndex="2">
                                            <Columns>
                                                <dx:GridViewBandColumn Caption="Volume" VisibleIndex="0">
                                                    <Columns>
                                                        <dx:GridViewDataTextColumn Caption="2018" FieldName="qtdReal_AA" VisibleIndex="0">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn Caption="2019" FieldName="qtdReal_AT" VisibleIndex="1">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n0}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                        </dx:GridViewDataTextColumn>
                                                    </Columns>
                                                </dx:GridViewBandColumn>
                                            </Columns>
                                        </dx:GridViewBandColumn>
                                    </Columns>
                                    <TotalSummary>
                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="qtdReal_AA" SummaryType="Sum" />
                                        <dx:ASPxSummaryItem DisplayFormat="{0:n0}" FieldName="qtdReal_AT" SummaryType="Sum" />
                                    </TotalSummary>

                                </dx:ASPxGridView>

                                
                                
                                <asp:SqlDataSource ID="dsGrid1" runat="server" ConnectionString="<%$ ConnectionStrings:DWConnectionString %>" SelectCommand="Posto.usp_Dashboard_Buscar" SelectCommandType="StoredProcedure"></asp:SqlDataSource>

                                
                                <%--------------	--%>		
                                					
							</div>
						</div>
					</div>
				</div><!-- /.span -->

              
           </div>   
        </div>

<%------------------------------------------------------------------------------------------------------------------------------------------------------%>


            <div class="row">
                
                <div class="col-md-12">
					<div class="widget-box">
						<div class="widget-header">
							<h4 class="widget-title"><span class="glyphicon glyphicon-list-alt"></span> &nbsp Margem Negativa por Produto e por Filial</h4>

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
                                
                                <%--------------	--%>						
                               

                                
                                <%--------------	--%>		
                                					
							</div>
						</div>
					</div>
				</div><!-- /.span -->

              
           </div>   




        <asp:Label ID="lblError" runat="server" Text="Label"  ForeColor="Red" Visible="False"></asp:Label>


 </div> 


       
        <br />
    </p>


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

