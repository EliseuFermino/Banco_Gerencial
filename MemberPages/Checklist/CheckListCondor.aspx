<%@ Page Title="Checklist Condor" Language="VB" MasterPageFile="~/MemberPages/Site.master" AutoEventWireup="false" CodeFile="CheckListCondor.aspx.vb" Inherits="MemberPages_CheckListCondor" %>

<%@ Register Assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Src="../../Controles/wucAguarde.ascx" TagName="wucAguarde" TagPrefix="uc3" %>
<%@ Register Src="~/Controles/wuciListaDia.ascx" TagPrefix="uc2" TagName="wuciListaDia" %>
<%@ Register Src="~/Controles/wuciListaLojasComApoio.ascx" TagPrefix="uc2" TagName="wuciListaLojasComApoio" %>
<%@ Register Src="../../Controles/wucAguardeRoda.ascx" TagName="wucAguardeRoda" TagPrefix="uc1" %>
<%@ Register Src="../../Controles/wucListaLojasComCorporacao.ascx" TagName="wucListaLojasComCorporacao" TagPrefix="uc4" %>


<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">

    <style type="text/css">
        .fileEscondido {
            overflow: hidden;
            position: relative;
        }

            .fileEscondido input[type=file] {
                opacity: 0;
                font-size: 45px;
                position: absolute;
                right: 0px;
                top: 0px;
                opacity: 0;
                filter: alpha(opacity=0);
                -ms-filter: "alpha(opacity=0)";
                -khtml-opacity: 0;
                -moz-opacity: 0;
                cursor: pointer;
            }

        .botaoBlock {
            width: 32px;
            height: 32px;
            position: absolute;
            top: 0px;
            line-height: 42px;
            background: url(http://blog.paulomontoya.com.br/wp-content/uploads/2012/01/1326736657_Add-button.png) top no-repeat;
            padding: 0;
            border: 0;
            outline: none;
        }
    </style>

    <link href="../../css/bootstrap.min.css" rel="stylesheet" />
    <script src="../../Scripts/jquery-2.2.3.min.js"></script>
    <script src="../../js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../Styles/style.css" />

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <p>
    </p>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" RenderMode="Inline">
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSalvarFoto1_1" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto1_2" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto1_3" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto1_4" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto1_5" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto1_6" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto1_7" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto1_8" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto1_9" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto1_10" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto1_11" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto1_12" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto1_13" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto1_14" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto1_15" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto1_16" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto1_17" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto1_18" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto1_19" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto1_20" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto1_21" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto1_22" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto1_23" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto1_24" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto1_25" />

            <asp:PostBackTrigger ControlID="btnSalvarFoto2_1" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_2" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_3" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_4" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_5" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_6" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_7" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_8" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_9" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_10" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_11" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_12" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_13" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_41" />

            <asp:PostBackTrigger ControlID="btnSalvarFoto2_14" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_15" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_16" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_17" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_18" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_19" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_20" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_21" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_22" />

            <asp:PostBackTrigger ControlID="btnSalvarFoto2_23" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_24" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_25" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_26" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_27" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_28" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_29" />

            <asp:PostBackTrigger ControlID="btnSalvarFoto2_30" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_31" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_32" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_33" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_34" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_35" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_36" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_37" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_38" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_39" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_40" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_41" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto2_42" />

            <asp:PostBackTrigger ControlID="btnSalvarFoto3_1" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_2" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_3" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_4" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_5" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_6" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_7" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_8" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_9" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_10" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_11" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_12" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_13" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_14" />

            <asp:PostBackTrigger ControlID="btnSalvarFoto3_15" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_16" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_17" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_18" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_19" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_20" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_21" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_22" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_23" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_24" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_25" />

            <asp:PostBackTrigger ControlID="btnSalvarFoto3_26" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_27" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_28" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_29" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_30" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_31" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_32" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_33" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_34" />

            <asp:PostBackTrigger ControlID="btnSalvarFoto3_35" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_36" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_37" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_38" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_39" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_40" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_41" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_42" />

            <asp:PostBackTrigger ControlID="btnSalvarFoto3_43" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_44" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_45" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_46" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_47" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_48" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_49" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_50" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_51" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_52" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_53" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto3_54" />

            <asp:PostBackTrigger ControlID="btnSalvarFoto4_1" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto4_2" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto4_3" />

            <asp:PostBackTrigger ControlID="btnSalvarFoto4_4" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto4_5" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto4_6" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto4_7" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto4_8" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto4_9" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto4_10" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto4_21" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto4_22" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto4_23" />

            <asp:PostBackTrigger ControlID="btnSalvarFoto4_11" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto4_12" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto4_13" />

            <asp:PostBackTrigger ControlID="btnSalvarFoto4_14" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto4_15" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto4_16" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto4_17" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto4_18" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto4_19" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto4_20" />

            <asp:PostBackTrigger ControlID="btnSalvarFoto5_1" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto5_2" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto5_3" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto5_4" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto5_5" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto5_7" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto5_8" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto5_9" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto5_10" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto5_11" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto5_12" />

            <asp:PostBackTrigger ControlID="btnSalvarFoto6_1" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto6_2" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto6_3" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto6_4" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto6_5" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto6_6" />

            <asp:PostBackTrigger ControlID="btnSalvarFoto7_1" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_2" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_3" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_4" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_5" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_6" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_7" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_8" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_9" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_10" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_11" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_12" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_13" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_14" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_15" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_16" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_17" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto7_18" />

            <asp:PostBackTrigger ControlID="btnSalvarFoto8_1" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto8_2" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto8_3" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto8_4" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto8_5" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto8_6" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto8_7" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto8_8" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto8_9" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto8_10" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto8_11" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto8_12" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto8_13" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto8_14" />


            <asp:PostBackTrigger ControlID="btnSalvarFoto9_1" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto9_2" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto9_3" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto9_4" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto9_5" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto9_6" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto9_7" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto9_8" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto9_9" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto9_10" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto9_11" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto9_12" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto9_13" />


            <asp:PostBackTrigger ControlID="btnSalvarFoto10_1" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto10_2" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto10_3" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto10_4" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto10_5" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto10_6" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto10_7" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto10_8" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto10_9" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto10_10" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto10_11" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto10_12" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto10_13" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto10_14" />

            <asp:PostBackTrigger ControlID="btnSalvarFoto11_1" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto11_2" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto11_3" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto11_4" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto11_5" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto11_6" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto11_7" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto11_8" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto11_9" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto11_10" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto11_11" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto11_12" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto11_13" />

            <asp:PostBackTrigger ControlID="btnSalvarFoto12_1" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto12_2" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto12_3" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto12_4" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto12_5" />

            <asp:PostBackTrigger ControlID="btnSalvarFoto13_1" />

            <asp:PostBackTrigger ControlID="btnSalvarFoto14_1" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto14_2" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto14_3" />

            <asp:PostBackTrigger ControlID="btnSalvarFoto15_1" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto15_2" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto15_3" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto15_4" />
            <asp:PostBackTrigger ControlID="btnSalvarFoto15_5" />


            <asp:PostBackTrigger ControlID="btnPDF" />


        </Triggers>

        <ContentTemplate>

            <div class="container col-12 justify-content-center" style="padding: 30px 0 30px 0">
                <div class="row col-md-12 justify-content-center text-center">
                    <div class="col-auto">
                        <%--<uc2:wuciListaDia runat="server" ID="cboDia" />--%>
                        <div class="input-group">
                                <span class="input-group-text">Selecione um dia:</span>
                            <input type="date" class="form-control xs" autopostback="false" runat="server" id="txtData" />
                        </div>

                    </div>
                    <div class="col-auto">
                        <uc4:wucListaLojasComCorporacao ID="cboFilial" runat="server" />
                    </div>
                    <div class="col-auto">
                        <dx:ASPxButton ID="btnAtualizar" runat="server" Text="Atualizar" AutoPostBack="True" CssClass="btn-sm">
                            <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Buscando informações...');}" />
                        </dx:ASPxButton>
                    </div>
                    <div class="col-auto">
                        <dx:ASPxButton ID="btnPDF" runat="server" Text="Relatório" CssClass="btn-sm"></dx:ASPxButton>
                    </div>
                    <div class="col-auto">
                        <dx:ASPxCallback ID="ASPxCallback1" runat="server" ClientInstanceName="Callback">
                            <ClientSideEvents CallbackComplete="function(s, e) { LoadingPanel.Hide(); }" />
                        </dx:ASPxCallback>
                    </div>
                </div>
                <div class="row col-md-12 justify-content-center text-center">
                    <asp:Label ID="lblError" runat="server" Text="Label" Visible="false"></asp:Label>
                    <dx:ASPxLoadingPanel ID="ASPxLoadingPanel1" runat="server" ClientInstanceName="LoadingPanel"
                        Modal="True" Text="Salvando. Aguarde...">
                    </dx:ASPxLoadingPanel>

                    <asp:Label ID="lblStatus" runat="server" Text="" ForeColor="Red" Font-Bold="true"></asp:Label>
                </div>
                <br />

                <div class="row col-md-12 justify-content-center text-center">
                    <div class="col-auto" style="width: 890px">

                        <asp:Panel ID="panTitle1" runat="server" CssClass="pnl_Azul">
                            <div style="float: left;">1 - Recebimento - Conferência - Grupo 1 - (25 perguntas, 1 à 25) </div>
                            <div style="float: right;">
                                <asp:Label ID="lblTitle1" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div style="clear: both"></div>
                        </asp:Panel>
                        <asp:Panel ID="panDados1" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>
                                            <th align="center" scope="col" width="25px">PPO</th>
                                        </tr>
                                    </thead>

                                    <tbody>

                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Recebimento - Conferência </b></h2>
                                                </td>
                                            </tr>
                                        </thead>
                                        <%--TITULO Recebimento - Conferência --%>

                                        <tr>
                                            <td align="center">1.1</td>
                                            <td>É feita a conferência, pelo Fiscal de Loja, do local de entrega, Razão Social e outros meios que identifiquem a loja a receber a mercadoria?
                                     <asp:TextBox
                                         ID="txt1_1" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_1_Sim" runat="server" GroupName="grupo1_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_1_Nao" runat="server" GroupName="grupo1_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_1_NA" runat="server" GroupName="grupo1_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.1.01--%>

                                        <tr>
                                            <td align="center">1.2</td>
                                            <td>A conferência dos produtos vindos diretamente dos fornecedores ocorre no momento em que os mesmos são descarregados na doca?<asp:TextBox
                                                ID="txt1_2" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_2_Sim" runat="server" GroupName="grupo1_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_2_Nao" runat="server" GroupName="grupo1_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_2_NA" runat="server" GroupName="grupo1_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.1.02--%>

                                        <tr>
                                            <td align="center">1.3</td>
                                            <td>Os produtos recebidos são conferidos na área de conferência, sem a interferência do entregador/fornecedor?<asp:TextBox
                                                ID="txt1_3" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_3_Sim" runat="server" GroupName="grupo1_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_3_Nao" runat="server" GroupName="grupo1_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_3_NA" runat="server" GroupName="grupo1_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.1.03--%>

                                        <tr>
                                            <td align="center">1.4</td>
                                            <td>É verificada a qualidade (embalagem, validade, aparência) dos produtos recebidos diretamente dos fornecedores (entrada direta)?<asp:TextBox
                                                ID="txt1_4" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_4_Sim" runat="server" GroupName="grupo1_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_4_Nao" runat="server" GroupName="grupo1_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_4_NA" runat="server" GroupName="grupo1_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.1.04--%>

                                        <tr>
                                            <td align="center">1.5</td>
                                            <td>É verificado o estado dos veículos (limpeza, organização e conservação) recebidos diretamente dos fornecedores (entrada direta)?<asp:TextBox
                                                ID="txt1_5" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_5_Sim" runat="server" GroupName="grupo1_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_5_Nao" runat="server" GroupName="grupo1_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_5_NA" runat="server" GroupName="grupo1_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.1.05--%>

                                        <tr>
                                            <td align="center">1.6</td>
                                            <td>Há restrição de entrada de pessoas externas (entregadores, caminhoneiros, crianças) no recebimento?<asp:TextBox
                                                ID="txt1_6" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_6_Sim" runat="server" GroupName="grupo1_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_6_Nao" runat="server" GroupName="grupo1_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_6_NA" runat="server" GroupName="grupo1_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.1.06--%>

                                        <tr>
                                            <td align="center">1.7</td>
                                            <td>As balanças e termômetros estão limpos, aferidos e de FÁCIL ACESSO aos conferentes?<asp:TextBox
                                                ID="txt1_7" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_7_Sim" runat="server" GroupName="grupo1_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_7_Nao" runat="server" GroupName="grupo1_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_7_NA" runat="server" GroupName="grupo1_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.1.07--%>

                                        <tr>
                                            <td align="center">1.8</td>
                                            <td>O encarregado ou funcionário das seções envolvidas está acompanhando os recebimentos dos perecíveis?<asp:TextBox
                                                ID="txt1_8" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_8_Sim" runat="server" GroupName="grupo1_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_8_Nao" runat="server" GroupName="grupo1_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_8_NA" runat="server" GroupName="grupo1_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.1.08--%>

                                        <tr>
                                            <td align="center">1.9</td>
                                            <td>Após a conferência os produtos são encaminhados imediatamente para o seu local de armazenagem (principalmente os perecíveis)?<asp:TextBox ID="txt1_9" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_9_Sim" runat="server" GroupName="grupo1_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_9_Nao" runat="server" GroupName="grupo1_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_9_NA" runat="server" GroupName="grupo1_9" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_9" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_9" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.1.09--%>

                                        <tr>
                                            <td align="center">1.10</td>
                                            <td>Há o acompanhamento de lacres dos caminhões do CD e do CEASA pelo Fiscal de Loja (Conferir planilha)?<asp:TextBox
                                                ID="txt1_10" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_10_Sim" runat="server" GroupName="grupo1_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_10_Nao" runat="server" GroupName="grupo1_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_10_NA" runat="server" GroupName="grupo1_10" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_10" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_10" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.1.10--%>

                                        <tr>
                                            <td align="center">1.11</td>
                                            <td>É verificada a qualidade dos produtos recebidos do Ceasa?<asp:TextBox
                                                ID="txt1_11" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_11_Sim" runat="server" GroupName="grupo1_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_11_Nao" runat="server" GroupName="grupo1_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_11_NA" runat="server" GroupName="grupo1_11" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_11" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_11" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_11" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.1.11--%>

                                        <tr>
                                            <td align="center">1.12</td>
                                            <td>É verificada a qualidade dos produtos recebidos do CD?<asp:TextBox
                                                ID="txt1_12" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_12_Sim" runat="server" GroupName="grupo1_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_12_Nao" runat="server" GroupName="grupo1_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_12_NA" runat="server" GroupName="grupo1_12" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_12" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_12" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_12" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.1.12--%>

                                        <tr>
                                            <td align="center">1.13</td>
                                            <td>Existe a conferência de 100% dos perecíveis e P.A.R. recebidos (CD /Ceasa)?<asp:TextBox
                                                ID="txt1_13" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_13_Sim" runat="server" GroupName="grupo1_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_13_Nao" runat="server" GroupName="grupo1_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_13_NA" runat="server" GroupName="grupo1_13" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_13" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_13" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_13" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.1.13--%>

                                        <tr>
                                            <td align="center">1.14</td>
                                            <td>O Fiscal de Loja do recebimento está presente 100% do tempo no recebimento?<asp:TextBox
                                                ID="txt1_14" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_14_Sim" runat="server" GroupName="grupo1_14" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_14_Nao" runat="server" GroupName="grupo1_14" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_14_NA" runat="server" GroupName="grupo1_14" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_14" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_14" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_14" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.1.14--%>

                                        <tr>
                                            <td align="center">1.15</td>
                                            <td>A vistoria é feita diariamente no descarte de lixo e papelões da loja? (para as lojas que possuem prensa, verificar se a mesma é utilizada no momento do descarte. As caixas de papelão devem ser prensadas e amarradas em fardos.)<asp:TextBox
                                                ID="txt1_15" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_15_Sim" runat="server" GroupName="grupo1_15" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_15_Nao" runat="server" GroupName="grupo1_15" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_15_NA" runat="server" GroupName="grupo1_15" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_15" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_15" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_15" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.1.15--%>

                                        <tr>
                                            <td align="center">1.16</td>
                                            <td>O controle de ocorrências do recebimento (entrada de NFs, devolução, temperatura, caminhões, irregularidades de recebimento) está sendo preenchido corretamente? (Verificar relatórios de irregularidades)<asp:TextBox
                                                ID="txt1_16" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_16_Sim" runat="server" GroupName="grupo1_16" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_16_Nao" runat="server" GroupName="grupo1_16" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_16_NA" runat="server" GroupName="grupo1_16" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_16" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_16" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_16" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.1.16--%>

                                        <tr>
                                            <td align="center">1.17</td>
                                            <td>A conferência dos P.A.R. é feita na área destinada?<asp:TextBox
                                                ID="txt1_17" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_17_Sim" runat="server" GroupName="grupo1_17" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_17_Nao" runat="server" GroupName="grupo1_17" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_17_NA" runat="server" GroupName="grupo1_17" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_17" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_17" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_17" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.1.17--%>

                                        <tr>
                                            <td align="center">1.18</td>
                                            <td>Após a conferência dos P.A.R., o responsável da seção encaminha as mercadorias diretamente para a área segregada?<asp:TextBox
                                                ID="txt1_18" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_18_Sim" runat="server" GroupName="grupo1_18" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_18_Nao" runat="server" GroupName="grupo1_18" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_18_NA" runat="server" GroupName="grupo1_18" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_18" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_18" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_18" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.1.18--%>

                                        <tr>
                                            <td align="center">1.19</td>
                                            <td>No momento da avaliação, o setor se encontrava limpo e organizado?<asp:TextBox
                                                ID="txt1_19" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_19_Sim" runat="server" GroupName="grupo1_19" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_19_Nao" runat="server" GroupName="grupo1_19" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_19_NA" runat="server" GroupName="grupo1_19" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_19" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_19" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_19" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.1.19--%>

                                        <tr>
                                            <td align="center">1.20</td>
                                            <td>No momento da avaliação, os funcionários utilizavam os EPI´s adequados para o recebimento?<asp:TextBox
                                                ID="txt1_20" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_20_Sim" runat="server" GroupName="grupo1_20" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_20_Nao" runat="server" GroupName="grupo1_20" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_20_NA" runat="server" GroupName="grupo1_20" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_20" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_20" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_20" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.1.20--%>

                                        <tr>
                                            <td align="center">1.21</td>
                                            <td>Todos os produtos que saem pelo recebimento são feitas por meio de Nota Fiscal? (Ex: Trocas, Assistência Técnica, transferências, etc.)<asp:TextBox
                                                ID="txt1_21" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_21_Sim" runat="server" GroupName="grupo1_21" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_21_Nao" runat="server" GroupName="grupo1_21" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_21_NA" runat="server" GroupName="grupo1_21" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_21" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_21" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_21" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.1.21--%>

                                        <tr>
                                            <td align="center">1.22</td>
                                            <td>Todos os produtos que saem pelo Recebimento são conferidos pelo responsável do setor, com a presença de um Fiscal de Loja?<asp:TextBox
                                                ID="txt1_22" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_22_Sim" runat="server" GroupName="grupo1_22" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_22_Nao" runat="server" GroupName="grupo1_22" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_22_NA" runat="server" GroupName="grupo1_22" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_22" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_22" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_22" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.1.22--%>

                                        <tr>
                                            <td align="center">1.23</td>
                                            <td>Existe controle nas transferências entre lojas (Emissão e acatamento de NF, conferência na saída e na chegada, email de autorização do Regional)<asp:TextBox
                                                ID="txt1_23" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_23_Sim" runat="server" GroupName="grupo1_23" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_23_Nao" runat="server" GroupName="grupo1_23" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_23_NA" runat="server" GroupName="grupo1_23" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_23" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_23" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_23" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.1.23--%>

                                        <thead>
                                            <tr>
                                                <td align="center" colspan="8">
                                                    <h2>
                                                        <b>NOTAS FISCAIS </b>
                                                    </h2>
                                                </td>
                                            </tr>
                                        </thead>
                                        <%--NOTAS FISCAIS--%>

                                        <tr>
                                            <td align="center">1.24</td>
                                            <td>Existem notas fiscais pendentes de acatamento (sem pedido, divergência de quantidade ou custo)?<asp:TextBox
                                                ID="txt1_24" runat="server" Height="50" TextMode="MultiLine" Width="500"></asp:TextBox>
                                            </td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_24_Sim" runat="server" GroupName="grupo1_24" />
                                            </td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_24_Nao" runat="server" GroupName="grupo1_24" />
                                            </td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_24_NA" runat="server" GroupName="grupo1_24" />
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_24" runat="server"
                                                        ImageUrl="~/image/camera-icon_32.png"
                                                        ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_24" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_24" runat="server"
                                                        ImageUrl="~/image/camera-icon-save_32.png"
                                                        ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.1.24--%>

                                        <tr>
                                            <td align="center">1.25</td>
                                            <td>Há restrição de entrada de pessoas externas (entregadores, caminhoneiros, crianças) na sala de digitação?<asp:TextBox
                                                ID="txt1_25" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_25_Sim" runat="server" GroupName="grupo1_25" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_25_Nao" runat="server" GroupName="grupo1_25" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd1_25_NA" runat="server" GroupName="grupo1_25" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto1_25" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile1_25" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto1_25" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 1.1.25--%>

                                        <thead>
                                            <tr>
                                                <td></td>
                                                <td align="right">
                                                    <dx:ASPxButton ID="btnGrupo1" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>
                                    </tbody>
                                </table>

                            </p>
                        </asp:Panel>

                        <asp:Panel ID="panTitle2" runat="server" CssClass="pnl_Azul">
                            <div style="float: left;">2 - Armazenamento - Depósito - Mercearia - Grupo 1 - (14 perguntas, 1 à 14) </div>
                            <div style="float: right;">
                                <asp:Label ID="lblTitle2" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div style="clear: both"></div>
                        </asp:Panel>
                        <asp:Panel ID="panDados2" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>
                                            <th align="center" scope="col" width="25px">PPO</th>
                                        </tr>
                                    </thead>

                                    <tbody>

                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Depósito - Mercearia </b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">2.1</td>
                                            <td>Há restrição de entrada de pessoas externas (Ex: Vendedores) no depósito?
                                    <asp:TextBox
                                        ID="txt2_1" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_1_Sim" runat="server" GroupName="grupo2_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_1_Nao" runat="server" GroupName="grupo2_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_1_NA" runat="server" GroupName="grupo2_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.1--%>

                                        <tr>
                                            <td align="center">2.2</td>
                                            <td>Todos os produtos da mesma família estão armazenados juntos? (o mesmo produto não deve estar espalhado em vários locais diferentes)<asp:TextBox
                                                ID="txt2_2" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_2_Sim" runat="server" GroupName="grupo2_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_2_Nao" runat="server" GroupName="grupo2_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_2_NA" runat="server" GroupName="grupo2_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.2--%>

                                        <tr>
                                            <td align="center">2.3</td>
                                            <td>O limite máximo de empilhamento é respeitado de modo a não existir risco de desabamento nem de ficar próximos a fiação elétrica?<asp:TextBox
                                                ID="txt2_3" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_3_Sim" runat="server" GroupName="grupo2_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_3_Nao" runat="server" GroupName="grupo2_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_3_NA" runat="server" GroupName="grupo2_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.3--%>

                                        <tr>
                                            <td align="center">2.4</td>
                                            <td>Os corredores estão limpos e desobstruídos?<asp:TextBox
                                                ID="txt2_4" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_4_Sim" runat="server" GroupName="grupo2_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_4_Nao" runat="server" GroupName="grupo2_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_4_NA" runat="server" GroupName="grupo2_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.4--%>

                                        <tr>
                                            <td align="center">2.5</td>
                                            <td>O depósito está organizado de maneira que não se encontre produtos alimentícios com não-alimentícios?<asp:TextBox
                                                ID="txt2_5" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_5_Sim" runat="server" GroupName="grupo2_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_5_Nao" runat="server" GroupName="grupo2_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_5_NA" runat="server" GroupName="grupo2_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.5--%>

                                        <tr>
                                            <td align="center">2.6</td>
                                            <td>O depósito está organizado em condições de se realizar o PVPS?<asp:TextBox
                                                ID="txt2_6" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_6_Sim" runat="server" GroupName="grupo2_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_6_Nao" runat="server" GroupName="grupo2_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_6_NA" runat="server" GroupName="grupo2_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.6--%>

                                        <tr>
                                            <td align="center">2.7</td>
                                            <td>Não foram localizados produtos vencidos no depósito?<asp:TextBox
                                                ID="txt2_7" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_7_Sim" runat="server" GroupName="grupo2_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_7_Nao" runat="server" GroupName="grupo2_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_7_NA" runat="server" GroupName="grupo2_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.7--%>

                                        <tr>
                                            <td align="center">2.8</td>
                                            <td>Os produtos estão armazenados de maneira que não se encontrem mercadorias soltas no depósito?<asp:TextBox
                                                ID="txt2_8" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_8_Sim" runat="server" GroupName="grupo2_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_8_Nao" runat="server" GroupName="grupo2_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_8_NA" runat="server" GroupName="grupo2_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.8--%>

                                        <tr>
                                            <td align="center">2.9</td>
                                            <td>Todas as caixas falsas armazenadas no depósito estão com espelho de caixa afixado (EAN, descrição, quantidade, validade)?<asp:TextBox
                                                ID="txt2_9" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_9_Sim" runat="server" GroupName="grupo2_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_9_Nao" runat="server" GroupName="grupo2_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_9_NA" runat="server" GroupName="grupo2_9" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_9" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_9" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.9--%>

                                        <tr>
                                            <td align="center">2.10</td>
                                            <td>As áreas segregadas estão adequadas no depósito de modo que os produtos permaneçam confinados (estrutura, cadeados, chaves)? 
                                    <asp:TextBox
                                        ID="txt2_10" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_10_Sim" runat="server" GroupName="grupo2_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_10_Nao" runat="server" GroupName="grupo2_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_10_NA" runat="server" GroupName="grupo2_10" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_10" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_10" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.10--%>

                                        <tr>
                                            <td align="center">2.11</td>
                                            <td>Existe o controle de acesso das áreas segregadas (chaves com os fiscais ou encarregados da seção)?
                                    <asp:TextBox
                                        ID="txt2_11" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_11_Sim" runat="server" GroupName="grupo2_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_11_Nao" runat="server" GroupName="grupo2_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_11_NA" runat="server" GroupName="grupo2_11" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_11" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_11" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_11" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.11--%>

                                        <tr>
                                            <td align="center">2.12</td>
                                            <td>As áreas de trocas e avarias estão limpas, organizadas e sinalizadas?<asp:TextBox
                                                ID="txt2_12" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_12_Sim" runat="server" GroupName="grupo2_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_12_Nao" runat="server" GroupName="grupo2_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_12_NA" runat="server" GroupName="grupo2_12" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_12" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_12" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_12" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.12--%>

                                        <tr>
                                            <td align="center">2.13</td>
                                            <td>No momento da avaliação, os funcionários e terceiros utilizavam os EPI´s adequados?<asp:TextBox
                                                ID="txt2_13" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_13_Sim" runat="server" GroupName="grupo2_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_13_Nao" runat="server" GroupName="grupo2_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_13_NA" runat="server" GroupName="grupo2_13" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_13" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_13" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_13" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.13--%>

                                        <tr>
                                            <td align="center">2.14</td>
                                            <td>Todos os PAR estão sendo etiquetados (alarmados) ainda na área segregada? (antes de irem para o chão de loja?)
                                    <asp:TextBox
                                        ID="txt2_14" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_14_Sim" runat="server" GroupName="grupo2_14" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_14_Nao" runat="server" GroupName="grupo2_14" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_14_NA" runat="server" GroupName="grupo2_14" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_14" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_14" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_14" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.14--%>


                                        <thead>
                                            <tr>
                                                <td></td>
                                                <td align="right">
                                                    <dx:ASPxButton ID="btnGrupo2" runat="server" Text="Enviar">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>
                        <%--2 - Armazenamento (Depósito)--%>

                        <asp:Panel ID="panTitle3" runat="server" CssClass="pnl_Azul">
                            <div style="float: left;">2 - Armazenamento (Depósito) - Bazar - Grupo 2 - (9 perguntas, 15 à 24) </div>
                            <div style="float: right;">
                                <asp:Label ID="lblTitle3" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div style="clear: both"></div>
                        </asp:Panel>
                        <asp:Panel ID="panDados3" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">

                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>
                                            <th align="center" scope="col" width="25px">PPO</th>
                                        </tr>
                                    </thead>

                                    <tbody>

                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Depósito - Bazar </b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">2.15</td>
                                            <td>Há restrição de entrada de pessoas externas no depósito?<asp:TextBox
                                                ID="txt2_15" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_15_Sim" runat="server" GroupName="grupo2_15" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_15_Nao" runat="server" GroupName="grupo2_15" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_15_NA" runat="server" GroupName="grupo2_15" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_15" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_15" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_15" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.15--%>

                                        <tr>
                                            <td align="center">2.16</td>
                                            <td>Não foram localizados produtos vencidos no depósito?<asp:TextBox
                                                ID="txt2_16" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_16_Sim" runat="server" GroupName="grupo2_16" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_16_Nao" runat="server" GroupName="grupo2_16" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_16_NA" runat="server" GroupName="grupo2_16" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_16" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_16" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_16" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.16--%>

                                        <tr>
                                            <td align="center">2.17</td>
                                            <td>O limite máximo de empilhamento é respeitado de modo a não existir risco de desabamento nem de ficar próximos a fiação elétrica?<asp:TextBox
                                                ID="txt2_17" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_17_Sim" runat="server" GroupName="grupo2_17" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_17_Nao" runat="server" GroupName="grupo2_17" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_17_NA" runat="server" GroupName="grupo2_17" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_17" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_17" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_17" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.17--%>

                                        <tr>
                                            <td align="center">2.18</td>
                                            <td>Os corredores estão limpos e desobstruídos?
                                    <asp:TextBox
                                        ID="txt2_18" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_18_Sim" runat="server" GroupName="grupo2_18" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_18_Nao" runat="server" GroupName="grupo2_18" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_18_NA" runat="server" GroupName="grupo2_18" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_18" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_18" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_18" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.18--%>

                                        <tr>
                                            <td align="center">2.19</td>
                                            <td>Todas as embalagens estão lacradas de maneira que não encontre mercadorias soltas no depósito? (Ex: Brinquedos, Papelaria, e outros produtos frágeis) 
                                    <asp:TextBox
                                        ID="txt2_19" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_19_Sim" runat="server" GroupName="grupo2_19" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_19_Nao" runat="server" GroupName="grupo2_19" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_19_NA" runat="server" GroupName="grupo2_19" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_19" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_19" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_19" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.19--%>

                                        <tr>
                                            <td align="center">2.20</td>
                                            <td>As áreas segregadas estão adequadas no depósito de modo que os produtos permaneçam confinados (estrutura, cadeados, chaves)? 
                                    <asp:TextBox
                                        ID="txt2_20" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_20_Sim" runat="server" GroupName="grupo2_20" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_20_Nao" runat="server" GroupName="grupo2_20" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_20_NA" runat="server" GroupName="grupo2_20" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_20" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_20" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_20" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.20--%>

                                        <tr>
                                            <td align="center">2.21</td>
                                            <td>Existe o controle de acesso das áreas segregadas (chaves com os fiscais ou encarregados da seção)? 
                                    <asp:TextBox
                                        ID="txt2_21" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_21_Sim" runat="server" GroupName="grupo2_21" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_21_Nao" runat="server" GroupName="grupo2_21" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_21_NA" runat="server" GroupName="grupo2_21" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_21" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_21" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_21" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.21--%>

                                        <tr>
                                            <td align="center">2.22</td>
                                            <td>As áreas de trocas e avarias estão limpas, organizadas e sinalizadas?
                                    <asp:TextBox
                                        ID="txt2_22" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_22_Sim" runat="server" GroupName="grupo2_22" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_22_Nao" runat="server" GroupName="grupo2_22" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_22_NA" runat="server" GroupName="grupo2_22" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_22" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_22" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_22" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.22--%>

                                        <tr>
                                            <td align="center">2.23</td>
                                            <td>No momento da avaliação, os funcionários e terceiros utilizavam os EPI´s adequados?
                                    <asp:TextBox
                                        ID="txt2_23" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_23_Sim" runat="server" GroupName="grupo2_23" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_23_Nao" runat="server" GroupName="grupo2_23" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_23_NA" runat="server" GroupName="grupo2_23" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_23" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_23" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_23" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <asp:ImageButton ID="imgPPO2_23" runat="server" ImageUrl="~/image/catalog-icon.png" ToolTip="Clique aqui para abrir o procedimento." /></td>
                                        </tr>
                                        <%--PERGUNTA 2.1.23--%>

                                        <tr>
                                            <td align="center">2.24</td>
                                            <td>Todos os PARs estão sendo etiquetados (alarmados) ainda na área segregada? (antes de irem para o chão de loja?)
                                    <asp:TextBox
                                        ID="txt2_24" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_24_Sim" runat="server" GroupName="grupo2_24" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_24_Nao" runat="server" GroupName="grupo2_24" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_24_NA" runat="server" GroupName="grupo2_24" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_24" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_24" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_24" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.24--%>


                                        <thead>
                                            <tr>
                                                <td></td>

                                                <td align="right">
                                                    <dx:ASPxButton ID="btnGrupo3" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>
                        <%--2 - Armazenamento (Bazar)--%>

                        <asp:Panel ID="panTitle4" runat="server" CssClass="pnl_Azul">
                            <div style="float: left;">2 - Armazenamento (Depósito) - Textil - Grupo 3 - (7 perguntas, 25 à 31) </div>
                            <div style="float: right;">
                                <asp:Label ID="lblTitle4" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div style="clear: both"></div>
                        </asp:Panel>
                        <asp:Panel ID="panDados4" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>
                                            <th align="center" scope="col" width="25px">PPO</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Depósito - Têxtil </b></h2>
                                                </td>
                                            </tr>
                                        </thead>


                                        <tr>
                                            <td align="center">2.25</td>
                                            <td>Há restrição de entrada de pessoas externas no depósito?
                                    <asp:TextBox
                                        ID="txt2_25" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_25_Sim" runat="server" GroupName="grupo2_25" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_25_Nao" runat="server" GroupName="grupo2_25" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_25_NA" runat="server" GroupName="grupo2_25" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_25" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_25" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_25" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.25--%>

                                        <tr>
                                            <td align="center">2.26</td>
                                            <td>Os corredores estão limpos e desobstruídos? 
                                    <asp:TextBox
                                        ID="txt2_26" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_26_Sim" runat="server" GroupName="grupo2_26" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_26_Nao" runat="server" GroupName="grupo2_26" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_26_NA" runat="server" GroupName="grupo2_26" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_26" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_26" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_26" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.26--%>

                                        <tr>
                                            <td align="center">2.27</td>
                                            <td>Os produtos estão armazenados em caixas fechadas no interior do depósito? 
                                    <asp:TextBox
                                        ID="txt2_27" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_27_Sim" runat="server" GroupName="grupo2_27" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_27_Nao" runat="server" GroupName="grupo2_27" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_27_NA" runat="server" GroupName="grupo2_27" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_27" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_27" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_27" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.27--%>

                                        <tr>
                                            <td align="center">2.28</td>
                                            <td>As áreas segregadas estão adequadas no depósito de modo que os produtos permaneçam confinados (estrutura, cadeados, chaves)? 
                                    <asp:TextBox
                                        ID="txt2_28" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_28_Sim" runat="server" GroupName="grupo2_28" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_28_Nao" runat="server" GroupName="grupo2_28" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_28_NA" runat="server" GroupName="grupo2_28" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_28" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_28" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_28" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.28--%>

                                        <tr>
                                            <td align="center">2.29</td>
                                            <td>Existe o controle de acesso das áreas segregadas (chaves com os fiscais ou encarregados da seção)?  
                                    <asp:TextBox
                                        ID="txt2_29" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_29_Sim" runat="server" GroupName="grupo2_29" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_29_Nao" runat="server" GroupName="grupo2_29" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_29_NA" runat="server" GroupName="grupo2_29" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_29" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_29" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_29" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.29--%>

                                        <tr>
                                            <td align="center">2.30</td>
                                            <td>No momento da avaliação, os funcionários e terceiros utilizavam os EPI´s adequados? 
                                    <asp:TextBox
                                        ID="txt2_30" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_30_Sim" runat="server" GroupName="grupo2_30" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_30_Nao" runat="server" GroupName="grupo2_30" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_30_NA" runat="server" GroupName="grupo2_30" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_30" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_30" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_30" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.30--%>

                                        <tr>
                                            <td align="center">2.31</td>
                                            <td>Todos os PARs estão sendo etiquetados (alarmados) ainda na área segregada? (antes de irem para o chão de loja?) 
                                    <asp:TextBox
                                        ID="txt2_31" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_31_Sim" runat="server" GroupName="grupo2_31" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_31_Nao" runat="server" GroupName="grupo2_31" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_31_NA" runat="server" GroupName="grupo2_31" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_31" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_31" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_31" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.31--%>

                                        <thead>
                                            <tr>
                                                <td></td>

                                                <td align="right">
                                                    <dx:ASPxButton ID="btnGrupo4" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>
                        <%--2 - Armazenamento (Textil)--%>

                        <asp:Panel ID="panTitle5" runat="server" CssClass="pnl_Azul">
                            <div style="float: left;">2 - Armazenamento (Depósito) - Eletro - Grupo 4 - (11 perguntas, 32 à 42) </div>
                            <div style="float: right;">
                                <asp:Label ID="lblTitle5" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div style="clear: both"></div>
                        </asp:Panel>
                        <asp:Panel ID="panDados5" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>
                                            <th align="center" scope="col" width="25px">PPO</th>
                                        </tr>
                                    </thead>

                                    <tbody>

                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Depósito - Eletro </b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">2.32</td>
                                            <td>Há restrição de entrada de pessoas externas no depósito? 
                                    <asp:TextBox
                                        ID="txt2_32" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_32_Sim" runat="server" GroupName="grupo2_32" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_32_Nao" runat="server" GroupName="grupo2_32" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_32_NA" runat="server" GroupName="grupo2_32" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_32" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_32" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_32" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.32--%>

                                        <tr>
                                            <td align="center">2.33</td>
                                            <td>Os corredores estão limpos e desobstruídos? 
                                    <asp:TextBox
                                        ID="txt2_33" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_33_Sim" runat="server" GroupName="grupo2_33" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_33_Nao" runat="server" GroupName="grupo2_33" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_33_NA" runat="server" GroupName="grupo2_33" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_33" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_33" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_33" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.33--%>

                                        <tr>
                                            <td align="center">2.34</td>
                                            <td>Existem produtos sem embalagem ou fora da embalagem original no depósito? 
                                    <asp:TextBox
                                        ID="txt2_34" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_34_Sim" runat="server" GroupName="grupo2_34" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_34_Nao" runat="server" GroupName="grupo2_34" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_34_NA" runat="server" GroupName="grupo2_34" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_34" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_34" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_34" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.34--%>

                                        <tr>
                                            <td align="center">2.35</td>
                                            <td>As áreas segregadas estão adequadas no depósito de modo que os produtos permaneçam confinados (estrutura, cadeados, chaves)? 
                                    <asp:TextBox
                                        ID="txt2_35" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_35_Sim" runat="server" GroupName="grupo2_35" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_35_Nao" runat="server" GroupName="grupo2_35" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_35_NA" runat="server" GroupName="grupo2_35" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_35" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_35" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_35" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.35--%>

                                        <tr>
                                            <td align="center">2.36</td>
                                            <td>Existe o controle de acesso das áreas segregadas (chaves com os fiscais ou encarregados da seção)?
                                    <asp:TextBox
                                        ID="txt2_36" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_36_Sim" runat="server" GroupName="grupo2_36" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_36_Nao" runat="server" GroupName="grupo2_36" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_36_NA" runat="server" GroupName="grupo2_36" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_36" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_36" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_36" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.36--%>

                                        <tr>
                                            <td align="center">2.37</td>
                                            <td>Existe o controle de chaves do confinado de Celulares, Tablets, Notebooks e afins?
                                    <asp:TextBox
                                        ID="txt2_37" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_37_Sim" runat="server" GroupName="grupo2_37" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_37_Nao" runat="server" GroupName="grupo2_37" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_37_NA" runat="server" GroupName="grupo2_37" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_37" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_37" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_37" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.37--%>

                                        <tr>
                                            <td align="center">2.38</td>
                                            <td>As áreas de avarias ou sucata estão limpas, organizadas e sinalizadas?
                                    <asp:TextBox
                                        ID="txt2_38" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_38_Sim" runat="server" GroupName="grupo2_38" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_38_Nao" runat="server" GroupName="grupo2_38" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_38_NA" runat="server" GroupName="grupo2_38" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_38" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_38" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_38" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.38--%>

                                        <tr>
                                            <td align="center">2.39</td>
                                            <td>A área destinada para Assistência Técnica está limpa, organizada e sinalizada? 
                                    <asp:TextBox
                                        ID="txt2_39" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_39_Sim" runat="server" GroupName="grupo2_39" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_39_Nao" runat="server" GroupName="grupo2_39" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_39_NA" runat="server" GroupName="grupo2_39" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_39" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_39" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_39" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.39--%>

                                        <tr>
                                            <td align="center">2.40</td>
                                            <td>Os produtos da área de Assistência Técnica estão relacionados em planilha específica? 
                                    <asp:TextBox
                                        ID="txt2_40" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_40_Sim" runat="server" GroupName="grupo2_40" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_40_Nao" runat="server" GroupName="grupo2_40" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_40_NA" runat="server" GroupName="grupo2_40" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_40" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_40" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_40" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.40--%>

                                        <tr>
                                            <td align="center">2.41</td>
                                            <td>No momento da avaliação, os funcionários e terceiros utilizavam os EPI's adequados? 
                                    <asp:TextBox
                                        ID="txt2_41" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_41_Sim" runat="server" GroupName="grupo2_41" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_41_Nao" runat="server" GroupName="grupo2_41" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_41_NA" runat="server" GroupName="grupo2_41" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_41" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_41" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_41" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.41--%>

                                        <tr>
                                            <td align="center">2.42</td>
                                            <td>Todos os PAR estão sendo etiquetados (alarmados) ainda na área segregada? (antes de irem para o chão de loja?) 
                                    <asp:TextBox
                                        ID="txt2_42" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_42_Sim" runat="server" GroupName="grupo2_42" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_42_Nao" runat="server" GroupName="grupo2_42" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd2_42_NA" runat="server" GroupName="grupo2_42" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto2_42" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile2_42" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto2_42" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 2.1.42--%>


                                        <thead>
                                            <tr>
                                                <td></td>

                                                <td align="right">
                                                    <dx:ASPxButton ID="btnGrupo5" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>
                        <%--2 - Armazenamento (Eletro)--%>

                        <asp:Panel ID="panTitle6" runat="server" CssClass="pnl_Azul">
                            <div style="float: left;">3 - Armazenamento (Câmaras) - Açougue - Grupo 1 - (14 perguntas, 1 à 14) </div>
                            <div style="float: right;">
                                <asp:Label ID="lblTitle6" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div style="clear: both"></div>
                        </asp:Panel>
                        <asp:Panel ID="panDados6" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>
                                            <th align="center" scope="col" width="25px">PPO</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Câmaras - Açougue </b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">3.1</td>
                                            <td>A câmara está limpa e organizada?
                                    <asp:TextBox
                                        ID="txt3_1" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_1_Sim" runat="server" GroupName="grupo3_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_1_Nao" runat="server" GroupName="grupo3_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_1_NA" runat="server" GroupName="grupo3_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.1--%>

                                        <tr>
                                            <td align="center">3.2</td>
                                            <td>A câmara está em perfeitas condições para o uso?
                                    <asp:TextBox
                                        ID="txt3_2" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_2_Sim" runat="server" GroupName="grupo3_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_2_Nao" runat="server" GroupName="grupo3_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_2_NA" runat="server" GroupName="grupo3_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.2--%>

                                        <tr>
                                            <td align="center">3.3</td>
                                            <td>O empilhamento de caixas está guardando distância mínima de 10 cm em relação às paredes?<asp:TextBox
                                                ID="txt3_3" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_3_Sim" runat="server" GroupName="grupo3_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_3_Nao" runat="server" GroupName="grupo3_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_3_NA" runat="server" GroupName="grupo3_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.3--%>

                                        <tr>
                                            <td align="center">3.4</td>
                                            <td>O armazenamento de produtos está separado entre carne bovina, suina e de aves? (evitando a contaminação cruzada)<asp:TextBox
                                                ID="txt3_4" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_4_Sim" runat="server" GroupName="grupo3_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_4_Nao" runat="server" GroupName="grupo3_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_4_NA" runat="server" GroupName="grupo3_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.4--%>

                                        <tr>
                                            <td align="center">3.5</td>
                                            <td>O PVPS é cumprido corretamente?<asp:TextBox
                                                ID="txt3_5" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_5_Sim" runat="server" GroupName="grupo3_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_5_Nao" runat="server" GroupName="grupo3_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_5_NA" runat="server" GroupName="grupo3_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.5--%>

                                        <tr>
                                            <td align="center">3.6</td>
                                            <td>Os produtos vindos do Recebimento são armazenados imediatamente dentro da câmara?
                                    <asp:TextBox
                                        ID="txt3_6" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_6_Sim" runat="server" GroupName="grupo3_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_6_Nao" runat="server" GroupName="grupo3_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_6_NA" runat="server" GroupName="grupo3_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.6--%>

                                        <tr>
                                            <td align="center">3.7</td>
                                            <td>As quebras conhecidas do Açougue são descartadas diariamente, evitando a maturação de outros produtos?<asp:TextBox
                                                ID="txt3_7" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_7_Sim" runat="server" GroupName="grupo3_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_7_Nao" runat="server" GroupName="grupo3_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_7_NA" runat="server" GroupName="grupo3_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.7--%>

                                        <tr>
                                            <td align="center">3.8</td>
                                            <td>Não existem produtos de troca e/ou impróprios para venda armazenados junto com os produtos "bons" (próprios para consumo)?<asp:TextBox
                                                ID="txt3_8" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_8_Sim" runat="server" GroupName="grupo3_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_8_Nao" runat="server" GroupName="grupo3_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_8_NA" runat="server" GroupName="grupo3_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.8--%>

                                        <tr>
                                            <td align="center">3.9</td>
                                            <td>Os descartes de açougue, sebo e osso são acompanhados pelo Fiscal de Loja?<asp:TextBox
                                                ID="txt3_9" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_9_Sim" runat="server" GroupName="grupo3_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_9_Nao" runat="server" GroupName="grupo3_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_9_NA" runat="server" GroupName="grupo3_9" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_9" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_9" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.9--%>

                                        <tr>
                                            <td align="center">3.10</td>
                                            <td>Não foram encontrados quebra (Ag. 23) armazenados junto na cuba de sebo e osso?
                                    <asp:TextBox
                                        ID="txt3_10" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_10_Sim" runat="server" GroupName="grupo3_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_10_Nao" runat="server" GroupName="grupo3_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_10_NA" runat="server" GroupName="grupo3_10" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_10" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_10" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.10--%>

                                        <tr>
                                            <td align="center">3.11</td>
                                            <td>Não foram localizados produtos vencidos na câmara?
                                    <asp:TextBox
                                        ID="txt3_11" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_11_Sim" runat="server" GroupName="grupo3_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_11_Nao" runat="server" GroupName="grupo3_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_11_NA" runat="server" GroupName="grupo3_11" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_11" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_11" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_11" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.11--%>

                                        <tr>
                                            <td align="center">3.12</td>
                                            <td>Toda a produção armazenada nas câmaras possui etiqueta de identificação e validade?<asp:TextBox
                                                ID="txt3_12" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_12_Sim" runat="server" GroupName="grupo3_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_12_Nao" runat="server" GroupName="grupo3_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_12_NA" runat="server" GroupName="grupo3_12" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_12" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_12" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_12" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.12--%>

                                        <tr>
                                            <td align="center">3.13</td>
                                            <td>O acesso de pessoas às câmaras é feito com o uso dos EPI´s obrigatórios?<asp:TextBox
                                                ID="txt3_13" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_13_Sim" runat="server" GroupName="grupo3_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_13_Nao" runat="server" GroupName="grupo3_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_13_NA" runat="server" GroupName="grupo3_13" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_13" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_13" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_13" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.13--%>

                                        <tr>
                                            <td align="center">3.14</td>
                                            <td>Os funcionários do setor fazem uso de toucas, uniformes e não utilizam adornos (brincos, esmaltes, maquiagem, perfume, etc.)?<asp:TextBox
                                                ID="txt3_14" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_14_Sim" runat="server" GroupName="grupo3_14" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_14_Nao" runat="server" GroupName="grupo3_14" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_14_NA" runat="server" GroupName="grupo3_14" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_14" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_14" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_14" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.14--%>

                                        <thead>
                                            <tr>
                                                <td></td>

                                                <td align="right">
                                                    <dx:ASPxButton ID="btnGrupo6" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>
                        <%--3 - Armazenamento (Camaras)--%>

                        <asp:Panel ID="panTitle7" runat="server" CssClass="pnl_Azul">
                            <div style="float: left;">3 - Armazenamento (Câmaras) - Fiambreria e Laticínios - Grupo 2 - (11 perguntas, 15 à 25) </div>
                            <div style="float: right;">
                                <asp:Label ID="lblTitle7" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div style="clear: both"></div>
                        </asp:Panel>
                        <asp:Panel ID="panDados7" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>
                                            <th align="center" scope="col" width="25px">PPO</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Câmaras - Fiambreria e Laticínios </b></h2>
                                                </td>
                                            </tr>
                                        </thead>


                                        <tr>
                                            <td align="center">3.15</td>
                                            <td>A câmara está limpa e organizada?
                                    <asp:TextBox
                                        ID="txt3_15" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_15_Sim" runat="server" GroupName="grupo3_15" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_15_Nao" runat="server" GroupName="grupo3_15" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_15_NA" runat="server" GroupName="grupo3_15" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_15" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_15" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_15" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.15--%>

                                        <tr>
                                            <td align="center">3.16</td>
                                            <td>A câmara está em perfeitas condições para o uso?<asp:TextBox
                                                ID="txt3_16" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_16_Sim" runat="server" GroupName="grupo3_16" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_16_Nao" runat="server" GroupName="grupo3_16" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_16_NA" runat="server" GroupName="grupo3_16" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_16" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_16" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_16" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.16--%>

                                        <tr>
                                            <td align="center">3.17</td>
                                            <td>O limite máximo de empilhamento é respeitado?<asp:TextBox
                                                ID="txt3_17" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_17_Sim" runat="server" GroupName="grupo3_17" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_17_Nao" runat="server" GroupName="grupo3_17" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_17_NA" runat="server" GroupName="grupo3_17" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_17" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_17" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_17" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.17--%>

                                        <tr>
                                            <td align="center">3.18</td>
                                            <td>O PVPS é cumprido corretamente?
                                    <asp:TextBox
                                        ID="txt3_18" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_18_Sim" runat="server" GroupName="grupo3_18" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_18_Nao" runat="server" GroupName="grupo3_18" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_18_NA" runat="server" GroupName="grupo3_18" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_18" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_18" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_18" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.18--%>

                                        <tr>
                                            <td align="center">3.19</td>
                                            <td>Os produtos vindos do Recebimento são armazenados imediatamente dentro da câmara?
                                    <asp:TextBox
                                        ID="txt3_19" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_19_Sim" runat="server" GroupName="grupo3_19" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_19_Nao" runat="server" GroupName="grupo3_19" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_19_NA" runat="server" GroupName="grupo3_19" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_19" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_19" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_19" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.19--%>

                                        <tr>
                                            <td align="center">3.20</td>
                                            <td>As quebras conhecidas dos setores são descartadas diariamente?<asp:TextBox
                                                ID="txt3_20" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_20_Sim" runat="server" GroupName="grupo3_20" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_20_Nao" runat="server" GroupName="grupo3_20" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_20_NA" runat="server" GroupName="grupo3_20" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_20" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_20" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_20" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.20--%>

                                        <tr>
                                            <td align="center">3.21</td>
                                            <td>Não existem produtos de troca e/ou impróprios para consumo armazenados junto com os produtos "bons" (próprios para consumo)?<asp:TextBox
                                                ID="txt3_21" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_21_Sim" runat="server" GroupName="grupo3_21" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_21_Nao" runat="server" GroupName="grupo3_21" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_21_NA" runat="server" GroupName="grupo3_21" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_21" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_21" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_21" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.21--%>

                                        <tr>
                                            <td align="center">3.22</td>
                                            <td>Não foram localizados produtos vencidos na câmara?<asp:TextBox
                                                ID="txt3_22" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_22_Sim" runat="server" GroupName="grupo3_22" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_22_Nao" runat="server" GroupName="grupo3_22" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_22_NA" runat="server" GroupName="grupo3_22" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_22" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_22" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_22" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.22--%>

                                        <tr>
                                            <td align="center">3.23</td>
                                            <td>Toda a produção armazenada nas câmaras possui etiqueta de identificação e validade?
                                    <asp:TextBox
                                        ID="txt3_23" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_23_Sim" runat="server" GroupName="grupo3_23" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_23_Nao" runat="server" GroupName="grupo3_23" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_23_NA" runat="server" GroupName="grupo3_23" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_23" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_23" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_23" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.23--%>

                                        <tr>
                                            <td align="center">3.24</td>
                                            <td>O acesso de pessoas as câmaras é feito com o uso dos EPI´s obrigatórios?<asp:TextBox
                                                ID="txt3_24" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_24_Sim" runat="server" GroupName="grupo3_24" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_24_Nao" runat="server" GroupName="grupo3_24" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_24_NA" runat="server" GroupName="grupo3_24" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_24" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_24" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_24" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.24--%>

                                        <tr>
                                            <td align="center">3.25</td>
                                            <td>Os funcionários do setor fazem uso de toucas, uniformes e não utilizam adornos (brincos, esmaltes, maquiagem, perfume, etc.)?<asp:TextBox
                                                ID="txt3_25" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_25_Sim" runat="server" GroupName="grupo3_25" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_25_Nao" runat="server" GroupName="grupo3_25" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_25_NA" runat="server" GroupName="grupo3_25" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_25" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_25" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_25" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.25--%>

                                        <thead>
                                            <tr>
                                                <td></td>

                                                <td align="right">
                                                    <dx:ASPxButton ID="btnGrupo7" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>

                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>
                        <%--3 - CÂMARA FIAMBRERIA/ LATICÍNIOS --%>

                        <asp:Panel ID="panTitle8" runat="server" CssClass="pnl_Azul">
                            <div style="float: left;">3 - Armazenamento (Câmaras) - Congelados - Grupo 3 - (9 perguntas, 26 à 34) </div>
                            <div style="float: right;">
                                <asp:Label ID="lblTitle8" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div style="clear: both"></div>
                        </asp:Panel>
                        <asp:Panel ID="panDados8" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>
                                            <th align="center" scope="col" width="25px">PPO</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Câmaras - Congelados </b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">3.26</td>
                                            <td>A câmara está limpa e organizada?
                                    <asp:TextBox
                                        ID="txt3_26" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_26_Sim" runat="server" GroupName="grupo3_26" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_26_Nao" runat="server" GroupName="grupo3_26" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_26_NA" runat="server" GroupName="grupo3_26" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_26" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_26" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_26" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.26--%>

                                        <tr>
                                            <td align="center">3.27</td>
                                            <td>A câmara está em perfeitas condições para o uso?<asp:TextBox
                                                ID="txt3_27" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_27_Sim" runat="server" GroupName="grupo3_27" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_27_Nao" runat="server" GroupName="grupo3_27" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_27_NA" runat="server" GroupName="grupo3_27" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_27" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_27" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_27" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.27--%>

                                        <tr>
                                            <td align="center">3.28</td>
                                            <td>O limite máximo de empilhamento é respeitado?<asp:TextBox
                                                ID="txt3_28" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_28_Sim" runat="server" GroupName="grupo3_28" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_28_Nao" runat="server" GroupName="grupo3_28" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_28_NA" runat="server" GroupName="grupo3_28" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_28" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_28" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_28" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.28--%>

                                        <tr>
                                            <td align="center">3.29</td>
                                            <td>O PVPS é cumprido corretamente?<asp:TextBox
                                                ID="txt3_29" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_29_Sim" runat="server" GroupName="grupo3_29" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_29_Nao" runat="server" GroupName="grupo3_29" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_29_NA" runat="server" GroupName="grupo3_29" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_29" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_29" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_29" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.29--%>

                                        <tr>
                                            <td align="center">3.30</td>
                                            <td>Os produtos vindos do Recebimento são armazenados imediatamente dentro da câmara?<asp:TextBox
                                                ID="txt3_30" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_30_Sim" runat="server" GroupName="grupo3_30" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_30_Nao" runat="server" GroupName="grupo3_30" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_30_NA" runat="server" GroupName="grupo3_30" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_30" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_30" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_30" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.30--%>

                                        <tr>
                                            <td align="center">3.31</td>
                                            <td>As quebras conhecidas dos setores são descartadas diariamente?
                                    <asp:TextBox
                                        ID="txt3_31" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_31_Sim" runat="server" GroupName="grupo3_31" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_31_Nao" runat="server" GroupName="grupo3_31" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_31_NA" runat="server" GroupName="grupo3_31" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_31" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_31" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_31" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.31--%>

                                        <tr>
                                            <td align="center">3.32</td>
                                            <td>Não existem produtos de troca e/ou impróprios para consumo armazenados junto com os produtos "bons" (próprios para consumo)?<asp:TextBox
                                                ID="txt3_32" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_32_Sim" runat="server" GroupName="grupo3_32" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_32_Nao" runat="server" GroupName="grupo3_32" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_32_NA" runat="server" GroupName="grupo3_32" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_32" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_32" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_32" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.32--%>

                                        <tr>
                                            <td align="center">3.33</td>
                                            <td>Não foram localizados produtos vencidos na câmara?<asp:TextBox
                                                ID="txt3_33" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_33_Sim" runat="server" GroupName="grupo3_33" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_33_Nao" runat="server" GroupName="grupo3_33" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_33_NA" runat="server" GroupName="grupo3_33" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_33" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_33" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_33" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.33--%>

                                        <tr>
                                            <td align="center">3.34</td>
                                            <td>O acesso de pessoas as câmaras é feito com o uso dos EPI´s obrigatórios?
                                    <asp:TextBox
                                        ID="txt3_34" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_34_Sim" runat="server" GroupName="grupo3_34" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_34_Nao" runat="server" GroupName="grupo3_34" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_34_NA" runat="server" GroupName="grupo3_34" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_34" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_34" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_34" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.34--%>

                                        <thead>
                                            <tr>
                                                <td></td>

                                                <td align="right">
                                                    <dx:ASPxButton ID="btnGrupo8" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>

                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>
                        <%--3 - CÂMARA CONGELADOS --%>

                        <asp:Panel ID="panTitle9" runat="server" CssClass="pnl_Azul">
                            <div style="float: left;">3 - Armazenamento (Câmaras) - F.L.V. - Grupo 4 - (8 perguntas, 35 à 42) </div>
                            <div style="float: right;">
                                <asp:Label ID="lblTitle9" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div style="clear: both"></div>
                        </asp:Panel>
                        <asp:Panel ID="panDados9" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>
                                            <th align="center" scope="col" width="25px">PPO</th>
                                        </tr>
                                    </thead>

                                    <tbody>

                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Câmaras - F.L.V. </b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">3.35</td>
                                            <td>A câmara e/ou local de armazenamento está limpo e organizado, sem odores que caracterizem produtos impróprios para venda?
                                    <asp:TextBox
                                        ID="txt3_35" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_35_Sim" runat="server" GroupName="grupo3_35" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_35_Nao" runat="server" GroupName="grupo3_35" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_35_NA" runat="server" GroupName="grupo3_35" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_35" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_35" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_35" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.35--%>

                                        <tr>
                                            <td align="center">3.36</td>
                                            <td>A câmara e/ou local de armazenamento está em perfeitas condições para o uso?<asp:TextBox
                                                ID="txt3_36" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_36_Sim" runat="server" GroupName="grupo3_36" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_36_Nao" runat="server" GroupName="grupo3_36" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_36_NA" runat="server" GroupName="grupo3_36" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_36" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_36" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_36" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.36--%>

                                        <tr>
                                            <td align="center">3.37</td>
                                            <td>Dentro da sala de armazenamento, as caixas são empilhadas de forma correta e segura (sem oferecer riscos as mercadorias e ao ambiente?)<asp:TextBox
                                                ID="txt3_37" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_37_Sim" runat="server" GroupName="grupo3_37" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_37_Nao" runat="server" GroupName="grupo3_37" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_37_NA" runat="server" GroupName="grupo3_37" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_37" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_37" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_37" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.37--%>

                                        <tr>
                                            <td align="center">3.38</td>
                                            <td>O PVPS é cumprido corretamente? (Observar o grau de maturação dos produtos. Mais verde embaixo, mais maduro em cima)<asp:TextBox
                                                ID="txt3_38" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_38_Sim" runat="server" GroupName="grupo3_38" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_38_Nao" runat="server" GroupName="grupo3_38" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_38_NA" runat="server" GroupName="grupo3_38" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_38" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_38" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_38" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.38--%>

                                        <tr>
                                            <td align="center">3.39</td>
                                            <td>As quebras conhecidas do setor são descartadas diariamente, evitando a maturação de outros produtos?
                                    <asp:TextBox
                                        ID="txt3_39" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_39_Sim" runat="server" GroupName="grupo3_39" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_39_Nao" runat="server" GroupName="grupo3_39" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_39_NA" runat="server" GroupName="grupo3_39" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_39" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_39" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_39" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.39--%>

                                        <tr>
                                            <td align="center">3.40</td>
                                            <td>Os produtos impróprios para consumo estão armazenados na área identificada e sinalizada? A área está limpa e organizada?<asp:TextBox
                                                ID="txt3_40" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_40_Sim" runat="server" GroupName="grupo3_40" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_40_Nao" runat="server" GroupName="grupo3_40" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_40_NA" runat="server" GroupName="grupo3_40" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_40" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_40" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_40" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.40--%>

                                        <tr>
                                            <td align="center">3.41</td>
                                            <td>Não foram localizados produtos vencidos no local de armazenamento?<asp:TextBox
                                                ID="txt3_41" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_41_Sim" runat="server" GroupName="grupo3_41" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_41_Nao" runat="server" GroupName="grupo3_41" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_41_NA" runat="server" GroupName="grupo3_41" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_41" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_41" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_41" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.41--%>

                                        <tr>
                                            <td align="center">3.42</td>
                                            <td>O acesso de pessoas ao local de armazenamento é feito com o uso dos EPI´s obrigatórios?<asp:TextBox
                                                ID="txt3_42" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_42_Sim" runat="server" GroupName="grupo3_42" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_42_Nao" runat="server" GroupName="grupo3_42" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_42_NA" runat="server" GroupName="grupo3_42" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_42" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_42" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_42" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.42--%>

                                        <thead>
                                            <tr>
                                                <td></td>

                                                <td align="right">
                                                    <dx:ASPxButton ID="btnGrupo9" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>

                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>
                        <%--3 - CÂMARA F.L.V --%>

                        <asp:Panel ID="panTitle10" runat="server" CssClass="pnl_Azul">
                            <div style="float: left;">3 - Armazenamento (Câmaras) - Padaria - Confeitaria - Rotisseria - Grupo 5 - (12 perguntas, 43 à 54) </div>
                            <div style="float: right;">
                                <asp:Label ID="lblTitle10" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div style="clear: both"></div>
                        </asp:Panel>
                        <asp:Panel ID="panDados10" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">

                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>
                                            <th align="center" scope="col" width="25px">PPO</th>
                                        </tr>
                                    </thead>

                                    <tbody>

                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Armazenamento (Câmaras) - Padaria - Confeitaria - Rotisseria </b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">3.43</td>
                                            <td>A câmara e/ou local de armazenamento está limpo e organizado, sem odores que caracterizem produtos impróprios para consumo?<asp:TextBox
                                                ID="txt3_43" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_43_Sim" runat="server" GroupName="grupo3_43" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_43_Nao" runat="server" GroupName="grupo3_43" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_43_NA" runat="server" GroupName="grupo3_43" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_43" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_43" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_43" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.43--%>

                                        <tr>
                                            <td align="center">3.44</td>
                                            <td>A câmara e/ou local de armazenamento está em perfeitas condições para o uso, limpa e organizada?<asp:TextBox
                                                ID="txt3_44" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_44_Sim" runat="server" GroupName="grupo3_44" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_44_Nao" runat="server" GroupName="grupo3_44" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_44_NA" runat="server" GroupName="grupo3_44" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_44" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_44" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_44" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.44--%>

                                        <tr>
                                            <td align="center">3.45</td>
                                            <td>O PVPS é cumprido corretamente?<asp:TextBox
                                                ID="txt3_45" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_45_Sim" runat="server" GroupName="grupo3_45" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_45_Nao" runat="server" GroupName="grupo3_45" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_45_NA" runat="server" GroupName="grupo3_45" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_45" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_45" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_45" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.45--%>

                                        <tr>
                                            <td align="center">3.46</td>
                                            <td>Os produtos vindos do Recebimento são armazenados imediatamente dentro da câmara?<asp:TextBox
                                                ID="txt3_46" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_46_Sim" runat="server" GroupName="grupo3_46" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_46_Nao" runat="server" GroupName="grupo3_46" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_46_NA" runat="server" GroupName="grupo3_46" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_46" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_46" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_46" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.46--%>

                                        <tr>
                                            <td align="center">3.47</td>
                                            <td>Não existem produtos de troca e/ou impróprios para consumo armazenados junto com os produtos "bons" (próprios para consumo)?<asp:TextBox
                                                ID="txt3_47" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_47_Sim" runat="server" GroupName="grupo3_47" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_47_Nao" runat="server" GroupName="grupo3_47" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_47_NA" runat="server" GroupName="grupo3_47" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_47" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_47" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_47" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.47--%>

                                        <tr>
                                            <td align="center">3.48</td>
                                            <td>Não foram localizados produtos vencidos na câmara?<asp:TextBox
                                                ID="txt3_48" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_48_Sim" runat="server" GroupName="grupo3_48" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_48_Nao" runat="server" GroupName="grupo3_48" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_48_NA" runat="server" GroupName="grupo3_48" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_48" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_48" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_48" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.48--%>

                                        <tr>
                                            <td align="center">3.49</td>
                                            <td>Toda a produção armazenada nas câmaras possui etiqueta de identificação e validade?<asp:TextBox
                                                ID="txt3_49" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_49_Sim" runat="server" GroupName="grupo3_49" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_49_Nao" runat="server" GroupName="grupo3_49" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_49_NA" runat="server" GroupName="grupo3_49" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_49" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_49" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_49" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.49--%>

                                        <tr>
                                            <td align="center">3.50</td>
                                            <td>O processo de descongelamento técnico é feito corretamente conforme orientação da Higiene e Segurança Alimentar (HSA)?<asp:TextBox
                                                ID="txt3_50" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_50_Sim" runat="server" GroupName="grupo3_50" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_50_Nao" runat="server" GroupName="grupo3_50" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_50_NA" runat="server" GroupName="grupo3_50" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_50" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_50" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_50" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.50--%>

                                        <tr>
                                            <td align="center">3.51</td>
                                            <td>O acesso de pessoas as câmaras é feito com o uso dos EPI´s obrigatórios?<asp:TextBox
                                                ID="txt3_51" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_51_Sim" runat="server" GroupName="grupo3_51" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_51_Nao" runat="server" GroupName="grupo3_51" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_51_NA" runat="server" GroupName="grupo3_51" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_51" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_51" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_51" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.51--%>

                                        <tr>
                                            <td align="center">3.52</td>
                                            <td>Os funcionários do setor fazem uso de toucas, uniformes e não utilizam adornos (brincos, esmaltes, maquiagem, perfume, etc.)?<asp:TextBox
                                                ID="txt3_52" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_52_Sim" runat="server" GroupName="grupo3_52" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_52_Nao" runat="server" GroupName="grupo3_52" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_52_NA" runat="server" GroupName="grupo3_52" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_52" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_52" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_52" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.52--%>

                                        <tr>
                                            <td align="center">3.53</td>
                                            <td>As quebras conhecidas do setor são descartadas diariamente?<asp:TextBox
                                                ID="txt3_53" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_53_Sim" runat="server" GroupName="grupo3_53" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_53_Nao" runat="server" GroupName="grupo3_53" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd3_53_NA" runat="server" GroupName="grupo3_53" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto3_53" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile3_53" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto3_53" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 3.1.53--%>

                                        <thead>
                                            <tr>
                                                <td colspan="7" align="center">
                                                    <h2><b>Trocas - Perecíveis </b></h2>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td align="center">3.54</td>
                                                <td>O local para as trocas de PERECÍVEIS (fora das câmaras), estão sinalizados, limpos e organizados?<asp:TextBox
                                                    ID="txt3_54" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                                <td align="center">
                                                    <asp:RadioButton ID="rnd3_54_Sim" runat="server" GroupName="grupo3_54" /></td>
                                                <td align="center">
                                                    <asp:RadioButton ID="rnd3_54_Nao" runat="server" GroupName="grupo3_54" /></td>
                                                <td align="center">
                                                    <asp:RadioButton ID="rnd3_54_NA" runat="server" GroupName="grupo3_54" /></td>
                                                <td align="center">
                                                    <div class="fileEscondido">
                                                        <asp:ImageButton ID="imgFoto3_54" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                        <asp:FileUpload ID="upFile3_54" runat="server" />
                                                    </div>
                                                </td>
                                                <td align="center">
                                                    <div class="fileEscondido">
                                                        <asp:ImageButton ID="btnSalvarFoto3_54" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    </div>
                                                </td>
                                                <td align="center">
                                                    <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                                </td>
                                            </tr>
                                            <%--PERGUNTA 3.1.54--%>
                                        </thead>

                                        <thead>
                                            <tr>
                                                <td></td>

                                                <td align="right">
                                                    <dx:ASPxButton ID="btnGrupo10" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>
                        <%--3 - CÂMARA PADARIA - CONFEITARIA - ROTISSERIA--%>

                        <asp:Panel ID="panTitle11" runat="server" CssClass="pnl_Azul">
                            <div style="float: left;">4 - Área de Vendas - P.A.R - Grupo 1 - (3 perguntas, 1 à 3) </div>
                            <div style="float: right;">
                                <asp:Label ID="lblTitle11" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div style="clear: both"></div>
                        </asp:Panel>
                        <asp:Panel ID="panDados11" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>
                                            <th align="center" scope="col" width="25px">PPO</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>P.A.R </b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">4.1</td>
                                            <td>Os PAR estão expostos de forma segura e controlável?<asp:TextBox
                                                ID="txt4_1" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_1_Sim" runat="server" GroupName="grupo4_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_1_Nao" runat="server" GroupName="grupo4_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_1_NA" runat="server" GroupName="grupo4_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.1.1--%>

                                        <tr>
                                            <td align="center">4.2</td>
                                            <td>Os PAR possuem sensores e/ou alarmes em todas as unidades expostas?<asp:TextBox
                                                ID="txt4_2" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_2_Sim" runat="server" GroupName="grupo4_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_2_Nao" runat="server" GroupName="grupo4_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_2_NA" runat="server" GroupName="grupo4_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.1.2--%>

                                        <tr>
                                            <td align="center">4.3</td>
                                            <td>Os PAR da seção de eletro possuem sensores, estão amarrados com cabo de aço ou estão expostos em balcão trancado?
                                    <asp:TextBox
                                        ID="txt4_3" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_3_Sim" runat="server" GroupName="grupo4_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_3_Nao" runat="server" GroupName="grupo4_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_3_NA" runat="server" GroupName="grupo4_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.1.3--%>

                                        <thead>
                                            <tr>
                                                <td></td>

                                                <td align="right">
                                                    <dx:ASPxButton ID="btnGrupo11" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>

                        <asp:Panel ID="panTitle12" runat="server" CssClass="pnl_Azul">
                            <div style="float: left;">4 - Área de Vendas - F.L.V. - Grupo 2 - (7 perguntas, 4 à 10) </div>
                            <div style="float: right;">
                                <asp:Label ID="lblTitle12" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div style="clear: both"></div>
                        </asp:Panel>
                        <asp:Panel ID="panDados12" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>
                                            <th align="center" scope="col" width="25px">PPO</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>F.L.V </b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">4.4</td>
                                            <td>A exposição dos produtos é feita de forma controlada (sem exposições excessivamente agressivas), respeitando a sensibilidade de cada produto (ex.: mamão não pode ser exposto em várias camadas)? Anote os produtos irregulares.
                                    <asp:TextBox
                                        ID="txt4_4" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_4_Sim" runat="server" GroupName="grupo4_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_4_Nao" runat="server" GroupName="grupo4_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_4_NA" runat="server" GroupName="grupo4_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.1.4--%>

                                        <tr>
                                            <td align="center">4.5</td>
                                            <td>O balcão de refrigeração encontra-se abastecido corretamente? (Sem obstruir a saída de ar refrigerado)<asp:TextBox
                                                ID="txt4_5" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_5_Sim" runat="server" GroupName="grupo4_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_5_Nao" runat="server" GroupName="grupo4_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_5_NA" runat="server" GroupName="grupo4_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.1.5--%>

                                        <tr>
                                            <td align="center">4.6</td>
                                            <td>Os balcões encontram-se em condições adequadas de limpeza e manutenção?<asp:TextBox
                                                ID="txt4_6" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_6_Sim" runat="server" GroupName="grupo4_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_6_Nao" runat="server" GroupName="grupo4_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_6_NA" runat="server" GroupName="grupo4_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.1.6--%>

                                        <tr>
                                            <td align="center">4.7</td>
                                            <td>O PVPS é seguido corretamente (de acordo com o grau de maturação dos produtos) realizando a virada da vasca em todas as reposições? Anote os produtos irregulares.<asp:TextBox
                                                ID="txt4_7" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_7_Sim" runat="server" GroupName="grupo4_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_7_Nao" runat="server" GroupName="grupo4_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_7_NA" runat="server" GroupName="grupo4_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.1.7--%>

                                        <tr>
                                            <td align="center">4.8</td>
                                            <td>As bancas, vascas e o piso estão limpos?<asp:TextBox
                                                ID="txt4_8" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_8_Sim" runat="server" GroupName="grupo4_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_8_Nao" runat="server" GroupName="grupo4_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_8_NA" runat="server" GroupName="grupo4_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.1.8--%>

                                        <tr>
                                            <td align="center">4.9</td>
                                            <td>As bancas e vascas estão abastecidas sem ruptura?<asp:TextBox
                                                ID="txt4_9" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_9_Sim" runat="server" GroupName="grupo4_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_9_Nao" runat="server" GroupName="grupo4_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_9_NA" runat="server" GroupName="grupo4_9" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_9" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_9" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.1.9--%>

                                        <tr>
                                            <td align="center">4.10</td>
                                            <td>As balanças estão limpas e aferidas(realizar a medição)?
                                    <asp:TextBox
                                        ID="txt4_10" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_10_Sim" runat="server" GroupName="grupo4_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_10_Nao" runat="server" GroupName="grupo4_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_10_NA" runat="server" GroupName="grupo4_10" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_10" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_10" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.1.10--%>

                                        <tr>
                                            <td align="center">4.21</td>
                                            <td>Não foram encontradas frutas impróprias para o consumo.
                                    <asp:TextBox
                                        ID="txt4_21" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_21_Sim" runat="server" GroupName="grupo4_21" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_21_Nao" runat="server" GroupName="grupo4_21" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_21_NA" runat="server" GroupName="grupo4_21" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_21" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_21" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_21" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.1.21--%>

                                        <tr>
                                            <td align="center">4.22</td>
                                            <td>Não foram encontrados legumes impróprias para o consumo.
                                    <asp:TextBox
                                        ID="txt4_22" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_22_Sim" runat="server" GroupName="grupo4_22" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_22_Nao" runat="server" GroupName="grupo4_22" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_22_NA" runat="server" GroupName="grupo4_22" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_22" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_22" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_22" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.1.22--%>

                                        <tr>
                                            <td align="center">4.23</td>
                                            <td>Não foram encontradas verduras impróprias para o consumo.
                                    <asp:TextBox
                                        ID="txt4_23" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_23_Sim" runat="server" GroupName="grupo4_23" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_23_Nao" runat="server" GroupName="grupo4_23" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_23_NA" runat="server" GroupName="grupo4_23" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_23" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_23" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_23" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.1.23--%>


                                        <thead>
                                            <tr>
                                                <td></td>

                                                <td align="right">
                                                    <dx:ASPxButton ID="btnGrupo12" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>

                        <asp:Panel ID="panTitle13" runat="server" CssClass="pnl_Azul">
                            <div style="float: left;">4 - Área de Vendas - Todos os Perecíveis - Grupo 3 - (3 perguntas, 11 à 13) </div>
                            <div style="float: right;">
                                <asp:Label ID="lblTitle13" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div style="clear: both"></div>
                        </asp:Panel>
                        <asp:Panel ID="panDados13" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>
                                            <th align="center" scope="col" width="25px">PPO</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Todos os Perecíveis </b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">4.11</td>
                                            <td>O limite de exposição nos balcões (resfriados e congelados) é respeitado, de forma que a saída de ar refrigerado não esteja bloqueada?<asp:TextBox
                                                ID="txt4_11" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_11_Sim" runat="server" GroupName="grupo4_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_11_Nao" runat="server" GroupName="grupo4_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_11_NA" runat="server" GroupName="grupo4_11" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_11" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_11" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_11" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.1.11--%>

                                        <tr>
                                            <td align="center">4.12</td>
                                            <td>Os balcões encontram-se em condições adequadas de limpeza e manutenção?<asp:TextBox
                                                ID="txt4_12" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_12_Sim" runat="server" GroupName="grupo4_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_12_Nao" runat="server" GroupName="grupo4_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_12_NA" runat="server" GroupName="grupo4_12" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_12" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_12" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_12" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.1.12--%>

                                        <tr>
                                            <td align="center">4.13</td>
                                            <td>O PVPS é cumprido corretamente?
                                    <asp:TextBox
                                        ID="txt4_13" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_13_Sim" runat="server" GroupName="grupo4_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_13_Nao" runat="server" GroupName="grupo4_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_13_NA" runat="server" GroupName="grupo4_13" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_13" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_13" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_13" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>

                                            <%--As vascas estão abastecidas sem ruptura?--%>

                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.1.13--%>

                                        <thead>
                                            <tr>
                                                <td></td>

                                                <td align="right">
                                                    <dx:ASPxButton ID="btnGrupo13" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>

                        <asp:Panel ID="panTitle14" runat="server" CssClass="pnl_Azul">
                            <div style="float: left;">4 - Área de Vendas - Geral - Grupo 4 - (7 perguntas, 14 à 20) </div>
                            <div style="float: right;">
                                <asp:Label ID="lblTitle14" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div style="clear: both"></div>
                        </asp:Panel>
                        <asp:Panel ID="panDados14" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>
                                            <th align="center" scope="col" width="25px">PPO</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Geral </b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">4.14</td>
                                            <td>A área de vendas está organizada, sem caixas de produtos para serem abastecidos espalhados pelos corredores?<asp:TextBox
                                                ID="txt4_14" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_14_Sim" runat="server" GroupName="grupo4_14" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_14_Nao" runat="server" GroupName="grupo4_14" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_14_NA" runat="server" GroupName="grupo4_14" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_14" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_14" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_14" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>

                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.1.14--%>

                                        <tr>
                                            <td align="center">4.15</td>
                                            <td>As gôndolas se encontram devidamente abastecidas e organizadas?<asp:TextBox
                                                ID="txt4_15" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_15_Sim" runat="server" GroupName="grupo4_15" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_15_Nao" runat="server" GroupName="grupo4_15" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_15_NA" runat="server" GroupName="grupo4_15" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_15" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_15" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_15" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.1.15--%>

                                        <tr>
                                            <td align="center">4.16</td>
                                            <td>Os produtos estão armazenados de forma segura, não oferecendo riscos à segurança dos clientes?
                                    <asp:TextBox
                                        ID="txt4_16" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_16_Sim" runat="server" GroupName="grupo4_16" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_16_Nao" runat="server" GroupName="grupo4_16" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_16_NA" runat="server" GroupName="grupo4_16" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_16" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_16" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_16" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.1.16--%>

                                        <tr>
                                            <td align="center">4.17</td>
                                            <td>Os produtos auditados na amostra estão com o preço correto (sem divergências)? (Verificar circular de preços e relatar inconformidades)<asp:TextBox
                                                ID="txt4_17" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_17_Sim" runat="server" GroupName="grupo4_17" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_17_Nao" runat="server" GroupName="grupo4_17" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_17_NA" runat="server" GroupName="grupo4_17" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_17" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_17" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_17" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.1.17--%>

                                        <tr>
                                            <td align="center">4.18</td>
                                            <td>Os produtos auditados na amostra estão precificados?<asp:TextBox
                                                ID="txt4_18" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_18_Sim" runat="server" GroupName="grupo4_18" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_18_Nao" runat="server" GroupName="grupo4_18" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_18_NA" runat="server" GroupName="grupo4_18" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_18" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_18" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_18" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.1.18--%>

                                        <tr>
                                            <td align="center">4.19</td>
                                            <td>O PVPS é cumprido corretamente?
                                    <asp:TextBox
                                        ID="txt4_19" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_19_Sim" runat="server" GroupName="grupo4_19" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_19_Nao" runat="server" GroupName="grupo4_19" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_19_NA" runat="server" GroupName="grupo4_19" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_19" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_19" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_19" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.1.19--%>

                                        <tr>
                                            <td align="center">4.20</td>
                                            <td>Não foram encontrados produtos vencidos no chão de loja?<asp:TextBox
                                                ID="txt4_20" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_20_Sim" runat="server" GroupName="grupo4_20" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_20_Nao" runat="server" GroupName="grupo4_20" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd4_20_NA" runat="server" GroupName="grupo4_20" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto4_20" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile4_20" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto4_20" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 4.1.20--%>

                                        <thead>
                                            <tr>
                                                <td></td>

                                                <td align="right">
                                                    <dx:ASPxButton ID="btnGrupo14" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>

                        <asp:Panel ID="panTitle15" runat="server" CssClass="pnl_Azul">
                            <div style="float: left;">5 - Frente de Caixa - Grupo 1 - (12 perguntas, 1 à 12) </div>
                            <div style="float: right;">
                                <asp:Label ID="lblTitle15" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div style="clear: both"></div>
                        </asp:Panel>
                        <asp:Panel ID="panDados15" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>
                                            <th align="center" scope="col" width="25px">PPO</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Frente de Caixa </b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">5.1</td>
                                            <td>As planilhas de devoluções ou trocas dos setores de Eletrônicos, Têxtil e Bazar setão corretamente preenchidas e rubricadas pelo Gerente de Departamento ou Encarregado do Setor? (Conferir planilhas)<asp:TextBox
                                                ID="txt5_1" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_1_Sim" runat="server" GroupName="grupo5_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_1_Nao" runat="server" GroupName="grupo5_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_1_NA" runat="server" GroupName="grupo5_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto5_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile5_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto5_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 5.1.1--%>

                                        <tr>
                                            <td align="center">5.2</td>
                                            <td>Todas as mercadorias vindas de troca são recebidas com os cupons fiscais? (Conferir cupons vistados)<asp:TextBox
                                                ID="txt5_2" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_2_Sim" runat="server" GroupName="grupo5_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_2_Nao" runat="server" GroupName="grupo5_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_2_NA" runat="server" GroupName="grupo5_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto5_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile5_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto5_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 5.1.2--%>

                                        <tr>
                                            <td align="center">5.3</td>
                                            <td>As desistências dos clientes são devolvidas periodicamente aos seus setores?<asp:TextBox
                                                ID="txt5_3" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_3_Sim" runat="server" GroupName="grupo5_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_3_Nao" runat="server" GroupName="grupo5_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_3_NA" runat="server" GroupName="grupo5_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto5_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile5_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto5_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 5.1.3--%>

                                        <tr>
                                            <td align="center">5.4</td>
                                            <td>As passagens dos caixas fechados estão bloqueadas?
                                    <asp:TextBox
                                        ID="txt5_4" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_4_Sim" runat="server" GroupName="grupo5_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_4_Nao" runat="server" GroupName="grupo5_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_4_NA" runat="server" GroupName="grupo5_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto5_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile5_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto5_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 5.1.4--%>

                                        <tr>
                                            <td align="center">5.5</td>
                                            <td>Os produtos com divergências de preço são registrados em planilha específica e informados aos responsáveis dos setores? (Conferir Planilhas)<asp:TextBox
                                                ID="txt5_5" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_5_Sim" runat="server" GroupName="grupo5_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_5_Nao" runat="server" GroupName="grupo5_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_5_NA" runat="server" GroupName="grupo5_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto5_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile5_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto5_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 5.1.5--%>

                                        <tr>
                                            <td align="center">5.6</td>
                                            <td>As reuniões de abertura com foco em Prevenção de Perdas foram aplicadas e registrados em planilha específica?<asp:TextBox
                                                ID="txt5_6" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_6_Sim" runat="server" GroupName="grupo5_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_6_Nao" runat="server" GroupName="grupo5_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_6_NA" runat="server" GroupName="grupo5_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto5_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile5_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto5_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 5.1.6--%>

                                        <tr>
                                            <td align="center">5.7</td>
                                            <td>Os operadores estão atentos as características(sabores, fragrâncias, etc) dos produtos registrados que são similares NO MOMENTO DO REGISTRO NO CHECKOUT?<asp:TextBox
                                                ID="txt5_7" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_7_Sim" runat="server" GroupName="grupo5_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_7_Nao" runat="server" GroupName="grupo5_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_7_NA" runat="server" GroupName="grupo5_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto5_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile5_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto5_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 5.1.7--%>

                                        <tr>
                                            <td align="center">5.8</td>
                                            <td>Os operadores estão atentos aos grandes volumes e possíveis itens nas partes baixas dos carrinhos? (Verificar etiquetas de OK)<asp:TextBox
                                                ID="txt5_8" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_8_Sim" runat="server" GroupName="grupo5_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_8_Nao" runat="server" GroupName="grupo5_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_8_NA" runat="server" GroupName="grupo5_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto5_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile5_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto5_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 5.1.8--%>

                                        <tr>
                                            <td align="center">5.9</td>
                                            <td>O procedimento para a venda de cigarros (Fiscal de Caixa entregar o cigarro ao cliente) está se cumprindo corretamente?<asp:TextBox
                                                ID="txt5_9" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_9_Sim" runat="server" GroupName="grupo5_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_9_Nao" runat="server" GroupName="grupo5_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_9_NA" runat="server" GroupName="grupo5_9" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto5_9" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile5_9" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto5_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 5.1.9--%>

                                        <tr>
                                            <td align="center">5.10</td>
                                            <td>Os displays e armários de cigarros encontram-se fechados com cadeado/chave?<asp:TextBox
                                                ID="txt5_10" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_10_Sim" runat="server" GroupName="grupo5_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_10_Nao" runat="server" GroupName="grupo5_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_10_NA" runat="server" GroupName="grupo5_10" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="IimgFoto5_10" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile5_10" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto5_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 5.1.10--%>

                                        <tr>
                                            <td align="center">5.11</td>
                                            <td>Os produtos com entrega em domicílio estão em local apropriado e seguro?<asp:TextBox
                                                ID="txt5_11" runat="server" Height="50" TextMode="MultiLine" Width="500"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_11_Sim" runat="server" GroupName="grupo5_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_11_Nao" runat="server" GroupName="grupo5_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_11_NA" runat="server" GroupName="grupo5_11" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto5_11" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile5_11" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto5_11" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 5.1.11--%>

                                        <tr>
                                            <td align="center">5.12</td>
                                            <td>Os carrinhos e cestas de compras encontram-se em condições adequadas de uso e limpos?<asp:TextBox
                                                ID="txt5_12" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_12_Sim" runat="server" GroupName="grupo5_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_12_Nao" runat="server" GroupName="grupo5_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd5_12_NA" runat="server" GroupName="grupo5_12" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto5_12" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile5_12" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto5_12" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 5.1.12--%>

                                        <thead>
                                            <tr>
                                                <td></td>

                                                <td align="right">
                                                    <dx:ASPxButton ID="btnGrupo15" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>

                        <asp:Panel ID="panTitle16" runat="server" CssClass="pnl_Azul">
                            <div style="float: left;">6 - Administrativo - Grupo 1 - (6 perguntas, 1 à 9) </div>
                            <div style="float: right;">
                                <asp:Label ID="lblTitle16" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div style="clear: both"></div>
                        </asp:Panel>
                        <asp:Panel ID="panDados16" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>
                                            <th align="center" scope="col" width="25px">PPO</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Administrativo </b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">6.1</td>
                                            <td>Os lançamentos da Agenda 23 (quebra conhecida) são realizados diariamente para os perecíveis?<asp:TextBox
                                                ID="txt6_1" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_1_Sim" runat="server" GroupName="grupo6_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_1_Nao" runat="server" GroupName="grupo6_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_1_NA" runat="server" GroupName="grupo6_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto6_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile6_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto6_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 6.1.1--%>

                                        <tr>
                                            <td align="center">6.2</td>
                                            <td>Os lançamentos da Agenda 23 são analisados diariamente pelos Encarregados e Gerentes de Setor? (Verificar assinaturas no relatório)<asp:TextBox
                                                ID="txt6_2" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_2_Sim" runat="server" GroupName="grupo6_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_2_Nao" runat="server" GroupName="grupo6_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_2_NA" runat="server" GroupName="grupo6_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto6_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile6_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto6_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 6.1.2--%>

                                        <tr>
                                            <td align="center">6.3</td>
                                            <td>Após serem registradas, as mercadorias que possuem troca são separadas por fornecedor para transferência? (Conferir relatórios)<asp:TextBox
                                                ID="txt6_3" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_3_Sim" runat="server" GroupName="grupo6_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_3_Nao" runat="server" GroupName="grupo6_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_3_NA" runat="server" GroupName="grupo6_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto6_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile6_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto6_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 6.1.3--%>

                                        <tr>
                                            <td align="center">6.4</td>
                                            <td>As guias de movimentação interna (Ag 23, 69, 245, 705) são utilizadas corretamente, e os dados são lançados no sistema diariamente? (Verificar se possuem todas as assinaturas)
                                    <asp:TextBox
                                        ID="txt6_4" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_4_Sim" runat="server" GroupName="grupo6_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_4_Nao" runat="server" GroupName="grupo6_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_4_NA" runat="server" GroupName="grupo6_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto6_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile6_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto6_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 6.1.4--%>

                                        <tr>
                                            <td align="center">6.5</td>
                                            <td>São lançadas diariamente as movimentações de trocas e estornos de caixa na tesouraria?<asp:TextBox
                                                ID="txt6_5" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_5_Sim" runat="server" GroupName="grupo6_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_5_Nao" runat="server" GroupName="grupo6_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_5_NA" runat="server" GroupName="grupo6_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto6_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile6_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto6_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 6.1.5--%>

                                        <tr>
                                            <td align="center">6.6</td>
                                            <td>Não foram encontrados objetos estranhos ao ambiente da tesouraria (itens de uso pessoal, bolsas, carteiras, etc.)<asp:TextBox
                                                ID="txt6_6" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_6_Sim" runat="server" GroupName="grupo6_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_6_Nao" runat="server" GroupName="grupo6_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_6_NA" runat="server" GroupName="grupo6_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto6_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile6_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto6_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 6.1.6--%>

                                        <tr>
                                            <td align="center">6.7</td>
                                            <td>Esta sendo cumprido o processo de check list da Informática / Frente de Caixa?<asp:TextBox
                                                ID="txt6_7" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_7_Sim" runat="server" GroupName="grupo6_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_7_Nao" runat="server" GroupName="grupo6_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_7_NA" runat="server" GroupName="grupo6_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto6_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile6_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto6_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 6.1.7--%>

                                        <tr>
                                            <td align="center">6.8</td>
                                            <td>Os banheiros de Clientes se encontra limpo e organizado?<asp:TextBox
                                                ID="txt6_8" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_8_Sim" runat="server" GroupName="grupo6_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_8_Nao" runat="server" GroupName="grupo6_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_8_NA" runat="server" GroupName="grupo6_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto6_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile6_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto6_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 6.1.8--%>

                                        <tr>
                                            <td align="center">6.9</td>
                                            <td>Os displays de papel higiênico e sabonete estão abastecidos?<asp:TextBox
                                                ID="txt6_9" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_9_Sim" runat="server" GroupName="grupo6_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_9_Nao" runat="server" GroupName="grupo6_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd6_9_NA" runat="server" GroupName="grupo6_9" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto6_9" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile6_9" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto6_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 6.1.9--%>


                                        <thead>
                                            <tr>
                                                <td></td>
                                                <td align="right">
                                                    <dx:ASPxButton ID="btnGrupo16" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>

                        <asp:Panel ID="panTitle17" runat="server" CssClass="pnl_Azul">
                            <div style="float: left;">7 - Segurança Patrimonial - Grupo 1 - (12 perguntas, 1 à 18) </div>
                            <div style="float: right;">
                                <asp:Label ID="lblTitle17" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div style="clear: both"></div>
                        </asp:Panel>
                        <asp:Panel ID="panDados17" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>
                                            <th align="center" scope="col" width="25px">PPO</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Segurança Patrimonial </b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">7.1</td>
                                            <td>Os PAR da seção de eletro são entregues para o cliente apenas APÓS O PAGAMENTO no balcão ou com o cupom PDV?<asp:TextBox
                                                ID="txt7_1" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_1_Sim" runat="server" GroupName="grupo7_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_1_Nao" runat="server" GroupName="grupo7_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_1_NA" runat="server" GroupName="grupo7_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.1.1--%>

                                        <tr>
                                            <td align="center">7.2</td>
                                            <td>Os procedimentos do Pódium com relação aos produtos de Eletro, são cumpridos?<asp:TextBox
                                                ID="txt7_2" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_2_Sim" runat="server" GroupName="grupo7_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_2_Nao" runat="server" GroupName="grupo7_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_2_NA" runat="server" GroupName="grupo7_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.1.2--%>

                                        <tr>
                                            <td align="center">7.3</td>
                                            <td>Os equipamentos do Pódium estão funcionando?<asp:TextBox
                                                ID="txt7_3" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_3_Sim" runat="server" GroupName="grupo7_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_3_Nao" runat="server" GroupName="grupo7_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_3_NA" runat="server" GroupName="grupo7_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.1.3--%>

                                        <tr>
                                            <td align="center">7.4</td>
                                            <td>O controle de temperatura é efetuado pelo Fiscal de Loja, as divergencias são passadas a Gerência para solução imediata?<asp:TextBox
                                                ID="txt7_4" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_4_Sim" runat="server" GroupName="grupo7_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_4_Nao" runat="server" GroupName="grupo7_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_4_NA" runat="server" GroupName="grupo7_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.1.4--%>

                                        <tr>
                                            <td align="center">7.5</td>
                                            <td>As Movimetações internas, são devidamente conferidas e os produtos são etiquetados com a etiqueta de consumo interno?<asp:TextBox
                                                ID="txt7_5" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_5_Sim" runat="server" GroupName="grupo7_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_5_Nao" runat="server" GroupName="grupo7_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_5_NA" runat="server" GroupName="grupo7_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.1.5--%>

                                        <tr>
                                            <td align="center">7.6</td>
                                            <td>As auditorias de alarmes estão sendo aplicadas e devidamente relatadas aos setores responsáveis?<asp:TextBox
                                                ID="txt7_6" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_6_Sim" runat="server" GroupName="grupo7_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_6_Nao" runat="server" GroupName="grupo7_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_6_NA" runat="server" GroupName="grupo7_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.1.6--%>

                                        <tr>
                                            <td align="center">7.7</td>
                                            <td>Há reuniões internas com foco em Prevenção de Perdas para os funcionários de todas as seções?(Verificar atas e/ou listas de presença)<asp:TextBox
                                                ID="txt7_7" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_7_Sim" runat="server" GroupName="grupo7_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_7_Nao" runat="server" GroupName="grupo7_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_7_NA" runat="server" GroupName="grupo7_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.1.7--%>

                                        <tr>
                                            <td align="center">7.8</td>
                                            <td>Os equipamentos de segurança da loja (antenas, desativador de sensores, CFTV, etc) são testados diariamente? (QUANDO APLICÁVEL)<asp:TextBox
                                                ID="txt7_8" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_8_Sim" runat="server" GroupName="grupo7_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_8_Nao" runat="server" GroupName="grupo7_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_8_NA" runat="server" GroupName="grupo7_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.1.8--%>

                                        <tr>
                                            <td align="center">7.9</td>
                                            <td>As portas de emergência estão desobstruídas?<asp:TextBox
                                                ID="txt7_9" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_9_Sim" runat="server" GroupName="grupo7_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_9_Nao" runat="server" GroupName="grupo7_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_9_NA" runat="server" GroupName="grupo7_9" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_9" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_9" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.1.9--%>

                                        <tr>
                                            <td align="center">7.10</td>
                                            <td>O Operador de CFTV se encontra no setor 100% do tempo?<asp:TextBox
                                                ID="txt7_10" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_10_Sim" runat="server" GroupName="grupo7_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_10_Nao" runat="server" GroupName="grupo7_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_10_NA" runat="server" GroupName="grupo7_10" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_10" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_10" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.1.10--%>

                                        <tr>
                                            <td align="center">7.11</td>
                                            <td>O Checklist de Fechamento e Abertura de Segurança e Plantão de Loja estão sendo realizados? (conferir atas)<asp:TextBox
                                                ID="txt7_11" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_11_Sim" runat="server" GroupName="grupo7_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_11_Nao" runat="server" GroupName="grupo7_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_11_NA" runat="server" GroupName="grupo7_11" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_11" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_11" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_11" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.1.11--%>

                                        <tr>
                                            <td align="center">7.12</td>
                                            <td>Os extintores estão desobstruídos, em locais identificados e de fácil acesso e dentro da validade<asp:TextBox
                                                ID="txt7_12" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_12_Sim" runat="server" GroupName="grupo7_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_12_Nao" runat="server" GroupName="grupo7_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_12_NA" runat="server" GroupName="grupo7_12" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_12" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_12" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_12" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.1.12--%>

                                        <tr>
                                            <td align="center">7.13</td>
                                            <td>Está sendo realizado o lançamento de furtos e degustação de loja/depósito diariamente?<asp:TextBox
                                                ID="txt7_13" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_13_Sim" runat="server" GroupName="grupo7_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_13_Nao" runat="server" GroupName="grupo7_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_13_NA" runat="server" GroupName="grupo7_13" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_13" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_13" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_13" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.7.13--%>

                                        <tr>
                                            <td align="center">7.14</td>
                                            <td>A central de alarme de incêndio está operanti?<asp:TextBox
                                                ID="txt7_14" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_14_Sim" runat="server" GroupName="grupo7_14" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_14_Nao" runat="server" GroupName="grupo7_14" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_14_NA" runat="server" GroupName="grupo7_14" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_14" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_14" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_14" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.7.14--%>

                                        <tr>
                                            <td align="center">7.15</td>
                                            <td>Locais onde há piso molhado com frequência?<asp:TextBox
                                                ID="txt7_15" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_15_Sim" runat="server" GroupName="grupo7_15" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_15_Nao" runat="server" GroupName="grupo7_15" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_15_NA" runat="server" GroupName="grupo7_15" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_15" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_15" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_15" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.7.15--%>

                                        <tr>
                                            <td align="center">7.16</td>
                                            <td>As zeladoras estão usando a placa de piso molhado?<asp:TextBox
                                                ID="txt7_16" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_16_Sim" runat="server" GroupName="grupo7_16" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_16_Nao" runat="server" GroupName="grupo7_16" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_16_NA" runat="server" GroupName="grupo7_16" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_16" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_16" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_16" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.7.16--%>

                                        <tr>
                                            <td align="center">7.17</td>
                                            <td>O teste de Botão de Pânico está sendo realizado 1 vez por semana? (conferir relátorio)<asp:TextBox
                                                ID="txt7_17" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_17_Sim" runat="server" GroupName="grupo7_17" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_17_Nao" runat="server" GroupName="grupo7_17" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_17_NA" runat="server" GroupName="grupo7_17" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_17" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_17" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_17" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.7.17--%>

                                        <tr>
                                            <td align="center">7.18</td>
                                            <td>É realizada a analise das agendas 23, 51 e 52 juntamente com o Encarregado de Prevenção de Perdas?<asp:TextBox
                                                ID="txt7_18" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_18_Sim" runat="server" GroupName="grupo7_18" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_18_Nao" runat="server" GroupName="grupo7_18" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd7_18_NA" runat="server" GroupName="grupo7_18" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto7_18" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile7_18" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto7_18" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 7.7.18--%>

                                        <thead>
                                            <tr>
                                                <td></td>
                                                <td align="right">
                                                    <dx:ASPxButton ID="btnGrupo17" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>

                        <asp:Panel ID="panTitle18" runat="server" CssClass="pnl_Azul">
                            <div style="float: left;">8 - HSA - Grupo 1 - Açougue - (14 perguntas, 1 à 14) </div>
                            <div style="float: right;">
                                <asp:Label ID="lblTitle18" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div style="clear: both"></div>
                        </asp:Panel>
                        <asp:Panel ID="panDados18" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>
                                            <th align="center" scope="col" width="25px">PPO</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Açougue  </b></h2>
                                                    <b>(Barreira sanitária, Laboratório, Área de Atendimento, Área de Venda, Câmara)</b>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">8.1</td>
                                            <td>O ambiente está limpo, organizado, sem acúmulos de água no piso ou lixo espalhado pelo setor?<asp:TextBox
                                                ID="txt8_1" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_1_Sim" runat="server" GroupName="grupo8_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_1_Nao" runat="server" GroupName="grupo8_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_1_NA" runat="server" GroupName="grupo8_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.1.1--%>

                                        <tr>
                                            <td align="center">8.2</td>
                                            <td>A planilha de higienização do setor está sendo preenchida corretamente e na frequência adequada?<asp:TextBox
                                                ID="txt8_2" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_2_Sim" runat="server" GroupName="grupo8_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_2_Nao" runat="server" GroupName="grupo8_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_2_NA" runat="server" GroupName="grupo8_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.1.2--%>

                                        <tr>
                                            <td align="center">8.3</td>
                                            <td>As papeleiras, saboneteiras e lixeiras estão limpas, íntegras e corretamente abastecidas?<asp:TextBox
                                                ID="txt8_3" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_3_Sim" runat="server" GroupName="grupo8_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_3_Nao" runat="server" GroupName="grupo8_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_3_NA" runat="server" GroupName="grupo8_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.1.3--%>

                                        <tr>
                                            <td align="center">8.4</td>
                                            <td>O local de manipulação (mesas) e os utensílios utilizados (facas, chairas e tábuas) estão limpos e íntegros? Os utensílios estão armazenados em local adequado?<asp:TextBox
                                                ID="txt8_4" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_4_Sim" runat="server" GroupName="grupo8_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_4_Nao" runat="server" GroupName="grupo8_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_4_NA" runat="server" GroupName="grupo8_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.1.4--%>

                                        <tr>
                                            <td align="center">8.5</td>
                                            <td>Os equipamentos (moedor, serra-fita, balcões)  esta sendo bem higienizados, com frequência adequada e de forma a retirar completamente os resíduos (sem sujidades antigas)? O moedor, quando não está em uso, está com as aberturas protegidas?<asp:TextBox
                                                ID="txt8_5" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_5_Sim" runat="server" GroupName="grupo8_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_5_Nao" runat="server" GroupName="grupo8_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_5_NA" runat="server" GroupName="grupo8_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.1.5--%>

                                        <tr>
                                            <td align="center">8.6</td>
                                            <td>O local de armazenamento de embalagens é mantido limpo, com as portas fechadas, sem embalagens sujas ou objetos estranhos?<asp:TextBox
                                                ID="txt8_6" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_6_Sim" runat="server" GroupName="grupo8_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_6_Nao" runat="server" GroupName="grupo8_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_6_NA" runat="server" GroupName="grupo8_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.1.6--%>

                                        <tr>
                                            <td align="center">8.7</td>
                                            <td>Os absorventes de carne estão armazenados em local limpo e protegido, exclusivo para esta finalidade?<asp:TextBox
                                                ID="txt8_7" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_7_Sim" runat="server" GroupName="grupo8_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_7_Nao" runat="server" GroupName="grupo8_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_7_NA" runat="server" GroupName="grupo8_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.1.7--%>

                                        <tr>
                                            <td align="center">8.8</td>
                                            <td>Não há presença de caixas de papelão ou fardos de embalagens sobre as bancadas de manipulação ou em contato direto com os alimentos?<asp:TextBox
                                                ID="txt8_8" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_8_Sim" runat="server" GroupName="grupo8_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_8_Nao" runat="server" GroupName="grupo8_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_8_NA" runat="server" GroupName="grupo8_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.1.8--%>

                                        <tr>
                                            <td align="center">8.9</td>
                                            <td>O transporte e o armazenamento dos alimentos é realizado de forma adequada (carrinhos ou cubas exclusivos do setor; armazenamento em caixas limpas, uso de caixas não vazadas para alimentos em processo de manipulação)?
                                    <asp:TextBox
                                        ID="txt8_9" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_9_Sim" runat="server" GroupName="grupo8_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_9_Nao" runat="server" GroupName="grupo8_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_9_NA" runat="server" GroupName="grupo8_9" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_9" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_9" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.1.9--%>

                                        <tr>
                                            <td align="center">8.10</td>
                                            <td>A troca de preço está sendo feita de maneira adequada? 
                                    <asp:TextBox
                                        ID="txt8_10" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_10_Sim" runat="server" GroupName="grupo8_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_10_Nao" runat="server" GroupName="grupo8_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_10_NA" runat="server" GroupName="grupo8_10" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_10" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_10" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.1.10--%>

                                        <tr>
                                            <td align="center">8.11</td>
                                            <td>A produção armazenada está de acordo com a venda diária (a produção estocada na câmara foi manipulada no dia ou no máximo no dia anterior)?
                                    <asp:TextBox
                                        ID="txt8_11" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_11_Sim" runat="server" GroupName="grupo8_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_11_Nao" runat="server" GroupName="grupo8_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_11_NA" runat="server" GroupName="grupo8_11" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_11" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_11" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_11" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.1.11--%>

                                        <tr>
                                            <td align="center">8.12</td>
                                            <td>A carne moída é feita com retalhos que apresentam qualidade satisfatória (cor e odor), não havendo reprocessamento da mesma após tempo de exposição?<asp:TextBox
                                                ID="txt8_12" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_12_Sim" runat="server" GroupName="grupo8_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_12_Nao" runat="server" GroupName="grupo8_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_12_NA" runat="server" GroupName="grupo8_12" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_12" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_12" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_12" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.1.12--%>

                                        <tr>
                                            <td align="center">8.13</td>
                                            <td>O tempo mininimo de exposição para produtos perecíveis que estão fora da camara (maximo 1 hora) esta sendo respeitado ?
                                    <asp:TextBox
                                        ID="txt8_13" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_13_Sim" runat="server" GroupName="grupo8_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_13_Nao" runat="server" GroupName="grupo8_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_13_NA" runat="server" GroupName="grupo8_13" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_13" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_13" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_13" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.1.13--%>

                                        <tr>
                                            <td align="center">8.14</td>
                                            <td>Os equipamentos de produtos de Limpeza estão íntegros e em bom estado de conservação (Bombas Pressurizadoras, Mangueiras, etc.)
                                    <asp:TextBox
                                        ID="txt8_14" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_14_Sim" runat="server" GroupName="grupo8_14" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_14_Nao" runat="server" GroupName="grupo8_14" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd8_14_NA" runat="server" GroupName="grupo8_14" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto8_14" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile8_14" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto8_14" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 8.1.14--%>

                                        <thead>
                                            <tr>
                                                <td></td>
                                                <td align="right">
                                                    <dx:ASPxButton ID="btnGrupo18" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>

                        <asp:Panel ID="panTitle19" runat="server" CssClass="pnl_Azul">
                            <div style="float: left;">9 - HSA - Grupo 2 - Fiambreria - (13 perguntas, 1 à 13) </div>
                            <div style="float: right;">
                                <asp:Label ID="lblTitle19" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div style="clear: both"></div>
                        </asp:Panel>
                        <asp:Panel ID="panDados19" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>
                                            <th align="center" scope="col" width="25px">PPO</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>FIAMBRERIA </b></h2>
                                                    <b>(Laboratório, Área de Atendimento, Área de Venda, Câmara)</b>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">9.1</td>
                                            <td>O ambiente está limpo, organizado, sem acúmulos de água no piso ou lixo espalhado pelo setor? 
                                    <asp:TextBox
                                        ID="txt9_1" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_1_Sim" runat="server" GroupName="grupo9_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_1_Nao" runat="server" GroupName="grupo9_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_1_NA" runat="server" GroupName="grupo9_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.1.1--%>

                                        <tr>
                                            <td align="center">9.2</td>
                                            <td>A planilha de higienização do setor está sendo preenchida corretamente e na frequência adequada?<asp:TextBox
                                                ID="txt9_2" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_2_Sim" runat="server" GroupName="grupo9_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_2_Nao" runat="server" GroupName="grupo9_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_2_NA" runat="server" GroupName="grupo9_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.1.2--%>

                                        <tr>
                                            <td align="center">9.3</td>
                                            <td>As papeleiras, saboneteiras e lixeiras estão limpas, íntegras e corretamente abastecidas?<asp:TextBox
                                                ID="txt9_3" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_3_Sim" runat="server" GroupName="grupo9_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_3_Nao" runat="server" GroupName="grupo9_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_3_NA" runat="server" GroupName="grupo9_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.1.3--%>

                                        <tr>
                                            <td align="center">9.4</td>
                                            <td>O local de manipulação (mesas) e os utensílios utilizados estão limpos e íntegros? Os utensílios estão armazenados em local adequado?<asp:TextBox
                                                ID="txt9_4" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_4_Sim" runat="server" GroupName="grupo9_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_4_Nao" runat="server" GroupName="grupo9_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_4_NA" runat="server" GroupName="grupo9_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.1.4--%>

                                        <tr>
                                            <td align="center">9.5</td>
                                            <td>Os equipamentos (fatiadoras, floculadora, máquina de vácuo) estão sendo bem higienizados, com frequência adequada e de forma a retirar completamente os resíduos (sem sujidades antigas)?
                                    <asp:TextBox
                                        ID="txt9_5" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_5_Sim" runat="server" GroupName="grupo9_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_5_Nao" runat="server" GroupName="grupo9_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_5_NA" runat="server" GroupName="grupo9_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.1.5--%>

                                        <tr>
                                            <td align="center">9.6</td>
                                            <td>As fatiadoras estão sendo utilizadas de forma a evitar a contaminação entre produtos de origens diferentes (queijos e vermelhos)?<asp:TextBox
                                                ID="txt9_6" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_6_Sim" runat="server" GroupName="grupo9_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_6_Nao" runat="server" GroupName="grupo9_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_6_NA" runat="server" GroupName="grupo9_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.1.6--%>

                                        <tr>
                                            <td align="center">9.7</td>
                                            <td>O local de armazenamento de embalagens é mantido limpo, com as portas fechadas, sem embalagens sujas ou objetos estranhos?<asp:TextBox
                                                ID="txt9_7" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_7_Sim" runat="server" GroupName="grupo9_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_7_Nao" runat="server" GroupName="grupo9_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_7_NA" runat="server" GroupName="grupo9_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.1.7--%>

                                        <tr>
                                            <td align="center">9.8</td>
                                            <td>Não há presença de caixas de papelão ou fardos de embalagens sobre as bancadas de manipulação ou em contato direto com os alimentos?<asp:TextBox
                                                ID="txt9_8" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_8_Sim" runat="server" GroupName="grupo9_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_8_Nao" runat="server" GroupName="grupo9_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_8_NA" runat="server" GroupName="grupo9_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.1.8--%>

                                        <tr>
                                            <td align="center">9.9</td>
                                            <td>O transporte e o armazenamento dos alimentos é realizado de forma adequada (carrinhos ou cubas exclusivos do setor; armazenamento em caixas limpas)?<asp:TextBox
                                                ID="txt9_9" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_9_Sim" runat="server" GroupName="grupo9_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_9_Nao" runat="server" GroupName="grupo9_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_9_NA" runat="server" GroupName="grupo9_9" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_9" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_9" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.1.9--%>

                                        <tr>
                                            <td align="center">9.10</td>
                                            <td>A troca de preço está sendo feita de maneira adequada?  
                                    <asp:TextBox
                                        ID="txt9_10" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_10_Sim" runat="server" GroupName="grupo9_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_10_Nao" runat="server" GroupName="grupo9_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_10_NA" runat="server" GroupName="grupo9_10" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_10" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_10" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.1.10--%>

                                        <tr>
                                            <td align="center">9.11</td>
                                            <td>A produção armazenada está de acordo com a venda diária (a produção estocada na câmara foi manipulada no dia ou no máximo no dia anterior)?
                                    <asp:TextBox
                                        ID="txt9_11" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_11_Sim" runat="server" GroupName="grupo9_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_11_Nao" runat="server" GroupName="grupo9_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_11_NA" runat="server" GroupName="grupo9_11" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_11" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_11" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_11" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.1.11--%>

                                        <tr>
                                            <td align="center">9.12</td>
                                            <td>O tempo mininimo de exposição para produtos perecíveis que estão fora da camara (maximo 1 hora) esta sendo respeitado ?
                                    <asp:TextBox
                                        ID="txt9_12" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_12_Sim" runat="server" GroupName="grupo9_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_12_Nao" runat="server" GroupName="grupo9_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_12_NA" runat="server" GroupName="grupo9_12" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_12" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_12" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_12" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.1.12--%>

                                        <tr>
                                            <td align="center">9.13</td>
                                            <td>Os equipamentos de produtos de Limpeza estão íntegros e em bom estado de conservação (Bombas Pressurizadoras, Mangueiras, etc.)<asp:TextBox
                                                ID="txt9_13" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_13_Sim" runat="server" GroupName="grupo9_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_13_Nao" runat="server" GroupName="grupo9_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd9_13_NA" runat="server" GroupName="grupo9_13" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto9_13" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile9_13" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto9_13" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 9.1.13--%>

                                        <thead>
                                            <tr>
                                                <td></td>
                                                <td align="right">
                                                    <dx:ASPxButton ID="btnGrupo19" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>

                        <asp:Panel ID="panTitle20" runat="server" CssClass="pnl_Azul">
                            <div style="float: left;">10 - HSA - Grupo 3 - Cozinha - (14 perguntas, 1 à 14) </div>
                            <div style="float: right;">
                                <asp:Label ID="lblTitle20" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div style="clear: both"></div>
                        </asp:Panel>
                        <asp:Panel ID="panDados20" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>
                                            <th align="center" scope="col" width="25px">PPO</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Cozinha </b></h2>
                                                    <b>(Laboratório, Área de Atendimento, Área de Venda, Câmara, Copa)</b>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">10.1</td>
                                            <td>O ambiente está limpo, organizado, sem acúmulos de água no piso ou lixo espalhado pelo setor? 
                                    <asp:TextBox
                                        ID="txt10_1" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_1_Sim" runat="server" GroupName="grupo10_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_1_Nao" runat="server" GroupName="grupo10_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_1_NA" runat="server" GroupName="grupo10_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto10_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile10_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto10_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 10.1.1--%>

                                        <tr>
                                            <td align="center">10.2</td>
                                            <td>A planilha de higienização do setor está sendo preenchida corretamente e na frequência adequada?<asp:TextBox
                                                ID="txt10_2" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_2_Sim" runat="server" GroupName="grupo10_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_2_Nao" runat="server" GroupName="grupo10_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_2_NA" runat="server" GroupName="grupo10_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto10_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile10_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto10_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 10.1.2--%>

                                        <tr>
                                            <td align="center">10.3</td>
                                            <td>As papeleiras, saboneteiras e lixeiras estão limpas, íntegras e corretamente abastecidas??<asp:TextBox
                                                ID="txt10_3" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_3_Sim" runat="server" GroupName="grupo10_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_3_Nao" runat="server" GroupName="grupo10_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_3_NA" runat="server" GroupName="grupo10_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto10_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile10_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto10_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 10.1.3--%>

                                        <tr>
                                            <td align="center">10.4</td>
                                            <td>O local de manipulação (mesas) e os utensílios utilizados estão limpos e íntegros? Os utensílios estão armazenados em local adequado?<asp:TextBox
                                                ID="txt10_4" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_4_Sim" runat="server" GroupName="grupo10_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_4_Nao" runat="server" GroupName="grupo10_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_4_NA" runat="server" GroupName="grupo10_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto10_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile10_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto10_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 10.1.4--%>

                                        <tr>
                                            <td align="center">10.5</td>
                                            <td>Os equipamentos (geladeira, multiprocessador, fogão, forno, fritadeira, liquidificador, suqueira, buffet) estão sendo bem higienizados, com frequência adequada e de forma a retirar completamente os resíduos (sem sujidades antigas)?
                                    <asp:TextBox
                                        ID="txt10_5" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_5_Sim" runat="server" GroupName="grupo10_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_5_Nao" runat="server" GroupName="grupo10_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_5_NA" runat="server" GroupName="grupo10_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto10_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile10_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto10_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 10.1.5--%>

                                        <tr>
                                            <td align="center">10.6</td>
                                            <td>A geladeira está organizada de forma a evitar contaminação cruzada entre alimentos (produtos crus para baixo; prontos para cima)?<asp:TextBox
                                                ID="txt10_6" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_6_Sim" runat="server" GroupName="grupo10_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_6_Nao" runat="server" GroupName="grupo10_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_6_NA" runat="server" GroupName="grupo10_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto10_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile10_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto10_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 10.1.6--%>

                                        <tr>
                                            <td align="center">10.7</td>
                                            <td>O local de armazenamento de embalagens é mantido limpo, com as portas fechadas, sem embalagens sujas ou objetos estranhos?<asp:TextBox
                                                ID="txt10_7" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_7_Sim" runat="server" GroupName="grupo10_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_7_Nao" runat="server" GroupName="grupo10_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_7_NA" runat="server" GroupName="grupo10_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto10_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile10_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto10_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 10.1.7--%>

                                        <tr>
                                            <td align="center">10.8</td>
                                            <td>Não há presença de caixas de papelão ou fardos de embalagens sobre as bancadas de manipulação ou em contato direto com os alimentos?<asp:TextBox
                                                ID="txt10_8" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_8_Sim" runat="server" GroupName="grupo10_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_8_Nao" runat="server" GroupName="grupo10_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_8_NA" runat="server" GroupName="grupo10_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto10_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile10_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto10_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 10.1.8--%>

                                        <tr>
                                            <td align="center">10.9</td>
                                            <td>O transporte e o armazenamento dos alimentos é realizado de forma adequada (carrinhos ou cubas exclusivos do setor; armazenamento em caixas limpas)?<asp:TextBox
                                                ID="txt10_9" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_9_Sim" runat="server" GroupName="grupo10_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_9_Nao" runat="server" GroupName="grupo10_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_9_NA" runat="server" GroupName="grupo10_9" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto10_9" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile10_9" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto10_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 10.1.9--%>

                                        <tr>
                                            <td align="center">10.10</td>
                                            <td>A coleta de amostras de todas as refeições preparadas é realizada diariamente (200g de cada alimento)? São mantidas armazenadas por 3 dias? 
                                    <asp:TextBox
                                        ID="txt10_10" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_10_Sim" runat="server" GroupName="grupo10_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_10_Nao" runat="server" GroupName="grupo10_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_10_NA" runat="server" GroupName="grupo10_10" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto10_10" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile10_10" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto10_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 10.1.10--%>

                                        <tr>
                                            <td align="center">10.11</td>
                                            <td>O tempo mininimo de exposição para produtos perecíveis e as preparações prontas que estão fora da camara (maximo 1 hora) esta sendo respeitado ? 
                                    <asp:TextBox
                                        ID="txt10_11" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_11_Sim" runat="server" GroupName="grupo10_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_11_Nao" runat="server" GroupName="grupo10_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_11_NA" runat="server" GroupName="grupo10_11" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto10_11" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile10_11" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto10_11" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 10.1.11--%>

                                        <tr>
                                            <td align="center">10.12</td>
                                            <td>Está sendo realizado o controle de temperatura diário dos alimentos expostos no refeitório e no balcão da rotisseria? A planilha está sendo preenchida corretamente?<asp:TextBox
                                                ID="txt10_12" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_12_Sim" runat="server" GroupName="grupo10_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_12_Nao" runat="server" GroupName="grupo10_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_12_NA" runat="server" GroupName="grupo10_12" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto10_12" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile10_12" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto10_12" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 10.1.12--%>

                                        <tr>
                                            <td align="center">10.13</td>
                                            <td>A higienização das hortifrutícolas está sendo realizada de maneira correta (uso de SUMAVEG ou água sanitária)?<asp:TextBox
                                                ID="txt10_13" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_13_Sim" runat="server" GroupName="grupo10_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_13_Nao" runat="server" GroupName="grupo10_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_13_NA" runat="server" GroupName="grupo10_13" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto10_13" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile10_13" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto10_13" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 10.1.13--%>

                                        <tr>
                                            <td align="center">10.14</td>
                                            <td>Os equipamentos de produtos de Limpeza estão íntegros e em bom estado de conservação (Bombas Pressurizadoras, Mangueiras, etc.)
                                    <asp:TextBox
                                        ID="txt10_14" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_14_Sim" runat="server" GroupName="grupo10_14" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_14_Nao" runat="server" GroupName="grupo10_14" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd10_14_NA" runat="server" GroupName="grupo10_14" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto10_14" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile10_14" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto10_14" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 10.1.14--%>

                                        <thead>
                                            <tr>
                                                <td></td>
                                                <td align="right">
                                                    <dx:ASPxButton ID="btnGrupo20" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>

                        <asp:Panel ID="panTitle21" runat="server" CssClass="pnl_Azul">
                            <div style="float: left;">11 - HSA - Grupo 4 - Padaria e Confeitaria - (13 perguntas, 1 à 13) </div>
                            <div style="float: right;">
                                <asp:Label ID="lblTitle21" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div style="clear: both"></div>
                        </asp:Panel>
                        <asp:Panel ID="panDados21" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>
                                            <th align="center" scope="col" width="25px">PPO</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Padaria e Confeitaria </b></h2>
                                                    <b>(Laboratórios, Sala de Resfriamento, Área de Atendimento, Área de Venda, Câmara)</b>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">11.1</td>
                                            <td>O ambiente está limpo, organizado, sem acúmulos de água no piso ou lixo espalhado pelo setor? 
                                    <asp:TextBox
                                        ID="txt11_1" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_1_Sim" runat="server" GroupName="grupo11_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_1_Nao" runat="server" GroupName="grupo11_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_1_NA" runat="server" GroupName="grupo11_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.1.1--%>

                                        <tr>
                                            <td align="center">11.2</td>
                                            <td>A planilha de higienização do setor está sendo preenchida corretamente e na frequência adequada?<asp:TextBox
                                                ID="txt11_2" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_2_Sim" runat="server" GroupName="grupo11_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_2_Nao" runat="server" GroupName="grupo11_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_2_NA" runat="server" GroupName="grupo11_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.1.2--%>

                                        <tr>
                                            <td align="center">11.3</td>
                                            <td>As papeleiras, saboneteiras e lixeiras estão limpas, íntegras e corretamente abastecidas?<asp:TextBox
                                                ID="txt11_3" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_3_Sim" runat="server" GroupName="grupo11_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_3_Nao" runat="server" GroupName="grupo11_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_3_NA" runat="server" GroupName="grupo11_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.1.3--%>

                                        <tr>
                                            <td align="center">11.4</td>
                                            <td>O local de manipulação (mesas) e os utensílios utilizados estão limpos e íntegros? Os utensílios estão armazenados em local adequado?<asp:TextBox
                                                ID="txt11_4" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_4_Sim" runat="server" GroupName="grupo11_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_4_Nao" runat="server" GroupName="grupo11_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_4_NA" runat="server" GroupName="grupo11_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.1.4--%>

                                        <tr>
                                            <td align="center">11.5</td>
                                            <td>Os equipamentos (masseiras, modeladora, divisora, cilindro, estufa, fornos, dosadora, moinho, fatiadora, batedeiras) estão sendo bem higienizados, com frequência adequada e de forma a retirar completamente os resíduos (sem sujidades antigas)?  O moedor, quando não está em uso, está com as aberturas protegidas?<asp:TextBox
                                                ID="txt11_5" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_5_Sim" runat="server" GroupName="grupo11_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_5_Nao" runat="server" GroupName="grupo11_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_5_NA" runat="server" GroupName="grupo11_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.1.5--%>

                                        <tr>
                                            <td align="center">11.6</td>
                                            <td>O local de armazenamento de embalagens é mantido limpo, com as portas fechadas, sem embalagens sujas ou objetos estranhos?<asp:TextBox
                                                ID="txt11_6" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_6_Sim" runat="server" GroupName="grupo11_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_6_Nao" runat="server" GroupName="grupo11_6" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_6_NA" runat="server" GroupName="grupo11_6" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_6" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_6" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_6" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.1.6--%>

                                        <tr>
                                            <td align="center">11.7</td>
                                            <td>Não há presença de caixas de papelão ou fardos de embalagens sobre as bancadas de manipulação ou em contato direto com os alimentos?<asp:TextBox
                                                ID="txt11_7" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_7_Sim" runat="server" GroupName="grupo11_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_7_Nao" runat="server" GroupName="grupo11_7" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_7_NA" runat="server" GroupName="grupo11_7" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_7" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_7" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_7" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.1.7--%>

                                        <tr>
                                            <td align="center">11.8</td>
                                            <td>O transporte e o armazenamento dos alimentos é realizado de forma adequada (carrinhos ou cubas exclusivos do setor; armazenamento em caixas/ carrinhos furgões limpos)?
                                    <asp:TextBox
                                        ID="txt11_8" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_8_Sim" runat="server" GroupName="grupo11_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_8_Nao" runat="server" GroupName="grupo11_8" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_8_NA" runat="server" GroupName="grupo11_8" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_8" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_8" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_8" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.1.8--%>

                                        <tr>
                                            <td align="center">11.9</td>
                                            <td>A troca de preço está sendo feita de maneira adequada?<asp:TextBox
                                                ID="txt11_9" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_9_Sim" runat="server" GroupName="grupo11_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_9_Nao" runat="server" GroupName="grupo11_9" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_9_NA" runat="server" GroupName="grupo11_9" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_9" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_9" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_9" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.1.9--%>

                                        <tr>
                                            <td align="center">11.10</td>
                                            <td>A produção armazenada está de acordo com a venda diária (a produção estocada na câmara foi manipulada no dia ou no máximo no dia anterior)?
                                    <asp:TextBox
                                        ID="txt11_10" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_10_Sim" runat="server" GroupName="grupo11_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_10_Nao" runat="server" GroupName="grupo11_10" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_10_NA" runat="server" GroupName="grupo11_10" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_10" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_10" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_10" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.1.10--%>

                                        <tr>
                                            <td align="center">11.11</td>
                                            <td>O tempo mininimo de exposição para produtos perecíveis que estão fora da camara (maximo 1 hora) esta sendo respeitado ?
                                    <asp:TextBox
                                        ID="txt11_11" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_11_Sim" runat="server" GroupName="grupo11_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_11_Nao" runat="server" GroupName="grupo11_11" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_11_NA" runat="server" GroupName="grupo11_11" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_11" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_11" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_11" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.1.11--%>

                                        <tr>
                                            <td align="center">11.12</td>
                                            <td>Os pães separados para a produção de farinha de rosca estão identificados para este fim e são selecionados (somente linha do pão francês)? O processo completo (torrar, moer, embalar e identificar individualmente) está ocorrendo em no máximo dois dias?<asp:TextBox
                                                ID="txt11_12" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_12_Sim" runat="server" GroupName="grupo11_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_12_Nao" runat="server" GroupName="grupo11_12" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_12_NA" runat="server" GroupName="grupo11_12" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_12" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_12" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_12" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.1.12--%>

                                        <tr>
                                            <td align="center">11.13</td>
                                            <td>Os equipamentos de produtos de Limpeza estão íntegros e em bom estado de conservação (Bombas Pressurizadoras, Mangueiras, etc.)<asp:TextBox
                                                ID="txt11_13" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_13_Sim" runat="server" GroupName="grupo11_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_13_Nao" runat="server" GroupName="grupo11_13" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd11_13_NA" runat="server" GroupName="grupo11_13" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto11_13" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile11_13" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto11_13" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 11.1.13--%>

                                        <thead>
                                            <tr>
                                                <td></td>
                                                <td align="right">
                                                    <dx:ASPxButton ID="btnGrupo21" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>

                        <asp:Panel ID="panTitle22" runat="server" CssClass="pnl_Azul">
                            <div style="float: left;">12 - HSA - Grupo 5 - Hortifruti - (5 perguntas, 1 à 5) </div>
                            <div style="float: right;">
                                <asp:Label ID="lblTitle22" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div style="clear: both"></div>
                        </asp:Panel>
                        <asp:Panel ID="panDados22" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>
                                            <th align="center" scope="col" width="25px">PPO</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Hortifruti </b></h2>
                                                    <b>(Laboratório, Depósito, Área de Venda, Câmara)</b>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">12.1</td>
                                            <td>O ambiente está limpo, organizado, sem acúmulos de água no piso ou lixo espalhado pelo setor? 
                                    <asp:TextBox
                                        ID="txt12_1" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_1_Sim" runat="server" GroupName="grupo12_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_1_Nao" runat="server" GroupName="grupo12_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_1_NA" runat="server" GroupName="grupo12_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto12_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile12_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto12_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 12.1.1--%>

                                        <tr>
                                            <td align="center">12.2</td>
                                            <td>A planilha de higienização do setor está sendo preenchida corretamente e na frequência adequada?<asp:TextBox
                                                ID="txt12_2" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_2_Sim" runat="server" GroupName="grupo12_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_2_Nao" runat="server" GroupName="grupo12_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_2_NA" runat="server" GroupName="grupo12_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto12_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile12_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto12_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 12.1.2--%>

                                        <tr>
                                            <td align="center">12.3</td>
                                            <td>O local de manipulação (mesas) e os utensílios utilizados estão limpos e íntegros? Os utensílios estão armazenados em local adequado?<asp:TextBox
                                                ID="txt12_3" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_3_Sim" runat="server" GroupName="grupo12_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_3_Nao" runat="server" GroupName="grupo12_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_3_NA" runat="server" GroupName="grupo12_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto12_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile12_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto12_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 12.1.3--%>

                                        <tr>
                                            <td align="center">12.4</td>
                                            <td>Os produtos hortifrutigranjeiros que necessitam de identificação de origem padronizada estão devidamente identificados, tanto no estoque como na área de venda? (Exceto Joinville)<asp:TextBox
                                                ID="txt12_4" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_4_Sim" runat="server" GroupName="grupo12_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_4_Nao" runat="server" GroupName="grupo12_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_4_NA" runat="server" GroupName="grupo12_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto12_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile12_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto12_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 12.1.4--%>

                                        <tr>
                                            <td align="center">12.5</td>
                                            <td>Os equipamentos de produtos de Limpeza estão íntegros e em bom estado de conservação (Bombas Pressurizadoras, Mangueiras, etc.)<asp:TextBox
                                                ID="txt12_5" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_5_Sim" runat="server" GroupName="grupo12_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_5_Nao" runat="server" GroupName="grupo12_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd12_5_NA" runat="server" GroupName="grupo12_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto12_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile12_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto12_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 12.1.5--%>

                                        <thead>
                                            <tr>
                                                <td></td>
                                                <td align="right">
                                                    <dx:ASPxButton ID="btnGrupo22" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>

                        <asp:Panel ID="panTitle23" runat="server" CssClass="pnl_Azul">
                            <div style="float: left;">13 - HSA - Grupo 6 - Depósito / Recebimento - (1 perguntas, 1 à 1) </div>
                            <div style="float: right;">
                                <asp:Label ID="lblTitle23" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div style="clear: both"></div>
                        </asp:Panel>
                        <asp:Panel ID="panDados23" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>
                                            <th align="center" scope="col" width="25px">PPO</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Depósito / Recebimento </b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">13.1</td>
                                            <td>Está sendo realizado o controle de temperatura dos produtos perecíveis recebidos (todas as cargas)? A planilha está corretamente preenchida?
                                    <asp:TextBox
                                        ID="txt13_1" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_1_Sim" runat="server" GroupName="grupo13_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_1_Nao" runat="server" GroupName="grupo13_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd13_1_NA" runat="server" GroupName="grupo13_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto13_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile13_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto13_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 13.1.1--%>

                                        <thead>
                                            <tr>
                                                <td></td>
                                                <td align="right">
                                                    <dx:ASPxButton ID="btnGrupo23" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>

                        <asp:Panel ID="panTitle24" runat="server" CssClass="pnl_Azul">
                            <div style="float: left;">14 - HSA - Grupo 7 - Banheiros - (3 perguntas, 1 à 3) </div>
                            <div style="float: right;">
                                <asp:Label ID="lblTitle24" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div style="clear: both"></div>
                        </asp:Panel>
                        <asp:Panel ID="panDados24" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>
                                            <th align="center" scope="col" width="25px">PPO</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Banheiros </b></h2>
                                                    <b>(Perecíveis, Vestiários e Clientes)</b>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">14.1</td>
                                            <td>As instalações sanitárias estão limpas, íntegras, em bom estado de conservação e sem acúmulo de lixo? (Bolor, água estagnada, vetores, presença de fiação exposta, fechamento das portas adequado, vasos sanitários com tampa e assento)
                                    <asp:TextBox
                                        ID="txt14_1" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_1_Sim" runat="server" GroupName="grupo14_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_1_Nao" runat="server" GroupName="grupo14_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_1_NA" runat="server" GroupName="grupo14_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto14_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile14_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto14_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 14.1.1--%>

                                        <tr>
                                            <td align="center">14.2</td>
                                            <td>As papeleiras e saboneteiras estão abastecidas corretamente e limpas? As lixeiras são dotadas de tampa e acionadas sem contato manual? (para banheiros de perecíveis uso obrigatório do sabonete antisséptico)<asp:TextBox
                                                ID="txt14_2" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_2_Sim" runat="server" GroupName="grupo14_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_2_Nao" runat="server" GroupName="grupo14_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_2_NA" runat="server" GroupName="grupo14_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto14_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile14_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto14_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 14.1.2--%>

                                        <tr>
                                            <td align="center">14.3</td>
                                            <td>Nos vestiários os armários individuais dos funcionários estão em boas condições de uso? (sem ferrugem, limpos e íntegros)<asp:TextBox
                                                ID="txt14_3" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_3_Sim" runat="server" GroupName="grupo14_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_3_Nao" runat="server" GroupName="grupo14_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd14_3_NA" runat="server" GroupName="grupo14_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto14_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile14_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto14_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 14.1.3--%>

                                        <thead>
                                            <tr>
                                                <td></td>
                                                <td align="right">
                                                    <dx:ASPxButton ID="btnGrupo24" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>

                        <asp:Panel ID="panTitle25" runat="server" CssClass="pnl_Azul">
                            <div style="float: left;">15 - HSA - Grupo 8 - Corredor de Perecíveis - (5 perguntas, 1 à 5) </div>
                            <div style="float: right;">
                                <asp:Label ID="lblTitle25" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div style="clear: both"></div>
                        </asp:Panel>
                        <asp:Panel ID="panDados25" runat="server" Height="0" Style="border: solid 1px #c0c0c0; padding: 5px;">
                            <p>
                                <table id="gradient-style" summary="Meeting Results">
                                    <thead>
                                        <tr>
                                            <th align="center" scope="col">Nº</th>
                                            <th scope="col">Pergunta</th>
                                            <th align="center" scope="col" width="25px">Sim</th>
                                            <th align="center" scope="col" width="25px">Não</th>
                                            <th align="center" scope="col" width="25px">N.A.</th>
                                            <th align="center" scope="col" width="25px" colspan="2">Foto</th>
                                            <th align="center" scope="col" width="25px">PPO</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <thead>
                                            <tr>
                                                <td colspan="8" align="center">
                                                    <h2><b>Corredor de Perecíveis / Depósito de Embalagens e Sala de Higiene de Caixas </b></h2>
                                                </td>
                                            </tr>
                                        </thead>

                                        <tr>
                                            <td align="center">15.1</td>
                                            <td>As edificações estão limpas e íntegras? Os ralos, luminárias e portas de acesso são mantidos limpos e em bom estado de conservação? (bolor, água estagnada, mau cheiro, acesso a pragas e vetores, infiltrações ou danos estruturais)
                                    <asp:TextBox
                                        ID="txt15_1" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_1_Sim" runat="server" GroupName="grupo15_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_1_Nao" runat="server" GroupName="grupo15_1" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_1_NA" runat="server" GroupName="grupo15_1" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto15_1" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile15_1" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto15_1" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 15.1.1--%>

                                        <tr>
                                            <td align="center">15.2</td>
                                            <td>Os corredores de perecíveis e áreas de trânsito estão livres para circulação? (sem pallets, carrinhos e outros objetos)<asp:TextBox
                                                ID="txt15_2" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_2_Sim" runat="server" GroupName="grupo15_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_2_Nao" runat="server" GroupName="grupo15_2" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_2_NA" runat="server" GroupName="grupo15_2" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto15_2" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile15_2" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto15_2" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 15.1.2--%>

                                        <tr>
                                            <td align="center">15.3</td>
                                            <td>O tanque da sala de higienização de caixas está limpo? Os produtos, equipamentos e utensílios de limpeza são adequados e estão em bom estado de conservação? A sala de higiene de caixas está sendo utilizada para o fim que se destina?<asp:TextBox
                                                ID="txt15_3" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_3_Sim" runat="server" GroupName="grupo15_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_3_Nao" runat="server" GroupName="grupo15_3" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_3_NA" runat="server" GroupName="grupo15_3" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto15_3" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile15_3" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto15_3" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 15.1.3--%>

                                        <tr>
                                            <td align="center">15.4</td>
                                            <td>As estantes e os pallets do depósito de embalagens estão limpos e íntegros? O mesmo está organizado, sem fardos abertos e embalagens soltas pelo setor?
                                    <asp:TextBox
                                        ID="txt15_4" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_4_Sim" runat="server" GroupName="grupo15_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_4_Nao" runat="server" GroupName="grupo15_4" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_4_NA" runat="server" GroupName="grupo15_4" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto15_4" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile15_4" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto15_4" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 15.1.4--%>

                                        <tr>
                                            <td align="center">15.5</td>
                                            <td>Os equipamentos de produtos de Limpeza (sala de Higienização estão integros e em bom estado de conservação (Bombas Pressurizadoras, Mangueiras, etc)<asp:TextBox
                                                ID="txt15_5" runat="server" Width="500" TextMode="MultiLine" Height="50"></asp:TextBox></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_5_Sim" runat="server" GroupName="grupo15_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_5_Nao" runat="server" GroupName="grupo15_5" /></td>
                                            <td align="center">
                                                <asp:RadioButton ID="rnd15_5_NA" runat="server" GroupName="grupo15_5" /></td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="imgFoto15_5" runat="server" ImageUrl="~/image/camera-icon_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                    <asp:FileUpload ID="upFile15_5" runat="server" />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <div class="fileEscondido">
                                                    <asp:ImageButton ID="btnSalvarFoto15_5" runat="server" ImageUrl="~/image/camera-icon-save_32.png" ToolTip="Clique aqui para salvar uma foto." />
                                                </div>
                                            </td>
                                            <td align="center">
                                                <a tabindex="0" class="btn btn-sm btn-danger" role="button" data-toggle="popover" data-trigger="focus" data-placement="top" title="REFERÊNCIA NORMATIVA" data-content="...">PPO</a>
                                            </td>
                                        </tr>
                                        <%--PERGUNTA 15.1.5--%>

                                        <thead>
                                            <tr>
                                                <td></td>
                                                <td align="right">
                                                    <dx:ASPxButton ID="btnGrupo25" runat="server" Text="Enviar" AutoPostBack="True">
                                                        <ClientSideEvents Click="function(s, e) {Callback.PerformCallback(); LoadingPanel.Show(); LoadingPanel.SetText('Aguarde. Enviando...');}" />
                                                    </dx:ASPxButton>
                                                </td>
                                            </tr>
                                        </thead>

                                    </tbody>
                                </table>
                            </p>
                        </asp:Panel>

                    </div>
                </div>
            </div>

            <asp:CollapsiblePanelExtender
                ID="CollapsiblePanelExtender1"
                runat="server"
                CollapseControlID="panTitle1"
                Collapsed="true"
                ExpandControlID="panTitle1"
                TextLabelID="lblTitle1"
                CollapsedText="Mostrar"
                ExpandedText="Ocultar"
                ExpandDirection="Vertical"
                TargetControlID="panDados1"
                ScrollContents="false">
            </asp:CollapsiblePanelExtender>
            <asp:CollapsiblePanelExtender
                ID="CollapsiblePanelExtender2"
                runat="server"
                CollapseControlID="panTitle2"
                Collapsed="true"
                ExpandControlID="panTitle2"
                TextLabelID="lblTitle2"
                CollapsedText="Mostrar"
                ExpandedText="Ocultar"
                ExpandDirection="Vertical"
                TargetControlID="panDados2"
                ScrollContents="false">
            </asp:CollapsiblePanelExtender>
            <asp:CollapsiblePanelExtender
                ID="CollapsiblePanelExtender3"
                runat="server"
                CollapseControlID="panTitle3"
                Collapsed="true"
                ExpandControlID="panTitle3"
                TextLabelID="lblTitle3"
                CollapsedText="Mostrar"
                ExpandedText="Ocultar"
                ExpandDirection="Vertical"
                TargetControlID="panDados3"
                ScrollContents="false">
            </asp:CollapsiblePanelExtender>
            <asp:CollapsiblePanelExtender
                ID="CollapsiblePanelExtender4"
                runat="server"
                CollapseControlID="panTitle4"
                Collapsed="true"
                ExpandControlID="panTitle4"
                TextLabelID="lblTitle4"
                CollapsedText="Mostrar"
                ExpandedText="Ocultar"
                ExpandDirection="Vertical"
                TargetControlID="panDados4"
                ScrollContents="false">
            </asp:CollapsiblePanelExtender>
            <asp:CollapsiblePanelExtender
                ID="CollapsiblePanelExtender5"
                runat="server"
                CollapseControlID="panTitle5"
                Collapsed="true"
                ExpandControlID="panTitle5"
                TextLabelID="lblTitle5"
                CollapsedText="Mostrar"
                ExpandedText="Ocultar"
                ExpandDirection="Vertical"
                TargetControlID="panDados5"
                ScrollContents="false">
            </asp:CollapsiblePanelExtender>
            <asp:CollapsiblePanelExtender
                ID="CollapsiblePanelExtender6"
                runat="server"
                CollapseControlID="panTitle6"
                Collapsed="true"
                ExpandControlID="panTitle6"
                TextLabelID="lblTitle6"
                CollapsedText="Mostrar"
                ExpandedText="Ocultar"
                ExpandDirection="Vertical"
                TargetControlID="panDados6"
                ScrollContents="false">
            </asp:CollapsiblePanelExtender>
            <asp:CollapsiblePanelExtender
                ID="CollapsiblePanelExtender7"
                runat="server"
                CollapseControlID="panTitle7"
                Collapsed="true"
                ExpandControlID="panTitle7"
                TextLabelID="lblTitle7"
                CollapsedText="Mostrar"
                ExpandedText="Ocultar"
                ExpandDirection="Vertical"
                TargetControlID="panDados7"
                ScrollContents="false">
            </asp:CollapsiblePanelExtender>
            <asp:CollapsiblePanelExtender
                ID="CollapsiblePanelExtender8"
                runat="server"
                CollapseControlID="panTitle8"
                Collapsed="true"
                ExpandControlID="panTitle8"
                TextLabelID="lblTitle8"
                CollapsedText="Mostrar"
                ExpandedText="Ocultar"
                ExpandDirection="Vertical"
                TargetControlID="panDados8"
                ScrollContents="false">
            </asp:CollapsiblePanelExtender>
            <asp:CollapsiblePanelExtender
                ID="CollapsiblePanelExtender9"
                runat="server"
                CollapseControlID="panTitle9"
                Collapsed="true"
                ExpandControlID="panTitle9"
                TextLabelID="lblTitle9"
                CollapsedText="Mostrar"
                ExpandedText="Ocultar"
                ExpandDirection="Vertical"
                TargetControlID="panDados9"
                ScrollContents="false">
            </asp:CollapsiblePanelExtender>
            <asp:CollapsiblePanelExtender
                ID="CollapsiblePanelExtender10"
                runat="server"
                CollapseControlID="panTitle10"
                Collapsed="true"
                ExpandControlID="panTitle10"
                TextLabelID="lblTitle10"
                CollapsedText="Mostrar"
                ExpandedText="Ocultar"
                ExpandDirection="Vertical"
                TargetControlID="panDados10"
                ScrollContents="false">
            </asp:CollapsiblePanelExtender>
            <asp:CollapsiblePanelExtender
                ID="CollapsiblePanelExtender11"
                runat="server"
                CollapseControlID="panTitle11"
                Collapsed="true"
                ExpandControlID="panTitle11"
                TextLabelID="lblTitle11"
                CollapsedText="Mostrar"
                ExpandedText="Ocultar"
                ExpandDirection="Vertical"
                TargetControlID="panDados11"
                ScrollContents="false">
            </asp:CollapsiblePanelExtender>
            <asp:CollapsiblePanelExtender
                ID="CollapsiblePanelExtender12"
                runat="server"
                CollapseControlID="panTitle12"
                Collapsed="true"
                ExpandControlID="panTitle12"
                TextLabelID="lblTitle12"
                CollapsedText="Mostrar"
                ExpandedText="Ocultar"
                ExpandDirection="Vertical"
                TargetControlID="panDados12"
                ScrollContents="false">
            </asp:CollapsiblePanelExtender>
            <asp:CollapsiblePanelExtender
                ID="CollapsiblePanelExtender13"
                runat="server"
                CollapseControlID="panTitle13"
                Collapsed="true"
                ExpandControlID="panTitle13"
                TextLabelID="lblTitle13"
                CollapsedText="Mostrar"
                ExpandedText="Ocultar"
                ExpandDirection="Vertical"
                TargetControlID="panDados13"
                ScrollContents="false">
            </asp:CollapsiblePanelExtender>
            <asp:CollapsiblePanelExtender
                ID="CollapsiblePanelExtender14"
                runat="server"
                CollapseControlID="panTitle14"
                Collapsed="true"
                ExpandControlID="panTitle14"
                TextLabelID="lblTitle14"
                CollapsedText="Mostrar"
                ExpandedText="Ocultar"
                ExpandDirection="Vertical"
                TargetControlID="panDados14"
                ScrollContents="false">
            </asp:CollapsiblePanelExtender>
            <asp:CollapsiblePanelExtender
                ID="CollapsiblePanelExtender15"
                runat="server"
                CollapseControlID="panTitle15"
                Collapsed="true"
                ExpandControlID="panTitle15"
                TextLabelID="lblTitle15"
                CollapsedText="Mostrar"
                ExpandedText="Ocultar"
                ExpandDirection="Vertical"
                TargetControlID="panDados15"
                ScrollContents="false">
            </asp:CollapsiblePanelExtender>
            <asp:CollapsiblePanelExtender
                ID="CollapsiblePanelExtender16"
                runat="server"
                CollapseControlID="panTitle16"
                Collapsed="true"
                ExpandControlID="panTitle16"
                TextLabelID="lblTitle16"
                CollapsedText="Mostrar"
                ExpandedText="Ocultar"
                ExpandDirection="Vertical"
                TargetControlID="panDados16"
                ScrollContents="false">
            </asp:CollapsiblePanelExtender>
            <asp:CollapsiblePanelExtender
                ID="CollapsiblePanelExtender17"
                runat="server"
                CollapseControlID="panTitle17"
                Collapsed="true"
                ExpandControlID="panTitle17"
                TextLabelID="lblTitle17"
                CollapsedText="Mostrar"
                ExpandedText="Ocultar"
                ExpandDirection="Vertical"
                TargetControlID="panDados17"
                ScrollContents="false">
            </asp:CollapsiblePanelExtender>
            <asp:CollapsiblePanelExtender
                ID="CollapsiblePanelExtender18"
                runat="server"
                CollapseControlID="panTitle18"
                Collapsed="true"
                ExpandControlID="panTitle18"
                TextLabelID="lblTitle18"
                CollapsedText="Mostrar"
                ExpandedText="Ocultar"
                ExpandDirection="Vertical"
                TargetControlID="panDados18"
                ScrollContents="false">
            </asp:CollapsiblePanelExtender>
            <asp:CollapsiblePanelExtender
                ID="CollapsiblePanelExtender19"
                runat="server"
                CollapseControlID="panTitle19"
                Collapsed="true"
                ExpandControlID="panTitle19"
                TextLabelID="lblTitle19"
                CollapsedText="Mostrar"
                ExpandedText="Ocultar"
                ExpandDirection="Vertical"
                TargetControlID="panDados19"
                ScrollContents="false">
            </asp:CollapsiblePanelExtender>
            <asp:CollapsiblePanelExtender
                ID="CollapsiblePanelExtender20"
                runat="server"
                CollapseControlID="panTitle20"
                Collapsed="true"
                ExpandControlID="panTitle20"
                TextLabelID="lblTitle20"
                CollapsedText="Mostrar"
                ExpandedText="Ocultar"
                ExpandDirection="Vertical"
                TargetControlID="panDados20"
                ScrollContents="false">
            </asp:CollapsiblePanelExtender>
            <asp:CollapsiblePanelExtender
                ID="CollapsiblePanelExtender21"
                runat="server"
                CollapseControlID="panTitle21"
                Collapsed="true"
                ExpandControlID="panTitle21"
                TextLabelID="lblTitle21"
                CollapsedText="Mostrar"
                ExpandedText="Ocultar"
                ExpandDirection="Vertical"
                TargetControlID="panDados21"
                ScrollContents="false">
            </asp:CollapsiblePanelExtender>
            <asp:CollapsiblePanelExtender
                ID="CollapsiblePanelExtender22"
                runat="server"
                CollapseControlID="panTitle22"
                Collapsed="true"
                ExpandControlID="panTitle22"
                TextLabelID="lblTitle22"
                CollapsedText="Mostrar"
                ExpandedText="Ocultar"
                ExpandDirection="Vertical"
                TargetControlID="panDados22"
                ScrollContents="false">
            </asp:CollapsiblePanelExtender>
            <asp:CollapsiblePanelExtender
                ID="CollapsiblePanelExtender23"
                runat="server"
                CollapseControlID="panTitle23"
                Collapsed="true"
                ExpandControlID="panTitle23"
                TextLabelID="lblTitle23"
                CollapsedText="Mostrar"
                ExpandedText="Ocultar"
                ExpandDirection="Vertical"
                TargetControlID="panDados23"
                ScrollContents="false">
            </asp:CollapsiblePanelExtender>
            <asp:CollapsiblePanelExtender
                ID="CollapsiblePanelExtender24"
                runat="server"
                CollapseControlID="panTitle24"
                Collapsed="true"
                ExpandControlID="panTitle24"
                TextLabelID="lblTitle24"
                CollapsedText="Mostrar"
                ExpandedText="Ocultar"
                ExpandDirection="Vertical"
                TargetControlID="panDados24"
                ScrollContents="false">
            </asp:CollapsiblePanelExtender>
            <asp:CollapsiblePanelExtender
                ID="CollapsiblePanelExtender25"
                runat="server"
                CollapseControlID="panTitle25"
                Collapsed="true"
                ExpandControlID="panTitle25"
                TextLabelID="lblTitle25"
                CollapsedText="Mostrar"
                ExpandedText="Ocultar"
                ExpandDirection="Vertical"
                TargetControlID="panDados25"
                ScrollContents="false">
            </asp:CollapsiblePanelExtender>

        </ContentTemplate>
    </asp:UpdatePanel>

    <script>
        function pageLoad(sender, args) {
            $(document).ready(function () {
                $('[data-toggle="popover"]').popover();
            });
        }
        MainContent_txtData.max = new Date().toISOString().split("T")[0];
    </script>

</asp:Content>


