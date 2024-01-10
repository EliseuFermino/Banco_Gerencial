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
            <uc1:wucListaLojasComCorporacao runat="server" ID="cboFilial" />
        </div>

        <div id="divAno" class="BGC_myBorder">
            <uc1:wucAno runat="server" ID="cboAno" />
        </div>

        <div id="divMes">
            <uc1:wuciListaMes runat="server" ID="cboMes" />
        </div>

        <div id="divGrupoSubgrupo" class="BGC_myBorder">
            <dx:ASPxCheckBox ID="chkGrupoSub" runat="server" Theme="DevEx" Text="por Grupo" ForeColor="Blue" CheckState="Unchecked">
                <ClientSideEvents CheckedChanged="function(s, e) {	cbPanel.PerformCallback();    cbPanelNaoConforme.PerformCallback();}" />
            </dx:ASPxCheckBox>
        </div>

        <div id="divBotaoAtualizar" class="BGC_myBorder">
            <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="False" Theme="MetropolisBlue">
                <ClientSideEvents Click="function(s, e) {cbPanel.PerformCallback(); cbPanelNaoConforme.PerformCallback();}" />
            </dx:ASPxButton>
        </div>

        <div id="divExcel" class="BGC_myBorder">
            <uc1:wucBotaoExcel runat="server" ID="btnExcel" CallGridViewID="grid" GuiaNome="Pontuação Check-List" />
        </div>

        <dx:ASPxCallbackPanel ID="cbPanel" runat="server" Width="100%" ClientInstanceName="cbPanel" Theme="Metropolis" SettingsLoadingPanel-Text="Aguarde&amp;hellip;">
            <SettingsLoadingPanel Text="Aguarde&amp;hellip;"></SettingsLoadingPanel>
            <PanelCollection>
                <dx:PanelContent ID="PanelContent1" runat="server" supportsdisabledattributes="both">
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

                                            <dxchartsui:WebChartControl ID="graph_Pontuacao_Mensal" runat="server" BackColor="Transparent" DataSourceID="" Height="150px" Width="1000px">

                                                <BorderOptions Visible="False" />
                                                <DiagramSerializable>
                                                    <cc1:XYDiagram>
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
                                                    </cc1:XYDiagram>
                                                </DiagramSerializable>
                                                <FillStyle>
                                                    <optionsserializable>
                                                        <cc1:solidfilloptions></cc1:solidfilloptions>
                                                    </optionsserializable>
                                                </FillStyle>

                                                <Legend Visibility="False"></Legend>
                                                <SeriesSerializable>
                                                    <cc1:Series ArgumentDataMember="descMesRed" LabelsVisibility="True" Name="Series 1" ValueDataMembersSerializable="Nota">
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
                                                    </cc1:Series>
                                                </SeriesSerializable>

                                                <SeriesTemplate>
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
                                                </SeriesTemplate>

                                                <CrosshairOptions>
                                                    <commonlabelpositionserializable>
                                                        <cc1:crosshairmouseposition></cc1:crosshairmouseposition>
                                                    </commonlabelpositionserializable>
                                                </CrosshairOptions>

                                                <ToolTipOptions>
                                                    <tooltippositionserializable>
                                                        <cc1:tooltipmouseposition></cc1:tooltipmouseposition>
                                                    </tooltippositionserializable>
                                                </ToolTipOptions>

                                            </dxchartsui:WebChartControl>
                                            <asp:SqlDataSource ID="dsPontuacao_Dados_Mensal" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="uspBuscarNotaLoja_Mes_a_Mes" SelectCommandType="StoredProcedure">
                                                <SelectParameters>
                                                    <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="int16" />
                                                    <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                                                </SelectParameters>
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

                                        <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="dsDados" Width="100%" KeyFieldName="descPergunta">
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
                                                <dx:GridViewCommandColumn ShowInCustomizationForm="True" Visible="False" VisibleIndex="0" ShowClearFilterButton="True" />
                                                <dx:GridViewDataTextColumn FieldName="listaGrupo" ShowInCustomizationForm="True" VisibleIndex="33" Width="115px" Caption="Grupo" Visible="True">
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
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <Settings AllowAutoFilter="False" />
                                                            <CellStyle Font-Bold="True" ForeColor="Blue" HorizontalAlign="Center">
                                                            </CellStyle>
                                                            <FooterCellStyle Font-Bold="True" ForeColor="Blue" HorizontalAlign="Center">
                                                            </FooterCellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="Validos" ShowInCustomizationForm="True" VisibleIndex="1" Width="60px">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <Settings AllowAutoFilter="False" />
                                                            <CellStyle Font-Bold="True" ForeColor="#009900" HorizontalAlign="Center">
                                                            </CellStyle>
                                                            <FooterCellStyle Font-Bold="True" ForeColor="#009900" HorizontalAlign="Center">
                                                            </FooterCellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="Peso" ShowInCustomizationForm="True" VisibleIndex="2" Width="50px" Caption="Peso">
                                                            <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                                            </PropertiesTextEdit>
                                                            <Settings AutoFilterCondition="Equals" />
                                                            <CellStyle HorizontalAlign="Center">
                                                            </CellStyle>
                                                        </dx:GridViewDataTextColumn>
                                                        <dx:GridViewDataTextColumn FieldName="Nota" ShowInCustomizationForm="True" VisibleIndex="3" Width="60px">
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

                                        <asp:SqlDataSource ID="dsDados" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="Pontuacao.uspMapaSemanalLoja" SelectCommandType="StoredProcedure">
                                            <SelectParameters>
                                                <asp:SessionParameter Name="Ano" SessionField="sANO" DbType="Int16" DefaultValue="2020" />
                                                <asp:SessionParameter Name="Mes" SessionField="sMES" Type="Byte" DefaultValue="10" />
                                                <asp:SessionParameter Name="idFilial" SessionField="sFILIAL" Type="Int16" DefaultValue="26" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>


                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /.span -->

                    </div>


                    <div id="div_Pontuacao_Mensal">
                        <br />

                        <dx:ASPxGridView ID="grid_Notas" runat="server" AutoGenerateColumns="False" DataSourceID="dsGrid_Nota" EnableTheming="True" Theme="SoftOrange" KeyFieldName="idFilial" Width="100%">

                            <Toolbars>
                                <dx:GridViewToolbar EnableAdaptivity="true">
                                    <Items>
                                        <dx:GridViewToolbarItem Command="ExportToXls" Text="Exportar para Excel - XLS" ToolTip="Versão do Excel 2007 para baixo" />
                                        <dx:GridViewToolbarItem Command="ExportToXlsx" Text="Exportar para Excel - XLSX" ToolTip="Versão do Excel 2010 para cima" />
                                        <dx:GridViewToolbarItem Command="ExportToCsv" Text="Exportar para CSV" ToolTip="Exporta arquivo sem formatação" />
                                    </Items>
                                </dx:GridViewToolbar>
                            </Toolbars>

                            <Columns>
                                <dx:GridViewDataTextColumn Caption="Filial" FieldName="Descricao" VisibleIndex="0" FixedStyle="Left" Width="200px">
                                    <HeaderStyle BackColor="#999999" />
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Jan" FieldName="mes1" VisibleIndex="1" Width="75px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Fev " FieldName="mes2" VisibleIndex="2" Width="75px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Mar" FieldName="mes3" VisibleIndex="3" Width="75px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="1º Tri" FieldName="mes1T" VisibleIndex="4" Width="85px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle BackColor="#666666" />
                                    <CellStyle Font-Bold="True">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>


                                <dx:GridViewDataTextColumn Caption="Abr" FieldName="mes4" VisibleIndex="5" Width="75px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Mai" FieldName="mes5" VisibleIndex="6" Width="75px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Jun" FieldName="mes6" VisibleIndex="7" Width="75px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="2º Tri" FieldName="mes2T" VisibleIndex="8" Width="90px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle BackColor="#666666" />
                                    <CellStyle Font-Bold="True">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>

                                <dx:GridViewDataTextColumn Caption="Jul" FieldName="mes7" VisibleIndex="9" Width="75px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Ago" FieldName="mes8" VisibleIndex="10" Width="75px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Set" FieldName="mes9" VisibleIndex="11" Width="75px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="3º Tri" FieldName="mes3T" VisibleIndex="12" Width="90px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle BackColor="#666666" />
                                    <CellStyle Font-Bold="True">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>

                                <dx:GridViewDataTextColumn Caption="Out" FieldName="mes10" VisibleIndex="13" Width="75px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Nov" FieldName="mes11" VisibleIndex="14" Width="75px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="Dez" FieldName="mes12" VisibleIndex="15" Width="75px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                </dx:GridViewDataTextColumn>
                                <dx:GridViewDataTextColumn Caption="4º Tri" FieldName="mes4T" VisibleIndex="16" Width="90px">
                                    <PropertiesTextEdit DisplayFormatString="{0:n2}" EncodeHtml="False">
                                    </PropertiesTextEdit>
                                    <HeaderStyle BackColor="#666666" />
                                    <CellStyle Font-Bold="True">
                                    </CellStyle>
                                </dx:GridViewDataTextColumn>

                            </Columns>
                            <SettingsExport EnableClientSideExportAPI="true" ExcelExportMode="WYSIWYG"></SettingsExport>
                            <SettingsBehavior AllowFocusedRow="True" />
                            <SettingsPager Mode="ShowAllRecords">
                            </SettingsPager>
                            <Settings HorizontalScrollBarMode="Visible" VerticalScrollableHeight="400" VerticalScrollBarMode="Visible" />
                            <Styles>
                                <Header HorizontalAlign="Center">
                                </Header>
                                <AlternatingRow BackColor="#E2E2E2">
                                </AlternatingRow>
                            </Styles>

                        </dx:ASPxGridView>



                        <asp:SqlDataSource ID="dsGrid_Nota" runat="server" ConnectionString="<%$ ConnectionStrings:gerCheckListConnectionString %>" SelectCommand="uspBuscarNotaLoja_Mes_a_Mes_TodasLojas" SelectCommandType="StoredProcedure">
                            <SelectParameters>
                                <asp:SessionParameter Name="Ano" SessionField="sANO" Type="Int16" />
                            </SelectParameters>
                        </asp:SqlDataSource>


                    </div>




                </dx:PanelContent>
            </PanelCollection>
        </dx:ASPxCallbackPanel>



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

