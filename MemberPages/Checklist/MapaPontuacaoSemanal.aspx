<%@ Page Title="Pontuação Diária / Semanal" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="MapaPontuacaoSemanal.aspx.vb" Inherits="MemberPages_Checklist_MapaPontuacaoSemanal" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.XtraCharts.v18.2.Web, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts.Web" TagPrefix="dxchartsui" %>
<%@ Register Assembly="DevExpress.XtraCharts.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.XtraCharts" TagPrefix="cc1" %>

<%@ Register Src="~/Controles/wucListaLojasComCorporacao.ascx" TagPrefix="uc1" TagName="wucListaLojasComCorporacao" %>
<%@ Register Src="~/Controles/wucAno.ascx" TagPrefix="uc1" TagName="wucAno" %>
<%@ Register Src="~/Controles/wuciListaMes.ascx" TagPrefix="uc1" TagName="wuciListaMes" %>
<%@ Register Src="~/Controles/wucBotaoExcel.ascx" TagPrefix="uc1" TagName="wucBotaoExcel" %>



<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">

    <link href="../../css/Dashboard.css" rel="stylesheet" />
    <link href="../../css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-2.2.3.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <!-- Ionicons -->
    <link href="../../css/ionicons.min.css" rel="stylesheet" />
    <link href="../../assets/css/ace.min.css" rel="stylesheet" />


    <!-- Font Awesome -->

    <link href="../../assets/font-awesome/4.5.0/css/font-awesome.min.css" rel="stylesheet" />

    <%-------------------------------------------------------------------------------------------------------------------------------------------%>

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




        /*-------------------------------------------------------------------------------------------------------------------------------------------------------------*/

        #divFilial {
            clear: both;
            float: left;
            margin-left: 2px;
            margin-top: 2px;
        }

        #divAno {
            float: left;
            margin-left: 5px;
            margin-top: 2px;
        }

        #divMes {
            float: left;
            margin-left: 5px;
        }

        #divGrupoSubgrupo {
            float: left;
            margin-left: 10px;
            margin-top: 2px;
        }

        #divBotaoAtualizar {
            float: left;
            margin-left: 10px;
            margin-top: 2px;
        }

        #divExcel {
            float: left;
            margin-left: 10px;
            margin-top: 2px;
        }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">

    <div class="container-fluid">

        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>Dashboard Comercial - Comprador: 
        <small>
            <asp:Label ID="lblNomeComprador" runat="server" Text=""></asp:Label>
        </small>
            </h1>
            <ol class="breadcrumb">
                <li><a href="#"><i class="fa fa-dashboard"></i>Principal</a></li>
                <li class="active">Dashboard</li>
            </ol>

        </section>



        <div id="divFilial" class="BGC_myBorder">
            <uc1:wuclistalojascomcorporacao runat="server" id="cboFilial" />
        </div>

        <div id="divAno" class="BGC_myBorder">
            <uc1:wucano runat="server" id="cboAno" />
        </div>

        <div id="divMes">
            <uc1:wucilistames runat="server" id="cboMes" />
        </div>

        <div id="divGrupoSubgrupo" class="BGC_myBorder">
            <dx:aspxcheckbox id="chkGrupoSub" runat="server" theme="DevEx" text="por Grupo" forecolor="Blue" checkstate="Unchecked">
                <clientsideevents checkedchanged="function(s, e) {	cbPanel.PerformCallback();    cbPanelNaoConforme.PerformCallback();}" />
            </dx:aspxcheckbox>
        </div>

        <div id="divBotaoAtualizar" class="BGC_myBorder">
            <dx:aspxbutton id="btnAtualizar" runat="server" text="Atualizar" autopostback="False" theme="MetropolisBlue">
                <clientsideevents click="function(s, e) {cbPanel.PerformCallback(); cbPanelNaoConforme.PerformCallback();}" />
            </dx:aspxbutton>
        </div>

        <div id="divExcel" class="BGC_myBorder">
            <uc1:wucbotaoexcel runat="server" id="btnExcel" callgridviewid="grid" guianome="Pontuação Check-List" />
        </div>

        <dx:aspxcallbackpanel id="cbPanel" runat="server" width="100%" clientinstancename="cbPanel" theme="Metropolis" settingsloadingpanel-text="Aguarde&amp;hellip;">
            <settingsloadingpanel text="Aguarde&amp;hellip;"></settingsloadingpanel>
            <panelcollection>
                <dx:panelcontent id="PanelContent1" runat="server" supportsdisabledattributes="both">
                    <asp:Label ID="lblError" runat="server" Text="Label" Font-Bold="true" ForeColor="Red"></asp:Label>
                    <div class="row Quebra_Pagina_Row" visible="false" runat="server" id="divGrafico">

                        <div class="col-md-12">
                            <div class="widget-box">
                                <div class="widget-header">
                                    <h4 class="widget-title">Pontuação por Mês e Quadrimestre</h4>

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

                                        <div id="div_Pontuacao">

                                            <dxchartsui:webchartcontrol id="graph_Pontuacao_Mensal" runat="server" backcolor="Transparent" datasourceid="" height="150px" width="1000px">

                                                <borderoptions visible="False" />
                                                <diagramserializable>
                                                    <cc1:xydiagram>
                                                        <axisx visibleinpanesserializable="-1">
                                                            <tickmarks minorvisible="False" />
                                                            <label font="Tahoma, 10pt">
                                                            </label>
                                                            <range sidemarginsenabled="True" />
                                                            <gridlines color="Gray" visible="True">
                                                            </gridlines>
                                                        </axisx>
                                                        <axisy visible="False" visibleinpanesserializable="-1">
                                                            <range sidemarginsenabled="True" />
                                                            <gridlines visible="False">
                                                            </gridlines>
                                                        </axisy>
                                                        <defaultpane backcolor="Transparent" bordervisible="False">
                                                        </defaultpane>
                                                    </cc1:xydiagram>
                                                </diagramserializable>
                                                <fillstyle>
                                                    <optionsserializable>
                                                        <cc1:solidfilloptions></cc1:solidfilloptions>
                                                    </optionsserializable>
                                                </fillstyle>

                                                <legend visibility="False"></legend>
                                                <seriesserializable>
                                                    <cc1:series argumentdatamember="descMesRed" labelsvisibility="True" name="Series 1" valuedatamembersserializable="Nota">
                                                        <viewserializable>
                                                            <cc1:lineseriesview markervisibility="True">
                                                                <linemarkeroptions bordervisible="True">
                                                                </linemarkeroptions>
                                                            </cc1:lineseriesview>
                                                        </viewserializable>
                                                        <labelserializable>
                                                            <cc1:pointserieslabel font="Tahoma, 10pt" linevisible="True" textpattern="{V:n2}">
                                                                <fillstyle>
                                                                    <optionsserializable>
                                                                        <cc1:solidfilloptions />
                                                                    </optionsserializable>
                                                                </fillstyle>
                                                                <pointoptionsserializable>
                                                                    <cc1:pointoptions>
                                                                        <argumentnumericoptions format="Number" />
                                                                        <valuenumericoptions format="Number" />
                                                                    </cc1:pointoptions>
                                                                </pointoptionsserializable>
                                                            </cc1:pointserieslabel>
                                                        </labelserializable>
                                                        <legendpointoptionsserializable>
                                                            <cc1:pointoptions>
                                                                <argumentnumericoptions format="Number" />
                                                                <valuenumericoptions format="Number" />
                                                            </cc1:pointoptions>
                                                        </legendpointoptionsserializable>
                                                    </cc1:series>
                                                </seriesserializable>

                                                <seriestemplate>
                                                    <viewserializable>
                                                        <cc1:lineseriesview markervisibility="True">
                                                            <linemarkeroptions bordervisible="True">
                                                            </linemarkeroptions>
                                                        </cc1:lineseriesview>
                                                    </viewserializable>
                                                    <labelserializable>
                                                        <cc1:pointserieslabel linevisible="True">
                                                            <fillstyle>
                                                                <optionsserializable>
                                                                    <cc1:solidfilloptions />
                                                                </optionsserializable>
                                                            </fillstyle>
                                                            <pointoptionsserializable>
                                                                <cc1:pointoptions>
                                                                </cc1:pointoptions>
                                                            </pointoptionsserializable>
                                                        </cc1:pointserieslabel>
                                                    </labelserializable>
                                                    <legendpointoptionsserializable>
                                                        <cc1:pointoptions></cc1:pointoptions>
                                                    </legendpointoptionsserializable>
                                                </seriestemplate>

                                                <crosshairoptions>
                                                    <commonlabelpositionserializable>
                                                        <cc1:crosshairmouseposition></cc1:crosshairmouseposition>
                                                    </commonlabelpositionserializable>
                                                </crosshairoptions>

                                                <tooltipoptions>
                                                    <tooltippositionserializable>
                                                        <cc1:tooltipmouseposition></cc1:tooltipmouseposition>
                                                    </tooltippositionserializable>
                                                </tooltipoptions>

                                            </dxchartsui:webchartcontrol>
                                            <asp:SqlDataSource ID="dsPontuacao_Dados_Mensal" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="uspBuscarNotaLoja_Mes_a_Mes" SelectCommandType="StoredProcedure">
                                                <selectparameters>
                                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="int16" />
                                                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                                </selectparameters>
                                            </asp:SqlDataSource>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.span -->

                    </div>


                    <div class="row Quebra_Pagina_Row">

                        <div class="col-md-12">
                            <div class="widget-box">
                                <div class="widget-header">
                                    <h4 class="widget-title">Pontuação por Dia</h4>

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

                                        <dx:aspxgridview id="grid" runat="server" autogeneratecolumns="False" datasourceid="dsDados" width="100%" keyfieldname="descPergunta">
                                            <totalsummary>
                                                <dx:aspxsummaryitem displayformat="{0:n0}" fieldname="Conforme" summarytype="Sum" />
                                                <dx:aspxsummaryitem displayformat="{0:n0}" fieldname="Validos" summarytype="Sum" />
                                                <dx:aspxsummaryitem displayformat="{0:n2}" fieldname="Nota" summarytype="Custom" />

                                                <dx:aspxsummaryitem displayformat="{0:n2}" fieldname="Dia1" summarytype="Custom" />
                                                <dx:aspxsummaryitem displayformat="{0:n2}" fieldname="Dia2" summarytype="Custom" />
                                                <dx:aspxsummaryitem displayformat="{0:n2}" fieldname="Dia3" summarytype="Custom" />
                                                <dx:aspxsummaryitem displayformat="{0:n2}" fieldname="Dia4" summarytype="Custom" />
                                                <dx:aspxsummaryitem displayformat="{0:n2}" fieldname="Dia5" summarytype="Custom" />
                                                <dx:aspxsummaryitem displayformat="{0:n2}" fieldname="Dia6" summarytype="Custom" />
                                                <dx:aspxsummaryitem displayformat="{0:n2}" fieldname="Dia7" summarytype="Custom" />
                                                <dx:aspxsummaryitem displayformat="{0:n2}" fieldname="Dia8" summarytype="Custom" />
                                                <dx:aspxsummaryitem displayformat="{0:n2}" fieldname="Dia9" summarytype="Custom" />

                                                <dx:aspxsummaryitem displayformat="{0:n2}" fieldname="Dia10" summarytype="Custom" />
                                                <dx:aspxsummaryitem displayformat="{0:n2}" fieldname="Dia11" summarytype="Custom" />
                                                <dx:aspxsummaryitem displayformat="{0:n2}" fieldname="Dia12" summarytype="Custom" />
                                                <dx:aspxsummaryitem displayformat="{0:n2}" fieldname="Dia13" summarytype="Custom" />
                                                <dx:aspxsummaryitem displayformat="{0:n2}" fieldname="Dia14" summarytype="Custom" />
                                                <dx:aspxsummaryitem displayformat="{0:n2}" fieldname="Dia15" summarytype="Custom" />
                                                <dx:aspxsummaryitem displayformat="{0:n2}" fieldname="Dia16" summarytype="Custom" />
                                                <dx:aspxsummaryitem displayformat="{0:n2}" fieldname="Dia17" summarytype="Custom" />
                                                <dx:aspxsummaryitem displayformat="{0:n2}" fieldname="Dia18" summarytype="Custom" />
                                                <dx:aspxsummaryitem displayformat="{0:n2}" fieldname="Dia19" summarytype="Custom" />

                                                <dx:aspxsummaryitem displayformat="{0:n2}" fieldname="Dia20" summarytype="Custom" />
                                                <dx:aspxsummaryitem displayformat="{0:n2}" fieldname="Dia21" summarytype="Custom" />
                                                <dx:aspxsummaryitem displayformat="{0:n2}" fieldname="Dia22" summarytype="Custom" />
                                                <dx:aspxsummaryitem displayformat="{0:n2}" fieldname="Dia23" summarytype="Custom" />
                                                <dx:aspxsummaryitem displayformat="{0:n2}" fieldname="Dia24" summarytype="Custom" />
                                                <dx:aspxsummaryitem displayformat="{0:n2}" fieldname="Dia25" summarytype="Custom" />
                                                <dx:aspxsummaryitem displayformat="{0:n2}" fieldname="Dia26" summarytype="Custom" />
                                                <dx:aspxsummaryitem displayformat="{0:n2}" fieldname="Dia27" summarytype="Custom" />
                                                <dx:aspxsummaryitem displayformat="{0:n2}" fieldname="Dia28" summarytype="Custom" />
                                                <dx:aspxsummaryitem displayformat="{0:n2}" fieldname="Dia29" summarytype="Custom" />

                                                <dx:aspxsummaryitem displayformat="{0:n2}" fieldname="Dia30" summarytype="Custom" />
                                                <dx:aspxsummaryitem displayformat="{0:n2}" fieldname="Dia31" summarytype="Custom" />

                                            </totalsummary>
                                            <groupsummary>
                                                <dx:aspxsummaryitem displayformat="{0:n0}" fieldname="Conforme" showingroupfootercolumn="Conforme" summarytype="Sum" />
                                                <dx:aspxsummaryitem displayformat="{0:n0}" fieldname="Validos" showingroupfootercolumn="Validos" summarytype="Sum" />
                                                <dx:aspxsummaryitem displayformat="{0:n2}" fieldname="Nota" showingroupfootercolumn="Nota" summarytype="Custom" />
                                            </groupsummary>
                                            <columns>
                                                <dx:gridviewcommandcolumn showincustomizationform="True" visible="False" visibleindex="0" showclearfilterbutton="True" />
                                                <dx:gridviewdatatextcolumn fieldname="listaGrupo" showincustomizationform="True" visibleindex="33" width="115px" caption="Grupo" visible="True">
                                                    <settings allowautofilter="True" autofiltercondition="Contains" />
                                                    <cellstyle wrap="False">
                                                    </cellstyle>
                                                </dx:gridviewdatatextcolumn>
                                                <dx:gridviewdatatextcolumn fieldname="descPergunta" showincustomizationform="True" visibleindex="1" width="260px" caption="Questão" fixedstyle="Left">
                                                    <settings allowautofilter="True" autofiltercondition="Contains" />
                                                    <cellstyle wrap="False">
                                                    </cellstyle>
                                                </dx:gridviewdatatextcolumn>

                                                <dx:gridviewbandcolumn caption="Pontuação" showincustomizationform="True" visibleindex="2" fixedstyle="Left">
                                                    <columns>
                                                        <dx:gridviewdatatextcolumn fieldname="Conforme" showincustomizationform="True" visibleindex="0" width="65px">
                                                            <propertiestextedit displayformatstring="{0:n2}" encodehtml="False">
                                                            </propertiestextedit>
                                                            <settings allowautofilter="False" />
                                                            <cellstyle font-bold="True" forecolor="Blue" horizontalalign="Center">
                                                            </cellstyle>
                                                            <footercellstyle font-bold="True" forecolor="Blue" horizontalalign="Center">
                                                            </footercellstyle>
                                                        </dx:gridviewdatatextcolumn>
                                                        <dx:gridviewdatatextcolumn fieldname="Validos" showincustomizationform="True" visibleindex="1" width="60px">
                                                            <propertiestextedit displayformatstring="{0:n2}" encodehtml="False">
                                                            </propertiestextedit>
                                                            <settings allowautofilter="False" />
                                                            <cellstyle font-bold="True" forecolor="#009900" horizontalalign="Center">
                                                            </cellstyle>
                                                            <footercellstyle font-bold="True" forecolor="#009900" horizontalalign="Center">
                                                            </footercellstyle>
                                                        </dx:gridviewdatatextcolumn>
                                                        <dx:gridviewdatatextcolumn fieldname="Peso" showincustomizationform="True" visibleindex="2" width="50px" caption="Peso">
                                                            <propertiestextedit displayformatstring="{0:n2}" encodehtml="False">
                                                            </propertiestextedit>
                                                            <settings autofiltercondition="Equals" />
                                                            <cellstyle horizontalalign="Center">
                                                            </cellstyle>
                                                        </dx:gridviewdatatextcolumn>
                                                        <dx:gridviewdatatextcolumn fieldname="Nota" showincustomizationform="True" visibleindex="3" width="60px">
                                                            <propertiestextedit displayformatstring="{0:n2}" encodehtml="False">
                                                            </propertiestextedit>
                                                            <settings allowautofilter="False" />
                                                            <cellstyle font-bold="True" horizontalalign="Center">
                                                            </cellstyle>
                                                            <footercellstyle font-bold="True" horizontalalign="Center">
                                                            </footercellstyle>
                                                        </dx:gridviewdatatextcolumn>
                                                    </columns>
                                                </dx:gridviewbandcolumn>


                                                <dx:gridviewdatacheckcolumn fieldname="Dia1" showincustomizationform="True" visibleindex="3" caption="Seg" width="50px">
                                                    <propertiescheckedit>
                                                        <displayimagechecked height="16px" url="~/image/check_16.png" width="16px">
                                                        </displayimagechecked>
                                                        <displayimageunchecked height="16px" url="~/image/check_no.png" width="16px">
                                                        </displayimageunchecked>
                                                        <displayimageundefined height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimageundefined>
                                                        <displayimagegrayed height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimagegrayed>
                                                    </propertiescheckedit>
                                                    <settings allowautofilter="True" autofiltercondition="Equals" />
                                                </dx:gridviewdatacheckcolumn>
                                                <dx:gridviewdatacheckcolumn caption="Ter" fieldname="Dia2" showincustomizationform="True" tooltip="Terça-Feira" visibleindex="4" width="50px">
                                                    <propertiescheckedit>
                                                        <displayimagechecked height="16px" url="~/image/check_16.png" width="16px">
                                                        </displayimagechecked>
                                                        <displayimageunchecked height="16px" url="~/image/check_no.png" width="16px">
                                                        </displayimageunchecked>
                                                        <displayimageundefined height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimageundefined>
                                                        <displayimagegrayed height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimagegrayed>
                                                    </propertiescheckedit>
                                                    <settings allowautofilter="True" autofiltercondition="Equals" />
                                                </dx:gridviewdatacheckcolumn>
                                                <dx:gridviewdatacheckcolumn caption="Qua" fieldname="Dia3" showincustomizationform="True" tooltip="Quarta-Feira" visibleindex="5" width="50px">
                                                    <propertiescheckedit>
                                                        <displayimagechecked height="16px" url="~/image/check_16.png" width="16px">
                                                        </displayimagechecked>
                                                        <displayimageunchecked height="16px" url="~/image/check_no.png" width="16px">
                                                        </displayimageunchecked>
                                                        <displayimageundefined height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimageundefined>
                                                        <displayimagegrayed height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimagegrayed>
                                                    </propertiescheckedit>
                                                    <settings allowautofilter="True" autofiltercondition="Equals" />
                                                </dx:gridviewdatacheckcolumn>
                                                <dx:gridviewdatacheckcolumn caption="Qui" fieldname="Dia4" showincustomizationform="True" tooltip="Quinta-Feira" visibleindex="6" width="50px">
                                                    <propertiescheckedit>
                                                        <displayimagechecked height="16px" url="~/image/check_16.png" width="16px">
                                                        </displayimagechecked>
                                                        <displayimageunchecked height="16px" url="~/image/check_no.png" width="16px">
                                                        </displayimageunchecked>
                                                        <displayimageundefined height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimageundefined>
                                                        <displayimagegrayed height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimagegrayed>
                                                    </propertiescheckedit>
                                                    <settings allowautofilter="True" autofiltercondition="Equals" />
                                                </dx:gridviewdatacheckcolumn>
                                                <dx:gridviewdatacheckcolumn caption="Sex" fieldname="Dia5" showincustomizationform="True" tooltip="Sexta-Feira" visibleindex="7" width="50px">
                                                    <propertiescheckedit>
                                                        <displayimagechecked height="16px" url="~/image/check_16.png" width="16px">
                                                        </displayimagechecked>
                                                        <displayimageunchecked height="16px" url="~/image/check_no.png" width="16px">
                                                        </displayimageunchecked>
                                                        <displayimageundefined height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimageundefined>
                                                        <displayimagegrayed height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimagegrayed>
                                                    </propertiescheckedit>
                                                    <settings allowautofilter="True" autofiltercondition="Equals" />
                                                </dx:gridviewdatacheckcolumn>
                                                <dx:gridviewdatacheckcolumn caption="Sáb" fieldname="Dia6" showincustomizationform="True" tooltip="Sábado" visibleindex="8" width="50px">
                                                    <propertiescheckedit>
                                                        <displayimagechecked height="16px" url="~/image/check_16.png" width="16px">
                                                        </displayimagechecked>
                                                        <displayimageunchecked height="16px" url="~/image/check_no.png" width="16px">
                                                        </displayimageunchecked>
                                                        <displayimageundefined height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimageundefined>
                                                        <displayimagegrayed height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimagegrayed>
                                                    </propertiescheckedit>
                                                    <settings allowautofilter="True" autofiltercondition="Equals" />
                                                </dx:gridviewdatacheckcolumn>

                                                <dx:gridviewdatacheckcolumn fieldname="Dia7" showincustomizationform="True" visibleindex="9" caption="Seg" width="50px">
                                                    <propertiescheckedit>
                                                        <displayimagechecked height="16px" url="~/image/check_16.png" width="16px">
                                                        </displayimagechecked>
                                                        <displayimageunchecked height="16px" url="~/image/check_no.png" width="16px">
                                                        </displayimageunchecked>
                                                        <displayimageundefined height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimageundefined>
                                                        <displayimagegrayed height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimagegrayed>
                                                    </propertiescheckedit>
                                                    <settings allowautofilter="True" autofiltercondition="Equals" />
                                                </dx:gridviewdatacheckcolumn>
                                                <dx:gridviewdatacheckcolumn caption="Ter" fieldname="Dia8" showincustomizationform="True" tooltip="Terça-Feira" visibleindex="10" width="50px">
                                                    <propertiescheckedit>
                                                        <displayimagechecked height="16px" url="~/image/check_16.png" width="16px">
                                                        </displayimagechecked>
                                                        <displayimageunchecked height="16px" url="~/image/check_no.png" width="16px">
                                                        </displayimageunchecked>
                                                        <displayimageundefined height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimageundefined>
                                                        <displayimagegrayed height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimagegrayed>
                                                    </propertiescheckedit>
                                                    <settings allowautofilter="True" autofiltercondition="Equals" />
                                                </dx:gridviewdatacheckcolumn>
                                                <dx:gridviewdatacheckcolumn caption="Qua" fieldname="Dia9" showincustomizationform="True" tooltip="Quarta-Feira" visibleindex="11" width="50px">
                                                    <propertiescheckedit>
                                                        <displayimagechecked height="16px" url="~/image/check_16.png" width="16px">
                                                        </displayimagechecked>
                                                        <displayimageunchecked height="16px" url="~/image/check_no.png" width="16px">
                                                        </displayimageunchecked>
                                                        <displayimageundefined height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimageundefined>
                                                        <displayimagegrayed height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimagegrayed>
                                                    </propertiescheckedit>
                                                    <settings allowautofilter="True" autofiltercondition="Equals" />
                                                </dx:gridviewdatacheckcolumn>
                                                <dx:gridviewdatacheckcolumn caption="Qui" fieldname="Dia10" showincustomizationform="True" tooltip="Quinta-Feira" visibleindex="12" width="50px">
                                                    <propertiescheckedit>
                                                        <displayimagechecked height="16px" url="~/image/check_16.png" width="16px">
                                                        </displayimagechecked>
                                                        <displayimageunchecked height="16px" url="~/image/check_no.png" width="16px">
                                                        </displayimageunchecked>
                                                        <displayimageundefined height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimageundefined>
                                                        <displayimagegrayed height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimagegrayed>
                                                    </propertiescheckedit>
                                                    <settings allowautofilter="True" autofiltercondition="Equals" />
                                                </dx:gridviewdatacheckcolumn>
                                                <dx:gridviewdatacheckcolumn caption="Sex" fieldname="Dia11" showincustomizationform="True" tooltip="Sexta-Feira" visibleindex="13" width="50px">
                                                    <propertiescheckedit>
                                                        <displayimagechecked height="16px" url="~/image/check_16.png" width="16px">
                                                        </displayimagechecked>
                                                        <displayimageunchecked height="16px" url="~/image/check_no.png" width="16px">
                                                        </displayimageunchecked>
                                                        <displayimageundefined height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimageundefined>
                                                        <displayimagegrayed height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimagegrayed>
                                                    </propertiescheckedit>
                                                    <settings allowautofilter="True" autofiltercondition="Equals" />
                                                </dx:gridviewdatacheckcolumn>
                                                <dx:gridviewdatacheckcolumn caption="Sáb" fieldname="Dia12" showincustomizationform="True" tooltip="Sábado" visibleindex="14" width="50px">
                                                    <propertiescheckedit>
                                                        <displayimagechecked height="16px" url="~/image/check_16.png" width="16px">
                                                        </displayimagechecked>
                                                        <displayimageunchecked height="16px" url="~/image/check_no.png" width="16px">
                                                        </displayimageunchecked>
                                                        <displayimageundefined height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimageundefined>
                                                        <displayimagegrayed height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimagegrayed>
                                                    </propertiescheckedit>
                                                    <settings allowautofilter="True" autofiltercondition="Equals" />
                                                </dx:gridviewdatacheckcolumn>

                                                <dx:gridviewdatacheckcolumn fieldname="Dia13" showincustomizationform="True" visibleindex="15" caption="Seg" width="50px">
                                                    <propertiescheckedit>
                                                        <displayimagechecked height="16px" url="~/image/check_16.png" width="16px">
                                                        </displayimagechecked>
                                                        <displayimageunchecked height="16px" url="~/image/check_no.png" width="16px">
                                                        </displayimageunchecked>
                                                        <displayimageundefined height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimageundefined>
                                                        <displayimagegrayed height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimagegrayed>
                                                    </propertiescheckedit>
                                                    <settings allowautofilter="True" autofiltercondition="Equals" />
                                                </dx:gridviewdatacheckcolumn>
                                                <dx:gridviewdatacheckcolumn caption="Ter" fieldname="Dia14" showincustomizationform="True" tooltip="Terça-Feira" visibleindex="16" width="50px">
                                                    <propertiescheckedit>
                                                        <displayimagechecked height="16px" url="~/image/check_16.png" width="16px">
                                                        </displayimagechecked>
                                                        <displayimageunchecked height="16px" url="~/image/check_no.png" width="16px">
                                                        </displayimageunchecked>
                                                        <displayimageundefined height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimageundefined>
                                                        <displayimagegrayed height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimagegrayed>
                                                    </propertiescheckedit>
                                                    <settings allowautofilter="True" autofiltercondition="Equals" />
                                                </dx:gridviewdatacheckcolumn>
                                                <dx:gridviewdatacheckcolumn caption="Qua" fieldname="Dia15" showincustomizationform="True" tooltip="Quarta-Feira" visibleindex="17" width="50px">
                                                    <propertiescheckedit>
                                                        <displayimagechecked height="16px" url="~/image/check_16.png" width="16px">
                                                        </displayimagechecked>
                                                        <displayimageunchecked height="16px" url="~/image/check_no.png" width="16px">
                                                        </displayimageunchecked>
                                                        <displayimageundefined height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimageundefined>
                                                        <displayimagegrayed height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimagegrayed>
                                                    </propertiescheckedit>
                                                    <settings allowautofilter="True" autofiltercondition="Equals" />
                                                </dx:gridviewdatacheckcolumn>
                                                <dx:gridviewdatacheckcolumn caption="Qui" fieldname="Dia16" showincustomizationform="True" tooltip="Quinta-Feira" visibleindex="18" width="50px">
                                                    <propertiescheckedit>
                                                        <displayimagechecked height="16px" url="~/image/check_16.png" width="16px">
                                                        </displayimagechecked>
                                                        <displayimageunchecked height="16px" url="~/image/check_no.png" width="16px">
                                                        </displayimageunchecked>
                                                        <displayimageundefined height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimageundefined>
                                                        <displayimagegrayed height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimagegrayed>
                                                    </propertiescheckedit>
                                                    <settings allowautofilter="True" autofiltercondition="Equals" />
                                                </dx:gridviewdatacheckcolumn>
                                                <dx:gridviewdatacheckcolumn caption="Sex" fieldname="Dia17" showincustomizationform="True" tooltip="Sexta-Feira" visibleindex="19" width="50px">
                                                    <propertiescheckedit>
                                                        <displayimagechecked height="16px" url="~/image/check_16.png" width="16px">
                                                        </displayimagechecked>
                                                        <displayimageunchecked height="16px" url="~/image/check_no.png" width="16px">
                                                        </displayimageunchecked>
                                                        <displayimageundefined height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimageundefined>
                                                        <displayimagegrayed height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimagegrayed>
                                                    </propertiescheckedit>
                                                    <settings allowautofilter="True" autofiltercondition="Equals" />
                                                </dx:gridviewdatacheckcolumn>
                                                <dx:gridviewdatacheckcolumn caption="Sáb" fieldname="Dia18" showincustomizationform="True" tooltip="Sábado" visibleindex="20" width="50px">
                                                    <propertiescheckedit>
                                                        <displayimagechecked height="16px" url="~/image/check_16.png" width="16px">
                                                        </displayimagechecked>
                                                        <displayimageunchecked height="16px" url="~/image/check_no.png" width="16px">
                                                        </displayimageunchecked>
                                                        <displayimageundefined height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimageundefined>
                                                        <displayimagegrayed height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimagegrayed>
                                                    </propertiescheckedit>
                                                    <settings allowautofilter="True" autofiltercondition="Equals" />
                                                </dx:gridviewdatacheckcolumn>

                                                <dx:gridviewdatacheckcolumn fieldname="Dia19" showincustomizationform="True" visibleindex="21" caption="Seg" width="50px">
                                                    <propertiescheckedit>
                                                        <displayimagechecked height="16px" url="~/image/check_16.png" width="16px">
                                                        </displayimagechecked>
                                                        <displayimageunchecked height="16px" url="~/image/check_no.png" width="16px">
                                                        </displayimageunchecked>
                                                        <displayimageundefined height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimageundefined>
                                                        <displayimagegrayed height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimagegrayed>
                                                    </propertiescheckedit>
                                                    <settings allowautofilter="True" autofiltercondition="Equals" />
                                                </dx:gridviewdatacheckcolumn>
                                                <dx:gridviewdatacheckcolumn caption="Ter" fieldname="Dia20" showincustomizationform="True" tooltip="Terça-Feira" visibleindex="22" width="50px">
                                                    <propertiescheckedit>
                                                        <displayimagechecked height="16px" url="~/image/check_16.png" width="16px">
                                                        </displayimagechecked>
                                                        <displayimageunchecked height="16px" url="~/image/check_no.png" width="16px">
                                                        </displayimageunchecked>
                                                        <displayimageundefined height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimageundefined>
                                                        <displayimagegrayed height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimagegrayed>
                                                    </propertiescheckedit>
                                                    <settings allowautofilter="True" autofiltercondition="Equals" />
                                                </dx:gridviewdatacheckcolumn>
                                                <dx:gridviewdatacheckcolumn caption="Qua" fieldname="Dia21" showincustomizationform="True" tooltip="Quarta-Feira" visibleindex="23" width="50px">
                                                    <propertiescheckedit>
                                                        <displayimagechecked height="16px" url="~/image/check_16.png" width="16px">
                                                        </displayimagechecked>
                                                        <displayimageunchecked height="16px" url="~/image/check_no.png" width="16px">
                                                        </displayimageunchecked>
                                                        <displayimageundefined height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimageundefined>
                                                        <displayimagegrayed height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimagegrayed>
                                                    </propertiescheckedit>
                                                    <settings allowautofilter="True" autofiltercondition="Equals" />
                                                </dx:gridviewdatacheckcolumn>
                                                <dx:gridviewdatacheckcolumn caption="Qui" fieldname="Dia22" showincustomizationform="True" tooltip="Quinta-Feira" visibleindex="24" width="50px">
                                                    <propertiescheckedit>
                                                        <displayimagechecked height="16px" url="~/image/check_16.png" width="16px">
                                                        </displayimagechecked>
                                                        <displayimageunchecked height="16px" url="~/image/check_no.png" width="16px">
                                                        </displayimageunchecked>
                                                        <displayimageundefined height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimageundefined>
                                                        <displayimagegrayed height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimagegrayed>
                                                    </propertiescheckedit>
                                                    <settings allowautofilter="True" autofiltercondition="Equals" />
                                                </dx:gridviewdatacheckcolumn>
                                                <dx:gridviewdatacheckcolumn caption="Sex" fieldname="Dia23" showincustomizationform="True" tooltip="Sexta-Feira" visibleindex="25" width="50px">
                                                    <propertiescheckedit>
                                                        <displayimagechecked height="16px" url="~/image/check_16.png" width="16px">
                                                        </displayimagechecked>
                                                        <displayimageunchecked height="16px" url="~/image/check_no.png" width="16px">
                                                        </displayimageunchecked>
                                                        <displayimageundefined height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimageundefined>
                                                        <displayimagegrayed height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimagegrayed>
                                                    </propertiescheckedit>
                                                    <settings allowautofilter="True" autofiltercondition="Equals" />
                                                </dx:gridviewdatacheckcolumn>
                                                <dx:gridviewdatacheckcolumn caption="Sáb" fieldname="Dia24" showincustomizationform="True" tooltip="Sábado" visibleindex="26" width="50px">
                                                    <propertiescheckedit>
                                                        <displayimagechecked height="16px" url="~/image/check_16.png" width="16px">
                                                        </displayimagechecked>
                                                        <displayimageunchecked height="16px" url="~/image/check_no.png" width="16px">
                                                        </displayimageunchecked>
                                                        <displayimageundefined height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimageundefined>
                                                        <displayimagegrayed height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimagegrayed>
                                                    </propertiescheckedit>
                                                    <settings allowautofilter="True" autofiltercondition="Equals" />
                                                </dx:gridviewdatacheckcolumn>

                                                <dx:gridviewdatacheckcolumn caption="Sáb" fieldname="Dia25" showincustomizationform="True" tooltip="Sábado" visibleindex="27" width="50px">
                                                    <propertiescheckedit>
                                                        <displayimagechecked height="16px" url="~/image/check_16.png" width="16px">
                                                        </displayimagechecked>
                                                        <displayimageunchecked height="16px" url="~/image/check_no.png" width="16px">
                                                        </displayimageunchecked>
                                                        <displayimageundefined height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimageundefined>
                                                        <displayimagegrayed height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimagegrayed>
                                                    </propertiescheckedit>
                                                    <settings allowautofilter="True" autofiltercondition="Equals" />
                                                </dx:gridviewdatacheckcolumn>
                                                <dx:gridviewdatacheckcolumn caption="Sáb" fieldname="Dia26" showincustomizationform="True" tooltip="Sábado" visibleindex="28" width="50px">
                                                    <propertiescheckedit>
                                                        <displayimagechecked height="16px" url="~/image/check_16.png" width="16px">
                                                        </displayimagechecked>
                                                        <displayimageunchecked height="16px" url="~/image/check_no.png" width="16px">
                                                        </displayimageunchecked>
                                                        <displayimageundefined height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimageundefined>
                                                        <displayimagegrayed height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimagegrayed>
                                                    </propertiescheckedit>
                                                    <settings allowautofilter="True" autofiltercondition="Equals" />
                                                </dx:gridviewdatacheckcolumn>
                                                <dx:gridviewdatacheckcolumn caption="Sáb" fieldname="Dia27" showincustomizationform="True" tooltip="Sábado" visibleindex="29" width="50px">
                                                    <propertiescheckedit>
                                                        <displayimagechecked height="16px" url="~/image/check_16.png" width="16px">
                                                        </displayimagechecked>
                                                        <displayimageunchecked height="16px" url="~/image/check_no.png" width="16px">
                                                        </displayimageunchecked>
                                                        <displayimageundefined height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimageundefined>
                                                        <displayimagegrayed height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimagegrayed>
                                                    </propertiescheckedit>
                                                    <settings allowautofilter="True" autofiltercondition="Equals" />
                                                </dx:gridviewdatacheckcolumn>
                                                <dx:gridviewdatacheckcolumn caption="Sáb" fieldname="Dia28" showincustomizationform="True" tooltip="Sábado" visibleindex="30" width="50px">
                                                    <propertiescheckedit>
                                                        <displayimagechecked height="16px" url="~/image/check_16.png" width="16px">
                                                        </displayimagechecked>
                                                        <displayimageunchecked height="16px" url="~/image/check_no.png" width="16px">
                                                        </displayimageunchecked>
                                                        <displayimageundefined height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimageundefined>
                                                        <displayimagegrayed height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimagegrayed>
                                                    </propertiescheckedit>
                                                    <settings allowautofilter="True" autofiltercondition="Equals" />
                                                </dx:gridviewdatacheckcolumn>

                                                <dx:gridviewdatacheckcolumn caption="Sáb" fieldname="Dia29" showincustomizationform="True" tooltip="Sábado" visibleindex="31" width="50px">
                                                    <propertiescheckedit>
                                                        <displayimagechecked height="16px" url="~/image/check_16.png" width="16px">
                                                        </displayimagechecked>
                                                        <displayimageunchecked height="16px" url="~/image/check_no.png" width="16px">
                                                        </displayimageunchecked>
                                                        <displayimageundefined height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimageundefined>
                                                        <displayimagegrayed height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimagegrayed>
                                                    </propertiescheckedit>
                                                    <settings allowautofilter="True" autofiltercondition="Equals" />
                                                </dx:gridviewdatacheckcolumn>

                                                <dx:gridviewdatacheckcolumn caption="Sáb" fieldname="Dia30" showincustomizationform="True" tooltip="Sábado" visibleindex="32" width="50px">
                                                    <propertiescheckedit>
                                                        <displayimagechecked height="16px" url="~/image/check_16.png" width="16px">
                                                        </displayimagechecked>
                                                        <displayimageunchecked height="16px" url="~/image/check_no.png" width="16px">
                                                        </displayimageunchecked>
                                                        <displayimageundefined height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimageundefined>
                                                        <displayimagegrayed height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimagegrayed>
                                                    </propertiescheckedit>
                                                    <settings allowautofilter="True" autofiltercondition="Equals" />
                                                </dx:gridviewdatacheckcolumn>

                                                <dx:gridviewdatacheckcolumn caption="Sáb" fieldname="Dia31" showincustomizationform="True" tooltip="Sábado" visibleindex="32" width="50px">
                                                    <propertiescheckedit>
                                                        <displayimagechecked height="16px" url="~/image/check_16.png" width="16px">
                                                        </displayimagechecked>
                                                        <displayimageunchecked height="16px" url="~/image/check_no.png" width="16px">
                                                        </displayimageunchecked>
                                                        <displayimageundefined height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimageundefined>
                                                        <displayimagegrayed height="16px" url="~/image/check_isnul.png" width="16px">
                                                        </displayimagegrayed>
                                                    </propertiescheckedit>
                                                    <settings allowautofilter="True" autofiltercondition="Equals" />
                                                </dx:gridviewdatacheckcolumn>



                                                <dx:gridviewdatatextcolumn fieldname="idGrupo" showincustomizationform="True" visible="False" visibleindex="32">
                                                </dx:gridviewdatatextcolumn>



                                            </columns>
                                            <settingsbehavior allowfocusedrow="True" columnresizemode="Control" />
                                            <settingspager mode="ShowAllRecords">
                                            </settingspager>
                                            <settings verticalscrollableheight="500" verticalscrollbarmode="Auto" horizontalscrollbarmode="Auto" showfilterrow="True" showgroupfooter="VisibleAlways" showgrouppanel="True" showfooter="True" />
                                            <settingstext grouppanel="Arraste o cabeçalho de uma coluna abaixo aqui dentro para agrupar" />
                                            <styles>
                                                <header horizontalalign="Center">
                                                </header>
                                                <alternatingrow backcolor="#F0F0F0">
                                                </alternatingrow>
                                                <focusedrow backcolor="Yellow" forecolor="Blue">
                                                </focusedrow>
                                                <groupfooter font-bold="True">
                                                </groupfooter>
                                            </styles>
                                        </dx:aspxgridview>

                                        <asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.uspMapaSemanalLoja" SelectCommandType="StoredProcedure">
                                            <selectparameters>
                                                <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" DefaultValue="2020" />
                                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" DefaultValue="10" />
                                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" DefaultValue="26" />
                                            </selectparameters>
                                        </asp:SqlDataSource>


                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.span -->

                    </div>


                    <div id="div_Pontuacao_Mensal">
                        <br />

                        <dx:aspxgridview id="grid_Notas" runat="server" autogeneratecolumns="False" datasourceid="dsGrid_Nota" enabletheming="True" theme="SoftOrange" keyfieldname="idFilial" width="1000px">

                            <toolbars>
                                <dx:gridviewtoolbar enableadaptivity="true">
                                    <items>
                                        <dx:gridviewtoolbaritem command="ExportToXls" text="Exportar para Excel - XLS" tooltip="Versão do Excel 2007 para baixo" />
                                        <dx:gridviewtoolbaritem command="ExportToXlsx" text="Exportar para Excel - XLSX" tooltip="Versão do Excel 2010 para cima" />
                                        <dx:gridviewtoolbaritem command="ExportToCsv" text="Exportar para CSV" tooltip="Exporta arquivo sem formatação" />
                                    </items>
                                </dx:gridviewtoolbar>
                            </toolbars>

                            <columns>
                                <dx:gridviewdatatextcolumn caption="Filial" fieldname="Descricao" visibleindex="0" fixedstyle="Left" width="200px">
                                    <headerstyle backcolor="#999999" />
                                </dx:gridviewdatatextcolumn>
                                <dx:gridviewdatatextcolumn caption="Jan" fieldname="mes1" visibleindex="1" width="75px">
                                    <propertiestextedit displayformatstring="{0:n2}" encodehtml="False">
                                    </propertiestextedit>
                                </dx:gridviewdatatextcolumn>
                                <dx:gridviewdatatextcolumn caption="Fev " fieldname="mes2" visibleindex="2" width="75px">
                                    <propertiestextedit displayformatstring="{0:n2}" encodehtml="False">
                                    </propertiestextedit>
                                </dx:gridviewdatatextcolumn>
                                <dx:gridviewdatatextcolumn caption="Mar" fieldname="mes3" visibleindex="3" width="75px">
                                    <propertiestextedit displayformatstring="{0:n2}" encodehtml="False">
                                    </propertiestextedit>
                                </dx:gridviewdatatextcolumn>
                                <dx:gridviewdatatextcolumn caption="Abr" fieldname="mes4" visibleindex="4" width="75px">
                                    <propertiestextedit displayformatstring="{0:n2}" encodehtml="False">
                                    </propertiestextedit>
                                </dx:gridviewdatatextcolumn>
                                <dx:gridviewdatatextcolumn caption="1º Quad" fieldname="mes1Q" visibleindex="5" width="85px">
                                    <propertiestextedit displayformatstring="{0:n2}" encodehtml="False">
                                    </propertiestextedit>
                                    <headerstyle backcolor="#666666" />
                                    <cellstyle font-bold="True">
                                    </cellstyle>
                                </dx:gridviewdatatextcolumn>
                                <dx:gridviewdatatextcolumn caption="Mai" fieldname="mes5" visibleindex="6" width="75px">
                                    <propertiestextedit displayformatstring="{0:n2}" encodehtml="False">
                                    </propertiestextedit>
                                </dx:gridviewdatatextcolumn>
                                <dx:gridviewdatatextcolumn caption="Jun" fieldname="mes6" visibleindex="7" width="75px">
                                    <propertiestextedit displayformatstring="{0:n2}" encodehtml="False">
                                    </propertiestextedit>
                                </dx:gridviewdatatextcolumn>
                                <dx:gridviewdatatextcolumn caption="Jul" fieldname="mes7" visibleindex="8" width="75px">
                                    <propertiestextedit displayformatstring="{0:n2}" encodehtml="False">
                                    </propertiestextedit>
                                </dx:gridviewdatatextcolumn>
                                <dx:gridviewdatatextcolumn caption="Ago" fieldname="mes8" visibleindex="9" width="75px">
                                    <propertiestextedit displayformatstring="{0:n2}" encodehtml="False">
                                    </propertiestextedit>
                                </dx:gridviewdatatextcolumn>
                                <dx:gridviewdatatextcolumn caption="2º Quad" fieldname="mes2Q" visibleindex="10" width="90px">
                                    <propertiestextedit displayformatstring="{0:n2}" encodehtml="False">
                                    </propertiestextedit>
                                    <headerstyle backcolor="#666666" />
                                    <cellstyle font-bold="True">
                                    </cellstyle>
                                </dx:gridviewdatatextcolumn>
                                <dx:gridviewdatatextcolumn caption="Set" fieldname="mes9" visibleindex="11" width="75px">
                                    <propertiestextedit displayformatstring="{0:n2}" encodehtml="False">
                                    </propertiestextedit>
                                </dx:gridviewdatatextcolumn>
                                <dx:gridviewdatatextcolumn caption="Out" fieldname="mes10" visibleindex="12" width="75px">
                                    <propertiestextedit displayformatstring="{0:n2}" encodehtml="False">
                                    </propertiestextedit>
                                </dx:gridviewdatatextcolumn>
                                <dx:gridviewdatatextcolumn caption="Nov" fieldname="mes11" visibleindex="13" width="75px">
                                    <propertiestextedit displayformatstring="{0:n2}" encodehtml="False">
                                    </propertiestextedit>
                                </dx:gridviewdatatextcolumn>
                                <dx:gridviewdatatextcolumn caption="Dez" fieldname="mes12" visibleindex="14" width="75px">
                                    <propertiestextedit displayformatstring="{0:n2}" encodehtml="False">
                                    </propertiestextedit>
                                </dx:gridviewdatatextcolumn>
                                <dx:gridviewdatatextcolumn caption="3º Quad" fieldname="mes3Q" visibleindex="15" width="90px">
                                    <propertiestextedit displayformatstring="{0:n2}" encodehtml="False">
                                    </propertiestextedit>
                                    <headerstyle backcolor="#666666" />
                                    <cellstyle font-bold="True">
                                    </cellstyle>
                                </dx:gridviewdatatextcolumn>
                            </columns>
                            <settingsexport enableclientsideexportapi="true" excelexportmode="WYSIWYG"></settingsexport>
                            <settingsbehavior allowfocusedrow="True" />
                            <settingspager mode="ShowAllRecords">
                            </settingspager>
                            <settings horizontalscrollbarmode="Visible" verticalscrollableheight="400" verticalscrollbarmode="Visible" />
                            <styles>
                                <header horizontalalign="Center">
                                </header>
                                <alternatingrow backcolor="#E2E2E2">
                                </alternatingrow>
                            </styles>

                        </dx:aspxgridview>



                        <asp:SqlDataSource ID="dsGrid_Nota" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="uspBuscarNotaLoja_Mes_a_Mes_TodasLojas" SelectCommandType="StoredProcedure">
                            <selectparameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            </selectparameters>
                        </asp:SqlDataSource>


                    </div>




                </dx:panelcontent>
            </panelcollection>
        </dx:aspxcallbackpanel>



        <%------------------------------------------------------------------------------------------------------------------------------------------------------------%>
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

